class FinalGame extends Scene {

  Button returnButton;
  Player player;
  Game game;

  FinalGame(int sceneId) {
    super(sceneId);
  }

  void onInitialized() {
    this.game = player.match;

    returnButton = new Button(getMiddleScreenX(150), getMiddleScreenY(50) + 200, "VOLTAR", () -> {
      changeScreen(0);
    }
    );
  }

  void onKeyPressed(boolean [] keys) {
  }

  void onKeyReleased(boolean [] keys) {
  }

  void onDraw() {
    fill(0xFFFF7C28);
    background(255);
    textAlign(CENTER);
    textSize(25);
    text("Você fez", 300, 200);
    textAlign(CENTER);
    textSize(60);
    text(game.points, 300, 300);
    textAlign(CENTER);
    textSize(25);
    text("Pontos", 300, 400);

    returnButton.render();
  }

  void onClick() {
    if (returnButton != null && returnButton.detectMouseCollision())
      returnButton.onClick();
  }

  void obtainPlayer (Player player) {
    this.player = player;
  }
}
