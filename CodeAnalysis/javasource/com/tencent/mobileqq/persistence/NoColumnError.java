package com.tencent.mobileqq.persistence;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class NoColumnError
  extends Error
{
  public String mColumnName;
  public Class mColumnType;
  
  public NoColumnError()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public NoColumnError(String paramString)
  {
    super(paramString);
  }
  
  public NoColumnError(String paramString, Class paramClass)
  {
    super("No_Such_Column_" + paramString);
    mColumnName = paramString;
    mColumnType = paramClass;
  }
}
