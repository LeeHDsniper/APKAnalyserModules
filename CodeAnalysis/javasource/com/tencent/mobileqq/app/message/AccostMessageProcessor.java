package com.tencent.mobileqq.app.message;

import AccostSvc.Msg;
import AccostSvc.MsgItem;
import AccostSvc.RichMsg;
import AccostSvc.SvrMsg;
import AccostSvc.UserInfo;
import MessageSvcPack.AccostMsg;
import MessageSvcPack.SvcGetMsgInfo;
import MessageSvcPack.SvcResponseGetMsgV2;
import QQService.PushCardMsg;
import QQService.PushType;
import QQService.PushVoteIncreaseInfo;
import android.database.Cursor;
import android.text.TextUtils;
import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.tencent.mobileqq.app.CardHandler;
import com.tencent.mobileqq.app.FriendListHandler;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.MessageHandlerUtils;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.data.MessageForPic;
import com.tencent.mobileqq.data.MessageForPtt;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.SystemMsg;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import com.tencent.mobileqq.service.message.MessageRecordFactory;
import com.tencent.mobileqq.service.message.MessageUtils;
import com.tencent.mobileqq.service.message.PBDecodeContext;
import com.tencent.mobileqq.transfile.TransfileUtile;
import com.tencent.mobileqq.util.Utils;
import com.tencent.mobileqq.utils.ActionMsgUtil;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.HexUtil;
import com.tencent.open.appcommon.Common;
import com.tencent.open.business.viareport.OpenSdkStatic;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import msf.msgcomm.msg_comm.Msg;
import nix;
import niy;

