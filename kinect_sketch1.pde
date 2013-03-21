import librarytests.*;
import org.openkinect.*;
import org.openkinect.processing.*;


//kinect library object
Kinect kinect;

//this is the kinect class from other tab
KinectTracker tracker;

float deg = 15;
boolean rgb = true;
boolean ir = false;
boolean depth = true;

void setup(){

  size(640,520);
  kinect = new Kinect(this);
  tracker = new KinectTracker();

  
}  

void draw(){
  background(255);
  
  //run the tracking analysis
  tracker.track();
  //show the image
  tracker.display();
  
  //draw the raw location
  PVector v1 = tracker.getPos();
  fill(50,50,250,200);
  noStroke();
  ellipse(v1.x, v1.y, 20, 20);
  
  //draw the 'lerped' location
  PVector v2 = tracker.getLerpedPos();
  fill(100, 250, 50, 200);
  noStroke();
  ellipse(v2.x, v2.y, 20, 20);
  
  
  
 
}

void keyPressed(){
  
  // ******** Tilting the kinect *********
  if (key == CODED){
    if(keyCode == UP){
      deg++;
    }
   else if(keyCode == DOWN){
      deg--;
    }
    deg = constrain(deg,0,30);
    kinect.tilt(deg);
  
  }

}



void stop() {
  kinect.quit();
  super.stop();
}
