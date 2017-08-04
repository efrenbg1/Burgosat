
void Graficas(){
  MaxMin();
  if(Seguro == true){//contrasena
    stroke(0);
    strokeWeight(1);
    textFont (Graphs, 15);
    if(co2<Mco2 && co2>mco2){//CO2
      stroke(0);
      strokeWeight(1);
    
      float co2map2 = co2map;
      co2map = map(co2,mco2,Mco2,117,204.75);
      //if(co2map >0 && co2map <117){
      line(xPos, -1*(co2map - 585), xPos, -1*(co2map +2 - 585));
      line(xPos, -1*(co2map - 585), xPos6, -1*(co2map2 +2 - 585));
      xPos6 = xPos;
      
      
      //}
     fill(255,255,255);
      strokeWeight(1);
      rect(750,351,50,15);
      fill(102,0, 102);
      textAlign(RIGHT);
      text(int(co2) ,799,364);
    }
   
    if(uv3<Muv && uv3>muv){//UV
      stroke(0);
      strokeWeight(1);

      float uvmap2 = uvmap;
      uvmap = map(uv3,muv,Muv,0,87.75);//
     
      line(xPos, -1*(uvmap - 585), xPos, -1*(uvmap +2 - 585));
      line(xPos, -1*(uvmap - 585), xPos2, -1*(uvmap2 +2  - 585));
      
      xPos2 = xPos;
      
      fill(255,255,255);
      strokeWeight(1);
      rect(750,468,50,15);
      fill(102,0, 102);
      textAlign(RIGHT);
      text(uv3,799,481);
    }
    
    if(hum >0){//HUMEDAD
      stroke(0);
      strokeWeight(1);
    
      float hummap2 = hummap;
      hummap = map(hum,0,100,234,321.75);
     
      line(xPos, -1*(hummap - 585), xPos, -1*(hummap +2 - 585));
      line(xPos, -1*(hummap - 585), xPos3, -1*(hummap2 +2 - 585));
      xPos3 = xPos;
      
      fill(255,255,255);
      strokeWeight(1);
      rect(750,234,50,15);
      fill(102,0, 102);
      textAlign(RIGHT);
      text(int(hum),799,247);
    }
    if(pres< Mpres && pres>mpres){//PRESION
      stroke(0);
      strokeWeight(1);
    
      float presmap2 = presmap;
      presmap = map(pres,mpres,Mpres,351,438.75);
     
      line(xPos, -1*(presmap - 585), xPos, -1*(presmap +2 - 585));
      line(xPos, -1*(presmap - 585), xPos4, -1*(presmap2 +2 - 585));
      xPos4 = xPos;
      
      fill(255,255,255);
      strokeWeight(1);
      rect(750,117,50,15);
      fill(102,0, 102);
      textAlign(RIGHT);
      text(int(pres),799,130);
    }
    if(t1<Mt1 && t1 >mt1){//TEMPERATURA1
      stroke(0);
      strokeWeight(1);
      
      float t1map2 = t1map;
      t1map = map(t1,mt1,Mt1,468,555.75);
      
      line(xPos, -1*(t1map - 585), xPos, -1*(t1map +2 - 585));
      line(xPos, -1*(t1map - 585), xPos5, -1*(t1map2 +2 - 585));
      xPos5 = xPos;
      
      fill(255,255,255);
      strokeWeight(1);
      rect(750,0,50,15);
      fill(102,0, 102);
      textAlign(RIGHT);
      text(int(t1),799,13);
    }
    
    
    Start2 = true;
    //Seguro = false;
  }
  
  if(xPos == width-38){
     
      Start = true;
      Start2 = true;
   
      FondoG();
     
      //print("VAMOH A CALMARNOS");
      
      xPos = 605;
      xPos2 = xPos;
      xPos3 = xPos;
      xPos4 = xPos;
      xPos5 = xPos;
      xPos6 = xPos;
      xPos7 = xPos;  
  }
  if(Start5 == true && Start6 == true){
   Start = true;
   delay(200);
   MaxMin();
   
   FondoG();
   
   Start5 = false;
   Start6 = false;  
  }
}

