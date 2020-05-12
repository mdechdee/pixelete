import jto.colorscheme.*; //<>// //<>// //<>//
import peasy.*;

PeasyCam cam;
ColorScheme cs;
ArrayList<Color> colors;

PShape rec;
static int FRAMERATE = 60;
int W,H;
int PAD_W = 0;
int PAD_H = 0;
int MARG = 100;
int imageCount;

void setup(){
  frameRate(FRAMERATE);
  //size(620,875);
  //pg = createGraphics(2480,3500);
  size(1750, 1240, P3D);
  W = width;
  H = height;
  
  background(255);
  noFill();
  noStroke();
  
  cam = new PeasyCam(this, 400);
  cs = new ColorScheme("Color.xml", this);
  colors = cs.getColors();
  
  rec = createShape();
  rec.beginShape();
  rec.fill(0);
  rec.vertex(PAD_W,PAD_H,0);
  rec.vertex(W-PAD_W, PAD_H,0);
  rec.vertex(W-PAD_W, H-PAD_H,0);
  rec.vertex(PAD_W, H-PAD_H,0);
  rec.endShape(CLOSE); 
  //secList.add(new secPar(rec));
  section(5, rec);
  //image(pg,0,0,width, height);
  String path = sketchPath("Images/");
  File file = new File(path);
  imageCount = file.list().length+3;
  
  
  for(Color c: colors)
    println(c.toInt());
}

void draw(){
  background(255);
  for(secPar p : secList){
    p.update();
    p.draw();
  }
  //image(pg,0,0,width,height);
}

void mousePressed() {
  save("Images/sketch"+(imageCount)+".tiff");
  imageCount++;
}
