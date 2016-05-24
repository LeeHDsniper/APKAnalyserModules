package com.adobe.creativesdk.aviary.internal.headless.moa;

import org.apache.commons.lang3.StringUtils;

public class MoaColorParameter
  extends MoaParameter<Integer>
{
  private static final long serialVersionUID = -9086060498030305187L;
  
  public MoaColorParameter(Integer paramInteger)
  {
    setValue(paramInteger);
  }
  
  public Object clone()
  {
    return new MoaColorParameter((Integer)getValue());
  }
  
  public Object encode()
  {
    return StringUtils.rightPad(Integer.toHexString(((Integer)getValue()).intValue()), 8, '0');
  }
}
