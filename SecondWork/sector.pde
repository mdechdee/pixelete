float SEP = 0.4;   // Seperation of rects (0-1) the less the more seperation
float EXTREME = 0.3; // The extremness of rectngle generated (0-0.5)

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
    PShape UL = drawRect(depth,v[0], p[0], center, p[3], PVector.lerp(PVector.sub(v[0], center), new PVector(0,0), random(SEP,1)), false);
    section(depth-1, UL);
  }
  else 
  drawRect(depth,v[0], p[0], center, p[3], PVector.lerp(PVector.sub(v[0], center), new PVector(0,0), random(SEP,1)), true);
  if(random(0,depth) > 0.6)
  {
    PShape UR = drawRect(depth,p[0], v[1], p[1], center, PVector.lerp(PVector.sub(v[1], center), new PVector(0,0), random(SEP,1)), false);
    section(depth-1, UR);
  }
  else drawRect(depth,p[0], v[1], p[1], center, PVector.lerp(PVector.sub(v[1], center), new PVector(0,0), random(SEP,1)), true);
  if(random(0,depth) > 0.6){
    PShape DR = drawRect(depth,center, p[1], v[2], p[2], PVector.lerp(PVector.sub(v[2], center), new PVector(0,0), random(SEP,1)), false);
    section(depth-1, DR);
  }
  else drawRect(depth,center, p[1], v[2], p[2], PVector.lerp(PVector.sub(v[2], center), new PVector(0,0), random(SEP,1)), true);
  if(random(0,depth) > 0.6){
    PShape DL = drawRect(depth,p[3], center, p[2], v[3], PVector.lerp(PVector.sub(v[3], center), new PVector(0,0), random(SEP,1)), false);
    section(depth-1, DL);
  }
  else drawRect(depth,p[3], center, p[2], v[3], PVector.lerp(PVector.sub(v[3], center), new PVector(0,0), random(SEP,1)), true);
}


PShape drawRect(int d, PVector p1, PVector p2,PVector p3,PVector p4, PVector offset, boolean toList){
  PShape newRec = createShape();
  newRec.beginShape();
  newRec.colorMode(HSB,360,100,100,100);
  output.println(log2(findArea(p1,p2,p3,p4)+1));
  newRec.fill(map(log2(findArea(p1,p2,p3,p4)+1),0,max_log_area,120,240),
              80,
              noise(p1.x*0.05,p1.y*0.05)*80+40
              ,100);
  //newRec.stroke(noise(p1.x*0.01,p1.y*0.01)*80+10,
  //            0,
  //            noise(p1.x*0.05,p1.y*0.05)*20+10
  //            ,100);
  //newRec.fill(colors.get((int) random(0,15)).toInt());
  //newRec.stroke(colors.get((int) random(0,15)).toInt());
  //newRec.strokeWeight(0);
  newRec.noStroke();
  //newRec.vertex(p1.x+offset.x,p1.y+offset.y);
  //newRec.vertex(p2.x+offset.x,p2.y+offset.y);
  //newRec.vertex(p3.x+offset.x,p3.y+offset.y);
  //newRec.vertex(p4.x+offset.x,p4.y+offset.y);
  newRec.vertex(p1.x,p1.y);
  newRec.vertex(p2.x,p2.y);
  newRec.vertex(p3.x,p3.y);
  newRec.vertex(p4.x,p4.y);
  newRec.endShape(CLOSE);
  //newRec.translate(offset.x,offset.y);
  
  if(toList){
    //pg.beginDraw();
    //pg.shape(newRec);
    //pg.endDraw();
    secList.add(new secPar(newRec));
  }
  return newRec;
}

float log2(float a)
{
  return log(a)/log(2);
}
