PGraphics pg;
PShape rec;
static int FRAMERATE = 5;
int W,H;
int t;
float cur_x, cur_y;
int PAD = 1200;

void setup(){
  frameRate(FRAMERATE);
  //size(620,875);
  //pg = createGraphics(2480,3500);
  size(875,620);
  pg = createGraphics(3500,2480);
  W = pg.width;
  H = pg.height;
  t = 0;
  cur_x = 0;
  cur_y = 0;
  
  pg.ellipseMode(CENTER);
  pg.rectMode(CORNER);
  pg.noFill();
  pg.stroke(0);
  pg.smooth();
  smooth();

  rec = pg.createShape();
  
  rec.beginShape();
  rec.strokeWeight(4);
  rec.vertex(PAD*1.5,PAD);
  rec.vertex(W-PAD*1.5, PAD);
  rec.vertex(W-PAD*1.5, H-PAD);
  rec.vertex(PAD*1.5, H-PAD);
  rec.endShape(CLOSE);

  
  section(6, rec);
  //image(pg,0,0,width, height);
}

void draw(){
  resetMatrix();
  float noise_angle = noise(cur_x,cur_y)*TWO_PI;
  stroke(255);
  strokeWeight(2);
  line(cur_x+width/2,cur_y+height/2,width/2 ,height/2);
  //pg.rotate(noise_angle);
  cur_x += cos(noise_angle)*5;
  cur_y += sin(noise_angle)*5;
  image(pg,cur_x,cur_y,width,height);
  
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
