void MostrarVelocidad(){
  float r = 0;
  if(vV > 11){
    MuchovV = true;
  }else{
    MuchovV =false;
  }
  if(vV < 8){
    PocovV = true;
  }else{
   PocovV = false; 
  }
  if(vV>20){
  r = 180;
  }else{
   r = map(vV,0,20,0,180);
  }
  float r2 = map(altf -30 ,0,2030,0,180);
  float x =255;
  float y =540;
  
  
  translate(x,y);
  
  rotate(radians(r));
  
  fill(0,0,255);
  noStroke();
  imageMode(CENTER);
  image(AgujaI,0,0,130,130);
  fill(255,0,0);
 
  if(nS > 0){
    NoNS = false;
  }else{
    NoNS = true;
  }

  rotate(radians(-r));
  translate(-138,0);
  rotate(radians(r2));
  imageMode(CENTER);
  image(AgujaI,0,0,130,130);

  
  rotate(radians(-r2));
  translate(138,0);
  
  //////////////
  
  
  translate(x-139,y);
  translate(-105,-655);
  image(instrumentos,25,25,550,250);
  translate(20,0);
  textFont (Graphs, 15);
  textAlign(LEFT);
  if(MPU9250YAS == true){
    fill(0,255,0);
  }else
  fill(0,255,0);
  text("MPU9250",-245, 0);
  //
  if(BMP280YAS == true){
    fill(0,255,0);
  }else
  fill(0,255,0);
  text("BMP280", -155, 0);
  //
  if(BME280YAS == true){
    fill(0,255,0);
  }else
  fill(0,255,0);
  text("BME280", -65, 0);
  //
  if(ADCYAS == true){
    fill(0,255,0);
  }else
  fill(0,255,0);
  text("ADC", 20, 0);
  //
  if(DHTYAS == true){
    fill(0,255,0);
  }else{
  fill(0,255,0);
  text("DHT", 70, 0);
  }
   translate(-20,0);
  //fill(102,0,204);
  //fill(0,204,102);
  fill(0,255,0);
  //fill(0,200,0);
  textAlign(LEFT);
  textFont (Graphs, 55);
  if(minute() < 10){
  text(hour() + ":0" + minute() + ":" + second(),-200,-45);
  }else{
  text(hour() + ":" + minute() + ":" + second(),-200,-45);
  }
  textFont (Graphs, 35);
  text(day() + "/" + month() + "/" + year(),90, -58);
  
  translate(-10,125);
  fill(0,255,0);
  textFont (Graphs, 20);
  textAlign(CENTER);
  textFont (Graphs, 17.5);
  if(MuchovV == false){
    fill(0,255,0);
  }else{
    fill(255,0,0);
  }
  if(PocovV == true){
   fill(255,255,0); 
  }
  
  text(vV + "m/s",0,0);
  fill(0,255,0);
  text("Vertical Speed",0,22);
  if(NoNS == false){
    fill(0,255,0);
  }else{
    fill(255,0,0);
  }
  text("N Satellites",145,22);
  text(int(nS), 148,-39);
  if(NoB == false){
  fill(0,255,0);
  }else{
  fill(255,0,0);
  }
  text("Voltage",245,22);
  translate(10,-125);
  fill(0,255,0);
  translate(-149,125);
  text(altf + "m",0,0);
  text("Altitude",0,22);
  translate(149,-125);
  translate(105,655);
  translate(-x,-y);

  translate(-(x-138),-y);

  fill(0);
 
}
