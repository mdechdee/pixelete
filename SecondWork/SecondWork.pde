import java.util.Stack;
import java.util.Collections;
import java.util.Arrays;
import java.util.List;
PGraphics pg;
PShape rec;
static int FRAMERATE = 2;
int W,H;
int PAD = 70;

void setup(){
  frameRate(FRAMERATE);
  //size(620,875);
  //pg = createGraphics(2480,3500);
  size(875,620);
  pg = createGraphics(3500,2480);
  W = pg.width;
  H = pg.height;
  pg.rectMode(CORNER);
  pg.fill(#ffffff);
  rec = pg.createShape();
  rec.beginShape();
  rec.vertex(PAD,PAD);
  rec.vertex(W-PAD, PAD);
  rec.vertex(W-PAD, H-PAD);
  rec.vertex(PAD, H-PAD);
  rec.endShape(CLOSE);
  pg.beginDraw();
  pg.shape(rec);
  pg.endDraw();
  
}

void draw(){
  background(0);
  image(pg,0,0,width, height);
}
