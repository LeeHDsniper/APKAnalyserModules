package com.tencent.mobileqq.hitrate;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class PreloadProcHitPluginSessionProc
  extends PreloadProcHitSession
{
  public PreloadProcHitPluginSessionProc(String paramString)
  {
    super("proc", "QPPHR_" + paramString, paramString);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
}
