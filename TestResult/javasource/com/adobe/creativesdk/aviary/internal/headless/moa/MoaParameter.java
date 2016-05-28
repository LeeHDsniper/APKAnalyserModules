package com.adobe.creativesdk.aviary.internal.headless.moa;

import java.io.Serializable;

public abstract class MoaParameter<T>
  implements Serializable, Cloneable
{
  private static final long serialVersionUID = -3963695504549185371L;
  T defaultValue;
  String description;
  boolean hasLimits;
  T maxValue;
  T minValue;
  String name;
  String type;
  String uid;
  T value;
  
  public MoaParameter() {}
  
  public abstract Object clone();
  
  public abstract Object encode();
  
  public T getValue()
  {
    return value;
  }
  
  public void setValue(T paramT)
  {
    value = paramT;
  }
}
