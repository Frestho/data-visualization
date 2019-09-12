float[] lengths = {39, 59, 51, 97, 69, 93, 98, 89, 93, 96, 123, 102, 101, 118}; //in minutes
void setup(){
  size(500, 500);
  axes();
  
  strokeWeight(3);
  labelAxes();
  plotLog();
  graph();
}
void axes() {
  line(60, 460, 60, 40);  //y-axis
  line(60, 460, 440, 460);  //x-axis
}
void labelAxes(){
  for(int i = 0; i < 14; i += 1) {
    stroke(0);
    fill(0);
    text((int) i * 10, 30, 460 - i * 13 * 2.5); 
  }
  textSize(15);
  text("Average temperatures in San Francisco by month",120,50);
  pushMatrix();
  translate(20, 360);
  rotate(-HALF_PI);
  translate(-20, -320);
  text("Length of Episode in Minutes", 20, 320);
  popMatrix();
}
void graph() {
  noFill();
  beginShape();
  strokeWeight(2);
  stroke(0, 179, 255);
  noFill();
  for(int i = 0; i < lengths.length; i++) {
    vertex(90 + 360/14 * i,460-lengths[i]*3.3);
  }
  endShape();
  stroke(255, 0, 0);
  strokeWeight(5);
  for(int i = 0; i < lengths.length; i++) {   
    point(90 + 360/14 * i,460-lengths[i]*3.3);
  }
}
void plotLog() {
  stroke(0);
  strokeWeight(1);
  for(int i = 60; i < 450; i++) {
    point((float)i, (float) (460 - (43 * Math.log((i-60)*(14.0/360.0)+1)*3.3)));
  }
}
