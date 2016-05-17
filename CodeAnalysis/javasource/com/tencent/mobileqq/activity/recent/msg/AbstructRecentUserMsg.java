package com.tencent.mobileqq.activity.recent.msg;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.troop.data.MessageNavInfo;

public abstract class AbstructRecentUserMsg
  implements IRecentUserMsg
{
  public static final long a = -1L;
  public int a;
  public MessageNavInfo a;
  public String a;
  public int b;
  public long b;
  public String b;
  public long c;
  public String c;
  
  public AbstructRecentUserMsg()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_b_of_type_Long = -1L;
    c = -1L;
    jdField_b_of_type_Int = -35072;
    a = new MessageNavInfo();
  }
}
