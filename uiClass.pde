class uiClass {
  int page;
  int page0Num;
  int page1Num;
  int page2Num;
  int page3Num;
  int page4Num;
  float posX;
  float posY;
  float uiWidth;
  float uiHeight;
  color uiBackground;
  color page0TapColor;
  color page1TapColor;
  color page2TapColor;
  color page3TapColor;
  color page4TapColor;
  color tapOn;
  color tapOff;
  boolean [] clicked= new boolean [layerNum];

  uiClass() {
    posX = width/2;
    posY = 620;
    uiWidth = 1270;
    uiHeight = 190;
    uiBackground = color(255);
    page = 0;
    page0Num = 3;
    page1Num = 4;
    page2Num = 5;
    page3Num = 1;
    page4Num = 3;
    tapOn = color(0, 0, 100);
    tapOff = color(100);
  }

  void display() {
    for (int i = 0 ; i < 5 ; i++) {
      if (mousePressed && posX-(uiWidth/2)+70*i < mouseX && mouseX < posX-(uiWidth/2)+(70*(i+1)) && posY-(uiHeight/2)-50 < mouseY && mouseY < posY-(uiHeight/2)) {
        page = i;
      }
    }

    for (int i = 0; i < layerNum; i++) {
      if (mousePressed && (mouseButton == LEFT) && mouseY > height - ui.uiHeight) {
        clicked[i] = false;
      }
    }
    fill(255);
    strokeWeight(1);
    switch(page) {
    case 0:
      stroke(100);
      beginShape();
      vertex(posX-uiWidth/2+(70*page), posY-(uiHeight/2)-50);
      vertex(posX-uiWidth/2+(70*page), posY-(uiHeight/2));
      vertex(posX-uiWidth/2, posY-uiHeight/2);
      vertex(posX-uiWidth/2, posY+uiHeight/2);
      vertex(posX+uiWidth/2, posY+uiHeight/2);
      vertex(posX+uiWidth/2, posY-uiHeight/2);
      vertex(posX-(uiWidth/2)+(70*(page+1)), posY-uiHeight/2);
      vertex(posX-(uiWidth/2)+(70*(page+1)), posY-(uiHeight/2)-50);
      endShape(CLOSE);

      page0TapColor = tapOn;
      page1TapColor = tapOff;
      page2TapColor = tapOff;
      page3TapColor = tapOff;
      page4TapColor = tapOff;

      for (int i = 0; i < page0Num; i++) {
        image(layer[i], uiWidth*(i+1)/10, posY);

        if ( mousePressed && (mouseButton == LEFT) && dist(mouseX, mouseY, uiWidth*(i+1)/10, posY) < gridSize ) {
          if (clicked[i] == false) {
            clicked[i] = true;
          }
        }
      }
      break;

    case 1:
      stroke(100);
      beginShape();
      vertex(posX-uiWidth/2+(70*page), posY-(uiHeight/2)-50);
      vertex(posX-uiWidth/2+(70*page), posY-(uiHeight/2));
      vertex(posX-uiWidth/2, posY-uiHeight/2);
      vertex(posX-uiWidth/2, posY+uiHeight/2);
      vertex(posX+uiWidth/2, posY+uiHeight/2);
      vertex(posX+uiWidth/2, posY-uiHeight/2);
      vertex(posX-(uiWidth/2)+(70*(page+1)), posY-uiHeight/2);
      vertex(posX-(uiWidth/2)+(70*(page+1)), posY-(uiHeight/2)-50);
      endShape(CLOSE);

      page0TapColor = tapOff;
      page1TapColor = tapOn;
      page2TapColor = tapOff;
      page3TapColor = tapOff;
      page4TapColor = tapOff;

      for (int i = page0Num; i < page0Num+page1Num; i++) {
        image(layer[i], uiWidth*(i+1-page0Num)/10, posY);

        if ( mousePressed && (mouseButton == LEFT) && dist(mouseX, mouseY, uiWidth*(i+1-page0Num)/10, posY) < gridSize ) {
          if (clicked[i] == false) {
            clicked[i] = true;
          }
        }
      }
      break;

    case 2:
      stroke(100);
      beginShape();
      vertex(posX-uiWidth/2+(70*page), posY-(uiHeight/2)-50);
      vertex(posX-uiWidth/2+(70*page), posY-(uiHeight/2));
      vertex(posX-uiWidth/2, posY-uiHeight/2);
      vertex(posX-uiWidth/2, posY+uiHeight/2);
      vertex(posX+uiWidth/2, posY+uiHeight/2);
      vertex(posX+uiWidth/2, posY-uiHeight/2);
      vertex(posX-(uiWidth/2)+(70*(page+1)), posY-uiHeight/2);
      vertex(posX-(uiWidth/2)+(70*(page+1)), posY-(uiHeight/2)-50);
      endShape(CLOSE);

      page0TapColor = tapOff;
      page1TapColor = tapOff;
      page2TapColor = tapOn;
      page3TapColor = tapOff;
      page4TapColor = tapOff;

      for (int i = page0Num+page1Num; i < page0Num+page1Num+page2Num; i++) {
        image(layer[i], uiWidth*(i+1-(page0Num+page1Num))/10, posY);

        if ( mousePressed && (mouseButton == LEFT) && dist(mouseX, mouseY, uiWidth*(i+1-(page0Num+page1Num))/10, posY) < gridSize ) {
          if (clicked[i] == false) {
            clicked[i] = true;
          }
        }
      }
      break;

    case 3:
      stroke(100);
      beginShape();
      vertex(posX-uiWidth/2+(70*page), posY-(uiHeight/2)-50);
      vertex(posX-uiWidth/2+(70*page), posY-(uiHeight/2));
      vertex(posX-uiWidth/2, posY-uiHeight/2);
      vertex(posX-uiWidth/2, posY+uiHeight/2);
      vertex(posX+uiWidth/2, posY+uiHeight/2);
      vertex(posX+uiWidth/2, posY-uiHeight/2);
      vertex(posX-(uiWidth/2)+(70*(page+1)), posY-uiHeight/2);
      vertex(posX-(uiWidth/2)+(70*(page+1)), posY-(uiHeight/2)-50);
      endShape(CLOSE);

      page0TapColor = tapOff;
      page1TapColor = tapOff;
      page2TapColor = tapOff;
      page3TapColor = tapOn;
      page4TapColor = tapOff;

      for (int i = page0Num+page1Num+page2Num; i < page0Num+page1Num+page2Num+page3Num; i++) {
        image(layer[i], uiWidth*(i+1-(page0Num+page1Num+page2Num))/10, posY);

        if ( mousePressed && (mouseButton == LEFT) && dist(mouseX, mouseY, uiWidth*(i+1-(page0Num+page1Num+page2Num))/10, posY) < gridSize ) {
          if (clicked[i] == false) {
            clicked[i] = true;
          }
        }
      }
      break;

    case 4:
      stroke(100);
      beginShape();
      vertex(posX-uiWidth/2+(70*page), posY-(uiHeight/2)-50);
      vertex(posX-uiWidth/2+(70*page), posY-(uiHeight/2));
      vertex(posX-uiWidth/2, posY-uiHeight/2);
      vertex(posX-uiWidth/2, posY+uiHeight/2);
      vertex(posX+uiWidth/2, posY+uiHeight/2);
      vertex(posX+uiWidth/2, posY-uiHeight/2);
      vertex(posX-(uiWidth/2)+(70*(page+1)), posY-uiHeight/2);
      vertex(posX-(uiWidth/2)+(70*(page+1)), posY-(uiHeight/2)-50);
      endShape(CLOSE);

      page0TapColor = tapOff;
      page1TapColor = tapOff;
      page2TapColor = tapOff;
      page3TapColor = tapOff;
      page4TapColor = tapOn;

      for (int i = page0Num+page1Num+page2Num+page3Num; i < page0Num+page1Num+page2Num+page3Num+page4Num; i++) {
        image(layer[i], uiWidth*(i+1-(page0Num+page1Num+page2Num+page3Num))/10, posY);

        if ( mousePressed && (mouseButton == LEFT) && dist(mouseX, mouseY, uiWidth*(i+1-(page0Num+page1Num+page2Num+page3Num))/10, posY) < gridSize ) {
          if (clicked[i] == false) {
            clicked[i] = true;
          }
        }
      }
      break;
    }

    fill(page0TapColor);
    textAlign(CENTER);
    textSize(15);
    text("Road", posX-uiWidth/2 + 35, posY-(uiHeight/2)-15);

    fill(page1TapColor);
    textAlign(CENTER);
    textSize(15);
    text("Apt.", posX-uiWidth/2 + 105, posY-(uiHeight/2)-15);

    fill(page2TapColor);
    textAlign(CENTER);
    textSize(15);
    text("Store", posX-uiWidth/2 + 175, posY-(uiHeight/2)-15);

    fill(page3TapColor);
    textAlign(CENTER); 
    textSize(15);
    text("Nature", posX-uiWidth/2 + 245, posY-(uiHeight/2)-15);

    fill(page4TapColor);
    textAlign(CENTER);
    textSize(15);
    text("Etc.", posX-uiWidth/2 + 315, posY-(uiHeight/2)-15);
  }
}
