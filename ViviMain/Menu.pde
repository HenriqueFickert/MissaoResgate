class Menu extends Scene {
  Button startButton;
  Ranking ranking;

  boolean askName = true;

  Menu(int sceneId) {
    super(sceneId);

    startButton = new Button(getMiddleScreenX(150), getMiddleScreenY(50), () -> {
      currentScreen = 1;
    }
    );
    
    ranking = new Ranking();

    if (askName)
      ranking.createUsernameInput(getMiddleScreenX(100), getMiddleScreenY(30));
  }

  void onClick()
  {
    if (startButton.detectMouseCollision())
      startButton.onClick();
  }

  void onKeyPressed(boolean [] keys) {
  }

  void onKeyReleased(boolean [] keys) {
  }

  void onDraw() {
    startButton.render();
  }

  public float getMiddleScreenX(int size) {
    return (width - size) / 2;
  }

  public float getMiddleScreenY(int size) {
    return (height - size) / 2;
  }
}
