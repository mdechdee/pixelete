ArrayList<secPar> secList = new ArrayList<secPar>();
float MAX_FORCE = 1; 
float MAX_VEL = 0;
float MASS = 1;
float FORCE_MUL = 1;

float SCALE = 0.5;
float TRAN_X = 1.0;
float TRAN_Y = 1.0;

class secPar{
  PShape sect;
  PVector pos;
  PVector ini_pos;
  PVector vel = new PVector(0,0);
  PVector force= new PVector(0,0);
  PVector torq = new PVector(0,0);
  float inertia = 0;
  float mass = 1;

  secPar(PShape _sect){
    sect = _sect;
    pos = findCenter(sect);
    ini_pos = pos;
    for(int i=0;i<4;i++) 
      inertia += MASS*sect.getVertex(i).dist(pos)*sect.getVertex(i).dist(pos);
    //mass = findArea(sect.getVertex(0),sect.getVertex(1),sect.getVertex(2),sect.getVertex(3));
  }
  
  void update(){
    //force.add(findForce(pos).div(mass));
    //force.limit(MAX_FORCE);
    //vel.add(force);
    //vel.limit(MAX_VEL);
    //pos.add(vel);
    //wrap();
    sect.resetMatrix();
    sect.scale(SCALE);
    sect.translate(TRAN_X*pos.x,TRAN_Y*pos.y);
  }
  void draw(){
    shape(sect);
  }
  void wrap(){
     float new_x, new_y;
     if(pos.x > W+MARG)  new_x = pos.x-W;
     else if(pos.x < MARG) new_x = pos.x+W;
     else new_x = pos.x;
     if(pos.y > H+MARG)  new_y = pos.y-H;
     else if(pos.y < MARG) new_y = pos.y+H;
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
