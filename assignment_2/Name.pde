class Name {
  private String name = JOptionPane.showInputDialog("Please enter your name\n\n(max of 6 characters)", "John");
  private int maxNumberOfGames = Integer.parseInt(JOptionPane.showInputDialog("Welcome to frogger!\n\nPlease enter the number of games you would like to play: ", "3"));

  Name() {
  }
  void display(int score, float xPos, float yPos) {
    fill(0);
    textSize(40);
    //validates that the string is only drawn if it is less than 6 characters otherwise a substring of 6 is drawn
    if (name.length() <=6)
      text(name+"'s Score is:"+score, xPos, yPos);
    else
      text(name.substring(0, 6)+"'s Score is:"+score, xPos, yPos);
  }

  //getters
  public String getName() {
    return name;
  }

  public int getMaxNumberOfGames() {
    return maxNumberOfGames;
  }
  //setters
  public void setName(String name) {
    this.name=name;
  }
  public void setMaxNumberOfGames(int maxNumberOfGames) {
    this.maxNumberOfGames = maxNumberOfGames;
  }
}
