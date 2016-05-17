import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.MessageHandlerUtils;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.SystemMessageProcessor;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBInt32Field;
import com.tencent.mobileqq.pb.PBRepeatMessageField;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.service.message.MessageRecordFactory;
import com.tencent.mobileqq.systemmsg.GroupSystemMsgController;
import com.tencent.mobileqq.systemmsg.MessageForSystemMsg;
import com.tencent.mobileqq.transfile.ProtoReqManager.IProtoRespBack;
import com.tencent.mobileqq.transfile.ProtoReqManager.ProtoReq;
import com.tencent.mobileqq.transfile.ProtoReqManager.ProtoResp;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.List;
import tencent.mobileim.structmsg.structmsg.RspHead;
import tencent.mobileim.structmsg.structmsg.RspNextSystemMsg;
import tencent.mobileim.structmsg.structmsg.StructMsg;

public class nks
  implements ProtoReqManager.IProtoRespBack
{
  public nks(SystemMessageProcessor paramSystemMessageProcessor)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(ProtoReqManager.ProtoResp paramProtoResp, ProtoReqManager.ProtoReq paramProtoReq)
  {
    if (a.getResultCode() != 1000)
    {
      a.a(4006, false, null);
      return;
    }
    for (;;)
    {
      Object localObject;
      List localList;
      int j;
      int i;
      try
      {
        paramProtoReq = a.a.getAccount();
        localObject = new structmsg.RspNextSystemMsg();
        ((structmsg.RspNextSystemMsg)localObject).mergeFrom((byte[])a.getWupBuffer());
        new StringBuilder();
        if ((localObject == null) || (head.result.get() != 0)) {
          a.a(4006, false, null);
        }
        paramProtoResp = new ArrayList();
        localList = msgs.get();
        j = localList.size();
        if (!QLog.isColorLevel()) {
          break label543;
        }
        QLog.e("Q.systemmsg.", 2, "<---sendGetNextGroupSystemMsg Resp : decode pb size = " + j);
      }
      catch (Exception paramProtoResp) {}
      if (i < j)
      {
        MessageRecord localMessageRecord = MessageRecordFactory.a(63518);
        msgtype = 63518;
        selfuin = paramProtoReq;
        frienduin = AppConstants.av;
        senderuin = (getreq_uin.get() + "");
        istroop = 0;
        MessageForSystemMsg localMessageForSystemMsg = (MessageForSystemMsg)localMessageRecord;
        structMsg = ((structmsg.StructMsg)((structmsg.StructMsg)localList.get(i)).get());
        msgData = structMsg.toByteArray();
        paramProtoResp.add(localMessageForSystemMsg);
        i += 1;
      }
      else
      {
        if (paramProtoResp.size() > 0)
        {
          if (paramProtoResp.size() < 10) {
            GroupSystemMsgController.a().a(true, a.a);
          }
          GroupSystemMsgController.a().a(false);
          long l2 = following_group_seq.get();
          long l1 = l2;
          if (l2 <= 0L) {
            l1 = a.a.a().d("following_group_seq");
          }
          if (QLog.isColorLevel()) {
            QLog.e("Q.systemmsg.", 2, "<---sendGetNextGroupSystemMsg : decode pb following_group_seq" + l1);
          }
          a.a.a().d("following_group_seq", l1);
          localObject = a.a.a();
          paramProtoReq = String.valueOf(paramProtoReq);
          if ((MessageHandlerUtils.a(paramProtoResp)) && (a.a.isBackground_Stop))
          {
            bool = true;
            ((QQMessageFacade)localObject).a(paramProtoResp, paramProtoReq, bool);
            a.a("handleGetSystemMsgResp", true, paramProtoResp.size(), false, false);
            a.a(4005, true, null);
            return;
            if (!QLog.isColorLevel()) {
              break;
            }
            QLog.d("Q.systemmsg.", 2, "clearFriendSystemMsgResp exception", paramProtoResp);
            return;
          }
          boolean bool = false;
          continue;
        }
        GroupSystemMsgController.a().a(true, a.a);
        continue;
        label543:
        i = 0;
      }
    }
  }
}
