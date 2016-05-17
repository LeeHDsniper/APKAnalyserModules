package com.tencent.mobileqq.msf.sdk.handler;

import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;

public abstract interface IServerInfoHandler
  extends IMsfHandler
{
  public abstract void onReportResp(int paramInt1, int paramInt2, String paramString, ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg);
}
