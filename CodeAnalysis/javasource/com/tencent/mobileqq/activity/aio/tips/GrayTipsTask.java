package com.tencent.mobileqq.activity.aio.tips;

import com.tencent.mobileqq.data.MessageRecord;

public abstract interface GrayTipsTask
  extends TipsTask
{
  public abstract MessageRecord a(Object... paramVarArgs);
}
