class posClass {
  int posX;
  int posY;
  color quadColor;

  posClass(int forPosX, int forPosY) {
    posX = forPosX;
    posY = forPosY;
    quadColor = color(255);
  }

  void grid() {
    noStroke();
    fill(quadColor);
    quad(posX-(2*gridSize), posY, posX, posY+gridSize, posX+(2*gridSize), posY, posX, posY-gridSize);
  }

  void detect() {
    if ( dist(newMouseX, newMouseY, posX, posY) < gridSize) {
      for (int j = 0; j < layerNum; j++) {
        if (ui.clicked[j]) {
          interval(j);
          image(layer[j], posX+intervalX, posY+intervalY);
        } else {
        }
      }
    } else {
      quadColor = color(255);
    }
  }
}
