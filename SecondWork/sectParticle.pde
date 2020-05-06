ArrayList<secPar> secList = new ArrayList<secPar>();
float MAX_FORCE = 5; 
float MAX_VEL = 1;
float MASS = 1;
float FORCE_MUL = 1;

class secPar{
  PShape sect;
  PVector pos;
  PVector vel = new PVector(0,0);
  PVector force= new PVector(0,0);
  PVector torq = new PVector(0,0);
  float inertia = 0;
  
  secPar(PShape _sect){
    sect = _sect;
    pos = findCenter(sect);
    for(int i=0;i<4;i++) 
      inertia += MASS*sect.getVertex(i).dist(pos)*sect.getVertex(i).dist(pos);
  }
  
  void update(){
    force.add(findForce(pos));
    force.limit(MAX_FORCE);
    vel.add(force);
    vel.limit(MAX_VEL);
    pos.add(vel);
    //for(int i=0;i<4;i++){
    //   torq.add(findTorq(sect.getVertex(i), pos)); 
    //}
    wrap();
    sect.resetMatrix();
    sect.translate(-W/2,-H/2);
    sect.translate(pos.x,pos.y);
  }
  void draw(){
    shape(sect);
  }
  void wrap(){
     float new_x, new_y;
     if(pos.x > W)  new_x = pos.x-W;
     else if(pos.x <0) new_x = pos.x+W;
     else new_x = pos.x;
     if(pos.y > H)  new_y = pos.y-H;
     else if(pos.y <0) new_y = pos.y+H;
     else new_y = pos.y;
     pos = new PVector(new_x,new_y);
  }
}

PVector findCenter(PShape rec){
    PVector[] v = {rec.getVertex(0), rec.getVertex(1),
                  rec.getVertex(2),rec.getVertex(3)};
    return v[0].add(v[1].add(v[2].add(v[3]))).div(4);
}

PVector findTorq(PVector pos, PVector center){
  PVector f = findForce(pos);
  PVector r = center.sub(pos);
  return r.cross(f);
}
