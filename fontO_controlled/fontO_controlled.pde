/**
 * Multivalue Read
 * 
 * Read comma separated value from the serial port 
 and change the color of rectangles.
 
 */


import processing.serial.*;  // Import Serial class library
Serial myPort;  // Create object from Serial class

int owidth = 80; //width of O
int oheight = 90; //height of O
int othick = 55; //thickness of O
int odense = 1; //density of points (lower = denser)
int gap = 2;
int layers = (othick/gap);
int[] ocir = new int[layers];
int input;
int spider; //randomness

float val1 = 0;
float val2 = 0;

void setup() 
{
  size(400, 400);

  //for Windows
  //String portName = "COM97"; //change this port the same name as Arduino->Tool->Serial Port
  //for Mac OSX
  String portName = Serial.list()[0]; //the first port

  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n'); // buffer incoming characters until line feed.
}

//serialEvent function is called when incoming character reaches '\n'
void serialEvent(Serial p) {
  String s = "";        // string value received.
  String[] values;      // splitted string values.

  if (p.available() > 0) {  // check number of characters in the serial buffer 
    s = p.readString();   // read string.
    if (s != null) { 
      println("received:"+s);

      values = s.split(",");     // separate values with ',' characters.
      println(values);           

      val1 = float(values[0]);
      val2 = float(values[1]);
    }
  }
}

void draw() {
  smooth();
  background(251-val1,194-val1,66-val1);
  translate(200, 200);
  for (int i=0 ; i<layers ; i++) {
    ocir[i] = int((PI*(oheight+(i*gap)))/odense);
    input = 2;
  }
  stroke(val2);
  noFill();
  for (int i=0 ; i<layers ; i++) {
    for (int j=0; j<ocir[i] ; j++) {
      spider = ((i+11)/input);
      float x = (j*TWO_PI/ocir[i]);
      point(random(-val1,val1)+(owidth+(i*gap))*(sin(x)), random(-val1,val1)+(oheight+(i*gap))*(cos(x)));
    }
  }
}


