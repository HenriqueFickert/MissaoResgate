enum MenuState {
  GETPLAYERDATA,
    MAINMENU,
    RANKINGMENU,
}

class Menu extends Scene {

  MenuState currentState = MenuState.GETPLAYERDATA;

  Button startButton;
  Button rankingButton;

  Button soundButton;

  Button returnButton;
  PImage modal;

  Button confirmPlayerDataButton;

  String loginErrorMessage = "";

  PImage bg;
  PImage logoImage;

  PImage mute;
  PImage desmute;

  Menu(int sceneId) {
    super(sceneId);
    mute = loadImage("sprites/mute.png");
    desmute = loadImage("sprites/desmute.png");
    bg = loadImage("sprites/bg-menu-white.png");
    logoImage = loadImage("sprites/logo.png");
    modal = loadImage("sprites/modal.png");
    createGetPlayerDataMenu();
    createMainMenu();
    createRankingMenu();
    createSoundButton();
  }

  void onInitialized() {
    currentState = MenuState.GETPLAYERDATA;
    ranking.txtUsername.setText("");
    ranking.setUsernameVisible(true);
    createMainMenu();
    createRankingMenu();
    createSoundButton();
  }

  void onEnter() {
    playLoopAudio(menuBgm);
  }

  private void createGetPlayerDataMenu() {
    ranking.createUsernameInput(getMiddleScreenX(225), 350);
    ranking.setUsernameVisible(true);

    confirmPlayerDataButton = new Button(getMiddleScreenX(150), 435, "CONFIRMAR", () -> {
      playAudio(click);
      checkConfirmPlayerDataButton();
    }
    );
  }

  private void createSoundButton() {
    PImage sprite;

    if (volume == 1) {
      sprite = desmute;
    } else {
      sprite = mute;
    }

    soundButton = new Button(535, 30, 45, 45, sprite, () -> {
      playAudio(click);
      if (muteOrDesmute()) {
        soundButton.sprite = desmute;
        playLoopAudio(menuBgm);
      } else {
        soundButton.sprite = mute;
      }
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
      playAudio(click);
      changeScreen(1);
    }
    );

    rankingButton = new Button(getMiddleScreenX(150), getMiddleScreenY(50) + 75, "RANKING", () -> {
      playAudio(click);
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
    returnButton = new Button(getMiddleScreenX(150), 700, "VOLTAR", () -> {
      playAudio(click);
      currentState = MenuState.MAINMENU;
    }
    );
  }

  private void renderRankingMenu() {
    image(modal, getMiddleScreenX(400), getMiddleScreenY(500) + 30);
    fill(primaryColor);
    textSize(titleSize);
    text("RANKING", 300, 125);
    ranking.createRankingTable(140, 250, 40, 250);
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
    soundButton.render();
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
    if (soundButton != null && soundButton.detectMouseCollision())
      soundButton.onClick();

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
