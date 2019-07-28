float camX = 180, camY = -180, camZ = 200;
float degXY = 0, degYZ = 0, degZX = 0;
float speed = 12;
int count = 0;

float[][] poly5 ={
  {1, 1, 1, -1/sqrt(5)},
  {1, -1, -1, -1/sqrt(5)},
  {-1, 1, -1, -1/sqrt(5)},
  {-1, -1, 1, -1/sqrt(5)},
  {0, 0, 0, sqrt(5)-1/sqrt(5)}
};

int[][] poly5_sides = {
  {0,1},
  {0,2},
  {0,3},
  {0,4},
  {1,2},
  {1,3},
  {1,4},
  {2,3},
  {2,4},
  {3,4}
};

float[][] poly8 ={
  {-1,-1,-1,-1},
  {-1,-1,-1,1},
  {-1,-1,1,-1},
  {-1,1,-1,-1},
  {1,-1,-1,-1},
  {-1,-1,1,1},
  {-1,1,-1,1},
  {1,-1,-1,1},
  {-1,1,1,-1},
  {1,-1,1,-1},
  {1,1,-1,-1},
  {-1,1,1,1},
  {1,-1,1,1},
  {1,1,-1,1},
  {1,1,1,-1},
  {1,1,1,1},
};

int[][] poly8_sides = {
  {0,1},
  {0,2},
  {0,3},
  {0,4},
  {1,5},
  {1,6},
  {1,7},
  {2,5},
  {2,8},
  {2,9},
  {3,6},
  {3,8},
  {3,10},
  {4,7},
  {4,9},
  {4,10},
  {15,14},
  {15,13},
  {15,12},
  {15,11},
  {12,5},
  {12,7},
  {12,9},
  {11,5},
  {11,6},
  {11,8},
  {13,6},
  {13,7},
  {13,10},
  {14,8},
  {14,9},
  {14,10},
};

float[][] poly16 = {
  {1, 0, 0, 0},
  {-1, 0, 0, 0},
  {0, 1, 0, 0},
  {0, -1, 0, 0},
  {0, 0, 1, 0},
  {0, 0, -1, 0},
  {0, 0, 0, 1},
  {0, 0, 0, -1}
};

int[][] poly16_sides = {
  {0,2},
  {0,3},
  {0,4},
  {0,5},
  {0,6},
  {0,7},
  {1,2},
  {1,3},
  {1,4},
  {1,5},
  {1,6},
  {1,7},
  {2,4},
  {2,5},
  {2,6},
  {2,7},
  {3,4},
  {3,5},
  {3,6},
  {3,7},
  {4,6},
  {4,7},
  {5,6},
  {5,7},
  {6,7}
};

float[][] poly5_cube = {
  {-1,-1,-1,-1,-1},
  {-1,-1,-1,1,-1},
  {-1,-1,1,-1,-1},
  {-1,1,-1,-1,-1},
  {1,-1,-1,-1,-1},
  {-1,-1,1,1,-1},
  {-1,1,-1,1,-1},
  {1,-1,-1,1,-1},
  {-1,1,1,-1,-1},
  {1,-1,1,-1,-1},
  {1,1,-1,-1,-1},
  {-1,1,1,1,-1},
  {1,-1,1,1,-1},
  {1,1,-1,1,-1},
  {1,1,1,-1,-1},
  {1,1,1,1,-1},
  {-1,-1,-1,-1,1},
  {-1,-1,-1,1,1},
  {-1,-1,1,-1,1},
  {-1,1,-1,-1,1},
  {1,-1,-1,-1,1},
  {-1,-1,1,1,1},
  {-1,1,-1,1,1},
  {1,-1,-1,1,1},
  {-1,1,1,-1,1},
  {1,-1,1,-1,1},
  {1,1,-1,-1,1},
  {-1,1,1,1,1},
  {1,-1,1,1,1},
  {1,1,-1,1,1},
  {1,1,1,-1,1},
  {1,1,1,1,1},
};


void setup() {
  size(500, 500, P3D);
  background(0);
  noFill();
}

void draw() {
  background(0);

  show();
  axis3(500);
  stroke( 0, 255, 0 );
  
  // 4d
  //draw_poly(poly5, poly5_sides, 200);
  //for (float[] point: poly5){
  //  rotationZW(point, 1);
  //  rotationXY(point, 1);
  //}
  
  //draw_poly(poly8, poly8_sides, 100);
  //for (float[] point: poly8){
  //  rotationZW(point, 1);
  //  rotationXY(point, 1);
  //}
  
  draw_poly(poly16, poly16_sides, 200);
  for (float[] point: poly16){
    rotationZW(point, 1);
    rotationXY(point, 1);
  }
}

