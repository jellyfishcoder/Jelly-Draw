//Jelly-Draw 2.0 Beta
//By Alexander Pope

//For GUI
import controlP5.*;

//Add private controller
ControlP5 colorControl;

//Fonts and Images
PFont font;
PImage photo;

// Main Variables
color sc;   //stroke color
int sw;     //stroke weight
int mx, my; //mouse x and y

// Variables for Sliders
int RED;
int GREEN;
int BLUE;
int BRUSH;
int OPACITY;
int ERASER;
int SAVE;

/*..Run setup..*\
\*function once*/
void setup() {
  //Set main drawing window size and background
  size(1100, 700);
  background(#FFFFFF);
  
  //Change Rectangle Mode
  rectMode(CORNERS);
  
  //Setup Font
  font = loadFont("SansSerif-14.vlw");
  
  /*.Color.*\
  \*Control*/
  colorControl = new ControlP5(this);

  //Red slider
  colorControl.addSlider("RED", 0, 255, 0, 5, 15, 255, 10);
  colorControl.getController("RED").setValue(0);
  colorControl.controller("RED").setColorForeground(#FF0000);
  colorControl.controller("RED").setColorActive(#FF0000);
  colorControl.controller("RED").setColorLabel(#FF0000);
  
  //Green slider
  colorControl.addSlider("GREEN", 0, 255, 0, 295, 15, 255, 10);
  colorControl.getController("GREEN").setValue(0);
  colorControl.controller("GREEN").setColorForeground(#00FF00);
  colorControl.controller("GREEN").setColorActive(#00FF00);
  colorControl.controller("GREEN").setColorLabel(#00FF00);

  //Blue slider
  colorControl.addSlider("BLUE", 0, 255, 0, 585, 15, 255, 10);
  colorControl.getController("BLUE").setValue(0);
  colorControl.controller("BLUE").setColorForeground(#0000FF);
  colorControl.controller("BLUE").setColorActive(#0000FF);
  colorControl.controller("BLUE").setColorLabel(#0000FF);

  //Opacity slider
  colorControl.addSlider("OPACITY", 0, 255, 255, 5, 30, 255, 10);
  colorControl.getController("OPACITY").setValue(255);
  colorControl.controller("OPACITY").setColorLabel(#000000);

  //Stroke size slider
  colorControl.addSlider("BRUSH", 1, 50, 1, 895, 15, 100, 10);
  colorControl.getController("BRUSH").setValue(1);
  colorControl.controller("BRUSH").setColorLabel(#000000);
  
  //Erase Button
  colorControl.addToggle("ERASER", false, 300, 30, 10, 10);
  colorControl.controller("ERASER").setColorLabel(#000000);
  
  //Save Text Feild
  colorControl.addTextfield("FILE_NAME", 400, 30, 100, 10);
  colorControl.controller("FILE_NAME").setColorLabel(#000000);
  
  //Save Button
  colorControl.addBang("SAVE", 525, 30, 50, 10);
  colorControl.controller("SAVE").setColorLabel(#000000);
  
  //Load Buttons
  colorControl.addBang("GRASS", 600, 30, 20, 10);
  colorControl.controller("GRASS").setColorLabel(#000000);
  
  colorControl.addBang("GALAXY", 640, 30, 20, 10);
  colorControl.controller("GALAXY").setColorLabel(#000000);
  
  colorControl.addBang("SEA", 680, 30, 20, 10);
  colorControl.controller("SEA").setColorLabel(#000000);
  
  colorControl.addBang("CLEAR", 720, 30, 20, 10);
  colorControl.controller("CLEAR").setColorLabel(#000000);
  
}

/*.Repeat stuff in.*\
\*..draw function..*/
void draw() {
  clearMenu();
  
  //Set color and brush variables
  if(ERASER == 1){
    sc = color(255, 255, 255, OPACITY);
  }
  else{
    sc = color(RED, GREEN, BLUE, OPACITY);
  } 
  sw = BRUSH;
  
  //Draw example of selected brush and paint
  stroke(sc);
  strokeWeight(BRUSH);
  point(1050, 30);
}

// Draw Point \\
void mouseClicked() {
  stroke(sc);
  strokeWeight(BRUSH);
  point(mouseX, mouseY);
}

// Draw Line \\
void mouseDragged() {
  stroke(sc);
  strokeWeight(BRUSH);
  line(pmouseX, pmouseY, mouseX, mouseY);
}

// Clear Menu \\
void clearMenu() {
  stroke(0);
  strokeWeight(1);
  fill(255);
  rect(0, 0, 1100, 60);
  strokeWeight(51);
  stroke(255);
  point(1050, 30);
}

//BANG button \\
void controlEvent(ControlEvent theEvent) {
  if(theEvent.isController()) {
    if(theEvent.controller().name()=="SAVE") {
      print(colorControl.controller("FILE_NAME").getValue()+"jpg");
      save(colorControl.controller("FILE_NAME").getValue()+"jpg");
    }
    if(theEvent.controller().name()=="SEA") {
      photo = loadImage("Sea.jpg");
      photo.resize(1100, 640);
      image(photo, 0, 60);
    }
    if(theEvent.controller().name()=="GRASS") {
      photo = loadImage("Grass.jpg");
      photo.resize(1100, 640);
      image(photo, 0, 60);
    }
    if(theEvent.controller().name()=="GALAXY") {
      photo = loadImage("Galaxy.jpg");
      photo.resize(1100, 640);
      image(photo, 0, 60);
    }
    if(theEvent.controller().name()=="CLEAR") {
      stroke(0);
      strokeWeight(1);
      fill(255);
      rect(0, 60, 1100, 700);
    }
  }
}
