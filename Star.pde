
class Star {
  private int myX, myY;
  
  public Star(){
    myX = (int)(Math.random() * width);
    myY = (int)(Math.random() * height);   
  }
  
  public void show(){
    //int color = (int)(Math.random() * 255);
    fill((int)(Math.random() * 255 + 100), (int)(Math.random() * 255 + 100), (int)(Math.random() * 255 + 100)); 
    ellipse(myX, myY, STAR_DIMENSION, STAR_DIMENSION);
  }
}
