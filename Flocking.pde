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

DotList dotList;
int n = 50;

void setup() {
  background(0);
  size(1000,500);
  
  noStroke();
  fill(255);
  dotList = new DotList(n);
  
}

void draw() {
  background(0);
  dotList.drawElements();
  
}