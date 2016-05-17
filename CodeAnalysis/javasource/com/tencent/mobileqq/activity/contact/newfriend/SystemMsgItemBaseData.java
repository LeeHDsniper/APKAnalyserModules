package com.tencent.mobileqq.activity.contact.newfriend;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class SystemMsgItemBaseData
{
  public static final int a = 15;
  public static final int b = 0;
  public static final int c = 1;
  protected int d;
  
  public SystemMsgItemBaseData()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    d = 0;
    d |= 0x1;
  }
}
