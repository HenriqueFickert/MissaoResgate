class Enemy extends Agent {

  Enemy(float startX, float startY)
  {
    super(startX, startY, new EnemyInput());
    loadImageArchive("sprites/player.png");
    tag = "Enemy";
    sizeX = 64;
    sizeY = 151;
    initializeEnemy();
  }

  private void initializeEnemy() {
    initialState = "RUN";
    states = new ArrayList<State>();
    states.add(new Idle(this));
    states.add(new RunVertical(this));
    states.add(new Die(this));
    states.add(new Disable(this));
    initializeAgent();
  }
}

class EnemyInput  implements IAgentInput {

  private boolean isRunning = true;
  private int direction = 1;

  public void processInput(boolean[] keys) {
  }

  public int getDirection() {
    return direction;
  }

  public boolean isRunning() {
    return isRunning;
  }
}
