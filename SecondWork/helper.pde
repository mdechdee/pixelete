PVector intersect(PVector a, PVector b, PVector c, PVector d){
  /*
    Ref: http://www-cs.ccny.cuny.edu/~wolberg/capstone/intersection/
    Intersection%20point%20of%20two%20lines.html
  */
  
  // Line 1
  float x1 = a.x; float y1 = a.y;
  float x2 = c.x; float y2 = c.y;
  // Line 2
  float x3 = b.x; float y3 = b.y;
  float x4 = d.x; float y4 = d.y;
  
  float ua = ((x4-x3)*(y1-y3) - (y4-y3)*(x1-x3))/
        ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
      
  float x = x1 + ua*(x2-x1);
  float y = y1 + ua*(y2-y1);
  return new PVector(x,y);
}
