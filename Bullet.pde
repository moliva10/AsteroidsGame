public class Bullet extends Floater{
  
  public Bullet(Spaceship theShip){
    xCorners = new int[]{-8, 16, -8, -2}; //Level these null causing an issue when created Bullets?
    yCorners = new int[]{-8, 0, 8, 0};
    
    myCenterX = theShip.getX();
    myCenterY = theShip.getY();
    
    myPointDirection = theShip.getPointDirection();
    
    myDirectionX = theShip.getDirectionX();    
    myDirectionY = theShip.getDirectionY();
    
    //Bullet should be faster than ship
    accelerate(6);    
    
    myColor = 255;
    
  }
  
  public void show()  //Draws the bullet at the current position  
  {             
    fill(myColor);   
    stroke(myColor);   
    //ellipse((float)myCenterX, (float)myCenterY, 2.0, 2.0);
    circle((float)myCenterX, (float)myCenterY, 2.0);
  }
  
  /* 
  * Bullets should fly off the screen
  */
  //@Override
  public void move(){
    myCenterX += myDirectionX;
    myCenterY += myDirectionY;
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
