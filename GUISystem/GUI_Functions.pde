// This holds general functions used in GUI elements





float CustMatrix_TranslateX = 0;
float CustMatrix_TranslateY = 0;
float CustMatrix_ScaleX = 1;
float CustMatrix_ScaleY = 1;

ArrayList <float[]> MatrixStack = new ArrayList <float[]> ();





void PushMatrix() {
  float[] CurrMatrix = new float[] {
    CustMatrix_TranslateX,
    CustMatrix_TranslateY,
    CustMatrix_ScaleX,
    CustMatrix_ScaleY
  };
  MatrixStack.add (CurrMatrix);
  if (MatrixStack.size() > 100) println ("WARNING: The matrix stack is becoming extremely large (size: " + MatrixStack.size() + "). You should consider simplifying your GUI.");
}



void PopMatrix() {
  float[] NewMatrix = MatrixStack.remove (MatrixStack.size() - 1);
  CustMatrix_TranslateX = NewMatrix[0];
  CustMatrix_TranslateY = NewMatrix[1];
  CustMatrix_ScaleX = NewMatrix[2];
  CustMatrix_ScaleY = NewMatrix[3];
}



void Translate (float XAmount, float YAmount) {
  CustMatrix_TranslateX += XAmount * CustMatrix_ScaleX;
  CustMatrix_TranslateY += YAmount * CustMatrix_ScaleY;
}



void Scale (float XAmount, float YAmount) {
  CustMatrix_ScaleX /= XAmount;
  CustMatrix_ScaleY /= YAmount;
}












public class GUI_Functions {
  
  
  
  
  
  /*
  public void DrawRect (float XPos, float YPos, float XSize, float YSize, color BackgroundColor) {
    
    int ScreenXPos  = GetScreenX (XPos);
    int ScreenXEnd  = GetScreenX (XPos + XSize);
    int ScreenXSize = ScreenXEnd - ScreenXPos;
    int ScreenYPos  = GetScreenY (YPos);
    int ScreenYEnd  = GetScreenY (YPos + YSize);
    int ScreenYSize = ScreenYEnd - ScreenYPos;
    
    noStroke();
    fill (BackgroundColor);
    rect (ScreenXPos, ScreenYPos, ScreenXSize, ScreenYSize);
    
  }
  */
  
  
  
  public void DrawRect (float XPos, float YPos, float XSize, float YSize, color BackgroundColor, int EdgeSize, color EdgeColor) {
    
    int ScreenXPos  = GetScreenX (XPos);
    int ScreenXEnd  = GetScreenX (XPos + XSize);
    int ScreenXSize = ScreenXEnd - ScreenXPos;
    int ScreenYPos  = GetScreenY (YPos);
    int ScreenYEnd  = GetScreenY (YPos + YSize);
    int ScreenYSize = ScreenYEnd - ScreenYPos;
    
    stroke (EdgeColor);
    strokeWeight (EdgeSize);
    fill (BackgroundColor);
    rect (ScreenXPos, ScreenYPos, ScreenXSize, ScreenYSize);
    
  }
  
  
  
  public void DrawText (String Text, float TextXPos, float TextYPos, color TextColor, float TextSize, String TextSizeIsRelativeTo, float XPos, float XSize) {
    
    switch (TextSizeIsRelativeTo) {
      case ("FRAME"):
        textSize (GetScreenXSize (XPos, XSize) * TextSize / 10);
        break;
      case ("SCREEN"):
        textSize (width * TextSize / 100);
        break;
      default:
        println ("Error: TextSizeIsRelativeTo cannot be " + '"' + TextSizeIsRelativeTo + '"' + ", it has to be either " + '"' + "FRAME" + '"' + " or " + '"' + "SCREEN" + '"' + ".");
        break;
    }
    
    fill (TextColor);
    text (Text, GetScreenX (TextXPos), GetScreenY (TextYPos));
    
  }
  
  
  
  public void DrawImage (PImage Image, float XPos, float YPos, float XSize, float YSize) {
    
    int ScreenXPos  = GetScreenX (XPos);
    int ScreenXEnd  = GetScreenX (XPos + XSize);
    int ScreenXSize = ScreenXEnd - ScreenXPos;
    int ScreenYPos  = GetScreenY (YPos);
    int ScreenYEnd  = GetScreenY (YPos + YSize);
    int ScreenYSize = ScreenYEnd - ScreenYPos;
    
    image (Image, ScreenXPos, ScreenYPos, ScreenXSize, ScreenYSize);
    
  }
  
  
  
  
  
