class StartButton extends UIObject {
  
    StartButton(float startX, float startY)
    {
      super(startX, startY, 158, 59);
      loadImageArchive("sprites/playbutton.png");
    }

    protected  void onClick()
    {
      currentScreen = 1;
    }
}
