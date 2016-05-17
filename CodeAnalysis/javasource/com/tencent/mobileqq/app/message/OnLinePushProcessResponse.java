package com.tencent.mobileqq.app.message;

import OnlinePushPack.MsgInfo;
import OnlinePushPack.SvcReqPushMsg;

public abstract interface OnLinePushProcessResponse
{
  public abstract void a(int paramInt, MsgInfo paramMsgInfo, SvcReqPushMsg paramSvcReqPushMsg);
}
