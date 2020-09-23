public class GUI_Frame {
  
  
  
  public float XPos = 0.25;
  public float YPos = 0.25;
  public float XSize = 0.5;
  public float YSize = 0.5;
  
  public String Name = "[Error: Name for GUI_Frame has not been set.]";
  public color  BackgroundColor = color (127);
  public color  EdgeColor = color (0);
  public int    EdgeSize = 1;
  
  public boolean Draggable = false;
  public boolean Visible = true;
  public boolean Enabled = true;
  
  
  
  public boolean Dragging = false;
  public boolean PrevMousePressed = false;
  public int Dragging_StartMouseX;
  public int Dragging_StartMouseY;
  public float Dragging_StartXPos;
  public float Dragging_StartYPos;
  
  public ArrayList <GUI_Frame> Children = new ArrayList <GUI_Frame> ();
  public GUI_Frame Parent = null;
  
  
  
  
  
  public GUI_Frame (String NameIn) {
    Name = NameIn;
  }
  
  public GUI_Frame (String NameIn, float XPosIn, float YPosIn) {
    Name = NameIn;
    XPos = XPosIn;
    YPos = YPosIn;
  }
  
  public GUI_Frame (String NameIn, float XPosIn, float YPosIn, float XSizeIn, float YSizeIn) {
    Name = NameIn;
    XPos = YPosIn;
    YPos = XPosIn;
    XSize = XSizeIn;
    YSize = YSizeIn;
  }
  
  public GUI_Frame (String NameIn, ArrayList <GUI_Frame> ChildrenIn) {
    Name = NameIn;
    Children = ChildrenIn;
  }
  
  public GUI_Frame (String[] SettingsIn) {
    GUI_Functions.SetFrameSettings (this, SettingsIn);
  }
  
  
  
  
  
  
  
  
  
  
  public void Render() {
    Update();
    
    if (Visible && Enabled)
      RenderFrame();
    
    if (Enabled)
      RenderChildren();
    
  }
  
  
  
  public void RenderFrame() {
    RenderBasicFrame();
  }
  
  public void RenderBasicFrame() {
    GUI_Functions.DrawRect (XPos, YPos, XSize, YSize, BackgroundColor, EdgeSize, EdgeColor);
  }
  
  
  
  public void RenderChildren() {
    PushMatrix();
    Translate (XPos, YPos);
    Scale (1 / XSize, 1 / YSize);
    for (GUI_Frame F : Children) {
      F.Render();
    }
    PopMatrix();
  }
  
  
  
  public void Update() {
    BasicUpdate();
  }
  
  
  
  public void BasicUpdate() {
    
    if (Draggable)
      UpdateDragging();
      
    PrevMousePressed = mousePressed;
    
  }
  
  
  
  
  
  
  
  
  
  
  public void AddChild (GUI_Frame NewChild) {
    Children.add (NewChild);
    NewChild.Parent = this;
  }
  
  
  
  public GUI_Frame Child (String ChildName) {
    for (GUI_Frame F : Children) {
      if (F.Name.equals(ChildName)) {
        return F;
      }
    }
    return null;
  }
  
  
  
  public GUI_Frame Decendant (String DescendantName) {
    
    for (GUI_Frame F : Children) { // Check if any children are Decendant
      if (F.Name.equals(DescendantName)) {
        return F;
      }
    }
    
    for (GUI_Frame F : Children) { // Check if any children's decendants are Decendant
      GUI_Frame Descendant = F.Decendant (DescendantName);
      if (Descendant != null) {
        return Descendant;
      }
    }
    
    return null; // No decendants found named Decendant
    
  }
  
  
  
  public GUI_Frame Ancestor (String AncestorName) {
    GUI_Frame SearchedParent = Parent; // Needs better name
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
    
    if (mousePressed && !PrevMousePressed && this.HasMouseHovering()) { // I know the 'this.' is needed but it makes the name more understandable
      Dragging = true;
      Dragging_StartMouseX = mouseX;
      Dragging_StartMouseY = mouseY;
      Dragging_StartXPos = XPos;
      Dragging_StartYPos = YPos;
    }
    
  }
  
  
  
  
  
  
  
  
  
  
  public String toString() {
    return "GUI_Frame " + Name;
  }
  
  
  
  
  
}
