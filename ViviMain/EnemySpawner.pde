class EnemySpawner {
  public ArrayList<Enemy> enemies;
  int[] spotsX = new int[4];
  int lastSpawnTime;

  EnemySpawner() {
    enemies = new ArrayList<Enemy>();
    initializeSpots();
    lastSpawnTime = millis();
  }

  void initializeSpots() {
    int margin = 50;
    int usableWidth = width - (2 * margin);
    int columnWidth = usableWidth / spotsX.length;

    for (int i = 0; i < 4; i++) {
      int centerX = margin + (i * columnWidth) + (columnWidth / spotsX.length);
      spotsX[i] = centerX;
    }
  }

  void onDraw() {
    if (millis() - lastSpawnTime > 1000) {
      if (random(1) < 0.5) {
        spawnTwoEnemies();
      } else {
        poolingEnemies((int) random(spotsX.length));
      }
      lastSpawnTime = millis();
    }

    for (Enemy enemy : enemies) {
      enemy.onDraw();
    }
  }

  void poolingEnemies(int columnIndex) {
    if (columnIndex < 0 || columnIndex >= spotsX.length) return;

    for (Enemy enemy : enemies) {
      if (enemy.currentStateName == "OUTOFFSCREEN") {
        enemy.setPosition(spotsX[columnIndex], -100);
        enemy.changeState("RUN");
        return;
      }
    }

    Enemy newEnemy = new Enemy(spotsX[columnIndex], -100);
    enemies.add(newEnemy);
  }

  void spawnTwoEnemies() {
    int firstColumn = (int) random(spotsX.length);
    int secondColumn = (int) random(spotsX.length);
    while (secondColumn == firstColumn) {
      secondColumn = (int) random(spotsX.length);
    }

    poolingEnemies(firstColumn);
    poolingEnemies(secondColumn);
  }
}
