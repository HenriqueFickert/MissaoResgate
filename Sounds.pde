SoundFile click;
SoundFile mouseHover;
SoundFile gameover;
SoundFile menuBgm;
SoundFile gameplayBgm;

private void loadSounds() {
  click = new SoundFile (this, "sounds/click.wav");
  mouseHover = new SoundFile (this, "sounds/mouseHover.wav");
  gameover = new SoundFile (this, "sounds/gameover.mp3");
  menuBgm = new SoundFile (this, "sounds/menuBgm.mp3");
  gameplayBgm = new SoundFile (this, "sounds/gameplayBgm.mp3");
}