void draw_poly(float[][] poly, int[][] sides, int size){
  strokeWeight(1);
  for (int[] side: sides) {
    float w = size / (2.0 - poly[side[0]][3]);
    float v = size / (2.0 - poly[side[1]][3]);
    line(-w*poly[side[0]][0], -w*poly[side[0]][1], -w*poly[side[0]][2],
         -v*poly[side[1]][0], -v*poly[side[1]][1], -v*poly[side[1]][2]);
  }
  strokeWeight(10);
  for (float[] point: poly){
    float w = size / (2.0 - point[3]);
    point(-w*point[0], -w*point[1], -w*point[2]);
  }
}

void draw_cube(float[][] poly, int size){
  strokeWeight(10);
  for (float[] point: poly) {
    float w = size / (2.0 - point[3]);
    point(-w*point[0], -w*point[1], -w*point[2]);
  }
}

float[] rotationXY(float[] point, int deg) {
  float[][] rotXY =
    {{1,0,0,0},
    {0,1,0,0},
    {0,0,cos(radians(deg)),-sin(radians(deg))},
    {0,0,sin(radians(deg)),cos(radians(deg))}};
  degXY = (degXY + deg) % 360;
  return matrix_product(point, rotXY);
}

float[] rotationYZ(float[] point, int deg) {
  float[][] rotYZ = {
    {cos(radians(deg)),0,0,sin(radians(deg))},
    {0,1,0,0},
    {0,0,1,0},
    {-sin(radians(deg)),0,0,cos(radians(deg))}};
  degYZ = (degYZ + deg) % 360;
  return matrix_product(point, rotYZ);
}

float[] rotationZX(float[] point, int deg) {
  float[][] rotZX =
    {{1,0,0,0},
    {0,cos(radians(deg)),0,-sin(radians(deg))},
    {0,0,1,0},
    {0,sin(radians(deg)),0,cos(radians(deg))}};
  degZX = (degZX + deg) % 360;
  return matrix_product(point, rotZX);
}

float[] rotationXW(float[] point, int deg) {
  float[][] rotXW =
    {{1,0,0,0},
    {0,cos(radians(deg)),-sin(radians(deg)),0},
    {0,sin(radians(deg)),cos(radians(deg)),0},
    {0,0,0,1}};
  //degZX = (degZX + deg) % 360;
  return matrix_product(point, rotXW);
}

float[] rotationZW(float[] point, int deg) {
  float[][] rotZW = {
    {cos(radians(deg)),-sin(radians(deg)),0,0},
    {sin(radians(deg)),cos(radians(deg)),0,0},
    {0,0,1,0},
    {0,0,0,1}};
  //degZX = (degZX + deg) % 360;
  return matrix_product(point, rotZW);
}

float[] matrix_product(float[] point, float[][] rotT) {
  float[] ans = {0,0,0,0};
  int i = 0;
  for (float[] rot: rotT) {
    for (int x = 0; x < 4; x++) {
      ans[i] += point[x]*rot[x];
    }
    i++;
  }
  for (int t = 0;t < 4;t++){
    point[t] = ans[t];
  }
  return point;
}

void axis3(float distance) {
  // 3 axis
  stroke( 255, 0, 0 );
  strokeWeight( 3 );
  line(0, 0, 0,
       distance, 0, 0);
  
  stroke( 0, 255, 0 );
  line(0, 0, 0,
       0, -distance, 0);
  
  stroke( 0, 0, 255 );
  line(0, 0, 0,
       0, 0, distance);
}

void show() {
  if (keyPressed) {
    if (keyCode == LEFT) camX -= speed;
    if (keyCode == RIGHT) camX += speed;
    if (keyCode == UP) camZ -= speed;
    if (keyCode == DOWN) camZ += speed;
    if (key == 'w') camY -= speed;
    if (key == 's') camY += speed;
  }
  camera(camX, camY, camZ, 0, 0, 0, 0, 1.0, 0);
}

void texts() {
  text("degXY " + degXY, 0, 10);
  text("degYZ " + degYZ, 0, 20);
  text("degZX " + degZX, 0, 30);
  text("camX  " + camX, 0, 40);
  text("camY  " + camY, 0, 50);
  text("camZ  " + camZ, 0, 60);
}

class P4DVector {
  float x,y,z,w;
  
  P4DVector(float x, float y, float z, float w) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.w = w;
  }
  
  void connect(P4DVector a, P4DVector b) {
    strokeWeight(1);
    line(-10*a.x, -10*a.y, -10*a.z,
         -10*b.x, -10*b.y, -10*b.z);
  }
  
  float[] matrix_product(float[] point, float[][] rotT) {
    float[] ans = {0,0,0,0};
    int i = 0;
    for (float[] rot: rotT) {
      for (int x = 0; x < 4; x++) {
        ans[i] += point[x]*rot[x];
      }
      i++;
    }
    for (int t = 0;t < 4;t++){
      point[t] = ans[t];
    }
    return point;
  }
}
