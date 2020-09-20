// Started 09/20/20





GUI_Element TestFrame1;
GUI_Element TestFrame2;





void setup() {
  
  fullScreen();
  TestFrame1 = new GUI_Frame (0.25, 0.25, 0.5, 0.5);
  TestFrame2 = new GUI_Frame (0.25, 0.25, 0.5, 0.5);
  TestFrame1.AddChild (TestFrame2);
  
}



void draw() {
  
  background (255);
  fill (0);
  text (frameRate, 5, 15);
  
  TestFrame1.XPos = (float) mouseX / width ;
  TestFrame1.YPos = (float) mouseY / height;
  
  TestFrame2.XPos = (float) mouseX / width ;
  TestFrame2.YPos = (float) mouseY / height;
  
  loadPixels();
  TestFrame1.Render();
  updatePixels();
  
}
