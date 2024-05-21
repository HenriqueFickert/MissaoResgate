class Game extends Scene {
  private int points = 0;
  private int interval = 3000;
  private int previousMillis = 0;
  PImage healthSprite;

  Player player;
  AgentSpawner agentSpawner;

  private boolean isFlashing = false;
  private int flashStartTime = 0;
  private int flashDuration = 100;

  PImage bg;

  Game(int sceneId) {
    super(sceneId);
    bg = loadImage("sprites/bg.png");
    healthSprite = loadImage("sprites/health.png");
    onInitialized();
  }

  void onInitialized() {
    player = new Player(300, 580, this);
    agentSpawner = new AgentSpawner();
    points = 0;
    previousMillis = millis();
    lastCheck = 0;
  }

  void onEnter() {
    playLoopAudio(gameplayBgm);
  }

  void onClick() {
  }

  void onKeyPressed(boolean [] keys) {
    player.agentInput.processInput(keys);
  }

  void onKeyReleased(boolean [] keys) {
    player.agentInput.processInput(keys);
  }

  void onDraw() {
    drawBackGround();
    player.onDraw();
    agentSpawner.onDraw();
    detectCollisions();
    pointsTimer();
    renderPointsUI();
    renderLivesUI();

    if (isFlashing) {
      flashScreen();
    }
  }

  private void renderPointsUI() {
    fill(whiteColor);
    textFont(font, 30);
    text(points, (width - 50) / 2, 25);
  }

  private void renderLivesUI() {
    int heartSizeX = 25;
    int heartSizeY = 50;
    int spacing = 10;
    int startX = 10;
    int startY = 10;

    for (int i = 0; i < player.getPlayerLives(); i++) {
      image(healthSprite, startX + i * (heartSizeX + spacing), startY, heartSizeX, heartSizeY);
    }
  }

  private void pointsTimer() {
    int currentMillis = millis();

    if (currentMillis - previousMillis >= interval) {
      previousMillis = currentMillis;
      updatePoints(5);
    }
  }

  public void updatePoints(int points) {
    this.points += points;
  }

  private long lastCheck = 0;
  private final long delay = 100000;

  void detectCollisions() {
    long now = System.nanoTime();

    if ((now - lastCheck) >= delay) {
      for (WorldObject object : agentSpawner.agents) {
        if (player.detectCollision(object)) {
          player.onGetHit((IHittable) object);
        }
        if (object.detectCollision(player)) {
          ((Agent) object).onGetHit(player);
        }
      }
      lastCheck = now;
    }
  }

  void drawBackGround() {
    image(bg, 0, 0);
  }

  void startFlashing() {
    isFlashing = true;
    flashStartTime = millis();
  }

  void flashScreen() {
    int currentMillis = millis();
    if (currentMillis - flashStartTime < flashDuration) {
      fill(255, 255, 255, 128);
      rect(0, 0, width, height);
    } else {
      isFlashing = false;
    }
  }

  void obtainPlayer (Player player) {
  }

  void onExit() {
  }
}
