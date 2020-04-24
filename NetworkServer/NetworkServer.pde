import processing.net.*;

Server myServer;
String outgoing;
String incoming;
String valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ 1234567890!@#$%^&*()_+-={}[]<>,.?/~`\\";

void setup(){
  size(300,300);
  textAlign(CENTER,CENTER);
  textSize(20);
  incoming = "";
  outgoing = "";
  myServer = new Server(this,1234);
}

void draw(){
  background(0);
  fill(255);
  text(incoming, width/2, height/2 - 100);
  text(outgoing, width/2, height/2 + 100);
  Client myClient = myServer.available();
  if(myClient != null){
    incoming = myClient.readString();
  }
}

void keyPressed(){
  if(key == ENTER){
    myServer.write(outgoing);
    outgoing = "";
  }else if(key == BACKSPACE){
    if(outgoing.length() != 0){
    outgoing = outgoing.substring(0,outgoing.length()-1);  
    }
  }else if(valid.contains("" + key)){
    outgoing += key;
  }
}
