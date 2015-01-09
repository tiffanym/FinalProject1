import java.util.*;
//importing sprite animation stuff
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;

class Game_Files{
    
    protected int[] unspentProduction;
    protected Object[][] cityMap;
    protected Object[][] roadMap;
    
    Game_Files(){
        unspentProduction = new int[];//{3,3,2,3,2,1};
        cityMap = setTiles(11,11,1);
    }
    
    void setTiles(int rows,int cols,int k){
        Object[][] map = new Object[rows][cols];
        for(int i=1;i<11;i+=2){
          int j=k*abs(((5-i)/2)+1);
          map[i][j]= makeTile();
        }
    }
    
    Tiles makeTile(){
        Tiles tile = new Tiles();
        if(unspentProduction[tile.getProduction]>0){
           unspentProduction[tile.getProduction]--;
           return tile;
        } else{
           makeTile();
           return null;
        }
    }

    boolean check(Object facility,int x, int y){
       Object thing= cityMap[x][y];
       String thingName=thing.getClass().getSimpleName(); //what is already there
       String putThingName=facility.getClass().getSimpleName(); //what you want to put
       String[] classes={"Settlement","Cities","Facilities"};
       if (thingName==null || Arrays.asList(classes).contains(thingName)){
           return false;
       } 
       else{
           cityMap[x][y]= new facility.getClass();
           return true;
       }
    }

}
         
