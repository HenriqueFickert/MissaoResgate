import processing.sound.*;
import controlP5.*;

Scene[] scenes;
int currentScreen = 0;

final int LEFT_ARROW = 0;
final int RIGHT_ARROW = 1;
boolean [] keys = new boolean[2];

final int screenHeight = 800, screenWidth = 600;

ControlP5 cp5;
public Ranking ranking;

PFont font;


void setup () {
  frameRate(60);
  size(600, 800);
  cp5 = new ControlP5(this);
  ranking = new Ranking();
  scenes = new Scene[]{new Menu(0), new Game(1)};
  font = loadFont("ArialMT-15.vlw");
}

void draw() {
  scenes[currentScreen].onDraw();
}

void mouseClicked() {
  scenes[currentScreen].onClick();
}

void keyPressed() {
  if (keyCode == LEFT) keys[LEFT_ARROW] = true;
  if (keyCode == RIGHT) keys[RIGHT_ARROW] = true;
  scenes[currentScreen].onKeyPressed(keys);
}

void keyReleased() {
  if (keyCode == LEFT) keys[LEFT_ARROW] = false;
  if (keyCode == RIGHT) keys[RIGHT_ARROW] = false;
  scenes[currentScreen].onKeyReleased(keys);
}

public float getMiddleScreenX(int size) {
  return (width - size) / 2;
}

public float getMiddleScreenY(int size) {
  return (height - size) / 2;
}
