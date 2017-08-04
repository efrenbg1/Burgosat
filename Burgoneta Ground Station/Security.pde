void Seguridad(){
  if(Start == true ){
    Seguro = true; 
  }  
}

void connect() {
   String COMx, COMlist = "";
  try {
    if(debug) printArray(Serial.list());
    int i = Serial.list().length;
    lengt = i;
    if (i != 0) {
      if (i >= 2) {
        for (int j = 0; j < i;) {
          COMlist += char(j+'a') + " = " + Serial.list()[j];
          if (++j < i) COMlist += ",  ";
        }
        COMx = showInputDialog("Select COM port:\n"+COMlist);
        if (COMx == null) exit();
        if (COMx.isEmpty()) exit();
        i = int(COMx.toLowerCase().charAt(0) - 'a') + 1;
      }
      portName = Serial.list()[i-1];
      serialnum = (i-1);
      print(serialnum);
      if(debug) println(portName);
      myPort = new Serial(this, portName, 9600); 
      ready = 1;
      myPort.bufferUntil('\n');
      portName = Serial.list()[i-1];
    }
    else {
      showMessageDialog(frame,"Device is not connected to the PC");
      exit();
    }
  }
  catch (Exception e)
  { 
    showMessageDialog(frame,"COM port is not available (may\nbe in use by another program)");
    println("Error:", e);
    exit();
  }
  ////////
  
}


