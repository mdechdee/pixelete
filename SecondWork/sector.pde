void section(int depth,PShape rec){
  if(depth<=0)  return;
  PVector[] v = {rec.getVertex(0), rec.getVertex(1),
                  rec.getVertex(2),rec.getVertex(3)};
  PVector[] p = new PVector[4];
  for(int i =0;i<4;i++){
    float a = random(0,1);
    p[i] = PVector.lerp(v[i],v[(i+1)%4],a);
    println(p[i], a, v[i], v[(i+1)%4]);
  }
  
  PShape newRec = pg.createShape();
  PVector center = intersect(p[0], p[1], p[2], p[3]);
  PShape ellispe = pg.createShape(ELLIPSE, center.x, center.y, 50, 50);
  
  newRec.beginShape();
  newRec.noFill();
  newRec.strokeWeight(4);
  newRec.vertex(p[0].x,p[0].y);
  newRec.vertex(p[2].x,p[2].y);
  newRec.endShape();
  
  newRec.beginShape();
  newRec.strokeWeight(4);
  newRec.vertex(p[1].x,p[1].y);
  newRec.vertex(p[3].x,p[3].y);
  newRec.endShape();
 
  pg.beginDraw();
  pg.shape(newRec);
  pg.shape(ellispe);
  pg.endDraw();
  image(pg,0,0,width, height);
}
