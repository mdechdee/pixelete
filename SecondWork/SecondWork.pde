import processing.pdf.*;
boolean saveOneFrame = false;
PShape rec;
static int FRAMERATE = 60;
int W,H;
int PAD_W = 2000;
int PAD_H = 2000;
int MARG = 0;
int STEPS = 5;
int imageCount;
PrintWriter output;

void setup(){
  frameRate(FRAMERATE);
  //size(620,875);
  //pg = createGraphics(2480,3500);
  //size(3500,2480);
  size(2480,3500);
  W = width;
  H = height;
  
  background(255);
  noFill();
  noStroke();
  smooth(1);
  //rectMode(CORNER);
  
  drawCube(); 
  //secList.add(new secPar(rec));
  output = createWriter("positions.txt"); 
  rec = createShape();
  //rec.beginShape();
  //rec.fill(0);
  //rec.vertex(0,0);
  //rec.vertex(W/2, 0);
  //rec.vertex(W/2, H/2);
  //rec.vertex(0, H/2);
  //rec.endShape(CLOSE); 
  //cube.add(rec);
  
  for(PShape c: cube)
  {
    section(STEPS, c);
  }
  //section(STEPS, rec);
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
  //for(PShape c: cube)
  //{
  //  c.resetMatrix();
  //  c.scale(2);
  //  PVector v = findCenter(c);
  //  //c.translate(v.x,v.y);
  //  shape(c);
  //}
  //noFill();
  //stroke(255);
  //strokeWeight(50);
  //rect(0,0,W,H);
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
