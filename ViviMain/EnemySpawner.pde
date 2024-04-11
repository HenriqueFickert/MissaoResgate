class EnemySpawner {
  public ArrayList<Enemy> enemies;
  int[] spotsX = new int[3];

  EnemySpawner() {
    enemies = new ArrayList<Enemy>();
    initializeSpots();
    spawnEnemy(1);
  }

  void initializeSpots() {
    int margin = 50;
    int usableWidth = screenWidth - (2 * margin);
    int columnWidth = usableWidth / 3;
    
    for (int i = 0; i < 3; i++) {
      int centerX = margin + (i * columnWidth) + (columnWidth / 2);
      spotsX[i] = centerX;
    }
  }
  
  void onDraw(){
    for (Enemy enemy : enemies) {
      enemy.agentInput.processInput(keys);
      enemy.onDraw();
    }
  }
  
  void spawnEnemy(int columnIndex) {
    if(columnIndex < 0 || columnIndex >= spotsX.length) return;
    
    Enemy newEnemy = new Enemy(spotsX[columnIndex], -100);
    enemies.add(newEnemy);
  }
}
