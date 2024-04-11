class EnemySpawner {
  public ArrayList<Enemy> enemies;
  int[] spotsX = new int[3];
  int lastSpawnTime;

  EnemySpawner() {
    enemies = new ArrayList<Enemy>();
    initializeSpots();
    lastSpawnTime = millis();
  }

  void initializeSpots() {
    int margin = 50;
    int usableWidth = width - (2 * margin);
    int columnWidth = usableWidth / 3;
    
    for (int i = 0; i < 3; i++) {
      int centerX = margin + (i * columnWidth) + (columnWidth / 2);
      spotsX[i] = centerX;
    }
  }
  
  void onDraw() {
    if (millis() - lastSpawnTime > 1000) {
      if (random(1) < 0.5) {
        spawnTwoEnemies();
      } else {
        poolingEnemies((int) random(3));
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
    int firstColumn = (int) random(3);
    int secondColumn = (int) random(3);
    while (secondColumn == firstColumn) {
      secondColumn = (int) random(3);
    }
    
    poolingEnemies(firstColumn);
    poolingEnemies(secondColumn);
  }
}
