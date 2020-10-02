public class GUI_Frame {
  
  
  
  
  
  public String Name;
  
  public float XPos = 0.25;
  public float YPos = 0.25;
  public float XSize = 0.5;
  public float YSize = 0.5;
  
  public color BackgroundColor = color (127);
  public color EdgeColor = color (0);
  public int   EdgeSize = 1;
  
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
    XPos = XPosIn;
    YPos = YPosIn;
    XSize = XSizeIn;
    YSize = YSizeIn;
  }
  
  public GUI_Frame (String NameIn, ArrayList <GUI_Frame> ChildrenIn) {
    Name = NameIn;
    Children = ChildrenIn;
  }
  
  public GUI_Frame (String[] SettingsIn) {
    GUIFunctions.SetFrameSettings (this, SettingsIn);
  }
  
  public GUI_Frame (String[] SettingsIn, GUI_Frame[] ChildrenIn) {
    GUIFunctions.SetFrameSettings (this, SettingsIn);
    for (GUI_Frame F : ChildrenIn) {
      Children.add (F);
    }
  }
  
  public GUI_Frame (boolean EnabledIn) {
    Enabled = EnabledIn;
  }
  
  
  
  public GUI_Frame (File FrameFolder) {
    this (FrameFolder, GUIFunctions.GetSettingsFromFolder (FrameFolder));
  }
  
  public GUI_Frame (File FrameFolder, String[] SettingsIn) {
    
    GUIFunctions.SetFrameSettings (this, SettingsIn);
    
    if (FrameFolder == null) { // I don't think this will ever be true because it would crash before getting here but I'll still keep it anyway (actually it could be null if this constructor was called outside the GUI)
      println ("Error while creating GUI element from file: The input file for this GUI_Frame cannot be null."); // ------------ Check if FrameFolder isn't null and is a folder
      return;
    } else if (!FrameFolder.isDirectory()) {
      println ("Error while creating GUI element from file: The file " + FrameFolder.getAbsolutePath() + " is not a folder.");
      return;
    }
    
    File[] FolderDir = FrameFolder.listFiles();
    
    for (File F : FolderDir) {
      String FName = F.getName();
      if (FName.startsWith("Child.") && F.isDirectory()) { // Yes, String has .startsWith()
        AddChildFromFolder (F);
      }
    }
    
  }
  
  
  
  
  
  
  
  
  
  
  public void Render() {
    MainUpdate();
    EndUpdate();
    
    if (Visible && Enabled)
      RenderFrame();
    
    if (Enabled)
      RenderChildren();
    
  }
  
  
  
  public void RenderFrame() {
    GUIFunctions.DrawRect (XPos, YPos, XSize, YSize, BackgroundColor, EdgeSize, EdgeColor);
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
  
  
  
  public void MainUpdate() {
    if (Draggable)
      UpdateDragging();
  }
  
  
  
  public void EndUpdate() {
    PrevMousePressed = mousePressed;
  }
  
  
  
  
  
  
  
  
  
  
  public void AddChild (GUI_Frame NewChild) {
    if (NewChild == null) {
      println ("Error: You cannot add a null child to " + this + ".");
      return;
    }
    Children.add (NewChild);
    NewChild.Parent = this;
  }
  
  
  
  public void AddChild (int Index, GUI_Frame NewChild) {
    if (NewChild == null) {
      println ("Error: You cannot add a null child to " + this + ".");
      return;
    }
    Children.add (Index, NewChild);
    NewChild.Parent = this;
  }
  
  
  
  public GUI_Frame Child (String ChildName) {
    if (ChildName == null) {
      println ("Error: You cannot search for a child with a null name in " + this + ".");
      return null;
    }
    for (GUI_Frame F : Children) {
      if (F.Name.equals(ChildName)) {
        return F;
      }
    }
    return null;
  }
  
  
  
  public void SetChild (String ChildName, GUI_Frame NewChild) {
    for (int i = 0; i < Children.size(); i ++) {
      if (Children.get(i).Name.equals(ChildName)) {
        Children.remove (i);
        Children.add (i, NewChild);
        return;
      }
    }
    Children.add (NewChild);
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
    GUI_Frame Ancestor = Parent; // Needs better name
    while (!(Ancestor == null || Ancestor.Name.equals(AncestorName))) {
      Ancestor = Ancestor.Parent;
    }
    return Ancestor;
  }
  
  
  
  
  
  public boolean HasMouseHovering() {
    int ScreenXStart = GUIFunctions.GetScreenX (XPos        );
    int ScreenXEnd   = GUIFunctions.GetScreenX (XPos + XSize);
    int ScreenYStart = GUIFunctions.GetScreenY (YPos        );
    int ScreenYEnd   = GUIFunctions.GetScreenY (YPos + YSize);
    return mouseX >= ScreenXStart && mouseX <= ScreenXEnd && mouseY >= ScreenYStart && mouseY <= ScreenYEnd;
  }
  
  
  
  
  
  public void UpdateDragging() {
    
    if (Dragging) {
      
      if (!mousePressed) {
        Dragging = false;
        return;
      }
      
      XPos = Dragging_StartXPos - GUIFunctions.GetFrameX (Dragging_StartMouseX - mouseX);
      YPos = Dragging_StartYPos - GUIFunctions.GetFrameY (Dragging_StartMouseY - mouseY);
      
    }
    
    if (mousePressed && !PrevMousePressed && this.HasMouseHovering()) { // I know the 'this.' is needed but it makes the name more understandable
      Dragging = true;
      Dragging_StartMouseX = mouseX;
      Dragging_StartMouseY = mouseY;
      Dragging_StartXPos = XPos;
      Dragging_StartYPos = YPos;
    }
    
  }
  
  
  
  
  
  
  public void AddChildFromFolder (File Folder) {
    
    String FName = Folder.getName(); // Take name and remove "Child."
    FName = FName.substring (6);
    
    String FrameType = "";
    char[] FChars = FName.toCharArray(); // Remove anything after the second period
    for (char C : FChars) {
      if (C == '.')
        break;
      else
        FrameType += C;
    }
    
    switch (FrameType) { // Add child depending on FrameType
      
      case ("GUI_Frame"):
        AddChild (new GUI_Frame (Folder));
        return;
      
      case ("GUI_TextFrame"):
        AddChild (new GUI_TextFrame (Folder));
        return;
      
      case ("GUI_ImageFrame"):
        AddChild (new GUI_ImageFrame (Folder));
        return;
      
      case ("GUI_Button"):
        AddChild (new GUI_Button (Folder));
        return;
      
      case ("GUI_TextButton"):
        AddChild (new GUI_TextButton (Folder));
        return;
      
      case ("GUI_ImageButton"):
        AddChild (new GUI_ImageButton (Folder));
        return;
      
      default:
        println ("Error while creating GUI element from file: The GUI type " + '"' + FrameType + '"' + " was not recognised.");
        return;
      
    }
    
  }
  
  
  
  
  
  
  
  
  
  
  public String toString() {
    if (Name != null) {
      return "GUI_Frame " + Name;
    } else {
      return "[Error: Name for this GUI_Frame has not been set.]";
    }
  }
  
  
  
  
  
}
