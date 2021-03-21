
class Star {
  private int myX, myY;
  private int r, g, b; 
  private int dim; 
  
  public Star(){
    myX = (int)(Math.random() * width);
    myY = (int)(Math.random() * height);   
    
    r = (int)(Math.random() * 255) + 100;
    g = (int)(Math.random() * 255) + 100;
    b = (int)(Math.random() * 255) + 100;
    
    dim = (int)(Math.random() * 5) + 1;    
  }
  
  public void show(){        
    fill(r, g, b); 
    stroke(r, g, b);
    //ellipse(myX, myY, STAR_DIMENSION, STAR_DIMENSION);
    ellipse(myX, myY, dim, dim);
  }
}
