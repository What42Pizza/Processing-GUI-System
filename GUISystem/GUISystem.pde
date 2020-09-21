// Started 09/20/20
// last updated 09/21/20



// Everything in here is just an example of how to use this (but it's mostly just testing)





GUI_Element TestFrame1;
GUI_Element TestFrame2;
GUI_Element TestFrame3;
GUI_Element TestFrame4;
GUI_Element TestFrame5;

GUI_Element GlowingFrame;





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
  
  GlowingFrame = new GUI_Frame ("GlowingFrame", 0.1, 0.1, 0.1, 0.1);
  
  TestFrame1.Draggable = true;
  
  println ("Results for TestFrame3: " + TestFrame1.Decendant("TestFrame3"));
  println ("Results for TestFrame6: " + TestFrame1.Decendant("TestFrame6"));
  
  println();
  println ("Results for TestFrame2: " + TestFrame4.Ancestor("TestFrame2"));
  println ("Results for TestFrame0: " + TestFrame4.Ancestor("TestFrame0"));
  
}





void draw() {
  
  background (255);
  fill (0);
  text (frameRate, 5, 15);
  
  TestFrame2.XPos = TestFrame1.XPos;
  TestFrame2.YPos = TestFrame1.YPos;
  
  TestFrame3.XPos = TestFrame1.XPos;
  TestFrame3.YPos = TestFrame1.YPos;
  
  TestFrame4.XPos = TestFrame1.XPos;
  TestFrame4.YPos = TestFrame1.YPos;
  
  TestFrame5.XPos = TestFrame1.XPos;
  TestFrame5.YPos = TestFrame1.YPos;
  
  if (GlowingFrame.HasMouseHovering()) {
    GlowingFrame.BackgroundColor = color (255);
  } else {
    GlowingFrame.BackgroundColor = color (127);
  }
  
  GlowingFrame.Render();
  TestFrame1.Render();
  
}
