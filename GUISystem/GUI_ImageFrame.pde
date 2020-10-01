public class GUI_ImageFrame extends GUI_Frame {
  
  
  
  
  
  public PImage Image;
  public boolean RenderFrame = true;
  
  
  
  
  
  public GUI_ImageFrame (String NameIn) {
    super (NameIn);
  }
  
  public GUI_ImageFrame (String NameIn, PImage ImageIn) {
    super (NameIn);
    Image = ImageIn;
  }
  
  public GUI_ImageFrame (String NameIn, float XPosIn, float YPosIn, PImage ImageIn) {
    super (NameIn, XPosIn, YPosIn);
    Image = ImageIn;
  }
  
  public GUI_ImageFrame (String NameIn, float XPosIn, float YPosIn, float XSizeIn, float YSizeIn, PImage ImageIn) {
    super (NameIn, XPosIn, YPosIn, XSizeIn, YSizeIn);
    Image = ImageIn;
  }
  
  public GUI_ImageFrame (String NameIn, ArrayList <GUI_Frame> ChildrenIn) {
    super (NameIn, ChildrenIn);
  }
  
  public GUI_ImageFrame (String NameIn, ArrayList <GUI_Frame> ChildrenIn, PImage ImageIn) {
    super (NameIn, ChildrenIn);
    Image = ImageIn;
  }
  
  public GUI_ImageFrame (String[] SettingsIn) {
    super (SettingsIn);
    GUIFunctions.SetImageFrameSettings (this, SettingsIn);
  }
  
  public GUI_ImageFrame (String[] SettingsIn, GUI_Frame[] ChildrenIn) {
    super (SettingsIn, ChildrenIn);
    GUIFunctions.SetImageFrameSettings (this, SettingsIn);
  }
  
  public GUI_ImageFrame (boolean EnabledIn) {
    super (EnabledIn);
  }
  
  public GUI_ImageFrame (File FrameFolder) {
    this (FrameFolder, loadStrings (GetChildFile (FrameFolder, "Properties.txt")));
  }
  
  public GUI_ImageFrame (File FrameFolder, String[] SettingsIn) {
    super (FrameFolder, SettingsIn);
    GUIFunctions.SetImageFrameSettings (this, SettingsIn);
  }
  
  
  
  
  
  @Override
  public void RenderFrame() {
    
    if (RenderFrame)
      super.RenderFrame();
    
    GUIFunctions.DrawImage (Image, XPos, YPos, XSize, YSize);
      
    
  }
  
  
  
  
  
  @Override
  public String toString() {
    if (Name != null) {
      return "GUI_ImageFrame " + Name;
    } else {
      return "[Error: Name for this GUI_ImageFrame has not been set.]";
    }
  }
  
  
  
  
  
}
