

class Spaceship extends Floater  
{  
  //No Argument constructor
  public Spaceship(){
    corners = 4;
    xCorners = new int[]{-8, 16, -8, -2};
    yCorners = new int[]{-8, 0, 8, 0};
    
    //middle of window 
    myCenterX = width/2;
    myCenterY = height/2;
    
    //Not moving 
    myDirectionX = 0;
    myDirectionY = 0;
    
    //Point Up
    myPointDirection = POINT_UP;
    
    myColor = SHIP_COLOR;
    
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
  
   //Transport ship to new random location, with zero speed
   public void hyperspace(){
     int minX = 0;
     int maxX = width; 
     int minY = 0;
     int maxY = height;
     
     //Select new random location
     myCenterX = (int)(Math.random() * (maxX - minX + 1) + minX);
     myCenterY = (int)(Math.random() * (maxY - minY + 1) + minY);
     
     //reset direciton to up
     myPointDirection = POINT_UP;
     
     //reset speed vector to 0.
     myDirectionX = 0;
     myDirectionY = 0;     
   }
}
