/////////////////////////////////////////////////////////
//                                                     //
//                   28/06/2017                        //
//            IES EL BURGO DE LAS ROZAS                //
//              LA BURGONETA ESPACIAL                  //
//                                                     //
//                  DEVELOPED BY:                      //
//   PABLO CAMPOS, EFRÉN BOYARIZO & FERNANDO CELAYA    //
//                                                     //
/////////////////////////////////////////////////////////


//Necessary Imports

import static javax.swing.JOptionPane.*; 
import processing.serial.*;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.util.*; 
import java.net.InetAddress;
import java.util.*; 
import java.util.Date;


//App Icon

final static String LOGO  = "cansat.png";

void changeAppIcon(PImage img) {
  final PGraphics pg = createGraphics(256, 256, JAVA2D);
  pg.beginDraw();
  pg.image(img, 0, 0, 256, 256);
  pg.endDraw();
  frame.setIconImage(pg.image);
}


//statusupdate2 variables

int time0;//Manages time during each phase of the launch
int time4;//Manages time during each phase of the launch
int time3;//Manages time during each phase of the launch
int time2;//Manages time during each phase of the launch
int timef;//Manages time during each phase of the launch
int z;    //Manages time during each phase of the launch
int w;    //Manages time during each phase of the launch
int x;    //Manages time during each phase of the launch
int y;    //Manages time during each phase of the launch

int h;             //Changes from one phase of the launch to another
int l = 0;         //Changes from one phase of the launch to another
int p=0;           //Changes from one phase of the launch to another
int u;             //Changes from one phase of the launch to another
int i;             //Changes from one phase of the launch to another

boolean k = false; //Changes from one phase of the launch to another

boolean a;         //Changes from one phase of the launch to another
boolean a1 = false;//Changes from one phase of the launch to another
boolean b;         //Changes from one phase of the launch to another
boolean b1 = false;//Changes from one phase of the launch to another
boolean c;         //Changes from one phase of the launch to another
boolean c1 = false;//Changes from one phase of the launch to another
boolean d;         //Changes from one phase of the launch to another
boolean d1 = false;//Changes from one phase of the launch to another
boolean e;         //Changes from one phase of the launch to another
 
boolean g = false; //Changes from one phase of the launch to another
boolean j = false; //Changes from one phase of the launch to another


// Velocimetros & Voltage variables


    //Initial status of the sensors

float MPU9250;             //Assign a value send by the Cansat, indicating if its active or not. Seen in void Draw()
boolean MPU9250YAS = false;//True if sensor active
float BMP280;              //Assign a value send by the Cansat, indicating if its active or not. Seen in void Draw()
boolean BMP280YAS = false; //True if sensor active
float BME280;              //Assign a value send by the Cansat, indicating if its active or not. Seen in void Draw()
boolean BME280YAS = false; //True if sensor active
float ADC;                 //Assign a value send by the Cansat, indicating if its active or not. Seen in void Draw()
boolean ADCYAS = false;    //True if sensor active
float DHT;                 //Assign a value send by the Cansat, indicating if its active or not. Seen in void Draw()
boolean DHTYAS = false;    //True if sensor active

    //Resouces

PImage AgujaI;      //Blue circle that rotates, indicating a variation of the assing value
PImage instrumentos;//Backgroung image, overlaps AgujaI
PFont Graphs;       //Font used to display numeric values

    //Measurement Variables
    
boolean NoB = false;   //True when no voltage
boolean NoNS = false;  //True when connectec to 0 satellites
boolean MuchovV =false;//True when vertical speed is over  the recommended descent speed established by ESA, changes the text displaying the speed to red
boolean PocovV = false;//True when vertical speed is under the recommended descent speed established by ESA, changes the text displaying the speed to yellow
float vH;              //Horizontal Speed
float vV;              //Vertical   Speed
float v1;              //Voltage 1
float mv1;             //Maped Voltage 1 (displays voltage numeric value
int Pv1;               //Maped Volatge 1 (displays voltage grafically -> controls the rectangle that fills the battery
float nS;              //Number of Satellites
float v2;              //Voltage 2
float mv2;             //Maped Voltage 2 (displays voltage numeric value
float Pv2;             //Maped Volatge 2 (displays voltage grafically -> controls the rectangle that fills the battery


//Compas, Moving Horizon & googleearth_V2 variables
float compass = 0;//COMPASS
float CompassX = 0;//COMPASS
PFont letters;//COMPASS


