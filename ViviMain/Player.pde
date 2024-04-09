class Player extends Agent {
  
  Player(float startX, float startY)
  {
    super(startX, startY);
    initializePlayer();
  }

  private void initializePlayer(){
    initialState = "IDLE";
    states = new ArrayList<State>();
    states.add(new Idle(this));
    states.add(new Run(this));
    states.add(new Die(this));
    initializeAgent();
  }
}
