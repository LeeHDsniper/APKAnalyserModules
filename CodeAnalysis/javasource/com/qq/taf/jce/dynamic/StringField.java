package com.qq.taf.jce.dynamic;

public class StringField
  extends JceField
{
  private String data;
  
  StringField(String paramString, int paramInt)
  {
    super(paramInt);
    data = paramString;
  }
  
  public String get()
  {
    return data;
  }
  
  public void set(String paramString)
  {
    data = paramString;
  }
}
