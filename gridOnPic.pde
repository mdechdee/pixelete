PImage img;
color[][] avgImg;
boolean[][] map;  
boolean picOn = false;
PGraphics grid;
PGraphics tmp;

void grid_setup(){
  grid = createGraphics(pg.width, pg.height);
  map = new boolean[(pg.height/size)+1][(pg.width/size)+1];
  img = loadImage("kaist.jpg");
  calAvgImg();
  gridDraw();
}

void gridDraw()
{
  grid.beginDraw();
  grid.stroke(0);
  grid.strokeWeight(1);
  grid.image(tmp, 0, 0, pg.width, pg.height);
  //grid.stroke(#ffffff);
  for(int i=0 ;i<pg.width; i+= size)
    grid.line(i, 0, i,pg.height);
  for(int i=0 ;i<pg.height; i+= size)
    grid.line(0, i, pg.width, i);
  grid.endDraw();
}

void calAvgImg(){
  tmp = createGraphics(pg.width, pg.height);
  avgImg = new color[(pg.height/size)+1][(pg.width/size)+1];
  tmp.beginDraw();
  tmp.image(img, 0, 0, pg.width, pg.height);
  tmp.loadPixels();
  tmp.rectMode(CORNER);
  for(int i=0;i<pg.height;i+=size)
  {
    for(int m=0;m<pg.width;m+=size){
      avgImg[int(i/size)][int(m/size)] = calAvg(i,m);
      tmp.fill(avgImg[int(i/size)][int(m/size)]);
      tmp.rect(m,i,size,size);
    }
  }
  println("Done Avg!");
  tmp.endDraw();
}

color calAvg(int y, int x){
  int r = 0;
  int g = 0;
  int b = 0;
  color avg;
  for(int i = y; i<y+size ;i++){
    for(int m = x; m<x+size ;m++)
    {
      r += red(tmp.pixels[i*(pg.width)+m]);
      g += green(tmp.pixels[i*(pg.width)+m]);
      b += blue(tmp.pixels[i*(pg.width)+m]);
    }
  }
  avg = color(r/(size*size),g/(size*size),b/(size*size));
  return avg;
  
}
