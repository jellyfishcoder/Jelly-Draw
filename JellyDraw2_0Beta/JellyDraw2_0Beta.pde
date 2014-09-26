//Jelly-Draw 2.0 Beta
//By Alexander Pope
//Control P5 Library\\

//For extra windows
import java.awt.Frame;
import java.awt.BorderLayout;

import controlP5.*;

ControlP5 colorControl;  //make a controller for color variable
Accordion accordion;     //make a controller for the accordian menu's
//PFont Variable\\\
PFont font;

// Main Variables \\
color sc;   //stroke color
int sw;     //stroke weight
int mx, my; //mouse x and y

// Variables for Sliders \\
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
  colorControl.controller("GREEN").setColorForeground(#00FF00);
  colorControl.controller("GREEN").setColorActive(#00FF00);
  colorControl.controller("GREEN").setColorLabel(#00FF00);

  //Blue slider
  colorControl.addSlider("BLUE", 0, 255, 0, 585, 15, 255, 10);
  colorControl.controller("BLUE").setColorForeground(#0000FF);
  colorControl.controller("BLUE").setColorActive(#0000FF);
  colorControl.controller("BLUE").setColorLabel(#0000FF);

  //Opacity slider
  colorControl.addSlider("OPACITY", 0, 255, 255, 5, 30, 255, 10);
  colorControl.controller("OPACITY").setColorLabel(#000000);

  //Stroke size slider
  colorControl.addSlider("BRUSH", 1, 50, 1, 900, 15, 100, 10);
  colorControl.controller("BRUSH").setColorLabel(#000000);
  
  //Erase Button
  colorControl.addToggle("ERASE", false, 300, 30, 10, 10);
  colorControl.controller("ERASE").setColorLabel(#000000);
  
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

/* Show Mouse Coords \\
 void coords() {
 //Get Mouse Coordinants
 int mx = mouseX;
 int my = mouseY;
 //Draw white rectangle to cover old text
 strokeWeight(1);
 stroke(255);
 fill(255);
 rect(1049, 699, 1100, 700, 7);
 //Make String to Print
 String mxy = mx + ", " + my;
 //Print Text String
 textFont(font, 14);
 fill(0);
 text(mxy, 1000, 695);
 }
 */
