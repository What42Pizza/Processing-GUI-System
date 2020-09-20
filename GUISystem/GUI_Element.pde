public class GUI_Element {
  
  
  
  public float XPos = 0.25;
  public float YPos = 0.25;
  public float XSize = 0.5;
  public float YSize = 0.5;
  
  public color BackgroundColor = color (255);
  public color EdgeColor = color (0);
  public int   EdgeSize = 1;
  
  public boolean Draggable;
  
  public ArrayList <GUI_Element> Children = new ArrayList <GUI_Element> ();
  
  
  
  
  
  public GUI_Element() {
  }
  
  public GUI_Element (float XPosIn, float YPosIn) {
    XPos = XPosIn;
    YPos = YPosIn;
  }
  
  public GUI_Element (float XPosIn, float YPosIn, float XSizeIn, float YSizeIn) {
    XPos = YPosIn;
    YPos = XPosIn;
    XSize = XSizeIn;
    YSize = YSizeIn;
  }
  
  
  
  
  
  public void Render() {
    println ("Error: Render() is not set up for " + this);
  }
  
  
  
  public void AddChild (GUI_Element NewChild) {
    Children.add (NewChild);
  }
  
  
  
  public String toString() {
    return "GUI_Element";
  }
  
  
  
  
  
}
