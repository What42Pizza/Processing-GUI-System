public class GUI_TextFrame extends GUI_Frame {
  
  
  
  
  
  public String Text = "";
  public color TextColor = color (0);
  public float TextSize = 1;
  
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
  
  
  
  
  
  @Override
  public void Render() {
    
    if (Visible && Enabled) {
      RenderFrame();
      GUI_Functions.SetTextAlignment (TextAlignX, TextAlignY);
      float TextXPos = XPos + XSize / 2 * (TextAlignX + 1);
      float TextYPos = YPos + YSize / 2 * (TextAlignY + 1);
      GUI_Functions.DrawText (Text, TextXPos, TextYPos, TextColor, (int) (width * TextSize / 100));
    }
    
    if (Enabled)
      RenderChildren();
    
  }
  
  
  
  /*
  public void SetTextAlign_Top_Left     () {TextAlignX = -1; TextAlignY = -1;}
  public void SetTextAlign_Top_Middle   () {TextAlignX =  0; TextAlignY = -1;}
  public void SetTextAlign_Top_Right    () {TextAlignX =  1; TextAlignY = -1;}
  public void SetTextAlign_Middle_Left  () {TextAlignX = -1; TextAlignY =  0;}
  public void SetTextAlign_Middle_Middle() {TextAlignX =  0; TextAlignY =  0;}
  public void SetTextAlign_Middle_Right () {TextAlignX =  1; TextAlignY =  0;}
  public void SetTextAlign_Bottom_Left  () {TextAlignX = -1; TextAlignY =  1;}
  public void SetTextAlign_Bottom_Middle() {TextAlignX =  0; TextAlignY =  1;}
  public void SetTextAlign_Bottom_Right () {TextAlignX =  1; TextAlignY =  1;}
  */
  
  
  
  @Override
  public String toString() {
    return "GUI_TextFrame " + Name;
  }
  
  
  
  
  
}