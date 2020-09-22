/*
public class GUI_Frame_OLD extends GUI_Element {
  
  
  
  
  
  public GUI_Frame (String NameIn) {
    super (NameIn);
  }
  
  public GUI_Frame (String NameIn, float XPosIn, float YPosIn) {
    super (NameIn, XPosIn, YPosIn);
  }
  
  public GUI_Frame (String NameIn, float XPosIn, float YPosIn, float XSizeIn, float YSizeIn) {
    super (NameIn, XPosIn, YPosIn, XSizeIn, YSizeIn);
  }
  
  public GUI_Frame (String NameIn, ArrayList <GUI_Element> ChildrenIn) {
    super (NameIn, ChildrenIn);
  }
  
  
  
  @Override
  public void Render() {
    Update();
    
    GUI_Functions.DrawRect (XPos, YPos, XSize, YSize, BackgroundColor, EdgeSize, EdgeColor);
    
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
    return "GUI_Frame " + Name;
  }
  
  
  
  
  
}
*/
