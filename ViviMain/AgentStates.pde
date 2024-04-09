class IdleState extends State{
  
  public IdleState(Agent agent){
    super("IDLE", agent);
  }
  
   void onEnterState(){}
  
   void onDrawState(){}
  
   void onExitState(){}
}

class RunState extends State{
  
  public RunState(Agent agent){
    super("RUN", agent);
  }
  
   void onEnterState(){}
  
   void onDrawState(){}
  
   void onExitState(){}
}

class JumpState extends State{
  
  public JumpState(Agent agent){
    super("JUMP", agent);
  }
  
   void onEnterState(){
   agent.positionY += 200;
   }
  
   void onDrawState(){
   agent.positionY -= 10;
   }
  
   void onExitState(){}
}

class DieState extends State{
  
  public DieState(Agent agent){
    super("DIE", agent);
  }
  
   void onEnterState(){}
  
   void onDrawState(){}
  
   void onExitState(){}
}
