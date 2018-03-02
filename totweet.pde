//void setup(){
//  size(640,360);
//  background(51);
//  noStroke();
//  fill(255,0,255);
//  ellipse(150,150,80,80);
//  save("output.png");
//  exit();
//}


PGraphics pg;

//create two arrays with random lenght to create random coordinates later
int array_length = int (random(3,100)); 
int random_factor = int(random(100));
int[] xPosition = new int[array_length];
int[] yPosition = new int[array_length];
int[] zPosition = new int[array_length];

void setup(){
  size(1600,1200,P3D);
  pg = createGraphics(400,200);
  
    //fill arrays with random values
  for (int i=0; i<array_length; i++){
  xPosition[i] = int(random(width));
  }
  
    for (int j=0; j<array_length; j++){
  yPosition[j] = int(random(height));
  }
  
  for (int k=0; k<array_length; k++){
  zPosition[k] = int(random(800));
  }
}


void draw(){
  noLoop();
  int counter=0;
  int r = int(random(255));
  int b = int(random(255));
  int g = int(random(255));

    pg.beginDraw();
    background(255);
    noStroke();
    fill(r,g,b,100);
    beginShape();
    while (counter<array_length){
    curveVertex(xPosition[counter], yPosition[counter], zPosition[counter]);
    int random_factor = int(random(10));
    counter += random_factor;
  }
  endShape();
  pg.endDraw();
  save("output.png");
  exit(); //close window with drawing output on my computer
}