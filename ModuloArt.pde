final int WINDOW_SIZE = 400;
final int HALF_SIZE = WINDOW_SIZE / 2;

int width, height;
float x, y;
// Bumubuo ng mga kahon
void createModuloArt() {
}

void init() {
  width = 0;
  height = 0;
  x = 0;
  y = 0;
}

void setup() {
  // Constant ang mas maganda kaso ayaw ng processing
  size(400, 400);
  init();
}

void draw() {
  for(int i=1; i <= 4; i++) {
    // 400^1/4
    float relativeWidth = pow(WINDOW_SIZE, 0.25);
    float relativeHeight = pow(WINDOW_SIZE, 0.25);
    
    relativeWidth *= i;
    relativeHeight *= i;
    
    float relativeWidthHalfSize = relativeWidth / 2;
    float relativeHeightHalfSize = relativeHeight / 2;
    
    x = HALF_SIZE - relativeWidthHalfSize;
    y = HALF_SIZE - relativeHeightHalfSize;
    
    rect(x, y, relativeWidth, relativeHeight);
  }
}