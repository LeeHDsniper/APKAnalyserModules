package com.dumplingsandwich.pencilsketch.model;

public class HsvPixel
{
  public float h;
  public float s;
  public float v;
  
  public HsvPixel()
  {
    v = 0.0F;
    s = 0.0F;
    h = 0.0F;
  }
  
  public HsvPixel(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    h = paramFloat1;
    s = paramFloat2;
    v = paramFloat3;
  }
}
