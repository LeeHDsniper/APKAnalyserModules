package com.tencent.mobileqq.utils;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pluginsdk.PluginBaseInfoHelper.Base64Helper;

public class Base64Util
  extends PluginBaseInfoHelper.Base64Helper
{
  public Base64Util()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
}
