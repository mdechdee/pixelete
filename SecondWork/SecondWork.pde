PShape rec;
static int FRAMERATE = 60;
int W,H;
int PAD = 20;
int imageCount;

void setup(){
  frameRate(FRAMERATE);
  //size(620,875);
  //pg = createGraphics(2480,3500);
  size(875,620);
  W = width;
  H = height;
  
  noFill();
  stroke(0);
  smooth(4);
  //pg.translate(W/2,H/2);
  smooth();
  
  rec = createShape();
  rec.beginShape();
  rec.strokeWeight(4);
  rec.vertex(PAD,PAD);
  rec.vertex(W-PAD, PAD);
  rec.vertex(W-PAD, H-PAD);
  rec.vertex(PAD, H-PAD);
  rec.endShape(CLOSE); 
  section(2, rec);
  //image(pg,0,0,width, height);
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
  String path = dataPath("Images/");
  File file = new File(path);
  int sizeOfFolder = 0;
  if(file.exists() && file.isDirectory()) {
    sizeOfFolder = file.listFiles().length;
  }
  pg.save("Images/sketch"+(imageCount+sizeOfFolder)+".tiff");
  imageCount++;
}
