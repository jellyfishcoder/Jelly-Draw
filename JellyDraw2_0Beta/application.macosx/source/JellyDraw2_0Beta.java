import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class JellyDraw2_0Beta extends PApplet {

//Jelly-Draw 2.0 Beta
//By Alexander Pope

//For GUI


//Add private controller
ControlP5 colorControl;

//Fonts and Images
PFont font;
PImage photo;

// Main Variables
int sc;   //stroke color
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

DropdownList l;

/*..Run setup..*\
\*function once*/
public void setup() {
  //Set main drawing window size and background
  size(1100, 700);
  background(0xffFFFFFF);
  
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
  colorControl.controller("RED").setColorForeground(0xffFF0000);
  colorControl.controller("RED").setColorActive(0xffFF0000);
  colorControl.controller("RED").setColorLabel(0xffFF0000);
  
  //Green slider
  colorControl.addSlider("GREEN", 0, 255, 0, 295, 15, 255, 10);
  colorControl.getController("GREEN").setValue(0);
  colorControl.controller("GREEN").setColorForeground(0xff00FF00);
  colorControl.controller("GREEN").setColorActive(0xff00FF00);
  colorControl.controller("GREEN").setColorLabel(0xff00FF00);

  //Blue slider
  colorControl.addSlider("BLUE", 0, 255, 0, 585, 15, 255, 10);
  colorControl.getController("BLUE").setValue(0);
  colorControl.controller("BLUE").setColorForeground(0xff0000FF);
  colorControl.controller("BLUE").setColorActive(0xff0000FF);
  colorControl.controller("BLUE").setColorLabel(0xff0000FF);

  //Opacity slider
  colorControl.addSlider("OPACITY", 0, 255, 255, 5, 30, 255, 10);
  colorControl.getController("OPACITY").setValue(255);
  colorControl.controller("OPACITY").setColorLabel(0xff000000);

  //Stroke size slider
  colorControl.addSlider("BRUSH", 1, 50, 1, 895, 15, 100, 10);
  colorControl.getController("BRUSH").setValue(1);
  colorControl.controller("BRUSH").setColorLabel(0xff000000);
  
  //Erase Button
  colorControl.addToggle("ERASER", false, 300, 30, 10, 10);
  colorControl.controller("ERASER").setColorLabel(0xff000000);
  
  //Save Text Feild
  colorControl.addTextfield("FILE_NAME", 400, 30, 100, 10);
  colorControl.controller("FILE_NAME").setColorLabel(0xff000000);
  
  //Save Button
  colorControl.addBang("SAVE", 525, 30, 100, 10);
  colorControl.controller("SAVE").setColorLabel(0xff000000);
  
  //Dropdown list
  l = colorControl.addDropdownList("LOAD_FILE", 650, 40, 70, 30);
  l.addItem("Sea", 1);
  l.addItem("Grass", 2);
  l.addItem("Galaxy", 3);
  l.captionLabel().style().marginTop = 0;
  l.captionLabel().style().marginLeft = 3;
}

/*.Repeat stuff in.*\
\*..draw function..*/
public void draw() {
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
public void mouseClicked() {
  stroke(sc);
  strokeWeight(BRUSH);
  point(mouseX, mouseY);
}

// Draw Line \\
public void mouseDragged() {
  stroke(sc);
  strokeWeight(BRUSH);
  line(pmouseX, pmouseY, mouseX, mouseY);
}

// Clear Menu \\
public void clearMenu() {
  stroke(0);
  strokeWeight(1);
  fill(255);
  rect(0, 0, 1100, 60);
  strokeWeight(51);
  stroke(255);
  point(1050, 30);
}

//BANG button \\
public void controlEvent(ControlEvent theEvent) {
  if(theEvent.isController()) {
    if(theEvent.controller().name()=="SAVE") {
      print(colorControl.controller("FILE_NAME").getValue()+"jpg");
      save(colorControl.controller("FILE_NAME").getValue()+"jpg");
    }
  }
  if (theEvent.isGroup()) {
    String byby = ""+theEvent.getGroup();
    if(byby == ""+"LOAD_FILE") {
      convertI(""+theEvent.getGroup().getValue());
    }
  }
}

public void convertI(String number){
  if(number == "1"){
      photo = loadImage("Sea.jpg");
      photo.resize(1100, 640);
      image(photo, 0, 60);
  }
  if(number == "2"){
      photo = loadImage("Grass.jpg");
      photo.resize(1100, 640);
      image(photo, 0, 60);
  }
  else{
      photo = loadImage("Galaxy.jpg");
      photo.resize(1100, 640);
      image(photo, 0, 60);
  }
}


  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "JellyDraw2_0Beta" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
