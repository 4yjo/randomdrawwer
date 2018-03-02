//This mini program creates three arrays filled with random values. Then it 
//takes some of these numbers and connects them to create shapes. The outlines 
//of the shapes are not visible due to the noStroke call; they are filled with
//random color.
//To learn more about processing see https://processing.org
//To be able to run this programm you need to install processing, to run it 
//from the commandline you need to install processing-java on top.

//Due to the large size of the sketch you may need to 'increase max available
//memory' in preferences. Otherwise just change the size (line 21)

PGraphics pg;

//create three arrays with same lenght (to pick random coordinates later)
int array_length = int (random(3,100)); 
int[] xPosition = new int[array_length];
int[] yPosition = new int[array_length];
int[] zPosition = new int[array_length];

void setup(){
  size(1600,1200,P3D);
  pg = createGraphics(400,200);
  
  //fill arrays with random values
  for (int i=0; i<array_length; i++){
  xPosition[i] = int(random(width));}
  
  for (int j=0; j<array_length; j++){
  yPosition[j] = int(random(height));}
  
  for (int k=0; k<array_length; k++){
  zPosition[k] = int(random(1000));}
}

void draw(){
  noLoop();
  int counter=0;
  
  //setting color values for rgb color mode
  int r = int(random(255)); //red color
  int b = int(random(255)); //blue color
  int g = int(random(255)); //green color

  //start drawing 
    pg.beginDraw();
    background(255); //white background
    noStroke();  //invisible outlines
    fill(r,g,b,100); //combine color values from above + alpha 100
    
    //draws curvy lines between points, each defined by x,y,z Position. 
    //As the number of positions varies with array_length and random_factor it
    //is possible to have too less positions to create a shape.
    beginShape();
    while (counter<array_length){
    curveVertex(xPosition[counter], yPosition[counter], zPosition[counter]);
    int random_factor = int(random(10));
    counter += random_factor;}
    
  endShape();
  pg.endDraw();
  save("output.png"); //saves output as png in same directory 
  exit(); //close window with drawing output directly
}