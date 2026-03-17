#define PWMPIN 11
#define DIRECTIONPIN 13
#define HALLDISABLE 17
#define DEBUGA 16
#define DEBUGB 18

const float maxSpeed = 8000;
const float minSpeed = 1500;
const float maxPWM = 200;

float pwmMultiplier = maxPWM/maxSpeed;
float pwmOffset = minSpeed * pwmMultiplier;

int pwmPin = PWMPIN;
int dirPin = DIRECTIONPIN;
int hallPin = HALLDISABLE;
int dbg1Pin = DEBUGA;
int dbg0Pin = DEBUGB;
int errCount = 0;
int waitCount = 0;
int dbg1Count = 0;
int dbg0Count = 0;

unsigned long startTime;
unsigned long delayTime = 2500;
/*
String debug0 = "Error within 500 rpm";
String debug1 = "Error between 1k and 1.5k rpm";
String debug2 = "Error between 1.5k and 2k rpm";
String debug3 = "Error over 2k rpm";
*/

String debug0 = "No Current Errors";
String debug1 = "Error: Overcurrent";
String debug2 = "Error: Kickstart";
String debug3 = "Error: Overcurrent and Kickstart";

int targetSpeed = 4000;
bool targetDirection = 0;
bool climbDirection = 1;

/* 
   In release firmware, Debug 0 and Debug 1 communicate spindle speed error to the 328p
 
   Speed Error | Debug 0 | Debug 1
   0k-1k rpm    |    0    |    0
   1k-2k rpm    |    0    |    1
   2k-3k rpm    |    1    |    0
   3k+   rpm    |    1    |    1
*/

void setup() {
  pinMode(pwmPin, OUTPUT); // Spindle Enable and PWM
  pinMode(dirPin, OUTPUT); // Spindle Direction
  //pinMode(hallPin, OUTPUT); // Spindle Hall Disable

  pinMode(dbg0Pin, INPUT_PULLUP); // Debug 0
  pinMode(dbg1Pin, INPUT_PULLUP); // Debug 1

  Serial.begin(115200);

 // digitalWrite(hallPin, 1);
  
  setDirection(targetDirection);
  setTargetSpeed(targetSpeed);
}

void generateInterrupt(){
  setDirection(!targetDirection);
  setDirection(targetDirection);  
}
void setTargetSpeed(int target){
  long pwmTarget = target * pwmMultiplier;
  pwmTarget = pwmTarget + pwmOffset;
  analogWrite (pwmPin, pwmTarget);
  //Serial.print("Set speed to ");
  //Serial.println(target);
  //Serial.println(pwmTarget);
}

void setDirection(int target){
  String dirStr;
  
  if(target){dirStr = "Clockwise";}
  else {dirStr = "Counter Clockwise";}
  
  digitalWrite(dirPin, target);
  //Serial.print("Set direction to ");
  //Serial.println(dirStr);
}

void readError(){
  String errorMessage;
  static String prevError;
  
  bool err1 = digitalRead(dbg1Pin);
  bool err0 = digitalRead(dbg0Pin);

  dbg1Count = dbg1Count + err1;
  dbg0Count = dbg0Count + err0;

  if(err1 == 0 && err0 == 0){errorMessage = debug0;}
  else if(err1 == 0 && err0 == 1){errorMessage = debug1;}
  else if(err1 == 1 && err0 == 0){errorMessage = debug2;}
  else if(err1 == 1 && err0 == 1){errorMessage = debug3;}

  if (errorMessage != prevError){
    Serial.println(errorMessage);
    Serial.print(" Count: (");
    Serial.print(dbg0Count);
    Serial.print(", ");
    Serial.print(dbg1Count);
    Serial.println(")");
  }
  
  prevError = errorMessage;
}

void speedChangeLoop(){
  if(climbDirection){
    targetSpeed = targetSpeed + 500;
    if(targetSpeed >= maxSpeed){      
      climbDirection = false;
    }
  } else if(!climbDirection){
    targetSpeed = targetSpeed - 500;
    if(targetSpeed <= minSpeed){      
      climbDirection = true;
      targetDirection = !targetDirection;
    }
  }
  setTargetSpeed(targetSpeed);
  //setDirection(targetDirection);  
}

void changeAtTarget(){
  if(digitalRead(dbg1Pin)+digitalRead(dbg0Pin) == 0){
    waitCount++;
    if(waitCount > 7){
      speedChangeLoop();
      waitCount = 0;
    }
  }
  else{
    errCount++;
    Serial.print("Errors: ");
    Serial.println(errCount);
  }  
}

void rapidReverse(){
  setTargetSpeed(maxSpeed);
  targetDirection = !targetDirection;
  setDirection(targetDirection);
  delay(5000);
}

void loop() {
  readError();
  if(millis() - startTime > delayTime){
    startTime = millis();
    speedChangeLoop();
    //Serial.println(digitalRead(dbg1Pin)+digitalRead(dbg0Pin));
    //changeAtTarget();
    //rapidReverse();
    generateInterrupt();
  }
}