  int[] TextAlignConversionX = new int[] {37 , 3, 39 };
  int[] TextAlignConversionY = new int[] {101, 3, 102};
  
  public void SetTextAlignment (int TextAlignX, int TextAlignY) {
    textAlign (TextAlignConversionX[TextAlignX+1], TextAlignConversionY[TextAlignY+1]);
  }
  
  
  
  
  
  public int GetScreenX (float XPos) {
    return (int)((XPos * CustMatrix_ScaleX + CustMatrix_TranslateX) * width);
  }
  
  public int GetScreenY (float YPos) {
    return (int)((YPos * CustMatrix_ScaleY + CustMatrix_TranslateY) * height);
  }
  
  public float GetFrameX (int ScreenX) {
    return (((float) ScreenX / width) - CustMatrix_TranslateX) / CustMatrix_ScaleX;
  }
  
  public float GetFrameY (int ScreenY) {
    return (((float) ScreenY / height) - CustMatrix_TranslateY) / CustMatrix_ScaleY;
  }
  
  
  
  public int GetScreenXSize (float XPos, float XSize) {
    return GetScreenX (XPos + XSize) - GetScreenX (XPos);
  }
  
  public int GetScreenYSize (float YPos, float YSize) {
    return GetScreenY (YPos + YSize) - GetScreenY (YPos);
  }
  
  
  
  
  
  
  
  
  
  
  public String GetSetting (String[] Settings, String SettingName) {
    SettingName += ':';
    for (int i = 0; i < Settings.length - 1; i ++) {
      String S = Settings[i];
      if (S.equals(SettingName)) {
        return Settings [i + 1];
      }
    }
    return null;
  }
  
  
  
  public String[] GetSettingsFromFolder (File FolderIn) {
    
    if (!FolderIn.isDirectory()) {
      println ("Error: The File given for constructing a GUI element (" + FolderIn.getAbsolutePath() + ") cannot be file, it must be a folder.");
      return new String[]{};
    }
    
    File PropertiesFile = GetChildFile (FolderIn, "Properties.txt");
    
    if (PropertiesFile == null) {
      println ("Error: Could not find Properties.txt in " + FolderIn.getAbsolutePath() + " when constructing GUI element.");
      return new String[]{};
    }
    
    return loadStrings (PropertiesFile);
    
  }
  
  
  
