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
PFont smallFont;

void setup () {
  frameRate(60);
  size(600, 800);
  font = createFont("fonts/PoetsenOne-Regular.ttf", 18);
  smallFont = createFont("fonts/PoetsenOne-Regular.ttf", 14);
  cp5 = new ControlP5(this);
  ranking = new Ranking();
  scenes = new Scene[]{new Menu(0), new Game(1)};
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

public void changeScreen(int index){
  currentScreen = index;
  scenes[currentScreen].onInitialized();
}

public float getMiddleScreenX(int size) {
  return (width - size) / 2;
}

public float getMiddleScreenY(int size) {
  return (height - size) / 2;
}
