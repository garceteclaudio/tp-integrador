static class Time{
  static float getDeltaTime(float frames){
    int framesSeg= round(frames);
    float deltaTime= 1/framesSeg;
    return deltaTime;
  }
}
