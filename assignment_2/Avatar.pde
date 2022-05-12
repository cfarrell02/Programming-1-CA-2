class Avatar {
  private float xCoord, yCoord;

  Avatar(float xCoord, float yCoord) {
    // validates that the x coords are only between 5 and 1495 before setting it
    if ((xCoord >= 5) && (xCoord <= 1495)) {
      this.xCoord = xCoord;
    } else if (xCoord > 745) {
      this.xCoord = 645;
    } else {
      this.xCoord = 5;
    }
    if (yCoord <0) {
      this.yCoord = 800;
    } else {
      this.yCoord = yCoord;
    }
  }

  void display() {
    fill(0, 178, 50);
    stroke(0);
    rect(xCoord+10, yCoord+10, 80, 80);
  }
  void move(float xCoord, float yCoord) {
    // validates that the x coords are only between 5 and 1495 before setting it
    if ((xCoord >= 5) && (xCoord <= 1495)) {
      this.xCoord = xCoord;
    } else if (xCoord > 1495) {
      this.xCoord = 1495;
    } else {
      this.xCoord = 5;
    }
    this.yCoord = yCoord;
  }

  public float getYCoord() {
    return yCoord;
  }
  public float getXCoord() {
    return xCoord;
  }
  public void setXCoord(float xCoord) {
    // validates that the x coords are only between 5 and 1495 before setting it
    if ((xCoord >= 5) && (xCoord <= 1495)) {
      this.xCoord = xCoord;
    } else if (xCoord > 1495) {
      this.xCoord = 1495;
    } else {
      this.xCoord = 5;
    }
  }
  public void setYCoord(float yCoord) {
    // resets the y coord if it goes below 800 and adds to the score and speed
    if (yCoord <0) {
      this.yCoord = 800;
      score += 10;
      speed += 1;
    } else {
      this.yCoord = yCoord;
    }
  }
}
