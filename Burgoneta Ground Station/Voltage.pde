void Voltaje(){
  int tx = 429;
  int ty = 390;
 
  
  translate(tx,ty);
  if(v1>=3.2 && v1<= 4.1){//Start2 = true;
    NoB =false;
    mv1 = map(v1, 3.2, 4.1, 0, 120);//230
    Pv1 = int(map(v1, 3.2, 4.1, 0, 100));
    fill(6,255,0);
    noStroke();
    rectMode(CORNER);
    rect(10+51,18+2*80,51,-mv1);
  } else {
   fill(6,255,0);
   NoB = true;
   noStroke();
   rectMode(CORNER);
   rect(10+51,18+2*80,51,0);
   Pv1 = 0;
  }
  if(NoB == false){
  fill(0);
  }else{
  fill(255,0,0);
  }
  textFont (Graphs, 15);
  textAlign(CENTER);


  text(Pv1 + "%",61+25,18+2*80-Pv1);
  
  translate(-tx,-ty);
  
  if(Start4 ==true){
    Start2 = true;
    delay(20);
    FondoG();
    Start4 = false;
  }
}

