ArrayList<agent> agents;

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
    pos bfr = paint.get(0);
    for (pos xy : paint) {
      switch(cur_shape){
        case ELI: draw_ellispe(xy); break;
        case REC: draw_rect(xy); break;
        case LIN: draw_line(xy,bfr); bfr=xy; break;
        default: break;
      }
    }
    pg.endDraw();
  }
}
