public class GUI_TextButton extends GUI_Button {
  
  
  
  
  public String Name = "[Error: Name for this GUI_TextButton has not been set.]";
  
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
    GUI_Functions.SetTextButtonSettings (this, SettingsIn);
  }
  
  public GUI_TextButton (String[] SettingsIn, GUI_Frame[] ChildrenIn) {
    super (SettingsIn, ChildrenIn);
    GUI_Functions.SetTextButtonSettings (this, SettingsIn);
  }
  
  
  
  
  
  @Override
  public void RenderFrame() {
    super.RenderFrame();
    
    GUI_Functions.SetTextAlignment (TextAlignX, TextAlignY);
    float TextXPos = XPos + XSize / 2 * (TextAlignX + 1) + XMove / 300;
    float TextYPos = YPos + YSize / 2 * (TextAlignY + 1) + YMove / 300;
    GUI_Functions.DrawText (Text, TextXPos, TextYPos, TextColor, (int) (width * TextSize / 100));
    
  }
  
  
  
  
  
  @Override
  public String toString() {
    return "GUI_TextButton: " + Name;
  }
  
  
  
  
  
}
