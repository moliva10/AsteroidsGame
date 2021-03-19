//float[][] corners = { { -8, -8 }, { 16, 0 }, { -8, 8 }, { -2, 0 }, { -8, -8 } };
final static int ROTATE = 2; //speed of rotation
final static int PRESSED_FACTOR = 5; //Multipler if key is pressed an held down
final static double ACCELERATE = 0.5; //Rate of increase for each key press
final static int NUM_ASTEROIDS = 10;

//Spaceship Constants
public final static int SHIP_COLOR = 255; //white
public final static int POINT_UP = -90; //Starting and Hyperscape direciton

//Star Constants
public final static int STAR_DIMENSION = 3; 

Spaceship bob;
ArrayList<Asteroid> asteroids;
ArrayList<Bullet> bullets;
Star[] nightSky = new Star[200];
PFont f;

//Used to adjust fine/course control of rotation and acceleration
boolean leftIsPressed = false;
boolean rightIsPressed = false;
boolean upIsPressed = false;


public void setup() {
  size(640, 480);
  background(0);
  f = createFont("Arial",16,true); // STEP 2 Create Font
  bob = new Spaceship( );
  bullets = new ArrayList<Bullet>();
  
  asteroids = new ArrayList<Asteroid>();
  for(int i = 0; i < NUM_ASTEROIDS; i++){
    asteroids.add( new Asteroid() );
  } 

  //Initlaize array of Stars
  for(int i = 0; i < nightSky.length; i++){
    nightSky[i] = new Star(); 
  }
}

public void draw() {
  //Black out screen every frame
  background(0);
  
  textFont(f,16);                  // STEP 3 Specify font to be used
  fill(255);                       // STEP 4 Specify font color 
  //text("Hello Strings!",10,100);   // STEP 5 Display Text
  
  //Display all stars after blacking out image
  for (Star s: nightSky){
    s.show();
  }
  
  for (int i = 0; i < asteroids.size(); i++){
    asteroids.get(i).show();
    asteroids.get(i).move();
    float d = dist(bob.getX(), bob.getY(), asteroids.get(i).getX(), asteroids.get(i).getY());
    if (d < 20){
      asteroids.remove(i);
      i--;
    }
  }
    
  int i = 0;  
  while(bullets.size() > 0 && i < bullets.size() ){
    //print("i: " + i );
    bullets.get(i).show();
    bullets.get(i).move();  
    
    //remove Bullets that fly off the screen
    //print("bullets.get(i).getX(): " + bullets.get(i).getX());
    if (bullets.get(i).getX() < 0 || bullets.get(i).getX() > width || 
        bullets.get(i).getY() < 0 || bullets.get(i).getY() > height)
    {
      bullets.remove(i);
      i--;
      if( i < 0){
          break;
      }
    }
    
    int j = 0;
    while ( asteroids.size() > 0 && j < asteroids.size() ){
      //asteroids.get(j).show();
      //asteroids.get(j).move();
      float d = dist(bullets.get(i).getX(), bullets.get(i).getY(), asteroids.get(j).getX(), asteroids.get(j).getY());
      if (d < 10){
        bullets.remove(i);        
        i--;
        asteroids.remove(j);
        j--;     
        if( i < 0 || j < 0){
          break;
        }
      }
      j++; //Next asteriod
    }
    i++; //next bullet
  }
    
  // Redraw spaceship at current location
  bob.show(); 
  //Update location of spaceship based on current speed (myDirectionX/Y vector)
  bob.move();   
      
}

//Event Handler when keys are pressed
public void keyPressed(){
  
  //check for a coded key (arrow keys, UP, DOWN, LEFT, RIGHT)
  if (key == CODED) {
    if (keyCode == LEFT) { 
      int rotate = 0;
        //Check to see if key is currently pressed, rotate coarser
        if(leftIsPressed){
          rotate = -ROTATE * PRESSED_FACTOR;
        }
        //If not currently pressed, rotate finer
        else{ 
          rotate = -ROTATE;
          leftIsPressed = true;
        }
        bob.rotate(rotate);
        
    }
    else if (keyCode == RIGHT) {   
      int rotate = 0;
      //Check to see if key is currently pressed, rotate coarser
      if(rightIsPressed){
        rotate = ROTATE * PRESSED_FACTOR;
      }
      //If not currently pressed, rotate finer
      else{ 
        rotate = ROTATE;
        rightIsPressed = true;
      }
      bob.rotate(rotate);        
    }
    else if (keyCode == UP){
      double accelerate = 0.0;
      //Check to see if key is currently pressed, accelerate coarser
      if(upIsPressed){
        accelerate = ACCELERATE * 0.5; //PRESSED_FACTOR;
      }
      //If not currently pressed, accelerate finer
      else{ 
        accelerate = ACCELERATE;
        upIsPressed = true;
      }
      bob.accelerate( accelerate );
    }
    else if (keyCode == SHIFT){
      bob.hyperspace();
    }   
    else if (keyCode == CONTROL){
      text("Control pressed",10,100);   // STEP 5 Display Text
      bullets.add( new Bullet(bob) );     
      if (rightIsPressed)
        bob.rotate(ROTATE * PRESSED_FACTOR);
      if (leftIsPressed)
        bob.rotate(-ROTATE * PRESSED_FACTOR);
      //rightIsPressed = true; //does pressing b cause keyReleased() to fire?
      //leftIsPressed = true; //does pressing b cause keyReleased() to fire?
    }
  }
  else if (key == 'b'){
      text("b pressed",10,100);   // STEP 5 Display Text
      bullets.add( new Bullet(bob) );
      //text("b pressed",10,100);   // STEP 5 Display Text
      if (rightIsPressed)
        bob.rotate(ROTATE * PRESSED_FACTOR);
      if (leftIsPressed)
        bob.rotate(-ROTATE * PRESSED_FACTOR);
      //rightIsPressed = true; //does pressing b cause keyReleased() to fire?
      //leftIsPressed = true; //does pressing b cause keyReleased() to fire?
    }
}

//Event Handler when key is released (set booleans to fall)
public void keyReleased(){
  
  //check for a coded key (arrow keys, UP, DOWN, LEFT, RIGHT)
  if (key == CODED) {
    if (keyCode == LEFT) { 
      leftIsPressed = false;
    }
    else if (keyCode == RIGHT) { 
      rightIsPressed = false;
    }
    else if (keyCode == UP){
      upIsPressed = false;
    }
    
  }
}
  
