class Agent extends WorldObject {
  ArrayList<State> states;
  State currentState;
  State previousState;
  String initialState;
   
  PImage[] [] sprites;
  
  Agent(float startX, float startY)
  {
    super(startX, startY);
    loadImageArchive("sprites/player.png");
  }
   
  protected void initializeAgent()
  {
    setUpSprites();
    changeState(initialState);
  }
   
  void render()
  {
    image(sprite.get(0,0,64,64)/*sprites[states.indexOf(currentState)][0]*/, positionX, positionY);
  }
   
  void onDraw()
  {
    currentState.onDrawState();
    render();
  }
  
  protected void changeState(String state)
  {
    State desiredState = getStateByName(state);
    
    if (desiredState == null)
      return;
      
    if (currentState != null)
        currentState.onExitState();
    
    previousState = currentState;
    currentState = desiredState;
    currentState.onEnterState();
  }
  
  protected State getStateByName(String name) {
    for (State state : states) {
      if (state.name.equals(name)) {
        return state;
      }
    }
    return null;
  }
    
  protected void setUpSprites()
  {
    sprites = new PImage[0] [0];
    /*
    for(int i = 0; i < 9; i++)
    {
      for(int j = 0; j < 9; j++){
        sprites[0][i] = sprite.get(0,0,64,64);
      }
    }*/
  }
}
