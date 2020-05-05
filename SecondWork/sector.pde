void section(int depth,PShape rec){
  if(depth<0)  return;
  PVector[] v = {rec.getVertex(0), rec.getVertex(1),
                  rec.getVertex(2),rec.getVertex(3)};
  PVector[] p = new PVector[2];
  p[0] = PVector.lerp(v[0],v[1],random(0.3,0.7));
  p[1] = PVector.lerp(v[2],v[3],random(0.3,0.7));
  
  PShape L = drawRect(depth,v[0], p[0], p[1], v[3], new PVector(-20,0).rotate(random(-PI/2, PI/2)));
  PShape R = drawRect(depth,p[0], v[1], v[2], p[1], new PVector(20,0).rotate(random(-PI/2, PI/2)));

  section(depth-1, L);
  section(depth-1, R);
}


PShape drawRect(int d, PVector p1, PVector p2,PVector p3,PVector p4, PVector offset){
  PShape newRec = pg.createShape();
  newRec.beginShape();
  newRec.fill(#ffffff, 50);
  newRec.noStroke();
  newRec.vertex(p1.x,p1.y);
  newRec.vertex(p2.x,p2.y);
  newRec.vertex(p3.x,p3.y);
  newRec.vertex(p4.x,p4.y);
  newRec.endShape(CLOSE);
  newRec.translate(offset.x,offset.y);
  
  if(d==0){ 
    pg.beginDraw();
    pg.shape(newRec);
    pg.endDraw();
  }
  return newRec;
}
