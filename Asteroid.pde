public class Asteroid extends Floater{
  
  private int rotSpeed;
  
  public Asteroid(){
    rotSpeed = (int)(Math.random() * 9 - 4);

    //Need a random asteroid vertice generator
    corners = 6;
    
    double f = (int)(Math.random() * 3) + 0.25;
    int x1 = (int)(Math.random() * 6 - 15); //-15 to -9
    int y1 = (int)(Math.random() * 6 - 12); //-12 to -7
    
    int x2 = (int)(Math.random() * 6 - 20); //-20 to -14
    int y2 = -x2;
    
    int x6 = (int)(Math.random() * 6 - 10); //-10 to -5
    int y6 = 0;
    
    
    //xCorners = new int[]{x1, x2, 13, 6, -11, x6};
    //yCorners = new int[]{y1, y2, 0, 10, 8, y6};
    xCorners = new int[]{(int)f*-11, (int)f*7, (int)f*13, (int)f*6, (int)f*-11, (int)f*-5};
    yCorners = new int[]{(int)f*-8, (int)f*-8, (int)f*0, (int)f*10, (int)f*8, (int)f*0};
    
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
