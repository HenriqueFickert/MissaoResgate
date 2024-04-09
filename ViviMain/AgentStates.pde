class Idle extends State{
  
  public Idle(Agent agent){
    super("IDLE", agent);
  }
  
   void onEnterState(){}
  
   void onDrawState(){}
  
   void onExitState(){}
}

class Run extends State{
  
  public Run(Agent agent){
    super("RUN", agent);
  }
  
   void onEnterState(){}
  
   void onDrawState(){}
  
   void onExitState(){}
}

class Die extends State{
  
  public Die(Agent agent){
    super("DIE", agent);
  }
  
   void onEnterState(){}
  
   void onDrawState(){}
  
   void onExitState(){}
}
