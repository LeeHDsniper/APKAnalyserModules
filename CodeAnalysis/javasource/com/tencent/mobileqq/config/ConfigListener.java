package com.tencent.mobileqq.config;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ConfigListener
{
  public ConfigListener()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a() {}
  
  public void a(boolean paramBoolean, short paramShort, int paramInt, String paramString) {}
}
