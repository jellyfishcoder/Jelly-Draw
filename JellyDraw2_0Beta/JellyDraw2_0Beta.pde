//Jelly-Draw 2.0 Beta
//By Alexander Pope



//For extra windows
import java.awt.Frame;
import java.awt.BorderLayout;
//For GUI
import controlP5.*;

//Add private controller
ControlP5 colorControl;

//PFont Variable
PFont font;

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
int ERASE;

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
  colorControl.addSlider("BRUSH", 1, 50, 1, 900, 15, 100, 10);
  colorControl.getController("BRUSH").setValue(1);
  colorControl.controller("BRUSH").setColorLabel(#000000);
  
  //Erase Button
  colorControl.addToggle("ERASE", false, 300, 30, 10, 10);
  colorControl.controller("ERASE").setColorLabel(#000000);
  
  //Save Text Feild
}

/*.Repeat stuff in.*\
\*..draw function..*/
void draw() {
  clearMenu();
  
  //Set color and brush variables
  
  sc = color(RED, GREEN, BLUE, OPACITY); 
  sw = BRUSH;
  
  //Draw example of selected brush and paint
  stroke(sc);
  strokeWeight(BRUSH);
  point(1050, 50);
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

// Update Mouse Coords \\
void mouseMoved() {
  //coords();
}

// Change Color or Save \\
void keyPressed() {
  if (key == 'S' || key == 's') {
    save("yourPic.tif");
  }
}
// Clear Menu \\
void clearMenu() {
  stroke(0);
  strokeWeight(1);
  fill(255);
  rect(0, 0, 1100, 42.5);
  strokeWeight(51);
  stroke(255);
  point(1050, 50);
}


