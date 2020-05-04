void section(int depth,PShape rec){
  if(depth<0)  return;
  PVector[] v = {rec.getVertex(0), rec.getVertex(1),
                  rec.getVertex(2),rec.getVertex(3)};
  PVector[] p = new PVector[4];
  for(int i =0;i<4;i++){
    float a = random(0,1);
    p[i] = PVector.lerp(v[i],v[(i+1)%4],a);
  }
  PVector center = intersect(p[0], p[1], p[2], p[3]);
  
  PShape UL = drawRect(v[0], p[0], center, p[3], PVector.lerp(PVector.sub(v[0], center), new PVector(0,0), random(0.97,1)));
  PShape UR = drawRect(p[0], v[1], p[1], center, PVector.lerp(PVector.sub(v[1], center), new PVector(0,0), random(0.97,1)));
  PShape DR = drawRect(center, p[1], v[2], p[2], PVector.lerp(PVector.sub(v[2], center), new PVector(0,0), random(0.97,1)));
  PShape DL = drawRect(p[3], center, p[2], v[3], PVector.lerp(PVector.sub(v[3], center), new PVector(0,0), random(0.97,1)));

  section(depth-1, UL);
  section(depth-1, UR);
  section(depth-1, DR);
  section(depth-1, DL);
}


PShape drawRect(PVector p1, PVector p2,PVector p3,PVector p4, PVector offset){
  PShape newRec = pg.createShape();
  newRec.beginShape();
  newRec.fill(#ffffff, 50);
  newRec.strokeWeight(4);
  newRec.vertex(p1.x,p1.y);
  newRec.vertex(p2.x,p2.y);
  newRec.vertex(p3.x,p3.y);
  newRec.vertex(p4.x,p4.y);
  newRec.endShape(CLOSE);
  newRec.translate(offset.x,offset.y);
  
  pg.beginDraw();
  pg.shape(newRec);
  pg.endDraw();
  return newRec;
}
