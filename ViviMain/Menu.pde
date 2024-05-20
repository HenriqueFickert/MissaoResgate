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

  Button confirmPlayerDataButton;

  String loginErrorMessage = "";

  Menu(int sceneId) {
    super(sceneId);
    createGetPlayerDataMenu();
    createMainMenu();
    createRankingMenu();
  }

  void onInitialized() {
    currentState = MenuState.GETPLAYERDATA;
    createGetPlayerDataMenu();
    createMainMenu();
    createRankingMenu();
  }

  private void createGetPlayerDataMenu() {
    ranking.createUsernameInput(getMiddleScreenX(200), getMiddleScreenY(40) - 75);
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
      loginErrorMessage = "";
      ranking.setPlayerName();
      ranking.setUsernameVisible(false);
      currentState = MenuState.MAINMENU;
    }
  }

  private void renderGetPlayerDataMenu() {
    text("Digite o nome do jogador", 300, getMiddleScreenY(40) - 100);
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
      changeScreen(1);
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

  private void createRankingMenu() {
    returnButton = new Button(getMiddleScreenX(150), getMiddleScreenY(50) + 200, "VOLTAR", () -> {
      currentState = MenuState.MAINMENU;
    }
    );
  }

  private void renderRankingMenu() {
    textAlign(CENTER);
    textSize(25);
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
}
