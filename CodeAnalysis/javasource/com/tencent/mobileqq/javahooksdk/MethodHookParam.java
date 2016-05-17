package com.tencent.mobileqq.javahooksdk;

import java.lang.reflect.Member;

public class MethodHookParam
{
  public Object[] args;
  public Member method;
  public Object result;
  public Object thisObject;
  public Throwable throwable;
  
  public MethodHookParam() {}
}
