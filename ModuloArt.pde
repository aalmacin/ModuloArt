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

// Returns the operations for x and y respectively.
int[] checkQuadrant(int quadNum) {
      int[] operations = new int[2];
       switch(quadNum) {
         case 1:  
           operations[0] = 1;
           operations[1] = -1;
         break;
         case 2:
           operations[0] = -1;
           operations[1] = -1;
         break;
         case 3:
           operations[0] = -1;
           operations[1] = 1;
         break;
         case 4:
           operations[0] = 1;
           operations[1] = 1;
         break;
         default:
           operations[0] = 1;
           operations[1] = 1;
         break;
       }
       return operations;
}

void createQuadrant(int quadNum) {
  float currentX = 0;
  float currentY = 0;
  int[] operations = checkQuadrant(quadNum);
  
  fill(#FFFFFF);
  
  for(int vCount = 1; vCount <= 4; vCount++) {
    currentX = 0;
    float currentBoxHeight = 0;
    for(int hCount = 1; hCount <= 4; hCount++) {
      float currentBoxWidth = 0;
      
      currentBoxWidth = hCount * operations[0] * BOX_SIZE;
      currentBoxHeight = vCount * operations[1] * BOX_SIZE;
      float quadX = ORIGIN + (operations[0] * currentX);
      float quadY = ORIGIN + (operations[1] * currentY);
      println(quadX, currentY);
      
      rect(quadX, quadY, currentBoxWidth, currentBoxHeight);
      
      currentX += (currentBoxWidth * operations[0]);
    }
    currentY += (currentBoxHeight * operations[1]);
  }
  
  
}

void setup() {
  // Constant ang mas maganda kaso ayaw ng processing
  size(400, 400);
  background(#7fff00);
  
  createGrids();
  
  createQuadrant(1);
  createQuadrant(2);
  createQuadrant(3);
  createQuadrant(4);
}

void draw() {
}