float newY;//HORIZON
float newX = 0;//HORIZON

String kml;//Google Earth
public double latitude = 40.5171588; 
public double longitude = -3.896380555555556;
public double alt = 750;
float altf;
public double range = 300; 
public double tilt = 46;
public double heading = 50;
public double VH = 0;
String coordinates = longitude + "," + latitude + "," + alt;
String coordinate = coordinates;
public String googleEarthClient = "C:\\Program Files (x86)\\Google\\Google Earth\\client\\GoogleEarth.exe";
String[] lines;
String[] lines2;

boolean earth = false;






//Graficas variables

float pres;   //Pressure
float presmap;//Pressure values ajust to be displayed on screen. Depends on its Max & mins (explained later)

float hum;    //Humidity
float hummap; //Humidity values ajust to be displayed on screen. Depends on its Max & mins (explained later)

float uv;     //Value one of UV
float uv2;    //Value two of UV
float uv3;    //Diference of values one & two
float uvmap;  //UV difference values ajust to be displayed on screen. Depends on its Max & mins (explained later)

float co2;    //CO2
float co2map; //CO2 values ajust to be displayed on screen. Depends on its Max & mins (explained later)

float t1;     //Temperature
float t1map;  //Temperature values ajust to be displayed on screen. Depends on its Max & mins (explained later)

float xPos;     //Advancing position of the graphs over time
float xPos2 = 0;//Position of the previous value
float xPos3 = 0;//Position of the previous value
float xPos4 = 0;//Position of the previous value
float xPos5 = 0;//Position of the previous value
float xPos6 = 0;//Position of the previous value
float xPos7 = 0;//Position of the previous value

//MaxMin variables. These variables are in charge of reajusting the graphs if the values send by the sensor does not fit on its expected parameters

float Mpres;//Max pressure. Changes in MaxMin()
float mpres;//Min pressure. Changes in MaxMin()
float xpres;//Quarter of the difference between Max & Min
int ypres;  //Side labels that accompany the blue horizontal lines. Depend on x value
int y2pres; //Side labels that accompany the blue horizontal lines. Depend on x value
int y3pres; //Side labels that accompany the blue horizontal lines. Depend on x value
int y4pres; //Side labels that accompany the blue horizontal lines. Depend on x value

float Muv;  //Max UV. Changes in MaxMin()
float muv;  //Min UV. Changes in MaxMin()
float xuv;  //Quarter of the difference between Max & Min
float yuv;  //Side labels that accompany the blue horizontal lines. Depend on x value
float y2uv; //Side labels that accompany the blue horizontal lines. Depend on x value
float y3uv; //Side labels that accompany the blue horizontal lines. Depend on x value


float Mco2; //Max CO2. Changes in MaxMin()
float mco2; //Min CO2. Changes in MaxMin()
float xco2; //Quarter of the difference between Max & Min
int yco2;   //Side labels that accompany the blue horizontal lines. Depend on x value
int yco22;  //Side labels that accompany the blue horizontal lines. Depend on x value
int yco23;  //Side labels that accompany the blue horizontal lines. Depend on x value


float Mt1;  //Max temperature. Changes in MaxMin()
float mt1;  //Min temperature. Changes in MaxMin()
float xt1;  //Quarter of the difference between Max & Min
int yt1;    //Side labels that accompany the blue horizontal lines. Depend on x value
int y2t1;   //Side labels that accompany the blue horizontal lines. Depend on x value
int y3t1;   //Side labels that accompany the blue horizontal lines. Depend on x value




//Security variables
boolean Seguro;
int ready = 1;
int checksum = 0;
int lengt;
int serialnum;
final boolean debug = true;






Serial myPort;//Creates a serial port


//Variables used to administrate the rest of the void at the start of the app
boolean Start = true;
boolean Start2 = true;
boolean Start3 = true;
boolean Start4 = true;
boolean Start5 = false;
boolean Start6 = true;


InetAddress inet;
String host;
String timestamp = "";
String sensorReading="";
String outFilename = "data_log3.csv";
String portName;
String val;





