ArrayList<secPar> secList = new ArrayList<secPar>();
float MAX_FORCE = 2; 
float MAX_VEL = 10;
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
    //wrap();
  }
  void draw(){
    pg.beginDraw();
    pg.shape(sect);
    pg.endDraw();
  }
  void wrap(){
    int count = 0;
    for(int i=0;i<4;i++){ 
      PVector v = sect.getVertex(i);
      if(v.x>W || v.x<0 || v.y>H || v.y<0)
        count++;
    }
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
