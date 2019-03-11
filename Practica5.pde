PShape building;
float rotation = 0;
PImage grassTex;

void setup(){
  size(800,800,P3D);
  noStroke();
  building = loadShape("obj/house_01.obj");
  grassTex = loadImage("grass.jpg");
}

void draw(){
  background(200);  
  lights();
  directionalLight(255, 255, 255, width, height/1.2, 0);
  moveCamera();
  shapeBuilding();
  shapeFloor();
}

void moveCamera(){
  float orbitRadius= mouseX;
  float ypos = 100;
  float xpos= sin(radians(orbitRadius))*600;
  float zpos= cos(radians(orbitRadius))*600;
  fill(255);
  textSize(30);
  text("Use the mouse to move the camera",0,height/2,200);
  camera(xpos, ypos, zpos,width/2,height/2,0, 0, 1, 0);
}

void shapeBuilding(){
  pushMatrix();
  translate(width/2.0,height/2.0,0);
  rotateZ(radians(180));
  shape(building);
  popMatrix();  
}

void shapeFloor(){
  pushMatrix();
  translate(width/2.0,height/2.0,0);
  rotateX(radians(-90));
  beginShape();
  texture(grassTex);
  textureWrap(REPEAT);
  vertex(-200,-200,0,-200,-200);
  vertex(-200,200,0,-200,200);
  vertex(200,200,0,200,200);
  vertex(200,-200,0,200,-200);
  endShape();
  popMatrix();
}
