class City extends Facility{
    
    City(int rCred, int rCgreen, int rCblue){
      setCost(0,3,2,0,0);
      setColor(rCred,rCgreen,rCblue);
    }

    City(){
      setCost(0,3,2,0,0);
      setColor(0,0,255);
    }
    
    //NOTE: no check function

}