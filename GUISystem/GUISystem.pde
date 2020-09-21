// Started 09/20/20



// Everything in here is just an example of how to use this (but it's mostly just testing)





GUI_Element TestFrame1;
GUI_Element TestFrame2;
GUI_Element TestFrame3;
GUI_Element TestFrame4;
GUI_Element TestFrame5;





void setup() {
  
  fullScreen();
  
  TestFrame1 = new GUI_Frame ("TestFrame1", 0.25, 0.25, 0.5, 0.5);
  TestFrame2 = new GUI_Frame ("TestFrame2", 0.25, 0.25, 0.5, 0.5);
  TestFrame3 = new GUI_Frame ("TestFrame3", 0.25, 0.25, 0.5, 0.5);
  TestFrame4 = new GUI_Frame ("TestFrame4", 0.25, 0.25, 0.5, 0.5);
  TestFrame5 = new GUI_Frame ("TestFrame5", 0.25, 0.25, 0.5, 0.5);
  TestFrame1.AddChild (TestFrame2);
  TestFrame2.AddChild (TestFrame3);
  TestFrame3.AddChild (TestFrame4);
  TestFrame4.AddChild (TestFrame5);
  
  println (TestFrame1.Decendant("TestFrame3"));
  println (TestFrame1.Decendant("TestFrame6"));
  
}





void draw() {
  
  background (255);
  fill (0);
  text (frameRate, 5, 15);
  
  TestFrame1.XPos = (float) mouseX / width ;
  TestFrame1.YPos = (float) mouseY / height;
  
  TestFrame2.XPos = (float) mouseX / width ;
  TestFrame2.YPos = (float) mouseY / height;
  
  TestFrame3.XPos = (float) mouseX / width ;
  TestFrame3.YPos = (float) mouseY / height;
  
  TestFrame4.XPos = (float) mouseX / width ;
  TestFrame4.YPos = (float) mouseY / height;
  
  TestFrame5.XPos = (float) mouseX / width ;
  TestFrame5.YPos = (float) mouseY / height;
  
  TestFrame1.Render();
  
}
