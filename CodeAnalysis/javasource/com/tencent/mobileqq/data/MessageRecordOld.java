package com.tencent.mobileqq.data;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class MessageRecordOld
  extends MessageRecord
{
  public String msg;
  
  public MessageRecordOld()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
}
