PGraphics pg;
PShape rec;
static int FRAMERATE = 60;
int W,H;
int PAD = 400;
int imageCount;

void setup(){
  frameRate(FRAMERATE);
  //size(620,875);
  //pg = createGraphics(2480,3500);
  size(875,620);
  pg = createGraphics(3500,2480);
  W = pg.width;
  H = pg.height;
  
  pg.ellipseMode(CENTER);
  pg.rectMode(CORNER);
  pg.noFill();
  pg.stroke(0);
  pg.smooth(4);
  //pg.translate(W/2,H/2);
  smooth();
  
  rec.beginShape();
  rec.strokeWeight(4);
  rec.vertex(PAD,PAD);
  rec.vertex(W-PAD, PAD);
  rec.vertex(W-PAD, H-PAD);
  rec.vertex(PAD, H-PAD);
  rec.endShape(CLOSE); 
  section(4, rec);
  //image(pg,0,0,width, height);
}

void draw(){
  pg.background(255);
  for(secPar p : secList){
    p.update();
    p.draw();
  }
  image(pg,W/2,H/2,width,height);
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
