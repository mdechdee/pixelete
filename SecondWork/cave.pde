float LERP_RATE = 0.95;
float LERP_DEPTH = 1;
float OPACITY = 80;
float SATURATION = 60;
float INI_HUE = 0;
float RAD = 2500;
int STEPS = 4;
int CAVE_SECT = 12;
ArrayList<PShape> recList = new ArrayList<PShape>();

void drawCave(PShape s){
  PVector c = findCenter(s);
  float angle = TWO_PI/CAVE_SECT;
  println(angle/TWO_PI*360);
  PShape[] r = new PShape[CAVE_SECT];
  for(int i = 0;i<CAVE_SECT;i++){
    println(cos(angle*i)*RAD, cos(angle*(i+1))*RAD);
    r[i] = createShape();
    r[i].beginShape();
    r[i].fill(0);
    r[i].vertex(c.x + (cos(angle*i)*30) , c.y - (sin(angle*i)*30));
    r[i].vertex(c.x + (cos(angle*i)*RAD) , c.y - (sin(angle*i)*RAD));
    r[i].vertex(c.x + (cos(angle*(i+1))*RAD) , c.y - (sin(angle*(i+1))*RAD));
    r[i].vertex(c.x + (cos(angle*(i+1))*30) , c.y - (sin(angle*(i+1))*30));
    r[i].endShape(CLOSE);
    recList.add(r[i]);
  }
  for(PShape cu: recList)
  {
    section(STEPS, cu);
    section(STEPS, cu);
  }
  recList.clear();
  STEPS += 1;
  OPACITY += 20;
  SATURATION += 40;
  INI_HUE += 0;
  CAVE_SECT /= 2;
  if(LERP_DEPTH > 0)
  {
    LERP_DEPTH -= 1;
    drawCave(s);
  }
}
