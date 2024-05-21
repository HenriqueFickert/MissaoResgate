SoundFile click;
SoundFile mouseHover;
SoundFile gameover;
SoundFile menuBgm;
SoundFile gameplayBgm;

SoundFile cat;
SoundFile hit;

int volume = 1;

private void loadSounds() {
  cat = new SoundFile (this, "sounds/cat.mp3");
  hit = new SoundFile (this, "sounds/hit.mp3");
  click = new SoundFile (this, "sounds/click.wav");
  mouseHover = new SoundFile (this, "sounds/mouseHover.wav");
  gameover = new SoundFile (this, "sounds/gameover.mp3");
  menuBgm = new SoundFile (this, "sounds/menuBgm.mp3");
  gameplayBgm = new SoundFile (this, "sounds/gameplayBgm.mp3");
}

private void setVolume() {
  click.amp(volume);
  mouseHover.amp(volume);
  gameover.amp(volume);
  menuBgm.amp(volume);
  gameplayBgm.amp(volume);
}

private boolean muteOrDesmute() {
  volume = 1 - volume;
  setVolume();
  return volume == 1;
}

public void playAudio(SoundFile file) {
  if (volume == 0)
    return;

  file.play();
}

public void playLoopAudio(SoundFile file) {
  if (volume == 0)
    return;

  file.loop();
}
