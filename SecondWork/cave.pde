float LERP_RATE = 0.5;
float LERP_DEPTH = 6;
void drawCave(PShape s){
  PVector center = findCenter(s);
  PVector[] p = {s.getVertex(0),s.getVertex(1),s.getVertex(2),s.getVertex(3)};
  PVector[] v = new PVector[4];
  for(int i =0;i<4;i++){
    v[i] = PVector.lerp(p[i],center,LERP_RATE);
  }
  PShape[] r = new PShape[4];
  for(int i = 0;i<4;i++){
    r[i] = createShape();
    r[i].beginShape();
    r[i].vertex(p[i%4].x,p[i%4].y);
    r[i].vertex(p[(i+1)%4].x,p[(i+1)%4].y);
    r[i].vertex(v[(i+1)%4].x,v[(i+1)%4].y);
    r[i].vertex(v[i%4].x,v[i%4].y);
    r[i].endShape(CLOSE);
    cube.add(r[i]);
  }
  PShape newRec = createShape();
  newRec.beginShape();
  newRec.vertex(v[0].x,v[0].y);
  newRec.vertex(v[1].x,v[1].y);
  newRec.vertex(v[2].x,v[2].y);
  newRec.vertex(v[3].x,v[3].y);
  newRec.endShape(CLOSE);
  if(LERP_DEPTH > 0)
  {
    LERP_DEPTH -= 1;
    drawCave(newRec);
  }
}
