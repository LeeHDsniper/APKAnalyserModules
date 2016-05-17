package com.tencent.mobileqq.hitrate;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class PreloadProcHitPluginSession
  extends PreloadProcHitSession
{
  public String a;
  
  public PreloadProcHitPluginSession(String paramString1, String paramString2, String paramString3)
  {
    super("plugin", paramString1, paramString2);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = "";
    a = paramString3;
  }
  
  @Deprecated
  public void a()
  {
    super.a();
  }
  
  @Deprecated
  public void b()
  {
    super.b();
  }
}
