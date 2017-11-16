/*
 *      Copyright [yyyy] [name of copyright owner]
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 */

class DotList {
  private ArrayList<Dot> elements;
  private int size;
  private int[] flockMemory;
  //private int[][] mapMemory;
  
  public DotList(int size) {
    this.size = size;
    elements = new ArrayList<Dot>();
    flockMemory = new int[size];
    for(int i=0; i<size; i++) {
       elements.add(new Dot(i));
    }
    //mapMemory = new int[width][];
    //for(int i=0; i<width; i++) {
      //mapMemory[i] = new int[height];
    //}
  }
  
  public void drawElements() {
    for(int i=0; i<size; i++) {
      Dot dot = elements.get(i);
      Position pos = dot.getPos();
      
      Dot otherDot;
      Position otherPos;
      
      for(int j=0; j<size; j++) {
        if(i!=j) {
          otherDot = elements.get(j);
          otherPos = otherDot.getPos();
          if(abs(pos.getX()-otherPos.getX()) <=15 && abs(pos.getY()-otherPos.getY()) <= 15) {
            /*for(int t=0; t<size; t++) {
              if(flockMemory[t] == dot.getId()) { 
                flockMemory[t] = otherDot.getId();
                elements.get(t).changeDir(otherDot.getDir());
                elements.get(t).changeSpeed(otherDot.getSpeed());
              }
            }*/
            if(!dot.isFollowing()) {
              dot.collide(otherDot);
              flockMemory[dot.getId()] = otherDot.getId();
            }
          }
        }
      }
      
      /*
      int occupID;
      pos = dot.getPos();
      mapMemory[pos.getX()][pos.getY()] = 0;
      
      pos = dot.nexPos(); //<>//
      occupID = mapMemory[pos.getX()][pos.getY()];
      if(occupID == 0) {
        mapMemory[pos.getX()][pos.getY()] = elements.get(i).getId();
        elements.get(i).drawMe();
      } else {
        Dot otherDot = elements.get(occupID);
        
        dot.collide(otherDot);
        otherDot.collide(dot);
      }*/
      
      if(!dot.isFollowing()) {
        if(random(5)<1) {
          dot.changeDir(0);
          for(int j=0; j<size; j++) {
            if(i!=j && flockMemory[j] == i)
              elements.get(j).changeDir(dot.dir);
              
          }
        }
        if(random(10)<1) {
          dot.changeSpeed(0);
          for(int j=0; j<size; j++) {
            if(i!=j && flockMemory[j] == i)
              elements.get(j).changeSpeed(dot.speed);
          }
        }
      }
      pos = dot.nextPos();
      dot.drawMe();
    }
  }
  
}