package com.tencent.mobileqq.app.message;

import IMMsgBodyPack.SlaveMasterMsg;
import OnlinePushPack.MsgInfo;
import OnlinePushPack.SvcReqPushMsg;
import com.qq.taf.jce.JceInputStream;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.message.MessageProtoCodec;
import com.tencent.mobileqq.service.message.PBDecodeContext;
import java.util.List;
import msf.msgcomm.msg_comm.Msg;
import nkh;

public class FileSlaveMasterMessageProcessor
  extends BaseMessageProcessor
{
  public FileSlaveMasterMessageProcessor(QQAppInterface paramQQAppInterface, MessageHandler paramMessageHandler)
  {
    super(paramQQAppInterface, paramMessageHandler);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private boolean a(MsgInfo paramMsgInfo)
  {
    JceInputStream localJceInputStream = new JceInputStream(vMsg);
    SlaveMasterMsg localSlaveMasterMsg = new SlaveMasterMsg();
    localSlaveMasterMsg.readFrom(localJceInputStream);
    if (((int)uMsgType == 529) && (4L == uCmd))
    {
      MessageProtoCodec.a(a.a(), paramMsgInfo, localSlaveMasterMsg);
      return true;
    }
    return false;
  }
  
  public List a(msg_comm.Msg paramMsg, PBDecodeContext paramPBDecodeContext)
  {
    return null;
  }
  
  public nkh a(int paramInt, MsgInfo paramMsgInfo, SvcReqPushMsg paramSvcReqPushMsg)
  {
    boolean bool = false;
    switch (paramInt)
    {
    }
    for (;;)
    {
      return new nkh(null, bool);
      if ((paramMsgInfo != null) && (paramSvcReqPushMsg != null)) {
        bool = a(paramMsgInfo);
      } else {
        a(getClass().getName(), paramInt);
      }
    }
  }
}
