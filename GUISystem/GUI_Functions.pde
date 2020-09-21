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










GUI_Functions GUI_Functions = new GUI_Functions();

public class GUI_Functions {
  
  
  
  
  
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
  
  
  
  
  
  public int GetScreenX (float XPos) {
    return (int)((XPos * CustMatrix_ScaleX + CustMatrix_TranslateX) * width);
  }
  
  public int GetScreenY (float YPos) {
    return (int)((YPos * CustMatrix_ScaleY + CustMatrix_TranslateY) * height);
  }
  
  public float GetXPos (int ScreenX) {
    return (((float) ScreenX / width) - CustMatrix_TranslateX) / CustMatrix_ScaleX;
  }
  
  public float GetYPos (int ScreenY) {
    return (((float) ScreenY / height) - CustMatrix_TranslateY) / CustMatrix_ScaleY;
  }
  
  
  
  
  
}
