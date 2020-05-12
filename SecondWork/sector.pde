float SEP = 0.6;   // Seperation of rects (0-1) the less the more seperation
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
  PVector[] sep = new PVector[4];
  for(int i =0;i<4;i++){
    sep[i] = PVector.lerp(PVector.sub(v[0], center), new PVector(0,0), random(SEP,1));
    
    sep[i].z = noise(center.x,center.y)*200;
  }
  
  PShape UL = drawRect(depth,v[0], p[0], center, p[3], sep[0]);
  PShape UR = drawRect(depth,p[0], v[1], p[1], center, sep[1]);
  PShape DR = drawRect(depth,center, p[1], v[2], p[2], sep[2]);
  PShape DL = drawRect(depth,p[3], center, p[2], v[3], sep[3]);

  section(depth-1, UL);
  section(depth-1, UR);
  section(depth-1, DR);
  section(depth-1, DL);
}


PShape drawRect(int d, PVector p1, PVector p2,PVector p3,PVector p4, PVector offset){
  PShape newRec = createShape();
  newRec.beginShape();
  //newRec.colorMode(HSB,100,100,100,100);
  /*newRec.fill(noise(offset.x,offset.y)*80+10,
              noise(offset.x*5,offset.y*5)*30+70,
              noise(offset.x*0.05,offset.y*0.05)*20+80
              ,100);*/
  newRec.fill(colors.get((int) random(0,12)).toInt());
  newRec.noStroke();
  newRec.vertex(p1.x+offset.x,p1.y+offset.y,offset.z);
  newRec.vertex(p2.x+offset.x,p2.y+offset.y,offset.z);
  newRec.vertex(p3.x+offset.x,p3.y+offset.y,offset.z);
  newRec.vertex(p4.x+offset.x,p4.y+offset.y,offset.z);
  newRec.endShape(CLOSE);
  //newRec.translate(offset.x,offset.y,offset.z);
  
  if(d==0){ 
    //pg.beginDraw();
    //pg.shape(newRec);
    //pg.endDraw();
    secList.add(new secPar(newRec));
  }
  return newRec;
}
