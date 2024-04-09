import processing.sound.*;
import controlP5.*;

Scene[] scenes;
int currentScreen = 1;
boolean [] keys = new boolean[128];

void setup () {
   frameRate(60);
   size(800, 600);
   scenes = new Scene[]{new Menu(0), new Game(1)};
}

void draw() {
  scenes[currentScreen].onDraw();
}

void mouseClicked() {
  scenes[currentScreen].onClick();
}

void keyPressed(){
  keys[key] = true;
  scenes[currentScreen].onKeyPressed(keys);
}

void keyReleased() {
  keys[key] = false;
  scenes[currentScreen].onKeyReleased(keys);
}