void setup(){
  changeAppIcon( loadImage(LOGO) );
  frame.setTitle("Burgo G.S. V2.8");
  lines = loadStrings("vars.txt");
  letters = loadFont("Tunga-48.vlw");
  Graphs = loadFont("Georgia-Bold-48.vlw");
  Start = true;
  background(255,255,255);
  size(840,736);
 // Fondo1 = loadImage("FondoEstatico1.png");
  //Baterias = loadImage("battery.png");
  //VelocimetroI = loadImage("Velocimetro3.png");
  AgujaI = loadImage("Aguja.png");
  //Satellite = loadImage("Satelite.png");
 instrumentos = loadImage("instrumentos.png");
  MaxMin();
  xPos = 605;
 
  connect();
  //exec(new String[]{sketchPath("")+"player"+File.separator+"mpc.exe"}); 
}

void draw (){
   
  
  xPos = xPos + 0.5;
 
 int lol1= -100;
 int lol2 = 40;
 translate(lol1,lol2);
 fill(255);
  
  noStroke();
  rect(0,0, 700,300);
  translate(-lol1,-lol2);
 
 
 /////////
 //print(val);
 Seguridad();

  if ( myPort.available() > 0) {
   myPort.bufferUntil('\n');
   
   val = myPort.readStringUntil('\n');  
   
 if (val != null){
   log();
   float charac = float(val.length() - 1);
   print(charac);
   String parts[] = val.split("[ ]");
   print(val);
   int size = parts.length;
   if (size == 20 && charac == float(parts[19]) && parts[0].equals("@527")){
     try {
       //print("yep");
       nS = Float.valueOf(parts[2]);
       latitude = Float.valueOf(parts[3]);
       longitude = Float.valueOf(parts[4]);
       alt = Float.valueOf(parts[5]);
       altf = (float)alt;
       vH = Float.valueOf(parts[6]);
       if(vH<0){
        vH = vH*(-1); 
       }
       newX = Float.valueOf(parts[7]);
       newY = Float.valueOf(parts[8])+150;
       compass = Float.valueOf(parts[9]);
       hum = Float.valueOf(parts[10]);
       t1 = Float.valueOf(parts[11]);
       pres = Float.valueOf(parts[12]);
       co2 = Float.valueOf(parts[15])/2;
       uv = Float.valueOf(parts[16]);
       uv2 = Float.valueOf(parts[17]);
       v1 = Float.valueOf(parts[18]); 
       //print(vH);
       vV = Float.valueOf(parts[14]);
       if(vV<0){
        vV = vV*(-1);
       }
       uv3 = (uv - uv2)*1000/37;
       if(uv3 <0){
        uv3 = uv3*(-1);
       }
        if(uv3<0){
        uv3 = uv3*(-1);
       }
       if(earth== true){
       trajectory();
       }
       ready=1;
       Start5 = true;
    } 
    catch (NumberFormatException ex) {
        checksum++;
    }
   }
   if(parts[0].equals("@173")){
     String Sensores[] = parts[1].split("");
     MPU9250 = Float.valueOf(Sensores[1]);
     BMP280  = Float.valueOf(Sensores[2]);
     BME280  = Float.valueOf(Sensores[3]);
     ADC     = Float.valueOf(Sensores[4]);
     DHT     = Float.valueOf(Sensores[5]);
     
     if(MPU9250 == 1){
       MPU9250YAS = true;
     }
     if(BMP280 == 1){
       BMP280YAS = true;
     }
     if(BME280 == 1){
       BME280YAS = true;
     }
     if(ADC == 1){
       ADCYAS = true;
     }
     if(DHT == 1){
       DHTYAS = true;
     }
     
   }
  
   
  
   
 }
  } else {
   String[] fields = Serial.list();
   if (Arrays.asList(fields).contains(portName) == false){
     showMessageDialog(frame, "COM port disconnected! \nClick on the button below to reconnect.");
     connect();
   }
  } 
  if(Start3 == true){
    
     Start3 = false;
   }
  translate(-15,-330);
  Voltaje(); 
  translate(15,330);
  translate(40,0);
 
  Graficas();
  Referencias();
  translate(-40,0);
  
  //Hora_Sistema();
  translate(-200,-300);
  
  movingHorizon();
  frame();
  compass();
  
  translate(200,300);
   translate(-450,-470);
 MostrarVelocidad();
 
 translate(450,470);

  translate(-400,105);
  rectMode(CENTER);
  noStroke();
  fill(255);
  rectMode(CORNER);
  rect(0,0, 300,31);//Rectangulo que tapa los restos del velocimetro
  translate(400,-105);
  rectMode(CORNER);
  //translate(-449,436);
  fill(255);
  
  statusupdate2();
  //translate(449,-436);
  
  
}







