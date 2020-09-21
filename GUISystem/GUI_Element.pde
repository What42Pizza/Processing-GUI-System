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
  
  public boolean Dragging = false;
  public boolean PrevMousePressed = false;
  public int Dragging_StartMouseX;
  public int Dragging_StartMouseY;
  public float Dragging_StartXPos;
  public float Dragging_StartYPos;
  
  public ArrayList <GUI_Element> Children = new ArrayList <GUI_Element> ();
  GUI_Element Parent = null;
  
  
  
  
  
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
    NewChild.Parent = this;
  }
  
  
  
  public GUI_Element Child (String ChildName) {
    for (GUI_Element E : Children) {
      if (E.Name.equals(ChildName)) {
        return E;
      }
    }
    return null;
  }
  
  
  
  public GUI_Element Decendant (String DescendantName) {
    
    for (GUI_Element E : Children) { // Check if any children are Decendant
      if (E.Name.equals(DescendantName)) {
        return E;
      }
    }
    
    for (GUI_Element E : Children) { // Check if any children's decendants are Decendant
      GUI_Element Descendant = E.Decendant (DescendantName);
      if (Descendant != null) {
        return Descendant;
      }
    }
    
    return null; // No decendants found named Decendant
    
  }
  
  
  
  public GUI_Element Ancestor (String AncestorName) {
    GUI_Element SearchedParent = Parent; // Needs better name
    while (SearchedParent != null && !SearchedParent.Name.equals(AncestorName)) {
      SearchedParent = SearchedParent.Parent;
    }
    return SearchedParent;
  }
  
  
  
  
  
  public boolean HasMouseHovering() {
    int ScreenXStart = GUI_Functions.GetScreenX (XPos        );
    int ScreenXEnd   = GUI_Functions.GetScreenX (XPos + XSize);
    int ScreenYStart = GUI_Functions.GetScreenY (YPos        );
    int ScreenYEnd   = GUI_Functions.GetScreenY (YPos + YSize);
    return mouseX >= ScreenXStart && mouseX <= ScreenXEnd && mouseY >= ScreenYStart && mouseY <= ScreenYEnd;
  }
  
  
  
  
  
  public void UpdateDragging() {
    
    if (Dragging) {
      
      if (!mousePressed) {
        Dragging = false;
        return;
      }
      
      XPos = Dragging_StartXPos - GUI_Functions.GetXPos (Dragging_StartMouseX - mouseX);
      YPos = Dragging_StartYPos - GUI_Functions.GetYPos (Dragging_StartMouseY - mouseY);
      
    }
    
    if (mousePressed && !PrevMousePressed && this.HasMouseHovering()) { // I know the 'this.' isn't necessary but it makes the function name make more sense
      Dragging = true;
      Dragging_StartMouseX = mouseX;
      Dragging_StartMouseY = mouseY;
      Dragging_StartXPos = XPos;
      Dragging_StartYPos = YPos;
    }
    
    PrevMousePressed = mousePressed;
    
  }
  
  
  
  
  
  
  
  
  
  
  public String toString() {
    return "GUI_Element " + Name;
  }
  
  
  
  
  
}
