#include "Arduino_LED_Matrix.h"

ArduinoLEDMatrix matrix;

void setup() {
  Serial.begin(115200);
  matrix.begin();
  pinMode(LED_BUILTIN, OUTPUT);
}

void loop(){
  Serial.println("LED ON");
  digitalWrite(LED_BUILTIN, HIGH);
  matrix.loadFrame(LEDMATRIX_EMOJI_HAPPY);
  delay(500);

  Serial.println("LED OFF");
  digitalWrite(LED_BUILTIN, LOW);
  matrix.loadFrame(LEDMATRIX_EMOJI_SAD);
  delay(500);
}