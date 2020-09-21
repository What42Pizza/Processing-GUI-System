public class GUI_Element {
  
  
  
  public float XPos = 0.25;
  public float YPos = 0.25;
  public float XSize = 0.5;
  public float YSize = 0.5;
  
  public color  BackgroundColor = color (127);
  public color  EdgeColor = color (0);
  public int    EdgeSize = 1;
  public String Name = "";
  
  public boolean Draggable = false;
  
  public ArrayList <GUI_Element> Children = new ArrayList <GUI_Element> ();
  
  
  
  
  
  public GUI_Element (String NameIn) {
    Name = NameIn;
  }
  
  public GUI_Element (String NameIn, float XPosIn, float YPosIn) {
    Name = NameIn;
    XPos = XPosIn;
    YPos = YPosIn;
  }
  
  public GUI_Element (String NameIn, float XPosIn, float YPosIn, float XSizeIn, float YSizeIn) {
    Name = NameIn;
    XPos = YPosIn;
    YPos = XPosIn;
    XSize = XSizeIn;
    YSize = YSizeIn;
  }
  
  public GUI_Element (String NameIn, ArrayList <GUI_Element> ChildrenIn) {
    Name = NameIn;
    Children = ChildrenIn;
  }
  
  
  
  
  
  public void Render() {
    println ("Error: Render() is not set up for " + this);
  }
  
  
  
  public void AddChild (GUI_Element NewChild) {
    Children.add (NewChild);
  }
  
  
  
  public GUI_Element Child (String ChildName) {
    for (GUI_Element E : Children) {
      if (E.Name.equals(ChildName)) {
        return E;
      }
    }
    return null;
  }
  
  
  
  public GUI_Element Decendant (String DecendantName) {
    
    for (GUI_Element E : Children) { // Check if any children are Decendant
      if (E.Name.equals(DecendantName)) {
        return E;
      }
    }
    
    for (GUI_Element E : Children) { // Check if any children's decendants are Decendant
      GUI_Element Decendant = E.Decendant (DecendantName);
      if (Decendant != null) {
        return Decendant;
      }
    }
    
    return null; // No decendants found named Decendant
    
  }
  
  
  
  
  
  public String toString() {
    return "GUI_Element " + Name;
  }
  
  
  
  
  
}
