public class GUI_TextFrame extends GUI_Frame {
  
  
  
  
  
  String Text = "";
  color TextColor = color (0);
  float TextSize = 1;
  
  
  
  
  
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
  
  public GUI_TextFrame (String NameIn, ArrayList <GUI_Element> ChildrenIn) {
    super (NameIn, ChildrenIn);
  }
  
  public GUI_TextFrame (String NameIn, ArrayList <GUI_Element> ChildrenIn, String TextIn) {
    super (NameIn, ChildrenIn);
    Text = TextIn;
  }
  
  
  
  
  
  @Override
  public void Render() {
    super.Render();
    
    GUI_Functions.DrawText (Text, XPos + XSize / 2, YPos + YSize / 2, TextColor, (int) (width * TextSize / 100));
    
  }
  
  
  
  @Override
  public String toString() {
    return "GUI_TextFrame " + Name;
  }
  
  
  
  
  
}