  public File GetChildFile (File Folder, String ChildName) {
    File Output = null;
    for (File F : Folder.listFiles()) {
      if (F.getName().equals(ChildName)) {
        return F;
      }
    }
    return Output;
  }
  
  
  
  
  
  
  
  
  public void SetFrameSettings (GUI_Frame Frame, String[] Settings) {
    
    
    
    String Name = GetSetting (Settings, "Name");
    if (Name != null)
      Frame.Name = Name;
    
    String XPos = GetSetting (Settings, "XPos");
    if (XPos != null)
      Frame.XPos = float (XPos);
    
    String YPos = GetSetting (Settings, "YPos");
    if (YPos != null)
      Frame.YPos = float (YPos);
    
    String XSize = GetSetting (Settings, "XSize");
    if (XSize != null)
      Frame.XSize = float (XSize);
    
    String YSize = GetSetting (Settings, "YSize");
    if (YSize != null)
      Frame.YSize = float (YSize);
    
    
    
    String BackgroundColor = GetSetting (Settings, "BackgroundColor");
    if (BackgroundColor != null)
      Frame.BackgroundColor = unhex (BackgroundColor);
    
    String EdgeColor = GetSetting (Settings, "EdgeColor");
    if (EdgeColor != null)
      Frame.EdgeColor = unhex (EdgeColor);
    
    String EdgeSize = GetSetting (Settings, "EdgeSize");
    if (EdgeSize != null)
      Frame.EdgeSize = int (EdgeSize);
    
    
    
    String Draggable = GetSetting (Settings, "Draggable");
    if (Draggable != null)
      Frame.Draggable = boolean (Draggable);    
    
    String Visible = GetSetting (Settings, "Visible");
    if (Visible != null)
      Frame.Visible = boolean (Visible);    
    
    String Enabled = GetSetting (Settings, "Enabled");
    if (Enabled != null)
      Frame.Enabled = boolean (Enabled);
    
    
    
  }
  
  
  
  
  
  
  
  
  
  
  public void SetTextFrameSettings (GUI_TextFrame TextFrame, String[] Settings) {
    //SetFrameSettings (TextFrame, Settings); // this isn't needed because it's called by the super call in the constructor
    
    
    
    String Text = GetSetting (Settings, "Text");
    if (Text != null)
      TextFrame.Text = Text;
    
    String TextColor = GetSetting (Settings, "TextColor");
    if (TextColor != null)
      TextFrame.TextColor = unhex (TextColor);
    
    String TextSize = GetSetting (Settings, "TextSize");
    if (TextSize != null)
      TextFrame.TextSize = float (TextSize);
    
    
    
    String TextAlignX = GetSetting (Settings, "TextAlignX");
    if (TextAlignX != null)
      TextFrame.TextAlignX = int (TextAlignX);
    
    String TextAlignY = GetSetting (Settings, "TextAlignY");
    if (TextAlignY != null)
      TextFrame.TextAlignY = int (TextAlignY);
    
    
    
  }
  
  
  
  
  
  
  
  
  
  
  public void SetImageFrameSettings (GUI_ImageFrame ImageFrame, String[] Settings) {
    //SetFrameSettings (ImageFrame, Settings); // this isn't needed because it's called by the super call in the constructor
    
    
    
    String RenderFrame = GetSetting (Settings, "RenderFrame");
    if (RenderFrame != null)
      ImageFrame.RenderFrame = boolean (RenderFrame);
    
    
    
  }
  
  
  
  
  
  
  
  
  
  
  public void SetButtonSettings (GUI_Button Button, String[] Settings) {
    //SetFrameSettings (Button, Settings); // this isn't needed because it's called by the super call in the constructor
    
    
    
    String PressedBackgroundColor = GetSetting (Settings, "PressedBackgroundColor");
    if (PressedBackgroundColor != null)
      Button.PressedBackgroundColor = unhex (PressedBackgroundColor);
    
    String UsePressedColor = GetSetting (Settings, "UsePressedColor");
    if (UsePressedColor != null)
      Button.UsePressedColor = boolean (UsePressedColor);
    
    
    
    String XMove = GetSetting (Settings, "XMove");
    if (XMove != null)
      Button.XMove = float (XMove);
    
    String YMove = GetSetting (Settings, "YMove");
    if (YMove != null)
      Button.YMove = float (YMove);
    
    
    
  }
  
  
  
  
  
  
  
  
  
  
  public void SetTextButtonSettings (GUI_TextButton TextButton, String[] Settings) {
    //SetButtonSettings (TextButton, Settings); // this isn't needed because it's called by the super call in the constructor
    
    
    
    String Text = GetSetting (Settings, "Text");
    if (Text != null)
      TextButton.Text = Text;
    
    String TextColor = GetSetting (Settings, "TextColor");
    if (TextColor != null)
      TextButton.TextColor = unhex (TextColor);
    
    String TextSize = GetSetting (Settings, "TextSize");
    if (TextSize != null)
      TextButton.TextSize = float (TextSize);
    
    
    
    String TextAlignX = GetSetting (Settings, "TextAlignX");
    if (TextAlignX != null)
      TextButton.TextAlignX = int (TextAlignX);
    
    String TextAlignY = GetSetting (Settings, "TextAlignY");
    if (TextAlignY != null)
      TextButton.TextAlignY = int (TextAlignY);
    
    
    
  }
  
  
  
  
  
  
  
  
  
  
  public void SetImageButtonSettings (GUI_ImageButton ImageButton, String[] Settings) {
    //SetButtonSettings (ImageButton, Settings); // this isn't needed because it's called by the super call in the constructor
    
    
    
    String RenderFrame = GetSetting (Settings, "RenderFrame");
    if (RenderFrame != null)
      ImageButton.RenderFrame = boolean (RenderFrame);
    
    
    
  }
  
  
  
  
  
  
  
  
  
  
}
