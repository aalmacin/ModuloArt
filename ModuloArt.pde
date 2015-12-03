final int SIZE = 600;
final int HALF_SIZE = SIZE / 2;
final float BOX_SIZE = sqrt(SIZE);
final float ORIGIN = HALF_SIZE;
final int MAX = round(pow(SIZE, 0.25));


ArrayList<ArrayList> shapeData = new ArrayList<ArrayList>();
ArrayList<ArrayList> colorData = new ArrayList<ArrayList>();

void setup() {
  // Constant ang mas maganda kaso ayaw ng processing
  size(600, 600);
 // background(#7fff00);
  
  //createGrids();
  
  createModuloData();
}

void reshuffle() {
  shapeData.add(shapeData.remove(0));
  colorData.add(colorData.remove(0));
}

void createModuloData() {
  shapeData = new ArrayList<ArrayList>();
  colorData = new ArrayList<ArrayList>();
  for(int i = 0; i < MAX; i++) {
    ArrayList<Integer> colors = new ArrayList<Integer>();
    colors.add(floor(random(0, 255)));
    colors.add(floor(random(0, 255)));
    colors.add(floor(random(0, 255)));
    
    // Stroke
    colors.add(floor(random(0, 255)));
    colors.add(floor(random(0, 255)));
    colors.add(floor(random(0, 255)));
    
    colorData.add(colors);
    
    ArrayList<Float> shape = new ArrayList<Float>();
    shape.add(random(0, 100) / 100); // x1
    shape.add(random(50, 100) / 100); // x2
    shape.add(random(0, 100) / 100); // y1
    shape.add(random(50, 100) / 100); // y2
    shape.add(random(0, 1));
    
    shapeData.add(shape);
  }
  
  // x + (width * 0.10)
  bezier(0, 0, 30, 30, 20, 50, 100, 100);
}

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
  
  
  for(int vCount = 1; vCount <= MAX; vCount++) {
    currentX = 0;
    
    float currentBoxHeight = 0;
    for(int hCount = 1; hCount <= MAX; hCount++) {
      int i = hCount - 1;
      float currentBoxWidth = 0;
      
      currentBoxWidth = hCount * operations[0] * BOX_SIZE;
      currentBoxHeight = vCount * operations[1] * BOX_SIZE;
      float quadX = ORIGIN + (operations[0] * currentX);
      float quadY = ORIGIN + (operations[1] * currentY);
      
      ArrayList<Integer> currentColor = colorData.get(i);
      fill(currentColor.get(0), currentColor.get(1), currentColor.get(2));
      noStroke();
      rect(quadX, quadY, currentBoxWidth, currentBoxHeight);
      
      ArrayList<Float> currentShape = shapeData.get(i);
      
      float x1 = quadX;
      float y1 = quadY;
      float x2 = quadX + (currentBoxWidth * currentShape.get(0));
      float y2 = quadY + (currentBoxHeight * currentShape.get(1));
      float x3 = quadX + (currentBoxWidth * currentShape.get(2));
      float y3 = quadY + (currentBoxHeight * currentShape.get(3));
      
      if (currentShape.get(4) == 1) {
        x1 = quadX + currentBoxWidth;
        y1 = quadY + currentBoxHeight;
      }
      
      fill(currentColor.get(3), currentColor.get(4),  currentColor.get(5));
      beginShape();
      vertex(quadX, quadY);
      vertex(quadX + currentBoxWidth, quadY + currentBoxHeight);
      bezierVertex(x2, y2, x3, y3, x1, y1);
      endShape(CLOSE);
      
      currentX += (currentBoxWidth * operations[0]);
    }
    currentY += (currentBoxHeight * operations[1]);
    reshuffle();
  }
}

void mouseClicked() {
  createModuloData();
}

void keyPressed() {
  createModuloData();
}

void draw() {
  if (keyPressed) {
    if (key == 's' || key == 'S') {
      saveFrame("Modulo-Art" + year() + month() + day() + hour() + minute() + second() + millis() + ".png");
    }
  }
  
  createQuadrant(1);
  createQuadrant(2);
  createQuadrant(3);
  createQuadrant(4);
}