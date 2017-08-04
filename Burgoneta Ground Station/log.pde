void log() {
    sensorReading=trim(sensorReading);
    timestamp=hour()+""+minute()+""+second()+" " ;
  appendTextToFile(outFilename, timestamp +   val);
}
void appendTextToFile(String filename, String text){
  File f = new File(dataPath(filename));
  if(!f.exists()){
    createFile(f);
  }
  try {
    PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(f, true)));  
    out.println(text);
    out.close();                                     
  }catch (IOException e){
      e.printStackTrace();
  }
}
void createFile(File f){
  File parentDir = f.getParentFile();
  try{
    parentDir.mkdirs(); 
    f.createNewFile();
     }
    catch(Exception e){
    e.printStackTrace();
    }
}   
