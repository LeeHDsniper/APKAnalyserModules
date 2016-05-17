package com.tencent.mobileqq.app.message;

import android.text.TextUtils;
import android.util.Pair;
import com.tencent.bitapp.BitAppManager;
import com.tencent.bitapp.MessageForBitApp;
import com.tencent.biz.TroopMemberLbs.TroopMemberLbsHelper;
import com.tencent.biz.anonymous.AnonymousChatHelper;
import com.tencent.mobileqq.app.HotChatManager;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.MessageObserver.StatictisInfo;
import com.tencent.mobileqq.app.NearbyFlowerManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.SVIPHandler;
import com.tencent.mobileqq.app.TroopHandler;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.app.lbs.LbsInfoMgr.LocationInfo;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.data.MessageForDeliverGiftTips;
import com.tencent.mobileqq.data.MessageForReplyText;
import com.tencent.mobileqq.data.MessageForReplyText.SourceMsgInfo;
import com.tencent.mobileqq.data.MessageForStructing;
import com.tencent.mobileqq.data.MessageForText;
import com.tencent.mobileqq.data.MessageForTroopTopic;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.data.TroopMemberInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.nearby.NearbyFlowerMessage;
import com.tencent.mobileqq.nearby.NearbyFlowerUtil;
import com.tencent.mobileqq.pb.ByteStringMicro;
import com.tencent.mobileqq.pb.PBBytesField;
import com.tencent.mobileqq.pb.PBRepeatMessageField;
import com.tencent.mobileqq.pb.PBStringField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.service.message.MessageProtoCodec;
import com.tencent.mobileqq.service.message.MessageRecordFactory;
import com.tencent.mobileqq.service.message.MessageUtils;
import com.tencent.mobileqq.service.message.PBDecodeContext;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.structmsg.AbsShareMsg;
import com.tencent.mobileqq.structmsg.AbsStructMsg;
import com.tencent.mobileqq.structmsg.AbsStructMsgElement;
import com.tencent.mobileqq.structmsg.view.StructMsgItemAsyncMsg;
import com.tencent.mobileqq.structmsg.view.StructMsgItemLayout6;
import com.tencent.mobileqq.troop.data.MessageInfo;
import com.tencent.mobileqq.troop.data.MessageNavInfo;
import com.tencent.mobileqq.troop.data.TroopTopicDetailInfo;
import com.tencent.mobileqq.troop.utils.TroopBindPublicAccountMgr;
import com.tencent.mobileqq.troop.utils.TroopBusinessUtil;
import com.tencent.mobileqq.troop.utils.TroopBusinessUtil.TroopBusinessMessage;
import com.tencent.mobileqq.troop.utils.TroopGiftManager;
import com.tencent.mobileqq.troop.utils.TroopTopicMgr;
import com.tencent.mobileqq.util.Utils;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.MsgAutoMonitorUtil;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import localpb.richMsg.SafeMsg.SafeMoreInfo;
import msf.msgcomm.msg_comm.AppShareInfo;
import msf.msgcomm.msg_comm.ContentHead;
import msf.msgcomm.msg_comm.GroupInfo;
import msf.msgcomm.msg_comm.Msg;
import msf.msgcomm.msg_comm.MsgHead;
import nji;
import tencent.im.msg.im_msg_body.AnonymousGroupMsg;
import tencent.im.msg.im_msg_body.Attr;
import tencent.im.msg.im_msg_body.Elem;
import tencent.im.msg.im_msg_body.ElemFlags2;
import tencent.im.msg.im_msg_body.ExtraInfo;
import tencent.im.msg.im_msg_body.GroupBusinessMsg;
import tencent.im.msg.im_msg_body.MsgBody;
import tencent.im.msg.im_msg_body.Ptt;
import tencent.im.msg.im_msg_body.PubGroup;
import tencent.im.msg.im_msg_body.RichText;

