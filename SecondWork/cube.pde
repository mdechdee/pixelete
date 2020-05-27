ArrayList<PShape> cube = new ArrayList<PShape>();
int cube_row = 10;
int cube_col = 7;
int CW = 200;
float S30 = sin(radians(30));
float C30 = cos(radians(30));
float S45 = sin(radians(45));
float max_log_area;

float A = CW;
float B = CW*S30*2;
float C = CW*C30*2;
float OFFSET = 10;

void drawCube(){
  
  for(int i=0;i<cube_row;i++)
  {
    for(int m=0;m<cube_col;m++)
    {
      float x = m*C-(i%2)*(C/2) + (i%2)*C/2; //- (m+1)*C/2;
      float y = (i*A)+((i+1)*B/2)-(B/2) - (i+1)*A/2;
      //cube.add(drawTop(x,y));
      cube.add(drawLeft(x,y));
      cube.add(drawRight(x,y));
    }
  }
  PShape p = cube.get(0);
  max_log_area = log2(
    findArea(p.getVertex(0),p.getVertex(1),p.getVertex(2),p.getVertex(3))/4+1
  );
}

PShape drawTop(float x, float y){
  rec = createShape();
  rec.beginShape();
  rec.strokeWeight(5);
  rec.stroke(255);
  rec.noFill();
  rec.vertex(x,y);
  rec.vertex(x+C/2,y-B/2);
  rec.vertex(x+C,y);
  rec.vertex(x+C/2,y+B/2);
  rec.endShape(CLOSE);
  return rec;
}

PShape drawLeft(float x, float y){
  rec = createShape();
  rec.beginShape();
  rec.strokeWeight(5);
  rec.stroke(255);
  rec.noFill();
  rec.vertex(x,y);
  rec.vertex(x+C/2,y+B/2);
  rec.vertex(x+C/2,y+3*B/2);
  rec.vertex(x,y+B);
  rec.endShape(CLOSE);
  return rec;
}

PShape drawRight(float x, float y){
  rec = createShape();
  rec.beginShape();
  rec.strokeWeight(5);
  rec.stroke(255);
  rec.noFill();
  rec.vertex(x+C/2,y+B/2);
  rec.vertex(x+C,y);
  rec.vertex(x+C,y+B);
  rec.vertex(x+C/2,y+3*B/2);
  rec.endShape(CLOSE);
  return rec;
}
