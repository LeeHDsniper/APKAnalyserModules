package com.tencent.mobileqq.activity.recent.msg;

import android.content.Context;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class TroopAtAllMsg
  extends TroopAtMsg
{
  public TroopAtAllMsg(Context paramContext)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = paramContext.getString(2131364483);
    b = a;
  }
}
