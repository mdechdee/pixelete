PGraphics pg;
PShape rec;
static int FRAMERATE = 50;
int W,H;
float t;
float cur_x, cur_y, vel_x, vel_y;
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
  vel_x = 0;
  vel_y = 0;
  
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

  stroke(#dd2d3d);
  strokeWeight(2);
  section(6, rec);
  //image(pg,0,0,width, height);
}

void draw(){
  //background(0);
  t += 0.02;
  float noise_angle = noise(cur_x*0.005,cur_y*0.005)*TWO_PI*2;
  println(cos(noise_angle-PI/2));

  //pg.rotate(noise_angle);
  vel_x += cos(noise_angle)/8;
  vel_y += sin(noise_angle)/8;
  line(cur_x+width/2,cur_y+height/2,cur_x+vel_x*5+width/2 ,cur_y+vel_y*5+height/2);
  cur_x += vel_x;
  cur_y += vel_y;
  //for(int i = 0;i<width;i+=20){
  //  for(int j=0;j<height;j+=20){
  //    line(i,j,i+cos(noise(i*0.02,t)*TWO_PI-PI/2)*9,j+sin(noise(j*0.02,t)*TWO_PI)*9);
  //  }
  //}
  
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
