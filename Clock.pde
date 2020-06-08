class Clock extends Item{
	// Requirement #2: Complete Clock Class
  float []clockX,clockY;
  Clock(float x, float y){
    super(x,y);
    img = clock;
  }
  void display(){
    for(int i = 0; i < clockX.length; i++){
      image(clock, clockX[i], clockY[i]);}
  }
  void checkCollision(Player player){
    for(int i = 0; i < clockX.length; i++){
      if(isHit(clockX[i], clockY[i], SOIL_SIZE, SOIL_SIZE, player.x, player.y, player.w, player.h)){

        addTime(CLOCK_BONUS_SECONDS);
        clockX[i] = clockY[i] = -1000;
        isAlive=false;
       }
    }
  }
	/*
	Code for Reference:

		for(int i = 0; i < clockX.length; i++){

			// Display Clock
			image(clock, clockX[i], clockY[i]);

			// Check collision with player
		    if(isHit(clockX[i], clockY[i], SOIL_SIZE, SOIL_SIZE, player.x, player.y, player.w, player.h)){

				addTime(CLOCK_BONUS_SECONDS);
				clockX[i] = clockY[i] = -1000; // Now that they're objects, toggle isAlive instead of throwing them away from screen

			}

		}
	*/
}
