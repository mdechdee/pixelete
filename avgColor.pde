color[][] avg;
boolean[][] map;  
boolean picOn = false;
PGraphics grid;
PGraphics avgImg;

void avg_setup(){
  grid = createGraphics(pg.width, pg.height);
  map = new boolean[(pg.height/size)+1][(pg.width/size)+1];
  calAvgImg();
  gridDraw();
}

void gridDraw()
{
  grid.beginDraw();
  grid.stroke(0);
  grid.strokeWeight(0);
  grid.image(avgImg, 0, 0, pg.width, pg.height);
  //grid.stroke(#ffffff);
  for(int i=0 ;i<pg.width; i+= size)
    grid.line(i, 0, i,pg.height);
  for(int i=0 ;i<pg.height; i+= size)
    grid.line(0, i, pg.width, i);
  grid.endDraw();
}

void calAvgImg(){
  avgImg = createGraphics(pg.width, pg.height);
  avg = new color[(pg.height/size)+1][(pg.width/size)+1];
  avgImg.beginDraw();
  avgImg.image(img, 0, 0, pg.width, pg.height);
  avgImg.loadPixels();
  avgImg.rectMode(CORNER);
  for(int i=0;i<pg.height;i+=size)
  {
    for(int m=0;m<pg.width;m+=size){
      avg[int(i/size)][int(m/size)] = calAvg(i,m);
      avgImg.fill(avg[int(i/size)][int(m/size)]);
      avgImg.rect(m,i,size,size);
    }
  }
  println("Done Avg!");
  avgImg.endDraw();
}

color calAvg(int y, int x){
  int r = 0;
  int g = 0;
  int b = 0;
  color avg;
  for(int i = y; i<y+size ;i++){
    for(int m = x; m<x+size ;m++)
    {
      r += red(avgImg.pixels[i*(pg.width)+m]);
      g += green(avgImg.pixels[i*(pg.width)+m]);
      b += blue(avgImg.pixels[i*(pg.width)+m]);
    }
  }
  avg = color(r/(size*size),g/(size*size),b/(size*size));
  return avg;
  
}
