class Robot extends Enemy{

	final int PLAYER_DETECT_RANGE_ROW = 2;
	final int LASER_COOLDOWN = 180;
	final int HAND_OFFSET_Y = 37;
	final int HAND_OFFSET_X_FORWARD = 64;
	final int HAND_OFFSET_X_BACKWARD = 16;
  Laser laser=new Laser();
  int face=1,lasernum=0;
  float speed=2f,speedX;
  
  Robot(float x,float y){
    super(x,y);
  }
  
  void display(){
    pushMatrix();
    translate(x+(face==-1?w:0),y);
    scale(face,1);
    image(robot,0,0);
    popMatrix();  
    
    laser.display();
  }
  
  void update(Player player){
    int robotR=floor(y/SOIL_SIZE);
    int playR=floor(player.y/SOIL_SIZE);
    boolean checkX=(face==1&&(player.x+w/2)>x)||(face==-1&&(player.x+w/2)<x);
    boolean checkY=abs(robotR-playR)<=PLAYER_DETECT_RANGE_ROW;
    
    if(checkX&&checkY){
      speed=0;
      if(lasernum==0){
        if(face==1)laser.fire(x+HAND_OFFSET_X_FORWARD,y+HAND_OFFSET_Y,player.x+w/2,player.y+h/2);
        else laser.fire(x+HAND_OFFSET_X_BACKWARD,y+HAND_OFFSET_Y,player.x+w/2,player.y+h/2);
        lasernum=LASER_COOLDOWN;
      }
    }else{
      speed=2;
    }
    if(lasernum>0)lasernum--;
    if(x>=width-w||x<=0){face=-face;}
    x+=speed*face;
     laser.update();

  }
  
  void checkCollision(Player player){
    
    if(isHit(x, y, w, h, player.x, player.y, player.w, player.h)){
      laser.checkCollision(player);
      player.hurt();

    }
  }
	// HINT: Player Detection in update()
	/*

	boolean checkX = ( Is facing forward AND player's center point is in front of my hand point )
					OR ( Is facing backward AND player's center point (x + w/2) is in front of my hand point )

	boolean checkY = player is less than (or equal to) 2 rows higher or lower than me

	if(checkX AND checkY){
		Is laser's cooldown ready?
			True  > Fire laser from my hand!
			False > Don't do anything
	}else{
		Keep moving!
	}

	*/
}
