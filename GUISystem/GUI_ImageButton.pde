public class GUI_ImageButton extends GUI_Button {
  
  
  
  
  public String Name = "[Error: Name for this GUI_ImageButton has not been set.]";
  
  public PImage Image;
  
  
  
  
  
  public GUI_ImageButton (String NameIn) {
    super (NameIn);
  }
  
  public GUI_ImageButton (String NameIn, PImage ImageIn) {
    super (NameIn);
    Image = ImageIn;
  }
  
  public GUI_ImageButton (String NameIn, float XPosIn, float YPosIn, PImage ImageIn) {
    super (NameIn, XPosIn, YPosIn);
    Image = ImageIn;
  }
  
  public GUI_ImageButton (String NameIn, float XPosIn, float YPosIn, float XSizeIn, float YSizeIn, PImage ImageIn) {
    super (NameIn, XPosIn, YPosIn, XSizeIn, YSizeIn);
    Image = ImageIn;
  }
  
  public GUI_ImageButton (String NameIn, ArrayList <GUI_Frame> ChildrenIn) {
    super (NameIn, ChildrenIn);
  }
  
  public GUI_ImageButton (String NameIn, ArrayList <GUI_Frame> ChildrenIn, PImage ImageIn) {
    super (NameIn, ChildrenIn);
    Image = ImageIn;
  }
  
  public GUI_ImageButton (String[] SettingsIn) {
    super (SettingsIn);
    //GUI_Functions.SetImageButtonSettings (this, SettingsIn);
  }
  
  public GUI_ImageButton (String[] SettingsIn, GUI_Frame[] ChildrenIn) {
    super (SettingsIn, ChildrenIn);
    //GUI_Functions.SetImageButtonSettings (this, SettingsIn);
  }
  
  
  
  
  
  @Override
  public void RenderFrame() {
    
    if (Image == null) {
      super.RenderFrame();
    } else {
      if (Pressed) {
        GUI_Functions.DrawImage (Image, XPos + XMove / 300, YPos + YMove / 300, XSize, YSize);
      } else {
        GUI_Functions.DrawImage (Image, XPos, YPos, XSize, YSize);
      }
    }
    
  }
  
  
  
  
  
  @Override
  public String toString() {
    return "GUI_ImageButton: " + Name;
  }
  
  
  
  
  
}
