// Started 09/20/20
// Last updated 09/22/20



// Everything in here is just an example of how to use this (but it's mostly just testing)





GUI_Frame NestedFrame1;
GUI_Frame NestedFrame2;
GUI_Frame NestedFrame3;
GUI_Frame NestedFrame4;
GUI_Frame NestedFrame5;

GUI_TextFrame GlowingFrame;

GUI_TextFrame VisibleFrame;
GUI_Frame NestedVisibleFrame;

GUI_TextFrame EnableFrame;
GUI_Frame NestedEnableFrame;





void setup() {
  
  fullScreen();
  frameRate (60);
  
  NestedFrame1 = new GUI_Frame ("NestedFrame1", 0.25, 0.25, 0.5, 0.5);
  NestedFrame2 = new GUI_Frame ("NestedFrame2", 0.25, 0.25, 0.5, 0.5);
  NestedFrame3 = new GUI_Frame ("NestedFrame3", 0.25, 0.25, 0.5, 0.5);
  NestedFrame4 = new GUI_Frame ("NestedFrame4", 0.25, 0.25, 0.5, 0.5);
  NestedFrame5 = new GUI_Frame ("NestedFrame5", 0.25, 0.25, 0.5, 0.5);
  NestedFrame1.AddChild (NestedFrame2);
  NestedFrame2.AddChild (NestedFrame3);
  NestedFrame3.AddChild (NestedFrame4);
  NestedFrame4.AddChild (NestedFrame5);
  NestedFrame1.Draggable = true;
  
  GlowingFrame = new GUI_TextFrame ("GlowingFrame", 0.11, 0.1, 0.1, 0.1, "Hover over me!");
  
  VisibleFrame = new GUI_TextFrame ("VisibleFrame", 0.22, 0.1, 0.1, 0.1, "Visible");
  NestedVisibleFrame = new GUI_Frame ("NestedVisibleFrame");
  VisibleFrame.AddChild (NestedVisibleFrame);
  VisibleFrame.TextAlignY = -1;
  
  EnableFrame = new GUI_TextFrame ("EnableFrame" , 0.33, 0.1, 0.1, 0.1, "Enabled");
  NestedEnableFrame = new GUI_Frame ("NestedEnableFrame");
  EnableFrame.AddChild (NestedEnableFrame);
  EnableFrame.TextAlignY = -1;
  
  
  println ("Results for NestedFrame3: " + NestedFrame1.Decendant("NestedFrame3"));
  println ("Results for NestedFrame6: " + NestedFrame1.Decendant("NestedFrame6"));
  
  println();
  println ("Results for NestedFrame2: " + NestedFrame4.Ancestor("NestedFrame2"));
  println ("Results for NestedFrame0: " + NestedFrame4.Ancestor("NestedFrame0"));
  
}





void draw() {
  
  background (255);
  fill (0);
  textSize (15);
  textAlign (LEFT, BOTTOM);
  text (frameRate, 4, 25);
  
  NestedFrame2.XPos = NestedFrame1.XPos;
  NestedFrame2.YPos = NestedFrame1.YPos;
  
  NestedFrame3.XPos = NestedFrame1.XPos;
  NestedFrame3.YPos = NestedFrame1.YPos;
  
  NestedFrame4.XPos = NestedFrame1.XPos;
  NestedFrame4.YPos = NestedFrame1.YPos;
  
  NestedFrame5.XPos = NestedFrame1.XPos;
  NestedFrame5.YPos = NestedFrame1.YPos;
  
  if (GlowingFrame.HasMouseHovering()) {
    GlowingFrame.BackgroundColor = color (255);
  } else {
    GlowingFrame.BackgroundColor = color (127);
  }
  
  VisibleFrame.Visible = !VisibleFrame.HasMouseHovering(); // Make frame not visible when mouse is hovering
  EnableFrame .Enabled = !EnableFrame .HasMouseHovering(); // Make frame not enabled when mouse is hovering 
  
  GlowingFrame.Render();
  VisibleFrame.Render();
  EnableFrame .Render();
  NestedFrame1.Render();
  
}
