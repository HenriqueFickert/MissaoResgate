import processing.sound.*;
import controlP5.*;

Scene[] scenes;
int currentScreen = 0;

final int LEFT_ARROW = 0;
final int RIGHT_ARROW = 1;
boolean [] keys = new boolean[2];

final int screenHeight = 800, screenWidth = 600;

ControlP5 cp5;
String filePath = "hiscores.csv";

void setup () {
   frameRate(60);
   size(600, 800);
   cp5 = new ControlP5(this);
   scenes = new Scene[]{new Menu(0), new Game(1)};
}

void draw() {
  scenes[currentScreen].onDraw();
}

void mouseClicked() {
  scenes[currentScreen].onClick();
}

void keyPressed(){
  if (keyCode == LEFT) keys[LEFT_ARROW] = true;
  if (keyCode == RIGHT) keys[RIGHT_ARROW] = true;
  scenes[currentScreen].onKeyPressed(keys);
}

void keyReleased() {
  if (keyCode == LEFT) keys[LEFT_ARROW] = false;
  if (keyCode == RIGHT) keys[RIGHT_ARROW] = false;
  scenes[currentScreen].onKeyReleased(keys);
}
