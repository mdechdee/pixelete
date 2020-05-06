PShape rec;
static int FRAMERATE = 60;
int W,H;
int PAD_W = 350;
int PAD_H = 250;
int MARG = 100;
int imageCount = 1;

void setup(){
  frameRate(FRAMERATE);
  //size(620,875);
  //pg = createGraphics(2480,3500);
  size(2480,3500);
  W = width;
  H = height;
  
  background(255);
  noFill();
  noStroke();
  smooth(2);
  
  rec = createShape();
  rec.beginShape();
  rec.fill(0);
  rec.vertex(PAD_W,PAD_H);
  rec.vertex(W-PAD_W, PAD_H);
  rec.vertex(W-PAD_W, H-PAD_H);
  rec.vertex(PAD_W, H-PAD_H);
  rec.endShape(CLOSE); 
  //secList.add(new secPar(rec));
  section(5, rec);
  //image(pg,0,0,width, height);
}

void draw(){
  fill(255, 1);
  rect(0,0,W,H);
  for(secPar p : secList){
    p.update();
    p.draw();
  }
  //image(pg,0,0,width,height);
}

void mousePressed() {
  String path = sketchPath("Images/");
  File file = new File(path);
  int sizeOfFolder = file.list().length+1;
  save("Images/sketch"+(imageCount+sizeOfFolder)+".tiff");
  imageCount++;
}
