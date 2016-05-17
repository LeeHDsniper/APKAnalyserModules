package com.tencent.mobileqq.msf.sdk.handler;

import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;

public abstract interface IMsfMsgHandler
  extends IMsfHandler
{
  public abstract void onRecvResp(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg);
}
