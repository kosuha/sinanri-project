int layerNum = 16;
PImage[] layer = new PImage[layerNum];

int numPosWidth = 50; 
int numPosHeight = 50; 
int numWidth = numPosWidth * 2; 
int numHeight = numPosHeight * 2;
int posNum = (numHeight * numWidth)/2;
int gridSize = 30;
int intervalY;
int intervalX;
boolean a;
float x, y;
float newMouseX, newMouseY;
float zoom;


uiClass ui;
posClass[] positions = new posClass[posNum];

boolean[][] posData = new boolean[posNum][layerNum];
boolean[] antiSamePos = new boolean[posNum];

void setup() {
  size(1280, 720);
  background(255);
  noStroke();
  imageMode(CENTER);
  //x = ((numPosWidth*4)-2)*gridSize/2;
  //y = ((numPosHeight*2)-2)*gridSize/2;
  x = 0;
  y = 0;
  zoom = 1;

  for (int j = 0; j < numHeight; j++) {
    for (int i = 0; i < numWidth; i++) {
      if (j%2 == 0 && i%2 == 0) {
        positions[numPosWidth * j + i/2] = new posClass((gridSize*2)*i, gridSize*j);
      } 
      if (j%2 == 1 && i%2 == 1) {
        positions[numPosWidth * j + (i-1)/2] = new posClass((gridSize*2)*i, gridSize*j);
      }
    }
  }

  for (int i=0; i<layerNum; i++) {
    layer[i] = loadImage("Layer_"+i+".png");
  }

  layerSize();
  ui = new uiClass();
}

void draw() {
  
  newMouseX = (mouseX + x)*(1/zoom);
  newMouseY = (mouseY + y)*(1/zoom);
  
  pushMatrix();

  translate(-x, -y);
  scale(zoom);

  for (int i = 0; i < posNum; i++) {
    positions[i].grid();
  }

  click();

  for (int i = 0; i < posNum; i++) {
    positions[i].detect();
  }
  cameraControl();
  popMatrix();

  ui.display();
}

void cameraControl() {
  stroke(255, 0, 0, 90);
  strokeWeight(3);

  if (keyPressed) {
    //println(zoom);
    //if (key == '1') {
    //  zoom = zoom + 0.01;
    //  if (zoom >= 3) {
    //    zoom = 3;
    //  }
    //}
    //if (key == '2') {
    //  zoom = zoom - 0.01;
    //  if (zoom <= 0.5) {
    //    zoom = 0.5;
    //  }
    //}
    if (keyCode == LEFT) {
      x = x - 15;
      if (x <= 0) {
        x = 0;
        line(1, 0, 1, ((numPosHeight*2)-2)*gridSize);
      }
    }
    if (keyCode == RIGHT) {
      x = x + 15;
      if (x >= ((numPosWidth*4)-2)*gridSize-width) {
        x = ((numPosWidth*4)-2)*gridSize-width;
        stroke(255, 0, 0, 90);
        line(((numPosWidth*4)-2)*gridSize-2, 0, ((numPosWidth*4)-2)*gridSize-2, ((numPosHeight*2)-2)*gridSize);
      }
    }
    if (keyCode == UP) {
      y = y - 15;
      if (y <= 0) {
        y = 0;
        stroke(255, 0, 0, 90);
        line(0, 1, ((numPosWidth*4)-2)*gridSize, 1);
      }
    }
    if (keyCode == DOWN) {
      y = y + 15;
      if (y >= ((numPosHeight*2)-2)*gridSize-height) {
        y = ((numPosHeight*2)-2)*gridSize-height;
        stroke(255, 0, 0, 90);
        line(0, ((numPosHeight*2)-2)*gridSize-2, ((numPosWidth*4)-2)*gridSize, ((numPosHeight*2)-2)*gridSize-2);
      }
    }
  }
}
