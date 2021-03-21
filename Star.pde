
class Star {
  private int myX, myY;
  
  public Star(){
    myX = (int)(Math.random() * width);
    myY = (int)(Math.random() * height);   
  }
  
  public void show(){
    int r = (int)(Math.random() * 255) + 100;
    int g = (int)(Math.random() * 255) + 100;
    int b = (int)(Math.random() * 255) + 100;
    
    int dim = (int)(Math.random() * 5) + 1;
    
    fill(r, g, b); 
    stroke(r, g, b);
    //ellipse(myX, myY, STAR_DIMENSION, STAR_DIMENSION);
    ellipse(myX, myY, dim, dim);
  }
}
