final int SIZE = 400;
final int HALF_SIZE = SIZE / 2;
final float BOX_SIZE = sqrt(SIZE);
final float ORIGIN = HALF_SIZE;

// Bumubuo ng mga kahon
void createModuloArt() {
}

void createGrids() {
  float fX = 0;
  float fY = 0;
  for(int i = 1; i <= SIZE; i++) {
    if(fX == 0 || fX == SIZE - BOX_SIZE || fY == 0 || fY == SIZE - BOX_SIZE) {
      fill(#AA0000);
    } else {
      fill(#AADD00);
    }
    rect(fX, fY, BOX_SIZE, BOX_SIZE);
    
    fX += BOX_SIZE;
    if(i % BOX_SIZE == 0) {
      fY+=BOX_SIZE;
      fX = 0;
    } 
  }
}

void createQuadrant(int quadNum) {
  float x = 0;
  float y = 0;
  fill(#FFFFFF);
  for(int _y=1; _y <= 4; _y++) {
    float ySize = 0;
    float xSize = 0;
    x = 0;
    for(int _x=1; _x <= 4; _x++) {
      xSize = _x * BOX_SIZE;
      ySize = _y * BOX_SIZE;
      
      
      float quadX = 0;
      float quadY = 0;
      switch(quadNum) {
        case 1:  
          quadX = ORIGIN+x;
          quadY = ORIGIN+y;
        break;
        case 2:
          quadX = ORIGIN+x;
          quadY = ORIGIN-y;
        break;
        case 3:
          quadX = ORIGIN-x;
          quadY = ORIGIN-y;
        break;
        case 4:
          quadX = ORIGIN-x;
          quadY = ORIGIN+y;
        break;
      }
      
      rect(quadX, quadY, xSize, ySize);
      x += xSize;
    }
    y += ySize;
  }
}

void setup() {
  // Constant ang mas maganda kaso ayaw ng processing
  size(400, 400);
}

void draw() {
  background(#7fff00);
  
  createGrids();
  
  //createQuadrant(1);
  createQuadrant(2);
  //createQuadrant(2);
  createQuadrant(2);
}