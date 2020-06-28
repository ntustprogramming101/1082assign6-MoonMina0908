class Dinosaur extends Enemy{
	// Requirement #4: Complete Dinosaur Class
  float speed = 1f;
	boolean state=false;
  PImage img;
  float Xspeed=speed;
  
  
  Dinosaur(float x, float y){
    super(x,y);
    img=dinosaur;
  }
  void display(){
    if(x<0||x>width-w){Xspeed*=-1;}
    int face=(Xspeed>0)?RIGHT:LEFT;;
    pushMatrix();
    translate(x,y);
    if(face==RIGHT){scale(1,1);image(img,0,0,w,h);}
    else{scale(-1,1);image(img,-w,0,w,h);}
    popMatrix();
  }
  void update(){
    x+=Xspeed;
    if(player.y==y&&((x+w<player.x&&!state&&Xspeed>0)||(x>player.x&&!state&&Xspeed<0))){
      Xspeed*=5;
      state=true;
    }
    else if(state){
      Xspeed/=5;
      state=false;
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
