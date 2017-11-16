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

class Dot {
  private Position pos;
  private float dir;
  private float speed;
  private int id;
  private boolean following;
  
  public Dot(int id) {
   this.pos = new Position(random(width),random(height));
   this.dir = random(TWO_PI);
   this.speed = random(3);
   this.id = id;
   this.following = false;
  }
  
  public Position getPos() {
    return this.pos;
  }
  
  public float getDir() {
    return this.dir;
  }
  
  public float getSpeed() {
     return this.speed; 
  }
  
  public int getId() {
    return this.id;
  }
  
  public void setFollowing(boolean var) {
    this.following = var;
  }
  
  public boolean isFollowing() {
    return this.following;
  }
  
  public Position nextPos() {
    
    while(dir < 0)
      dir += TWO_PI;
    while(dir >= TWO_PI)
      dir -= TWO_PI;
    
    if((pos.getX()<=5 && sin(dir)<0) || (pos.getX()>=width-5 && sin(dir)>0)) {
      //print("WALL!\t"+dir+"   ->\t");
      dir = TWO_PI - dir;
      //println(dir);
    }
    if((pos.getY()<=5 && cos(dir)<0) || (pos.getY()>=height-5 && cos(dir)>0)) {
      //print("WALL!\t"+dir+"   ->\t");
      dir = PI - dir;
      //println(dir);
    }
    
    pos.setPos(pos.getX()+sin(dir)*speed,pos.getY()+cos(dir)*speed);
    //println("("+pos.getX()+","+pos.getY()+")\t"+(float)(round(dir*1000))/1000+"\t"+(float)(round(speed*1000))/1000);
    return pos;
  }
  
  public void changeDir(float newDir) {
    if(!following) {
      float change = random(PI/16);
      if(random(2)<1)
        change *= -1;
  
      dir += change;
      while(dir < 0)
        dir += TWO_PI;
      while(dir >= TWO_PI)
        dir -= TWO_PI;
    } else
      dir = newDir;
  } //<>//
   //<>//
  public void changeSpeed(float newSpeed) { //<>//
    if(!following) { //<>//
      float change = random(0.3); //<>//
      if(random(2)<1)
        change *= -1;
      speed += change;
      if(speed<0.5)
        speed = 0.7;
      else if(speed>3)
        speed = 2.7;
    }
    else
      speed = newSpeed;
  }
  
  public void collide(Dot otherDot) {
    //println(id+"("+following+"): COLLISION!");
    this.following = true;
    this.dir = otherDot.getDir();
    this.speed = otherDot.getSpeed();
    
  }
  
  public void drawMe() {
    fill(255);
    ellipse(pos.getX(),pos.getY(),10,10);
    fill(50);
    ellipse(pos.getX()+sin(dir)*3,pos.getY()+cos(dir)*3,3,3);
  }
  
}