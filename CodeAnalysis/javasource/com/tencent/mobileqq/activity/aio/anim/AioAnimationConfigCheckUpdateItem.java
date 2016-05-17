package com.tencent.mobileqq.activity.aio.anim;

import KQQ.ReqItem;
import KQQ.RespItem;
import com.qq.jce.wup.UniPacket;
import com.tencent.common.app.BaseProtocolCoder;
import com.tencent.mobileqq.app.ConfigHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.MobileQQService;
import com.tencent.mobileqq.service.profile.CheckUpdateItemInterface;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.QLog;
import protocol.KQQConfig.GetResourceReqInfo;

public class AioAnimationConfigCheckUpdateItem
  extends ConfigHandler
  implements CheckUpdateItemInterface
{
  public static final String a = "AioAnimationConfigCheckUpdateItem";
  private ToServiceMsg a;
  
  public AioAnimationConfigCheckUpdateItem(QQAppInterface paramQQAppInterface)
  {
    super(paramQQAppInterface);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public int a()
  {
    return 7;
  }
  
  public ReqItem a()
  {
    Object localObject2 = null;
    if (QLog.isColorLevel()) {
      QLog.d("AioAnimationConfigCheckUpdateItem", 2, "getCheckUpdateItemData:");
    }
    a(null, new GetResourceReqInfo[] { a() });
    Object localObject1 = localObject2;
    if (a != null)
    {
      BaseProtocolCoder localBaseProtocolCoder = b.a.a(a.getServiceCmd());
      localObject1 = localObject2;
      if (localBaseProtocolCoder != null)
      {
        UniPacket localUniPacket = new UniPacket(true);
        localUniPacket.setEncodeName("utf-8");
        localObject1 = localObject2;
        if (localBaseProtocolCoder.a(a, localUniPacket))
        {
          localObject1 = new ReqItem();
          eServiceID = 120;
          vecParam = localUniPacket.encode();
        }
      }
    }
    return localObject1;
  }
  
  public void a(RespItem paramRespItem)
  {
    if (paramRespItem != null)
    {
      int i = cResult;
      Object localObject = vecUpdate;
      if (QLog.isColorLevel()) {
        QLog.d("AioAnimationConfigCheckUpdateItem", 2, "handleCheckUpdateItemData: item.cResult = " + i + ", dataLen = " + localObject.length);
      }
      if ((eServiceID == 120) && (cResult == 2))
      {
        localObject = new FromServiceMsg(b.getAccount(), "ConfigService.GetResourceReq");
        ((FromServiceMsg)localObject).setMsgSuccess();
        ((FromServiceMsg)localObject).putWupBuffer(vecUpdate);
        b.a(a, (FromServiceMsg)localObject);
      }
    }
  }
  
  public void a(ToServiceMsg paramToServiceMsg)
  {
    a = paramToServiceMsg;
  }
}
