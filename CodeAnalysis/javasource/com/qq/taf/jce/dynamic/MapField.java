package com.qq.taf.jce.dynamic;

public final class MapField
  extends JceField
{
  private JceField[] keys;
  private JceField[] values;
  
  MapField(JceField[] paramArrayOfJceField1, JceField[] paramArrayOfJceField2, int paramInt)
  {
    super(paramInt);
    keys = paramArrayOfJceField1;
    values = paramArrayOfJceField2;
  }
  
  public JceField getKey(int paramInt)
  {
    return keys[paramInt];
  }
  
  public JceField[] getKeys()
  {
    return keys;
  }
  
  public JceField getValue(int paramInt)
  {
    return values[paramInt];
  }
  
  public JceField[] getValues()
  {
    return values;
  }
  
  public void setKey(int paramInt, JceField paramJceField)
  {
    keys[paramInt] = paramJceField;
  }
  
  public void setValue(int paramInt, JceField paramJceField)
  {
    values[paramInt] = paramJceField;
  }
  
  public int size()
  {
    return keys.length;
  }
}
