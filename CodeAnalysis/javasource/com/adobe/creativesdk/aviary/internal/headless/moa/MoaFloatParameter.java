package com.adobe.creativesdk.aviary.internal.headless.moa;

public class MoaFloatParameter
  extends MoaParameter<Float>
{
  private static final long serialVersionUID = -7307654199232530826L;
  
  public MoaFloatParameter()
  {
    setValue(Float.valueOf(0.0F));
  }
  
  public MoaFloatParameter(float paramFloat)
  {
    setValue(Float.valueOf(paramFloat));
  }
  
  public Object clone()
  {
    return new MoaFloatParameter(((Float)value).floatValue());
  }
  
  public Object encode()
  {
    return value;
  }
}
