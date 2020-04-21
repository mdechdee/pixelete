ArrayList<agent> agents;

int[][] walk_path = {{0, -1}, {0, 1}, {-1, 0}, {1, 0},
                    {1, -1}, {1, 1}, {-1, 1}, {-1, -1}};
int [][] udlr = {{0, -1}, {0, 1}, {-1, 0}, {1, 0}};
void agent_setup() {
  agents = new ArrayList<agent>();
}

class agent {
  color clr;
  Stack<pos> hist;
  List<pos> paint; 
  pos xy;
  int idx;

  @Override
    public boolean equals(Object o) {
    if (o == this) return true; 
    if (!(o instanceof agent)) return false; 
    agent c = (agent) o; 
    return c.idx == idx;
  }

  agent(color _c, pos _p, int _idx) {
    xy = _p;
    clr = _c;
    idx = _idx;
    hist = new Stack<pos>();
    paint = new ArrayList<pos>();
    hist.push(xy);
    paint.add(xy);
    map[xy.y][xy.x] = true;
  }

  void update() {
    while (!hist.empty()) {
      pos last = hist.peek();
      // Random walk path of an agent by shuffling array of walk path index
      Integer[] intArray = new Integer[walk_path.length];
      for (int i = 0; i<walk_path.length; i++) {
        intArray[i] = i;
      }
      List<Integer> intList = Arrays.asList(intArray);
      Collections.shuffle(intList);

      // Iterate through list of possible walk
      for (int j = 0; j<walk_path.length; j+=1) {
        int i = intList.get(j);
        if (isWalkable(last, walk_path[i]))
        {
          xy = new pos(last.y+walk_path[i][0], last.x+walk_path[i][1]);
          map[xy.y][xy.x] = true;
          xy.dist = last.dist + 1;
          paint.add(xy);
          hist.push(xy);
          break;
        }
        else if(j == walk_path.length-1)
          hist.pop();
      }
    }
  }
  void display() {
    pg.beginDraw(); //<>//
    for (pos xy : paint) {
      pg.noTint();
      pg.noStroke();
      pg.fill(colorAvg(avgImg[xy.y][xy.x], avgImg[xy.y][xy.x]));
      float delta_size = 0;
      if (!hist.empty()) 
        delta_size =  hist.peek().dist * size_scale;
      pg.rect(
        xy.x*size + delta_size, 
        xy.y*size + delta_size, 
        size - delta_size, 
        size - delta_size);
       
    }
    pg.endDraw();
    /*float r = red(clr);
     float g = green(clr);
     float b = blue(clr);
     int rand = int(random(-5,5));
     clr = color(r+rand,g+rand,b+rand);
     stroke(clr);
     strokeWeight(6);
     if(hist.empty()) return;
     pos tmp = hist.pop();
     if(hist.empty()) return;
     pos bfr = hist.peek();
     line(xy.x*size,xy.y*size,bfr.x*size,bfr.y*size);
     hist.push(tmp);*/
    
  }
}
