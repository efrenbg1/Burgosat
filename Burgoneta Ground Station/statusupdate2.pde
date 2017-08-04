boolean CelayaEresUnMierdas = false;
boolean EnUso = false;
void statusupdate2(){
  boolean lanzamiento =false;
  
  float xc = -449;
  float yc = 436;
  int tiempo; 
  int tiempo2 = second() + 1;
  //int td = (tiempo2 - tiempo)/60;
  
  translate(xc,yc);
  stroke(0);
  strokeWeight(2);
  textFont (Graphs, 17.5);
  textAlign(LEFT);
  fill(255,255,255);
  rect (0,0,840,150);
  noFill();
  rect(2.6, 100, 835, 45);
  fill(0);
  textSize(13);
  text("LA BURGONETA ESPACIAL", 551.4, 25);
  fill(204, 102, 0);
  textSize(20);
  text ("T ="  , 551.4, 50);

  fill(204, 102, 0);
  
  noFill();
  
  line(2.6,100,2.6, 80);
  if(a1==true){
    fill(0,255,0);
  }else if(a1 == false){
    fill(204, 102, 0);
  }
  textSize(13);
  text("Countdown",4,99);
  line(5+(width-10)*10/105,100,5+(width-10)*10/105, 80);
  line(5+(width-10)*10/105,140,5+(width-10)*10/105, 105);
  if(b1==true){
    fill(0,255,0);
  }else if(b1 == false){
    fill(204, 102, 0);
  }
  text("Fire",6+(width-10)*10/105,99);
  line(5+(width-10)*25/105,100,5+(width-10)*25/105, 80);
  line(5+(width-10)*25/105,140,5+(width-10)*25/105, 105);
  if(c1==true){
    fill(0,255,0);
  }else if(c1 == false){
    fill(204, 102, 0);
  }
  text("Free",6+(width-10)*25/105,99);
  line(5+(width-10)*30/105,100,5+(width-10)*30/105, 80);
  line(5+(width-10)*30/105,140,5+(width-10)*30/105, 105);
  if(d1==true&&g==false){
    fill(0,255,0);
  }else if(d1 == false&&g==false){
    fill(204, 102, 0);
  }else if(g == true){
    fill(255,0,0);
  }else if(j == true){
    fill(0,255,0);
  }
  text("Parachute opened",6+(width-10)*30/105,99);
  line(7.5+(width-10)*105/105,100,7.5+(width-10)*105/105, 80);
  fill(204, 102, 0);
  
  
  
  if(a==false&&b==false&&c==false&&d==false&&e==false){
    textSize(60);
    text("READY",5,70);
    textSize(20);
    
  }
  if(k==true){
    while(p<1){
      p = p+1;
      h = second() + minute()*60 + hour()*3600;
    }
    l = (h - second() - minute()*60 - hour()*3600)*-1;
    u = 0 + l;
    i = u;
  }else if(k==false){
    l = 0;
  }
  
  if((a == true||key=='1')&&z<1){
    z = ((time0 - second() - minute()*60 - hour()*3600)* -1)-3;
    a1 = true;
    textSize(20);
    text(z + " s", 586.9, 50);
    textSize(55);
    
   
    text("COUNTDOWN: " + z*-1,5,70);
    
    noStroke();
    fill(204, 102, 0, 125);
    rect(5,101,5+(z+3)*(width-10)*1/105*10/3,43);
    stroke(0);
    
  }else if (b==true){
    z = ((time0 - second() - minute()*60 - hour()*3600)* -1)-3;
    y = (time2 - second() - minute()*60 - hour()*3600)* -1;
    b1 = true;
    
    textSize(20);
    text(z+ " s", 586.9, 50);
    textSize(55);
    text("ASCENDING",5,70);
    noStroke();
    fill(204, 102, 0, 125);
    rect(5,101,5+(width-10)*10/105+(y-u)*(width-10)*1/105,43);
    stroke(0);
    
        
  }else if (c==true){
    z = ((time0 - second() - minute()*60 - hour()*3600)* -1)-3;
    x = (time3 - second() - minute()*60 - hour()*3600)* -1;
    c1 = true;
    
    textSize(20);
    text(z + " s", 586.9, 50);
    
    textSize(55);
    text("DEPLOYED",5,70);
    noStroke();
    fill(204, 102, 0, 125);
    rect(5,101,5+(width-10)*25/105+x*(width-10)*1/105,43);
    stroke(0);
  
  
  
  }else if(d == true){
    z = ((time0 - second() - minute()*60 - hour()*3600)* -1)-3;
    w = (time4 - second() - minute()*60 - hour()*3600)* -1;
    d1 = true;
    
    textSize(20);
    text(z + " s", 586.9, 50);
    textSize(60);
    text("DESCENDING",5,70);
    noStroke();
    fill(204, 102, 0, 125);
    rect(5,101,5+(width-10)*30/105+(w-u)*(width-10)*1/105,43);
    stroke(0);
  
  
  }else if(e == true){
    textSize(20);
    z = ((time0 - second() - minute()*60 - hour()*3600)* -1)-3;
    text(timef + " s", 586.9, 50);
    textSize(55);
    text("TOUCHDOWN",5,70);
    noStroke();
    fill(0, 255, 0, 125);
    rect(5,101,5+(width-10),43);
    stroke(0);
  
  }
  //println(z,",",w,",",h,",",l,",",y,",",k,",",y-l);
}

void keyPressed(){
  if (key == '1'){
    a = true;
    b = false;
    c = false;
    d = false;
    time0 = second() + minute()*60 + hour()*3600;
    noStroke();
    fill(255);
    rect(0,0,1000,80);
    text(time0, 561.4,50);
    stroke(1);
    u = 0;
    //tiempo = second();
  }else if(key == '2'){
    a = false;
    b = true;
    c = false;
    d = false;
    time2 = second() + minute()*60 + hour()*3600;
    u = 0;
  }else if(key == '3'){
    a = false;
    b = false;
    c = true;
    d = false;
    time3 = second() + minute()*60 + hour()*3600;
    u = 0;
  }else if(key == '4'){
    a = false;
    b = false;
    c = false;
    d = true;
    time4 = second() + minute()*60 + hour()*3600;
    u=0;
  }else if(key == 'g'){  
   if (earth == true){
     earth = false;
   }else{
    earth = true;
   }
  }else if(key == '5'){
    a = false;
    b = false;
    c = false;
    d = false;
    e = true;
    timef = z;
  }else if(key == BACKSPACE){
    u = i;
    k = true;
  }else if(key == '6'){
    if(CelayaEresUnMierdas == true && EnUso == false){
      g = false;
      j = true;
      EnUso = true;
      CelayaEresUnMierdas = false;
    }
    if(CelayaEresUnMierdas == false && EnUso == false){
    g = true;
    EnUso = true;
    CelayaEresUnMierdas = true;
    }
    EnUso = false;
  }else if(key == 'g'){
    if(earth == true){
      earth = false;
    }else{
   earth = true; 
    }
  }
    
}

void keyReleased(){

  h = 0;
  p=0;
  k = false;

}
