float SEP = 0.2;   // Seperation of rects (0-1) the less the more seperation
float EXTREME = 0.1; // The extremness of rectngle generated (0-0.5)

void section(int depth,PShape rec){
  if(depth<0)  return;
  PVector[] v = {rec.getVertex(0), rec.getVertex(1),
                  rec.getVertex(2),rec.getVertex(3)};
  PVector[] p = new PVector[4];
  for(int i =0;i<4;i++){
    float a = random(0.5-EXTREME,0.5+EXTREME);
    p[i] = PVector.lerp(v[i],v[(i+1)%4],a);
  }
  PVector center = intersect(p[0], p[1], p[2], p[3]);
  
  PShape UL = drawRect(depth,v[0], p[0], center, p[3], PVector.lerp(PVector.sub(v[0], center), new PVector(0,0), random(SEP,1)));
  PShape UR = drawRect(depth,p[0], v[1], p[1], center, PVector.lerp(PVector.sub(v[1], center), new PVector(0,0), random(SEP,1)));
  PShape DR = drawRect(depth,center, p[1], v[2], p[2], PVector.lerp(PVector.sub(v[2], center), new PVector(0,0), random(SEP,1)));
  PShape DL = drawRect(depth,p[3], center, p[2], v[3], PVector.lerp(PVector.sub(v[3], center), new PVector(0,0), random(SEP,1)));

  section(depth-1, UL);
  section(depth-1, UR);
  section(depth-1, DR);
  section(depth-1, DL);
}


PShape drawRect(int d, PVector p1, PVector p2,PVector p3,PVector p4, PVector offset){
  PShape newRec = createShape();
  newRec.beginShape();
  newRec.colorMode(HSB,100,100,100,100);
  newRec.fill(noise(offset.x,offset.y)*10+50,
              noise(offset.x*5,offset.y*5)*100,
              noise(offset.x*0.05,offset.y*0.05)*20+80
              ,90);
  newRec.strokeWeight(1);
  newRec.vertex(p1.x,p1.y);
  newRec.vertex(p2.x,p2.y);
  newRec.vertex(p3.x,p3.y);
  newRec.vertex(p4.x,p4.y);
  newRec.endShape(CLOSE);
  newRec.translate(offset.x,offset.y);
  
  if(d==0){ 
    //pg.beginDraw();
    //pg.shape(newRec);
    //pg.endDraw();
    secList.add(new secPar(newRec));
  }
  return newRec;
}
