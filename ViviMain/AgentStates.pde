class Idle extends State{
  
  public Idle(Agent agent){
    super("IDLE", agent);
  }
  
   void onEnterState(){
     println(name);
   }
  
   void onDrawState(){
      if(agent.agentInput.isRunning()){
        agent.changeState("RUN");
        return;
      }
        
   }
  
   void onExitState(){}
}

class Run extends State{
  
  public Run(Agent agent){
    super("RUN", agent);
  }
  
   void onEnterState(){
        println(name);
      }
  
  void onDrawState(){
      if (!agent.agentInput.isRunning()) {
          agent.changeState("IDLE");
          return;
      }
  
      float newPositionX = agent.positionX + agent.speed * agent.agentInput.getDirection();

      if (agent.agentInput.getDirection() == 1 && newPositionX > screenWidth - agent.sizeX - 50) {
          agent.positionX = screenWidth - agent.sizeX - 50;
      }
      else if (agent.agentInput.getDirection() == -1 && newPositionX < 50) {
          agent.positionX = 50;
      }
      else {
          agent.positionX = newPositionX;
      }
  }

   void onExitState(){}
}

class RunVertical extends Run{
  
  RunVertical(Agent agent){
    super(agent);
  }
  
   void onEnterState(){
        println(name);
      }
  
  @Override
  void onDrawState(){
      if (!agent.agentInput.isRunning()) {
          agent.changeState("IDLE");
          return;
      }
  
      float newPositionY = agent.positionY + agent.speed * agent.agentInput.getDirection();
      
      if (newPositionY > screenHeight + agent.sizeY) {
          
      }
      
      agent.positionY = newPositionY;
  }

   void onExitState(){}
}

class Die extends State{
  
  public Die(Agent agent){
    super("DIE", agent);
  }
  
   void onEnterState(){
     println(name);
   }
  
   void onDrawState(){}
  
   void onExitState(){}
}
