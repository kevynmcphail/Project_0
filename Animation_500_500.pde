//Kevyn McPhail
//Interactive Art and Computational Design
//Lenticular Animation

int nFrames = 30;
int elapsedFrames; 
boolean isRecording;

void setup(){
  size(500,500);
  elapsedFrames = 0;
  frameRate (nFrames);  
}

void keyPressed(){
  isRecording = true;
  elapsedFrames = 0;
}

void draw(){
  float percentCompleted = 0;
  if (isRecording){
    percentCompleted  = (float) elapsedFrames / (float) nFrames;
  }
  else{
    float modFrame = (float) (frameCount % nFrames);
    percentCompleted = modFrame / (float) nFrames;
  }
  
  renderGIF(percentCompleted); 
  
  if(isRecording) {
    saveFrame("output/" + "kmcphail" + "-loop" + nf(elapsedFrames, 4) + ".png");
    elapsedFrames ++;
    if (elapsedFrames == nFrames) {
      isRecording = false;
    }
  }
}

void renderGIF(float percent){
  
if (percent < 0.5){
  background(percent*255);
}else{
  background(255 - (percent*255));
}
//background(255);
smooth();

float cx = 250; 
float cy = 250;

int numSpokes = 20;

for (int i=0; i<numSpokes; i++){
  float armAngle = (percent + i) * (TWO_PI/numSpokes); 
  float px = cx + (percent*500)*cos(armAngle); 
  float py = cy + (percent*500)*sin(armAngle); 
  fill(0,255-(255*percent*2));
  noStroke();
  ellipse(px,py,(percent*100),(percent*100));
}

int numRings = 20;
for (int i=0; i<numRings; i++){
  for (int j=0;  j<20; j++){
    float armAngle = (percent + j) * (TWO_PI/(10*i));
    float px = cx + (200+(30*i))*cos(armAngle); 
    float py = cy + (200+(30*i))*sin(armAngle); 
    if (percent > 0.5){
      fill(percent*255);
    }else{
      fill(255 - (percent*255));
    }
    ellipse(px,py,20,20);
  }
}

pushMatrix();
fill(0);
translate(250,250);
rotate(radians(-12*(map(percent,0,1,1,30))));
float a = map(percent,0,1,1,30);
println(a);
ellipse(0,0,200,100);
popMatrix();
fill(255);
ellipse(250,250,90,90);
fill(0);
ellipse(250,250,40,40);

for (int i=0;  i<15; i++){
  float armAngle = (percent + i) * (TWO_PI/(15));
  float px = cx + (140)*cos(armAngle); 
  float py = cy + (140)*sin(armAngle); 
  float px_2 = cx + (40)*cos(armAngle); 
  float py_2 = cy + (40)*sin(armAngle);
  if (percent > 0.5){
    stroke(percent*255);
  }else{
    stroke(255 - (percent*255));
  }  
  strokeWeight(2);
  line(px,py,px_2,py_2);
}
pushMatrix();
fill(0);
translate(250,250);
rotate(radians(-12*(map(percent,0,1,1,30))));
noFill();
strokeWeight(4);
arc(0,0,350,350,0,PI);
popMatrix();

pushMatrix();
fill(0);
translate(250,250);
rotate(radians(12*(map(percent,0,1,1,30))));
noFill();
strokeWeight(4);
arc(0,0,380,380,0,PI);
popMatrix();
}


