class FinalGame extends Scene {

  Button returnButton;
  Player player;
  Game game;

  PImage bg;

  FinalGame(int sceneId) {
    super(sceneId);
    bg = loadImage("sprites/bg-menu-white.png");
  }

  void onInitialized() {
    this.game = player.match;

    returnButton = new Button(getMiddleScreenX(150), getMiddleScreenY(50) + 200, "VOLTAR", () -> {
      click.play();
      changeScreen(0);
    }
    );
  }

  void onKeyPressed(boolean [] keys) {
  }

  void onKeyReleased(boolean [] keys) {
  }

  void onDraw() {
    image(bg, 0, 0);
    fill(primaryColor);
    textAlign(CENTER);
    textSize(subtitleSize);
    text("Você fez", 300, 200);
    textAlign(CENTER);
    textSize(titleSize);
    text(game.points, 300, 300);
    textAlign(CENTER);
    textSize(subtitleSize);
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
