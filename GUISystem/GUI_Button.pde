public class GUI_Button extends GUI_Frame {
  
  
  
  
  
  public color PressedBackgroundColor = color (63);
  public boolean UsePressedColor = true;
  public boolean Pressed = false;
  public float XMove = 0;
  public float YMove = 1;
  
  
  
  
  
  public GUI_Button (String NameIn) {
    super (NameIn);
  }
  
  public GUI_Button (String NameIn, float XPosIn, float YPosIn) {
    super (NameIn, XPosIn, YPosIn);
  }
  
  public GUI_Button (String NameIn, float XPosIn, float YPosIn, float XSizeIn, float YSizeIn) {
    super (NameIn, XPosIn, YPosIn, XSizeIn, YSizeIn);
  }
  
  public GUI_Button (String NameIn, ArrayList <GUI_Frame> ChildrenIn) {
    super (NameIn, ChildrenIn);
  }
  
  public GUI_Button (String[] SettingsIn) {
    super (SettingsIn);
    GUIFunctions.SetButtonSettings (this, SettingsIn);
  }
  
  public GUI_Button (String[] SettingsIn, GUI_Frame[] ChildrenIn) {
    super (SettingsIn, ChildrenIn);
    GUIFunctions.SetButtonSettings (this, SettingsIn);
  }
  
  public GUI_Button (boolean EnabledIn) {
    super (EnabledIn);
  }
  
  public GUI_Button (File FrameFolder) {
    this (FrameFolder, GUIFunctions.GetSettingsFromFolder (FrameFolder));
  }
  
  public GUI_Button (File FrameFolder, String[] SettingsIn) {
    super (FrameFolder, SettingsIn);
    GUIFunctions.SetButtonSettings (this, SettingsIn);
  }
  
  
  
  
  
  @Override
  public void RenderFrame() {
    if (Pressed) {
      GUIFunctions.DrawRect (XPos + XMove / 300, YPos + YMove / 300, XSize, YSize, PressedBackgroundColor, EdgeSize, EdgeColor);
    } else {
      GUIFunctions.DrawRect (XPos, YPos, XSize, YSize, BackgroundColor, EdgeSize, EdgeColor);
    }
  }
  
  
  
  @Override
  public void MainUpdate() {
    super.MainUpdate();
    
    if (Pressed) {
      if (!mousePressed) {
        Pressed = false;
      }
      if (!this.HasMouseHovering()) {
        Pressed = false;
      }
      
    } else {
      if (this.JustClicked()) {
        Pressed = true;
      }
    }
    
  }
  
  
  
  
  
  public boolean JustClicked() {
    return mousePressed && !PrevMousePressed && this.HasMouseHovering();
  }
  
  
  
  
  
  @Override
  public String toString() {
    if (Name != null) {
      return "GUI_Button " + Name;
    } else {
      return "[Error: Name for this GUI_Button has not been set.]";
    }
  }
  
  
  
  
  
}
