class Menu extends Scene {
  StartButton startbutton;
  
  Menu(int sceneId) {
    super(sceneId);
    startbutton = new StartButton(250,250);
  }
  
  void onClick()
  {
    if (startbutton.detectMouseCollision())
      startbutton.onClick();
  }
    
  void onKeyPressed(boolean [] keys){}
    
  void onKeyReleased(boolean [] keys){}
    
  void onDraw(){
   startbutton.render();
  }
}