public class BaseMessageProcessorForTroopAndDisc
  extends BaseMessageProcessor
{
  public static final String a = "Q.msg.BaseMessageProcessorForTroopAndDisc";
  protected Comparator a;
  
  public BaseMessageProcessorForTroopAndDisc(QQAppInterface paramQQAppInterface, MessageHandler paramMessageHandler)
  {
    super(paramQQAppInterface, paramMessageHandler);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilComparator = new nji(this);
  }
  
  private void a(String paramString)
  {
    TroopManager localTroopManager = (TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51);
    if (localTroopManager.a(paramString) == null)
    {
      TroopInfo localTroopInfo = new TroopInfo();
      troopuin = paramString;
      localTroopManager.b(localTroopInfo);
      ((TroopHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(20)).a(paramString, (byte)1, 0L, 0);
    }
  }
  
  private boolean a(MessageRecord paramMessageRecord)
  {
    if ((paramMessageRecord instanceof MessageForStructing))
    {
      paramMessageRecord = structingMsg;
      if ((paramMessageRecord != null) && (mMsgServiceID == 60)) {
        return true;
      }
    }
    return false;
  }
  
  private boolean b(MessageRecord paramMessageRecord)
  {
    if (((paramMessageRecord instanceof MessageForStructing)) && (!TextUtils.equals(selfuin, senderuin)))
    {
      Object localObject = structingMsg;
      if ((61 == mMsgServiceID) && ((localObject instanceof AbsShareMsg)))
      {
        localObject = ((AbsShareMsg)localObject).getStructMsgItemLists();
        if ((localObject != null) && (3 == ((List)localObject).size()))
        {
          localObject = (AbsStructMsgElement)((List)localObject).get(2);
          if ((localObject instanceof StructMsgItemLayout6))
          {
            localObject = (StructMsgItemLayout6)localObject;
            if ((a != null) && (1 == a.size()))
            {
              localObject = (AbsStructMsgElement)a.get(0);
              if (((localObject instanceof StructMsgItemAsyncMsg)) && (r.contains(selfuin))) {
                return true;
              }
            }
          }
        }
      }
    }
    return false;
  }
  
  protected TroopMemberInfo a(msg_comm.Msg paramMsg, ArrayList paramArrayList, PBDecodeContext paramPBDecodeContext, boolean paramBoolean, MessageInfo paramMessageInfo)
  {
    long l5;
    msg_comm.MsgHead localMsgHead;
    long l6;
    long l2;
    long l7;
    Object localObject2;
    int m;
    int k;
    int j;
    long l1;
    label233:
    label284:
    Object localObject5;
    byte b1;
    MessageRecord localMessageRecord;
    byte b2;
    int i;
    for (;;)
    {
      MessageInfo localMessageInfo;
      try
      {
        l5 = System.currentTimeMillis();
        if ((paramPBDecodeContext == null) || (paramMsg == null) || (paramArrayList == null)) {
          break label3555;
        }
        localMsgHead = (msg_comm.MsgHead)msg_head.get();
        l6 = from_uin.get();
        to_uin.get();
        l2 = msg_seq.get();
        long l3 = msg_time.get();
        l7 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getLongAccountUin();
        String str = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
        if (d == 1026)
        {
          l2 = Utils.a(msg_seq.get());
          l3 = Utils.a(msg_time.get());
        }
        if (!content_head.has()) {
          break label3543;
        }
        localObject2 = (msg_comm.ContentHead)content_head.get();
        m = div_seq.get();
        k = pkg_num.get();
        j = pkg_index.get();
        localObject2 = MessageProtoCodec.a(jdField_a_of_type_ComTencentMobileqqAppMessageHandler, paramMsg, String.valueOf(l6), String.valueOf(l6));
        if (((Long)first).longValue() != 4294967295L)
        {
          l1 = ((Long)first).longValue();
          break label3557;
          localObject3 = new ArrayList();
          localMessageInfo = new MessageInfo();
          if (appshare_info.has())
          {
            MessageProtoCodec.a(jdField_a_of_type_ComTencentMobileqqAppMessageHandler, (List)localObject3, paramMsg, jdField_e_of_type_Long, l3, false);
            localObject2 = null;
            l1 = 0L;
            if ((((List)localObject3).size() == 0) && (k > 1))
            {
              if (QLog.isColorLevel()) {
                QLog.d("Q.msg.BaseMessageProcessorForTroopAndDisc", 2, "<---decodeSinglePbMsg_GroupDis, empty long msg fragment");
              }
              localObject5 = (MessageForText)MessageRecordFactory.a(64536);
              msgtype = 64536;
              msg = "";
              ((List)localObject3).add(localObject5);
            }
            b1 = 0;
            Iterator localIterator = ((List)localObject3).iterator();
            if (!localIterator.hasNext()) {
              break label2152;
            }
            localMessageRecord = (MessageRecord)localIterator.next();
            time = l3;
            msgseq = l3;
            shmsgseq = l2;
            msgUid = l1;
            selfuin = str;
            istroop = d;
            senderuin = String.valueOf(l6);
            frienduin = String.valueOf(jdField_e_of_type_Long);
            longMsgId = m;
            longMsgCount = k;
            longMsgIndex = j;
            if (jdField_e_of_type_Int == 127)
            {
              msg = "PTT_URL";
              msgtype = 63530;
              isread = true;
            }
            if (msgtype == 64501) {
              ((ChatMessage)localMessageRecord).parse();
            }
            b2 = b1;
            if (msg_flag.has())
            {
              if ((msg_flag.get() & 1L) == 1L)
              {
                b2 = 1;
                b.a(l2, uniseq);
                b1 = b2;
                if (QLog.isColorLevel())
                {
                  QLog.d("Q.msg.BaseMessageProcessorForTroopAndDisc", 2, "receive the TroopMsg from TroopSpecialAttention!");
                  b1 = b2;
                }
              }
              b2 = b1;
              if (a(localMessageRecord))
              {
                d.a(l2, uniseq);
                b2 = b1;
              }
            }
            if (b(localMessageRecord)) {
              h.a(l2, uniseq);
            }
            if (msgtype == 64487)
            {
              localObject3 = (MessageForReplyText)localMessageRecord;
              if ((jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().equals(mSourceMsgInfo.mSourceMsgSenderUin + ""))) {
                i.a(l2, uniseq);
              }
            }
            if (msgtype == 63492)
            {
              localObject3 = (MessageForTroopTopic)localMessageRecord;
              ((TroopTopicMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(97)).a(TroopTopicDetailInfo.copyFrom((MessageForTroopTopic)localObject3));
            }
            if ((msgtype == 63501) || (msgtype == 63498))
            {
              localObject3 = (MessageForDeliverGiftTips)localMessageRecord;
              if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null)
              {
                if (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().equals(receiverUin + "")) {
                  continue;
                }
                e.a(l2, uniseq);
              }
              localObject5 = (TroopGiftManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(112);
              if (localObject5 != null) {
                ((TroopGiftManager)localObject5).a((MessageForDeliverGiftTips)localObject3);
              }
            }
            if (NearbyFlowerUtil.a(localMessageRecord))
            {
              localObject3 = (NearbyFlowerManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(123);
              if (localObject3 != null)
              {
                localObject5 = new NearbyFlowerMessage(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (MessageForStructing)localMessageRecord);
                ((NearbyFlowerManager)localObject3).a((NearbyFlowerMessage)localObject5, false);
                if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a() != null)
                {
                  if (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().equals(rUin)) {
                    break label1418;
                  }
                  e.a(l2, uniseq);
                }
              }
            }
            if (msgtype == 62530) {
              g.a(l2, uniseq);
            }
            if (paramMessageInfo != null)
            {
              if (c.a != -1L) {
                c.b = uniseq;
              }
              if (a.a != -1L) {
                a.b = uniseq;
              }
              if ((l2 > jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(String.valueOf(jdField_e_of_type_Long), d)) && (localMessageInfo.a()))
              {
                paramMessageInfo.a(localMessageInfo);
                mMessageInfo = localMessageInfo;
              }
            }
            if (((d != 1) && (d != 1026) && (d != 3000)) || (localObject2 == null) || (TextUtils.equals(selfuin, senderuin))) {
              break label1656;
            }
            i = 0;
            localObject3 = ((List)localObject2).iterator();
            label1191:
            if (!((Iterator)localObject3).hasNext()) {
              break;
            }
            if (!nextanon_group_msg.has()) {
              break label3518;
            }
            i = 1;
            break label3572;
          }
        }
        else
        {
          l1 = ((Long)second).longValue();
          break label3557;
        }
        if (!msg_body.has()) {
          break label3527;
        }
        localObject2 = (im_msg_body.MsgBody)msg_body.get();
        if (!rich_text.has()) {
          break label3527;
        }
        localObject5 = (im_msg_body.RichText)rich_text.get();
        if (!attr.has()) {
          break label3521;
        }
        l1 = MessageUtils.a(attr.get()).random.get());
        label1321:
        localObject2 = elems.get();
        if (ptt.has())
        {
          MessageProtoCodec.a(jdField_a_of_type_ComTencentMobileqqAppMessageHandler, paramMsg, (List)localObject3);
          continue;
        }
        MessageProtoCodec.a(jdField_a_of_type_ComTencentMobileqqAppMessageHandler, (List)localObject3, paramMsg, false, false, localMessageInfo);
        continue;
        if (animationPackageId <= 0) {
          continue;
        }
        f.a(l2, uniseq);
        continue;
        if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().equals(sUin)) {
          continue;
        }
      }
      catch (Throwable paramMsg)
      {
        if (QLog.isColorLevel()) {
          QLog.e("Q.msg.BaseMessageProcessorForTroopAndDisc", 2, "decodeSinglePbMsg_GroupDis failure : ", paramMsg);
        }
        return null;
      }
      label1418:
      f.a(l2, uniseq);
    }
    Object localObject3 = ((List)localObject2).iterator();
    int n;
    while (((Iterator)localObject3).hasNext())
    {
      localObject5 = (im_msg_body.Elem)((Iterator)localObject3).next();
      if ((i == 0) && (extra_info.has()))
      {
        localObject5 = (im_msg_body.ExtraInfo)extra_info.get();
        if (uint32_msg_tail_id.has())
        {
          n = uint32_msg_tail_id.get();
          if (n > 0)
          {
            localObject5 = MessageRecordFactory.a(64534);
            if (localObject5 != null)
            {
              localObject6 = Integer.toString(n);
              localObject7 = new SafeMsg.SafeMoreInfo();
              strMsgTxt.set((String)localObject6);
              ((MessageRecord)localObject5).init(selfuin, frienduin, senderuin, (String)localObject6, time, 64534, istroop, msgseq);
              isread = true;
              shmsgseq = shmsgseq;
              msgData = ((SafeMsg.SafeMoreInfo)localObject7).toByteArray();
              paramArrayList.add(localObject5);
            }
          }
        }
      }
    }
    label1656:
    if (((d == 1) || (d == 1026)) && (localObject2 != null)) {
      localObject5 = ((List)localObject2).iterator();
    }
    label1937:
    do
    {
      int i1;
      if (((Iterator)localObject5).hasNext())
      {
        localObject3 = (im_msg_body.Elem)((Iterator)localObject5).next();
        if (!anon_group_msg.has()) {
          break label1937;
        }
        localObject3 = (im_msg_body.AnonymousGroupMsg)anon_group_msg.get();
        i = uint32_flags.get();
        localObject7 = str_anon_id.get().toByteArray();
        localObject6 = str_anon_nick.get().toByteArray();
        n = uint32_head_portrait.get();
        i1 = uint32_expire_time.get();
        localObject5 = "";
        localObject3 = localObject5;
        if (localObject7 == null) {}
      }
      try
      {
        localObject3 = new String((byte[])localObject7, "ISO-8859-1");
        if (localObject6 == null)
        {
          localObject5 = "";
          localMessageRecord.saveExtInfoToExtStr("anonymous", AnonymousChatHelper.a(i, (String)localObject3, (String)localObject5, n, i1));
          extLong |= 0x3;
          if (QLog.isColorLevel()) {
            QLog.d("anonymous_decode", 2, "anonymous_flags = " + i);
          }
          paramArrayList.add(localMessageRecord);
          b1 = b2;
        }
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException)
      {
        for (;;)
        {
          localUnsupportedEncodingException.printStackTrace();
          localObject4 = localObject5;
          continue;
          localObject5 = new String((byte[])localObject6);
        }
      }
      if (extra_info.has())
      {
        localObject6 = (im_msg_body.ExtraInfo)extra_info.get();
        localObject7 = bytes_sender_title.get().toStringUtf8();
        if (!TextUtils.isEmpty((CharSequence)localObject7)) {
          localMessageRecord.saveExtInfoToExtStr("uniqueTitle", (String)localObject7);
        }
        i = uint32_flags.get();
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.BaseMessageProcessorForTroopAndDisc.troop.special_msg", 2, "dwFlags:" + i);
        }
      }
    } while (!group_business_msg.has());
    Object localObject6 = TroopBusinessUtil.TroopBusinessMessage.a(group_business_msg);
    TroopBusinessUtil.a(localMessageRecord, (TroopBusinessUtil.TroopBusinessMessage)localObject6);
    Object localObject7 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
    if (frienduin == null) {}
    for (Object localObject4 = "";; localObject4 = frienduin)
    {
      ReportController.b((QQAppInterface)localObject7, "P_CliOper", "Grp_AIO", "", "five_m", "revice_msg", 0, 0, (String)localObject4, msgtype + "", c, "");
      break;
    }
    label2152:
    paramMessageInfo = paramArrayList.iterator();
    label2196:
    double d1;
    label2269:
    double d2;
    for (;;)
    {
      if (paramMessageInfo.hasNext())
      {
        localObject4 = (MessageRecord)paramMessageInfo.next();
        if ((localObject4 != null) && ((localObject4 instanceof MessageForBitApp)))
        {
          i = 1;
          if (i != 0) {
            ((BitAppManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(143)).a(paramArrayList);
          }
          if ((d == 1) || (d == 1026))
          {
            d1 = -100.0D;
            paramMessageInfo = (msg_comm.GroupInfo)group_info.get();
            if (paramMessageInfo != null)
            {
              l1 = group_code.get();
              d2 = d1;
              if (localObject2 != null)
              {
                paramPBDecodeContext = ((List)localObject2).iterator();
                d2 = d1;
                if (paramPBDecodeContext.hasNext())
                {
                  localObject2 = (im_msg_body.Elem)paramPBDecodeContext.next();
                  if (pub_group.has())
                  {
                    if (QLog.isColorLevel())
                    {
                      if (pub_group.get()).bytes_nickname.has())
                      {
                        paramPBDecodeContext = pub_group.get()).bytes_nickname.get().toStringUtf8();
                        label2368:
                        QLog.d("Q.msg.BaseMessageProcessorForTroopAndDisc", 2, "decodeSinglePbMsg_GroupDis,receive  pub_group,bytes_nickname = " + paramPBDecodeContext);
                      }
                    }
                    else
                    {
                      ((HotChatManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(59)).a(l1);
                      i = 1;
                    }
                  }
                  else
                  {
                    for (;;)
                    {
                      label2414:
                      localObject2 = String.valueOf(l1);
                      localObject4 = String.valueOf(l6);
                      paramPBDecodeContext = group_card.get().toByteArray();
                      j = group_level.get();
                      try
                      {
                        paramPBDecodeContext = new String(paramPBDecodeContext, "utf-8");
                        k = group_card_type.get();
                        if (i != 0)
                        {
                          boolean bool = ((HotChatManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(59)).b("" + l1);
                          if ((i == 0) && (!bool)) {
                            a((String)localObject2);
                          }
                        }
                        if (!paramBoolean) {
                          break label3081;
                        }
                        paramMessageInfo = (TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51);
                        switch (k)
                        {
                        case 1: 
                          label2576:
                          paramMessageInfo.a((String)localObject2, (String)localObject4, paramPBDecodeContext, j, null, null, 0, 1, 100, l2, b1, 0L, d1);
                          break label3578;
                          label2605:
                          if ((localObject4 == null) || (((String)localObject4).equals(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a()))) {
                            break label3615;
                          }
                          paramMessageInfo = (TroopBindPublicAccountMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(131);
                          if (paramMessageInfo.b((String)localObject2)) {
                            break label3615;
                          }
                          if (!paramMessageInfo.c((String)localObject2)) {
                            break label3326;
                          }
                          j = paramArrayList.size();
                          i = 0;
                          k = j - 1;
                          label2675:
                          if (k < 0) {
                            break label3326;
                          }
                          localObject4 = (MessageRecord)paramArrayList.get(k);
                          j = i;
                          if (msgtype != 62530) {
                            break label3608;
                          }
                          if ((!TextUtils.isEmpty(msg)) || (msgData != null)) {
                            break label3230;
                          }
                          break label3583;
                          if ((!elem_flags2.has()) || (!elem_flags2.get()).uint32_longtitude.has()) || (!elem_flags2.get()).uint32_latitude.has())) {
                            break label3483;
                          }
                          if (l7 == l6)
                          {
                            i = 0;
                          }
                          else
                          {
                            i = elem_flags2.get()).uint32_longtitude.get();
                            j = elem_flags2.get()).uint32_latitude.get();
                            if ((i != 1) || (j != 1)) {
                              break label3480;
                            }
                            d1 = -1001.0D;
                            label2848:
                            d2 = d1;
                            if (i != 0)
                            {
                              d2 = d1;
                              if (j != 0)
                              {
                                d2 = d1;
                                if (i != 1)
                                {
                                  d2 = d1;
                                  if (j != 1) {
                                    d2 = TroopMemberLbsHelper.a(j, i, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
                                  }
                                }
                              }
                            }
                            localObject2 = TroopMemberLbsHelper.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
                            if ((b == 0L) || (a == 0L)) {
                              TroopMemberLbsHelper.a(String.valueOf(l1), String.valueOf(l6), j, i, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
                            }
                            if (!QLog.isColorLevel()) {
                              break label3592;
                            }
                            QLog.d("Q.msg.BaseMessageProcessorForTroopAndDisc", 2, "decodeSinglePbMsg_GroupDis,receive  elem_flags2,fromUin = " + l6 + " longtitude = " + i + " latitude = " + j);
                          }
                          break;
                        }
                      }
                      catch (UnsupportedEncodingException paramPBDecodeContext)
                      {
                        for (;;)
                        {
                          paramPBDecodeContext.printStackTrace();
                          paramPBDecodeContext = null;
                        }
                        paramMessageInfo.a((String)localObject2, (String)localObject4, paramPBDecodeContext, j, null, null, 0, 1, 100, l2, b1, 0L, d1);
                        break label3578;
                      }
                    }
                    paramMessageInfo.a((String)localObject2, (String)localObject4, "", j, paramPBDecodeContext, null, 0, 1, 100, l2, b1, 0L, d1);
                    break label3578;
                    label3081:
                    paramMessageInfo = new TroopMemberInfo();
                    troopuin = ((String)localObject2);
                    memberuin = ((String)localObject4);
                    switch (k)
                    {
                    case 1: 
                      troopnick = paramPBDecodeContext;
                    case 2: 
                      for (;;)
                      {
                        label3128:
                        level = j;
                        sex = 1;
                        age = 0;
                        distance = 100;
                        msgseq = l2;
                        if (b1 != 1) {
                          break label3602;
                        }
                        paramBoolean = true;
                        label3176:
                        isTroopFollowed = paramBoolean;
                        distanceToSelf = d1;
                        distanceToSelfUpdateTimeStamp = System.currentTimeMillis();
                        paramPBDecodeContext = paramMessageInfo;
                        break;
                        troopnick = paramPBDecodeContext;
                        continue;
                        troopnick = "";
                        friendnick = paramPBDecodeContext;
                      }
                      label3230:
                      j = i;
                      if (i == 0)
                      {
                        paramMessageInfo.a((String)localObject2, uniseq);
                        j = 1;
                      }
                      if (QLog.isColorLevel()) {
                        QLog.d("TroopBindPublicAccountMgr.redDot", 2, "decodePBAccountMSg:" + (String)localObject2 + "," + uniseq + "," + shmsgseq);
                      }
                      paramMessageInfo.b((String)localObject2);
                      break label3608;
                      label3326:
                      if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b((String)localObject2) != 3) {
                        break label3615;
                      }
                      if (QLog.isColorLevel()) {
                        QLog.d(".troop.closeRcvMsgTmp", 2, "Shield troop recv msg:" + (String)localObject2);
                      }
                      ((TroopHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(20)).b((String)localObject2, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), 0);
                      break label3615;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    label3480:
    label3483:
    label3518:
    label3521:
    label3527:
    label3543:
    label3555:
    label3557:
    label3572:
    label3578:
    label3583:
    label3592:
    label3596:
    label3602:
    label3608:
    label3615:
    for (;;)
    {
      i = MessageProtoCodec.a(paramMsg);
      paramMsg = paramArrayList.iterator();
      while (paramMsg.hasNext())
      {
        paramArrayList = (MessageRecord)paramMsg.next();
        vipBubbleDiyTextId = i;
        Object localObject1;
        vipBubbleID = SVIPHandler.a((int)localObject1, i);
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(time);
      }
      MsgAutoMonitorUtil.a().g(System.currentTimeMillis() - l5);
      return paramPBDecodeContext;
      break label2848;
      break label3596;
      paramPBDecodeContext = null;
      break label2368;
      d1 = d2;
      i = 0;
      break label2414;
      l1 = 0L;
      break label2269;
      paramPBDecodeContext = null;
      continue;
      i = 0;
      break label2196;
      break label3572;
      l1 = 0L;
      break label1321;
      localObject2 = null;
      l1 = 0L;
      break label284;
      do
      {
        l4 = l1;
        break label233;
        j = 0;
        k = 0;
        m = 0;
        break;
        return null;
      } while (l1 != -1L);
      long l4 = 0L;
      break label233;
      break label1191;
      break label2576;
      paramPBDecodeContext = null;
      break label2605;
      for (;;)
      {
        k -= 1;
        break label2675;
        d1 = d2;
        break;
        break label3128;
        paramBoolean = false;
        break label3176;
        i = j;
      }
    }
  }
  
  protected String a(msg_comm.Msg paramMsg)
  {
    long l = msg_head.get()).msg_seq.get();
    return 64 + "key_seq_" + l;
  }
  
  public List a(msg_comm.Msg paramMsg, PBDecodeContext paramPBDecodeContext)
  {
    return null;
  }
  
  public void a(int paramInt, Object... paramVarArgs) {}
  
  protected void a(MessageRecord paramMessageRecord)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(paramMessageRecord))
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.BaseMessageProcessorForTroopAndDisc", 2, "handle push . notifySendMessageSuccessful" + paramMessageRecord.toString());
      }
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().d(frienduin, istroop, uniseq);
      a(6003, true, frienduin);
      jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(msgseq);
      if (MsgProxyUtils.m(msgtype))
      {
        paramMessageRecord = new MessageObserver.StatictisInfo();
        c = 1000;
        d = 0;
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(5006, true, new Object[] { paramMessageRecord });
      }
    }
  }
}
