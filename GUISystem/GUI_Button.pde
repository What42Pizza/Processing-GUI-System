public class GUI_Button extends GUI_Frame {
  
  
  
  public color PressedBackgroundColor = color (63);
  public boolean UsePressedColor = true;
  public boolean Pressed = false;
  
  
  
  
  
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
    GUI_Functions.SetButtonSettings (this, SettingsIn);
  }
  
  
  
  
  
  @Override
  public void RenderBasicFrame() {
    if (Pressed) {
      GUI_Functions.DrawRect (XPos, YPos, XSize, YSize, PressedBackgroundColor, EdgeSize, EdgeColor);
    } else {
      GUI_Functions.DrawRect (XPos, YPos, XSize, YSize, BackgroundColor, EdgeSize, EdgeColor);
    }
  }
  
  
  
  @Override
  public void Update() {
    
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
    
    BasicUpdate();
  }
  
  
  
  
  
  public boolean JustClicked() {
    return mousePressed && !PrevMousePressed && this.HasMouseHovering();
  }
  
  
  
  
  
}
