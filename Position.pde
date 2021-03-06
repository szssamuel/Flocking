/*
 *      Copyright 2017 Sámuel Szabó-Sinka
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

class Position {
  private int x;
  private int y;
  
   public Position() {
    this.x = 0;
    this.y = 0;
  }
  
  public Position(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  public Position(float x, float y) {
    this.x = round(x);
    this.y = round(y);
  }
 
  public int getX() {
    return this.x; 
  }
 
  public int getY() {
    return this.y; 
  }
 
  public void setPos(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  public void setPos(float x, float y) {
    this.x = round(x);
    this.y = round(y);
  }
}