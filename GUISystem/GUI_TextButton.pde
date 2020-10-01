public class GUI_TextButton extends GUI_Button {
  
  
  
  
  
  public String Text = "";
  public color TextColor = color (0);
  public float TextSize = 1;
  
  public int TextAlignX = 0;
  public int TextAlignY = 0;
  
  
  
  
  
  public GUI_TextButton (String NameIn) {
    super (NameIn);
  }
  
  public GUI_TextButton (String NameIn, String TextIn) {
    super (NameIn);
    Text = TextIn;
  }
  
  public GUI_TextButton (String NameIn, float XPosIn, float YPosIn, String TextIn) {
    super (NameIn, XPosIn, YPosIn);
    Text = TextIn;
  }
  
  public GUI_TextButton (String NameIn, float XPosIn, float YPosIn, float XSizeIn, float YSizeIn, String TextIn) {
    super (NameIn, XPosIn, YPosIn, XSizeIn, YSizeIn);
    Text = TextIn;
  }
  
  public GUI_TextButton (String NameIn, ArrayList <GUI_Frame> ChildrenIn) {
    super (NameIn, ChildrenIn);
  }
  
  public GUI_TextButton (String NameIn, ArrayList <GUI_Frame> ChildrenIn, String TextIn) {
    super (NameIn, ChildrenIn);
    Text = TextIn;
  }
  
  public GUI_TextButton (String[] SettingsIn) {
    super (SettingsIn);
    GUIFunctions.SetTextButtonSettings (this, SettingsIn);
  }
  
  public GUI_TextButton (String[] SettingsIn, GUI_Frame[] ChildrenIn) {
    super (SettingsIn, ChildrenIn);
    GUIFunctions.SetTextButtonSettings (this, SettingsIn);
  }
  
  public GUI_TextButton (boolean EnabledIn) {
    super (EnabledIn);
  }
  
  public GUI_TextButton (File FrameFolder) {
    this (FrameFolder, loadStrings (GetChildFile (FrameFolder, "Properties.txt")));
  }
  
  public GUI_TextButton (File FrameFolder, String[] SettingsIn) {
    super (FrameFolder, SettingsIn);
    GUIFunctions.SetTextButtonSettings (this, SettingsIn);
  }
  
  
  
  
  
  @Override
  public void RenderFrame() {
    super.RenderFrame();
    
    GUIFunctions.SetTextAlignment (TextAlignX, TextAlignY);
    float TextXPos = XPos + XSize / 2 * (TextAlignX + 1);
    float TextYPos = YPos + YSize / 2 * (TextAlignY + 1);
    
    if (Pressed) {
      GUIFunctions.DrawText (Text, TextXPos + XMove / 300, TextYPos + YMove / 300, TextColor, (int) (width * TextSize / 100));
    } else {
      GUIFunctions.DrawText (Text, TextXPos, TextYPos, TextColor, (int) (width * TextSize / 100));
    }
    
  }
  
  
  
  
  
  @Override
  public String toString() {
    if (Name != null) {
      return "GUI_TextButton " + Name;
    } else {
      return "[Error: Name for this GUI_TextButton has not been set.]";
    }
  }
  
  
  
  
  
}
