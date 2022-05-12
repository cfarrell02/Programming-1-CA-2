class Log {
  private float xPos, yPos;
  private float logColorR, logColorG, logColorB;


  Log(float xPos, float yPos, float logColorR, float logColorG, float logColorB) {
    //sets all the variables
    this.xPos = xPos;
    this.yPos = yPos;
    this.logColorR = logColorR;
    this.logColorG = logColorG;
    this.logColorB = logColorB;
  }


  void display() {
    //draws the logs on the screen
    fill(logColorR, logColorG, logColorB);
    for (int i=-2; i<2; i++) {
      rect(xPos+(800*i), yPos, 300, 90);
    }
  }
  //getters
  public float getYPos() {
    return yPos;
  }
  public float getXPos() {
    return xPos;
  }
  //setters
  public void setXPos(float xPos) {
    this.xPos = xPos;
  }
  public void setYPos(float yPos) {
    this.yPos = yPos;
  }
}
