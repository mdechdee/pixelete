float SEP = 0.1;   // Seperation of rects (0-1) the less the more seperation
float EXTREME = 0.05; // The extremness of rectngle generated (0-0.5)

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
  if(random(0,depth) > 0.6){
    PShape UL = drawRect(depth,v[0], p[0], center, p[3], false);
    section(depth-1, UL);
  }
  else 
  drawRect(depth,v[0], p[0], center, p[3], true);
  if(random(0,depth) > 0.6)
  {
    PShape UR = drawRect(depth,p[0], v[1], p[1], center, false);
    section(depth-1, UR);
  }
  else drawRect(depth,p[0], v[1], p[1], center, true);
  if(random(0,depth) > 0.6){
    PShape DR = drawRect(depth,center, p[1], v[2], p[2], false);
    section(depth-1, DR);
  }
  else drawRect(depth,center, p[1], v[2], p[2], true);
  if(random(0,depth) > 0.6){
    PShape DL = drawRect(depth,p[3], center, p[2], v[3], false);
    section(depth-1, DL);
  }
  else drawRect(depth,p[3], center, p[2], v[3], true);
}


PShape drawRect(int d, PVector p1, PVector p2,PVector p3,PVector p4, boolean toList){
  PShape newRec = createShape();
  newRec.beginShape();
  newRec.colorMode(HSB,360,100,100,100);
  newRec.fill(round(noise(findArea(p1,p2,p3,p4)*0.1)*12)*6+INI_HUE,
              SATURATION,
              95
              ,OPACITY);
  //newRec.stroke(noise(p1.x*0.001,p1.y*0.001)*240+20,
  //            50,
  //            100
  //            ,100);
  //newRec.strokeWeight(pow(1.8,d));
  newRec.noStroke();
  newRec.vertex(p1.x,p1.y);
  newRec.vertex(p2.x,p2.y);
  newRec.vertex(p3.x,p3.y);
  newRec.vertex(p4.x,p4.y);
  newRec.endShape(CLOSE);
  
  if(toList){
    secList.add(new secPar(newRec));
  }
  return newRec;
}
