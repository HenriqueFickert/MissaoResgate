class Game extends Scene {
  private int points = 0;
  private int interval = 3000;
  private int previousMillis = 0;
  PImage healthSprite;

  Player player = new Player(300, 580, this);
  AgentSpawner agentSpawner = new AgentSpawner();

  Game(int sceneId) {
    super(sceneId);
    healthSprite = loadImage("sprites/heart.png");
  }

  void onClick() {
  }

  void onKeyPressed(boolean [] keys)
  {
    player.agentInput.processInput(keys);
  }

  void onKeyReleased(boolean [] keys)
  {
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
  }

  private void renderPointsUI() {
    fill(000000);
    textFont(font, 25);
    text(points, (width - 50) / 2, 25);
  }

  private void renderLivesUI() {
    int heartSizeX = 32;
    int heartSizeY = 29;
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
    background(235);
  }
}
