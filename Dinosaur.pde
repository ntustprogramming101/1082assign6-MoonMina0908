class Dinosaur extends Enemy{
	// Requirement #4: Complete Dinosaur Class
  float speed = 2f/2;
	final float TRIGGERED_SPEED_MULTIPLIER = 5;
  int state=0;
  
  Dinosaur(float x, float y){
    super(x,y);
  }
  void display(){
    
  }
  void update(){
    x += speed;
    if(x<0||x>width-dinosaur.width){
      speed *=-1;
    }
    
  }
  
	// HINT: Player Detection in update()
	/*
	float currentSpeed = speed
	If player is on the same row with me AND (it's on my right side when I'm going right OR on my left side when I'm going left){
		currentSpeed *= TRIGGERED_SPEED_MULTIPLIER
	}
	*/
}
