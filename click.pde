void click() {
  for (int k = 0; k < numHeight; k++) {
    for (int j = 0; j < layerNum; j++) {
      for (int i = k*numWidth/2; i < (k+1)*numWidth/2; i++) {
        if (dist(newMouseX, newMouseY, positions[i].posX, positions[i].posY) < gridSize ) {
          if (antiSamePos[i] == true) {
            positions[i].quadColor = color(255, 0, 0, 3);
          } else {
            positions[i].quadColor = color(0, 255, 0, 3);
          }
          if (mousePressed && (mouseButton == LEFT) && ui.clicked[j] && a && antiSamePos[i] == false) {
            posData[i][j] = true;
          }
          if (mousePressed && (mouseButton == RIGHT) && mouseY < height - ui.uiHeight && posData[i][j] == true) {
            posData[i][j] = false;
            antiSamePos[i] = false;
          }
        }

        if (posData[i][j] == true) {
          interval(j);
          image(layer[j], positions[i].posX+intervalX, positions[i].posY+intervalY);
          antiSamePos[i] = true;
        }
      }
    }
  }

  if ((ui.posX-(ui.uiWidth/2)+350 < mouseX && mouseX < ui.uiWidth && ui.posY-(ui.uiHeight/2)-50 < mouseY && mouseY < ui.posY-(ui.uiHeight/2))|| mouseY < height - ui.uiHeight - 50) {
    a = true;
  } else {
    a = false;
  }
}
