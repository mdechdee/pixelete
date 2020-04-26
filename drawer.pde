void fill_setup(pos xy){
  pg.noTint();
  pg.noStroke();
  pg.fill(colorAvg(avg[xy.y][xy.x], avg[xy.y][xy.x]));  
}

void stroke_setup(pos xy){
  pg.stroke(colorAvg(avg[xy.y][xy.x], avg[xy.y][xy.x]));
  pg.strokeWeight(6);
}

void draw_ellispe(pos xy){
  float delta_size = 0;
  fill_setup(xy);
  pg.ellipse(
    xy.x*size + delta_size, 
    xy.y*size + delta_size, 
    size - delta_size, 
    size - delta_size);
}

void draw_rect(pos xy){
  float delta_size = 0;
  fill_setup(xy);
  pg.rect(
    xy.x*size + delta_size, 
    xy.y*size + delta_size, 
    size - delta_size, 
    size - delta_size);
}

void draw_line(pos xy, pos bfr){
  float delta_size = 0;
  stroke_setup(xy);
  pg.line(bfr.x*size,bfr.y*size,xy.x*size,xy.y*size);
}
