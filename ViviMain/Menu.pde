class Menu extends Scene {
  StartButton startbutton;
  Ranking ranking;
  
  boolean askName = true;

  Menu(int sceneId) {
    super(sceneId);
    startbutton = new StartButton(getMiddleScreenX(150), getMiddleScreenY(50));
    ranking = new Ranking();
    
    if (askName)
      ranking.createUsernameInput(getMiddleScreenX(100), getMiddleScreenY(30));
  }

  void onClick()
  {
    if (startbutton.detectMouseCollision())
      startbutton.onClick();
  }

  void onKeyPressed(boolean [] keys) {
  }

  void onKeyReleased(boolean [] keys) {
  }

  void onDraw() {
    startbutton.render();
  }

  public float getMiddleScreenX(int size) {
    return (width - size) / 2;
  }

  public float getMiddleScreenY(int size) {
    return (height - size) / 2;
  }
}
