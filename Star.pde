
class Star {
  private int myX, myY;
  
  public Star(){
    myX = (int)(Math.random() * width);
    myY = (int)(Math.random() * height);   
  }
  
  public void show(){
    fill(255); //white
    ellipse(myX, myY, STAR_DIMENSION, STAR_DIMENSION);
  }
}
