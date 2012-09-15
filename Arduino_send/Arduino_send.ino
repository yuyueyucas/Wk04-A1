/*
  multivalue Send 
 
  This example code is in the public domain.
 */
 
int value1 = 0;
int value2 = 0;

// the setup routine runs once when you press reset:
void setup() {                
  // initialize the digital pin as an output.

  Serial.begin(9600);
}

// the loop routine runs over and over again forever:
void loop() {

  // read the input on analog pin 0:
  
  value1 = analogRead(A0);
  value2 = analogRead(A1);
  
  value1 = map(value1,0,1023,0,255);
  value2 = map(value2,0,1023,0,255);
   
  // print out comma separated values.
  Serial.print(value1); // send value1
  Serial.print(',');    // insert comma between values
  Serial.print(value2); // send value2
  Serial.print('\n');   // end with line feed

  delay(100);               // wait for a while

}
