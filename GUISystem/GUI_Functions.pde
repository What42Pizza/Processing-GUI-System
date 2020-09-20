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
    
    int XStart = GetXOffset(XPos);
    int XEnd = GetXOffset (XPos + XSize) + 1;
    int YStart = GetYOffset(YPos);
    int YEnd = GetYOffset (YPos + YSize) + 1;
    
    for (int y = max (YStart, 0); y < min (YEnd, height); y ++) { // Main body
      int YWidth = y * width;
      for (int x = max (XStart, 0); x < min (XEnd, width); x ++) {
        pixels[x + YWidth] = BackgroundColor;
      }
    }
    
  }
  
  
  
  public void DrawRect (float XPos, float YPos, float XSize, float YSize, color BackgroundColor, int EdgeSize, color EdgeColor) {
    
    int HalfEdgeSize = floor (EdgeSize / 2.0);
    int XStart = GetXOffset(XPos);
    int XEnd = GetXOffset (XPos + XSize) + 1;
    int YStart = GetYOffset(YPos);
    int YEnd = GetYOffset (YPos + YSize) + 1;
    
    for (int y = max (YStart, 0); y < min (YEnd, height); y ++) { // Main body
      int YWidth = y * width;
      for (int x = max (XStart, 0); x < min (XEnd, width); x ++) {
        pixels[x + YWidth] = BackgroundColor;
      }
    }
    
    int LeftInner   = constrain (XStart + HalfEdgeSize + 1, 0, width ); // This is needed to avoid out of bounds exceptions (it's also faster when off screen)
    int LeftOuter   = constrain (XStart - HalfEdgeSize    , 0, width );
    int RightInner  = constrain (XEnd   - HalfEdgeSize    , 0, width );
    int RightOuter  = constrain (XEnd   + HalfEdgeSize + 1, 0, width );
    int TopInner    = constrain (YStart + HalfEdgeSize + 1, 0, height);
    int TopOuter    = constrain (YStart - HalfEdgeSize    , 0, height);
    int BottomInner = constrain (YEnd   - HalfEdgeSize    , 0, height);
    int BottomOuter = constrain (YEnd   + HalfEdgeSize + 1, 0, height);
    
    for (int y = TopOuter; y < TopInner; y ++) {       // Edge top
      int YWidth = y * width;
      for (int x = LeftOuter; x < RightOuter; x ++) {
        pixels[x + YWidth] = EdgeColor;
      }
    }
    
    for (int y = TopOuter; y < BottomOuter; y ++) {    // Edge right side
      int YWidth = y * width;
      for (int x = RightInner; x < RightOuter; x ++) {
        pixels[x + YWidth] = EdgeColor;
      }
    }
    
    for (int y = BottomInner; y < BottomOuter; y ++) { // Edge bottom
      int YWidth = y * width;
      for (int x = LeftOuter; x < RightOuter; x ++) {
        pixels[x + YWidth] = EdgeColor;
      }
    }
    
    for (int y = TopOuter; y < BottomOuter; y ++) {    // Edge left side
      int YWidth = y * width;
      for (int x = LeftOuter; x < LeftInner; x ++) {
        pixels[x + YWidth] = EdgeColor;
      }
    }
    
  }
  
  
  
  
  
  public int GetXOffset (float XPos) {
    return (int)((XPos * CustMatrix_ScaleX + CustMatrix_TranslateX) * width);
  }
  
  public int GetYOffset (float YPos) {
    return (int)((YPos * CustMatrix_ScaleY + CustMatrix_TranslateY) * height);
  }
  
  
  
  
  
}
