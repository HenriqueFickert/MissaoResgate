enum MenuState {
  GETPLAYERDATA,
    MAINMENU,
    RANKINGMENU,
}

class Menu extends Scene {

  MenuState currentState = MenuState.GETPLAYERDATA;

  Button startButton;
  Button rankingButton;

  Button returnButton;
  PImage menuBg;

  Button confirmPlayerDataButton;

  String loginErrorMessage = "";

  PImage bg;
  PImage logoImage;

  Menu(int sceneId) {
    super(sceneId);
    bg = loadImage("sprites/bg-menu-white.png");
    logoImage = loadImage("sprites/logo.png");
    menuBg = loadImage("sprites/bgmenu.png");
    createGetPlayerDataMenu();
    createMainMenu();
    createRankingMenu();
  }

  void onInitialized() {
    currentState = MenuState.GETPLAYERDATA;
    ranking.txtUsername.setText("");
    ranking.setUsernameVisible(true);
    createMainMenu();
    createRankingMenu();
  }

  void onEnter() {
    menuBgm.loop();
  }

  private void createGetPlayerDataMenu() {
    ranking.createUsernameInput(getMiddleScreenX(225), 350);
    ranking.setUsernameVisible(true);

    confirmPlayerDataButton = new Button(getMiddleScreenX(150), 435, "CONFIRMAR", () -> {
      click.play();
      checkConfirmPlayerDataButton();
    }
    );
  }

  private void checkConfirmPlayerDataButton() {
    String inputText = ranking.getInputText();

    if (inputText.isEmpty()) {
      loginErrorMessage = "É necessário digitar o nome do jogador.";
    } else if (inputText.length() > 15) {
      loginErrorMessage = "O nome do jogador está muito grande.";
    } else {
      loginErrorMessage = "";
      ranking.setPlayerName();
      ranking.setUsernameVisible(false);
      currentState = MenuState.MAINMENU;
    }
  }

  private void renderGetPlayerDataMenu() {
    image(logoImage, getMiddleScreenX(447), 125);
    fill(primaryColor);
    textAlign(CENTER);
    textSize(regularSize);
    text("Digite o nome do jogador", 300, 330);
    fill(whiteColor);
    textAlign(CENTER);
    textSize(smallSize);
    text(loginErrorMessage, getMiddleScreenX(0), 405);
    confirmPlayerDataButton.render();
  }

  private void handleGetPlayerDataClick() {
    if (confirmPlayerDataButton != null && confirmPlayerDataButton.detectMouseCollision())
      confirmPlayerDataButton.onClick();
  }

  private void createMainMenu() {
    startButton = new Button(getMiddleScreenX(150), getMiddleScreenY(50), "JOGAR", () -> {
      click.play();
      changeScreen(1);
    }
    );

    rankingButton = new Button(getMiddleScreenX(150), getMiddleScreenY(50) + 75, "RANKING", () -> {
      click.play();
      currentState = MenuState.RANKINGMENU;
    }
    );
  }

  private void renderMainMenu() {
    image(logoImage, getMiddleScreenX(447), 125);
    startButton.render();
    rankingButton.render();
  }

  private void handleMainMenuClick() {
    if (startButton != null && startButton.detectMouseCollision())
      startButton.onClick();

    if (rankingButton != null && rankingButton.detectMouseCollision())
      rankingButton.onClick();
  }

  private void createRankingMenu() {
    returnButton = new Button(getMiddleScreenX(150), getMiddleScreenY(50) + 200, "VOLTAR", () -> {
      click.play();
      currentState = MenuState.MAINMENU;
    }
    );
  }

  private void renderRankingMenu() {
    image(menuBg, getMiddleScreenX(400), getMiddleScreenY(600));
    textAlign(CENTER);
    textSize(subtitleSize);
    text("Ranking", 300, 80);
    ranking.createRankingTable(120, 150, 40, 300);
    returnButton.render();
  }

  private void handleRankingMenuClick() {
    if (returnButton != null && returnButton.detectMouseCollision())
      returnButton.onClick();
  }

  void onKeyPressed(boolean [] keys) {
  }

  void onKeyReleased(boolean [] keys) {
  }

  void onDraw() {
    image(bg, 0, 0);
    switch (currentState) {
    case GETPLAYERDATA:
      renderGetPlayerDataMenu();
      break;
    case MAINMENU:
      renderMainMenu();
      break;
    case RANKINGMENU:
      renderRankingMenu();
      break;
    }
  }

  void onClick() {
    switch (currentState) {
    case GETPLAYERDATA:
      handleGetPlayerDataClick();
      break;
    case MAINMENU:
      handleMainMenuClick();
      break;
    case RANKINGMENU:
      handleRankingMenuClick();
      break;
    }
  }

  void obtainPlayer (Player player) {
  }

  void onExit() {
    menuBgm.stop();
  }
}
