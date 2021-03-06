public class GUI_TextFrame extends GUI_Frame {
  
  
  
  
  
  public String Text = "Error: text not set";
  public color  TextColor = color (0);
  public float  TextSize = 1;
  public String TextSizeIsRelativeTo = "FRAME"; // This has to be either "FRAME" or "SCREEN"
  
  public int TextAlignX = 0;
  public int TextAlignY = 0;
  
  
  
  
  
  public GUI_TextFrame (String NameIn) {
    super (NameIn);
  }
  
  public GUI_TextFrame (String NameIn, String TextIn) {
    super (NameIn);
    Text = TextIn;
  }
  
  public GUI_TextFrame (String NameIn, float XPosIn, float YPosIn, String TextIn) {
    super (NameIn, XPosIn, YPosIn);
    Text = TextIn;
  }
  
  public GUI_TextFrame (String NameIn, float XPosIn, float YPosIn, float XSizeIn, float YSizeIn, String TextIn) {
    super (NameIn, XPosIn, YPosIn, XSizeIn, YSizeIn);
    Text = TextIn;
  }
  
  public GUI_TextFrame (String NameIn, ArrayList <GUI_Frame> ChildrenIn) {
    super (NameIn, ChildrenIn);
  }
  
  public GUI_TextFrame (String NameIn, ArrayList <GUI_Frame> ChildrenIn, String TextIn) {
    super (NameIn, ChildrenIn);
    Text = TextIn;
  }
  
  public GUI_TextFrame (String[] SettingsIn) {
    super (SettingsIn);
    GUIFunctions.SetTextFrameSettings (this, SettingsIn);
  }
  
  public GUI_TextFrame (String[] SettingsIn, GUI_Frame[] ChildrenIn) {
    super (SettingsIn, ChildrenIn);
    GUIFunctions.SetTextFrameSettings (this, SettingsIn);
  }
  
  public GUI_TextFrame (boolean EnabledIn) {
    super (EnabledIn);
  }
  
  public GUI_TextFrame (File FrameFolder) {
    this (FrameFolder, GUIFunctions.GetSettingsFromFolder (FrameFolder));
  }
  
  public GUI_TextFrame (File FrameFolder, String[] SettingsIn) {
    super (FrameFolder, SettingsIn);
    GUIFunctions.SetTextFrameSettings (this, SettingsIn);
  }
  
  
  
  
  
  @Override
  public void RenderFrame() {
    super.RenderFrame();
    
    GUIFunctions.SetTextAlignment (TextAlignX, TextAlignY);
    float TextXPos = XPos + XSize / 2 * (TextAlignX + 1);
    float TextYPos = YPos + YSize / 2 * (TextAlignY + 1);
    GUIFunctions.DrawText (Text, TextXPos, TextYPos, TextColor, TextSize, TextSizeIsRelativeTo, XPos, XSize);
    
  }
  
  
  
  
  
  @Override
  public String toString() {
    if (Name != null) {
      return "GUI_TextFrame " + Name;
    } else {
      return "[Error: Name for this GUI_TextFrame has not been set.]";
    }
  }
  
  
  
  
  
}
