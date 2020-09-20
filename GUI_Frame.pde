public class GUI_Frame extends GUI_Element {
  
  
  
  
  
  public GUI_Frame() {
    super();
  }
  
  public GUI_Frame (float XPosIn, float YPosIn) {
    super (XPosIn, YPosIn);
  }
  
  public GUI_Frame (float XPosIn, float YPosIn, float XSizeIn, float YSizeIn) {
    super (XPosIn, YPosIn, XSizeIn, YSizeIn);
  }
  
  
  
  @Override
  public void Render() { // This is NOT meant to be called outside the GUI
    
    if (EdgeSize == 0) {
      GUI_Functions.DrawRect (XPos, YPos, XSize, YSize, BackgroundColor);
    } else {
      GUI_Functions.DrawRect (XPos, YPos, XSize, YSize, BackgroundColor, EdgeSize, EdgeColor);
    }
    
    PushMatrix();
    Translate (XPos, YPos);
    Scale (1 / XSize, 1 / YSize);
    for (GUI_Element E : Children) {
      E.Render();
    }
    PopMatrix();
    
  }
  
  
  
  @Override
  public String toString() {
    return "GUI_Frame";
  }
  
  
  
  
  
}
