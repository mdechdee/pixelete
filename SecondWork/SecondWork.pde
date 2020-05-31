import processing.pdf.*;
boolean saveOneFrame = false;
PShape rec = new PShape();
static int FRAMERATE = 60;
int W,H;
int MARG = 0;

int imageCount;
PrintWriter output;

void setup(){
  frameRate(FRAMERATE);
  size(3600,2400);
  W = width;
  H = height;
  
  background(255);
  noFill();
  noStroke();
  smooth(1);
  
  rec = createShape();
  rec.beginShape();
  rec.fill(0);
  rec.vertex(0,0);
  rec.vertex(W, 0);
  rec.vertex(W, H);
  rec.vertex(0, H);
  rec.endShape(CLOSE); 
  drawCave(rec); 

  String path = sketchPath("Images/");
  File file = new File(path);
  imageCount = file.list().length;
  

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
  if(saveOneFrame == true) {
    endRecord();
    saveOneFrame = false; 
  }
}

void mousePressed() {
  imageCount++;
  saveOneFrame = true; 
}
