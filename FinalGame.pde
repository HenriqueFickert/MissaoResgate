class FinalGame extends Scene { //<>//

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

    returnButton = new Button(getMiddleScreenX(150), getMiddleScreenY(50) + 100, "VOLTAR", () -> {
      click.play();
      changeScreen(0);
    }
    );
  }

  void onEnter() {
    gameover.play();
  }

  void onKeyPressed(boolean [] keys) {
  }

  void onKeyReleased(boolean [] keys) {
  }

  void onDraw() {
    image(bg, 0, 0);
    textAlign(CENTER);
    fill(primaryColor);
    textSize(titleSize);
    text("FIM DE JOGO", 300, 125);
    textSize(subtitleSize);
    text("Você fez", 300, 250);
    fill(whiteColor);
    textSize(titleSize + 20);
    text(game.points, 300, 350);
    fill(primaryColor);
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

  void onExit() {
    gameplayBgm.stop();
    gameover.stop();
  }
}
