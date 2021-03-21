

class Spaceship extends Floater  
{  

  boolean showThrusters = false;
  int thrusterFrameCount = 0;
      
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
  
  public void show( ){
    super.show();
    
    if (showThrusters){
      thrusterFrameCount++;
      if( thrusterFrameCount > 5){
        showThrusters = false;
        thrusterFrameCount = 0;
        return;
      }
      int[][] thruster = { { -6, -4 }, { -12, 0 }, { -6, 4 } };
      stroke(255, 0 ,0);
      fill(255, 0, 0);
      //convert degrees to radians for sin and cos functions to rotate object         
      double dRadians = myPointDirection*(Math.PI/180);                 
      double xRotatedTranslated, yRotatedTranslated;

      beginShape();         
      for(int i = 0; i < thruster.length; i++){     
        //rotate and translate the coordinates of the floater using current direction 
        xRotatedTranslated = ((thruster[i][0]* Math.cos(dRadians)) - (thruster[i][1] * Math.sin(dRadians))+myCenterX);     
        yRotatedTranslated = ((thruster[i][0]* Math.sin(dRadians)) + (thruster[i][1] * Math.cos(dRadians))+myCenterY);      
        vertex((float)xRotatedTranslated,(float)yRotatedTranslated);    
      }
      endShape(CLOSE);      
    }   
  }
  
    public void accelerate(double dAmount){
      showThrusters = true;
      thrusterFrameCount = 0;
      super.accelerate(dAmount);
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
     //myPointDirection = POINT_UP;
     myPointDirection = (int)(Math.random() * 359);
     
     //reset speed vector to 0.
     myDirectionX = 0;
     myDirectionY = 0;     
   }
}
