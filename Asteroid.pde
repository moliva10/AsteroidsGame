public class Asteroid extends Floater{
  
  private int rotSpeed;
  
  public Asteroid(){
    rotSpeed = (int)(Math.random() * 9 - 4);

    //Need a random asteroid vertice generator
    corners = 6;
    
    int x1 = (int)(Math.random() * 6 - 15); //-15 to -9
    int y1 = (int)(Math.random() * 6 - 12); //-12 to -7
    
    int x6 = (int)(Math.random() * 6 - 10); //-10 to -5
    int y6 = 0;
    
    
    xCorners = new int[]{x1, 7, 13, 6, -11, -5};
    yCorners = new int[]{y1, -8, 0, 10, 8, 0};
    //xCorners = new int[]{-11, 7, 13, 6, -11, -5};
    //yCorners = new int[]{-8, -8, 0, 10, 8, 0};
    
    //Random Location in window
    myCenterX = (int)(Math.random() * width);
    myCenterY = (int)(Math.random() * height);
    
    //Random movement
    double min = -0.5;
    double max = 0.5;
    myDirectionX = (Math.random() * (max-min+1) + min);
    myDirectionY = (Math.random() * (max-min+1) + min);
    
    //Point Up
    myPointDirection = (int)(Math.random() * 361);
    
    //Random color
    min = 100;
    max = 255;    
    myColor = (int)(Math.random() * (max-min+1) + min);
  }
  
  public void move(){
    rotate(rotSpeed);
    super.move();
  }
  
  
    //Setters and Getters
   public void setX(int x) {myCenterX = x;}  
   public int getX() {return (int)myCenterX;}  
   
   public void setY(int y) {myCenterY = y;}   
   public int getY() {return (int)myCenterY;}
   
   public void setDirectionX(double x) {myDirectionX = x;}   
   public double getDirectionX() {return myDirectionY;}
   
   public void setDirectionY(double y) {myDirectionY = y;}   
   public double getDirectionY() {return myDirectionY;}   
   
   public void setPointDirection(int degrees) {myPointDirection = degrees;} 
   public double getPointDirection() {return myPointDirection;} 
}
