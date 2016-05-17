package com.tencent.mobileqq.compatible;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.IBaseActionListener.Stub;
import com.tencent.qphone.base.remote.ToServiceMsg;
import java.util.HashMap;

@Deprecated
public abstract class ActionListener
  extends IBaseActionListener.Stub
{
  public ActionListener()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public abstract void a(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg);
  
  public void onActionResult(FromServiceMsg paramFromServiceMsg) {}
  
  public void onRecvFromMsg(FromServiceMsg paramFromServiceMsg)
  {
    a((ToServiceMsg)attributes.get(FromServiceMsg.class.getSimpleName()), paramFromServiceMsg);
  }
}
