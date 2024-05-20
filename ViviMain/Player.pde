class Player extends Agent {

  private int lives = 3;
  private Game match;

  Player(float startX, float startY, Game match)
  {
    super(startX, startY, new PlayerInput());
    loadImageArchive("sprites/player.png");
    tag = "Player";
    sizeX = 64;
    sizeY = 151;
    this.match = match;
    initializeAgent();
  }

  @Override
    public void initializeAgent() {
    interactable = true;
    initialState = "IDLE";
    states = new ArrayList<State>();
    states.add(new Idle(this));
    states.add(new Run(this));
    states.add(new Die(this));
    setUpSprites();
    changeState(initialState);
  }

  @Override
    public void onGetHit(IHittable other) {
    if (other instanceof Agent) {
      Agent otherAgent = (Agent) other;
      if (otherAgent.tag.equals("Enemy")) {
        lives--;
        println ("lives:" + lives);
        match.startFlashing();
        if (lives <= 0) {
          changeState("DIE");
          ranking.setPoints(match.points);
          ranking.savePoints();
          changeScreen(0);
        }
      } else if (otherAgent.tag.equals("Ally"))
      {
        match.updatePoints(20);
      }
    }
  }

  public int getPlayerLives() {
    return lives;
  }
}

class PlayerInput  implements IAgentInput {
  private boolean isRunning = false;
  private int direction = 0;

  public void processInput(boolean[] keys) {
    if (keys[RIGHT_ARROW]) {
      direction = 1;
    } else if (keys[LEFT_ARROW]) {
      direction = -1;
    } else {
      direction = 0;
    }

    isRunning = keys[RIGHT_ARROW] || keys[LEFT_ARROW];
  }

  public int getDirection() {
    return direction;
  }

  public boolean isRunning() {
    return isRunning;
  }
}
