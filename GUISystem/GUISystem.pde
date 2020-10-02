// Started 09/20/20
// Last updated 10/02/20



// Everything in here is just an example of how to use this (but it's also just testing)



GUI_Functions GUIFunctions = new GUI_Functions(); // YOU NEED TO HAVE THIS AT THE START OF YOUR PROGRAM FOR THIS TO WORK










GUI_Frame AllFrames = new GUI_Frame (new String[] { // This holds all other frames so they can be rendered with one line of code
  "Name:" , "MainFrame",
  "XPos:" , "0",
  "YPos:" , "0",
  "XSize:", "1",
  "YSize:", "1",
  "EdgeSize:", "0",
  "BackgroundColor:", "007F7F7F", // Gray; alpha at 0 (completely transparent)
  "Visible:", "false",
});





GUI_Frame NestedFrame1 = new GUI_TextFrame (new String[] {
  "Name:" , "NestedFrame1",
  "XPos:" , "0.25",
  "YPos:" , "0.25",
  "XSize:", "0.5" ,
  "YSize:", "0.5" ,
  "Draggable:", "true",
  "Text:", "Drag me!",
  "TextAlignY:", "-1",
  "TextSize:", "0.75",
});

GUI_Frame NestedFrame2 = new GUI_Frame (new String[] {
  "Name:" , "NestedFrame2",
  "XPos:" , "0.25",
  "YPos:" , "0.25",
  "XSize:", "0.5" ,
  "YSize:", "0.5" ,
});

GUI_Frame NestedFrame3 = new GUI_Frame (new String[] {
  "Name:" , "NestedFrame3",
  "XPos:" , "0.25",
  "YPos:" , "0.25",
  "XSize:", "0.5" ,
  "YSize:", "0.5" ,
});

GUI_Frame NestedFrame4 = new GUI_Frame (new String[] {
  "Name:" , "NestedFrame4",
  "XPos:" , "0.25",
  "YPos:" , "0.25",
  "XSize:", "0.5" ,
  "YSize:", "0.5" ,
});

GUI_Frame NestedFrame5 = new GUI_Frame (new String[] {
  "Name:" , "NestedFrame5",
  "XPos:" , "0.25",
  "YPos:" , "0.25",
  "XSize:", "0.5" ,
  "YSize:", "0.5" ,
});





GUI_TextFrame GlowingFrame = new GUI_TextFrame (new String[] {
  "Name:", "GlowingFrame1",
  "XPos:" , "0.1 ",
  "YPos:" , "0.11",
  "XSize:", "0.1" ,
  "YSize:", "0.1" ,
  "Text:" , "Hover over me!",
});





GUI_TextFrame VisibleFrame = new GUI_TextFrame (new String[] {
  "Name:", "VisibleFrame",
  "XPos:" , "0.1 ",
  "YPos:" , "0.22",
  "XSize:", "0.1" ,
  "YSize:", "0.1" ,
  "Text:" , "Visible",
  "TextAlignY:", "-1",
});

GUI_Frame NestedVisibleFrame = new GUI_Frame ("NestedVisibleFrame");





GUI_TextFrame EnableFrame = new GUI_TextFrame (new String[] {
  "Name:" , "EnableFrame",
  "XPos:" , "0.1 ",
  "YPos:" , "0.33",
  "XSize:", "0.1" ,
  "YSize:", "0.1" ,
  "Text:" , "Enable",
  "TextAlignY:", "-1",
});

GUI_Frame NestedEnableFrame = new GUI_Frame ("NestedEnableFrame");





GUI_TextButton ButtonFrame = new GUI_TextButton (new String[] {
  "Name:" , "TextButton",
  "XPos:" , "0.1" ,
  "YPos:" , "0.44",
  "XSize:", "0.1" ,
  "YSize:", "0.1" ,
  "Text:" , "Click me!",
  "TextSize:", "1.25",
});





GUI_TextFrame LoadedFrame;





GUI_ImageButton ImageButtonFrame = new GUI_ImageButton (new String[] {
  "Name:" , "ImageButtonFrame",
  "XPos:" , "0.1" ,
  "YPos:" , "0.66",
  "XSize:", "0.1" ,
  "YSize:", 16.0 / 9.0 * 0.1 + " ",
});










void setup() {
  
  
  
  fullScreen();
  frameRate (60);
  
  
  
  AllFrames.AddChild (GlowingFrame);
  
  AllFrames.AddChild (VisibleFrame);
    VisibleFrame.AddChild (NestedVisibleFrame);
    
  AllFrames.AddChild (EnableFrame);
    EnableFrame.AddChild (NestedEnableFrame);
    
  AllFrames.AddChild (ButtonFrame);
  
  AllFrames.AddChild (ImageButtonFrame);
  
  AllFrames.AddChild (NestedFrame1);
    NestedFrame1.AddChild (NestedFrame2);
      NestedFrame2.AddChild (NestedFrame3);
        NestedFrame3.AddChild (NestedFrame4);
          NestedFrame4.AddChild (NestedFrame5);
  
  thread ("LoadFrames");
  
  
  
  //GlowingFrame = new GUI_TextFrame ("GlowingFrame", 0.1, 0.1, 0.1, 0.1, "Hover over me!");
  //VisibleFrame = new GUI_TextFrame ("VisibleFrame", 0.1, 0.22, 0.1, 0.1, "Visible");
  //NestedVisibleFrame = new GUI_Frame ("NestedVisibleFrame");
  //VisibleFrame.TextAlignY = -1;
  //EnableFrame = new GUI_TextFrame ("EnableFrame" , 0.1, 0.33, 0.1, 0.1, "Enabled");
  //NestedEnableFrame = new GUI_Frame ("NestedEnableFrame");
  //EnableFrame.TextAlignY = -1;
  //ButtonFrame = new GUI_Button ("ButtonFrame", 0.1, 0.44, 0.1, 0.1);
  
  
  
  println ("Results for NestedFrame3: " + NestedFrame1.Decendant("NestedFrame3"));
  println ("Results for NestedFrame6: " + NestedFrame1.Decendant("NestedFrame6"));
  
  println();
  
  println ("Results for NestedFrame2: " + NestedFrame4.Ancestor("NestedFrame2"));
  println ("Results for NestedFrame0: " + NestedFrame4.Ancestor("NestedFrame0"));
  
  
  
}





void LoadFrames() {
  
  String LoadedFrameFileName = dataPath("") + "/GUI/Child.GUI_TextFrame";
  File LoadedFrameFile = new File (LoadedFrameFileName);
  if (LoadedFrameFile.exists()) {
    AllFrames.AddChild (0, new GUI_TextFrame (LoadedFrameFile));
  } else {
    println ("Error: Could not find the file " + '"' + LoadedFrameFileName + '"' + " for LoadedFrame.");
  }
  
  ImageButtonFrame.Image = loadImage ("https://processing.org/img/processing3-logo.png"); // Go to https://processing.org/img for a list of images
  if (ImageButtonFrame.Image != null) {
    ImageButtonFrame.RenderFrame = false;
  } else {
    println ();
    println ("Error: Could not load image for " + ImageButtonFrame);
  }
  
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
  
  
  
  AllFrames.Render(); // This renders all frames
  
  
  
}
