import java.util.List;

PGraphics pg;
PShape rec;
int ite = 4;

static int FRAMERATE = 2;
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
  smooth();
  
  rec = pg.createShape();
  rec.beginShape();
  rec.strokeWeight(4);
  rec.vertex(PAD,PAD);
  rec.vertex(W-PAD, PAD);
  rec.vertex(W-PAD, H-PAD);
  rec.vertex(PAD, H-PAD);
  rec.endShape(CLOSE);

  sect_list.add(rec);
  section(4, rec);
  //image(pg,0,0,width, height);
}

void draw(){
  background(255);
  if(ite>0){   
    for(PShape r : sect_list){
      section(ite, r);
    }
    sect_list = new ArrayList<PShape>();
    for(PShape r : to_add){
      sect_list.add(r);
    }
    to_add = new ArrayList<PShape>();
  }
  image(pg,0,0,width,height);
  ite--;
}

void mousePressed() {
  
  //pg.beginDraw();
  
  //rec.translate(W/2, H/2);  
  //rec.rotate(0.1);
  //rec.translate(-W/2, -H/2);  
  //rec.resetMatrix();
  //pg.shape(rec);
  //pg.endDraw();
  //section(3, rec);
  //image(pg,0,0,width, height);
}
