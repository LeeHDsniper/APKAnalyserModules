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
import com.tencent.mobileqq.systemmsg.FriendSystemMsgController;
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

public class nlb
  implements ProtoReqManager.IProtoRespBack
{
  public nlb(SystemMessageProcessor paramSystemMessageProcessor)
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
          break label555;
        }
        QLog.e("Q.systemmsg.", 2, "<---sendGetNextFriendSystemMsg Resp : decode pb size = " + j);
      }
      catch (Exception paramProtoResp)
      {
        Object localObject;
        List localList;
        int j;
        MessageRecord localMessageRecord;
        MessageForSystemMsg localMessageForSystemMsg;
        long l2;
        long l1;
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.d("Q.systemmsg.", 2, "clearFriendSystemMsgResp exception", paramProtoResp);
        a.a(4006, false, null);
        return;
      }
      if (i < j)
      {
        localMessageRecord = MessageRecordFactory.a(63518);
        msgtype = 63518;
        selfuin = paramProtoReq;
        frienduin = AppConstants.au;
        senderuin = (getreq_uin.get() + "");
        istroop = 0;
        localMessageForSystemMsg = (MessageForSystemMsg)localMessageRecord;
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
            FriendSystemMsgController.a().a(true, a.a);
          }
          FriendSystemMsgController.a().a(false);
          l2 = following_friend_seq.get();
          l1 = l2;
          if (l2 <= 0L) {
            l1 = a.a.a().d("following_friend_seq_47");
          }
          if (QLog.isColorLevel()) {
            QLog.e("Q.systemmsg.", 2, "<---sendGetNextFriendSystemMsg : decode pb following_friend_seq" + l1);
          }
          a.a.a().d("following_friend_seq_47", l1);
          localObject = a.a.a();
          paramProtoReq = String.valueOf(paramProtoReq);
          if ((MessageHandlerUtils.a(paramProtoResp)) && (a.a.isBackground_Stop))
          {
            bool = true;
            ((QQMessageFacade)localObject).a(paramProtoResp, paramProtoReq, bool);
            a.a("handleGetSystemMsgResp", true, paramProtoResp.size(), false, false);
            a.a(4005, true, null);
            return;
          }
          boolean bool = false;
          continue;
        }
        FriendSystemMsgController.a().a(true, a.a);
        continue;
        label555:
        i = 0;
      }
    }
  }
}
