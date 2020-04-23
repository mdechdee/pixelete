import java.util.Stack;
import java.util.Collections;
import java.util.Arrays;
import java.util.List;
PGraphics pg;
PGraphics prev;

int[][] walk_path = {{0, -1}, {0, 1}, {-1, 0}, {1, 0}};
int[][] udlr = {{0, -1}, {0, 1}, {-1, 0}, {1, 0}};

int size = 10;
int framerate = 2;
int color_threshold = 10;
float size_scale = 0; 
int agent_count = 0;
enum shape{ELI, REC, LIN};
shape cur_shape = shape.ELI;

boolean isWalkable(pos last, int[] walk_dir){
  pos at = new pos(last.y+walk_dir[0],last.x+walk_dir[1]);
  if(at.y > pg.height/size || at.x > pg.width/size || at.x<0 || at.y<0)
    return false;
  if(map[at.y][at.x] == true)
    return false;
  if(colorDist(avgImg[last.y][last.x],avgImg[at.y][at.x])>color_threshold)
    return false;
  for(int i=0;i<udlr.length;i++){
    if(walk_dir[0] == udlr[i][0]*-1 && walk_dir[1] == udlr[i][1]*-1)
      continue;
    if(at.y+udlr[i][0] > pg.height/size || at.y+udlr[i][0] < 0 || 
      at.x+udlr[i][1] > pg.width/size || at.x+udlr[i][1] < 0)
      continue;
    if(map[at.y+udlr[i][0]][at.x+udlr[i][1]] == true)
      return false;
  }
  return true;
}

void setup(){
  frameRate(framerate);
  //size(620,875);
  //pg = createGraphics(2480,3500);
  size(875,620);
  pg = createGraphics(3500,2480);
  prev = createGraphics(3500,2480);
  pg.rectMode(CORNER);
  pg.noStroke();
  
  grid_setup();
  file_setup();
  agent_setup();
}

void draw(){
  background(0);
  List<agent> toRemove = new ArrayList();
  if(picOn) image(grid, 0, 0, width, height);
  for(agent a : agents){
    a.update();
    if(a.hist.empty()){
      a.display();
      toRemove.add(a);
    }
  }
  agents.removeAll(toRemove);
  image(pg,0,0,width, height);
}

void mouseClicked(){

  agent a = new agent
  (
    avgImg[mouseY*(pg.height/height)/size][mouseX*(pg.width/width)/size], 
    new pos(mouseY*(pg.height/height)/size, mouseX*(pg.width/width)/size),
    agent_count
  );
  agents.add(a);
  agent_count++;
  //prev.beginDraw();
  //prev.clear();
  //prev.image(pg,0,0,pg.width,pg.height);
  //prev.endDraw();
}

void keyPressed(){
  if(key == 's' || key == 'S'){
    file_num += 1;
    output.print(file_num);
    pg.save("sketch"+file_num+".tiff");
    output.close();
  }
  if( key == 'c' || key == 'C'){
    pg.beginDraw();
    pg.clear();
    pg.endDraw();
    map = new boolean[(pg.height/size)+1][(pg.width/size)+1];
  }
  if( key == 'g' || key == 'G'){
    picOn = !picOn;
  }
  if( key == 'r' || key == 'R'){
    size = color_threshold;
    map = new boolean[(pg.height/size)+1][(pg.width/size)+1];
    grid_setup();
  }
  if( key == 'x' || key == 'X'){
    switch(cur_shape){
      case REC: cur_shape = shape.ELI; break;
      case ELI: cur_shape = shape.LIN; break;
      case LIN: cur_shape = shape.REC; break;
      default: cur_shape = shape.ELI;
    }
    println("Current shape:", cur_shape);
  }
  if( key == 'z' || key == 'Z'){
    pg.beginDraw();
    pg.clear();
    pg.image(prev,0,0,pg.width,pg.height);
    pg.endDraw();
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if(e<0)
    color_threshold += 1;
  else
    color_threshold -= 1;
  println("Threshold: ",color_threshold);
}
