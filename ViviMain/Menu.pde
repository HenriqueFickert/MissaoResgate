enum MenuState {
  GETPLAYERDATA,
    MAINMENU,
    RANKINGMENU,
}

class Menu extends Scene {

  MenuState currentState = MenuState.GETPLAYERDATA;
  Ranking ranking;

  Button startButton;
  Button rankingButton;
  Button confirmPlayerDataButton;

  String loginErrorMessage = "";

  Menu(int sceneId) {
    super(sceneId);
    ranking = new Ranking();
    createGetPlayerDataMenu();
    createMainMenu();
  }

  private void createGetPlayerDataMenu() {
    ranking.createUsernameInput(getMiddleScreenX(100), getMiddleScreenY(30) - 75);
    ranking.setUsernameVisible(true);

    confirmPlayerDataButton = new Button(getMiddleScreenX(150), getMiddleScreenY(50), "CONFIRMAR", () -> {
      checkConfirmPlayerDataButton();
    }
    );
  }

  private void checkConfirmPlayerDataButton() {
    String inputText = ranking.getInputText();

    if (inputText.isEmpty()) {
      loginErrorMessage = "É necessário digitar o nome do jogador.";
    } else if (inputText.length() > 10) {
      loginErrorMessage = "O nome do jogador está muito grande.";
    } else {
      ranking.setPlayerName();
      ranking.setUsernameVisible(false);
      currentState = MenuState.MAINMENU;
    }
  }

  private void renderGetPlayerDataMenu() {
    textAlign(CENTER);
    textSize(12);
    text(loginErrorMessage, getMiddleScreenX(0), getMiddleScreenY(0) - 40);
    confirmPlayerDataButton.render();
  }

  private void handleGetPlayerDataClick() {
    if (confirmPlayerDataButton != null && confirmPlayerDataButton.detectMouseCollision())
      confirmPlayerDataButton.onClick();
  }

  private void createMainMenu() {
    startButton = new Button(getMiddleScreenX(150), getMiddleScreenY(50), "JOGAR", () -> {
      currentScreen = 1;
    }
    );

    rankingButton = new Button(getMiddleScreenX(150), getMiddleScreenY(50) + 75, "RANKING", () -> {
      currentState = MenuState.RANKINGMENU;
    }
    );
  }

  private void renderMainMenu() {
    startButton.render();
    rankingButton.render();
  }

  private void handleMainMenuClick() {
    if (startButton != null && startButton.detectMouseCollision())
      startButton.onClick();

    if (rankingButton != null && rankingButton.detectMouseCollision())
      rankingButton.onClick();
  }

  private void renderRankingMenu() {
    ranking.createRankingTable(120, 200, 40, 300);
  }

  private void handleRankingMenuClick() {
  }

  void onKeyPressed(boolean [] keys) {
  }

  void onKeyReleased(boolean [] keys) {
  }

  void onDraw() {
    background(255);
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

  public float getMiddleScreenX(int size) {
    return (width - size) / 2;
  }

  public float getMiddleScreenY(int size) {
    return (height - size) / 2;
  }
}
