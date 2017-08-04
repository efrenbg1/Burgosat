
void MaxMin(){
  
  /////TEMPERATURA
  if(t1<100 && t1>0){
    Mt1 =100;
    mt1 = 0;
  }
  if(t1<200 && t1 >100){
    Mt1 = 200;
    mt1 = 100;
  } 
  xt1 = (Mt1-mt1)/4;
  yt1 = int((mt1 + xt1));
  y2t1 = int((mt1+ (2*xt1)));
  y3t1 = int((mt1+ (3*xt1)));
  
  //////PRESS
  if(pres < 1500 && pres >500){
    Mpres = 1500;
    mpres = 500;
  }
  if(pres <2500 && pres >1500){
    Mpres = 2500;
    mpres = 1500;
  }
  if(pres < 500 && pres >0){
    Mpres = 500;
    mpres = 0; 
  }
  xpres = (Mpres - mpres)/4;
  ypres = int(mpres + xpres);
  y2pres = int((mpres + (2*xpres)));
  y3pres = int((mpres + (3*xpres)));
  
  //////UV
  if(uv3<4 && uv3 >0){
   Muv = 4;
   muv= 0;  
  }
  if(uv3 < 8 && uv3 >4){
    Muv = 8;
    muv = 4;
  }
  if(uv3 < 12 && uv3 >8){
    Muv = 12;
    muv = 8;
  }
   
  xuv  = (Muv - muv)/4;
  yuv  = muv + xuv;
  y2uv = (muv + (2*xuv));
  y3uv = (muv + (3*xuv));
  
  ///
  if(co2<1000 && co2>0){
    Mco2 = 1000;
    mco2 = 0;
  }
  if(co2<2000 && co2>1000){
    Mco2 = 2000;
    mco2 = 1000;
  }
  if(co2<3000 && co2>2000){
    Mco2 = 3000;
    mco2 = 2000;
  }
  xco2 = (Mco2 -mco2)/4;
  yco2 = int(mco2 + xco2);
  yco22 = int((mco2 +(2*xco2)));
  yco23 = int((mco2 +(3*xco2)));
}


