import processing.pdf.*;
import jto.colorscheme.*;
boolean saveOneFrame = false;
PShape rec;
static int FRAMERATE = 60;
int W,H;
int PAD_W = 2000;
int PAD_H = 2000;
int MARG = 0;
int STEPS = 7;
int imageCount;

void setup(){
  frameRate(FRAMERATE);
  //size(620,875);
  //pg = createGraphics(2480,3500);
  //size(3500,2480);
  size(3500,2480);
  W = width;
  H = height;
  
  background(255);
  noFill();
  noStroke();
  smooth(1);
  //rectMode(CORNER);
  
  rec = createShape();
  rec.beginShape();
  rec.fill(0);
  rec.vertex(0,0);
  rec.vertex(PAD_W, 0);
  rec.vertex(PAD_W, PAD_H);
  rec.vertex(0, PAD_H);
  rec.endShape(CLOSE); 
  //secList.add(new secPar(rec));
  cs = new ColorScheme("Color2.xml", this);
  colors = cs.getColors();
  
  section(STEPS, rec);
  //image(pg,0,0,width, height);
  String path = sketchPath("Images/");
  File file = new File(path);
  imageCount = file.list().length+3;
  

}

void draw(){
  if(saveOneFrame == true) {
    beginRecord(PDF, "Images/sketch"+(imageCount)+".pdf"); 
  }
  fill(255,255,255);
  rect(0,0,W,H);
  for(secPar p : secList){
    p.update();
    p.draw();
  }
  //image(pg,0,0,width,height);
  if(saveOneFrame == true) {
    endRecord();
    saveOneFrame = false; 
  }
}

void mousePressed() {
  //save("Images/sketch"+(imageCount)+".tiff");
  imageCount++;
  saveOneFrame = true; 
}
