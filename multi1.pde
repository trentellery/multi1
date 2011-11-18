import org.gicentre.utils.multisketch.*;


Bird[] b = new Bird[300];

class Bird {
  float posX;
  float posY;
  float speedX;
  float speedY;
  float r;
  float g;
  float b;
  

  Bird() {
    posX = random (-400, 50);
    posY = random (750, 1150);
    speedY = 0.1;
//    r = random (0,255);
//    g = random (0,255);
//    b = random (0,255);
  }

  void displayFlock() {
    stroke(0);
    fill(255);
    triangle(posX, posY, posX+10, posY, posX+10, posY+10);
  }  

  void moveFlock() {
    posX+=speedX;
    posY+=speedY;

    //"adding gravity"
    //speed Y grows all the time (as it goes up, the number is negative so it slows down. as it goes down speed increases)
    speedY-=0.1;
    speedX+=0.1;
  }
  // shape moves from bottom left to top right
}


void setup() {
  size(600,350);
  background(0);
  smooth();
  frameRate(10);
  //giving the i a value through the Bird class
  for (int i = 0; i < b.length; i++) {
    b[i] = new Bird();
    
    
  }
    
  PopupWindow win = new PopupWindow(this,new AnotherSketch());
  win.setVisible(true);
  
}
 void draw(){
  if (millis() > 1000){
  background(255);
  //start at 0, as long as i < length of array, execute code, then add 1 to i
  for (int i = 0; i < b.length; i++) {
    //[i] = element i of the array "birds"
    b[i].displayFlock();
    b[i].moveFlock();
    }
  }
}


