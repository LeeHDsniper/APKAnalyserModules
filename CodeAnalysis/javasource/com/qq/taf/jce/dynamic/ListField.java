package com.qq.taf.jce.dynamic;

public final class ListField
  extends JceField
{
  private JceField[] data;
  
  ListField(JceField[] paramArrayOfJceField, int paramInt)
  {
    super(paramInt);
    data = paramArrayOfJceField;
  }
  
  public JceField get(int paramInt)
  {
    return data[paramInt];
  }
  
  public JceField[] get()
  {
    return data;
  }
  
  public void set(int paramInt, JceField paramJceField)
  {
    data[paramInt] = paramJceField;
  }
  
  public void set(JceField[] paramArrayOfJceField)
  {
    data = paramArrayOfJceField;
  }
  
  public int size()
  {
    return data.length;
  }
}
