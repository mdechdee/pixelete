PGraphics pg;
PShape rec;
static int FRAMERATE = 60;
int W,H;
int PAD = 400;

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
  
  pg.smooth();
  rec = pg.createShape();
  
  rec.beginShape();
  rec.strokeWeight(4);
  rec.vertex(PAD,PAD);
  rec.vertex(W-PAD, PAD);
  rec.vertex(W-PAD, H-PAD);
  rec.vertex(PAD, H-PAD);
  rec.endShape(CLOSE);
  pg.beginDraw();
  pg.shape(rec);
  pg.endDraw();
  
  section(2, rec);
  image(pg,0,0,width, height);
}

void draw(){
  
  
  
  
}

void mousePressed() {
  
  pg.beginDraw();
  
  rec.translate(W/2, H/2);  
  rec.rotate(0.1);
  rec.translate(-W/2, -H/2);  
  rec.resetMatrix();
  pg.shape(rec);
  pg.endDraw();
  section(2, rec);
  image(pg,0,0,width, height);
}
