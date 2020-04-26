float[][] grad;
float[][] gradx;
float[][] grady;
PGraphics gradImg;
int[][] Py = {{-1,-2,-1},
              {0 , 0, 0},
              {1 , 2, 1}};
              
int[][] Px = {{1,  0,-1},
              {2 , 0,-2},
              {1 , 0,-1}};              

void gradient_setup(){
  gradImg = createGraphics(pg.width, pg.height);
  createGradient();
}

void createGradient(){
  grad = new float[(pg.height)+1][(pg.width)+1];
  gradx = new float[(pg.height)+1][(pg.width)+1];
  grady = new float[(pg.height)+1][(pg.width)+1];
  //Convert gradImg to grayscale
  gradImg.beginDraw();
  toGray();
  // Compute gradient for each pixel and store to grad
  for(int i=0;i<pg.height;i+=1){
    for(int m=0;m<pg.width;m+=1){
      grad[i][m] = calGradient(i,m);
    }
  }
  // Store gradient data in gradImg to visualize
  for(int i=0;i<pg.height;i+=1){
    for(int m=0;m<pg.width;m+=1){
      gradImg.set(m,i,color(grad[i][m]));
    }
  }
  gradImg.endDraw();
  println("Done Gradient!");
  
}

float calGradient(int y, int x){
  gradx[y][x] = 0; //<>//
  for(int i=0;i<3;i++){
    for(int m=0;m<3;m++){
      gradx[y][x] += Px[i][m] * red(gradImg.get(x+m-1,y+i-1));
      //println(y+i-1,x+m-1,red(gradImg.get(x+m-1,y+i-1)));
    }
  }
  //println(); //<>//
  grady[y][x] = 0;
  for(int i=0;i<3;i++){
    for(int m=0;m<3;m++){
      grady[y][x] += Py[i][m] * red(gradImg.get(x+m-1,y+i-1));
      //println(grady[y][x]);
    }
  }
  //println(sqrt(grady[y][x]*grady[y][x] + gradx[y][x]*gradx[y][x]));
  return sqrt(grady[y][x]*grady[y][x] + gradx[y][x]*gradx[y][x]);
}

void toGray(){
  gradImg.image(img, 0, 0, pg.width, pg.height);
  gradImg.loadPixels();
  for(int i = 0;i<gradImg.pixels.length;i++){
    color pix = gradImg.pixels[i];
    gradImg.pixels[i] = color(0.3*red(pix) + 0.59*green(pix) + 0.11*blue(pix));
  }
  gradImg.updatePixels();
}