public class AccostMessageProcessor
  extends BaseMessageProcessor
{
  public AccostMessageProcessor(QQAppInterface paramQQAppInterface, MessageHandler paramMessageHandler)
  {
    super(paramQQAppInterface, paramMessageHandler);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private RichMsg a(byte[] paramArrayOfByte)
  {
    try
    {
      RichMsg localRichMsg = new RichMsg();
      return localRichMsg;
    }
    catch (Exception paramArrayOfByte)
    {
      try
      {
        paramArrayOfByte = new JceInputStream(paramArrayOfByte);
        paramArrayOfByte.setServerEncoding("utf-8");
        localRichMsg.readFrom(paramArrayOfByte);
        return localRichMsg;
      }
      catch (Exception paramArrayOfByte) {}
      paramArrayOfByte = paramArrayOfByte;
      return null;
    }
  }
  
  private void a(long paramLong1, ArrayList paramArrayList1, ArrayList paramArrayList2, ArrayList paramArrayList3, long paramLong2, String paramString)
  {
    int i = 0;
    AccostMsg localAccostMsg;
    if (i < paramArrayList1.size())
    {
      localAccostMsg = (AccostMsg)paramArrayList1.get(i);
      if ((paramArrayList3 == null) || (paramArrayList3.size() <= i)) {
        break label343;
      }
    }
    label343:
    for (SvcGetMsgInfo localSvcGetMsgInfo = (SvcGetMsgInfo)paramArrayList3.get(i);; localSvcGetMsgInfo = null)
    {
      Object localObject = new AccostMessageProcessor.DelAccostMsg(this);
      jdField_a_of_type_Long = lFromMID;
      jdField_b_of_type_Long = lToMID;
      c = uMsgID;
      jdField_a_of_type_Short = shMsgType;
      paramArrayList2.add(localObject);
      boolean bool = a(String.valueOf(paramLong1), String.valueOf(lFromMID));
      if (QLog.isColorLevel())
      {
        MessageHandlerUtils.a("Q.msg.BaseMessageProcessor", paramString, uMsgID, String.valueOf(paramLong1), String.valueOf(lToMID));
        QLog.d("Q.msg.BaseMessageProcessor", 2, "----------handleGetAccostMessageResp fromBlackList: " + bool + "accostMsg.shMsgType: " + shMsgType);
      }
      if (!bool) {
        switch (shMsgType)
        {
        }
      }
      ArrayList localArrayList;
      do
      {
        do
        {
          i += 1;
          break;
          localObject = a(strMsg);
        } while (localObject == null);
        localArrayList = VecMsg;
      } while ((localArrayList == null) || (localArrayList.size() <= 0));
      paramLong2 = lFromMID;
      if (eAccostType == 0) {}
      for (int j = iAccostType;; j = eAccostType)
      {
        a(paramLong1, new niy(this, paramLong2, j, uMsgID, iMsgTime, localArrayList, sAction), localSvcGetMsgInfo, false);
        break;
      }
      return;
    }
  }
  
  private void a(long paramLong, niy paramNiy)
  {
    ArrayList localArrayList = jdField_a_of_type_JavaUtilArrayList;
    int i = 0;
    try
    {
      while (i < localArrayList.size())
      {
        Object localObject1 = (MsgItem)localArrayList.get(i);
        new String(MsgContent);
        if (-56 == cType)
        {
          localObject1 = new JceInputStream(MsgContent);
          ((JceInputStream)localObject1).setServerEncoding("utf-8");
          Object localObject2 = new PushCardMsg();
          ((PushCardMsg)localObject2).readFrom((JceInputStream)localObject1);
          if (PushType.PUSH_TYPE_VOTE_INCR.value() == ePushType)
          {
            localObject2 = new JceInputStream(vPushInfo);
            ((JceInputStream)localObject2).setServerEncoding("utf-8");
            localObject1 = new PushVoteIncreaseInfo();
            ((PushVoteIncreaseInfo)localObject1).readFrom((JceInputStream)localObject2);
            if (iIncrement > 0)
            {
              localObject2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
              QQAppInterface localQQAppInterface = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
              localObject2 = (CardHandler)((QQAppInterface)localObject2).a(2);
              if (localObject2 != null) {
                ((CardHandler)localObject2).a((PushVoteIncreaseInfo)localObject1, String.valueOf(paramLong), String.valueOf(jdField_a_of_type_Long));
              }
            }
          }
        }
        i += 1;
      }
      return;
    }
    catch (Exception paramNiy)
    {
      paramNiy.printStackTrace();
    }
  }
  
  private void a(long paramLong, niy paramNiy, SvcGetMsgInfo paramSvcGetMsgInfo, boolean paramBoolean)
  {
    ArrayList localArrayList1 = new ArrayList();
    ArrayList localArrayList2 = jdField_a_of_type_JavaUtilArrayList;
    String str1 = jdField_a_of_type_JavaLangString;
    int m = 0;
    int i = 64536;
    MsgItem localMsgItem;
    String str2;
    Object localObject3;
    int j;
    if (m < localArrayList2.size())
    {
      localMsgItem = (MsgItem)localArrayList2.get(m);
      str2 = new String(MsgContent);
      localObject3 = null;
      j = cType;
    }
    for (;;)
    {
      Object localObject2;
      try
      {
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.BaseMessageProcessor", 2, "----------handleAccostMsgItemResp msgItem.cType:" + cType + " isReaded:" + paramBoolean);
        }
        switch (j)
        {
        default: 
          localObject1 = null;
          j = i;
          localObject3 = localObject1;
        }
      }
      catch (Exception localException)
      {
        Object localObject1;
        int k;
        long l2;
        if ((MsgContent == null) || (!QLog.isColorLevel())) {
          continue;
        }
        QLog.w("Q.msg.BaseMessageProcessor", 2, "----------handleAccostMsgItemResp msgItem.MsgContent:" + HexUtil.a(MsgContent));
        j = i;
        continue;
        if (jdField_a_of_type_Int != 201) {
          continue;
        }
        localObject2 = ActionMsgUtil.a((String)localObject3, str1);
        if (j != 63536) {
          continue;
        }
        i = 64504;
        long l1 = l2;
        continue;
        if (j != 63534) {
          continue;
        }
        i = 64505;
        l1 = l2;
        continue;
        i = 64533;
        l1 = l2;
        continue;
        if (jdField_a_of_type_Int != 6) {
          continue;
        }
        a(str1, paramLong, false);
        localObject2 = ActionMsgUtil.a((String)localObject3, str1);
        i = 62535;
        l1 = l2;
        continue;
        l1 = l2;
        localObject2 = localObject3;
        i = j;
        if (str1 == null) {
          continue;
        }
        l1 = l2;
        localObject2 = localObject3;
        i = j;
        if (str1.length() <= 0) {
          continue;
        }
        localObject2 = ActionMsgUtil.a((String)localObject3, str1);
        i = 62536;
        l1 = l2;
        continue;
        if (!(localObject3 instanceof MessageForPtt)) {
          continue;
        }
        localObject2 = (MessageForPtt)localObject3;
        subVersion = 2;
        url = str2;
        urlAtServer = str2;
        itemType = 2;
        fileSize = 0L;
        isread = false;
        continue;
      }
      k = j;
      if (localObject3 != null)
      {
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.BaseMessageProcessor", 2, "----------handleAccostMsgItemResp accostMsg.eAccostType" + jdField_a_of_type_Int + "accostMsg.msgId: " + jdField_b_of_type_Long + " accostMsg.time" + c + " msgConten: " + Utils.a((String)localObject3));
        }
        l2 = jdField_a_of_type_Long;
        if (jdField_a_of_type_Int != 1) {
          continue;
        }
        l1 = 9999L;
        i = j;
        localObject1 = localObject3;
        localObject3 = MessageRecordFactory.a(i);
        ((MessageRecord)localObject3).init(paramLong, l1, jdField_a_of_type_Long, (String)localObject1, c, i, 1001, 0L);
        shmsgseq = jdField_b_of_type_Long;
        isread = paramBoolean;
        if ((paramSvcGetMsgInfo != null) && (vReserved != null) && (vReserved.length >= 2))
        {
          longMsgCount = vReserved[0];
          longMsgIndex = vReserved[1];
          longMsgId = vReserved[2];
        }
        if (!(localObject3 instanceof MessageForPic)) {
          continue;
        }
        localObject1 = (MessageForPic)localObject3;
        subVersion = 2;
        if (i == 63536)
        {
          path = str2;
          uuid = str2;
          size = 0L;
          type = 1;
          isRead = false;
        }
        k = i;
        if (!MessageHandlerUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (MessageRecord)localObject3, false))
        {
          localArrayList1.add(localObject3);
          k = i;
        }
      }
      m += 1;
      i = k;
      break;
      if (MsgContent != null)
      {
        localObject1 = new String(MessageUtils.b(MsgContent), "utf-8");
        break label956;
        localObject1 = TransfileUtile.a(str2, 0L, 1, false, str2);
        i = 63536;
        continue;
        localObject1 = TransfileUtile.a(str2, 0L, 2, false, str2);
        i = 63534;
        continue;
        a(paramLong, paramBoolean, paramNiy);
        return;
        if (localArrayList1.size() <= 0) {
          continue;
        }
        boolean bool1 = MessageHandlerUtils.a(localArrayList1);
        boolean bool2 = MessageHandlerUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localArrayList1);
        i = MsgProxyUtils.a(localArrayList1, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
        paramNiy = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
        if ((bool1) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.isBackground_Stop)) {}
        for (paramBoolean = true;; paramBoolean = false)
        {
          paramNiy.a(localArrayList1, String.valueOf(paramLong), paramBoolean);
          a("handleAccostMsgItemResp", true, i, jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(bool1, bool2), false);
          return;
        }
      }
      else
      {
        localObject2 = null;
      }
      label956:
      i = 64536;
    }
  }
  
  private void a(long paramLong, boolean paramBoolean, niy paramNiy)
  {
    ArrayList localArrayList = new ArrayList();
    long l = d;
    if (l == paramLong) {}
    SystemMsg localSystemMsg;
    for (int i = 1;; i = 0)
    {
      new ArrayList();
      localSystemMsg = new SystemMsg();
      localObject = new StringBuffer();
      int j = 0;
      while (j < jdField_a_of_type_JavaUtilArrayList.size())
      {
        ((StringBuffer)localObject).append(new String(jdField_a_of_type_JavaUtilArrayList.get(j)).MsgContent));
        if (j < jdField_a_of_type_JavaUtilArrayList.size() - 1) {
          ((StringBuffer)localObject).append("\n");
        }
        j += 1;
      }
    }
    sMsg = ((StringBuffer)localObject).toString();
    auth = jdField_a_of_type_ArrayOfByte;
    lToMobile = e;
    strNickName = jdField_b_of_type_JavaLangString;
    if (QLog.isColorLevel()) {
      QLog.d("MessageHandler", 2, "addFriendRequestByOldVersion, addUin=" + d + ", msgUid=" + jdField_b_of_type_Long + ", msg=" + sMsg);
    }
    Object localObject = ((FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50)).c(String.valueOf(l));
    label320:
    MessageRecord localMessageRecord;
    if (localObject != null)
    {
      localObject = ContactUtils.a((Friends)localObject);
      if ((localObject != null) && (((String)localObject).length() != 0)) {
        break label558;
      }
      message = (l + BaseApplication.getContext().getString(2131368572));
      localObject = new JceOutputStream();
      ((JceOutputStream)localObject).setServerEncoding("UTF-8");
      localSystemMsg.writeTo((JceOutputStream)localObject);
      localObject = HexUtil.a(((JceOutputStream)localObject).toByteArray());
      if (localObject != null)
      {
        localMessageRecord = MessageRecordFactory.a(64525);
        localMessageRecord.init(paramLong, 9998L, l, (String)localObject, 0L, 64525, 0, c);
        shmsgseq = 187L;
        msgUid = jdField_b_of_type_Long;
        if (paramBoolean) {
          isread = true;
        }
        if (i == 0) {
          break label593;
        }
        i = 1;
        label427:
        issend = i;
        if (MessageHandlerUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localMessageRecord, true)) {
          break label599;
        }
        localArrayList.add(localMessageRecord);
      }
    }
    for (;;)
    {
      if (localArrayList.size() > 0)
      {
        i = MsgProxyUtils.a(localArrayList, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(String.valueOf(9998L), 0, localArrayList, true);
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(localArrayList, String.valueOf(paramLong));
        a("addFriendRequestByOldVersion", true, i, true, false);
        jdField_a_of_type_ComTencentMobileqqAppMessageHandler.b(localArrayList);
      }
      return;
      ((FriendListHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1)).b(String.valueOf(l));
      localObject = null;
      break;
      label558:
      message = ((String)localObject + BaseApplication.getContext().getString(2131368572));
      break label320;
      label593:
      i = 0;
      break label427;
      label599:
      if (QLog.isColorLevel()) {
        QLog.d("MessageHandler", 2, "addFriendRequestByOldVersion, the message is remove by msgFilter, addUin=" + d + ", msgUid=" + msgUid + ", msg=" + sMsg);
      }
    }
  }
  
  private void a(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject)
  {
    if (paramObject == null) {}
    do
    {
      return;
      paramObject = (SvrMsg)paramObject;
      if (stMsg != null) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.d("Q.msg.BaseMessageProcessor", 2, "handlePushAccostMsg sMsg.stMsg is null");
    return;
    if (paramFromServiceMsg.getUin() == null)
    {
      paramToServiceMsg = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount();
      boolean bool = a(paramFromServiceMsg.getUin(), String.valueOf(stMsg.lFromMID));
      if (QLog.isColorLevel()) {
        MessageHandlerUtils.a("Q.msg.BaseMessageProcessor", (String)paramFromServiceMsg.getAttribute("_tag_LOGSTR"), stMsg.uMsgID, paramToServiceMsg, String.valueOf(stMsg.lFromMID));
      }
      if (!bool) {
        switch (stMsg.shMsgType)
        {
        }
      }
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(paramObject);
      return;
      paramToServiceMsg = paramFromServiceMsg.getUin();
      break;
      if ((bResend != 1) || (!a(paramToServiceMsg, String.valueOf(stMsg.lFromMID), stMsg.uMsgID)))
      {
        paramFromServiceMsg = a(stMsg.strMsg);
        if ((paramFromServiceMsg != null) && (VecMsg != null))
        {
          Object localObject = VecMsg;
          localObject = new niy(this, stMsg.lFromMID, stMsg.eAccostType, stMsg.uMsgID, stMsg.iMsgTime, (ArrayList)localObject, sAction);
          if (stSender != null)
          {
            if (QLog.isColorLevel()) {
              QLog.d("Q.msg.BaseMessageProcessor", 2, "handlePushAccostMsg richMsg.stSender is null");
            }
            d = stSender.lMobileUin;
            jdField_a_of_type_ArrayOfByte = stSender.sig;
            jdField_b_of_type_JavaLangString = stSender.nickname;
          }
          e = stMsg.lFromMID;
          a(Long.valueOf(paramToServiceMsg).longValue(), (niy)localObject, null, false);
          continue;
          paramFromServiceMsg = a(stMsg.strMsg);
          if (paramFromServiceMsg != null)
          {
            paramFromServiceMsg = new niy(this, stMsg.lFromMID, VecMsg);
            a(Long.valueOf(paramToServiceMsg).longValue(), paramFromServiceMsg);
          }
        }
      }
    }
  }
  
  private void a(String paramString, long paramLong, boolean paramBoolean)
  {
    paramString = Common.a(paramString);
    String str = (String)paramString.get("appid");
    paramString = (String)paramString.get("via");
    if (TextUtils.isEmpty("via")) {
      paramString = "ANDROIDQQ.PCPUSH";
    }
    for (;;)
    {
      if (str != null) {
        OpenSdkStatic.a().a(String.valueOf(paramLong), str, paramString, "100", paramBoolean);
      }
      return;
    }
  }
  
  private boolean a(String paramString1, String paramString2)
  {
    paramString1 = ((FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50)).c(paramString2);
    return (paramString1 != null) && (groupid == 64534);
  }
  
  private boolean a(String paramString1, String paramString2, long paramLong)
  {
    boolean bool = false;
    paramString1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(String.valueOf(paramString1)).createEntityManager().a(false, MessageRecord.getTableName(paramString2, 1001), null, "msgseq=?", new String[] { String.valueOf(paramLong) }, null, null, null, null);
    if (paramString1 != null) {}
    for (;;)
    {
      try
      {
        i = paramString1.getCount();
        if (paramString1 != null) {
          paramString1.close();
        }
        if (i > 0) {
          bool = true;
        }
        return bool;
      }
      finally
      {
        if (paramString1 != null) {
          paramString1.close();
        }
      }
      int i = 0;
    }
  }
  
  private void b(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, Object paramObject)
  {
    paramObject = (SvcResponseGetMsgV2)paramObject;
    if ((paramObject == null) || (cReplyCode != 0)) {
      jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(paramToServiceMsg, paramFromServiceMsg);
    }
    label125:
    label315:
    label321:
    label337:
    for (;;)
    {
      return;
      int i;
      ArrayList localArrayList1;
      if (paramFromServiceMsg.getUin() == null)
      {
        paramFromServiceMsg = Long.valueOf(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount());
        long l = paramFromServiceMsg.longValue();
        int j = cMoreMsg;
        paramFromServiceMsg = vCookies;
        if (QLog.isColorLevel())
        {
          paramToServiceMsg = new StringBuilder().append("<GetMsgV4><R>--->handleGetLbsMessageResp ssoSeq:").append(paramToServiceMsg.getRequestSsoSeq()).append(" msgStruct.cReplyCode: ").append(cReplyCode).append(" vCookies:").append(paramFromServiceMsg).append(" size:");
          if (paramFromServiceMsg == null) {
            break label315;
          }
          i = paramFromServiceMsg.length;
          QLog.d("Q.msg.BaseMessageProcessor", 2, i);
        }
        paramToServiceMsg = vAccostMsg;
        localArrayList1 = new ArrayList();
        ArrayList localArrayList2 = vMsgInfos;
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.BaseMessageProcessor", 2, "<---handleGetLbsMessageResp : moreMsg: " + j + "cSyncFlag:" + cSyncFlag);
        }
        if ((paramToServiceMsg != null) && (paramToServiceMsg.size() > 0))
        {
          if (QLog.isColorLevel()) {
            QLog.d("Q.msg.BaseMessageProcessor", 2, "----------handleGetC2CMessageResp accostMsg size: " + paramToServiceMsg.size());
          }
          a(l, paramToServiceMsg, localArrayList1, localArrayList2, 0L, "handleGetLbsMessageResp");
        }
        if ((paramFromServiceMsg == null) || (paramFromServiceMsg.length <= 0)) {
          break label321;
        }
        a(paramFromServiceMsg, cSyncFlag);
      }
      for (;;)
      {
        if (localArrayList1.size() <= 0) {
          break label337;
        }
        jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(null, localArrayList1);
        return;
        paramFromServiceMsg = Long.valueOf(paramFromServiceMsg.getUin());
        break;
        i = 0;
        break label125;
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.BaseMessageProcessor", 2, "<---handleGetLbsMessageResp. final resp of LbsMessage.");
        }
      }
    }
  }
  
  public List a(msg_comm.Msg paramMsg, PBDecodeContext paramPBDecodeContext)
  {
    return null;
  }
  
  public void a(int paramInt, ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    switch (paramInt)
    {
    }
    do
    {
      return;
    } while (!QLog.isColorLevel());
    QLog.e("Q.msg.BaseMessageProcessor", 2, "<GetMsgV4><E>handleGetLbsOfflineMessageError ");
  }
  
  public void a(int paramInt, Object... paramVarArgs)
  {
    switch (paramInt)
    {
    default: 
      return;
    case 5001: 
      if ((paramVarArgs != null) && (paramVarArgs.length == 3))
      {
        a((ToServiceMsg)paramVarArgs[0], (FromServiceMsg)paramVarArgs[1], paramVarArgs[2]);
        return;
      }
      a(getClass().getName(), paramInt);
      return;
    }
    if ((paramVarArgs != null) && (paramVarArgs.length == 3))
    {
      b((ToServiceMsg)paramVarArgs[0], (FromServiceMsg)paramVarArgs[1], paramVarArgs[2]);
      return;
    }
    a(getClass().getName(), paramInt);
  }
  
  public void a(byte[] paramArrayOfByte, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.BaseMessageProcessor", 2, "<GetMsgV4><S>--->getLbsOfflineMsg : cChannel:4,syncFlag:" + paramInt);
    }
    a(false, false, false, 0L, new nix(this, paramArrayOfByte, paramInt));
  }
  
  public void b(int paramInt, ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    switch (paramInt)
    {
    }
    do
    {
      return;
    } while (!QLog.isColorLevel());
    QLog.e("Q.msg.BaseMessageProcessor", 2, "<GetMsgV4><E>handleGetLbsOfflineMessageTimeOut ");
  }
}
