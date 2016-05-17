package com.tencent.mobileqq.msf.sdk;

import android.os.RemoteException;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.IMsfServiceCallbacker.Stub;
import com.tencent.qphone.base.remote.ToServiceMsg;

class h
  extends IMsfServiceCallbacker.Stub
{
  h(g paramG) {}
  
  public void onRecvPushResp(FromServiceMsg paramFromServiceMsg)
    throws RemoteException
  {
    g.a(a, paramFromServiceMsg);
  }
  
  public void onResponse(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
    throws RemoteException
  {
    g.a(a, paramToServiceMsg, paramFromServiceMsg);
  }
}
