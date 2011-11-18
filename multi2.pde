class AnotherSketch extends EmbeddedSketch {

  class Bird {
    float posX;
    float posY;
    float speedX;
    float speedY;
    float r;
    float g;
    float b;


    Bird() {
      posX = random (-700, 50);
      posY = random (400, 800);
      speedY = 0.1;
      r = 0;
      g = 255;
      b = 0;
    }

    void displayFlock() {
      noFill();
      stroke(r, g, b);
      triangle(posX, posY, posX+10, posY, posX+10, posY+10);
    }  

    void moveFlock() {
      posX+=speedX;
      posY+=speedY;

      speedY-=0.1;
      speedX+=0.1;
      //    
      //    if (posX > width) {
      //      posX -= speedX;
      //      posY -= speedY;
      //      speedY-=1;
      //      speedX+=1;
      //    }

      //"adding gravity"
      //speed Y grows all the time (as it goes up, the number is negative so it slows down. as it goes down speed increases)
    }
  }


  Bird[] b = new Bird[500];

  void setup() {
    size(600, 350);
    background(0);
    smooth();
    frameRate(10);
    //giving the i a value through the Bird class
    for (int i = 0; i < b.length; i++) {
      b[i] = new Bird();
    }

    PopupWindow win = new PopupWindow(this, new AnotherSketch1());
    win.setVisible(true);
  }





  void draw() {
    if (millis() > 500) {
      background(0);
      //start at 0, as long as i < length of array, execute code, then add 1 to i
      for (int i = 0; i < b.length; i++) {
        //[i] = element i of the array "birds"
        b[i].displayFlock();
        b[i].moveFlock();
      }
    }
  }

