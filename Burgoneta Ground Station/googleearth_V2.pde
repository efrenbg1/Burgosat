
void trajectory(){
  coordinates = coordinates + " " + longitude + "," + latitude + "," + alt;
  coordinate = longitude + "," + latitude + "," + alt;
  //latitude = latitude + 0.0001;
  //longitude = longitude + 0.0001;
  //alt = alt + 10;
  if (heading >= 355){
  heading = 0;
  }else{
  heading = heading + 5;
  }
  text("Loading Google Earth...", 100,55); 
try 
  {
    File localFile = new File("C:\\CanSatGS\\earth.kml");
    FileWriter fos = new FileWriter(localFile);
    fos.write(getKML());
    fos.flush();
    fos.close();    
    String command = googleEarthClient + " " + localFile.getCanonicalPath();
    Process proc = Runtime.getRuntime().exec(command); 
  }
  catch(IOException e)
  {
  }  
}


String getKML()
{
  kml = lines[0];
  for(int i=1; i<lines.length; i++){
  //println(lines[i]);
  kml = kml + lines[i];
} 

kml = kml + getKML2();
  //println(kml);
  return kml;

}
String getKML2()//Configures the KML code to work in Processing
{
  String kml = "VH: " + vH + "m/s"
    + "</name>"
    + "<LookAt>"
    + "<longitude>"
    + longitude
    + "</longitude>"
    + "<latitude>"
    + latitude
    + "</latitude>"
    + "<altitude>"
    + alt
    + "</altitude>"
    + "<heading>"
    + heading
    + "</heading>"
    + "<tilt>"
    + tilt
    + "</tilt>"
    + "<range>"
    + range
    + "</range>"
    + "<altitudeMode>absolute</altitudeMode>"
    + "</LookAt>"
    + "<styleUrl>#msn_plane2</styleUrl>"
    + "<Point>"
    + "<extrude>1</extrude>"
    + "<altitudeMode>absolute</altitudeMode>"
    + "<gx:drawOrder>1</gx:drawOrder>"
    + "<coordinates>"
    + coordinate
    + "</coordinates>"
    + "</Point>"
    + "</Placemark>"
    + "<Placemark>"
    + "<name>Trajectory</name>"
    + "<description>Real Time Trajectory</description>"
    + "<styleUrl>#m_ylw-pushpin</styleUrl>"
    + "<LineString>"
    + "<extrude>1</extrude>"
    + "<tessellate>1</tessellate>"
    + "<altitudeMode>absolute</altitudeMode>"
    + "<coordinates>"
    + coordinates
    + "</coordinates>"
    + "</LineString>"
    + "</Placemark>"
    + "<LookAt>"
    + "<longitude>"
    + longitude
    + "</longitude>"
    + "<latitude>"
    + latitude
    + "</latitude>"
    + "<altitudeMode>absolute</altitudeMode>"
    + "<altitude>"
    + alt
    + "</altitude>"
    + "<range>"
    + "222"
    + "</range>"
    + "<tilt>60</tilt>"
    + "<heading>"
    + heading
    + "</heading>"
    + "</LookAt>"
    + "</Document>"
    + "</kml>";
  return kml;
}
