package com.tencent.mobileqq.app.message;

import OnlinePushPack.DelMsgInfo;
import OnlinePushPack.MsgInfo;
import OnlinePushPack.SvcReqPushMsg;
import QQService.EVIPSPEC;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.os.Parcelable;
import android.text.TextUtils;
import com.tencent.device.devicemgr.SmartDeviceProxyMgr;
import com.tencent.mobileqq.activity.Conversation;
import com.tencent.mobileqq.activity.MainFragment;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.specialcare.QvipSpecialCareManager;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.BusinessHandler;
import com.tencent.mobileqq.app.FriendListHandler;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.HotChatHandler;
import com.tencent.mobileqq.app.HotChatHelper;
import com.tencent.mobileqq.app.HotChatManager;
import com.tencent.mobileqq.app.HotChatManager.HotChatStateWrapper;
import com.tencent.mobileqq.app.LBSHandler;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.MessageHandlerUtils;
import com.tencent.mobileqq.app.NearFieldTroopHandler;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.app.PublicAccountDataManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.QQGAudioMsgHandler;
import com.tencent.mobileqq.app.QQProfileItem;
import com.tencent.mobileqq.app.SVIPHandler;
import com.tencent.mobileqq.app.SignatureManager;
import com.tencent.mobileqq.app.TroopHandler;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.app.proxy.GroupActionResp;
import com.tencent.mobileqq.app.proxy.ProxyManager;
import com.tencent.mobileqq.app.proxy.RecentUserProxy;
import com.tencent.mobileqq.data.AppShareID;
import com.tencent.mobileqq.data.Card;
import com.tencent.mobileqq.data.ExtensionInfo;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.data.Groups;
import com.tencent.mobileqq.data.HotChatInfo;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.data.SpecialCareInfo;
import com.tencent.mobileqq.data.SystemMsg;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.equipmentlock.EquipmentLockImpl;
import com.tencent.mobileqq.filemanager.app.FileTransferHandler;
import com.tencent.mobileqq.hotchat.HCSeatInfo;
import com.tencent.mobileqq.hotchat.PttShowRoomMng;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.managers.PullActiveManager;
import com.tencent.mobileqq.managers.QQLSRecentManager;
import com.tencent.mobileqq.model.EmoticonManager;
import com.tencent.mobileqq.msf.core.NetConnInfoCenter;
import com.tencent.mobileqq.msf.sdk.SettingCloneUtil;
import com.tencent.mobileqq.nearby.NearbyProxy;
import com.tencent.mobileqq.nearby.NearbyUtils;
import com.tencent.mobileqq.pb.ByteStringMicro;
import com.tencent.mobileqq.pb.PBBoolField;
import com.tencent.mobileqq.pb.PBBytesField;
import com.tencent.mobileqq.pb.PBFixed32Field;
import com.tencent.mobileqq.pb.PBRepeatField;
import com.tencent.mobileqq.pb.PBRepeatMessageField;
import com.tencent.mobileqq.pb.PBStringField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import com.tencent.mobileqq.persistence.EntityTransaction;
import com.tencent.mobileqq.qcall.PstnHandler;
import com.tencent.mobileqq.qcall.PstnManager;
import com.tencent.mobileqq.service.config.ConfigUtil;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.service.message.MessageRecordFactory;
import com.tencent.mobileqq.service.message.MessageUtils;
import com.tencent.mobileqq.service.message.PBDecodeContext;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.stt.SttManager;
import com.tencent.mobileqq.subaccount.SubAccountControll;
import com.tencent.mobileqq.subaccount.datamanager.SubAccountManager;
import com.tencent.mobileqq.subaccount.logic.SubAccountBackProtocData;
import com.tencent.mobileqq.systemmsg.FriendSystemMsgController;
import com.tencent.mobileqq.systemmsg.GroupSystemMsgController;
import com.tencent.mobileqq.systemmsg.SystemMsgController;
import com.tencent.mobileqq.systemmsg.SystemMsgUtils;
import com.tencent.mobileqq.transfile.BuddyTransfileProcessor;
import com.tencent.mobileqq.troop.utils.TroopGagMgr;
import com.tencent.mobileqq.troop.utils.TroopTipsMsgMgr;
import com.tencent.mobileqq.util.BitmapManager;
import com.tencent.mobileqq.util.Utils;
import com.tencent.mobileqq.utils.AppShareIDUtil;
import com.tencent.mobileqq.utils.DBUtils;
import com.tencent.mobileqq.utils.HexUtil;
import com.tencent.mobileqq.utils.QQUtils;
import com.tencent.mobileqq.utils.StringUtil;
import com.tencent.mobileqq.utils.httputils.PkgTools;
import com.tencent.mobileqq.vas.ColorRingManager;
import com.tencent.msf.service.protocol.pb.SubMsgType0x51.MsgBody;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.Pair;
import friendlist.AddGroupResp;
import friendlist.DelGroupResp;
import friendlist.RenameGroupResp;
import java.nio.ByteBuffer;
import java.nio.IntBuffer;
import java.nio.LongBuffer;
import java.nio.ShortBuffer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import localpb.richMsg.SafeMsg.SafeMoreInfo;
import mqq.app.MobileQQ;
import mqq.os.MqqHandler;
import msf.msgcomm.msg_comm.Msg;
import msf.msgcomm.msg_comm.MsgType0x210;
import nkf;
import nkg;
import nkh;
import org.json.JSONObject;
import protocol.KQQConfig.GetResourceReqInfo;
import tencent.im.group.cmd0x2dc.GroupVisitorJoinMsg;
import tencent.im.group.cmd0x2dc.VisitorJoinInfo;
import tencent.im.oidb.cmd0xa88.oidb_0xa88.NoticeBody;
import tencent.im.s2c.msgtype0x210.submsgtype0x26.submsgtype0x26.AppTipNotify;
import tencent.im.s2c.msgtype0x210.submsgtype0x26.submsgtype0x26.MsgBody;
import tencent.im.s2c.msgtype0x210.submsgtype0x26.submsgtype0x26.MsgBody.SubCmd0x3UpdateDiscussAppInfo;
import tencent.im.s2c.msgtype0x210.submsgtype0x27.SubMsgType0x27.AddGroup;
import tencent.im.s2c.msgtype0x210.submsgtype0x27.SubMsgType0x27.AppointmentNotify;
import tencent.im.s2c.msgtype0x210.submsgtype0x27.SubMsgType0x27.DaRenNotify;
import tencent.im.s2c.msgtype0x210.submsgtype0x27.SubMsgType0x27.DelFriend;
import tencent.im.s2c.msgtype0x210.submsgtype0x27.SubMsgType0x27.DelGroup;
import tencent.im.s2c.msgtype0x210.submsgtype0x27.SubMsgType0x27.ForwardBody;
import tencent.im.s2c.msgtype0x210.submsgtype0x27.SubMsgType0x27.FriendGroup;
import tencent.im.s2c.msgtype0x210.submsgtype0x27.SubMsgType0x27.FriendRemark;
import tencent.im.s2c.msgtype0x210.submsgtype0x27.SubMsgType0x27.GroupMemberProfileInfo;
import tencent.im.s2c.msgtype0x210.submsgtype0x27.SubMsgType0x27.GroupProfileInfo;
import tencent.im.s2c.msgtype0x210.submsgtype0x27.SubMsgType0x27.GroupSort;
import tencent.im.s2c.msgtype0x210.submsgtype0x27.SubMsgType0x27.ModCustomFace;
import tencent.im.s2c.msgtype0x210.submsgtype0x27.SubMsgType0x27.ModFriendGroup;
import tencent.im.s2c.msgtype0x210.submsgtype0x27.SubMsgType0x27.ModFriendRemark;
import tencent.im.s2c.msgtype0x210.submsgtype0x27.SubMsgType0x27.ModGroupMemberProfile;
import tencent.im.s2c.msgtype0x210.submsgtype0x27.SubMsgType0x27.ModGroupName;
import tencent.im.s2c.msgtype0x210.submsgtype0x27.SubMsgType0x27.ModGroupProfile;
import tencent.im.s2c.msgtype0x210.submsgtype0x27.SubMsgType0x27.ModGroupSort;
import tencent.im.s2c.msgtype0x210.submsgtype0x27.SubMsgType0x27.ModLongNick;
import tencent.im.s2c.msgtype0x210.submsgtype0x27.SubMsgType0x27.ModProfile;
import tencent.im.s2c.msgtype0x210.submsgtype0x27.SubMsgType0x27.ModSnsGeneralInfo;
import tencent.im.s2c.msgtype0x210.submsgtype0x27.SubMsgType0x27.MsgBody;
import tencent.im.s2c.msgtype0x210.submsgtype0x27.SubMsgType0x27.NewComeinUserNotify;
import tencent.im.s2c.msgtype0x210.submsgtype0x27.SubMsgType0x27.ProfileInfo;
import tencent.im.s2c.msgtype0x210.submsgtype0x27.SubMsgType0x27.PushReportDev;
import tencent.im.s2c.msgtype0x210.submsgtype0x27.SubMsgType0x27.PushSearchDev;
import tencent.im.s2c.msgtype0x210.submsgtype0x27.SubMsgType0x27.QQPayPush;
import tencent.im.s2c.msgtype0x210.submsgtype0x27.SubMsgType0x27.SnsUpateBuffer;
import tencent.im.s2c.msgtype0x210.submsgtype0x27.SubMsgType0x27.SnsUpdateFlag;
import tencent.im.s2c.msgtype0x210.submsgtype0x27.SubMsgType0x27.SnsUpdateItem;
import tencent.im.s2c.msgtype0x210.submsgtype0x27.SubMsgType0x27.SnsUpdateOneFlag;
import tencent.im.s2c.msgtype0x210.submsgtype0x31.submsgtype0x31.MsgBody;
import tencent.im.s2c.msgtype0x210.submsgtype0x44.submsgtype0x44.ClearCountMsg;
import tencent.im.s2c.msgtype0x210.submsgtype0x44.submsgtype0x44.FriendSyncMsg;
import tencent.im.s2c.msgtype0x210.submsgtype0x44.submsgtype0x44.GroupSyncMsg;
import tencent.im.s2c.msgtype0x210.submsgtype0x44.submsgtype0x44.ModifySyncMsg;
import tencent.im.s2c.msgtype0x210.submsgtype0x44.submsgtype0x44.MsgBody;
import tencent.im.s2c.msgtype0x210.submsgtype0x83.SubMsgType0x83.MsgBody;
import tencent.im.s2c.msgtype0x210.submsgtype0x83.SubMsgType0x83.MsgParams;
import tencent.im.s2c.msgtype0x210.submsgtype0xa8.SubMsgType0xa8.MsgBody;

public class OnLinePushMessageProcessor
  extends BaseMessageProcessor
{
  public nkg a;
  
  public OnLinePushMessageProcessor(QQAppInterface paramQQAppInterface, MessageHandler paramMessageHandler)
  {
    super(paramQQAppInterface, paramMessageHandler);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Nkg = new nkg(this, null);
  }
  
  private MessageRecord a(MsgInfo paramMsgInfo, long paramLong)
  {
    paramMsgInfo = vMsg;
    PkgTools.a(paramMsgInfo, 0);
    int i = paramMsgInfo[4];
    PkgTools.a(paramMsgInfo, 5);
    PkgTools.a(paramMsgInfo, 9);
    PkgTools.a(paramMsgInfo, 13);
    i = paramMsgInfo[17];
    PkgTools.a(paramMsgInfo, 18);
    PkgTools.a(paramMsgInfo, 22);
    PkgTools.a(paramMsgInfo, 24);
    return null;
  }
  
  private void a(int paramInt)
  {
    ((SVIPHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(13)).a(paramInt);
  }
  
  private void a(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg, SvcReqPushMsg paramSvcReqPushMsg)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.BaseMessageProcessor", 2, "handleC2COnlinePushMsgResp");
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.bJ = wUserActive;
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.BaseMessageProcessor", 2, "OnlinePush.ReqPush,notify.wUserActive:" + wUserActive);
    }
    String str = (String)paramFromServiceMsg.getAttribute("_tag_LOGSTR");
    ArrayList localArrayList1 = new ArrayList();
    ArrayList localArrayList2 = vMsgInfos;
    ArrayList localArrayList3;
    long l3;
    int n;
    ArrayList localArrayList4;
    MsgInfo localMsgInfo;
    if ((localArrayList2 != null) && (localArrayList2.size() > 0))
    {
      localArrayList3 = new ArrayList();
      l3 = lUin;
      n = svrip;
      localArrayList4 = new ArrayList();
      Iterator localIterator = localArrayList2.iterator();
      if (localIterator.hasNext()) {
        localMsgInfo = (MsgInfo)localIterator.next();
      }
    }
    int j;
    label489:
    int i;
    boolean bool1;
    int k;
    for (;;)
    {
      byte[] arrayOfByte;
      long l2;
      long l1;
      long l4;
      try
      {
        new ArrayList();
        j = shMsgType;
        arrayOfByte = null;
        l2 = lFromUin;
        l1 = lFromUin;
        if (paramFromServiceMsg.getUin() != null) {
          continue;
        }
        paramToServiceMsg = Long.valueOf(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount());
        l4 = paramToServiceMsg.longValue();
        if (l4 == l2) {}
        paramToServiceMsg = new DelMsgInfo();
        ((FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50)).a(lFromUin);
        lFromUin = lFromUin;
        shMsgSeq = shMsgSeq;
        uMsgTime = uMsgTime;
        vMsgCookies = vMsgCookies;
        localArrayList3.add(paramToServiceMsg);
        if ((42 != j) && (83 != j) && (127 != j) && (QLog.isColorLevel())) {
          MessageHandlerUtils.a("Q.msg.BaseMessageProcessor", str, shMsgSeq, String.valueOf(l3), String.valueOf(lFromUin));
        }
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.BaseMessageProcessor", 2, "----------handleC2COnlinePushMsgResp  before analysis msgInfo.lFromUin: " + lFromUin + " msgInfo.shMsgType: " + shMsgType + " msgInfo.uRealMsgTime: " + uRealMsgTime + " msgInfo.shMsgSeq: " + shMsgSeq + ", msgInfo.lMsgUid" + lMsgUid);
        }
        if (!OnLinePushMsgTypeProcessorDispatcher.a().containsKey(Integer.valueOf(j))) {
          continue;
        }
        paramToServiceMsg = b(j, localMsgInfo, paramSvcReqPushMsg);
        if (paramToServiceMsg == null) {
          break label2349;
        }
        if (jdField_a_of_type_ComTencentMobileqqDataMessageRecord != null) {
          localArrayList1.add(jdField_a_of_type_ComTencentMobileqqDataMessageRecord);
        }
        if (jdField_a_of_type_Boolean) {
          break;
        }
      }
      catch (Exception paramToServiceMsg)
      {
        MessageRecord localMessageRecord;
        paramToServiceMsg.printStackTrace();
        if ((vMsg == null) || (!QLog.isColorLevel())) {
          continue;
        }
        QLog.w("Q.msg.BaseMessageProcessor", 2, "~~~~~handleC2COnlinePushMsgResp Exception msgInfo.vMsg: " + HexUtil.a(vMsg));
        continue;
      }
      if (paramToServiceMsg != null)
      {
        localMessageRecord = MessageRecordFactory.a(i);
        localMessageRecord.init(l3, l1, l2, paramToServiceMsg, uRealMsgTime, i, j, uMsgTime);
        shmsgseq = shMsgSeq;
        isread = bool1;
        msgUid = lMsgUid;
        msgData = arrayOfByte;
        if (k > 0) {
          extraflag = k;
        }
        if (!MessageHandlerUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localMessageRecord, true)) {
          localArrayList1.add(localMessageRecord);
        }
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.BaseMessageProcessor", 2, "----------handleC2COnlinePushMsgResp after analysis friendUin: " + l1 + " msgType: " + i + " friendType: " + j + " shMsgSeq: " + shMsgSeq + " msgContent: " + Utils.a(paramToServiceMsg));
        }
      }
      if (uAppShareID <= 0L) {
        break;
      }
      localArrayList4.add(AppShareIDUtil.a(uAppShareID));
      break;
      paramToServiceMsg = Long.valueOf(paramFromServiceMsg.getUin());
      continue;
      if (169 == j)
      {
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.BaseMessageProcessor", 2, "------->msgFilter-handleC2COnlinePushMsgResp receive msg size:" + localArrayList2.size());
        }
        if (MessageHandlerUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 0, String.valueOf(l1), String.valueOf(l2), uMsgTime, shMsgSeq)) {
          break;
        }
        localArrayList3.remove(paramToServiceMsg);
        paramToServiceMsg = new String(vMsg) + uMsgTime;
        if (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a(paramToServiceMsg))
        {
          paramToServiceMsg = new long[1];
          paramToServiceMsg[0] = lFromUin;
          if (QLog.isColorLevel()) {
            QLog.d("Q.msg.BaseMessageProcessor", 2, "---->handleC2COnlinePushMsgResp, new file msg, about to call handleOffLineFileResp");
          }
          a(String.valueOf(l1), l3, paramToServiceMsg, vMsg, uMsgTime, shMsgSeq, false);
          lFromUin = paramToServiceMsg[0];
          break;
        }
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.d("Q.msg.BaseMessageProcessor", 2, "rcv a repeated offline file push msg");
        break;
      }
      if (8 == j)
      {
        paramToServiceMsg = new byte[4];
        if (vMsg.length > 4) {
          PkgTools.a(paramToServiceMsg, 0, vMsg, 0, 4);
        }
        l2 = PkgTools.a(paramToServiceMsg, 0);
        if (vMsg.length >= 9)
        {
          paramToServiceMsg = new byte[vMsg.length - 9];
          PkgTools.a(paramToServiceMsg, 0, vMsg, 8, paramToServiceMsg.length);
          paramToServiceMsg = new String(MessageUtils.b(paramToServiceMsg), "utf-8");
          break label2371;
        }
      }
      else
      {
        if (132 == j)
        {
          paramToServiceMsg = new byte[4];
          if (vMsg.length > 4) {
            PkgTools.a(paramToServiceMsg, 0, vMsg, 0, 4);
          }
          l2 = PkgTools.a(paramToServiceMsg, 0);
          paramToServiceMsg = arrayOfByte;
          if (vMsg.length < 9) {
            break label2393;
          }
          paramToServiceMsg = new byte[vMsg.length - 9];
          PkgTools.a(paramToServiceMsg, 0, vMsg, 8, paramToServiceMsg.length);
          paramToServiceMsg = new String(MessageUtils.b(paramToServiceMsg), "utf-8");
          break label2393;
        }
        if (732 == j)
        {
          if (vMsg == null) {
            return;
          }
          paramToServiceMsg = new byte[vMsg.length];
          PkgTools.a(paramToServiceMsg, 0, vMsg, 0, paramToServiceMsg.length);
          i = paramToServiceMsg[4];
          if (!QLog.isColorLevel()) {
            break label2416;
          }
          QLog.d("Q.msg.BaseMessageProcessor", 2, "<---0x2dc push  groupCode:" + PkgTools.a(vMsg, 0) + " subType:" + i + "msgSeq:" + shMsgSeq);
          break label2416;
          label1294:
          if (vMsg.length <= 7) {
            break label2433;
          }
          paramToServiceMsg = (TroopTipsMsgMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(80);
          arrayOfByte = new byte[vMsg.length - 7];
          PkgTools.a(arrayOfByte, 0, vMsg, 7, arrayOfByte.length);
          paramToServiceMsg = paramToServiceMsg.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, arrayOfByte, shMsgSeq, uRealMsgTime, false, false);
          if (paramToServiceMsg == null) {
            break label2433;
          }
          localArrayList1.add(paramToServiceMsg);
          break label2433;
          label1385:
          if (!((TroopGagMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(47)).a(paramToServiceMsg, shMsgSeq)) {
            break label2433;
          }
          return;
          label1410:
          if (i == 15)
          {
            a(paramToServiceMsg, shMsgSeq);
            return;
          }
          if (i != 6) {
            break label2472;
          }
          d(paramToServiceMsg);
          break label2433;
        }
      }
      for (;;)
      {
        label1444:
        if (vMsg.length > 7)
        {
          paramToServiceMsg = new byte[vMsg.length - 7];
          PkgTools.a(paramToServiceMsg, 0, vMsg, 7, paramToServiceMsg.length);
          a(paramToServiceMsg, i);
        }
        label2339:
        label2349:
        label2371:
        label2393:
        label2416:
        label2433:
        label2472:
        do
        {
          if (i == 18)
          {
            l4 = PkgTools.a(vMsg, 0);
            i = vMsg.length;
            if (i <= 7) {
              break label2339;
            }
          }
          for (;;)
          {
            try
            {
              arrayOfByte = new byte[vMsg.length - 7];
              PkgTools.a(arrayOfByte, 0, vMsg, 7, arrayOfByte.length);
              paramToServiceMsg = new msg_comm.Msg();
            }
            catch (Exception localException3)
            {
              Object localObject1;
              int m;
              boolean bool2;
              boolean bool3;
              Object localObject2;
              paramToServiceMsg = null;
              continue;
              i = 1000;
              continue;
              i = -1;
              j = 64536;
              continue;
              paramToServiceMsg = null;
              i = 64536;
              Object localObject3 = null;
              bool1 = false;
              k = -1;
              j = 0;
            }
            try
            {
              paramToServiceMsg.mergeFrom(arrayOfByte);
              a(String.valueOf(l4), paramToServiceMsg);
            }
            catch (Exception localException2)
            {
              continue;
            }
            arrayOfByte.printStackTrace();
            continue;
            if (i != 19) {
              continue;
            }
            l4 = PkgTools.a(vMsg, 0);
            paramToServiceMsg = null;
            if (vMsg.length > 7) {
              paramToServiceMsg = new oidb_0xa88.NoticeBody();
            }
            try
            {
              arrayOfByte = new byte[vMsg.length - 7];
              PkgTools.a(arrayOfByte, 0, vMsg, 7, arrayOfByte.length);
              paramToServiceMsg.mergeFrom(arrayOfByte);
              a(String.valueOf(l4), paramToServiceMsg);
            }
            catch (Exception localException1)
            {
              localException1.printStackTrace();
              continue;
            }
            if (230 == j)
            {
              paramToServiceMsg = new String(MessageUtils.b(vMsg), "utf-8");
              localObject1 = ((FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50)).c(l1 + "");
              if ((localObject1 == null) || (!((Friends)localObject1).isFriend())) {
                continue;
              }
              i = 0;
              localObject1 = new SafeMsg.SafeMoreInfo();
              strFromMobile.set(strFromMobile);
              strFromName.set(strFromName);
              strMsgTxt.set(paramToServiceMsg);
              localObject1 = ((SafeMsg.SafeMoreInfo)localObject1).toByteArray();
              m = 64534;
              bool1 = true;
              k = -1;
              j = i;
              i = m;
              break label489;
            }
            if (SystemMsg.isSystemMessage(j))
            {
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a(2);
              i = 64530 - (j - 187);
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a(l3, lFromUin, j, i);
              FriendSystemMsgController.a().a(l2, uMsgTime, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
              l1 = 9998L;
              localObject1 = null;
              paramToServiceMsg = null;
              k = -1;
              bool1 = false;
              j = 0;
              break label489;
            }
            if (SystemMsg.isTroopSystemMessage(j))
            {
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a(3);
              if (j == 45)
              {
                paramToServiceMsg = a(localMsgInfo, l3);
                if ((paramToServiceMsg == null) || (MessageHandlerUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramToServiceMsg, true))) {
                  continue;
                }
                localArrayList1.add(paramToServiceMsg);
                continue;
                GroupSystemMsgController.a().a(l2, uMsgTime, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
                localObject1 = null;
                paramToServiceMsg = null;
                bool1 = false;
                k = i;
                m = 0;
                i = j;
                j = m;
                break label489;
              }
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a(l3, j, vMsg, lFromUin, uMsgTime, shMsgSeq);
              l1 = 9998L;
              i = 32769;
              j = SystemMsg.getTroopSystemMsgType(j);
              continue;
            }
            if (528 == j)
            {
              paramToServiceMsg = b(localMsgInfo, l4);
              if ((paramToServiceMsg == null) || (MessageHandlerUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramToServiceMsg, true))) {
                continue;
              }
              localArrayList1.add(paramToServiceMsg);
              continue;
            }
            if (!QLog.isColorLevel()) {
              break;
            }
            QLog.w("Q.msg.BaseMessageProcessor", 2, "~~~~~handleC2COnlinePushMsgResp msgtype: unknow msgType!!!");
            break;
            if (localArrayList4.size() > 0) {
              a(localArrayList4);
            }
            i = paramFromServiceMsg.getRequestSsoSeq();
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(l3, localArrayList3, n, i);
            if (localArrayList1.size() > 0)
            {
              bool2 = MessageHandlerUtils.a(localArrayList1);
              bool3 = MessageHandlerUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localArrayList1);
              i = MsgProxyUtils.a(localArrayList1, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
              paramToServiceMsg = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
              if ((bool2) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.isBackground_Stop))
              {
                bool1 = true;
                paramToServiceMsg.a(localArrayList1, String.valueOf(l3), bool1);
                jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a((int)uMsgTime);
                a("handleGetBuddyMessageResp", true, i, jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(bool2, bool3), false);
              }
            }
            else
            {
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(localArrayList1);
              return;
            }
            bool1 = false;
            continue;
            paramToServiceMsg = null;
          }
          paramToServiceMsg = null;
          break label2371;
          paramToServiceMsg = null;
          i = 64536;
          localObject2 = null;
          bool1 = false;
          k = -1;
          j = 0;
          break label489;
          j = 1000;
          i = 64536;
          k = -1;
          localObject2 = null;
          bool1 = false;
          break label489;
          i = 64536;
          k = -1;
          localObject2 = null;
          bool1 = false;
          j = 1020;
          break label489;
          return;
          if (i == 16) {
            break label1294;
          }
          if (i == 17)
          {
            break label1294;
            paramToServiceMsg = null;
            i = 64536;
            localObject2 = null;
            bool1 = false;
            k = -1;
            j = 0;
            break label489;
          }
          if (i == 12) {
            break label1385;
          }
          if (i != 14) {
            break label1410;
          }
          break label1385;
          if (i == 11) {
            break label1444;
          }
        } while (i != 13);
      }
    }
  }
  
  private void a(String paramString, long paramLong1, long[] paramArrayOfLong, byte[] paramArrayOfByte, long paramLong2, short paramShort, boolean paramBoolean)
  {
    paramLong1 = paramArrayOfLong[0];
    paramArrayOfByte = BuddyTransfileProcessor.a(paramArrayOfByte, paramArrayOfLong);
    if (paramArrayOfByte != null) {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramString, String.valueOf(paramArrayOfLong[0]), paramArrayOfByte, paramLong2, paramShort, paramLong1, paramBoolean);
    }
  }
  
  private void a(byte[] paramArrayOfByte, int paramInt)
  {
    Object localObject = new cmd0x2dc.GroupVisitorJoinMsg();
    try
    {
      cmd0x2dc.GroupVisitorJoinMsg localGroupVisitorJoinMsg = (cmd0x2dc.GroupVisitorJoinMsg)((cmd0x2dc.GroupVisitorJoinMsg)localObject).mergeFrom(paramArrayOfByte);
      long l = uint64_group_code.get();
      paramArrayOfByte = rpt_msg_visitor_join_info.get();
      int i;
      if ((paramArrayOfByte != null) && (paramArrayOfByte.size() > 0))
      {
        localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
        if (((HotChatManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(59)).b(String.valueOf(l)))
        {
          Iterator localIterator = paramArrayOfByte.iterator();
          paramArrayOfByte = "";
          while (localIterator.hasNext())
          {
            cmd0x2dc.VisitorJoinInfo localVisitorJoinInfo = (cmd0x2dc.VisitorJoinInfo)localIterator.next();
            String str = "" + uint64_visitor_uin.get();
            if (!str.equalsIgnoreCase((String)localObject))
            {
              if (bytes_visitor_name.get().toStringUtf8().equals("")) {}
              for (paramArrayOfByte = paramArrayOfByte + str + "、";; paramArrayOfByte = paramArrayOfByte + bytes_visitor_name.get().toStringUtf8() + "、") {
                break;
              }
            }
          }
          localObject = paramArrayOfByte;
          if (paramArrayOfByte.length() > 1) {
            localObject = paramArrayOfByte.substring(0, paramArrayOfByte.length() - 1);
          }
          if (!uint32_op_flag.has()) {
            break label397;
          }
          i = uint32_op_flag.get();
          if (QLog.isColorLevel()) {
            QLog.i("Q.msg.BaseMessageProcessor", 2, "handleEnterOpenTroopHotChatPushMsg. groupCode=" + l + ", name=" + (String)localObject + ", op_flag=" + i);
          }
          if (paramInt != 11) {
            break label402;
          }
          paramArrayOfByte = (String)localObject + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getString(2131371116);
        }
      }
      for (;;)
      {
        AddMessageHelper.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, String.valueOf(l), paramArrayOfByte, 1, false, true);
        return;
        label397:
        i = 0;
        break;
        label402:
        paramArrayOfByte = (byte[])localObject;
        if (paramInt == 13) {
          if (1 == i) {
            paramArrayOfByte = (String)localObject + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getString(2131371127);
          } else {
            paramArrayOfByte = (String)localObject + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getString(2131371117);
          }
        }
      }
      return;
    }
    catch (Exception paramArrayOfByte) {}
  }
  
  private boolean a(int paramInt)
  {
    switch (paramInt)
    {
    case 0: 
    case 2: 
    default: 
      return false;
    case 1: 
      return true;
    }
    return true;
  }
  
  private boolean a(byte[] paramArrayOfByte, int paramInt)
  {
    boolean bool = false;
    long l1 = PkgTools.a(paramArrayOfByte, 0);
    if (paramArrayOfByte[4] == 15)
    {
      long l2 = PkgTools.a(paramArrayOfByte, 5);
      long l3 = PkgTools.a(paramArrayOfByte, 9);
      int i = PkgTools.b(paramArrayOfByte, 13);
      paramArrayOfByte = PkgTools.a(paramArrayOfByte, 15, i);
      long l4 = NetConnInfoCenter.getServerTime();
      ((TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51)).a(paramInt, l1, l4, l3, l2, paramArrayOfByte);
      bool = true;
    }
    return bool;
  }
  
  /* Error */
  private MessageRecord b(MsgInfo paramMsgInfo, long paramLong)
  {
    // Byte code:
    //   0: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   3: ifeq +13 -> 16
    //   6: ldc_w 665
    //   9: iconst_2
    //   10: ldc_w 667
    //   13: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   16: aload_1
    //   17: getfield 31	OnlinePushPack/MsgInfo:vMsg	[B
    //   20: invokestatic 672	com/tencent/mobileqq/service/gamecenter/GameCenterPackeger:a	([B)LIMMsgBodyPack/MsgType0x210;
    //   23: astore 25
    //   25: aload 25
    //   27: ifnonnull +5 -> 32
    //   30: aconst_null
    //   31: areturn
    //   32: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   35: ifeq +34 -> 69
    //   38: ldc_w 665
    //   41: iconst_2
    //   42: new 80	java/lang/StringBuilder
    //   45: dup
    //   46: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   49: ldc_w 674
    //   52: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   55: aload 25
    //   57: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   60: invokevirtual 202	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   63: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   66: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   69: aload 25
    //   71: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   74: ldc2_w 680
    //   77: lcmp
    //   78: ifne +144 -> 222
    //   81: aload 25
    //   83: getfield 685	IMMsgBodyPack/MsgType0x210:stMsgInfo0x24	LIMMsgBodyPack/MsgType0x210SubMsgType0x24;
    //   86: ifnull +136 -> 222
    //   89: aload 25
    //   91: getfield 685	IMMsgBodyPack/MsgType0x210:stMsgInfo0x24	LIMMsgBodyPack/MsgType0x210SubMsgType0x24;
    //   94: astore_1
    //   95: aload_1
    //   96: ifnull +122 -> 218
    //   99: aload_1
    //   100: getfield 690	IMMsgBodyPack/MsgType0x210SubMsgType0x24:vPluginNumList	Ljava/util/ArrayList;
    //   103: ifnull +115 -> 218
    //   106: aload_1
    //   107: getfield 690	IMMsgBodyPack/MsgType0x210SubMsgType0x24:vPluginNumList	Ljava/util/ArrayList;
    //   110: astore 21
    //   112: aload 21
    //   114: ifnull +104 -> 218
    //   117: aload 21
    //   119: invokeinterface 565 1 0
    //   124: ifle +94 -> 218
    //   127: aload_0
    //   128: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   131: bipush 11
    //   133: invokevirtual 167	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   136: checkcast 692	com/tencent/mobileqq/servlet/GameCenterManagerImp
    //   139: astore_1
    //   140: aload_1
    //   141: ifnull +77 -> 218
    //   144: aload 21
    //   146: invokeinterface 572 1 0
    //   151: astore 21
    //   153: aload 21
    //   155: invokeinterface 133 1 0
    //   160: ifeq +58 -> 218
    //   163: aload 21
    //   165: invokeinterface 137 1 0
    //   170: checkcast 694	IMMsgBodyPack/PluginNum
    //   173: astore 22
    //   175: aload 22
    //   177: ifnull -24 -> 153
    //   180: aload 22
    //   182: getfield 697	IMMsgBodyPack/PluginNum:dwID	J
    //   185: lstore_2
    //   186: aload 22
    //   188: getfield 701	IMMsgBodyPack/PluginNum:cFlag	B
    //   191: ifne +21 -> 212
    //   194: iconst_0
    //   195: istore 15
    //   197: aload_1
    //   198: lload_2
    //   199: iload 15
    //   201: aload 22
    //   203: getfield 704	IMMsgBodyPack/PluginNum:dwNUm	J
    //   206: invokevirtual 707	com/tencent/mobileqq/servlet/GameCenterManagerImp:a	(JZJ)V
    //   209: goto -56 -> 153
    //   212: iconst_1
    //   213: istore 15
    //   215: goto -18 -> 197
    //   218: aconst_null
    //   219: astore_1
    //   220: aload_1
    //   221: areturn
    //   222: aload 25
    //   224: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   227: ifnull +9428 -> 9655
    //   230: aload 25
    //   232: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   235: ldc2_w 711
    //   238: lcmp
    //   239: ifne +33 -> 272
    //   242: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   245: ifeq +13 -> 258
    //   248: ldc_w 665
    //   251: iconst_2
    //   252: ldc_w 714
    //   255: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   258: aload_0
    //   259: aload 25
    //   261: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   264: invokevirtual 716	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:a	([B)V
    //   267: aconst_null
    //   268: astore_1
    //   269: goto -49 -> 220
    //   272: aload 25
    //   274: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   277: ldc2_w 717
    //   280: lcmp
    //   281: ifeq +27 -> 308
    //   284: aload 25
    //   286: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   289: ldc2_w 719
    //   292: lcmp
    //   293: ifeq +15 -> 308
    //   296: aload 25
    //   298: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   301: ldc2_w 721
    //   304: lcmp
    //   305: ifne +49 -> 354
    //   308: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   311: ifeq +13 -> 324
    //   314: ldc_w 724
    //   317: iconst_2
    //   318: ldc_w 726
    //   321: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   324: aload_0
    //   325: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   328: bipush 11
    //   330: invokevirtual 48	com/tencent/mobileqq/app/QQAppInterface:a	(I)Lcom/tencent/mobileqq/app/BusinessHandler;
    //   333: checkcast 728	com/tencent/mobileqq/app/PublicAccountHandler
    //   336: aload 25
    //   338: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   341: aload 25
    //   343: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   346: invokevirtual 731	com/tencent/mobileqq/app/PublicAccountHandler:a	(J[B)V
    //   349: aconst_null
    //   350: astore_1
    //   351: goto -131 -> 220
    //   354: aload 25
    //   356: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   359: ldc2_w 732
    //   362: lcmp
    //   363: ifne +44 -> 407
    //   366: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   369: ifeq +13 -> 382
    //   372: ldc_w 735
    //   375: iconst_2
    //   376: ldc_w 737
    //   379: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   382: aload_0
    //   383: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   386: bipush 18
    //   388: invokevirtual 48	com/tencent/mobileqq/app/QQAppInterface:a	(I)Lcom/tencent/mobileqq/app/BusinessHandler;
    //   391: checkcast 739	com/tencent/mobileqq/app/ShieldListHandler
    //   394: aload 25
    //   396: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   399: invokevirtual 740	com/tencent/mobileqq/app/ShieldListHandler:a	([B)V
    //   402: aconst_null
    //   403: astore_1
    //   404: goto -184 -> 220
    //   407: aload 25
    //   409: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   412: ldc2_w 741
    //   415: lcmp
    //   416: ifne +18 -> 434
    //   419: aload_0
    //   420: lload_2
    //   421: aload 25
    //   423: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   426: invokespecial 744	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:b	(J[B)V
    //   429: aconst_null
    //   430: astore_1
    //   431: goto -211 -> 220
    //   434: aload 25
    //   436: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   439: ldc2_w 745
    //   442: lcmp
    //   443: ifne +89 -> 532
    //   446: new 748	tencent/im/s2c/msgtype0x210/submsgtype0x35/Submsgtype0x35$MsgBody
    //   449: dup
    //   450: invokespecial 749	tencent/im/s2c/msgtype0x210/submsgtype0x35/Submsgtype0x35$MsgBody:<init>	()V
    //   453: aload 25
    //   455: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   458: invokevirtual 750	tencent/im/s2c/msgtype0x210/submsgtype0x35/Submsgtype0x35$MsgBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   461: checkcast 748	tencent/im/s2c/msgtype0x210/submsgtype0x35/Submsgtype0x35$MsgBody
    //   464: getfield 753	tencent/im/s2c/msgtype0x210/submsgtype0x35/Submsgtype0x35$MsgBody:uint32_bubble_timestamp	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   467: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   470: istore 4
    //   472: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   475: ifeq +30 -> 505
    //   478: ldc 63
    //   480: iconst_2
    //   481: new 80	java/lang/StringBuilder
    //   484: dup
    //   485: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   488: ldc_w 755
    //   491: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   494: iload 4
    //   496: invokevirtual 92	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   499: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   502: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   505: aconst_null
    //   506: astore_1
    //   507: goto -287 -> 220
    //   510: astore_1
    //   511: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   514: ifeq +13 -> 527
    //   517: ldc 63
    //   519: iconst_2
    //   520: ldc_w 757
    //   523: aload_1
    //   524: invokestatic 761	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   527: aconst_null
    //   528: astore_1
    //   529: goto -309 -> 220
    //   532: aload 25
    //   534: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   537: ldc2_w 762
    //   540: lcmp
    //   541: ifne +623 -> 1164
    //   544: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   547: ifeq +13 -> 560
    //   550: ldc_w 765
    //   553: iconst_2
    //   554: ldc_w 767
    //   557: invokestatic 626	com/tencent/qphone/base/util/QLog:i	(Ljava/lang/String;ILjava/lang/String;)V
    //   560: new 769	tencent/im/s2c/msgtype0x210/submsgtype0x3b/Submsgtype0x3b$MsgBody
    //   563: dup
    //   564: invokespecial 770	tencent/im/s2c/msgtype0x210/submsgtype0x3b/Submsgtype0x3b$MsgBody:<init>	()V
    //   567: astore 21
    //   569: aload 21
    //   571: aload 25
    //   573: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   576: invokevirtual 771	tencent/im/s2c/msgtype0x210/submsgtype0x3b/Submsgtype0x3b$MsgBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   579: pop
    //   580: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   583: ifeq +111 -> 694
    //   586: new 80	java/lang/StringBuilder
    //   589: dup
    //   590: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   593: ldc_w 773
    //   596: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   599: astore 22
    //   601: aload 21
    //   603: getfield 774	tencent/im/s2c/msgtype0x210/submsgtype0x3b/Submsgtype0x3b$MsgBody:uint64_group_code	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   606: invokevirtual 775	com/tencent/mobileqq/pb/PBUInt64Field:has	()Z
    //   609: ifeq +9115 -> 9724
    //   612: aload 21
    //   614: getfield 774	tencent/im/s2c/msgtype0x210/submsgtype0x3b/Submsgtype0x3b$MsgBody:uint64_group_code	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   617: invokevirtual 553	com/tencent/mobileqq/pb/PBUInt64Field:get	()J
    //   620: invokestatic 192	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   623: astore_1
    //   624: aload 22
    //   626: aload_1
    //   627: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   630: ldc_w 777
    //   633: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   636: astore 22
    //   638: aload 21
    //   640: getfield 780	tencent/im/s2c/msgtype0x210/submsgtype0x3b/Submsgtype0x3b$MsgBody:uint32_user_show_flag	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   643: invokevirtual 615	com/tencent/mobileqq/pb/PBUInt32Field:has	()Z
    //   646: ifeq +436 -> 1082
    //   649: aload 21
    //   651: getfield 780	tencent/im/s2c/msgtype0x210/submsgtype0x3b/Submsgtype0x3b$MsgBody:uint32_user_show_flag	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   654: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   657: invokestatic 782	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   660: astore_1
    //   661: ldc_w 765
    //   664: iconst_2
    //   665: aload 22
    //   667: aload_1
    //   668: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   671: ldc_w 784
    //   674: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   677: aload 21
    //   679: getfield 787	tencent/im/s2c/msgtype0x210/submsgtype0x3b/Submsgtype0x3b$MsgBody:uint32_member_level_changed	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   682: invokevirtual 615	com/tencent/mobileqq/pb/PBUInt32Field:has	()Z
    //   685: invokevirtual 790	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   688: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   691: invokestatic 792	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   694: aload 21
    //   696: getfield 774	tencent/im/s2c/msgtype0x210/submsgtype0x3b/Submsgtype0x3b$MsgBody:uint64_group_code	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   699: invokevirtual 775	com/tencent/mobileqq/pb/PBUInt64Field:has	()Z
    //   702: ifeq +9017 -> 9719
    //   705: aload 21
    //   707: getfield 780	tencent/im/s2c/msgtype0x210/submsgtype0x3b/Submsgtype0x3b$MsgBody:uint32_user_show_flag	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   710: invokevirtual 615	com/tencent/mobileqq/pb/PBUInt32Field:has	()Z
    //   713: ifeq +87 -> 800
    //   716: aload 21
    //   718: getfield 780	tencent/im/s2c/msgtype0x210/submsgtype0x3b/Submsgtype0x3b$MsgBody:uint32_user_show_flag	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   721: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   724: istore 4
    //   726: aload 21
    //   728: getfield 774	tencent/im/s2c/msgtype0x210/submsgtype0x3b/Submsgtype0x3b$MsgBody:uint64_group_code	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   731: invokevirtual 553	com/tencent/mobileqq/pb/PBUInt64Field:get	()J
    //   734: invokestatic 192	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   737: astore_1
    //   738: aload_0
    //   739: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   742: bipush 51
    //   744: invokevirtual 167	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   747: checkcast 656	com/tencent/mobileqq/app/TroopManager
    //   750: astore 22
    //   752: aload 22
    //   754: aload_1
    //   755: invokevirtual 795	com/tencent/mobileqq/app/TroopManager:a	(Ljava/lang/String;)Lcom/tencent/mobileqq/data/TroopInfo;
    //   758: astore 23
    //   760: aload 23
    //   762: iload 4
    //   764: i2b
    //   765: putfield 800	com/tencent/mobileqq/data/TroopInfo:cGroupRankUserFlag	B
    //   768: aload 22
    //   770: aload 23
    //   772: invokevirtual 803	com/tencent/mobileqq/app/TroopManager:b	(Lcom/tencent/mobileqq/data/TroopInfo;)V
    //   775: iconst_1
    //   776: aload 23
    //   778: getfield 800	com/tencent/mobileqq/data/TroopInfo:cGroupRankUserFlag	B
    //   781: if_icmpne +19 -> 800
    //   784: aload_0
    //   785: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   788: bipush 20
    //   790: invokevirtual 48	com/tencent/mobileqq/app/QQAppInterface:a	(I)Lcom/tencent/mobileqq/app/BusinessHandler;
    //   793: checkcast 805	com/tencent/mobileqq/app/TroopHandler
    //   796: aload_1
    //   797: invokevirtual 808	com/tencent/mobileqq/app/TroopHandler:f	(Ljava/lang/String;)V
    //   800: aload 21
    //   802: getfield 787	tencent/im/s2c/msgtype0x210/submsgtype0x3b/Submsgtype0x3b$MsgBody:uint32_member_level_changed	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   805: invokevirtual 615	com/tencent/mobileqq/pb/PBUInt32Field:has	()Z
    //   808: ifeq +31 -> 839
    //   811: aload 21
    //   813: getfield 774	tencent/im/s2c/msgtype0x210/submsgtype0x3b/Submsgtype0x3b$MsgBody:uint64_group_code	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   816: invokevirtual 553	com/tencent/mobileqq/pb/PBUInt64Field:get	()J
    //   819: lstore_2
    //   820: aload_0
    //   821: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   824: bipush 20
    //   826: invokevirtual 48	com/tencent/mobileqq/app/QQAppInterface:a	(I)Lcom/tencent/mobileqq/app/BusinessHandler;
    //   829: checkcast 805	com/tencent/mobileqq/app/TroopHandler
    //   832: lload_2
    //   833: invokestatic 192	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   836: invokevirtual 808	com/tencent/mobileqq/app/TroopHandler:f	(Ljava/lang/String;)V
    //   839: aload 21
    //   841: getfield 811	tencent/im/s2c/msgtype0x210/submsgtype0x3b/Submsgtype0x3b$MsgBody:uint32_officemode	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   844: invokevirtual 615	com/tencent/mobileqq/pb/PBUInt32Field:has	()Z
    //   847: ifeq +8872 -> 9719
    //   850: aload 21
    //   852: getfield 774	tencent/im/s2c/msgtype0x210/submsgtype0x3b/Submsgtype0x3b$MsgBody:uint64_group_code	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   855: invokevirtual 553	com/tencent/mobileqq/pb/PBUInt64Field:get	()J
    //   858: invokestatic 192	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   861: astore 23
    //   863: aload_0
    //   864: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   867: bipush 51
    //   869: invokevirtual 167	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   872: checkcast 656	com/tencent/mobileqq/app/TroopManager
    //   875: astore 24
    //   877: aload 24
    //   879: invokevirtual 814	com/tencent/mobileqq/app/TroopManager:a	()Lcom/tencent/mobileqq/persistence/EntityTransaction;
    //   882: astore 22
    //   884: aload 22
    //   886: invokevirtual 818	com/tencent/mobileqq/persistence/EntityTransaction:a	()V
    //   889: aload 24
    //   891: aload 23
    //   893: invokevirtual 795	com/tencent/mobileqq/app/TroopManager:a	(Ljava/lang/String;)Lcom/tencent/mobileqq/data/TroopInfo;
    //   896: astore_1
    //   897: aload_1
    //   898: ifnonnull +8818 -> 9716
    //   901: new 797	com/tencent/mobileqq/data/TroopInfo
    //   904: dup
    //   905: invokespecial 819	com/tencent/mobileqq/data/TroopInfo:<init>	()V
    //   908: astore_1
    //   909: aload_1
    //   910: aload 23
    //   912: putfield 822	com/tencent/mobileqq/data/TroopInfo:troopuin	Ljava/lang/String;
    //   915: aload_1
    //   916: ifnull +153 -> 1069
    //   919: aload 21
    //   921: getfield 811	tencent/im/s2c/msgtype0x210/submsgtype0x3b/Submsgtype0x3b$MsgBody:uint32_officemode	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   924: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   927: iconst_1
    //   928: if_icmpne +122 -> 1050
    //   931: aload_1
    //   932: getfield 825	com/tencent/mobileqq/data/TroopInfo:dwGroupClassExt	J
    //   935: invokestatic 827	java/lang/Long:toString	(J)Ljava/lang/String;
    //   938: invokestatic 830	com/tencent/mobileqq/troop/utils/TroopUtils:a	(Ljava/lang/String;)Z
    //   941: ifeq +109 -> 1050
    //   944: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   947: ifeq +13 -> 960
    //   950: ldc_w 832
    //   953: iconst_2
    //   954: ldc_w 834
    //   957: invokestatic 626	com/tencent/qphone/base/util/QLog:i	(Ljava/lang/String;ILjava/lang/String;)V
    //   960: sipush 63508
    //   963: invokestatic 247	com/tencent/mobileqq/service/message/MessageRecordFactory:a	(I)Lcom/tencent/mobileqq/data/MessageRecord;
    //   966: checkcast 836	com/tencent/mobileqq/data/MessageForGrayTips
    //   969: astore 25
    //   971: aload 25
    //   973: aload_0
    //   974: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   977: invokevirtual 567	com/tencent/mobileqq/app/QQAppInterface:a	()Ljava/lang/String;
    //   980: aload 23
    //   982: aload 23
    //   984: aload_0
    //   985: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   988: invokevirtual 630	com/tencent/mobileqq/app/QQAppInterface:getApplication	()Lmqq/app/MobileQQ;
    //   991: ldc_w 837
    //   994: invokevirtual 637	mqq/app/MobileQQ:getString	(I)Ljava/lang/String;
    //   997: invokestatic 654	com/tencent/mobileqq/msf/core/NetConnInfoCenter:getServerTime	()J
    //   1000: sipush 63508
    //   1003: iconst_1
    //   1004: aload_0
    //   1005: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1008: invokevirtual 499	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/app/message/QQMessageFacade;
    //   1011: aload 23
    //   1013: iconst_1
    //   1014: invokevirtual 840	com/tencent/mobileqq/app/message/QQMessageFacade:a	(Ljava/lang/String;I)Lcom/tencent/mobileqq/app/message/QQMessageFacade$Message;
    //   1017: getfield 843	com/tencent/mobileqq/app/message/QQMessageFacade$Message:shmsgseq	J
    //   1020: lconst_1
    //   1021: ladd
    //   1022: invokevirtual 846	com/tencent/mobileqq/data/MessageForGrayTips:init	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JIIJ)V
    //   1025: aload 25
    //   1027: iconst_1
    //   1028: putfield 847	com/tencent/mobileqq/data/MessageForGrayTips:isread	Z
    //   1031: aload_0
    //   1032: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1035: invokevirtual 499	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/app/message/QQMessageFacade;
    //   1038: aload 25
    //   1040: aload_0
    //   1041: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1044: invokevirtual 567	com/tencent/mobileqq/app/QQAppInterface:a	()Ljava/lang/String;
    //   1047: invokevirtual 850	com/tencent/mobileqq/app/message/QQMessageFacade:a	(Lcom/tencent/mobileqq/data/MessageRecord;Ljava/lang/String;)V
    //   1050: aload_1
    //   1051: aload 21
    //   1053: getfield 811	tencent/im/s2c/msgtype0x210/submsgtype0x3b/Submsgtype0x3b$MsgBody:uint32_officemode	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   1056: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   1059: i2l
    //   1060: putfield 853	com/tencent/mobileqq/data/TroopInfo:dwOfficeMode	J
    //   1063: aload 24
    //   1065: aload_1
    //   1066: invokevirtual 803	com/tencent/mobileqq/app/TroopManager:b	(Lcom/tencent/mobileqq/data/TroopInfo;)V
    //   1069: aload 22
    //   1071: invokevirtual 855	com/tencent/mobileqq/persistence/EntityTransaction:c	()V
    //   1074: aload 22
    //   1076: invokevirtual 857	com/tencent/mobileqq/persistence/EntityTransaction:b	()V
    //   1079: goto +8640 -> 9719
    //   1082: ldc_w 391
    //   1085: astore_1
    //   1086: goto -425 -> 661
    //   1089: astore_1
    //   1090: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1093: ifeq +33 -> 1126
    //   1096: ldc_w 832
    //   1099: iconst_2
    //   1100: new 80	java/lang/StringBuilder
    //   1103: dup
    //   1104: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   1107: ldc_w 859
    //   1110: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1113: aload_1
    //   1114: invokevirtual 860	java/lang/Exception:toString	()Ljava/lang/String;
    //   1117: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1120: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1123: invokestatic 626	com/tencent/qphone/base/util/QLog:i	(Ljava/lang/String;ILjava/lang/String;)V
    //   1126: aload 22
    //   1128: invokevirtual 857	com/tencent/mobileqq/persistence/EntityTransaction:b	()V
    //   1131: goto +8588 -> 9719
    //   1134: astore_1
    //   1135: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1138: ifeq +13 -> 1151
    //   1141: ldc_w 765
    //   1144: iconst_2
    //   1145: ldc_w 862
    //   1148: invokestatic 792	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   1151: aconst_null
    //   1152: astore_1
    //   1153: goto -933 -> 220
    //   1156: astore_1
    //   1157: aload 22
    //   1159: invokevirtual 857	com/tencent/mobileqq/persistence/EntityTransaction:b	()V
    //   1162: aload_1
    //   1163: athrow
    //   1164: aload 25
    //   1166: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   1169: ldc2_w 863
    //   1172: lcmp
    //   1173: ifne +28 -> 1201
    //   1176: aload_0
    //   1177: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1180: bipush 16
    //   1182: invokevirtual 167	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   1185: checkcast 866	com/tencent/mobileqq/stt/SttManager
    //   1188: aload 25
    //   1190: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   1193: invokevirtual 867	com/tencent/mobileqq/stt/SttManager:a	([B)V
    //   1196: aconst_null
    //   1197: astore_1
    //   1198: goto -978 -> 220
    //   1201: aload 25
    //   1203: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   1206: ldc2_w 868
    //   1209: lcmp
    //   1210: ifne +20 -> 1230
    //   1213: aload_0
    //   1214: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1217: aload 25
    //   1219: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   1222: invokestatic 874	com/tencent/mobileqq/app/ConfigHandler:a	(Lcom/tencent/mobileqq/app/QQAppInterface;[B)V
    //   1225: aconst_null
    //   1226: astore_1
    //   1227: goto -1007 -> 220
    //   1230: aload 25
    //   1232: ifnull +38 -> 1270
    //   1235: aload 25
    //   1237: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   1240: ldc2_w 875
    //   1243: lcmp
    //   1244: ifne +26 -> 1270
    //   1247: aload 25
    //   1249: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   1252: ifnull +18 -> 1270
    //   1255: aload_0
    //   1256: lload_2
    //   1257: aload 25
    //   1259: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   1262: invokevirtual 877	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:a	(J[B)V
    //   1265: aconst_null
    //   1266: astore_1
    //   1267: goto -1047 -> 220
    //   1270: aload 25
    //   1272: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   1275: ldc2_w 878
    //   1278: lcmp
    //   1279: ifne +25 -> 1304
    //   1282: aload 25
    //   1284: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   1287: ifnull +17 -> 1304
    //   1290: aload_0
    //   1291: aload 25
    //   1293: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   1296: invokevirtual 881	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:b	([B)V
    //   1299: aconst_null
    //   1300: astore_1
    //   1301: goto -1081 -> 220
    //   1304: aload 25
    //   1306: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   1309: ldc2_w 882
    //   1312: lcmp
    //   1313: ifne +17 -> 1330
    //   1316: aload_0
    //   1317: aload 25
    //   1319: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   1322: invokevirtual 885	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:c	([B)V
    //   1325: aconst_null
    //   1326: astore_1
    //   1327: goto -1107 -> 220
    //   1330: aload 25
    //   1332: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   1335: ldc2_w 886
    //   1338: lcmp
    //   1339: ifne +79 -> 1418
    //   1342: aload 25
    //   1344: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   1347: ifnull +71 -> 1418
    //   1350: new 889	tencent/im/s2c/msgtype0x210/submsgtype0x93/submsgtype0x93$MsgBody
    //   1353: dup
    //   1354: invokespecial 890	tencent/im/s2c/msgtype0x210/submsgtype0x93/submsgtype0x93$MsgBody:<init>	()V
    //   1357: astore_1
    //   1358: aload_1
    //   1359: aload 25
    //   1361: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   1364: invokevirtual 891	tencent/im/s2c/msgtype0x210/submsgtype0x93/submsgtype0x93$MsgBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   1367: pop
    //   1368: aload_0
    //   1369: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1372: bipush 75
    //   1374: invokevirtual 48	com/tencent/mobileqq/app/QQAppInterface:a	(I)Lcom/tencent/mobileqq/app/BusinessHandler;
    //   1377: checkcast 893	com/tencent/mobileqq/app/utils/DingdongPluginBizHandler
    //   1380: astore 21
    //   1382: aload 21
    //   1384: ifnull +9 -> 1393
    //   1387: aload 21
    //   1389: aload_1
    //   1390: invokevirtual 896	com/tencent/mobileqq/app/utils/DingdongPluginBizHandler:a	(Ltencent/im/s2c/msgtype0x210/submsgtype0x93/submsgtype0x93$MsgBody;)V
    //   1393: aconst_null
    //   1394: astore_1
    //   1395: goto -1175 -> 220
    //   1398: astore_1
    //   1399: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1402: ifeq -9 -> 1393
    //   1405: ldc 63
    //   1407: iconst_2
    //   1408: ldc_w 898
    //   1411: aload_1
    //   1412: invokestatic 761	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   1415: goto -22 -> 1393
    //   1418: aload 25
    //   1420: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   1423: ldc2_w 899
    //   1426: lcmp
    //   1427: ifne +67 -> 1494
    //   1430: aload 25
    //   1432: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   1435: ifnull +59 -> 1494
    //   1438: new 902	tencent/im/s2c/msgtype0x210/submsgtype0x8f/submsgtype0x8f$MsgBody
    //   1441: dup
    //   1442: invokespecial 903	tencent/im/s2c/msgtype0x210/submsgtype0x8f/submsgtype0x8f$MsgBody:<init>	()V
    //   1445: astore_1
    //   1446: aload_1
    //   1447: aload 25
    //   1449: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   1452: invokevirtual 904	tencent/im/s2c/msgtype0x210/submsgtype0x8f/submsgtype0x8f$MsgBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   1455: pop
    //   1456: aload_0
    //   1457: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1460: bipush 75
    //   1462: invokevirtual 48	com/tencent/mobileqq/app/QQAppInterface:a	(I)Lcom/tencent/mobileqq/app/BusinessHandler;
    //   1465: checkcast 893	com/tencent/mobileqq/app/utils/DingdongPluginBizHandler
    //   1468: astore 21
    //   1470: aload 21
    //   1472: ifnull +9 -> 1481
    //   1475: aload 21
    //   1477: aload_1
    //   1478: invokevirtual 907	com/tencent/mobileqq/app/utils/DingdongPluginBizHandler:a	(Ltencent/im/s2c/msgtype0x210/submsgtype0x8f/submsgtype0x8f$MsgBody;)V
    //   1481: aconst_null
    //   1482: astore_1
    //   1483: goto -1263 -> 220
    //   1486: astore_1
    //   1487: aload_1
    //   1488: invokevirtual 908	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException:printStackTrace	()V
    //   1491: goto -10 -> 1481
    //   1494: aload 25
    //   1496: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   1499: ldc2_w 909
    //   1502: lcmp
    //   1503: ifne +316 -> 1819
    //   1506: aload 25
    //   1508: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   1511: ifnull +308 -> 1819
    //   1514: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1517: ifeq +13 -> 1530
    //   1520: ldc_w 912
    //   1523: iconst_2
    //   1524: ldc_w 914
    //   1527: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   1530: new 916	tencent/im/s2c/msgtype0x210/submsgtype0x48/RecommendDeviceLock
    //   1533: dup
    //   1534: invokespecial 917	tencent/im/s2c/msgtype0x210/submsgtype0x48/RecommendDeviceLock:<init>	()V
    //   1537: astore_1
    //   1538: aload_1
    //   1539: aload 25
    //   1541: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   1544: invokevirtual 918	tencent/im/s2c/msgtype0x210/submsgtype0x48/RecommendDeviceLock:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   1547: pop
    //   1548: new 920	android/content/Intent
    //   1551: dup
    //   1552: invokespecial 921	android/content/Intent:<init>	()V
    //   1555: astore 21
    //   1557: aload 21
    //   1559: ldc_w 923
    //   1562: aload_1
    //   1563: getfield 926	tencent/im/s2c/msgtype0x210/submsgtype0x48/RecommendDeviceLock:canCancel	Lcom/tencent/mobileqq/pb/PBBoolField;
    //   1566: invokevirtual 930	com/tencent/mobileqq/pb/PBBoolField:get	()Z
    //   1569: invokevirtual 934	android/content/Intent:putExtra	(Ljava/lang/String;Z)Landroid/content/Intent;
    //   1572: pop
    //   1573: aload 21
    //   1575: ldc_w 936
    //   1578: aload_1
    //   1579: getfield 939	tencent/im/s2c/msgtype0x210/submsgtype0x48/RecommendDeviceLock:wording	Lcom/tencent/mobileqq/pb/PBStringField;
    //   1582: invokevirtual 941	com/tencent/mobileqq/pb/PBStringField:get	()Ljava/lang/String;
    //   1585: invokevirtual 944	android/content/Intent:putExtra	(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    //   1588: pop
    //   1589: aload 21
    //   1591: ldc_w 946
    //   1594: aload_1
    //   1595: getfield 949	tencent/im/s2c/msgtype0x210/submsgtype0x48/RecommendDeviceLock:str_title	Lcom/tencent/mobileqq/pb/PBStringField;
    //   1598: invokevirtual 941	com/tencent/mobileqq/pb/PBStringField:get	()Ljava/lang/String;
    //   1601: invokevirtual 944	android/content/Intent:putExtra	(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    //   1604: pop
    //   1605: aload 21
    //   1607: ldc_w 951
    //   1610: aload_1
    //   1611: getfield 954	tencent/im/s2c/msgtype0x210/submsgtype0x48/RecommendDeviceLock:str_second_title	Lcom/tencent/mobileqq/pb/PBStringField;
    //   1614: invokevirtual 941	com/tencent/mobileqq/pb/PBStringField:get	()Ljava/lang/String;
    //   1617: invokevirtual 944	android/content/Intent:putExtra	(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    //   1620: pop
    //   1621: aload 21
    //   1623: ldc_w 956
    //   1626: aload_1
    //   1627: getfield 959	tencent/im/s2c/msgtype0x210/submsgtype0x48/RecommendDeviceLock:str_third_title	Lcom/tencent/mobileqq/pb/PBStringField;
    //   1630: invokevirtual 941	com/tencent/mobileqq/pb/PBStringField:get	()Ljava/lang/String;
    //   1633: invokevirtual 944	android/content/Intent:putExtra	(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    //   1636: pop
    //   1637: aload_1
    //   1638: getfield 963	tencent/im/s2c/msgtype0x210/submsgtype0x48/RecommendDeviceLock:str_wording_list	Lcom/tencent/mobileqq/pb/PBRepeatField;
    //   1641: invokevirtual 966	com/tencent/mobileqq/pb/PBRepeatField:get	()Ljava/util/List;
    //   1644: astore 22
    //   1646: new 108	java/util/ArrayList
    //   1649: dup
    //   1650: invokespecial 109	java/util/ArrayList:<init>	()V
    //   1653: astore 23
    //   1655: aload 22
    //   1657: ifnull +21 -> 1678
    //   1660: aload 22
    //   1662: invokeinterface 565 1 0
    //   1667: ifle +11 -> 1678
    //   1670: aload 23
    //   1672: aload 22
    //   1674: invokevirtual 970	java/util/ArrayList:addAll	(Ljava/util/Collection;)Z
    //   1677: pop
    //   1678: aload 21
    //   1680: ldc_w 972
    //   1683: aload 23
    //   1685: invokevirtual 976	android/content/Intent:putStringArrayListExtra	(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;
    //   1688: pop
    //   1689: aload_0
    //   1690: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   1693: aload 21
    //   1695: invokevirtual 980	com/tencent/mobileqq/app/QQAppInterface:setDevLockIntent	(Landroid/content/Intent;)V
    //   1698: aload_0
    //   1699: sipush 8007
    //   1702: iconst_1
    //   1703: bipush 6
    //   1705: anewarray 982	java/lang/Object
    //   1708: dup
    //   1709: iconst_0
    //   1710: aload_1
    //   1711: getfield 926	tencent/im/s2c/msgtype0x210/submsgtype0x48/RecommendDeviceLock:canCancel	Lcom/tencent/mobileqq/pb/PBBoolField;
    //   1714: invokevirtual 930	com/tencent/mobileqq/pb/PBBoolField:get	()Z
    //   1717: invokestatic 987	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   1720: aastore
    //   1721: dup
    //   1722: iconst_1
    //   1723: aload_1
    //   1724: getfield 939	tencent/im/s2c/msgtype0x210/submsgtype0x48/RecommendDeviceLock:wording	Lcom/tencent/mobileqq/pb/PBStringField;
    //   1727: invokevirtual 941	com/tencent/mobileqq/pb/PBStringField:get	()Ljava/lang/String;
    //   1730: aastore
    //   1731: dup
    //   1732: iconst_2
    //   1733: aload_1
    //   1734: getfield 949	tencent/im/s2c/msgtype0x210/submsgtype0x48/RecommendDeviceLock:str_title	Lcom/tencent/mobileqq/pb/PBStringField;
    //   1737: invokevirtual 941	com/tencent/mobileqq/pb/PBStringField:get	()Ljava/lang/String;
    //   1740: aastore
    //   1741: dup
    //   1742: iconst_3
    //   1743: aload_1
    //   1744: getfield 954	tencent/im/s2c/msgtype0x210/submsgtype0x48/RecommendDeviceLock:str_second_title	Lcom/tencent/mobileqq/pb/PBStringField;
    //   1747: invokevirtual 941	com/tencent/mobileqq/pb/PBStringField:get	()Ljava/lang/String;
    //   1750: aastore
    //   1751: dup
    //   1752: iconst_4
    //   1753: aload_1
    //   1754: getfield 959	tencent/im/s2c/msgtype0x210/submsgtype0x48/RecommendDeviceLock:str_third_title	Lcom/tencent/mobileqq/pb/PBStringField;
    //   1757: invokevirtual 941	com/tencent/mobileqq/pb/PBStringField:get	()Ljava/lang/String;
    //   1760: aastore
    //   1761: dup
    //   1762: iconst_5
    //   1763: aload 23
    //   1765: aastore
    //   1766: invokevirtual 990	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:a	(IZLjava/lang/Object;)V
    //   1769: aconst_null
    //   1770: astore_1
    //   1771: goto -1551 -> 220
    //   1774: astore_1
    //   1775: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1778: ifeq +13 -> 1791
    //   1781: ldc_w 912
    //   1784: iconst_2
    //   1785: ldc_w 992
    //   1788: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   1791: aload_0
    //   1792: sipush 8007
    //   1795: iconst_0
    //   1796: iconst_2
    //   1797: anewarray 982	java/lang/Object
    //   1800: dup
    //   1801: iconst_0
    //   1802: iconst_1
    //   1803: invokestatic 987	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   1806: aastore
    //   1807: dup
    //   1808: iconst_1
    //   1809: ldc_w 391
    //   1812: aastore
    //   1813: invokevirtual 990	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:a	(IZLjava/lang/Object;)V
    //   1816: goto -47 -> 1769
    //   1819: aload 25
    //   1821: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   1824: ldc2_w 993
    //   1827: lcmp
    //   1828: ifne +330 -> 2158
    //   1831: aload 25
    //   1833: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   1836: ifnull +322 -> 2158
    //   1839: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1842: ifeq +13 -> 1855
    //   1845: ldc_w 912
    //   1848: iconst_2
    //   1849: ldc_w 996
    //   1852: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   1855: new 998	com/tencent/msf/service/protocol/pb/SubMsgType0x51$MsgBody
    //   1858: dup
    //   1859: invokespecial 999	com/tencent/msf/service/protocol/pb/SubMsgType0x51$MsgBody:<init>	()V
    //   1862: pop
    //   1863: aconst_null
    //   1864: astore 21
    //   1866: aconst_null
    //   1867: astore 22
    //   1869: aconst_null
    //   1870: astore 23
    //   1872: aconst_null
    //   1873: astore 24
    //   1875: new 998	com/tencent/msf/service/protocol/pb/SubMsgType0x51$MsgBody
    //   1878: dup
    //   1879: invokespecial 999	com/tencent/msf/service/protocol/pb/SubMsgType0x51$MsgBody:<init>	()V
    //   1882: astore 26
    //   1884: aload 26
    //   1886: aload 25
    //   1888: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   1891: invokevirtual 1000	com/tencent/msf/service/protocol/pb/SubMsgType0x51$MsgBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   1894: pop
    //   1895: aload 26
    //   1897: getfield 1003	com/tencent/msf/service/protocol/pb/SubMsgType0x51$MsgBody:bytes_qrsig_url	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   1900: invokevirtual 1004	com/tencent/mobileqq/pb/PBBytesField:has	()Z
    //   1903: ifeq +26 -> 1929
    //   1906: new 106	java/lang/String
    //   1909: dup
    //   1910: aload 26
    //   1912: getfield 1003	com/tencent/msf/service/protocol/pb/SubMsgType0x51$MsgBody:bytes_qrsig_url	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   1915: invokevirtual 589	com/tencent/mobileqq/pb/PBBytesField:get	()Lcom/tencent/mobileqq/pb/ByteStringMicro;
    //   1918: invokevirtual 1005	com/tencent/mobileqq/pb/ByteStringMicro:toByteArray	()[B
    //   1921: ldc_w 347
    //   1924: invokespecial 350	java/lang/String:<init>	([BLjava/lang/String;)V
    //   1927: astore 21
    //   1929: aload 26
    //   1931: getfield 1008	com/tencent/msf/service/protocol/pb/SubMsgType0x51$MsgBody:bytes_hint1	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   1934: invokevirtual 1004	com/tencent/mobileqq/pb/PBBytesField:has	()Z
    //   1937: ifeq +26 -> 1963
    //   1940: new 106	java/lang/String
    //   1943: dup
    //   1944: aload 26
    //   1946: getfield 1008	com/tencent/msf/service/protocol/pb/SubMsgType0x51$MsgBody:bytes_hint1	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   1949: invokevirtual 589	com/tencent/mobileqq/pb/PBBytesField:get	()Lcom/tencent/mobileqq/pb/ByteStringMicro;
    //   1952: invokevirtual 1005	com/tencent/mobileqq/pb/ByteStringMicro:toByteArray	()[B
    //   1955: ldc_w 347
    //   1958: invokespecial 350	java/lang/String:<init>	([BLjava/lang/String;)V
    //   1961: astore 22
    //   1963: aload 26
    //   1965: getfield 1011	com/tencent/msf/service/protocol/pb/SubMsgType0x51$MsgBody:bytes_hint2	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   1968: invokevirtual 1004	com/tencent/mobileqq/pb/PBBytesField:has	()Z
    //   1971: ifeq +26 -> 1997
    //   1974: new 106	java/lang/String
    //   1977: dup
    //   1978: aload 26
    //   1980: getfield 1011	com/tencent/msf/service/protocol/pb/SubMsgType0x51$MsgBody:bytes_hint2	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   1983: invokevirtual 589	com/tencent/mobileqq/pb/PBBytesField:get	()Lcom/tencent/mobileqq/pb/ByteStringMicro;
    //   1986: invokevirtual 1005	com/tencent/mobileqq/pb/ByteStringMicro:toByteArray	()[B
    //   1989: ldc_w 347
    //   1992: invokespecial 350	java/lang/String:<init>	([BLjava/lang/String;)V
    //   1995: astore 23
    //   1997: aload 26
    //   1999: getfield 1014	com/tencent/msf/service/protocol/pb/SubMsgType0x51$MsgBody:bytes_login_conf	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   2002: invokevirtual 1004	com/tencent/mobileqq/pb/PBBytesField:has	()Z
    //   2005: ifeq +16 -> 2021
    //   2008: aload 26
    //   2010: getfield 1014	com/tencent/msf/service/protocol/pb/SubMsgType0x51$MsgBody:bytes_login_conf	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   2013: invokevirtual 589	com/tencent/mobileqq/pb/PBBytesField:get	()Lcom/tencent/mobileqq/pb/ByteStringMicro;
    //   2016: invokevirtual 1005	com/tencent/mobileqq/pb/ByteStringMicro:toByteArray	()[B
    //   2019: astore 24
    //   2021: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   2024: ifeq +53 -> 2077
    //   2027: ldc_w 912
    //   2030: iconst_2
    //   2031: new 80	java/lang/StringBuilder
    //   2034: dup
    //   2035: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   2038: ldc_w 1016
    //   2041: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2044: aload 21
    //   2046: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2049: ldc_w 1018
    //   2052: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2055: aload 22
    //   2057: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2060: ldc_w 1020
    //   2063: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2066: aload 23
    //   2068: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2071: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2074: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   2077: invokestatic 1025	com/tencent/mobileqq/equipmentlock/EquipmentLockImpl:a	()Lcom/tencent/mobileqq/equipmentlock/EquipmentLockImpl;
    //   2080: aload_0
    //   2081: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   2084: aload 21
    //   2086: aload 22
    //   2088: aload 23
    //   2090: aload 24
    //   2092: invokevirtual 1028	com/tencent/mobileqq/equipmentlock/EquipmentLockImpl:a	(Lcom/tencent/mobileqq/app/QQAppInterface;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[B)V
    //   2095: aload_1
    //   2096: getfield 144	OnlinePushPack/MsgInfo:lFromUin	J
    //   2099: lstore_2
    //   2100: aload_1
    //   2101: getfield 176	OnlinePushPack/MsgInfo:shMsgSeq	S
    //   2104: istore 4
    //   2106: aload_1
    //   2107: getfield 216	OnlinePushPack/MsgInfo:lMsgUid	J
    //   2110: lstore 13
    //   2112: aload_1
    //   2113: getfield 141	OnlinePushPack/MsgInfo:shMsgType	S
    //   2116: istore 5
    //   2118: aload_0
    //   2119: getfield 519	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppMessageHandler	Lcom/tencent/mobileqq/app/MessageHandler;
    //   2122: lload_2
    //   2123: iload 4
    //   2125: lload 13
    //   2127: iload 5
    //   2129: invokestatic 1033	com/tencent/mobileqq/service/message/MessageProtoCodec:a	(Lcom/tencent/mobileqq/app/MessageHandler;JIJI)V
    //   2132: aconst_null
    //   2133: astore_1
    //   2134: goto -1914 -> 220
    //   2137: astore 21
    //   2139: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   2142: ifeq -47 -> 2095
    //   2145: ldc_w 912
    //   2148: iconst_2
    //   2149: ldc_w 1035
    //   2152: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   2155: goto -60 -> 2095
    //   2158: aload 25
    //   2160: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   2163: ldc2_w 1036
    //   2166: lcmp
    //   2167: ifne +36 -> 2203
    //   2170: aload 25
    //   2172: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   2175: ifnull +28 -> 2203
    //   2178: aload_0
    //   2179: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   2182: bipush 24
    //   2184: invokevirtual 48	com/tencent/mobileqq/app/QQAppInterface:a	(I)Lcom/tencent/mobileqq/app/BusinessHandler;
    //   2187: checkcast 1039	com/tencent/mobileqq/app/SafeCenterPushHandler
    //   2190: aload 25
    //   2192: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   2195: invokevirtual 1040	com/tencent/mobileqq/app/SafeCenterPushHandler:a	([B)V
    //   2198: aconst_null
    //   2199: astore_1
    //   2200: goto -1980 -> 220
    //   2203: aload 25
    //   2205: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   2208: ldc2_w 1041
    //   2211: lcmp
    //   2212: ifne +224 -> 2436
    //   2215: aload 25
    //   2217: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   2220: ifnull +216 -> 2436
    //   2223: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   2226: ifeq +13 -> 2239
    //   2229: ldc_w 1044
    //   2232: iconst_2
    //   2233: ldc_w 1046
    //   2236: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   2239: aload_0
    //   2240: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   2243: iconst_4
    //   2244: invokevirtual 48	com/tencent/mobileqq/app/QQAppInterface:a	(I)Lcom/tencent/mobileqq/app/BusinessHandler;
    //   2247: checkcast 871	com/tencent/mobileqq/app/ConfigHandler
    //   2250: astore_1
    //   2251: aload_1
    //   2252: ifnull +171 -> 2423
    //   2255: new 1048	tencent/im/s2c/msgtype0x210/submsgtype0x54/submsgtype0x54$MsgBody
    //   2258: dup
    //   2259: invokespecial 1049	tencent/im/s2c/msgtype0x210/submsgtype0x54/submsgtype0x54$MsgBody:<init>	()V
    //   2262: astore 21
    //   2264: aload 21
    //   2266: aload 25
    //   2268: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   2271: invokevirtual 1050	tencent/im/s2c/msgtype0x210/submsgtype0x54/submsgtype0x54$MsgBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   2274: pop
    //   2275: aload 21
    //   2277: getfield 1054	tencent/im/s2c/msgtype0x210/submsgtype0x54/submsgtype0x54$MsgBody:peer_type	Lcom/tencent/mobileqq/pb/PBEnumField;
    //   2280: invokevirtual 1057	com/tencent/mobileqq/pb/PBEnumField:get	()I
    //   2283: istore 4
    //   2285: aload 21
    //   2287: getfield 1060	tencent/im/s2c/msgtype0x210/submsgtype0x54/submsgtype0x54$MsgBody:task_list	Lcom/tencent/mobileqq/pb/PBRepeatMessageField;
    //   2290: invokevirtual 562	com/tencent/mobileqq/pb/PBRepeatMessageField:get	()Ljava/util/List;
    //   2293: astore 23
    //   2295: new 108	java/util/ArrayList
    //   2298: dup
    //   2299: invokespecial 109	java/util/ArrayList:<init>	()V
    //   2302: astore 22
    //   2304: aload 23
    //   2306: ifnull +87 -> 2393
    //   2309: aload 23
    //   2311: invokeinterface 565 1 0
    //   2316: ifle +77 -> 2393
    //   2319: aload 23
    //   2321: invokeinterface 572 1 0
    //   2326: astore 23
    //   2328: aload 23
    //   2330: invokeinterface 133 1 0
    //   2335: ifeq +58 -> 2393
    //   2338: aload 23
    //   2340: invokeinterface 137 1 0
    //   2345: checkcast 1062	tencent/im/s2c/msgtype0x210/submsgtype0x54/submsgtype0x54$MsgBody$TaskInfo
    //   2348: astore 24
    //   2350: new 1064	com/tencent/mobileqq/config/operation/QQOperationViopTipTask
    //   2353: dup
    //   2354: invokespecial 1065	com/tencent/mobileqq/config/operation/QQOperationViopTipTask:<init>	()V
    //   2357: astore 25
    //   2359: aload 25
    //   2361: aload 24
    //   2363: getfield 1068	tencent/im/s2c/msgtype0x210/submsgtype0x54/submsgtype0x54$MsgBody$TaskInfo:task_id	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   2366: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   2369: putfield 1071	com/tencent/mobileqq/config/operation/QQOperationViopTipTask:taskid	I
    //   2372: aload 22
    //   2374: aload 25
    //   2376: invokevirtual 189	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   2379: pop
    //   2380: goto -52 -> 2328
    //   2383: astore 22
    //   2385: aload 22
    //   2387: invokevirtual 908	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException:printStackTrace	()V
    //   2390: goto -115 -> 2275
    //   2393: aload 21
    //   2395: getfield 1074	tencent/im/s2c/msgtype0x210/submsgtype0x54/submsgtype0x54$MsgBody:peer_uin	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   2398: invokevirtual 553	com/tencent/mobileqq/pb/PBUInt64Field:get	()J
    //   2401: lstore_2
    //   2402: iload 4
    //   2404: iconst_1
    //   2405: if_icmpne +23 -> 2428
    //   2408: iconst_0
    //   2409: istore 4
    //   2411: aload_1
    //   2412: lload_2
    //   2413: invokestatic 192	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   2416: iload 4
    //   2418: aload 22
    //   2420: invokevirtual 1077	com/tencent/mobileqq/app/ConfigHandler:a	(Ljava/lang/String;ILjava/util/ArrayList;)V
    //   2423: aconst_null
    //   2424: astore_1
    //   2425: goto -2205 -> 220
    //   2428: sipush 3000
    //   2431: istore 4
    //   2433: goto -22 -> 2411
    //   2436: aload 25
    //   2438: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   2441: ldc2_w 1078
    //   2444: lcmp
    //   2445: ifne +104 -> 2549
    //   2448: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   2451: ifeq +13 -> 2464
    //   2454: ldc_w 1081
    //   2457: iconst_2
    //   2458: ldc_w 1083
    //   2461: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   2464: aload_0
    //   2465: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   2468: bipush 56
    //   2470: invokevirtual 167	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   2473: checkcast 1085	com/tencent/mobileqq/app/SecMsgManager
    //   2476: aload_1
    //   2477: getfield 176	OnlinePushPack/MsgInfo:shMsgSeq	S
    //   2480: invokevirtual 1087	com/tencent/mobileqq/app/SecMsgManager:a	(I)Z
    //   2483: ifeq +43 -> 2526
    //   2486: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   2489: ifeq +32 -> 2521
    //   2492: ldc 63
    //   2494: iconst_2
    //   2495: new 80	java/lang/StringBuilder
    //   2498: dup
    //   2499: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   2502: ldc_w 1089
    //   2505: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2508: aload_1
    //   2509: getfield 176	OnlinePushPack/MsgInfo:shMsgSeq	S
    //   2512: invokevirtual 92	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   2515: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2518: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   2521: aconst_null
    //   2522: astore_1
    //   2523: goto -2303 -> 220
    //   2526: aload_0
    //   2527: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   2530: bipush 40
    //   2532: invokevirtual 48	com/tencent/mobileqq/app/QQAppInterface:a	(I)Lcom/tencent/mobileqq/app/BusinessHandler;
    //   2535: checkcast 1091	com/tencent/mobileqq/app/SecMsgHandler
    //   2538: aload 25
    //   2540: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   2543: invokevirtual 1092	com/tencent/mobileqq/app/SecMsgHandler:a	([B)V
    //   2546: goto -25 -> 2521
    //   2549: aload 25
    //   2551: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   2554: ldc2_w 1093
    //   2557: lcmp
    //   2558: ifne +163 -> 2721
    //   2561: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   2564: ifeq +44 -> 2608
    //   2567: new 80	java/lang/StringBuilder
    //   2570: dup
    //   2571: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   2574: ldc_w 1096
    //   2577: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2580: astore_1
    //   2581: aload 25
    //   2583: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   2586: ifnull +87 -> 2673
    //   2589: iconst_1
    //   2590: istore 15
    //   2592: ldc_w 1098
    //   2595: iconst_2
    //   2596: aload_1
    //   2597: iload 15
    //   2599: invokevirtual 790	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   2602: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2605: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   2608: new 1100	tencent/im/s2c/msgtype0x210/submsgtype0x67/submsgtype0x67$MsgBody
    //   2611: dup
    //   2612: invokespecial 1101	tencent/im/s2c/msgtype0x210/submsgtype0x67/submsgtype0x67$MsgBody:<init>	()V
    //   2615: astore_1
    //   2616: aload_1
    //   2617: aload 25
    //   2619: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   2622: invokevirtual 1102	tencent/im/s2c/msgtype0x210/submsgtype0x67/submsgtype0x67$MsgBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   2625: pop
    //   2626: aload_1
    //   2627: getfield 1105	tencent/im/s2c/msgtype0x210/submsgtype0x67/submsgtype0x67$MsgBody:rpt_msg_grpinfo	Lcom/tencent/mobileqq/pb/PBRepeatMessageField;
    //   2630: invokevirtual 1106	com/tencent/mobileqq/pb/PBRepeatMessageField:has	()Z
    //   2633: ifeq +35 -> 2668
    //   2636: aload_1
    //   2637: getfield 1105	tencent/im/s2c/msgtype0x210/submsgtype0x67/submsgtype0x67$MsgBody:rpt_msg_grpinfo	Lcom/tencent/mobileqq/pb/PBRepeatMessageField;
    //   2640: invokevirtual 562	com/tencent/mobileqq/pb/PBRepeatMessageField:get	()Ljava/util/List;
    //   2643: astore_1
    //   2644: aload_0
    //   2645: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   2648: iconst_3
    //   2649: invokevirtual 48	com/tencent/mobileqq/app/QQAppInterface:a	(I)Lcom/tencent/mobileqq/app/BusinessHandler;
    //   2652: checkcast 1108	com/tencent/mobileqq/app/LBSHandler
    //   2655: astore 21
    //   2657: aload 21
    //   2659: ifnull +9 -> 2668
    //   2662: aload 21
    //   2664: aload_1
    //   2665: invokevirtual 1111	com/tencent/mobileqq/app/LBSHandler:a	(Ljava/util/List;)V
    //   2668: aconst_null
    //   2669: astore_1
    //   2670: goto -2450 -> 220
    //   2673: iconst_0
    //   2674: istore 15
    //   2676: goto -84 -> 2592
    //   2679: astore 21
    //   2681: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   2684: ifeq -58 -> 2626
    //   2687: ldc_w 1098
    //   2690: iconst_2
    //   2691: new 80	java/lang/StringBuilder
    //   2694: dup
    //   2695: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   2698: ldc_w 1113
    //   2701: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2704: aload 21
    //   2706: invokevirtual 1114	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException:toString	()Ljava/lang/String;
    //   2709: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2712: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2715: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   2718: goto -92 -> 2626
    //   2721: aload 25
    //   2723: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   2726: ldc2_w 1115
    //   2729: lcmp
    //   2730: ifne +30 -> 2760
    //   2733: aload_0
    //   2734: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   2737: bipush 21
    //   2739: invokevirtual 167	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   2742: checkcast 1118	com/tencent/mobileqq/app/RecommendTroopManagerImp
    //   2745: astore_1
    //   2746: aload_1
    //   2747: ifnull +8 -> 2755
    //   2750: aload_1
    //   2751: invokevirtual 1120	com/tencent/mobileqq/app/RecommendTroopManagerImp:a	()Z
    //   2754: pop
    //   2755: aconst_null
    //   2756: astore_1
    //   2757: goto -2537 -> 220
    //   2760: aload 25
    //   2762: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   2765: ldc2_w 1121
    //   2768: lcmp
    //   2769: ifne +98 -> 2867
    //   2772: aload 25
    //   2774: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   2777: ifnull +90 -> 2867
    //   2780: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   2783: ifeq +12 -> 2795
    //   2786: ldc 63
    //   2788: iconst_2
    //   2789: ldc_w 1124
    //   2792: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   2795: aload_0
    //   2796: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   2799: ldc_w 1126
    //   2802: ldc_w 391
    //   2805: ldc_w 391
    //   2808: ldc_w 1128
    //   2811: ldc_w 1128
    //   2814: iconst_0
    //   2815: iconst_0
    //   2816: ldc_w 391
    //   2819: ldc_w 391
    //   2822: ldc_w 391
    //   2825: ldc_w 391
    //   2828: invokestatic 1133	com/tencent/mobileqq/statistics/ReportController:b	(Lcom/tencent/mobileqq/app/QQAppInterface;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   2831: new 1135	tencent/im/s2c/msgtype0x210/submsgtype0x63/submsgtype0x63$MsgBody
    //   2834: dup
    //   2835: invokespecial 1136	tencent/im/s2c/msgtype0x210/submsgtype0x63/submsgtype0x63$MsgBody:<init>	()V
    //   2838: pop
    //   2839: new 1138	com/tencent/av/service/QavWrapper
    //   2842: dup
    //   2843: invokestatic 1144	com/tencent/qphone/base/util/BaseApplication:getContext	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   2846: invokespecial 1147	com/tencent/av/service/QavWrapper:<init>	(Landroid/content/Context;)V
    //   2849: new 1149	nke
    //   2852: dup
    //   2853: aload_0
    //   2854: aload 25
    //   2856: invokespecial 1152	nke:<init>	(Lcom/tencent/mobileqq/app/message/OnLinePushMessageProcessor;LIMMsgBodyPack/MsgType0x210;)V
    //   2859: invokevirtual 1155	com/tencent/av/service/QavWrapper:a	(Lcom/tencent/av/service/QavWrapper$OnReadyListener;)V
    //   2862: aconst_null
    //   2863: astore_1
    //   2864: goto -2644 -> 220
    //   2867: aload 25
    //   2869: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   2872: ldc2_w 1156
    //   2875: lcmp
    //   2876: ifne +44 -> 2920
    //   2879: aload 25
    //   2881: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   2884: ifnull +36 -> 2920
    //   2887: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   2890: ifeq +13 -> 2903
    //   2893: ldc_w 1159
    //   2896: iconst_2
    //   2897: ldc_w 1161
    //   2900: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   2903: aload_0
    //   2904: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   2907: aload 25
    //   2909: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   2912: invokestatic 1164	com/tencent/mobileqq/activity/qwallet/QWalletPushManager:a	(Lcom/tencent/mobileqq/app/QQAppInterface;[B)V
    //   2915: aconst_null
    //   2916: astore_1
    //   2917: goto -2697 -> 220
    //   2920: aload 25
    //   2922: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   2925: ldc2_w 1165
    //   2928: lcmp
    //   2929: ifne +44 -> 2973
    //   2932: aload 25
    //   2934: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   2937: ifnull +36 -> 2973
    //   2940: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   2943: ifeq +13 -> 2956
    //   2946: ldc_w 1159
    //   2949: iconst_2
    //   2950: ldc_w 1168
    //   2953: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   2956: aload_0
    //   2957: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   2960: aload 25
    //   2962: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   2965: invokestatic 1170	com/tencent/mobileqq/activity/qwallet/QWalletPushManager:b	(Lcom/tencent/mobileqq/app/QQAppInterface;[B)V
    //   2968: aconst_null
    //   2969: astore_1
    //   2970: goto -2750 -> 220
    //   2973: aload 25
    //   2975: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   2978: ldc2_w 1171
    //   2981: lcmp
    //   2982: ifne +84 -> 3066
    //   2985: aload 25
    //   2987: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   2990: ifnull +76 -> 3066
    //   2993: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   2996: ifeq +13 -> 3009
    //   2999: ldc_w 1174
    //   3002: iconst_2
    //   3003: ldc_w 1176
    //   3006: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   3009: aload_0
    //   3010: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   3013: aload 25
    //   3015: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   3018: invokestatic 1177	com/tencent/mobileqq/service/message/MessageProtoCodec:a	(Lcom/tencent/mobileqq/app/QQAppInterface;[B)V
    //   3021: aload_1
    //   3022: getfield 144	OnlinePushPack/MsgInfo:lFromUin	J
    //   3025: lstore_2
    //   3026: aload_1
    //   3027: getfield 176	OnlinePushPack/MsgInfo:shMsgSeq	S
    //   3030: istore 4
    //   3032: aload_1
    //   3033: getfield 216	OnlinePushPack/MsgInfo:lMsgUid	J
    //   3036: lstore 13
    //   3038: aload_1
    //   3039: getfield 141	OnlinePushPack/MsgInfo:shMsgType	S
    //   3042: istore 5
    //   3044: aload_0
    //   3045: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   3048: invokevirtual 307	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/app/MessageHandler;
    //   3051: lload_2
    //   3052: iload 4
    //   3054: lload 13
    //   3056: iload 5
    //   3058: invokestatic 1033	com/tencent/mobileqq/service/message/MessageProtoCodec:a	(Lcom/tencent/mobileqq/app/MessageHandler;JIJI)V
    //   3061: aconst_null
    //   3062: astore_1
    //   3063: goto -2843 -> 220
    //   3066: aload 25
    //   3068: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   3071: ldc2_w 1178
    //   3074: lcmp
    //   3075: ifne +440 -> 3515
    //   3078: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   3081: ifeq +13 -> 3094
    //   3084: ldc_w 1181
    //   3087: iconst_2
    //   3088: ldc_w 1176
    //   3091: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   3094: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   3097: ifeq +13 -> 3110
    //   3100: ldc_w 1183
    //   3103: iconst_2
    //   3104: ldc_w 1185
    //   3107: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   3110: new 1187	tencent/im/s2c/msgtype0x210/submsgtype0x6b/SubMsgType0x6b$MsgBody
    //   3113: dup
    //   3114: invokespecial 1188	tencent/im/s2c/msgtype0x210/submsgtype0x6b/SubMsgType0x6b$MsgBody:<init>	()V
    //   3117: astore 24
    //   3119: aload 24
    //   3121: aload 25
    //   3123: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   3126: invokevirtual 1189	tencent/im/s2c/msgtype0x210/submsgtype0x6b/SubMsgType0x6b$MsgBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   3129: pop
    //   3130: aload 24
    //   3132: getfield 1192	tencent/im/s2c/msgtype0x210/submsgtype0x6b/SubMsgType0x6b$MsgBody:uint64_to_uin	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   3135: invokevirtual 553	com/tencent/mobileqq/pb/PBUInt64Field:get	()J
    //   3138: lstore_2
    //   3139: aload_0
    //   3140: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   3143: invokevirtual 150	com/tencent/mobileqq/app/QQAppInterface:getAccount	()Ljava/lang/String;
    //   3146: astore 21
    //   3148: invokestatic 1197	com/tencent/common/app/BaseApplicationImpl:a	()Lcom/tencent/common/app/BaseApplicationImpl;
    //   3151: lload_2
    //   3152: invokestatic 827	java/lang/Long:toString	(J)Ljava/lang/String;
    //   3155: aconst_null
    //   3156: ldc_w 1199
    //   3159: iconst_0
    //   3160: invokestatic 1205	com/tencent/mobileqq/msf/sdk/SettingCloneUtil:readValue	(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z
    //   3163: ifne +333 -> 3496
    //   3166: lload_2
    //   3167: invokestatic 827	java/lang/Long:toString	(J)Ljava/lang/String;
    //   3170: aload 21
    //   3172: invokevirtual 597	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   3175: istore 15
    //   3177: iload 15
    //   3179: ifeq +317 -> 3496
    //   3182: aconst_null
    //   3183: astore 21
    //   3185: aconst_null
    //   3186: astore 22
    //   3188: aconst_null
    //   3189: astore 26
    //   3191: aload 24
    //   3193: getfield 1208	tencent/im/s2c/msgtype0x210/submsgtype0x6b/SubMsgType0x6b$MsgBody:bytes_tips_content	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   3196: invokevirtual 1004	com/tencent/mobileqq/pb/PBBytesField:has	()Z
    //   3199: ifeq +6511 -> 9710
    //   3202: new 106	java/lang/String
    //   3205: dup
    //   3206: aload 24
    //   3208: getfield 1208	tencent/im/s2c/msgtype0x210/submsgtype0x6b/SubMsgType0x6b$MsgBody:bytes_tips_content	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   3211: invokevirtual 589	com/tencent/mobileqq/pb/PBBytesField:get	()Lcom/tencent/mobileqq/pb/ByteStringMicro;
    //   3214: invokevirtual 1005	com/tencent/mobileqq/pb/ByteStringMicro:toByteArray	()[B
    //   3217: ldc_w 347
    //   3220: invokespecial 350	java/lang/String:<init>	([BLjava/lang/String;)V
    //   3223: astore 23
    //   3225: aload 23
    //   3227: astore 21
    //   3229: aload 24
    //   3231: getfield 1211	tencent/im/s2c/msgtype0x210/submsgtype0x6b/SubMsgType0x6b$MsgBody:bytes_yes_text	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   3234: invokevirtual 1004	com/tencent/mobileqq/pb/PBBytesField:has	()Z
    //   3237: ifeq +6467 -> 9704
    //   3240: new 106	java/lang/String
    //   3243: dup
    //   3244: aload 24
    //   3246: getfield 1211	tencent/im/s2c/msgtype0x210/submsgtype0x6b/SubMsgType0x6b$MsgBody:bytes_yes_text	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   3249: invokevirtual 589	com/tencent/mobileqq/pb/PBBytesField:get	()Lcom/tencent/mobileqq/pb/ByteStringMicro;
    //   3252: invokevirtual 1005	com/tencent/mobileqq/pb/ByteStringMicro:toByteArray	()[B
    //   3255: ldc_w 347
    //   3258: invokespecial 350	java/lang/String:<init>	([BLjava/lang/String;)V
    //   3261: astore 23
    //   3263: aload 23
    //   3265: astore 22
    //   3267: aload 24
    //   3269: getfield 1214	tencent/im/s2c/msgtype0x210/submsgtype0x6b/SubMsgType0x6b$MsgBody:bytes_no_text	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   3272: invokevirtual 1004	com/tencent/mobileqq/pb/PBBytesField:has	()Z
    //   3275: ifeq +6423 -> 9698
    //   3278: new 106	java/lang/String
    //   3281: dup
    //   3282: aload 24
    //   3284: getfield 1214	tencent/im/s2c/msgtype0x210/submsgtype0x6b/SubMsgType0x6b$MsgBody:bytes_no_text	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   3287: invokevirtual 589	com/tencent/mobileqq/pb/PBBytesField:get	()Lcom/tencent/mobileqq/pb/ByteStringMicro;
    //   3290: invokevirtual 1005	com/tencent/mobileqq/pb/ByteStringMicro:toByteArray	()[B
    //   3293: ldc_w 347
    //   3296: invokespecial 350	java/lang/String:<init>	([BLjava/lang/String;)V
    //   3299: astore 23
    //   3301: aload 23
    //   3303: astore 24
    //   3305: aload 21
    //   3307: astore 23
    //   3309: aload 22
    //   3311: astore 25
    //   3313: invokestatic 1197	com/tencent/common/app/BaseApplicationImpl:a	()Lcom/tencent/common/app/BaseApplicationImpl;
    //   3316: lload_2
    //   3317: invokestatic 827	java/lang/Long:toString	(J)Ljava/lang/String;
    //   3320: aload 23
    //   3322: aload 24
    //   3324: aload 25
    //   3326: invokevirtual 1217	com/tencent/common/app/BaseApplicationImpl:a	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   3329: aload_0
    //   3330: sipush 8013
    //   3333: iconst_1
    //   3334: iconst_4
    //   3335: anewarray 982	java/lang/Object
    //   3338: dup
    //   3339: iconst_0
    //   3340: lload_2
    //   3341: invokestatic 827	java/lang/Long:toString	(J)Ljava/lang/String;
    //   3344: aastore
    //   3345: dup
    //   3346: iconst_1
    //   3347: aload 23
    //   3349: aastore
    //   3350: dup
    //   3351: iconst_2
    //   3352: aload 24
    //   3354: aastore
    //   3355: dup
    //   3356: iconst_3
    //   3357: aload 25
    //   3359: aastore
    //   3360: invokevirtual 990	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:a	(IZLjava/lang/Object;)V
    //   3363: aload_1
    //   3364: getfield 144	OnlinePushPack/MsgInfo:lFromUin	J
    //   3367: lstore_2
    //   3368: aload_1
    //   3369: getfield 176	OnlinePushPack/MsgInfo:shMsgSeq	S
    //   3372: istore 4
    //   3374: aload_1
    //   3375: getfield 216	OnlinePushPack/MsgInfo:lMsgUid	J
    //   3378: lstore 13
    //   3380: aload_1
    //   3381: getfield 141	OnlinePushPack/MsgInfo:shMsgType	S
    //   3384: istore 5
    //   3386: aload_0
    //   3387: getfield 519	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppMessageHandler	Lcom/tencent/mobileqq/app/MessageHandler;
    //   3390: lload_2
    //   3391: iload 4
    //   3393: lload 13
    //   3395: iload 5
    //   3397: invokestatic 1033	com/tencent/mobileqq/service/message/MessageProtoCodec:a	(Lcom/tencent/mobileqq/app/MessageHandler;JIJI)V
    //   3400: aconst_null
    //   3401: astore_1
    //   3402: goto -3182 -> 220
    //   3405: astore 23
    //   3407: aload 22
    //   3409: astore 25
    //   3411: aload 26
    //   3413: astore 24
    //   3415: aload 21
    //   3417: astore 23
    //   3419: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   3422: ifeq -109 -> 3313
    //   3425: ldc_w 1181
    //   3428: iconst_2
    //   3429: ldc_w 1219
    //   3432: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   3435: aload 22
    //   3437: astore 25
    //   3439: aload 26
    //   3441: astore 24
    //   3443: aload 21
    //   3445: astore 23
    //   3447: goto -134 -> 3313
    //   3450: astore 21
    //   3452: aload 21
    //   3454: invokevirtual 908	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException:printStackTrace	()V
    //   3457: aload_0
    //   3458: sipush 8013
    //   3461: iconst_0
    //   3462: iconst_4
    //   3463: anewarray 982	java/lang/Object
    //   3466: dup
    //   3467: iconst_0
    //   3468: ldc_w 391
    //   3471: aastore
    //   3472: dup
    //   3473: iconst_1
    //   3474: ldc_w 391
    //   3477: aastore
    //   3478: dup
    //   3479: iconst_2
    //   3480: ldc_w 391
    //   3483: aastore
    //   3484: dup
    //   3485: iconst_3
    //   3486: ldc_w 391
    //   3489: aastore
    //   3490: invokevirtual 990	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:a	(IZLjava/lang/Object;)V
    //   3493: goto -130 -> 3363
    //   3496: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   3499: ifeq -136 -> 3363
    //   3502: ldc_w 1181
    //   3505: iconst_2
    //   3506: ldc_w 1221
    //   3509: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   3512: goto -149 -> 3363
    //   3515: ldc2_w 1222
    //   3518: aload 25
    //   3520: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   3523: lcmp
    //   3524: ifne +31 -> 3555
    //   3527: aload_0
    //   3528: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   3531: aload 25
    //   3533: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   3536: invokestatic 1228	com/tencent/biz/TroopRedpoint/TroopRedTouchHandler:a	(Lcom/tencent/mobileqq/app/QQAppInterface;[B)Z
    //   3539: ifeq +6116 -> 9655
    //   3542: aload_0
    //   3543: bipush 105
    //   3545: iconst_1
    //   3546: aconst_null
    //   3547: invokevirtual 990	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:a	(IZLjava/lang/Object;)V
    //   3550: aconst_null
    //   3551: astore_1
    //   3552: goto -3332 -> 220
    //   3555: aload 25
    //   3557: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   3560: ldc2_w 1229
    //   3563: lcmp
    //   3564: ifne +884 -> 4448
    //   3567: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   3570: ifeq +13 -> 3583
    //   3573: ldc_w 1232
    //   3576: iconst_2
    //   3577: ldc_w 1176
    //   3580: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   3583: new 1234	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$MsgBody
    //   3586: dup
    //   3587: invokespecial 1235	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$MsgBody:<init>	()V
    //   3590: astore 21
    //   3592: aload 21
    //   3594: aload 25
    //   3596: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   3599: invokevirtual 1236	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$MsgBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   3602: pop
    //   3603: aload 21
    //   3605: getfield 1239	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$MsgBody:rpt_msg_mod_infos	Lcom/tencent/mobileqq/pb/PBRepeatMessageField;
    //   3608: invokevirtual 562	com/tencent/mobileqq/pb/PBRepeatMessageField:get	()Ljava/util/List;
    //   3611: iconst_0
    //   3612: invokeinterface 1242 2 0
    //   3617: checkcast 1244	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$ForwardBody
    //   3620: astore 21
    //   3622: iconst_m1
    //   3623: istore 4
    //   3625: aload 21
    //   3627: getfield 1247	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$ForwardBody:uint32_op_type	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   3630: invokevirtual 615	com/tencent/mobileqq/pb/PBUInt32Field:has	()Z
    //   3633: ifeq +13 -> 3646
    //   3636: aload 21
    //   3638: getfield 1247	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$ForwardBody:uint32_op_type	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   3641: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   3644: istore 4
    //   3646: iload 4
    //   3648: sipush 2001
    //   3651: if_icmpne +260 -> 3911
    //   3654: aload 21
    //   3656: getfield 1251	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$ForwardBody:msg_mcard_notification_like	Ltencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$MCardNotificationLike;
    //   3659: invokevirtual 1254	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$MCardNotificationLike:has	()Z
    //   3662: ifeq +249 -> 3911
    //   3665: aload 21
    //   3667: getfield 1251	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$ForwardBody:msg_mcard_notification_like	Ltencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$MCardNotificationLike;
    //   3670: invokevirtual 1257	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$MCardNotificationLike:get	()Lcom/tencent/mobileqq/pb/MessageMicro;
    //   3673: checkcast 1253	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$MCardNotificationLike
    //   3676: astore 22
    //   3678: ldc_w 391
    //   3681: astore 21
    //   3683: lconst_0
    //   3684: lstore_2
    //   3685: iconst_0
    //   3686: istore 5
    //   3688: iconst_0
    //   3689: istore 4
    //   3691: aload 22
    //   3693: getfield 1260	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$MCardNotificationLike:str_wording	Lcom/tencent/mobileqq/pb/PBStringField;
    //   3696: invokevirtual 1261	com/tencent/mobileqq/pb/PBStringField:has	()Z
    //   3699: ifeq +13 -> 3712
    //   3702: aload 22
    //   3704: getfield 1260	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$MCardNotificationLike:str_wording	Lcom/tencent/mobileqq/pb/PBStringField;
    //   3707: invokevirtual 941	com/tencent/mobileqq/pb/PBStringField:get	()Ljava/lang/String;
    //   3710: astore 21
    //   3712: aload 22
    //   3714: getfield 1264	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$MCardNotificationLike:uint32_counter_new	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   3717: invokevirtual 615	com/tencent/mobileqq/pb/PBUInt32Field:has	()Z
    //   3720: ifeq +13 -> 3733
    //   3723: aload 22
    //   3725: getfield 1264	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$MCardNotificationLike:uint32_counter_new	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   3728: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   3731: istore 4
    //   3733: aload 22
    //   3735: getfield 1267	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$MCardNotificationLike:uint64_from_uin	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   3738: invokevirtual 775	com/tencent/mobileqq/pb/PBUInt64Field:has	()Z
    //   3741: ifeq +12 -> 3753
    //   3744: aload 22
    //   3746: getfield 1267	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$MCardNotificationLike:uint64_from_uin	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   3749: invokevirtual 553	com/tencent/mobileqq/pb/PBUInt64Field:get	()J
    //   3752: lstore_2
    //   3753: aload 22
    //   3755: getfield 1270	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$MCardNotificationLike:uint32_counter_total	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   3758: invokevirtual 615	com/tencent/mobileqq/pb/PBUInt32Field:has	()Z
    //   3761: ifeq +13 -> 3774
    //   3764: aload 22
    //   3766: getfield 1270	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$MCardNotificationLike:uint32_counter_total	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   3769: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   3772: istore 5
    //   3774: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   3777: ifeq +63 -> 3840
    //   3780: ldc_w 1232
    //   3783: iconst_2
    //   3784: new 80	java/lang/StringBuilder
    //   3787: dup
    //   3788: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   3791: ldc_w 1272
    //   3794: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3797: aload 21
    //   3799: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3802: ldc_w 1274
    //   3805: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3808: iload 5
    //   3810: invokevirtual 92	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   3813: ldc_w 1276
    //   3816: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3819: iload 4
    //   3821: invokevirtual 92	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   3824: ldc_w 1278
    //   3827: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3830: lload_2
    //   3831: invokevirtual 202	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   3834: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   3837: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   3840: aload_0
    //   3841: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   3844: bipush 70
    //   3846: invokevirtual 167	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   3849: checkcast 1280	com/tencent/mobileqq/dating/DatingProxyManager
    //   3852: astore 21
    //   3854: aload 21
    //   3856: ifnull +13 -> 3869
    //   3859: aload 21
    //   3861: invokevirtual 1283	com/tencent/mobileqq/dating/DatingProxyManager:a	()Lcom/tencent/mobileqq/dating/widget/VoteEventMgr;
    //   3864: aload 22
    //   3866: invokevirtual 1288	com/tencent/mobileqq/dating/widget/VoteEventMgr:a	(Ltencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$MCardNotificationLike;)V
    //   3869: aload_1
    //   3870: getfield 144	OnlinePushPack/MsgInfo:lFromUin	J
    //   3873: lstore_2
    //   3874: aload_1
    //   3875: getfield 176	OnlinePushPack/MsgInfo:shMsgSeq	S
    //   3878: istore 4
    //   3880: aload_1
    //   3881: getfield 216	OnlinePushPack/MsgInfo:lMsgUid	J
    //   3884: lstore 13
    //   3886: aload_1
    //   3887: getfield 141	OnlinePushPack/MsgInfo:shMsgType	S
    //   3890: istore 5
    //   3892: aload_0
    //   3893: getfield 519	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppMessageHandler	Lcom/tencent/mobileqq/app/MessageHandler;
    //   3896: lload_2
    //   3897: iload 4
    //   3899: lload 13
    //   3901: iload 5
    //   3903: invokestatic 1033	com/tencent/mobileqq/service/message/MessageProtoCodec:a	(Lcom/tencent/mobileqq/app/MessageHandler;JIJI)V
    //   3906: aconst_null
    //   3907: astore_1
    //   3908: goto -3688 -> 220
    //   3911: iload 4
    //   3913: sipush 2002
    //   3916: if_icmpne +372 -> 4288
    //   3919: aload 21
    //   3921: getfield 1292	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$ForwardBody:vip_info_notify	Ltencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$VipInfoNotify;
    //   3924: invokevirtual 1295	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$VipInfoNotify:has	()Z
    //   3927: ifeq +361 -> 4288
    //   3930: aload 21
    //   3932: getfield 1292	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$ForwardBody:vip_info_notify	Ltencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$VipInfoNotify;
    //   3935: invokevirtual 1296	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$VipInfoNotify:get	()Lcom/tencent/mobileqq/pb/MessageMicro;
    //   3938: checkcast 1294	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$VipInfoNotify
    //   3941: astore 22
    //   3943: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   3946: ifeq +33 -> 3979
    //   3949: ldc 63
    //   3951: iconst_2
    //   3952: new 80	java/lang/StringBuilder
    //   3955: dup
    //   3956: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   3959: ldc_w 1298
    //   3962: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3965: aload 22
    //   3967: invokevirtual 1299	java/lang/Object:toString	()Ljava/lang/String;
    //   3970: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3973: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   3976: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   3979: lconst_0
    //   3980: lstore_2
    //   3981: aload 22
    //   3983: getfield 1302	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$VipInfoNotify:uint64_uin	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   3986: invokevirtual 775	com/tencent/mobileqq/pb/PBUInt64Field:has	()Z
    //   3989: ifeq +12 -> 4001
    //   3992: aload 22
    //   3994: getfield 1302	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$VipInfoNotify:uint64_uin	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   3997: invokevirtual 553	com/tencent/mobileqq/pb/PBUInt64Field:get	()J
    //   4000: lstore_2
    //   4001: lload_2
    //   4002: invokestatic 827	java/lang/Long:toString	(J)Ljava/lang/String;
    //   4005: astore 21
    //   4007: aload 22
    //   4009: getfield 1305	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$VipInfoNotify:uint32_vip_identify	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   4012: invokevirtual 615	com/tencent/mobileqq/pb/PBUInt32Field:has	()Z
    //   4015: ifeq +5677 -> 9692
    //   4018: aload 22
    //   4020: getfield 1305	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$VipInfoNotify:uint32_vip_identify	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   4023: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   4026: istore 4
    //   4028: aload 22
    //   4030: getfield 1308	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$VipInfoNotify:uint32_vip_level	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   4033: invokevirtual 615	com/tencent/mobileqq/pb/PBUInt32Field:has	()Z
    //   4036: ifeq +5650 -> 9686
    //   4039: aload 22
    //   4041: getfield 1308	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$VipInfoNotify:uint32_vip_level	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   4044: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   4047: istore 5
    //   4049: iconst_m1
    //   4050: istore 6
    //   4052: iconst_m1
    //   4053: istore 7
    //   4055: aload 22
    //   4057: getfield 1311	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$VipInfoNotify:uint32_red_flag	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   4060: invokevirtual 615	com/tencent/mobileqq/pb/PBUInt32Field:has	()Z
    //   4063: ifeq +13 -> 4076
    //   4066: aload 22
    //   4068: getfield 1311	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$VipInfoNotify:uint32_red_flag	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   4071: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   4074: istore 6
    //   4076: aload 22
    //   4078: getfield 1314	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$VipInfoNotify:uint32_disable_red_envelope	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   4081: invokevirtual 615	com/tencent/mobileqq/pb/PBUInt32Field:has	()Z
    //   4084: ifeq +5647 -> 9731
    //   4087: aload 22
    //   4089: getfield 1314	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$VipInfoNotify:uint32_disable_red_envelope	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   4092: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   4095: istore 7
    //   4097: goto +5634 -> 9731
    //   4100: aload_0
    //   4101: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   4104: sipush 130
    //   4107: invokevirtual 167	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   4110: checkcast 1316	com/tencent/mobileqq/app/IndividualRedPacketManager
    //   4113: iload 6
    //   4115: iload 7
    //   4117: iconst_1
    //   4118: invokevirtual 1319	com/tencent/mobileqq/app/IndividualRedPacketManager:a	(IIZ)V
    //   4121: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   4124: ifeq +5620 -> 9744
    //   4127: ldc 63
    //   4129: iconst_2
    //   4130: new 80	java/lang/StringBuilder
    //   4133: dup
    //   4134: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   4137: ldc_w 1321
    //   4140: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4143: aload 21
    //   4145: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4148: ldc_w 1323
    //   4151: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4154: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4157: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   4160: goto +5584 -> 9744
    //   4163: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   4166: ifeq +41 -> 4207
    //   4169: ldc 63
    //   4171: iconst_2
    //   4172: new 80	java/lang/StringBuilder
    //   4175: dup
    //   4176: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   4179: ldc_w 1325
    //   4182: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4185: iload 4
    //   4187: invokevirtual 92	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   4190: ldc_w 1327
    //   4193: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4196: iload 5
    //   4198: invokevirtual 92	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   4201: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4204: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   4207: aload_0
    //   4208: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   4211: iconst_2
    //   4212: invokevirtual 167	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   4215: checkcast 1329	mqq/manager/TicketManager
    //   4218: aload 21
    //   4220: invokeinterface 1332 2 0
    //   4225: astore 22
    //   4227: aload_0
    //   4228: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   4231: bipush 27
    //   4233: invokevirtual 48	com/tencent/mobileqq/app/QQAppInterface:a	(I)Lcom/tencent/mobileqq/app/BusinessHandler;
    //   4236: checkcast 1334	com/tencent/mobileqq/app/VipInfoHandler
    //   4239: aload 22
    //   4241: aload 21
    //   4243: invokevirtual 1337	com/tencent/mobileqq/app/VipInfoHandler:a	(Ljava/lang/String;Ljava/lang/String;)V
    //   4246: goto -377 -> 3869
    //   4249: astore_1
    //   4250: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   4253: ifeq +30 -> 4283
    //   4256: ldc_w 1232
    //   4259: iconst_2
    //   4260: new 80	java/lang/StringBuilder
    //   4263: dup
    //   4264: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   4267: ldc_w 1339
    //   4270: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4273: aload_1
    //   4274: invokevirtual 1342	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   4277: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4280: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   4283: aconst_null
    //   4284: astore_1
    //   4285: goto -4065 -> 220
    //   4288: iload 4
    //   4290: sipush 2003
    //   4293: if_icmpne -424 -> 3869
    //   4296: aload 21
    //   4298: getfield 1346	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$ForwardBody:msg_push_lost_dev_found	Ltencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$PushLostDevFound;
    //   4301: invokevirtual 1349	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$PushLostDevFound:has	()Z
    //   4304: ifeq -435 -> 3869
    //   4307: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   4310: ifeq +13 -> 4323
    //   4313: ldc_w 1351
    //   4316: iconst_2
    //   4317: ldc_w 1353
    //   4320: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   4323: aload 21
    //   4325: getfield 1346	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$ForwardBody:msg_push_lost_dev_found	Ltencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$PushLostDevFound;
    //   4328: invokevirtual 1354	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$PushLostDevFound:get	()Lcom/tencent/mobileqq/pb/MessageMicro;
    //   4331: checkcast 1348	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$PushLostDevFound
    //   4334: astore 21
    //   4336: new 1356	android/os/Bundle
    //   4339: dup
    //   4340: invokespecial 1357	android/os/Bundle:<init>	()V
    //   4343: astore 22
    //   4345: aload 21
    //   4347: getfield 1360	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$PushLostDevFound:uint32_msg_type	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   4350: invokevirtual 615	com/tencent/mobileqq/pb/PBUInt32Field:has	()Z
    //   4353: ifeq +19 -> 4372
    //   4356: aload 22
    //   4358: ldc_w 1362
    //   4361: aload 21
    //   4363: getfield 1360	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$PushLostDevFound:uint32_msg_type	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   4366: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   4369: invokevirtual 1366	android/os/Bundle:putInt	(Ljava/lang/String;I)V
    //   4372: aload 21
    //   4374: getfield 1369	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$PushLostDevFound:uint32_dev_time	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   4377: invokevirtual 615	com/tencent/mobileqq/pb/PBUInt32Field:has	()Z
    //   4380: ifeq +19 -> 4399
    //   4383: aload 22
    //   4385: ldc_w 1371
    //   4388: aload 21
    //   4390: getfield 1369	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$PushLostDevFound:uint32_dev_time	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   4393: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   4396: invokevirtual 1366	android/os/Bundle:putInt	(Ljava/lang/String;I)V
    //   4399: aload 21
    //   4401: getfield 1374	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$PushLostDevFound:uint64_din	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   4404: invokevirtual 775	com/tencent/mobileqq/pb/PBUInt64Field:has	()Z
    //   4407: ifeq +19 -> 4426
    //   4410: aload 22
    //   4412: ldc_w 1376
    //   4415: aload 21
    //   4417: getfield 1374	tencent/im/s2c/msgtype0x210/submsgtype0x6f/SubMsgType0x6f$PushLostDevFound:uint64_din	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   4420: invokevirtual 553	com/tencent/mobileqq/pb/PBUInt64Field:get	()J
    //   4423: invokevirtual 1380	android/os/Bundle:putLong	(Ljava/lang/String;J)V
    //   4426: aload_0
    //   4427: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   4430: bipush 51
    //   4432: invokevirtual 48	com/tencent/mobileqq/app/QQAppInterface:a	(I)Lcom/tencent/mobileqq/app/BusinessHandler;
    //   4435: checkcast 1382	com/tencent/device/devicemgr/SmartDeviceProxyMgr
    //   4438: bipush 111
    //   4440: aload 22
    //   4442: invokevirtual 1385	com/tencent/device/devicemgr/SmartDeviceProxyMgr:a	(ILandroid/os/Bundle;)V
    //   4445: goto -576 -> 3869
    //   4448: aload 25
    //   4450: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   4453: ldc2_w 1386
    //   4456: lcmp
    //   4457: ifne +160 -> 4617
    //   4460: new 1389	tencent/im/s2c/msgtype0x210/submsgtype0x78/submsgtype0x78$MsgBody
    //   4463: dup
    //   4464: invokespecial 1390	tencent/im/s2c/msgtype0x210/submsgtype0x78/submsgtype0x78$MsgBody:<init>	()V
    //   4467: astore_1
    //   4468: aload_1
    //   4469: aload 25
    //   4471: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   4474: invokevirtual 1391	tencent/im/s2c/msgtype0x210/submsgtype0x78/submsgtype0x78$MsgBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   4477: pop
    //   4478: aload_1
    //   4479: getfield 1394	tencent/im/s2c/msgtype0x210/submsgtype0x78/submsgtype0x78$MsgBody:uint32_type	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   4482: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   4485: istore 4
    //   4487: iload 4
    //   4489: sipush 1002
    //   4492: if_icmpne +60 -> 4552
    //   4495: aload_0
    //   4496: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   4499: bipush 78
    //   4501: invokevirtual 167	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   4504: checkcast 1396	com/tencent/mobileqq/portal/PortalManager
    //   4507: astore 21
    //   4509: aload 21
    //   4511: ifnull +9 -> 4520
    //   4514: aload 21
    //   4516: aload_1
    //   4517: invokevirtual 1399	com/tencent/mobileqq/portal/PortalManager:a	(Ltencent/im/s2c/msgtype0x210/submsgtype0x78/submsgtype0x78$MsgBody;)V
    //   4520: aconst_null
    //   4521: astore_1
    //   4522: goto -4302 -> 220
    //   4525: astore_1
    //   4526: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   4529: ifeq +14 -> 4543
    //   4532: ldc_w 1401
    //   4535: iconst_2
    //   4536: ldc_w 391
    //   4539: aload_1
    //   4540: invokestatic 1403	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   4543: new 1405	java/lang/RuntimeException
    //   4546: dup
    //   4547: aload_1
    //   4548: invokespecial 1408	java/lang/RuntimeException:<init>	(Ljava/lang/Throwable;)V
    //   4551: athrow
    //   4552: iload 4
    //   4554: bipush 49
    //   4556: if_icmpne +27 -> 4583
    //   4559: aload_0
    //   4560: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   4563: aload_0
    //   4564: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   4567: invokevirtual 567	com/tencent/mobileqq/app/QQAppInterface:a	()Ljava/lang/String;
    //   4570: aload_1
    //   4571: getfield 1411	tencent/im/s2c/msgtype0x210/submsgtype0x78/submsgtype0x78$MsgBody:uint32_version	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   4574: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   4577: invokestatic 1416	com/tencent/mobileqq/config/splashlogo/ConfigServlet:a	(Lcom/tencent/mobileqq/app/QQAppInterface;Ljava/lang/String;I)V
    //   4580: goto -60 -> 4520
    //   4583: iload 4
    //   4585: bipush 46
    //   4587: if_icmpne -67 -> 4520
    //   4590: aload_0
    //   4591: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   4594: aload_0
    //   4595: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   4598: invokevirtual 567	com/tencent/mobileqq/app/QQAppInterface:a	()Ljava/lang/String;
    //   4601: aload_1
    //   4602: getfield 1411	tencent/im/s2c/msgtype0x210/submsgtype0x78/submsgtype0x78$MsgBody:uint32_version	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   4605: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   4608: ldc_w 1418
    //   4611: invokestatic 1421	com/tencent/mobileqq/config/splashlogo/ConfigServlet:a	(Lcom/tencent/mobileqq/app/QQAppInterface;Ljava/lang/String;ILjava/lang/String;)V
    //   4614: goto -94 -> 4520
    //   4617: aload 25
    //   4619: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   4622: ldc2_w 1422
    //   4625: lcmp
    //   4626: ifne +39 -> 4665
    //   4629: aload_0
    //   4630: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   4633: bipush 35
    //   4635: invokevirtual 167	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   4638: checkcast 1425	com/tencent/mobileqq/redtouch/RedTouchManager
    //   4641: aload 25
    //   4643: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   4646: invokevirtual 1428	com/tencent/mobileqq/redtouch/RedTouchManager:a	([B)Z
    //   4649: ifeq +11 -> 4660
    //   4652: aload_0
    //   4653: bipush 113
    //   4655: iconst_1
    //   4656: aconst_null
    //   4657: invokevirtual 990	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:a	(IZLjava/lang/Object;)V
    //   4660: aconst_null
    //   4661: astore_1
    //   4662: goto -4442 -> 220
    //   4665: aload 25
    //   4667: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   4670: ldc2_w 1429
    //   4673: lcmp
    //   4674: ifne +28 -> 4702
    //   4677: aload_0
    //   4678: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   4681: bipush 63
    //   4683: invokevirtual 167	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   4686: checkcast 1432	com/tencent/mobileqq/redtouch/NumRedPointManager
    //   4689: aload 25
    //   4691: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   4694: invokevirtual 1433	com/tencent/mobileqq/redtouch/NumRedPointManager:a	([B)V
    //   4697: aconst_null
    //   4698: astore_1
    //   4699: goto -4479 -> 220
    //   4702: aload 25
    //   4704: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   4707: ldc2_w 1434
    //   4710: lcmp
    //   4711: ifne +131 -> 4842
    //   4714: aload_0
    //   4715: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   4718: bipush 84
    //   4720: invokevirtual 167	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   4723: checkcast 1437	com/tencent/mobileqq/app/activateFriends/ActivateFriendsManager
    //   4726: aload_1
    //   4727: getfield 176	OnlinePushPack/MsgInfo:shMsgSeq	S
    //   4730: invokevirtual 1438	com/tencent/mobileqq/app/activateFriends/ActivateFriendsManager:a	(I)Z
    //   4733: ifeq +80 -> 4813
    //   4736: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   4739: ifeq +32 -> 4771
    //   4742: ldc 63
    //   4744: iconst_2
    //   4745: new 80	java/lang/StringBuilder
    //   4748: dup
    //   4749: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   4752: ldc_w 1440
    //   4755: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4758: aload_1
    //   4759: getfield 176	OnlinePushPack/MsgInfo:shMsgSeq	S
    //   4762: invokevirtual 92	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   4765: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4768: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   4771: aload_1
    //   4772: getfield 144	OnlinePushPack/MsgInfo:lFromUin	J
    //   4775: lstore_2
    //   4776: aload_1
    //   4777: getfield 176	OnlinePushPack/MsgInfo:shMsgSeq	S
    //   4780: istore 4
    //   4782: aload_1
    //   4783: getfield 216	OnlinePushPack/MsgInfo:lMsgUid	J
    //   4786: lstore 13
    //   4788: aload_1
    //   4789: getfield 141	OnlinePushPack/MsgInfo:shMsgType	S
    //   4792: istore 5
    //   4794: aload_0
    //   4795: getfield 519	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppMessageHandler	Lcom/tencent/mobileqq/app/MessageHandler;
    //   4798: lload_2
    //   4799: iload 4
    //   4801: lload 13
    //   4803: iload 5
    //   4805: invokestatic 1033	com/tencent/mobileqq/service/message/MessageProtoCodec:a	(Lcom/tencent/mobileqq/app/MessageHandler;JIJI)V
    //   4808: aconst_null
    //   4809: astore_1
    //   4810: goto -4590 -> 220
    //   4813: aload_0
    //   4814: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   4817: aload 25
    //   4819: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   4822: invokestatic 1441	com/tencent/mobileqq/service/message/MessageProtoCodec:a	(Lcom/tencent/mobileqq/app/QQAppInterface;[B)Z
    //   4825: ifeq -54 -> 4771
    //   4828: aload_0
    //   4829: ldc_w 1443
    //   4832: iconst_1
    //   4833: iconst_1
    //   4834: iconst_1
    //   4835: iconst_0
    //   4836: invokevirtual 525	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:a	(Ljava/lang/String;ZIZZ)V
    //   4839: goto -68 -> 4771
    //   4842: aload 25
    //   4844: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   4847: ldc2_w 1444
    //   4850: lcmp
    //   4851: ifne +28 -> 4879
    //   4854: aload_0
    //   4855: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   4858: bipush 47
    //   4860: invokevirtual 48	com/tencent/mobileqq/app/QQAppInterface:a	(I)Lcom/tencent/mobileqq/app/BusinessHandler;
    //   4863: checkcast 1447	com/tencent/mobileqq/app/QPayHandler
    //   4866: aload 25
    //   4868: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   4871: invokevirtual 1448	com/tencent/mobileqq/app/QPayHandler:a	([B)V
    //   4874: aconst_null
    //   4875: astore_1
    //   4876: goto -4656 -> 220
    //   4879: aload 25
    //   4881: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   4884: ldc2_w 1449
    //   4887: lcmp
    //   4888: ifne +294 -> 5182
    //   4891: invokestatic 1453	com/tencent/qphone/base/util/QLog:isDevelopLevel	()Z
    //   4894: ifeq +70 -> 4964
    //   4897: new 80	java/lang/StringBuilder
    //   4900: dup
    //   4901: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   4904: getstatic 1457	cooperation/qzone/util/QZoneLogTags:b	Ljava/lang/String;
    //   4907: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4910: getstatic 1459	cooperation/qzone/util/QZoneLogTags:e	Ljava/lang/String;
    //   4913: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4916: ldc 63
    //   4918: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4921: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4924: iconst_4
    //   4925: new 80	java/lang/StringBuilder
    //   4928: dup
    //   4929: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   4932: ldc_w 1461
    //   4935: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4938: aload_1
    //   4939: getfield 176	OnlinePushPack/MsgInfo:shMsgSeq	S
    //   4942: invokevirtual 92	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   4945: ldc_w 1463
    //   4948: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4951: aload_1
    //   4952: getfield 141	OnlinePushPack/MsgInfo:shMsgType	S
    //   4955: invokevirtual 92	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   4958: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4961: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   4964: new 1465	tencent/im/c2c/msgtype0x210/submsgtype0x79/submsgtype0x79$MsgBody
    //   4967: dup
    //   4968: invokespecial 1466	tencent/im/c2c/msgtype0x210/submsgtype0x79/submsgtype0x79$MsgBody:<init>	()V
    //   4971: astore_1
    //   4972: aload_1
    //   4973: aload 25
    //   4975: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   4978: invokevirtual 1467	tencent/im/c2c/msgtype0x210/submsgtype0x79/submsgtype0x79$MsgBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   4981: pop
    //   4982: aload_1
    //   4983: getfield 1470	tencent/im/c2c/msgtype0x210/submsgtype0x79/submsgtype0x79$MsgBody:uint32_src_app_id	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   4986: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   4989: pop
    //   4990: aload_1
    //   4991: getfield 1473	tencent/im/c2c/msgtype0x210/submsgtype0x79/submsgtype0x79$MsgBody:uint32_undeal_count	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   4994: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   4997: istore 4
    //   4999: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   5002: ifeq +55 -> 5057
    //   5005: new 80	java/lang/StringBuilder
    //   5008: dup
    //   5009: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   5012: getstatic 1457	cooperation/qzone/util/QZoneLogTags:b	Ljava/lang/String;
    //   5015: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5018: getstatic 1459	cooperation/qzone/util/QZoneLogTags:e	Ljava/lang/String;
    //   5021: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5024: ldc 63
    //   5026: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5029: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   5032: iconst_2
    //   5033: new 80	java/lang/StringBuilder
    //   5036: dup
    //   5037: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   5040: ldc_w 1475
    //   5043: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5046: iload 4
    //   5048: invokevirtual 92	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   5051: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   5054: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   5057: ldc_w 1477
    //   5060: iconst_m1
    //   5061: aload_0
    //   5062: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   5065: invokevirtual 1480	com/tencent/mobileqq/app/QQAppInterface:getLongAccountUin	()J
    //   5068: invokestatic 1485	cooperation/qzone/LocalMultiProcConfig:a	(Ljava/lang/String;IJ)I
    //   5071: istore 5
    //   5073: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   5076: ifeq +52 -> 5128
    //   5079: ldc 63
    //   5081: iconst_2
    //   5082: new 80	java/lang/StringBuilder
    //   5085: dup
    //   5086: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   5089: ldc_w 1487
    //   5092: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5095: aload_0
    //   5096: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   5099: invokevirtual 1480	com/tencent/mobileqq/app/QQAppInterface:getLongAccountUin	()J
    //   5102: invokevirtual 202	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   5105: ldc_w 1489
    //   5108: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5111: ldc_w 1491
    //   5114: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5117: iload 5
    //   5119: invokevirtual 92	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   5122: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   5125: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   5128: iload 5
    //   5130: iconst_1
    //   5131: if_icmpne +36 -> 5167
    //   5134: aload_0
    //   5135: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   5138: bipush 9
    //   5140: invokevirtual 167	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   5143: checkcast 1493	com/tencent/mobileqq/servlet/QZoneManagerImp
    //   5146: bipush 17
    //   5148: iload 4
    //   5150: i2l
    //   5151: aload_0
    //   5152: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   5155: invokevirtual 1480	com/tencent/mobileqq/app/QQAppInterface:getLongAccountUin	()J
    //   5158: ldc_w 391
    //   5161: iconst_0
    //   5162: iconst_1
    //   5163: invokevirtual 1496	com/tencent/mobileqq/servlet/QZoneManagerImp:a	(IJJLjava/lang/String;ZZ)Z
    //   5166: pop
    //   5167: aconst_null
    //   5168: astore_1
    //   5169: goto -4949 -> 220
    //   5172: astore_1
    //   5173: aload_1
    //   5174: invokevirtual 908	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException:printStackTrace	()V
    //   5177: aconst_null
    //   5178: astore_1
    //   5179: goto -4959 -> 220
    //   5182: aload 25
    //   5184: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   5187: ldc2_w 1497
    //   5190: lcmp
    //   5191: ifne +110 -> 5301
    //   5194: invokestatic 1453	com/tencent/qphone/base/util/QLog:isDevelopLevel	()Z
    //   5197: ifeq +45 -> 5242
    //   5200: ldc 63
    //   5202: iconst_4
    //   5203: new 80	java/lang/StringBuilder
    //   5206: dup
    //   5207: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   5210: ldc_w 1500
    //   5213: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5216: aload_1
    //   5217: getfield 176	OnlinePushPack/MsgInfo:shMsgSeq	S
    //   5220: invokevirtual 92	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   5223: ldc_w 1463
    //   5226: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5229: aload_1
    //   5230: getfield 141	OnlinePushPack/MsgInfo:shMsgType	S
    //   5233: invokevirtual 92	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   5236: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   5239: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   5242: new 1502	tencent/im/s2c/msgtype0x210/submsgtype0x7a/submsgtype0x7a$MsgBody
    //   5245: dup
    //   5246: invokespecial 1503	tencent/im/s2c/msgtype0x210/submsgtype0x7a/submsgtype0x7a$MsgBody:<init>	()V
    //   5249: astore_1
    //   5250: aload_1
    //   5251: aload 25
    //   5253: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   5256: invokevirtual 1504	tencent/im/s2c/msgtype0x210/submsgtype0x7a/submsgtype0x7a$MsgBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   5259: pop
    //   5260: aload_0
    //   5261: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   5264: bipush 61
    //   5266: invokevirtual 48	com/tencent/mobileqq/app/QQAppInterface:a	(I)Lcom/tencent/mobileqq/app/BusinessHandler;
    //   5269: checkcast 1506	com/tencent/arrange/op/ArrangeHandler
    //   5272: aload_1
    //   5273: invokevirtual 1509	com/tencent/arrange/op/ArrangeHandler:a	(Ltencent/im/s2c/msgtype0x210/submsgtype0x7a/submsgtype0x7a$MsgBody;)V
    //   5276: aconst_null
    //   5277: astore_1
    //   5278: goto -5058 -> 220
    //   5281: astore_1
    //   5282: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   5285: ifeq -9 -> 5276
    //   5288: ldc 63
    //   5290: iconst_2
    //   5291: ldc_w 1511
    //   5294: aload_1
    //   5295: invokestatic 761	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   5298: goto -22 -> 5276
    //   5301: aload 25
    //   5303: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   5306: ldc2_w 1512
    //   5309: lcmp
    //   5310: ifne +136 -> 5446
    //   5313: invokestatic 1453	com/tencent/qphone/base/util/QLog:isDevelopLevel	()Z
    //   5316: ifeq +45 -> 5361
    //   5319: ldc 63
    //   5321: iconst_4
    //   5322: new 80	java/lang/StringBuilder
    //   5325: dup
    //   5326: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   5329: ldc_w 1515
    //   5332: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5335: aload_1
    //   5336: getfield 176	OnlinePushPack/MsgInfo:shMsgSeq	S
    //   5339: invokevirtual 92	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   5342: ldc_w 1463
    //   5345: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5348: aload_1
    //   5349: getfield 141	OnlinePushPack/MsgInfo:shMsgType	S
    //   5352: invokevirtual 92	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   5355: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   5358: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   5361: new 1517	tencent/im/s2c/msgtype0x210/submsgtype0x7c/submsgtype0x7c$MsgBody
    //   5364: dup
    //   5365: invokespecial 1518	tencent/im/s2c/msgtype0x210/submsgtype0x7c/submsgtype0x7c$MsgBody:<init>	()V
    //   5368: astore_1
    //   5369: aload_1
    //   5370: aload 25
    //   5372: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   5375: invokevirtual 1519	tencent/im/s2c/msgtype0x210/submsgtype0x7c/submsgtype0x7c$MsgBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   5378: pop
    //   5379: aload_1
    //   5380: getfield 1520	tencent/im/s2c/msgtype0x210/submsgtype0x7c/submsgtype0x7c$MsgBody:uint64_uin	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   5383: invokevirtual 553	com/tencent/mobileqq/pb/PBUInt64Field:get	()J
    //   5386: lstore_2
    //   5387: aload_0
    //   5388: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   5391: invokevirtual 567	com/tencent/mobileqq/app/QQAppInterface:a	()Ljava/lang/String;
    //   5394: lload_2
    //   5395: invokestatic 192	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   5398: invokevirtual 597	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   5401: ifeq +20 -> 5421
    //   5404: aload_0
    //   5405: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   5408: bipush 93
    //   5410: invokevirtual 167	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   5413: checkcast 1522	com/tencent/mobileqq/secspy/SecSpyFileManager
    //   5416: aload_1
    //   5417: iconst_3
    //   5418: invokevirtual 1525	com/tencent/mobileqq/secspy/SecSpyFileManager:a	(Ltencent/im/s2c/msgtype0x210/submsgtype0x7c/submsgtype0x7c$MsgBody;I)V
    //   5421: aconst_null
    //   5422: astore_1
    //   5423: goto -5203 -> 220
    //   5426: astore_1
    //   5427: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   5430: ifeq -9 -> 5421
    //   5433: ldc 63
    //   5435: iconst_2
    //   5436: ldc_w 1527
    //   5439: aload_1
    //   5440: invokestatic 761	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   5443: goto -22 -> 5421
    //   5446: aload 25
    //   5448: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   5451: ldc2_w 1528
    //   5454: lcmp
    //   5455: ifne +168 -> 5623
    //   5458: invokestatic 1453	com/tencent/qphone/base/util/QLog:isDevelopLevel	()Z
    //   5461: ifeq +45 -> 5506
    //   5464: ldc 63
    //   5466: iconst_4
    //   5467: new 80	java/lang/StringBuilder
    //   5470: dup
    //   5471: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   5474: ldc_w 1531
    //   5477: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5480: aload_1
    //   5481: getfield 176	OnlinePushPack/MsgInfo:shMsgSeq	S
    //   5484: invokevirtual 92	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   5487: ldc_w 1463
    //   5490: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5493: aload_1
    //   5494: getfield 141	OnlinePushPack/MsgInfo:shMsgType	S
    //   5497: invokevirtual 92	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   5500: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   5503: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   5506: new 1533	tencent/im/s2c/msgtype0x210/submsgtype0x86/SubMsgType0x86$MsgBody
    //   5509: dup
    //   5510: invokespecial 1534	tencent/im/s2c/msgtype0x210/submsgtype0x86/SubMsgType0x86$MsgBody:<init>	()V
    //   5513: astore_1
    //   5514: aload_1
    //   5515: aload 25
    //   5517: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   5520: invokevirtual 1535	tencent/im/s2c/msgtype0x210/submsgtype0x86/SubMsgType0x86$MsgBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   5523: pop
    //   5524: aload_1
    //   5525: ifnull +67 -> 5592
    //   5528: aload_1
    //   5529: getfield 1538	tencent/im/s2c/msgtype0x210/submsgtype0x86/SubMsgType0x86$MsgBody:uint32_notify_flag	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   5532: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   5535: iconst_1
    //   5536: if_icmpne +61 -> 5597
    //   5539: iconst_1
    //   5540: istore 15
    //   5542: iload 15
    //   5544: iconst_1
    //   5545: if_icmpne +47 -> 5592
    //   5548: new 106	java/lang/String
    //   5551: dup
    //   5552: aload_1
    //   5553: getfield 1541	tencent/im/s2c/msgtype0x210/submsgtype0x86/SubMsgType0x86$MsgBody:bytes_notify_wording	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   5556: invokevirtual 589	com/tencent/mobileqq/pb/PBBytesField:get	()Lcom/tencent/mobileqq/pb/ByteStringMicro;
    //   5559: invokevirtual 1005	com/tencent/mobileqq/pb/ByteStringMicro:toByteArray	()[B
    //   5562: ldc_w 347
    //   5565: invokespecial 350	java/lang/String:<init>	([BLjava/lang/String;)V
    //   5568: astore_1
    //   5569: aload_0
    //   5570: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   5573: iload 15
    //   5575: aload_1
    //   5576: invokestatic 1546	com/tencent/mobileqq/qcall/QCallFacade:a	(Lcom/tencent/mobileqq/app/QQAppInterface;ZLjava/lang/String;)V
    //   5579: aload_0
    //   5580: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   5583: invokevirtual 1549	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/av/gaudio/AVNotifyCenter;
    //   5586: iload 15
    //   5588: aload_1
    //   5589: invokevirtual 1554	com/tencent/av/gaudio/AVNotifyCenter:a	(ZLjava/lang/String;)V
    //   5592: aconst_null
    //   5593: astore_1
    //   5594: goto -5374 -> 220
    //   5597: iconst_0
    //   5598: istore 15
    //   5600: goto -58 -> 5542
    //   5603: astore_1
    //   5604: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   5607: ifeq -15 -> 5592
    //   5610: ldc 63
    //   5612: iconst_2
    //   5613: ldc_w 1556
    //   5616: aload_1
    //   5617: invokestatic 761	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   5620: goto -28 -> 5592
    //   5623: aload 25
    //   5625: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   5628: ldc2_w 1557
    //   5631: lcmp
    //   5632: ifne +266 -> 5898
    //   5635: new 1560	tencent/im/s2c/msgtype0x210/submsgtype0x85/SubMsgType0x85$MsgBody
    //   5638: dup
    //   5639: invokespecial 1561	tencent/im/s2c/msgtype0x210/submsgtype0x85/SubMsgType0x85$MsgBody:<init>	()V
    //   5642: astore 21
    //   5644: sipush 63507
    //   5647: invokestatic 247	com/tencent/mobileqq/service/message/MessageRecordFactory:a	(I)Lcom/tencent/mobileqq/data/MessageRecord;
    //   5650: checkcast 1563	com/tencent/mobileqq/data/MessageForQQWalletTips
    //   5653: astore 22
    //   5655: aload 21
    //   5657: aload 25
    //   5659: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   5662: invokevirtual 1564	tencent/im/s2c/msgtype0x210/submsgtype0x85/SubMsgType0x85$MsgBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   5665: pop
    //   5666: aload 22
    //   5668: new 80	java/lang/StringBuilder
    //   5671: dup
    //   5672: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   5675: aload 21
    //   5677: getfield 1567	tencent/im/s2c/msgtype0x210/submsgtype0x85/SubMsgType0x85$MsgBody:uint64_sender_uin	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   5680: invokevirtual 553	com/tencent/mobileqq/pb/PBUInt64Field:get	()J
    //   5683: invokevirtual 202	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   5686: ldc_w 391
    //   5689: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5692: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   5695: putfield 1570	com/tencent/mobileqq/data/MessageForQQWalletTips:senderUin	Ljava/lang/String;
    //   5698: aload 22
    //   5700: new 80	java/lang/StringBuilder
    //   5703: dup
    //   5704: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   5707: aload 21
    //   5709: getfield 1573	tencent/im/s2c/msgtype0x210/submsgtype0x85/SubMsgType0x85$MsgBody:uint64_receiver_uin	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   5712: invokevirtual 553	com/tencent/mobileqq/pb/PBUInt64Field:get	()J
    //   5715: invokevirtual 202	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   5718: ldc_w 391
    //   5721: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5724: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   5727: putfield 1576	com/tencent/mobileqq/data/MessageForQQWalletTips:reciverUin	Ljava/lang/String;
    //   5730: aload 22
    //   5732: aload 21
    //   5734: getfield 1579	tencent/im/s2c/msgtype0x210/submsgtype0x85/SubMsgType0x85$MsgBody:bytes_sender_rich_content	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   5737: invokevirtual 589	com/tencent/mobileqq/pb/PBBytesField:get	()Lcom/tencent/mobileqq/pb/ByteStringMicro;
    //   5740: invokevirtual 594	com/tencent/mobileqq/pb/ByteStringMicro:toStringUtf8	()Ljava/lang/String;
    //   5743: putfield 1582	com/tencent/mobileqq/data/MessageForQQWalletTips:senderContent	Ljava/lang/String;
    //   5746: aload 22
    //   5748: aload 21
    //   5750: getfield 1585	tencent/im/s2c/msgtype0x210/submsgtype0x85/SubMsgType0x85$MsgBody:bytes_receiver_rich_content	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   5753: invokevirtual 589	com/tencent/mobileqq/pb/PBBytesField:get	()Lcom/tencent/mobileqq/pb/ByteStringMicro;
    //   5756: invokevirtual 594	com/tencent/mobileqq/pb/ByteStringMicro:toStringUtf8	()Ljava/lang/String;
    //   5759: putfield 1588	com/tencent/mobileqq/data/MessageForQQWalletTips:reciverContent	Ljava/lang/String;
    //   5762: aload 22
    //   5764: aload 21
    //   5766: getfield 1591	tencent/im/s2c/msgtype0x210/submsgtype0x85/SubMsgType0x85$MsgBody:bytes_authkey	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   5769: invokevirtual 589	com/tencent/mobileqq/pb/PBBytesField:get	()Lcom/tencent/mobileqq/pb/ByteStringMicro;
    //   5772: invokevirtual 594	com/tencent/mobileqq/pb/ByteStringMicro:toStringUtf8	()Ljava/lang/String;
    //   5775: putfield 1594	com/tencent/mobileqq/data/MessageForQQWalletTips:authKey	Ljava/lang/String;
    //   5778: aload_0
    //   5779: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   5782: invokevirtual 567	com/tencent/mobileqq/app/QQAppInterface:a	()Ljava/lang/String;
    //   5785: astore 23
    //   5787: aload_0
    //   5788: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   5791: invokevirtual 567	com/tencent/mobileqq/app/QQAppInterface:a	()Ljava/lang/String;
    //   5794: aload 22
    //   5796: getfield 1570	com/tencent/mobileqq/data/MessageForQQWalletTips:senderUin	Ljava/lang/String;
    //   5799: invokevirtual 597	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   5802: ifeq +86 -> 5888
    //   5805: aload 22
    //   5807: getfield 1576	com/tencent/mobileqq/data/MessageForQQWalletTips:reciverUin	Ljava/lang/String;
    //   5810: astore 21
    //   5812: aload 22
    //   5814: aload 23
    //   5816: aload 21
    //   5818: ldc_w 391
    //   5821: ldc_w 1596
    //   5824: aload_1
    //   5825: invokevirtual 1599	OnlinePushPack/MsgInfo:getUMsgTime	()J
    //   5828: sipush 63507
    //   5831: iconst_0
    //   5832: aload_1
    //   5833: invokevirtual 1603	OnlinePushPack/MsgInfo:getShMsgSeq	()S
    //   5836: i2l
    //   5837: invokevirtual 1604	com/tencent/mobileqq/data/MessageForQQWalletTips:init	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JIIJ)V
    //   5840: aload 22
    //   5842: iconst_1
    //   5843: putfield 1605	com/tencent/mobileqq/data/MessageForQQWalletTips:isread	Z
    //   5846: aload 22
    //   5848: aload_1
    //   5849: getfield 176	OnlinePushPack/MsgInfo:shMsgSeq	S
    //   5852: i2l
    //   5853: putfield 1606	com/tencent/mobileqq/data/MessageForQQWalletTips:shmsgseq	J
    //   5856: aload 22
    //   5858: aload_1
    //   5859: getfield 216	OnlinePushPack/MsgInfo:lMsgUid	J
    //   5862: putfield 1607	com/tencent/mobileqq/data/MessageForQQWalletTips:msgUid	J
    //   5865: aload 22
    //   5867: invokevirtual 1610	com/tencent/mobileqq/data/MessageForQQWalletTips:getBytes	()[B
    //   5870: pop
    //   5871: aload 22
    //   5873: astore_1
    //   5874: goto -5654 -> 220
    //   5877: astore_1
    //   5878: aload_1
    //   5879: invokevirtual 325	java/lang/Exception:printStackTrace	()V
    //   5882: aload 22
    //   5884: astore_1
    //   5885: goto -5665 -> 220
    //   5888: aload 22
    //   5890: getfield 1570	com/tencent/mobileqq/data/MessageForQQWalletTips:senderUin	Ljava/lang/String;
    //   5893: astore 21
    //   5895: goto -83 -> 5812
    //   5898: aload 25
    //   5900: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   5903: ldc2_w 1611
    //   5906: lcmp
    //   5907: ifne +363 -> 6270
    //   5910: new 1614	tencent/im/s2c/msgtype0x210/submsgtype0x9f/MsgBody
    //   5913: dup
    //   5914: invokespecial 1615	tencent/im/s2c/msgtype0x210/submsgtype0x9f/MsgBody:<init>	()V
    //   5917: astore 24
    //   5919: sipush 63507
    //   5922: invokestatic 247	com/tencent/mobileqq/service/message/MessageRecordFactory:a	(I)Lcom/tencent/mobileqq/data/MessageRecord;
    //   5925: checkcast 1563	com/tencent/mobileqq/data/MessageForQQWalletTips
    //   5928: astore 23
    //   5930: aload 24
    //   5932: aload 25
    //   5934: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   5937: invokevirtual 1616	tencent/im/s2c/msgtype0x210/submsgtype0x9f/MsgBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   5940: pop
    //   5941: iconst_0
    //   5942: istore 5
    //   5944: ldc_w 391
    //   5947: astore 22
    //   5949: aload 22
    //   5951: astore 21
    //   5953: iload 5
    //   5955: istore 4
    //   5957: aload 24
    //   5959: getfield 1620	tencent/im/s2c/msgtype0x210/submsgtype0x9f/MsgBody:sint32_sessiontype	Lcom/tencent/mobileqq/pb/PBSInt32Field;
    //   5962: invokevirtual 1623	com/tencent/mobileqq/pb/PBSInt32Field:get	()I
    //   5965: tableswitch	default:+3792->9757, 3:+253->6218, 4:+274->6239, 5:+31->5996, 6:+3803->9768
    //   5996: aload 23
    //   5998: new 80	java/lang/StringBuilder
    //   6001: dup
    //   6002: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   6005: aload 24
    //   6007: getfield 1624	tencent/im/s2c/msgtype0x210/submsgtype0x9f/MsgBody:uint64_sender_uin	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   6010: invokevirtual 553	com/tencent/mobileqq/pb/PBUInt64Field:get	()J
    //   6013: invokevirtual 202	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   6016: ldc_w 391
    //   6019: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   6022: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   6025: putfield 1570	com/tencent/mobileqq/data/MessageForQQWalletTips:senderUin	Ljava/lang/String;
    //   6028: aload 23
    //   6030: new 80	java/lang/StringBuilder
    //   6033: dup
    //   6034: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   6037: aload 24
    //   6039: getfield 1625	tencent/im/s2c/msgtype0x210/submsgtype0x9f/MsgBody:uint64_receiver_uin	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   6042: invokevirtual 553	com/tencent/mobileqq/pb/PBUInt64Field:get	()J
    //   6045: invokevirtual 202	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   6048: ldc_w 391
    //   6051: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   6054: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   6057: putfield 1576	com/tencent/mobileqq/data/MessageForQQWalletTips:reciverUin	Ljava/lang/String;
    //   6060: aload 23
    //   6062: aload 24
    //   6064: getfield 1626	tencent/im/s2c/msgtype0x210/submsgtype0x9f/MsgBody:bytes_sender_rich_content	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   6067: invokevirtual 589	com/tencent/mobileqq/pb/PBBytesField:get	()Lcom/tencent/mobileqq/pb/ByteStringMicro;
    //   6070: invokevirtual 594	com/tencent/mobileqq/pb/ByteStringMicro:toStringUtf8	()Ljava/lang/String;
    //   6073: putfield 1582	com/tencent/mobileqq/data/MessageForQQWalletTips:senderContent	Ljava/lang/String;
    //   6076: aload 23
    //   6078: aload 24
    //   6080: getfield 1627	tencent/im/s2c/msgtype0x210/submsgtype0x9f/MsgBody:bytes_receiver_rich_content	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   6083: invokevirtual 589	com/tencent/mobileqq/pb/PBBytesField:get	()Lcom/tencent/mobileqq/pb/ByteStringMicro;
    //   6086: invokevirtual 594	com/tencent/mobileqq/pb/ByteStringMicro:toStringUtf8	()Ljava/lang/String;
    //   6089: putfield 1588	com/tencent/mobileqq/data/MessageForQQWalletTips:reciverContent	Ljava/lang/String;
    //   6092: aload 23
    //   6094: aload 24
    //   6096: getfield 1628	tencent/im/s2c/msgtype0x210/submsgtype0x9f/MsgBody:bytes_authkey	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   6099: invokevirtual 589	com/tencent/mobileqq/pb/PBBytesField:get	()Lcom/tencent/mobileqq/pb/ByteStringMicro;
    //   6102: invokevirtual 594	com/tencent/mobileqq/pb/ByteStringMicro:toStringUtf8	()Ljava/lang/String;
    //   6105: putfield 1594	com/tencent/mobileqq/data/MessageForQQWalletTips:authKey	Ljava/lang/String;
    //   6108: aload_0
    //   6109: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   6112: invokevirtual 567	com/tencent/mobileqq/app/QQAppInterface:a	()Ljava/lang/String;
    //   6115: astore 24
    //   6117: aload_0
    //   6118: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   6121: invokevirtual 567	com/tencent/mobileqq/app/QQAppInterface:a	()Ljava/lang/String;
    //   6124: aload 23
    //   6126: getfield 1570	com/tencent/mobileqq/data/MessageForQQWalletTips:senderUin	Ljava/lang/String;
    //   6129: invokevirtual 597	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   6132: ifeq +128 -> 6260
    //   6135: aload 23
    //   6137: getfield 1576	com/tencent/mobileqq/data/MessageForQQWalletTips:reciverUin	Ljava/lang/String;
    //   6140: astore 22
    //   6142: aload 23
    //   6144: aload 24
    //   6146: aload 22
    //   6148: aload 21
    //   6150: ldc_w 1596
    //   6153: aload_1
    //   6154: invokevirtual 1599	OnlinePushPack/MsgInfo:getUMsgTime	()J
    //   6157: sipush 63507
    //   6160: iload 4
    //   6162: aload_1
    //   6163: invokevirtual 1603	OnlinePushPack/MsgInfo:getShMsgSeq	()S
    //   6166: i2l
    //   6167: invokevirtual 1604	com/tencent/mobileqq/data/MessageForQQWalletTips:init	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JIIJ)V
    //   6170: aload 23
    //   6172: iconst_1
    //   6173: putfield 1605	com/tencent/mobileqq/data/MessageForQQWalletTips:isread	Z
    //   6176: aload 23
    //   6178: aload_1
    //   6179: getfield 176	OnlinePushPack/MsgInfo:shMsgSeq	S
    //   6182: i2l
    //   6183: putfield 1606	com/tencent/mobileqq/data/MessageForQQWalletTips:shmsgseq	J
    //   6186: aload 23
    //   6188: aload_1
    //   6189: getfield 216	OnlinePushPack/MsgInfo:lMsgUid	J
    //   6192: putfield 1607	com/tencent/mobileqq/data/MessageForQQWalletTips:msgUid	J
    //   6195: aload 23
    //   6197: invokevirtual 1610	com/tencent/mobileqq/data/MessageForQQWalletTips:getBytes	()[B
    //   6200: pop
    //   6201: aload 23
    //   6203: astore_1
    //   6204: goto -5984 -> 220
    //   6207: astore_1
    //   6208: aload_1
    //   6209: invokevirtual 325	java/lang/Exception:printStackTrace	()V
    //   6212: aload 23
    //   6214: astore_1
    //   6215: goto -5995 -> 220
    //   6218: sipush 1000
    //   6221: istore 4
    //   6223: aload 24
    //   6225: getfield 1631	tencent/im/s2c/msgtype0x210/submsgtype0x9f/MsgBody:uint64_group_uin	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   6228: invokevirtual 553	com/tencent/mobileqq/pb/PBUInt64Field:get	()J
    //   6231: invokestatic 192	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   6234: astore 21
    //   6236: goto -240 -> 5996
    //   6239: sipush 1004
    //   6242: istore 4
    //   6244: aload 24
    //   6246: getfield 1631	tencent/im/s2c/msgtype0x210/submsgtype0x9f/MsgBody:uint64_group_uin	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   6249: invokevirtual 553	com/tencent/mobileqq/pb/PBUInt64Field:get	()J
    //   6252: invokestatic 192	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   6255: astore 21
    //   6257: goto -261 -> 5996
    //   6260: aload 23
    //   6262: getfield 1570	com/tencent/mobileqq/data/MessageForQQWalletTips:senderUin	Ljava/lang/String;
    //   6265: astore 22
    //   6267: goto -125 -> 6142
    //   6270: aload 25
    //   6272: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   6275: ldc2_w 1632
    //   6278: lcmp
    //   6279: ifne +268 -> 6547
    //   6282: new 1635	tencent/im/s2c/msgtype0x210/submsgtype0xa2/MsgBody
    //   6285: dup
    //   6286: invokespecial 1636	tencent/im/s2c/msgtype0x210/submsgtype0xa2/MsgBody:<init>	()V
    //   6289: astore 21
    //   6291: sipush 63507
    //   6294: invokestatic 247	com/tencent/mobileqq/service/message/MessageRecordFactory:a	(I)Lcom/tencent/mobileqq/data/MessageRecord;
    //   6297: checkcast 1563	com/tencent/mobileqq/data/MessageForQQWalletTips
    //   6300: astore 22
    //   6302: aload 21
    //   6304: aload 25
    //   6306: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   6309: invokevirtual 1637	tencent/im/s2c/msgtype0x210/submsgtype0xa2/MsgBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   6312: pop
    //   6313: aload 22
    //   6315: new 80	java/lang/StringBuilder
    //   6318: dup
    //   6319: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   6322: aload 21
    //   6324: getfield 1638	tencent/im/s2c/msgtype0x210/submsgtype0xa2/MsgBody:uint64_sender_uin	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   6327: invokevirtual 553	com/tencent/mobileqq/pb/PBUInt64Field:get	()J
    //   6330: invokevirtual 202	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   6333: ldc_w 391
    //   6336: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   6339: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   6342: putfield 1570	com/tencent/mobileqq/data/MessageForQQWalletTips:senderUin	Ljava/lang/String;
    //   6345: aload 22
    //   6347: new 80	java/lang/StringBuilder
    //   6350: dup
    //   6351: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   6354: aload 21
    //   6356: getfield 1639	tencent/im/s2c/msgtype0x210/submsgtype0xa2/MsgBody:uint64_receiver_uin	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   6359: invokevirtual 553	com/tencent/mobileqq/pb/PBUInt64Field:get	()J
    //   6362: invokevirtual 202	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   6365: ldc_w 391
    //   6368: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   6371: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   6374: putfield 1576	com/tencent/mobileqq/data/MessageForQQWalletTips:reciverUin	Ljava/lang/String;
    //   6377: aload 22
    //   6379: aload 21
    //   6381: getfield 1640	tencent/im/s2c/msgtype0x210/submsgtype0xa2/MsgBody:bytes_sender_rich_content	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   6384: invokevirtual 589	com/tencent/mobileqq/pb/PBBytesField:get	()Lcom/tencent/mobileqq/pb/ByteStringMicro;
    //   6387: invokevirtual 594	com/tencent/mobileqq/pb/ByteStringMicro:toStringUtf8	()Ljava/lang/String;
    //   6390: putfield 1582	com/tencent/mobileqq/data/MessageForQQWalletTips:senderContent	Ljava/lang/String;
    //   6393: aload 22
    //   6395: aload 21
    //   6397: getfield 1641	tencent/im/s2c/msgtype0x210/submsgtype0xa2/MsgBody:bytes_receiver_rich_content	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   6400: invokevirtual 589	com/tencent/mobileqq/pb/PBBytesField:get	()Lcom/tencent/mobileqq/pb/ByteStringMicro;
    //   6403: invokevirtual 594	com/tencent/mobileqq/pb/ByteStringMicro:toStringUtf8	()Ljava/lang/String;
    //   6406: putfield 1588	com/tencent/mobileqq/data/MessageForQQWalletTips:reciverContent	Ljava/lang/String;
    //   6409: aload 22
    //   6411: aload 21
    //   6413: getfield 1642	tencent/im/s2c/msgtype0x210/submsgtype0xa2/MsgBody:bytes_authkey	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   6416: invokevirtual 589	com/tencent/mobileqq/pb/PBBytesField:get	()Lcom/tencent/mobileqq/pb/ByteStringMicro;
    //   6419: invokevirtual 594	com/tencent/mobileqq/pb/ByteStringMicro:toStringUtf8	()Ljava/lang/String;
    //   6422: putfield 1594	com/tencent/mobileqq/data/MessageForQQWalletTips:authKey	Ljava/lang/String;
    //   6425: aload_0
    //   6426: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   6429: invokevirtual 567	com/tencent/mobileqq/app/QQAppInterface:a	()Ljava/lang/String;
    //   6432: astore 23
    //   6434: aload_0
    //   6435: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   6438: invokevirtual 567	com/tencent/mobileqq/app/QQAppInterface:a	()Ljava/lang/String;
    //   6441: aload 22
    //   6443: getfield 1570	com/tencent/mobileqq/data/MessageForQQWalletTips:senderUin	Ljava/lang/String;
    //   6446: invokevirtual 597	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   6449: ifeq +88 -> 6537
    //   6452: aload 22
    //   6454: getfield 1576	com/tencent/mobileqq/data/MessageForQQWalletTips:reciverUin	Ljava/lang/String;
    //   6457: astore 21
    //   6459: aload 22
    //   6461: aload 23
    //   6463: aload 21
    //   6465: ldc_w 391
    //   6468: ldc_w 1596
    //   6471: aload_1
    //   6472: invokevirtual 1599	OnlinePushPack/MsgInfo:getUMsgTime	()J
    //   6475: sipush 63507
    //   6478: sipush 1001
    //   6481: aload_1
    //   6482: invokevirtual 1603	OnlinePushPack/MsgInfo:getShMsgSeq	()S
    //   6485: i2l
    //   6486: invokevirtual 1604	com/tencent/mobileqq/data/MessageForQQWalletTips:init	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JIIJ)V
    //   6489: aload 22
    //   6491: iconst_1
    //   6492: putfield 1605	com/tencent/mobileqq/data/MessageForQQWalletTips:isread	Z
    //   6495: aload 22
    //   6497: aload_1
    //   6498: getfield 176	OnlinePushPack/MsgInfo:shMsgSeq	S
    //   6501: i2l
    //   6502: putfield 1606	com/tencent/mobileqq/data/MessageForQQWalletTips:shmsgseq	J
    //   6505: aload 22
    //   6507: aload_1
    //   6508: getfield 216	OnlinePushPack/MsgInfo:lMsgUid	J
    //   6511: putfield 1607	com/tencent/mobileqq/data/MessageForQQWalletTips:msgUid	J
    //   6514: aload 22
    //   6516: invokevirtual 1610	com/tencent/mobileqq/data/MessageForQQWalletTips:getBytes	()[B
    //   6519: pop
    //   6520: aload 22
    //   6522: astore_1
    //   6523: goto -6303 -> 220
    //   6526: astore_1
    //   6527: aload_1
    //   6528: invokevirtual 325	java/lang/Exception:printStackTrace	()V
    //   6531: aload 22
    //   6533: astore_1
    //   6534: goto -6314 -> 220
    //   6537: aload 22
    //   6539: getfield 1570	com/tencent/mobileqq/data/MessageForQQWalletTips:senderUin	Ljava/lang/String;
    //   6542: astore 21
    //   6544: goto -85 -> 6459
    //   6547: aload 25
    //   6549: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   6552: ldc2_w 1643
    //   6555: lcmp
    //   6556: ifne +65 -> 6621
    //   6559: aload_0
    //   6560: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   6563: bipush 62
    //   6565: invokevirtual 48	com/tencent/mobileqq/app/QQAppInterface:a	(I)Lcom/tencent/mobileqq/app/BusinessHandler;
    //   6568: checkcast 1646	com/tencent/mobileqq/app/readinjoy/ReadInJoyHandler
    //   6571: aload 25
    //   6573: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   6576: invokevirtual 1647	com/tencent/mobileqq/app/readinjoy/ReadInJoyHandler:a	([B)V
    //   6579: aload_1
    //   6580: getfield 144	OnlinePushPack/MsgInfo:lFromUin	J
    //   6583: lstore_2
    //   6584: aload_1
    //   6585: getfield 176	OnlinePushPack/MsgInfo:shMsgSeq	S
    //   6588: istore 4
    //   6590: aload_1
    //   6591: getfield 216	OnlinePushPack/MsgInfo:lMsgUid	J
    //   6594: lstore 13
    //   6596: aload_1
    //   6597: getfield 141	OnlinePushPack/MsgInfo:shMsgType	S
    //   6600: istore 5
    //   6602: aload_0
    //   6603: getfield 519	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppMessageHandler	Lcom/tencent/mobileqq/app/MessageHandler;
    //   6606: lload_2
    //   6607: iload 4
    //   6609: lload 13
    //   6611: iload 5
    //   6613: invokestatic 1033	com/tencent/mobileqq/service/message/MessageProtoCodec:a	(Lcom/tencent/mobileqq/app/MessageHandler;JIJI)V
    //   6616: aconst_null
    //   6617: astore_1
    //   6618: goto -6398 -> 220
    //   6621: aload 25
    //   6623: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   6626: ldc2_w 1648
    //   6629: lcmp
    //   6630: ifne +100 -> 6730
    //   6633: new 1651	tencent/im/s2c/msgtype0x210/submsgtype0x87/SubMsgType0x87$MsgBody
    //   6636: dup
    //   6637: invokespecial 1652	tencent/im/s2c/msgtype0x210/submsgtype0x87/SubMsgType0x87$MsgBody:<init>	()V
    //   6640: astore_1
    //   6641: aload_1
    //   6642: aload 25
    //   6644: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   6647: invokevirtual 1653	tencent/im/s2c/msgtype0x210/submsgtype0x87/SubMsgType0x87$MsgBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   6650: pop
    //   6651: aload_1
    //   6652: getfield 1656	tencent/im/s2c/msgtype0x210/submsgtype0x87/SubMsgType0x87$MsgBody:uint64_friend_msg_type_flag	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   6655: invokevirtual 775	com/tencent/mobileqq/pb/PBUInt64Field:has	()Z
    //   6658: ifeq +34 -> 6692
    //   6661: aload_1
    //   6662: getfield 1656	tencent/im/s2c/msgtype0x210/submsgtype0x87/SubMsgType0x87$MsgBody:uint64_friend_msg_type_flag	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   6665: invokevirtual 553	com/tencent/mobileqq/pb/PBUInt64Field:get	()J
    //   6668: lconst_1
    //   6669: lcmp
    //   6670: ifne +54 -> 6724
    //   6673: iconst_1
    //   6674: istore 4
    //   6676: iload 4
    //   6678: ifeq +14 -> 6692
    //   6681: aload_0
    //   6682: getfield 519	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppMessageHandler	Lcom/tencent/mobileqq/app/MessageHandler;
    //   6685: invokevirtual 437	com/tencent/mobileqq/app/MessageHandler:a	()Lcom/tencent/mobileqq/app/message/SystemMessageProcessor;
    //   6688: iconst_2
    //   6689: invokevirtual 440	com/tencent/mobileqq/app/message/SystemMessageProcessor:a	(I)V
    //   6692: aconst_null
    //   6693: astore_1
    //   6694: goto -6474 -> 220
    //   6697: astore_1
    //   6698: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   6701: ifeq +14 -> 6715
    //   6704: ldc_w 1401
    //   6707: iconst_2
    //   6708: ldc_w 391
    //   6711: aload_1
    //   6712: invokestatic 1403	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   6715: new 1405	java/lang/RuntimeException
    //   6718: dup
    //   6719: aload_1
    //   6720: invokespecial 1408	java/lang/RuntimeException:<init>	(Ljava/lang/Throwable;)V
    //   6723: athrow
    //   6724: iconst_0
    //   6725: istore 4
    //   6727: goto -51 -> 6676
    //   6730: aload 25
    //   6732: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   6735: ldc2_w 1657
    //   6738: lcmp
    //   6739: ifeq +15 -> 6754
    //   6742: aload 25
    //   6744: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   6747: ldc2_w 1659
    //   6750: lcmp
    //   6751: ifne +72 -> 6823
    //   6754: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   6757: ifeq +13 -> 6770
    //   6760: ldc_w 1662
    //   6763: iconst_2
    //   6764: ldc_w 1664
    //   6767: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   6770: new 1666	tencent/im/msgsync/cmd0x100/Submsgtype0x8a$ReqBody
    //   6773: dup
    //   6774: invokespecial 1667	tencent/im/msgsync/cmd0x100/Submsgtype0x8a$ReqBody:<init>	()V
    //   6777: astore_1
    //   6778: aload_1
    //   6779: aload 25
    //   6781: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   6784: invokevirtual 1668	tencent/im/msgsync/cmd0x100/Submsgtype0x8a$ReqBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   6787: pop
    //   6788: aload_0
    //   6789: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   6792: aload_1
    //   6793: lconst_0
    //   6794: iconst_0
    //   6795: invokestatic 1671	com/tencent/mobileqq/service/message/MessageProtoCodec:a	(Lcom/tencent/mobileqq/app/QQAppInterface;Ltencent/im/msgsync/cmd0x100/Submsgtype0x8a$ReqBody;JZ)V
    //   6798: aconst_null
    //   6799: astore_1
    //   6800: goto -6580 -> 220
    //   6803: astore_1
    //   6804: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   6807: ifeq -9 -> 6798
    //   6810: ldc_w 1662
    //   6813: iconst_2
    //   6814: ldc_w 1673
    //   6817: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   6820: goto -22 -> 6798
    //   6823: aload 25
    //   6825: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   6828: ldc2_w 1674
    //   6831: lcmp
    //   6832: ifne +28 -> 6860
    //   6835: aload_0
    //   6836: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   6839: bipush 51
    //   6841: invokevirtual 48	com/tencent/mobileqq/app/QQAppInterface:a	(I)Lcom/tencent/mobileqq/app/BusinessHandler;
    //   6844: checkcast 1382	com/tencent/device/devicemgr/SmartDeviceProxyMgr
    //   6847: aload 25
    //   6849: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   6852: invokevirtual 1676	com/tencent/device/devicemgr/SmartDeviceProxyMgr:a	([B)V
    //   6855: aconst_null
    //   6856: astore_1
    //   6857: goto -6637 -> 220
    //   6860: aload 25
    //   6862: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   6865: ldc2_w 1677
    //   6868: lcmp
    //   6869: ifne +30 -> 6899
    //   6872: iconst_2
    //   6873: invokestatic 1684	com/tencent/mqp/app/sec/d:x	()[Ljava/lang/Object;
    //   6876: aload 25
    //   6878: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   6881: invokestatic 1688	com/tencent/mqp/app/sec/d:e1	(I[Ljava/lang/Object;[B)V
    //   6884: aconst_null
    //   6885: astore_1
    //   6886: goto -6666 -> 220
    //   6889: astore_1
    //   6890: aload_1
    //   6891: invokevirtual 1689	java/lang/Throwable:printStackTrace	()V
    //   6894: aconst_null
    //   6895: astore_1
    //   6896: goto -6676 -> 220
    //   6899: aload 25
    //   6901: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   6904: ldc2_w 1690
    //   6907: lcmp
    //   6908: ifne +109 -> 7017
    //   6911: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   6914: ifeq +12 -> 6926
    //   6917: ldc 63
    //   6919: iconst_4
    //   6920: ldc_w 1693
    //   6923: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   6926: new 1695	tencent/im/s2c/msgtype0x210/submsgtype0x96/submsgtype0x96$MsgBody
    //   6929: dup
    //   6930: invokespecial 1696	tencent/im/s2c/msgtype0x210/submsgtype0x96/submsgtype0x96$MsgBody:<init>	()V
    //   6933: astore_1
    //   6934: aload_1
    //   6935: aload 25
    //   6937: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   6940: invokevirtual 1697	tencent/im/s2c/msgtype0x210/submsgtype0x96/submsgtype0x96$MsgBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   6943: pop
    //   6944: new 920	android/content/Intent
    //   6947: dup
    //   6948: ldc_w 1699
    //   6951: invokespecial 1701	android/content/Intent:<init>	(Ljava/lang/String;)V
    //   6954: astore 21
    //   6956: aload 21
    //   6958: ldc_w 1703
    //   6961: invokevirtual 1707	android/content/Intent:setAction	(Ljava/lang/String;)Landroid/content/Intent;
    //   6964: pop
    //   6965: aload 21
    //   6967: ldc_w 1709
    //   6970: aload_1
    //   6971: getfield 1712	tencent/im/s2c/msgtype0x210/submsgtype0x96/submsgtype0x96$MsgBody:string_push_msg	Lcom/tencent/mobileqq/pb/PBStringField;
    //   6974: invokevirtual 941	com/tencent/mobileqq/pb/PBStringField:get	()Ljava/lang/String;
    //   6977: invokevirtual 944	android/content/Intent:putExtra	(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    //   6980: pop
    //   6981: aload_0
    //   6982: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   6985: invokevirtual 1714	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   6988: aload 21
    //   6990: invokevirtual 1717	com/tencent/qphone/base/util/BaseApplication:sendBroadcast	(Landroid/content/Intent;)V
    //   6993: aconst_null
    //   6994: astore_1
    //   6995: goto -6775 -> 220
    //   6998: astore_1
    //   6999: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   7002: ifeq -9 -> 6993
    //   7005: ldc 63
    //   7007: iconst_4
    //   7008: ldc_w 1719
    //   7011: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   7014: goto -21 -> 6993
    //   7017: aload 25
    //   7019: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   7022: ldc2_w 1720
    //   7025: lcmp
    //   7026: ifne +884 -> 7910
    //   7029: new 1723	tencent/im/s2c/msgtype0x210/submsgtype0x94/Submsgtype0x94$MsgBody
    //   7032: dup
    //   7033: invokespecial 1724	tencent/im/s2c/msgtype0x210/submsgtype0x94/Submsgtype0x94$MsgBody:<init>	()V
    //   7036: astore_1
    //   7037: aload_1
    //   7038: aload 25
    //   7040: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   7043: invokevirtual 1725	tencent/im/s2c/msgtype0x210/submsgtype0x94/Submsgtype0x94$MsgBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   7046: pop
    //   7047: aload_1
    //   7048: getfield 1728	tencent/im/s2c/msgtype0x210/submsgtype0x94/Submsgtype0x94$MsgBody:str_folder_msg	Lcom/tencent/mobileqq/pb/PBStringField;
    //   7051: invokevirtual 941	com/tencent/mobileqq/pb/PBStringField:get	()Ljava/lang/String;
    //   7054: astore 22
    //   7056: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   7059: ifeq +31 -> 7090
    //   7062: ldc_w 1730
    //   7065: iconst_2
    //   7066: new 80	java/lang/StringBuilder
    //   7069: dup
    //   7070: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   7073: ldc_w 1732
    //   7076: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   7079: aload 22
    //   7081: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   7084: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   7087: invokestatic 626	com/tencent/qphone/base/util/QLog:i	(Ljava/lang/String;ILjava/lang/String;)V
    //   7090: aload_1
    //   7091: getfield 1735	tencent/im/s2c/msgtype0x210/submsgtype0x94/Submsgtype0x94$MsgBody:uint32_discover_reddot_flag	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   7094: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   7097: iconst_1
    //   7098: if_icmpne +529 -> 7627
    //   7101: iconst_1
    //   7102: istore 16
    //   7104: aload_1
    //   7105: getfield 1738	tencent/im/s2c/msgtype0x210/submsgtype0x94/Submsgtype0x94$MsgBody:uint32_folder_reddot_flag	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   7108: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   7111: iconst_1
    //   7112: if_icmpne +521 -> 7633
    //   7115: iconst_1
    //   7116: istore 15
    //   7118: aload_1
    //   7119: getfield 1741	tencent/im/s2c/msgtype0x210/submsgtype0x94/Submsgtype0x94$MsgBody:uint32_discount_reddot_flag	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   7122: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   7125: iconst_1
    //   7126: if_icmpne +513 -> 7639
    //   7129: iconst_1
    //   7130: istore 17
    //   7132: aload_1
    //   7133: getfield 1744	tencent/im/s2c/msgtype0x210/submsgtype0x94/Submsgtype0x94$MsgBody:uint32_nearby_reddot_flag	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   7136: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   7139: iconst_1
    //   7140: if_icmpne +505 -> 7645
    //   7143: iconst_1
    //   7144: istore 18
    //   7146: aload_1
    //   7147: getfield 1747	tencent/im/s2c/msgtype0x210/submsgtype0x94/Submsgtype0x94$MsgBody:uint32_mine_reddot_flag	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   7150: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   7153: iconst_1
    //   7154: if_icmpne +497 -> 7651
    //   7157: iconst_1
    //   7158: istore 19
    //   7160: aload_1
    //   7161: getfield 1750	tencent/im/s2c/msgtype0x210/submsgtype0x94/Submsgtype0x94$MsgBody:uint32_start_ts	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   7164: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   7167: istore 6
    //   7169: aload_1
    //   7170: getfield 1753	tencent/im/s2c/msgtype0x210/submsgtype0x94/Submsgtype0x94$MsgBody:uint32_end_ts	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   7173: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   7176: istore 7
    //   7178: invokestatic 1758	java/lang/System:currentTimeMillis	()J
    //   7181: ldc2_w 1759
    //   7184: ldiv
    //   7185: l2i
    //   7186: istore 8
    //   7188: aload_1
    //   7189: getfield 1763	tencent/im/s2c/msgtype0x210/submsgtype0x94/Submsgtype0x94$MsgBody:uint32_period_of_validity	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   7192: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   7195: istore 5
    //   7197: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   7200: ifeq +108 -> 7308
    //   7203: ldc_w 1730
    //   7206: iconst_2
    //   7207: new 80	java/lang/StringBuilder
    //   7210: dup
    //   7211: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   7214: ldc_w 1765
    //   7217: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   7220: iload 6
    //   7222: invokevirtual 92	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   7225: ldc_w 1767
    //   7228: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   7231: iload 7
    //   7233: invokevirtual 92	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   7236: ldc_w 1769
    //   7239: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   7242: iload 5
    //   7244: invokevirtual 92	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   7247: ldc_w 1771
    //   7250: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   7253: iload 15
    //   7255: invokevirtual 790	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   7258: ldc_w 1773
    //   7261: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   7264: iload 16
    //   7266: invokevirtual 790	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   7269: ldc_w 1773
    //   7272: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   7275: iload 17
    //   7277: invokevirtual 790	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   7280: ldc_w 1773
    //   7283: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   7286: iload 18
    //   7288: invokevirtual 790	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   7291: ldc_w 1773
    //   7294: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   7297: iload 19
    //   7299: invokevirtual 790	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   7302: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   7305: invokestatic 626	com/tencent/qphone/base/util/QLog:i	(Ljava/lang/String;ILjava/lang/String;)V
    //   7308: iload 5
    //   7310: istore 4
    //   7312: iload 5
    //   7314: ldc_w 1774
    //   7317: if_icmple +8 -> 7325
    //   7320: ldc_w 1774
    //   7323: istore 4
    //   7325: iload 16
    //   7327: ifne +18 -> 7345
    //   7330: iload 17
    //   7332: ifne +13 -> 7345
    //   7335: iload 18
    //   7337: ifne +8 -> 7345
    //   7340: iload 19
    //   7342: ifeq +6 -> 7348
    //   7345: iconst_1
    //   7346: istore 15
    //   7348: iload 15
    //   7350: istore 20
    //   7352: iload 15
    //   7354: ifeq +24 -> 7378
    //   7357: iload 8
    //   7359: iload 6
    //   7361: if_icmplt +14 -> 7375
    //   7364: iload 15
    //   7366: istore 20
    //   7368: iload 8
    //   7370: iload 7
    //   7372: if_icmple +6 -> 7378
    //   7375: iconst_0
    //   7376: istore 20
    //   7378: aload_0
    //   7379: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   7382: invokevirtual 567	com/tencent/mobileqq/app/QQAppInterface:a	()Ljava/lang/String;
    //   7385: astore 21
    //   7387: aload 21
    //   7389: astore_1
    //   7390: aload 21
    //   7392: invokestatic 1780	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   7395: ifeq +7 -> 7402
    //   7398: ldc_w 1782
    //   7401: astore_1
    //   7402: aload_0
    //   7403: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   7406: invokevirtual 1714	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   7409: new 80	java/lang/StringBuilder
    //   7412: dup
    //   7413: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   7416: ldc_w 1784
    //   7419: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   7422: aload_1
    //   7423: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   7426: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   7429: iconst_0
    //   7430: invokevirtual 1788	com/tencent/qphone/base/util/BaseApplication:getSharedPreferences	(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    //   7433: astore_1
    //   7434: aload_1
    //   7435: invokeinterface 1794 1 0
    //   7440: astore 21
    //   7442: aload_1
    //   7443: ldc_w 1796
    //   7446: iconst_0
    //   7447: invokeinterface 1800 3 0
    //   7452: ifne +55 -> 7507
    //   7455: aload_1
    //   7456: ldc_w 1802
    //   7459: iconst_0
    //   7460: invokeinterface 1800 3 0
    //   7465: ifne +42 -> 7507
    //   7468: aload_1
    //   7469: ldc_w 1804
    //   7472: iconst_0
    //   7473: invokeinterface 1800 3 0
    //   7478: ifne +29 -> 7507
    //   7481: aload_1
    //   7482: ldc_w 1806
    //   7485: iconst_0
    //   7486: invokeinterface 1800 3 0
    //   7491: ifne +16 -> 7507
    //   7494: aload_1
    //   7495: ldc_w 1808
    //   7498: iconst_0
    //   7499: invokeinterface 1800 3 0
    //   7504: ifeq +229 -> 7733
    //   7507: aload_1
    //   7508: ldc_w 1810
    //   7511: iconst_0
    //   7512: invokeinterface 1814 3 0
    //   7517: istore 5
    //   7519: aload_1
    //   7520: ldc_w 1816
    //   7523: iconst_0
    //   7524: invokeinterface 1814 3 0
    //   7529: istore 9
    //   7531: aload_1
    //   7532: ldc_w 1818
    //   7535: iconst_0
    //   7536: invokeinterface 1814 3 0
    //   7541: istore 10
    //   7543: aload_1
    //   7544: ldc_w 1820
    //   7547: iconst_0
    //   7548: invokeinterface 1814 3 0
    //   7553: istore 11
    //   7555: invokestatic 1758	java/lang/System:currentTimeMillis	()J
    //   7558: ldc2_w 1759
    //   7561: ldiv
    //   7562: l2i
    //   7563: istore 12
    //   7565: iload 12
    //   7567: ifeq +166 -> 7733
    //   7570: iload 9
    //   7572: ifeq +161 -> 7733
    //   7575: iload 10
    //   7577: ifeq +156 -> 7733
    //   7580: iload 11
    //   7582: ifeq +151 -> 7733
    //   7585: iload 12
    //   7587: iload 9
    //   7589: if_icmplt +68 -> 7657
    //   7592: iload 12
    //   7594: iload 10
    //   7596: if_icmpgt +61 -> 7657
    //   7599: iload 12
    //   7601: iload 5
    //   7603: isub
    //   7604: iload 11
    //   7606: if_icmpge +51 -> 7657
    //   7609: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   7612: ifeq -7582 -> 30
    //   7615: ldc_w 1730
    //   7618: iconst_2
    //   7619: ldc_w 1822
    //   7622: invokestatic 626	com/tencent/qphone/base/util/QLog:i	(Ljava/lang/String;ILjava/lang/String;)V
    //   7625: aconst_null
    //   7626: areturn
    //   7627: iconst_0
    //   7628: istore 16
    //   7630: goto -526 -> 7104
    //   7633: iconst_0
    //   7634: istore 15
    //   7636: goto -518 -> 7118
    //   7639: iconst_0
    //   7640: istore 17
    //   7642: goto -510 -> 7132
    //   7645: iconst_0
    //   7646: istore 18
    //   7648: goto -502 -> 7146
    //   7651: iconst_0
    //   7652: istore 19
    //   7654: goto -494 -> 7160
    //   7657: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   7660: ifeq +13 -> 7673
    //   7663: ldc_w 1730
    //   7666: iconst_2
    //   7667: ldc_w 1824
    //   7670: invokestatic 626	com/tencent/qphone/base/util/QLog:i	(Ljava/lang/String;ILjava/lang/String;)V
    //   7673: aload 21
    //   7675: ldc_w 1796
    //   7678: iconst_0
    //   7679: invokeinterface 1830 3 0
    //   7684: pop
    //   7685: aload 21
    //   7687: ldc_w 1802
    //   7690: iconst_0
    //   7691: invokeinterface 1830 3 0
    //   7696: pop
    //   7697: aload 21
    //   7699: ldc_w 1804
    //   7702: iconst_0
    //   7703: invokeinterface 1830 3 0
    //   7708: pop
    //   7709: aload 21
    //   7711: ldc_w 1806
    //   7714: iconst_0
    //   7715: invokeinterface 1830 3 0
    //   7720: pop
    //   7721: aload 21
    //   7723: ldc_w 1808
    //   7726: iconst_0
    //   7727: invokeinterface 1830 3 0
    //   7732: pop
    //   7733: aload 21
    //   7735: ldc_w 1816
    //   7738: iload 6
    //   7740: invokeinterface 1833 3 0
    //   7745: pop
    //   7746: aload 21
    //   7748: ldc_w 1818
    //   7751: iload 7
    //   7753: invokeinterface 1833 3 0
    //   7758: pop
    //   7759: aload 21
    //   7761: ldc_w 1820
    //   7764: iload 4
    //   7766: invokeinterface 1833 3 0
    //   7771: pop
    //   7772: aload 21
    //   7774: ldc_w 1835
    //   7777: aload 22
    //   7779: invokeinterface 1839 3 0
    //   7784: pop
    //   7785: aload 21
    //   7787: ldc_w 1810
    //   7790: iload 8
    //   7792: invokeinterface 1833 3 0
    //   7797: pop
    //   7798: aload 21
    //   7800: ldc_w 1808
    //   7803: iconst_1
    //   7804: invokeinterface 1830 3 0
    //   7809: pop
    //   7810: aload 21
    //   7812: ldc_w 1796
    //   7815: iload 16
    //   7817: invokeinterface 1830 3 0
    //   7822: pop
    //   7823: aload 21
    //   7825: ldc_w 1802
    //   7828: iload 17
    //   7830: invokeinterface 1830 3 0
    //   7835: pop
    //   7836: aload 21
    //   7838: ldc_w 1804
    //   7841: iload 18
    //   7843: invokeinterface 1830 3 0
    //   7848: pop
    //   7849: aload 21
    //   7851: ldc_w 1806
    //   7854: iload 19
    //   7856: invokeinterface 1830 3 0
    //   7861: pop
    //   7862: aload 21
    //   7864: invokeinterface 1842 1 0
    //   7869: pop
    //   7870: aload_0
    //   7871: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   7874: bipush 87
    //   7876: invokevirtual 167	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   7879: checkcast 1844	com/tencent/biz/pubaccount/ecshopassit/EcShopAssistantManager
    //   7882: invokestatic 654	com/tencent/mobileqq/msf/core/NetConnInfoCenter:getServerTime	()J
    //   7885: iload 20
    //   7887: invokevirtual 1847	com/tencent/biz/pubaccount/ecshopassit/EcShopAssistantManager:a	(JZ)V
    //   7890: aload_0
    //   7891: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   7894: bipush 68
    //   7896: invokevirtual 48	com/tencent/mobileqq/app/QQAppInterface:a	(I)Lcom/tencent/mobileqq/app/BusinessHandler;
    //   7899: checkcast 1849	com/tencent/biz/pubaccount/ecshopassit/EcShopHandler
    //   7902: invokevirtual 1850	com/tencent/biz/pubaccount/ecshopassit/EcShopHandler:a	()V
    //   7905: aconst_null
    //   7906: astore_1
    //   7907: goto -7687 -> 220
    //   7910: aload 25
    //   7912: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   7915: ldc2_w 1851
    //   7918: lcmp
    //   7919: ifne +48 -> 7967
    //   7922: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   7925: ifeq +12 -> 7937
    //   7928: ldc 63
    //   7930: iconst_2
    //   7931: ldc_w 1854
    //   7934: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   7937: aload_0
    //   7938: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   7941: bipush 9
    //   7943: invokevirtual 48	com/tencent/mobileqq/app/QQAppInterface:a	(I)Lcom/tencent/mobileqq/app/BusinessHandler;
    //   7946: checkcast 1856	cooperation/huangye/HuangyeHandler
    //   7949: astore_1
    //   7950: aload_0
    //   7951: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   7954: aload 25
    //   7956: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   7959: invokestatic 1857	cooperation/huangye/HuangyeHandler:a	(Lcom/tencent/mobileqq/app/QQAppInterface;[B)V
    //   7962: aconst_null
    //   7963: astore_1
    //   7964: goto -7744 -> 220
    //   7967: aload 25
    //   7969: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   7972: ldc2_w 1858
    //   7975: lcmp
    //   7976: ifne +59 -> 8035
    //   7979: new 1861	tencent/im/s2c/msgtype0x210/submsgtype0x98/submsgtype0x98$MsgBody
    //   7982: dup
    //   7983: invokespecial 1862	tencent/im/s2c/msgtype0x210/submsgtype0x98/submsgtype0x98$MsgBody:<init>	()V
    //   7986: astore_1
    //   7987: aload_1
    //   7988: aload 25
    //   7990: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   7993: invokevirtual 1863	tencent/im/s2c/msgtype0x210/submsgtype0x98/submsgtype0x98$MsgBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   7996: pop
    //   7997: aload_1
    //   7998: getfield 1864	tencent/im/s2c/msgtype0x210/submsgtype0x98/submsgtype0x98$MsgBody:uint64_uin	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   8001: invokevirtual 553	com/tencent/mobileqq/pb/PBUInt64Field:get	()J
    //   8004: pop2
    //   8005: aload_1
    //   8006: getfield 1867	tencent/im/s2c/msgtype0x210/submsgtype0x98/submsgtype0x98$MsgBody:uint32_sub_cmd	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   8009: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   8012: pop
    //   8013: aload_1
    //   8014: getfield 1871	tencent/im/s2c/msgtype0x210/submsgtype0x98/submsgtype0x98$MsgBody:msg_mod_block	Ltencent/im/s2c/msgtype0x210/submsgtype0x98/submsgtype0x98$ModBlock;
    //   8017: invokevirtual 1874	tencent/im/s2c/msgtype0x210/submsgtype0x98/submsgtype0x98$ModBlock:get	()Lcom/tencent/mobileqq/pb/MessageMicro;
    //   8020: checkcast 1873	tencent/im/s2c/msgtype0x210/submsgtype0x98/submsgtype0x98$ModBlock
    //   8023: getfield 1877	tencent/im/s2c/msgtype0x210/submsgtype0x98/submsgtype0x98$ModBlock:uint32_op	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   8026: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   8029: pop
    //   8030: aconst_null
    //   8031: astore_1
    //   8032: goto -7812 -> 220
    //   8035: aload 25
    //   8037: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   8040: ldc2_w 1878
    //   8043: lcmp
    //   8044: ifne +110 -> 8154
    //   8047: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   8050: ifeq +12 -> 8062
    //   8053: ldc 63
    //   8055: iconst_2
    //   8056: ldc_w 1881
    //   8059: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   8062: new 1883	tencent/im/s2c/msgtype0x210/submsgtype0x9d/SubMsgType0x9d$MsgBody
    //   8065: dup
    //   8066: invokespecial 1884	tencent/im/s2c/msgtype0x210/submsgtype0x9d/SubMsgType0x9d$MsgBody:<init>	()V
    //   8069: astore_1
    //   8070: aload_1
    //   8071: aload 25
    //   8073: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   8076: invokevirtual 1885	tencent/im/s2c/msgtype0x210/submsgtype0x9d/SubMsgType0x9d$MsgBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   8079: pop
    //   8080: aload_1
    //   8081: getfield 1886	tencent/im/s2c/msgtype0x210/submsgtype0x9d/SubMsgType0x9d$MsgBody:uint32_sub_cmd	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   8084: invokevirtual 615	com/tencent/mobileqq/pb/PBUInt32Field:has	()Z
    //   8087: ifeq +43 -> 8130
    //   8090: aload_1
    //   8091: getfield 1889	tencent/im/s2c/msgtype0x210/submsgtype0x9d/SubMsgType0x9d$MsgBody:lola_module_update	Lcom/tencent/mobileqq/pb/PBRepeatMessageField;
    //   8094: invokevirtual 1106	com/tencent/mobileqq/pb/PBRepeatMessageField:has	()Z
    //   8097: ifeq +33 -> 8130
    //   8100: aload_0
    //   8101: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   8104: sipush 143
    //   8107: invokevirtual 167	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   8110: checkcast 1891	com/tencent/bitapp/BitAppManager
    //   8113: aload_1
    //   8114: getfield 1886	tencent/im/s2c/msgtype0x210/submsgtype0x9d/SubMsgType0x9d$MsgBody:uint32_sub_cmd	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   8117: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   8120: aload_1
    //   8121: getfield 1889	tencent/im/s2c/msgtype0x210/submsgtype0x9d/SubMsgType0x9d$MsgBody:lola_module_update	Lcom/tencent/mobileqq/pb/PBRepeatMessageField;
    //   8124: invokevirtual 562	com/tencent/mobileqq/pb/PBRepeatMessageField:get	()Ljava/util/List;
    //   8127: invokevirtual 1894	com/tencent/bitapp/BitAppManager:a	(ILjava/util/List;)V
    //   8130: aconst_null
    //   8131: astore_1
    //   8132: goto -7912 -> 220
    //   8135: astore_1
    //   8136: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   8139: ifeq -8109 -> 30
    //   8142: ldc 63
    //   8144: iconst_2
    //   8145: ldc_w 1896
    //   8148: aload_1
    //   8149: invokestatic 761	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   8152: aconst_null
    //   8153: areturn
    //   8154: aload 25
    //   8156: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   8159: ldc2_w 1897
    //   8162: lcmp
    //   8163: ifne +90 -> 8253
    //   8166: new 1900	tencent/im/s2c/msgtype0x210/submsgtype0xa0/submsgtype0xa0$MsgBody
    //   8169: dup
    //   8170: invokespecial 1901	tencent/im/s2c/msgtype0x210/submsgtype0xa0/submsgtype0xa0$MsgBody:<init>	()V
    //   8173: astore_1
    //   8174: aload_1
    //   8175: aload 25
    //   8177: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   8180: invokevirtual 1902	tencent/im/s2c/msgtype0x210/submsgtype0xa0/submsgtype0xa0$MsgBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   8183: pop
    //   8184: aload_1
    //   8185: getfield 1905	tencent/im/s2c/msgtype0x210/submsgtype0xa0/submsgtype0xa0$MsgBody:uint32_is_mass_bless_open	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   8188: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   8191: istore 4
    //   8193: iload 4
    //   8195: ifne +29 -> 8224
    //   8198: iconst_1
    //   8199: istore 15
    //   8201: aload_0
    //   8202: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   8205: sipush 137
    //   8208: invokevirtual 167	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   8211: checkcast 1907	com/tencent/mobileqq/activity/bless/BlessManager
    //   8214: iload 15
    //   8216: invokevirtual 1910	com/tencent/mobileqq/activity/bless/BlessManager:c	(Z)V
    //   8219: aconst_null
    //   8220: astore_1
    //   8221: goto -8001 -> 220
    //   8224: iconst_0
    //   8225: istore 15
    //   8227: goto -26 -> 8201
    //   8230: astore_1
    //   8231: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   8234: ifeq +13 -> 8247
    //   8237: ldc_w 1912
    //   8240: iconst_2
    //   8241: ldc_w 1914
    //   8244: invokestatic 792	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   8247: iconst_1
    //   8248: istore 15
    //   8250: goto -49 -> 8201
    //   8253: aload 25
    //   8255: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   8258: ldc2_w 1915
    //   8261: lcmp
    //   8262: ifne +557 -> 8819
    //   8265: iconst_0
    //   8266: istore 15
    //   8268: aload_0
    //   8269: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   8272: invokevirtual 1714	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   8275: ldc_w 1918
    //   8278: invokevirtual 1921	com/tencent/qphone/base/util/BaseApplication:getSystemService	(Ljava/lang/String;)Ljava/lang/Object;
    //   8281: checkcast 1923	android/app/ActivityManager
    //   8284: iconst_1
    //   8285: invokevirtual 1927	android/app/ActivityManager:getRunningTasks	(I)Ljava/util/List;
    //   8288: astore_1
    //   8289: aload_1
    //   8290: ifnull +1390 -> 9680
    //   8293: aload_1
    //   8294: invokeinterface 565 1 0
    //   8299: iconst_1
    //   8300: if_icmplt +1380 -> 9680
    //   8303: aload_1
    //   8304: iconst_0
    //   8305: invokeinterface 1242 2 0
    //   8310: checkcast 1929	android/app/ActivityManager$RunningTaskInfo
    //   8313: getfield 1933	android/app/ActivityManager$RunningTaskInfo:topActivity	Landroid/content/ComponentName;
    //   8316: invokevirtual 1938	android/content/ComponentName:getClassName	()Ljava/lang/String;
    //   8319: astore_1
    //   8320: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   8323: ifeq +29 -> 8352
    //   8326: ldc 63
    //   8328: iconst_2
    //   8329: new 80	java/lang/StringBuilder
    //   8332: dup
    //   8333: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   8336: ldc_w 1940
    //   8339: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   8342: aload_1
    //   8343: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   8346: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   8349: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   8352: ldc_w 1942
    //   8355: aload_1
    //   8356: invokevirtual 597	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   8359: istore 16
    //   8361: iload 16
    //   8363: istore 15
    //   8365: aload_0
    //   8366: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   8369: invokevirtual 1714	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   8372: ldc_w 1944
    //   8375: invokevirtual 1921	com/tencent/qphone/base/util/BaseApplication:getSystemService	(Ljava/lang/String;)Ljava/lang/Object;
    //   8378: checkcast 1946	android/os/PowerManager
    //   8381: invokevirtual 1949	android/os/PowerManager:isScreenOn	()Z
    //   8384: istore 16
    //   8386: iload 16
    //   8388: ifeq +18 -> 8406
    //   8391: aload_0
    //   8392: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   8395: getfield 1952	com/tencent/mobileqq/app/QQAppInterface:isBackground_Pause	Z
    //   8398: ifeq +344 -> 8742
    //   8401: iload 15
    //   8403: ifne +339 -> 8742
    //   8406: new 1954	tencent/im/s2c/msgtype0x210/submsgtype0xa4/submsgtype0xa4$MsgBody
    //   8409: dup
    //   8410: invokespecial 1955	tencent/im/s2c/msgtype0x210/submsgtype0xa4/submsgtype0xa4$MsgBody:<init>	()V
    //   8413: astore 23
    //   8415: aconst_null
    //   8416: astore_1
    //   8417: aconst_null
    //   8418: astore 21
    //   8420: aconst_null
    //   8421: astore 22
    //   8423: aload 23
    //   8425: aload 25
    //   8427: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   8430: invokevirtual 1956	tencent/im/s2c/msgtype0x210/submsgtype0xa4/submsgtype0xa4$MsgBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   8433: pop
    //   8434: aload 23
    //   8436: getfield 1959	tencent/im/s2c/msgtype0x210/submsgtype0xa4/submsgtype0xa4$MsgBody:bytes_title	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   8439: invokevirtual 1004	com/tencent/mobileqq/pb/PBBytesField:has	()Z
    //   8442: ifeq +15 -> 8457
    //   8445: aload 23
    //   8447: getfield 1959	tencent/im/s2c/msgtype0x210/submsgtype0xa4/submsgtype0xa4$MsgBody:bytes_title	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   8450: invokevirtual 589	com/tencent/mobileqq/pb/PBBytesField:get	()Lcom/tencent/mobileqq/pb/ByteStringMicro;
    //   8453: invokevirtual 594	com/tencent/mobileqq/pb/ByteStringMicro:toStringUtf8	()Ljava/lang/String;
    //   8456: astore_1
    //   8457: aload 23
    //   8459: getfield 1962	tencent/im/s2c/msgtype0x210/submsgtype0xa4/submsgtype0xa4$MsgBody:bytes_brief	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   8462: invokevirtual 1004	com/tencent/mobileqq/pb/PBBytesField:has	()Z
    //   8465: ifeq +16 -> 8481
    //   8468: aload 23
    //   8470: getfield 1962	tencent/im/s2c/msgtype0x210/submsgtype0xa4/submsgtype0xa4$MsgBody:bytes_brief	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   8473: invokevirtual 589	com/tencent/mobileqq/pb/PBBytesField:get	()Lcom/tencent/mobileqq/pb/ByteStringMicro;
    //   8476: invokevirtual 594	com/tencent/mobileqq/pb/ByteStringMicro:toStringUtf8	()Ljava/lang/String;
    //   8479: astore 21
    //   8481: aload 23
    //   8483: getfield 1965	tencent/im/s2c/msgtype0x210/submsgtype0xa4/submsgtype0xa4$MsgBody:bytes_url	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   8486: invokevirtual 1004	com/tencent/mobileqq/pb/PBBytesField:has	()Z
    //   8489: ifeq +16 -> 8505
    //   8492: aload 23
    //   8494: getfield 1965	tencent/im/s2c/msgtype0x210/submsgtype0xa4/submsgtype0xa4$MsgBody:bytes_url	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   8497: invokevirtual 589	com/tencent/mobileqq/pb/PBBytesField:get	()Lcom/tencent/mobileqq/pb/ByteStringMicro;
    //   8500: invokevirtual 594	com/tencent/mobileqq/pb/ByteStringMicro:toStringUtf8	()Ljava/lang/String;
    //   8503: astore 22
    //   8505: aload_1
    //   8506: invokestatic 1780	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   8509: ifne +233 -> 8742
    //   8512: aload 21
    //   8514: invokestatic 1780	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   8517: ifne +225 -> 8742
    //   8520: aload 22
    //   8522: invokestatic 1780	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   8525: ifne +217 -> 8742
    //   8528: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   8531: ifeq +51 -> 8582
    //   8534: ldc 63
    //   8536: iconst_2
    //   8537: new 80	java/lang/StringBuilder
    //   8540: dup
    //   8541: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   8544: ldc_w 1967
    //   8547: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   8550: aload_1
    //   8551: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   8554: ldc_w 1969
    //   8557: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   8560: aload 21
    //   8562: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   8565: ldc_w 1971
    //   8568: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   8571: aload 22
    //   8573: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   8576: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   8579: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   8582: new 920	android/content/Intent
    //   8585: dup
    //   8586: aload_0
    //   8587: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   8590: invokevirtual 1714	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   8593: ldc_w 1973
    //   8596: invokespecial 1976	android/content/Intent:<init>	(Landroid/content/Context;Ljava/lang/Class;)V
    //   8599: astore 23
    //   8601: aload 23
    //   8603: ldc_w 1978
    //   8606: aload 22
    //   8608: invokevirtual 944	android/content/Intent:putExtra	(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    //   8611: pop
    //   8612: aload 23
    //   8614: ldc_w 1980
    //   8617: sipush 3001
    //   8620: invokevirtual 1983	android/content/Intent:putExtra	(Ljava/lang/String;I)Landroid/content/Intent;
    //   8623: pop
    //   8624: new 1985	com/tencent/qphone/base/remote/ToServiceMsg
    //   8627: dup
    //   8628: ldc_w 1987
    //   8631: aload_0
    //   8632: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   8635: invokevirtual 567	com/tencent/mobileqq/app/QQAppInterface:a	()Ljava/lang/String;
    //   8638: ldc_w 1989
    //   8641: invokespecial 1992	com/tencent/qphone/base/remote/ToServiceMsg:<init>	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   8644: astore 22
    //   8646: aload 22
    //   8648: getfield 1996	com/tencent/qphone/base/remote/ToServiceMsg:extraData	Landroid/os/Bundle;
    //   8651: ldc_w 1998
    //   8654: iconst_3
    //   8655: anewarray 106	java/lang/String
    //   8658: dup
    //   8659: iconst_0
    //   8660: aload 21
    //   8662: aastore
    //   8663: dup
    //   8664: iconst_1
    //   8665: aload_1
    //   8666: aastore
    //   8667: dup
    //   8668: iconst_2
    //   8669: aload 21
    //   8671: aastore
    //   8672: invokevirtual 2002	android/os/Bundle:putStringArray	(Ljava/lang/String;[Ljava/lang/String;)V
    //   8675: aload 22
    //   8677: getfield 1996	com/tencent/qphone/base/remote/ToServiceMsg:extraData	Landroid/os/Bundle;
    //   8680: ldc_w 2004
    //   8683: aload 23
    //   8685: invokevirtual 2008	android/os/Bundle:putParcelable	(Ljava/lang/String;Landroid/os/Parcelable;)V
    //   8688: aload 22
    //   8690: getfield 1996	com/tencent/qphone/base/remote/ToServiceMsg:extraData	Landroid/os/Bundle;
    //   8693: ldc_w 2010
    //   8696: aconst_null
    //   8697: invokevirtual 2008	android/os/Bundle:putParcelable	(Ljava/lang/String;Landroid/os/Parcelable;)V
    //   8700: aload_0
    //   8701: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   8704: aload 22
    //   8706: invokevirtual 2013	com/tencent/mobileqq/app/QQAppInterface:a	(Lcom/tencent/qphone/base/remote/ToServiceMsg;)V
    //   8709: aconst_null
    //   8710: ldc_w 2015
    //   8713: ldc_w 391
    //   8716: ldc_w 391
    //   8719: ldc_w 2017
    //   8722: ldc_w 2017
    //   8725: iconst_0
    //   8726: iconst_0
    //   8727: ldc_w 391
    //   8730: ldc_w 391
    //   8733: ldc_w 391
    //   8736: ldc_w 391
    //   8739: invokestatic 1133	com/tencent/mobileqq/statistics/ReportController:b	(Lcom/tencent/mobileqq/app/QQAppInterface;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   8742: aconst_null
    //   8743: astore_1
    //   8744: goto -8524 -> 220
    //   8747: astore_1
    //   8748: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   8751: ifeq +12 -> 8763
    //   8754: ldc 63
    //   8756: iconst_2
    //   8757: ldc_w 2019
    //   8760: invokestatic 792	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   8763: aload_1
    //   8764: invokevirtual 325	java/lang/Exception:printStackTrace	()V
    //   8767: goto -402 -> 8365
    //   8770: astore_1
    //   8771: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   8774: ifeq +12 -> 8786
    //   8777: ldc 63
    //   8779: iconst_2
    //   8780: ldc_w 2021
    //   8783: invokestatic 792	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   8786: aload_1
    //   8787: invokevirtual 325	java/lang/Exception:printStackTrace	()V
    //   8790: iconst_1
    //   8791: istore 16
    //   8793: goto -407 -> 8386
    //   8796: astore_1
    //   8797: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   8800: ifeq +12 -> 8812
    //   8803: ldc 63
    //   8805: iconst_2
    //   8806: ldc_w 2023
    //   8809: invokestatic 792	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   8812: aload_1
    //   8813: invokevirtual 325	java/lang/Exception:printStackTrace	()V
    //   8816: goto -74 -> 8742
    //   8819: aload 25
    //   8821: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   8824: ldc2_w 2024
    //   8827: lcmp
    //   8828: ifne +290 -> 9118
    //   8831: aload 25
    //   8833: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   8836: ifnull +282 -> 9118
    //   8839: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   8842: ifeq +12 -> 8854
    //   8845: ldc 63
    //   8847: iconst_2
    //   8848: ldc_w 2027
    //   8851: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   8854: aload_0
    //   8855: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   8858: sipush 142
    //   8861: invokevirtual 167	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   8864: checkcast 2029	com/tencent/mobileqq/qcall/PstnManager
    //   8867: invokevirtual 2031	com/tencent/mobileqq/qcall/PstnManager:a	()I
    //   8870: iconst_1
    //   8871: if_icmpne +209 -> 9080
    //   8874: new 2033	tencent/im/s2c/msgtype0x210/submsgtype0x9e/SubmsgType0x9e$MsgBody
    //   8877: dup
    //   8878: invokespecial 2034	tencent/im/s2c/msgtype0x210/submsgtype0x9e/SubmsgType0x9e$MsgBody:<init>	()V
    //   8881: astore 21
    //   8883: aload 21
    //   8885: aload 25
    //   8887: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   8890: invokevirtual 2035	tencent/im/s2c/msgtype0x210/submsgtype0x9e/SubmsgType0x9e$MsgBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   8893: checkcast 2033	tencent/im/s2c/msgtype0x210/submsgtype0x9e/SubmsgType0x9e$MsgBody
    //   8896: astore 21
    //   8898: sipush 63491
    //   8901: invokestatic 247	com/tencent/mobileqq/service/message/MessageRecordFactory:a	(I)Lcom/tencent/mobileqq/data/MessageRecord;
    //   8904: astore 22
    //   8906: aload 21
    //   8908: getfield 2038	tencent/im/s2c/msgtype0x210/submsgtype0x9e/SubmsgType0x9e$MsgBody:bytes_wording	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   8911: invokevirtual 589	com/tencent/mobileqq/pb/PBBytesField:get	()Lcom/tencent/mobileqq/pb/ByteStringMicro;
    //   8914: invokevirtual 594	com/tencent/mobileqq/pb/ByteStringMicro:toStringUtf8	()Ljava/lang/String;
    //   8917: astore 23
    //   8919: aload 21
    //   8921: getfield 2039	tencent/im/s2c/msgtype0x210/submsgtype0x9e/SubmsgType0x9e$MsgBody:bytes_url	Lcom/tencent/mobileqq/pb/PBBytesField;
    //   8924: invokevirtual 589	com/tencent/mobileqq/pb/PBBytesField:get	()Lcom/tencent/mobileqq/pb/ByteStringMicro;
    //   8927: invokevirtual 594	com/tencent/mobileqq/pb/ByteStringMicro:toStringUtf8	()Ljava/lang/String;
    //   8930: astore 24
    //   8932: aload 21
    //   8934: getfield 2042	tencent/im/s2c/msgtype0x210/submsgtype0x9e/SubmsgType0x9e$MsgBody:uint32_auth_key	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   8937: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   8940: invokestatic 2046	com/tencent/mobileqq/qcall/UinUtils:a	(I)Ljava/lang/String;
    //   8943: astore 25
    //   8945: aload 21
    //   8947: getfield 2047	tencent/im/s2c/msgtype0x210/submsgtype0x9e/SubmsgType0x9e$MsgBody:uint32_type	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   8950: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   8953: istore 5
    //   8955: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   8958: ifeq +822 -> 9780
    //   8961: ldc 63
    //   8963: iconst_2
    //   8964: iconst_3
    //   8965: anewarray 982	java/lang/Object
    //   8968: dup
    //   8969: iconst_0
    //   8970: ldc_w 2049
    //   8973: aastore
    //   8974: dup
    //   8975: iconst_1
    //   8976: iload 5
    //   8978: invokestatic 226	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   8981: aastore
    //   8982: dup
    //   8983: iconst_2
    //   8984: aload 21
    //   8986: getfield 2042	tencent/im/s2c/msgtype0x210/submsgtype0x9e/SubmsgType0x9e$MsgBody:uint32_auth_key	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   8989: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   8992: invokestatic 226	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   8995: aastore
    //   8996: invokestatic 2052	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;I[Ljava/lang/Object;)V
    //   8999: goto +781 -> 9780
    //   9002: aload 22
    //   9004: aload_0
    //   9005: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   9008: invokevirtual 567	com/tencent/mobileqq/app/QQAppInterface:a	()Ljava/lang/String;
    //   9011: aload 25
    //   9013: aload 25
    //   9015: new 80	java/lang/StringBuilder
    //   9018: dup
    //   9019: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   9022: aload 23
    //   9024: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   9027: ldc_w 2054
    //   9030: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   9033: aload 24
    //   9035: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   9038: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   9041: lconst_0
    //   9042: sipush 63491
    //   9045: iload 4
    //   9047: aload_1
    //   9048: invokevirtual 1603	OnlinePushPack/MsgInfo:getShMsgSeq	()S
    //   9051: i2l
    //   9052: invokevirtual 2055	com/tencent/mobileqq/data/MessageRecord:init	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JIIJ)V
    //   9055: aload 22
    //   9057: iconst_1
    //   9058: putfield 259	com/tencent/mobileqq/data/MessageRecord:isread	Z
    //   9061: aload_0
    //   9062: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   9065: invokevirtual 499	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/app/message/QQMessageFacade;
    //   9068: aload 22
    //   9070: aload_0
    //   9071: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   9074: invokevirtual 567	com/tencent/mobileqq/app/QQAppInterface:a	()Ljava/lang/String;
    //   9077: invokevirtual 850	com/tencent/mobileqq/app/message/QQMessageFacade:a	(Lcom/tencent/mobileqq/data/MessageRecord;Ljava/lang/String;)V
    //   9080: aconst_null
    //   9081: astore_1
    //   9082: goto -8862 -> 220
    //   9085: iload 5
    //   9087: iconst_2
    //   9088: if_icmpne -86 -> 9002
    //   9091: sipush 3000
    //   9094: istore 4
    //   9096: goto -94 -> 9002
    //   9099: astore_1
    //   9100: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   9103: ifeq -23 -> 9080
    //   9106: ldc 63
    //   9108: iconst_2
    //   9109: ldc_w 2057
    //   9112: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   9115: goto -35 -> 9080
    //   9118: aload 25
    //   9120: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   9123: ldc2_w 1897
    //   9126: lcmp
    //   9127: ifne +90 -> 9217
    //   9130: new 1900	tencent/im/s2c/msgtype0x210/submsgtype0xa0/submsgtype0xa0$MsgBody
    //   9133: dup
    //   9134: invokespecial 1901	tencent/im/s2c/msgtype0x210/submsgtype0xa0/submsgtype0xa0$MsgBody:<init>	()V
    //   9137: astore_1
    //   9138: aload_1
    //   9139: aload 25
    //   9141: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   9144: invokevirtual 1902	tencent/im/s2c/msgtype0x210/submsgtype0xa0/submsgtype0xa0$MsgBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   9147: pop
    //   9148: aload_1
    //   9149: getfield 1905	tencent/im/s2c/msgtype0x210/submsgtype0xa0/submsgtype0xa0$MsgBody:uint32_is_mass_bless_open	Lcom/tencent/mobileqq/pb/PBUInt32Field;
    //   9152: invokevirtual 617	com/tencent/mobileqq/pb/PBUInt32Field:get	()I
    //   9155: istore 4
    //   9157: iload 4
    //   9159: ifne +29 -> 9188
    //   9162: iconst_1
    //   9163: istore 15
    //   9165: aload_0
    //   9166: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   9169: sipush 137
    //   9172: invokevirtual 167	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   9175: checkcast 1907	com/tencent/mobileqq/activity/bless/BlessManager
    //   9178: iload 15
    //   9180: invokevirtual 1910	com/tencent/mobileqq/activity/bless/BlessManager:c	(Z)V
    //   9183: aconst_null
    //   9184: astore_1
    //   9185: goto -8965 -> 220
    //   9188: iconst_0
    //   9189: istore 15
    //   9191: goto -26 -> 9165
    //   9194: astore_1
    //   9195: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   9198: ifeq +13 -> 9211
    //   9201: ldc_w 1912
    //   9204: iconst_2
    //   9205: ldc_w 1914
    //   9208: invokestatic 792	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   9211: iconst_1
    //   9212: istore 15
    //   9214: goto -49 -> 9165
    //   9217: aload 25
    //   9219: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   9222: ldc2_w 2058
    //   9225: lcmp
    //   9226: ifne +49 -> 9275
    //   9229: new 2061	tencent/im/s2c/msgtype0x210/submsgtype0xa1/submsgtype0xa1$MsgBody
    //   9232: dup
    //   9233: invokespecial 2062	tencent/im/s2c/msgtype0x210/submsgtype0xa1/submsgtype0xa1$MsgBody:<init>	()V
    //   9236: astore_1
    //   9237: aload_1
    //   9238: aload 25
    //   9240: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   9243: invokevirtual 2063	tencent/im/s2c/msgtype0x210/submsgtype0xa1/submsgtype0xa1$MsgBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   9246: pop
    //   9247: aload_0
    //   9248: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   9251: sipush 136
    //   9254: invokevirtual 167	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   9257: checkcast 2065	com/tencent/mobileqq/troop/org/pb/TroopOrgProtocolManager
    //   9260: aload_1
    //   9261: invokevirtual 2068	com/tencent/mobileqq/troop/org/pb/TroopOrgProtocolManager:a	(Ltencent/im/s2c/msgtype0x210/submsgtype0xa1/submsgtype0xa1$MsgBody;)V
    //   9264: aconst_null
    //   9265: astore_1
    //   9266: goto -9046 -> 220
    //   9269: astore_1
    //   9270: aconst_null
    //   9271: astore_1
    //   9272: goto -25 -> 9247
    //   9275: aload 25
    //   9277: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   9280: ldc2_w 2069
    //   9283: lcmp
    //   9284: ifne +102 -> 9386
    //   9287: new 2072	tencent/im/s2c/msgtype0x210/submsgtype0x9b/SubMsgType0x9b$MsgBody
    //   9290: dup
    //   9291: invokespecial 2073	tencent/im/s2c/msgtype0x210/submsgtype0x9b/SubMsgType0x9b$MsgBody:<init>	()V
    //   9294: astore_1
    //   9295: aload_1
    //   9296: aload 25
    //   9298: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   9301: invokevirtual 2074	tencent/im/s2c/msgtype0x210/submsgtype0x9b/SubMsgType0x9b$MsgBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   9304: pop
    //   9305: aload_0
    //   9306: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   9309: bipush 75
    //   9311: invokevirtual 48	com/tencent/mobileqq/app/QQAppInterface:a	(I)Lcom/tencent/mobileqq/app/BusinessHandler;
    //   9314: checkcast 893	com/tencent/mobileqq/app/utils/DingdongPluginBizHandler
    //   9317: astore 21
    //   9319: aload_0
    //   9320: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   9323: bipush 114
    //   9325: invokevirtual 167	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   9328: checkcast 2076	cooperation/dingdong/DingdongPluginManager
    //   9331: astore 22
    //   9333: aload 21
    //   9335: aload_1
    //   9336: iconst_0
    //   9337: invokevirtual 2079	com/tencent/mobileqq/app/utils/DingdongPluginBizHandler:a	(Ltencent/im/s2c/msgtype0x210/submsgtype0x9b/SubMsgType0x9b$MsgBody;Z)V
    //   9340: aconst_null
    //   9341: astore_1
    //   9342: goto -9122 -> 220
    //   9345: astore 21
    //   9347: ldc 63
    //   9349: iconst_1
    //   9350: new 80	java/lang/StringBuilder
    //   9353: dup
    //   9354: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   9357: ldc_w 2081
    //   9360: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   9363: aload 21
    //   9365: invokevirtual 860	java/lang/Exception:toString	()Ljava/lang/String;
    //   9368: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   9371: ldc_w 2083
    //   9374: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   9377: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   9380: invokestatic 792	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   9383: goto -78 -> 9305
    //   9386: aload 25
    //   9388: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   9391: ldc2_w 2084
    //   9394: lcmp
    //   9395: ifne +84 -> 9479
    //   9398: new 2087	tencent/im/s2c/msgtype0x210/submsgtype0x9c/SubMsgType0x9c$MsgBody
    //   9401: dup
    //   9402: invokespecial 2088	tencent/im/s2c/msgtype0x210/submsgtype0x9c/SubMsgType0x9c$MsgBody:<init>	()V
    //   9405: astore_1
    //   9406: aload_1
    //   9407: aload 25
    //   9409: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   9412: invokevirtual 2089	tencent/im/s2c/msgtype0x210/submsgtype0x9c/SubMsgType0x9c$MsgBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   9415: pop
    //   9416: aload_0
    //   9417: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   9420: bipush 75
    //   9422: invokevirtual 48	com/tencent/mobileqq/app/QQAppInterface:a	(I)Lcom/tencent/mobileqq/app/BusinessHandler;
    //   9425: checkcast 893	com/tencent/mobileqq/app/utils/DingdongPluginBizHandler
    //   9428: aload_1
    //   9429: iconst_0
    //   9430: invokevirtual 2092	com/tencent/mobileqq/app/utils/DingdongPluginBizHandler:a	(Ltencent/im/s2c/msgtype0x210/submsgtype0x9c/SubMsgType0x9c$MsgBody;Z)V
    //   9433: aconst_null
    //   9434: astore_1
    //   9435: goto -9215 -> 220
    //   9438: astore 21
    //   9440: ldc 63
    //   9442: iconst_1
    //   9443: new 80	java/lang/StringBuilder
    //   9446: dup
    //   9447: invokespecial 83	java/lang/StringBuilder:<init>	()V
    //   9450: ldc_w 2094
    //   9453: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   9456: aload 21
    //   9458: invokevirtual 860	java/lang/Exception:toString	()Ljava/lang/String;
    //   9461: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   9464: ldc_w 2083
    //   9467: invokevirtual 89	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   9470: invokevirtual 96	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   9473: invokestatic 792	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   9476: goto -60 -> 9416
    //   9479: aload 25
    //   9481: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   9484: ldc2_w 2095
    //   9487: lcmp
    //   9488: ifne +110 -> 9598
    //   9491: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   9494: ifeq +13 -> 9507
    //   9497: ldc_w 2098
    //   9500: iconst_2
    //   9501: ldc_w 2100
    //   9504: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   9507: new 2102	tencent/qht_exinfo/qht_post_exinfo
    //   9510: dup
    //   9511: invokespecial 2103	tencent/qht_exinfo/qht_post_exinfo:<init>	()V
    //   9514: astore_1
    //   9515: aload_1
    //   9516: aload 25
    //   9518: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   9521: invokevirtual 2104	tencent/qht_exinfo/qht_post_exinfo:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   9524: pop
    //   9525: aload_0
    //   9526: getfield 43	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   9529: bipush 97
    //   9531: invokevirtual 167	com/tencent/mobileqq/app/QQAppInterface:getManager	(I)Lmqq/manager/Manager;
    //   9534: checkcast 2106	com/tencent/mobileqq/troop/utils/TroopTopicMgr
    //   9537: astore 21
    //   9539: aload 21
    //   9541: ifnull +29 -> 9570
    //   9544: aload 21
    //   9546: aload_1
    //   9547: getfield 2109	tencent/qht_exinfo/qht_post_exinfo:groupCode	Lcom/tencent/mobileqq/pb/PBStringField;
    //   9550: invokevirtual 941	com/tencent/mobileqq/pb/PBStringField:get	()Ljava/lang/String;
    //   9553: aload_1
    //   9554: getfield 2112	tencent/qht_exinfo/qht_post_exinfo:msgSeq	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   9557: invokevirtual 553	com/tencent/mobileqq/pb/PBUInt64Field:get	()J
    //   9560: aload_1
    //   9561: getfield 2115	tencent/qht_exinfo/qht_post_exinfo:pVersion	Lcom/tencent/mobileqq/pb/PBUInt64Field;
    //   9564: invokevirtual 553	com/tencent/mobileqq/pb/PBUInt64Field:get	()J
    //   9567: invokevirtual 2118	com/tencent/mobileqq/troop/utils/TroopTopicMgr:a	(Ljava/lang/String;JJ)V
    //   9570: aconst_null
    //   9571: astore_1
    //   9572: goto -9352 -> 220
    //   9575: astore_1
    //   9576: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   9579: ifeq +14 -> 9593
    //   9582: ldc_w 2098
    //   9585: iconst_2
    //   9586: ldc_w 2120
    //   9589: aload_1
    //   9590: invokestatic 761	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   9593: aconst_null
    //   9594: astore_1
    //   9595: goto -9375 -> 220
    //   9598: aload 25
    //   9600: getfield 679	IMMsgBodyPack/MsgType0x210:uSubMsgType	J
    //   9603: ldc2_w 2121
    //   9606: lcmp
    //   9607: ifne +48 -> 9655
    //   9610: new 2124	tencent/im/s2c/msgtype0x210/submsgtype0xa8/SubMsgType0xa8$MsgBody
    //   9613: dup
    //   9614: invokespecial 2125	tencent/im/s2c/msgtype0x210/submsgtype0xa8/SubMsgType0xa8$MsgBody:<init>	()V
    //   9617: astore_1
    //   9618: aload_1
    //   9619: aload 25
    //   9621: getfield 710	IMMsgBodyPack/MsgType0x210:vProtobuf	[B
    //   9624: invokevirtual 2126	tencent/im/s2c/msgtype0x210/submsgtype0xa8/SubMsgType0xa8$MsgBody:mergeFrom	([B)Lcom/tencent/mobileqq/pb/MessageMicro;
    //   9627: pop
    //   9628: aload_0
    //   9629: aload_1
    //   9630: invokevirtual 2129	com/tencent/mobileqq/app/message/OnLinePushMessageProcessor:a	(Ltencent/im/s2c/msgtype0x210/submsgtype0xa8/SubMsgType0xa8$MsgBody;)V
    //   9633: aconst_null
    //   9634: astore_1
    //   9635: goto -9415 -> 220
    //   9638: astore_1
    //   9639: invokestatic 61	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   9642: ifeq +13 -> 9655
    //   9645: ldc_w 2131
    //   9648: iconst_2
    //   9649: ldc_w 2133
    //   9652: invokestatic 69	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   9655: aconst_null
    //   9656: astore_1
    //   9657: goto -9437 -> 220
    //   9660: astore 21
    //   9662: goto -1665 -> 7997
    //   9665: astore 21
    //   9667: goto -2620 -> 7047
    //   9670: astore 23
    //   9672: goto -6265 -> 3407
    //   9675: astore 23
    //   9677: goto -6270 -> 3407
    //   9680: iconst_0
    //   9681: istore 15
    //   9683: goto -1318 -> 8365
    //   9686: iconst_0
    //   9687: istore 5
    //   9689: goto -5640 -> 4049
    //   9692: iconst_0
    //   9693: istore 4
    //   9695: goto -5667 -> 4028
    //   9698: aconst_null
    //   9699: astore 23
    //   9701: goto -6400 -> 3301
    //   9704: aconst_null
    //   9705: astore 22
    //   9707: goto -6440 -> 3267
    //   9710: aconst_null
    //   9711: astore 21
    //   9713: goto -6484 -> 3229
    //   9716: goto -8801 -> 915
    //   9719: aconst_null
    //   9720: astore_1
    //   9721: goto -9501 -> 220
    //   9724: ldc_w 391
    //   9727: astore_1
    //   9728: goto -9104 -> 624
    //   9731: iload 6
    //   9733: ifge -5633 -> 4100
    //   9736: iload 7
    //   9738: iflt -5617 -> 4121
    //   9741: goto -5641 -> 4100
    //   9744: iload 4
    //   9746: ifne -5583 -> 4163
    //   9749: iload 5
    //   9751: ifeq -5882 -> 3869
    //   9754: goto -5591 -> 4163
    //   9757: aload 22
    //   9759: astore 21
    //   9761: iload 5
    //   9763: istore 4
    //   9765: goto -3769 -> 5996
    //   9768: sipush 1001
    //   9771: istore 4
    //   9773: aload 22
    //   9775: astore 21
    //   9777: goto -3781 -> 5996
    //   9780: iconst_0
    //   9781: istore 4
    //   9783: iload 5
    //   9785: iconst_3
    //   9786: if_icmpne -701 -> 9085
    //   9789: iconst_0
    //   9790: istore 4
    //   9792: goto -790 -> 9002
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	9795	0	this	OnLinePushMessageProcessor
    //   0	9795	1	paramMsgInfo	MsgInfo
    //   0	9795	2	paramLong	long
    //   470	9321	4	i	int
    //   2116	7671	5	j	int
    //   4050	5682	6	k	int
    //   4053	5684	7	m	int
    //   7186	605	8	n	int
    //   7529	61	9	i1	int
    //   7541	56	10	i2	int
    //   7553	54	11	i3	int
    //   7563	41	12	i4	int
    //   2110	4500	13	l	long
    //   195	9487	15	bool1	boolean
    //   7102	1690	16	bool2	boolean
    //   7130	699	17	bool3	boolean
    //   7144	698	18	bool4	boolean
    //   7158	697	19	bool5	boolean
    //   7350	536	20	bool6	boolean
    //   110	1975	21	localObject1	Object
    //   2137	1	21	localException1	Exception
    //   2262	401	21	localObject2	Object
    //   2679	26	21	localInvalidProtocolBufferMicroException1	com.tencent.mobileqq.pb.InvalidProtocolBufferMicroException
    //   3146	298	21	localObject3	Object
    //   3450	3	21	localInvalidProtocolBufferMicroException2	com.tencent.mobileqq.pb.InvalidProtocolBufferMicroException
    //   3590	5744	21	localObject4	Object
    //   9345	19	21	localException2	Exception
    //   9438	19	21	localException3	Exception
    //   9537	8	21	localTroopTopicMgr	com.tencent.mobileqq.troop.utils.TroopTopicMgr
    //   9660	1	21	localThrowable1	Throwable
    //   9665	1	21	localThrowable2	Throwable
    //   9711	65	21	localObject5	Object
    //   173	2200	22	localObject6	Object
    //   2383	36	22	localInvalidProtocolBufferMicroException3	com.tencent.mobileqq.pb.InvalidProtocolBufferMicroException
    //   3186	6588	22	localObject7	Object
    //   758	2590	23	localObject8	Object
    //   3405	1	23	localException4	Exception
    //   3417	5606	23	localObject9	Object
    //   9670	1	23	localException5	Exception
    //   9675	1	23	localException6	Exception
    //   9699	1	23	localObject10	Object
    //   875	8159	24	localObject11	Object
    //   23	9597	25	localObject12	Object
    //   1882	1558	26	localMsgBody	SubMsgType0x51.MsgBody
    // Exception table:
    //   from	to	target	type
    //   446	505	510	java/lang/Exception
    //   884	897	1089	java/lang/Exception
    //   901	915	1089	java/lang/Exception
    //   919	960	1089	java/lang/Exception
    //   960	1050	1089	java/lang/Exception
    //   1050	1069	1089	java/lang/Exception
    //   1069	1074	1089	java/lang/Exception
    //   544	560	1134	java/lang/Exception
    //   560	624	1134	java/lang/Exception
    //   624	661	1134	java/lang/Exception
    //   661	694	1134	java/lang/Exception
    //   694	800	1134	java/lang/Exception
    //   800	839	1134	java/lang/Exception
    //   839	884	1134	java/lang/Exception
    //   1074	1079	1134	java/lang/Exception
    //   1126	1131	1134	java/lang/Exception
    //   1157	1164	1134	java/lang/Exception
    //   884	897	1156	finally
    //   901	915	1156	finally
    //   919	960	1156	finally
    //   960	1050	1156	finally
    //   1050	1069	1156	finally
    //   1069	1074	1156	finally
    //   1090	1126	1156	finally
    //   1358	1382	1398	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   1387	1393	1398	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   1446	1470	1486	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   1475	1481	1486	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   1538	1655	1774	java/lang/Exception
    //   1660	1678	1774	java/lang/Exception
    //   1678	1769	1774	java/lang/Exception
    //   1875	1895	2137	java/lang/Exception
    //   1895	1929	2137	java/lang/Exception
    //   1929	1963	2137	java/lang/Exception
    //   1963	1997	2137	java/lang/Exception
    //   1997	2021	2137	java/lang/Exception
    //   2021	2077	2137	java/lang/Exception
    //   2077	2095	2137	java/lang/Exception
    //   2264	2275	2383	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   2616	2626	2679	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   3191	3225	3405	java/lang/Exception
    //   3094	3110	3450	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   3110	3177	3450	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   3191	3225	3450	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   3229	3263	3450	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   3267	3301	3450	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   3313	3363	3450	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   3419	3435	3450	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   3496	3512	3450	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   3583	3622	4249	java/lang/Exception
    //   3625	3646	4249	java/lang/Exception
    //   3654	3678	4249	java/lang/Exception
    //   3691	3712	4249	java/lang/Exception
    //   3712	3733	4249	java/lang/Exception
    //   3733	3753	4249	java/lang/Exception
    //   3753	3774	4249	java/lang/Exception
    //   3774	3840	4249	java/lang/Exception
    //   3840	3854	4249	java/lang/Exception
    //   3859	3869	4249	java/lang/Exception
    //   3869	3906	4249	java/lang/Exception
    //   3919	3979	4249	java/lang/Exception
    //   3981	4001	4249	java/lang/Exception
    //   4001	4028	4249	java/lang/Exception
    //   4028	4049	4249	java/lang/Exception
    //   4055	4076	4249	java/lang/Exception
    //   4076	4097	4249	java/lang/Exception
    //   4100	4121	4249	java/lang/Exception
    //   4121	4160	4249	java/lang/Exception
    //   4163	4207	4249	java/lang/Exception
    //   4207	4246	4249	java/lang/Exception
    //   4296	4323	4249	java/lang/Exception
    //   4323	4372	4249	java/lang/Exception
    //   4372	4399	4249	java/lang/Exception
    //   4399	4426	4249	java/lang/Exception
    //   4426	4445	4249	java/lang/Exception
    //   4468	4478	4525	java/lang/Throwable
    //   4964	5057	5172	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   5057	5128	5172	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   5134	5167	5172	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   5250	5276	5281	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   5369	5421	5426	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   5514	5524	5603	java/lang/Exception
    //   5528	5539	5603	java/lang/Exception
    //   5548	5592	5603	java/lang/Exception
    //   5655	5812	5877	java/lang/Exception
    //   5812	5871	5877	java/lang/Exception
    //   5888	5895	5877	java/lang/Exception
    //   5930	5941	6207	java/lang/Exception
    //   5957	5996	6207	java/lang/Exception
    //   5996	6142	6207	java/lang/Exception
    //   6142	6201	6207	java/lang/Exception
    //   6223	6236	6207	java/lang/Exception
    //   6244	6257	6207	java/lang/Exception
    //   6260	6267	6207	java/lang/Exception
    //   6302	6459	6526	java/lang/Exception
    //   6459	6520	6526	java/lang/Exception
    //   6537	6544	6526	java/lang/Exception
    //   6641	6651	6697	java/lang/Throwable
    //   6778	6798	6803	java/lang/Exception
    //   6872	6884	6889	java/lang/Throwable
    //   6934	6993	6998	java/lang/Exception
    //   8070	8080	8135	com/tencent/mobileqq/pb/InvalidProtocolBufferMicroException
    //   8174	8193	8230	java/lang/Exception
    //   8268	8289	8747	java/lang/Exception
    //   8293	8352	8747	java/lang/Exception
    //   8352	8361	8747	java/lang/Exception
    //   8365	8386	8770	java/lang/Exception
    //   8423	8434	8796	java/lang/Exception
    //   8434	8457	8796	java/lang/Exception
    //   8457	8481	8796	java/lang/Exception
    //   8481	8505	8796	java/lang/Exception
    //   8505	8582	8796	java/lang/Exception
    //   8582	8742	8796	java/lang/Exception
    //   8883	8999	9099	java/lang/Exception
    //   9002	9080	9099	java/lang/Exception
    //   9138	9157	9194	java/lang/Exception
    //   9237	9247	9269	java/lang/Exception
    //   9295	9305	9345	java/lang/Exception
    //   9406	9416	9438	java/lang/Exception
    //   9507	9539	9575	java/lang/Exception
    //   9544	9570	9575	java/lang/Exception
    //   9618	9633	9638	java/lang/Exception
    //   7987	7997	9660	java/lang/Throwable
    //   7037	7047	9665	java/lang/Throwable
    //   3229	3263	9670	java/lang/Exception
    //   3267	3301	9675	java/lang/Exception
  }
  
  private nkh b(int paramInt, MsgInfo paramMsgInfo, SvcReqPushMsg paramSvcReqPushMsg)
  {
    return jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a(OnLinePushMsgTypeProcessorDispatcher.a(paramInt)).a(OnLinePushMsgTypeProcessorDispatcher.a(paramInt), paramMsgInfo, paramSvcReqPushMsg);
  }
  
  private void b(long paramLong, byte[] paramArrayOfByte)
  {
    Object localObject1 = new submsgtype0x31.MsgBody();
    int i;
    long l1;
    SubAccountManager localSubAccountManager;
    try
    {
      paramArrayOfByte = (submsgtype0x31.MsgBody)((submsgtype0x31.MsgBody)localObject1).mergeFrom(paramArrayOfByte);
      if (paramArrayOfByte == null)
      {
        paramArrayOfByte = new HashMap();
        paramArrayOfByte.put("param_FailCode", "12017");
        paramArrayOfByte.put("fail_step", "msgbyod_null");
        paramArrayOfByte.put("fail_location", "MessageHandler");
        StatisticCollector.a(BaseApplication.getContext()).a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), "actSBPushNotifaction", false, 0L, 0L, paramArrayOfByte, "");
        return;
      }
    }
    catch (Exception paramArrayOfByte)
    {
      do
      {
        long l2;
        do
        {
          for (;;)
          {
            if (QLog.isColorLevel()) {
              QLog.e("Q.msg.BaseMessageProcessor", 2, "<---decodeC2CMsgPkg_SecretfileReport parse failed.", paramArrayOfByte);
            }
            paramArrayOfByte = null;
          }
          if ((!uint32_flag.has()) || (!uint64_bind_uin.has()) || (!uint64_uin.has()))
          {
            paramArrayOfByte = new HashMap();
            paramArrayOfByte.put("param_FailCode", "12017");
            paramArrayOfByte.put("fail_step", "uinflag_null");
            paramArrayOfByte.put("fail_location", "MessageHandler");
            StatisticCollector.a(BaseApplication.getContext()).a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), "actSBPushNotifaction", false, 0L, 0L, paramArrayOfByte, "");
            return;
          }
          i = uint32_flag.get();
          l1 = uint32_time.get();
          l1 = uint64_uin.get();
          l2 = uint64_bind_uin.get();
          if ((l1 <= 0L) || (l2 <= 0L))
          {
            paramArrayOfByte = new HashMap();
            paramArrayOfByte.put("param_FailCode", "12017");
            paramArrayOfByte.put("fail_step", "uin_error");
            paramArrayOfByte.put("fail_location", "MessageHandler");
            StatisticCollector.a(BaseApplication.getContext()).a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), "actSBPushNotifaction", false, 0L, 0L, paramArrayOfByte, "");
            return;
          }
        } while (!String.valueOf(paramLong).equalsIgnoreCase(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()));
        paramArrayOfByte = new SubAccountBackProtocData();
        c = String.valueOf(l1);
        b = String.valueOf(l2);
        localObject1 = new HashMap();
        ((HashMap)localObject1).put("param_FailCode", "12018");
        ((HashMap)localObject1).put("fail_step", "success_" + i);
        ((HashMap)localObject1).put("fail_location", "MessageHandler");
        StatisticCollector.a(BaseApplication.getContext()).a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), "actSBPushNotifaction", true, 0L, 0L, (HashMap)localObject1, "");
        localObject1 = (SubAccountControll)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(61);
        if (i == 1)
        {
          SubAccountControll.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (byte)0, c);
          SubAccountControll.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, c);
          p = 1;
          ((SubAccountControll)localObject1).a(c, 1);
          a(8004, true, paramArrayOfByte);
          return;
        }
      } while (i != 0);
      localObject1 = String.valueOf(l1);
      localSubAccountManager = (SubAccountManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(60);
      paramArrayOfByte.a((String)localObject1);
      localSubAccountManager.a(paramArrayOfByte);
      Object localObject2 = paramArrayOfByte.a();
      if ((localObject2 != null) && (((ArrayList)localObject2).size() > 0))
      {
        localObject2 = ((ArrayList)localObject2).iterator();
        while (((Iterator)localObject2).hasNext())
        {
          String str = (String)((Iterator)localObject2).next();
          if (QLog.isColorLevel()) {
            QLog.d("SUB_ACCOUNT", 2, "decodeC2CMsgPush() hint is new,msg num=1, subUin=" + str);
          }
          i = 1 - jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(str, 7000);
          if (i != 0) {
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(str, 7000, i);
          }
        }
      }
      boolean bool = false;
      localObject2 = SubAccountControll.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (String)localObject1);
      if (localObject2 != null) {
        bool = ((Boolean)second).booleanValue();
      }
      if (!bool) {
        break label786;
      }
    }
    localSubAccountManager.a((String)localObject1, 1);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getSubAccountKey(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), String.valueOf(l1), new nkf(this, localSubAccountManager));
    for (;;)
    {
      p = 0;
      a(8004, true, paramArrayOfByte);
      return;
      label786:
      if (localSubAccountManager.a(String.valueOf(l1), 2))
      {
        i = 1 - jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a((String)localObject1, 7000);
        if (i != 0)
        {
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c((String)localObject1, 7000, i);
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(new String[] { AppConstants.ag, localObject1 });
        }
        if (QLog.isColorLevel()) {
          QLog.d("SUB_ACCOUNT", 2, "decodeC2CMsgPush() hint need to verify,msg num=1, subUin=" + (String)localObject1);
        }
      }
    }
  }
  
  private boolean b(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      return false;
    }
    return true;
  }
  
  private boolean c(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      return false;
    }
    return true;
  }
  
  private void d(byte[] paramArrayOfByte)
  {
    long l = PkgTools.a(paramArrayOfByte, 0);
    String str = String.valueOf(l);
    int i = paramArrayOfByte[5];
    if (QLog.isColorLevel()) {
      QLog.i("Q.msg.BaseMessageProcessor", 2, "----->handleTroopExitMsg cOp = " + i);
    }
    int j;
    HotChatManager localHotChatManager;
    HotChatInfo localHotChatInfo;
    if (i == 3)
    {
      j = paramArrayOfByte[10];
      if (QLog.isColorLevel()) {
        QLog.i("Q.msg.BaseMessageProcessor", 2, "----->handleTroopExitMsg dwGroupCode = " + l + ", cOp = " + i + ", cSubOp = " + j);
      }
      localHotChatManager = (HotChatManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(59);
      localHotChatInfo = localHotChatManager.a(String.valueOf(l));
      if (j != 3) {
        break label464;
      }
      k = paramArrayOfByte[11];
      if (QLog.isColorLevel()) {
        QLog.i("Q.msg.BaseMessageProcessor", 2, "----->handleTroopExitMsg dwGroupCode = " + l + ", cOp = " + i + ", cSubOp = " + j + ", cSubOp2 = " + k);
      }
      switch (k)
      {
      }
    }
    label464:
    while ((j != 2) || (localHotChatInfo == null))
    {
      do
      {
        do
        {
          do
          {
            int k;
            return;
          } while (localHotChatInfo == null);
          localHotChatManager.a(localHotChatInfo, HotChatManager.HotChatStateWrapper.STATE_HOT_CHAT_IS_DISBANDED);
          HotChatHelper.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localHotChatInfo, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131371128), true);
          ((HotChatHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(35)).a(1041, true, new Object[] { str, HotChatManager.HotChatStateWrapper.STATE_HOT_CHAT_IS_DISBANDED });
          return;
        } while (localHotChatInfo == null);
        localHotChatManager.a(localHotChatInfo, HotChatManager.HotChatStateWrapper.STATE_KICK_OUT);
        HotChatHelper.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localHotChatInfo, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131371126), true);
        ((HotChatHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(35)).a(1041, true, new Object[] { str, HotChatManager.HotChatStateWrapper.STATE_KICK_OUT });
        return;
      } while (localHotChatInfo == null);
      localHotChatManager.a(localHotChatInfo, HotChatManager.HotChatStateWrapper.STATE_KICK_OUT);
      HotChatHelper.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localHotChatInfo, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131371118), true);
      ((HotChatHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(35)).a(1041, true, new Object[] { str, HotChatManager.HotChatStateWrapper.STATE_KICK_OUT });
      return;
    }
    localHotChatManager.a(localHotChatInfo, HotChatManager.HotChatStateWrapper.STATE_LEFT__LONG_TIME_NOT_SAY);
    HotChatHelper.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, localHotChatInfo, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131371125), false);
    ((HotChatHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(35)).a(1041, true, new Object[] { str, HotChatManager.HotChatStateWrapper.STATE_LEFT__LONG_TIME_NOT_SAY });
  }
  
  public List a(msg_comm.Msg paramMsg, PBDecodeContext paramPBDecodeContext)
  {
    return null;
  }
  
  public void a(int paramInt, Object... paramVarArgs)
  {
    switch (paramInt)
    {
    default: 
      return;
    }
    if ((paramVarArgs != null) && (paramVarArgs.length == 3))
    {
      a((ToServiceMsg)paramVarArgs[0], (FromServiceMsg)paramVarArgs[1], (SvcReqPushMsg)paramVarArgs[2]);
      return;
    }
    a(getClass().getName(), paramInt);
  }
  
  public void a(long paramLong, byte[] paramArrayOfByte)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.BaseMessageProcessor", 2, "decodeC2CMsgPkgSubMsgType0x44 parse start");
    }
    try
    {
      paramArrayOfByte = (submsgtype0x44.MsgBody)new submsgtype0x44.MsgBody().mergeFrom(paramArrayOfByte);
      if (paramArrayOfByte == null) {
        return;
      }
    }
    catch (Exception paramArrayOfByte)
    {
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.e("Q.msg.BaseMessageProcessor", 2, "decodeC2CMsgPkgSubMsgType0x44 parse failed.", paramArrayOfByte);
        }
        paramArrayOfByte = null;
      }
      if (QLog.isColorLevel())
      {
        if ((msg_friend_msg_sync.has()) && (msg_friend_msg_sync.get() != null)) {
          QLog.d("Q.msg.BaseMessageProcessor", 2, "decodeC2CMsgPkgSubMsgType0x44 msg_friend_msg_sync processflag=" + msg_friend_msg_sync.uint32_processflag.get() + ";processtype=" + msg_friend_msg_sync.uint32_processtype.get() + ";fuin" + msg_friend_msg_sync.uint64_fuin.get());
        }
        if ((msg_group_msg_sync.has()) && (msg_group_msg_sync.get() != null)) {
          QLog.d("Q.msg.BaseMessageProcessor", 2, "decodeC2CMsgPkgSubMsgType0x44 msg_group_msg_sync processflag=" + msg_group_msg_sync.uint32_processflag.get() + ";processtype=" + msg_group_msg_sync.uint32_msg_type.get() + ";grp_code=" + msg_group_msg_sync.uint64_grp_code.get());
        }
        if ((msg_clean_count_msg.has()) && (msg_clean_count_msg.get() != null)) {
          QLog.d("Q.msg.BaseMessageProcessor", 2, "decodeC2CMsgPkgSubMsgType0x44 msg_clean_count_msg processflag=" + msg_clean_count_msg.uint32_processflag.get());
        }
      }
      if (!msg_friend_msg_sync.has()) {
        break label1206;
      }
    }
    int i;
    label344:
    Object localObject2;
    Object localObject1;
    if (msg_friend_msg_sync.get() != null) {
      if (a(msg_friend_msg_sync.uint32_processflag.get()))
      {
        i = 1;
        if (c(msg_friend_msg_sync.uint32_processtype.get()))
        {
          localObject2 = String.valueOf(msg_friend_msg_sync.uint64_fuin.get());
          if ((!TextUtils.isEmpty((CharSequence)localObject2)) && (StringUtil.d((String)localObject2)))
          {
            localObject1 = (FriendListHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1);
            j = msg_friend_msg_sync.uint32_sourceid.get();
            localObject2 = String.valueOf(localObject2);
            if (!((FriendListHandler)localObject1).a((String)localObject2, 0, j, null, false, false)) {
              ((FriendListHandler)localObject1).a((String)localObject2);
            }
          }
        }
        j = i;
        if (QLog.isColorLevel()) {
          QLog.d("Q.msg.BaseMessageProcessor", 2, "decodeC2CMsgPkgSubMsgType0x44 msg_friend_msg_sync uint32_processflag=" + msg_friend_msg_sync.uint32_processflag.get() + ";uint32_processtype=" + msg_friend_msg_sync.uint32_processtype.get());
        }
      }
    }
    label589:
    label1150:
    label1206:
    for (int j = i;; j = 0)
    {
      if ((msg_group_msg_sync.has()) && (msg_group_msg_sync.get() != null)) {
        if (a(msg_group_msg_sync.uint32_processflag.get()))
        {
          jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a().a(String.valueOf(msg_group_msg_sync.uint64_grp_code.get()), msg_group_msg_sync.uint64_msg_seq.get(), true);
          i = 1;
          if (b(msg_group_msg_sync.uint32_msg_type.get()))
          {
            localObject1 = String.valueOf(msg_group_msg_sync.uint64_grp_code.get());
            Object localObject3 = SystemMsgUtils.a(msg_group_msg_sync.uint64_grp_code.get());
            if ((!TextUtils.isEmpty((CharSequence)localObject1)) && (!TextUtils.isEmpty((CharSequence)localObject3)) && (StringUtil.d((String)localObject1)))
            {
              TroopManager localTroopManager = (TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51);
              if (localTroopManager.a((String)localObject1) == null)
              {
                localObject2 = new TroopInfo();
                troopuin = ((String)localObject1);
                troopcode = ((String)localObject3);
                localTroopManager.a((TroopInfo)localObject2);
                localObject3 = (TroopHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(20);
                ((TroopHandler)localObject3).b(troopuin, false);
                ((TroopHandler)localObject3).a(troopuin, (byte)1, dwTimeStamp, 0);
                ((TroopHandler)localObject3).a(5, true, new Object[] { Integer.valueOf(6), Byte.valueOf(0), localObject1 });
              }
              a(2001, true, null);
            }
          }
          k = i;
          if (QLog.isColorLevel()) {
            QLog.d("Q.msg.BaseMessageProcessor", 2, "decodeC2CMsgPkgSubMsgType0x44 msg_group_msg_sync uint32_processflag=" + msg_group_msg_sync.uint32_processflag.get() + ";uint32_msg_type=" + msg_group_msg_sync.uint32_msg_type.get());
          }
        }
      }
      for (int k = i;; k = 0)
      {
        if ((j != 0) || (k != 0))
        {
          if ((j == 0) || (k == 0)) {
            break label1150;
          }
          jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a().a(4);
        }
        for (;;)
        {
          if ((msg_clean_count_msg.has()) && (msg_clean_count_msg.get() != null))
          {
            if (a(msg_clean_count_msg.uint32_processflag.get()))
            {
              SystemMsgController.a().b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 0);
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(AppConstants.aB, 9000, 0 - GroupSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface));
              GroupSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 0);
              GroupSystemMsgController.a().b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
              FriendSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 0);
              FriendSystemMsgController.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
              localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(Conversation.class);
              if (localObject1 != null) {
                ((MqqHandler)localObject1).sendEmptyMessage(1009);
              }
            }
            if (QLog.isColorLevel()) {
              QLog.d("Q.msg.BaseMessageProcessor", 2, "decodeC2CMsgPkgSubMsgType0x44 msg_clean_count_msg uint32_processflag=" + msg_clean_count_msg.uint32_processflag.get());
            }
          }
          if ((!msg_modify_msg_sync.has()) || (msg_modify_msg_sync.get() == null)) {
            break;
          }
          jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a().b(2);
          if (!QLog.isColorLevel()) {
            break;
          }
          QLog.d("Q.msg.BaseMessageProcessor", 2, "decodeC2CMsgPkgSubMsgType0x44 msg_modify_msg_sync =" + msg_modify_msg_sync.get());
          return;
          if (j != 0) {
            jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a().a(2);
          } else if (k != 0) {
            jdField_a_of_type_ComTencentMobileqqAppMessageHandler.a().a(3);
          }
        }
        i = 0;
        break label589;
      }
      i = 0;
      break label344;
    }
  }
  
  protected void a(String paramString, msg_comm.Msg paramMsg)
  {
    if (QLog.isColorLevel()) {
      QLog.i("Q.msg.BaseMessageProcessor", 2, "handlePttHotChatPushMsg, msg, troopUin = " + paramString);
    }
    if ((paramMsg == null) || (paramString == null) || (paramString.length() == 0)) {
      return;
    }
    ((MessageHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(0)).a("hctopic_processor").a(1001, new Object[] { paramMsg, paramString });
  }
  
  protected void a(String paramString, oidb_0xa88.NoticeBody paramNoticeBody)
  {
    if ((paramNoticeBody == null) || (paramString == null) || (paramString.length() == 0)) {
      return;
    }
    String str = String.valueOf(uint64_guest_uin.get());
    int k = uint32_service_type.get();
    int m = uint32_seat_op.get();
    int n = uint32_seat_id.get();
    if (QLog.isDevelopLevel()) {
      NearbyUtils.a("PttShow", "handlePttHotChatPushMsg", new Object[] { Integer.valueOf(k), Integer.valueOf(n), Integer.valueOf(m), str });
    }
    HotChatManager localHotChatManager = (HotChatManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(59);
    HotChatInfo localHotChatInfo = localHotChatManager.a(paramString);
    if ((localHotChatInfo != null) && (ownerUin != null) && (ownerUin.equalsIgnoreCase(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a()))) {}
    List localList;
    int j;
    for (int i = 1;; i = 0)
    {
      if (!rpt_msg_seats_info.has()) {
        break label656;
      }
      localList = HCSeatInfo.convert(rpt_msg_seats_info.get());
      if ((localList == null) || (localList.size() <= 0) || (i != 0) || (!uint64_white_uin.has())) {
        break;
      }
      paramNoticeBody = uint64_white_uin.get();
      if ((paramNoticeBody == null) || (paramNoticeBody.size() <= 0)) {
        break;
      }
      paramNoticeBody = paramNoticeBody.iterator();
      do
      {
        if (!paramNoticeBody.hasNext()) {
          break;
        }
      } while (((Long)paramNoticeBody.next()).longValue() != jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getLongAccountUin());
      j = 0;
      label272:
      if (j == 0) {
        break;
      }
      if (QLog.isDevelopLevel()) {
        NearbyUtils.a("PttShow", "needDeal", new Object[0]);
      }
      paramNoticeBody = localList.iterator();
      while (paramNoticeBody.hasNext())
      {
        HCSeatInfo localHCSeatInfo = (HCSeatInfo)paramNoticeBody.next();
        if ((localHCSeatInfo != null) && (guestUin == 0L) && (seatFlag == 0))
        {
          seatFlag = 1;
          if (QLog.isDevelopLevel()) {
            NearbyUtils.a("PttShow", "needDeal", new Object[] { Integer.valueOf(seatID) });
          }
        }
      }
    }
    label640:
    label656:
    for (paramNoticeBody = localList;; paramNoticeBody = null)
    {
      if ((localHotChatInfo != null) && (paramNoticeBody != null))
      {
        localHotChatInfo.updateHCSeatInfoList(paramNoticeBody);
        paramNoticeBody = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
        if (localHotChatInfo.getStatus() == 1001) {
          break label640;
        }
        paramNoticeBody.b(localHotChatInfo);
      }
      for (;;)
      {
        paramNoticeBody.a();
        if ((k == 4) && (i == 0)) {
          localHotChatManager.a(true).b(paramString, n);
        }
        if (((k == 3) || (k == 4)) && (i == 0) && (str != null) && (str.equals(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a()))) {
          localHotChatManager.a(true).a(paramString, k);
        }
        ((HotChatHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(35)).a(1045, true, new Object[] { Boolean.valueOf(true), Integer.valueOf(k), paramString, str, Integer.valueOf(0), null, Integer.valueOf(n), Integer.valueOf(m) });
        if (!QLog.isColorLevel()) {
          break;
        }
        NearbyUtils.a("PttShow", new Object[] { "handlePttHotChatPushMsg", Integer.valueOf(k), str, Integer.valueOf(n), Integer.valueOf(m) });
        return;
        paramNoticeBody.a(localHotChatInfo);
      }
      j = 1;
      break label272;
    }
  }
  
  public void a(ArrayList paramArrayList)
  {
    if ((paramArrayList != null) && (paramArrayList.size() > 0))
    {
      ArrayList localArrayList = new ArrayList();
      paramArrayList = paramArrayList.iterator();
      while (paramArrayList.hasNext())
      {
        String str = (String)paramArrayList.next();
        Object localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(str);
        if (((localObject == null) || (System.currentTimeMillis() - updateTime >= 86400000L)) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().add(str)))
        {
          localObject = new GetResourceReqInfo();
          uiResID = 0L;
          strPkgName = str;
          uiCurVer = 0L;
          sResType = 4;
          sLanType = 0;
          sReqType = 1;
          localArrayList.add(localObject);
          if (QLog.isColorLevel()) {
            QLog.d("share_appid", 2, "Request list add appid = " + str);
          }
        }
      }
      if (localArrayList.size() > 0) {
        ConfigUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), localArrayList);
      }
    }
  }
  
  public void a(msg_comm.MsgType0x210 paramMsgType0x210, msg_comm.Msg paramMsg)
  {
    byte[] arrayOfByte = null;
    if (QLog.isColorLevel()) {
      QLog.d("DevLock", 2, "decodeDevlockQuickLoginPush recv msg0x210.Submsgtype0x51");
    }
    if (sub_msg_type.get() != 81) {
      if (QLog.isColorLevel()) {
        QLog.d("DevLock", 2, "decodeDevlockQuickLoginPush submsgtype != 0x51");
      }
    }
    do
    {
      do
      {
        return;
        if (msg_content != null) {
          break;
        }
      } while (!QLog.isColorLevel());
      QLog.d("DevLock", 2, "decodeDevlockQuickLoginPush msg_content is null");
      return;
      paramMsgType0x210 = msg_content.get().toByteArray();
      if (paramMsgType0x210 != null) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.d("DevLock", 2, "decodeDevlockQuickLoginPush decode ox210Stream is null");
    return;
    new SubMsgType0x51.MsgBody();
    for (;;)
    {
      try
      {
        SubMsgType0x51.MsgBody localMsgBody = new SubMsgType0x51.MsgBody();
        localMsgBody.mergeFrom(paramMsgType0x210);
        if (!bytes_qrsig_url.has()) {
          break label348;
        }
        paramMsgType0x210 = new String(bytes_qrsig_url.get().toByteArray(), "utf-8");
        if (!bytes_hint1.has()) {
          break label343;
        }
        paramMsg = new String(bytes_hint1.get().toByteArray(), "utf-8");
        if (!bytes_hint2.has()) {
          break label338;
        }
        str = new String(bytes_hint2.get().toByteArray(), "utf-8");
        if (bytes_login_conf.has()) {
          arrayOfByte = bytes_login_conf.get().toByteArray();
        }
        if (QLog.isColorLevel()) {
          QLog.d("DevLock", 2, "decodeDevlockQuickLoginPush recv devlock quicklogin push qrcode=" + paramMsgType0x210 + " maintip=" + paramMsg + " smalltip" + str);
        }
        EquipmentLockImpl.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramMsgType0x210, paramMsg, str, arrayOfByte);
        return;
      }
      catch (Exception paramMsgType0x210) {}
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.d("DevLock", 2, "failed to parse msg0x210.Submsgtype0x51");
      return;
      label338:
      String str = null;
      continue;
      label343:
      paramMsg = null;
      continue;
      label348:
      paramMsgType0x210 = null;
    }
  }
  
  public void a(SubMsgType0xa8.MsgBody paramMsgBody)
  {
    if (!a()) {
      if (QLog.isColorLevel()) {
        QLog.d("PullActive", 2, "handlePullActivePushMsg, isNeedNotifyActivePush is false");
      }
    }
    Object localObject2;
    Object localObject1;
    int i;
    do
    {
      do
      {
        return;
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X80065A9", "0X80065A9", 0, 0, "", "", "", "");
      } while (!bytes_msg_summary.has());
      localObject2 = bytes_msg_summary.get().toStringUtf8();
      localObject1 = new Intent(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), SplashActivity.class);
      ((Intent)localObject1).putExtra("tab_index", MainFragment.a);
      ((Intent)localObject1).putExtra("fragment_id", 1);
      ((Intent)localObject1).setFlags(335544320);
      i = uint32_action_type.get();
      if (QLog.isColorLevel()) {
        QLog.d("PullActive", 2, String.format("Recv 0x210_0xa8: actionType: %d, brief: %s", new Object[] { Integer.valueOf(i), localObject2 }));
      }
      if (i != 1) {
        break;
      }
    } while (!uint32_action_subType.has());
    int j = uint32_action_subType.get();
    ((Intent)localObject1).putExtra("extra_pull_active_push_type", i);
    ((Intent)localObject1).putExtra("extra_pull_active_push_subtype", j);
    if (QLog.isColorLevel()) {
      QLog.d("PullActive", 2, String.format("Recv 0x210_0xa8: actionSubType: %d", new Object[] { Integer.valueOf(j) }));
    }
    for (;;)
    {
      ((Intent)localObject1).putExtra(PullActiveManager.b, (String)localObject2);
      ((Intent)localObject1).putExtra("activepull_push_flag", true);
      paramMsgBody = PullActiveManager.jdField_a_of_type_JavaLangString;
      Bitmap localBitmap = BitmapManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getResources(), 2130838445);
      ToServiceMsg localToServiceMsg = new ToServiceMsg("mobileqq.service", jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), "CMD_SHOW_NOTIFIYCATION");
      extraData.putStringArray("cmds", new String[] { localObject2, paramMsgBody, localObject2 });
      extraData.putParcelable("intent", (Parcelable)localObject1);
      extraData.putParcelable("bitmap", localBitmap);
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(localToServiceMsg);
      paramMsgBody = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getBaseContext();
      if (!QQUtils.a(paramMsgBody)) {
        break;
      }
      localObject2 = (PullActiveManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(144);
      ((PullActiveManager)localObject2).a((Intent)localObject1);
      localObject1 = (QQLSRecentManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(71);
      if (SettingCloneUtil.readValue(paramMsgBody, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), paramMsgBody.getString(2131369309), "qqsetting_lock_screen_whenexit_key", true))
      {
        if (QLog.isColorLevel()) {
          QLog.d("QQLSActivity", 2, "handlePullActivePushMsg, start lsActivity");
        }
        ((QQLSRecentManager)localObject1).a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, AppConstants.aV, 9653, false);
      }
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(jdField_a_of_type_ComTencentMobileqqActivityRecentDataRecentItemPullActivePush);
      return;
      if (i == 2)
      {
        if (!bytes_extend_content.has()) {
          break;
        }
        paramMsgBody = bytes_extend_content.get().toStringUtf8();
        ((Intent)localObject1).putExtra("extra_pull_active_push_type", i);
        ((Intent)localObject1).putExtra("extra_pull_active_push_url", paramMsgBody);
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.d("PullActive", 2, String.format("Recv 0x210_0xa8: url: %s", new Object[] { paramMsgBody }));
        continue;
      }
      if ((i != 3) || (!bytes_extend_content.has())) {
        break;
      }
      paramMsgBody = bytes_extend_content.get().toStringUtf8();
      ((Intent)localObject1).putExtra("open_chatfragment", true);
      ((Intent)localObject1).putExtra("uin", paramMsgBody);
      ((Intent)localObject1).putExtra("uintype", 1008);
      ((Intent)localObject1).putExtra("isforceRequestDetail", true);
      if (QLog.isColorLevel()) {
        QLog.d("PullActive", 2, String.format("Recv 0x210_0xa8: public account uin: %s", new Object[] { paramMsgBody }));
      }
    }
  }
  
  public void a(byte[] paramArrayOfByte)
  {
    if (paramArrayOfByte == null) {}
    Object localObject1;
    FriendsManager localFriendsManager;
    TroopManager localTroopManager;
    PublicAccountDataManager localPublicAccountDataManager;
    PstnManager localPstnManager;
    Friends[] arrayOfFriends;
    int k;
    for (;;)
    {
      return;
      localObject1 = new SubMsgType0x27.MsgBody();
      try
      {
        paramArrayOfByte = (SubMsgType0x27.MsgBody)((SubMsgType0x27.MsgBody)localObject1).mergeFrom(paramArrayOfByte);
        if (paramArrayOfByte != null)
        {
          localFriendsManager = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
          localTroopManager = (TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51);
          localPublicAccountDataManager = (PublicAccountDataManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(55);
          localPstnManager = (PstnManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(142);
          paramArrayOfByte = rpt_msg_mod_infos.get();
          arrayOfFriends = new Friends[paramArrayOfByte.size()];
          Iterator localIterator = paramArrayOfByte.iterator();
          k = 0;
          for (;;)
          {
            if (!localIterator.hasNext()) {
              break label10571;
            }
            paramArrayOfByte = (SubMsgType0x27.ForwardBody)localIterator.next();
            if ((!uint32_notify_type.has()) || (uint32_notify_type.get() != 1)) {
              break;
            }
            if (QLog.isColorLevel()) {
              QLog.d("cardpush", 2, "push a no content，如何处理？");
            }
          }
          if (!uint32_op_type.has()) {
            break label376;
          }
        }
      }
      catch (Exception paramArrayOfByte)
      {
        paramArrayOfByte.printStackTrace();
        return;
      }
    }
    label376:
    Object localObject4;
    int m;
    label1070:
    label1159:
    Object localObject5;
    switch (uint32_op_type.get())
    {
    default: 
    case 0: 
    case 1: 
    case 2: 
    case 3: 
      do
      {
        do
        {
          for (;;)
          {
            break;
            if (msg_add_group.has())
            {
              localObject1 = (SubMsgType0x27.AddGroup)msg_add_group.get();
              paramArrayOfByte = new Groups();
              if (uint32_groupid.has()) {
                group_id = uint32_groupid.get();
              }
              if (bytes_groupname.has()) {
                group_name = bytes_groupname.get().toStringUtf8();
              }
              if (uint32_sortid.has()) {
                seqid = ((byte)uint32_sortid.get());
              }
              if (QLog.isColorLevel()) {
                QLog.d("cardpush", 2, "push a AddGroup  = id:" + group_id + " name : " + group_name + " sortid: " + seqid);
              }
              localFriendsManager.a(paramArrayOfByte);
              localObject1 = new AddGroupResp();
              dwToUin = Long.valueOf(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).longValue();
              dwSequence = seqid;
              cGroupId = ((byte)group_id);
              cSortId = seqid;
              paramArrayOfByte = new GroupActionResp(0, "", (AddGroupResp)localObject1);
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1).a(18, true, paramArrayOfByte);
              continue;
              if (msg_del_group.has())
              {
                localObject1 = (SubMsgType0x27.DelGroup)msg_del_group.get();
                if (uint32_groupid.has())
                {
                  localObject4 = localFriendsManager.a(uint32_groupid.get() + "");
                  if (QLog.isColorLevel()) {
                    QLog.d("cardpush", 2, "push a DelGroup  = id:" + uint32_groupid.get());
                  }
                  paramArrayOfByte = new DelGroupResp();
                  dwToUin = Long.valueOf(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount()).longValue();
                  dwSequence = seqid;
                  cGroupid = ((byte)uint32_groupid.get());
                  localObject1 = new GroupActionResp(0, "", paramArrayOfByte);
                  ((FriendListHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1)).a(paramArrayOfByte, true, (GroupActionResp)localObject1);
                }
              }
            }
          }
        } while (!msg_mod_group_name.has());
        localObject1 = (SubMsgType0x27.ModGroupName)msg_mod_group_name.get();
        if ((uint32_groupid.has()) && (bytes_groupname.has()))
        {
          m = uint32_groupid.get();
          localObject4 = bytes_groupname.get().toStringUtf8();
          paramArrayOfByte = localFriendsManager.a(String.valueOf(m));
          if (paramArrayOfByte == null) {
            break label1070;
          }
        }
        for (group_name = ((String)localObject4);; group_name = ((String)localObject4))
        {
          localFriendsManager.a(paramArrayOfByte);
          if (QLog.isColorLevel()) {
            QLog.d("cardpush", 2, "push a ModGroupName  = id:" + uint32_groupid.get() + " name:" + bytes_groupname.get().toStringUtf8());
          }
          paramArrayOfByte = new RenameGroupResp();
          dwToUin = uint32_groupid.get();
          m = (byte)uint32_groupid.get();
          sGroupName = new String(bytes_groupname.get().toStringUtf8());
          paramArrayOfByte = new GroupActionResp(0, "", paramArrayOfByte);
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1).a(19, true, paramArrayOfByte);
          break;
          paramArrayOfByte = new Groups();
          group_id = m;
        }
      } while (!msg_mod_group_sort.has());
      localObject4 = msg_mod_group_sort.get()).rpt_msg_groupsort.get();
      if (localObject4 != null)
      {
        paramArrayOfByte = new byte[((List)localObject4).size()];
        localObject1 = new byte[((List)localObject4).size()];
        localObject4 = ((List)localObject4).iterator();
        m = 0;
        if (((Iterator)localObject4).hasNext())
        {
          localObject5 = (SubMsgType0x27.GroupSort)((Iterator)localObject4).next();
          if ((!uint32_groupid.has()) || (!uint32_sortid.has())) {
            break label10594;
          }
          paramArrayOfByte[m] = ((byte)uint32_groupid.get());
          localObject1[m] = ((byte)uint32_sortid.get());
          if (QLog.isColorLevel()) {
            QLog.d("cardpush", 2, "push a ModGroupSort  = id:" + uint32_groupid.get() + " sortid:" + uint32_sortid.get());
          }
          m += 1;
        }
      }
      break;
    }
    label1360:
    label4281:
    label4319:
    label4350:
    label4394:
    label4564:
    label4570:
    label4576:
    label4582:
    label4824:
    label4848:
    label5039:
    label5175:
    label5338:
    label5602:
    label5688:
    label5864:
    label5948:
    label6421:
    label6896:
    label8575:
    label9052:
    label9564:
    label9932:
    label10571:
    label10588:
    label10594:
    for (;;)
    {
      break label1159;
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1).a(22, true, null);
      localFriendsManager.a(paramArrayOfByte, (byte[])localObject1);
      break;
      if (!msg_mod_friend_group.has()) {
        break;
      }
      paramArrayOfByte = msg_mod_friend_group.get()).rpt_msg_frd_group.get();
      long l1;
      int n;
      if (paramArrayOfByte != null)
      {
        paramArrayOfByte = paramArrayOfByte.iterator();
        while (paramArrayOfByte.hasNext())
        {
          localObject1 = (SubMsgType0x27.FriendGroup)paramArrayOfByte.next();
          if ((uint64_fuin.has()) && (rpt_uint32_new_group_id.get().size() > 0))
          {
            l1 = uint64_fuin.get();
            n = ((Integer)rpt_uint32_new_group_id.get(0)).intValue();
            if (rpt_uint32_old_group_id.get().size() <= 0) {
              break label10588;
            }
          }
        }
      }
      for (m = ((Integer)rpt_uint32_old_group_id.get(0)).intValue();; m = 0)
      {
        localFriendsManager.a(l1 + "", n);
        if (QLog.isColorLevel()) {
          QLog.d("cardpush", 2, "push a ModFriendGroup  = id:" + l1 + " newgroupid:" + n);
        }
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1).a(9, true, new Object[] { l1 + "", Byte.valueOf((byte)n), Byte.valueOf((byte)m) });
        break label1360;
        break;
        if (!msg_del_friend.has()) {
          break;
        }
        paramArrayOfByte = msg_del_friend.get()).rpt_uint64_uins.get().iterator();
        while (paramArrayOfByte.hasNext())
        {
          l1 = ((Long)paramArrayOfByte.next()).longValue();
          localFriendsManager.c(l1 + "");
          localPublicAccountDataManager.b(l1 + "");
          if (QLog.isColorLevel()) {
            QLog.d("cardpush", 2, "push a DelFriend  = id:" + l1);
          }
          localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a();
          localObject4 = ((RecentUserProxy)localObject1).a(String.valueOf(l1), 0);
          if (localObject4 != null) {
            ((RecentUserProxy)localObject1).b((RecentUser)localObject4);
          }
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1).a(15, true, Long.valueOf(l1));
        }
        paramArrayOfByte = (PhoneContactManagerImp)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(10);
        if (paramArrayOfByte != null) {
          paramArrayOfByte.b();
        }
        break;
        Object localObject7;
        Object localObject8;
        long l2;
        if (msg_mod_friend_rings.has())
        {
          localObject1 = msg_mod_friend_rings.get()).rpt_msg_sns_general_infos.get().iterator();
          while (((Iterator)localObject1).hasNext())
          {
            localObject4 = (SubMsgType0x27.SnsUpateBuffer)((Iterator)localObject1).next();
            localObject5 = rpt_msg_sns_update_item.get().iterator();
            while (((Iterator)localObject5).hasNext())
            {
              localObject7 = (SubMsgType0x27.SnsUpdateItem)((Iterator)localObject5).next();
              m = uint32_update_sns_type.get();
              if (m == 13569)
              {
                localObject6 = localTroopManager.b(Long.valueOf(uint64_uin.get()).toString());
                m = bytes_value.get().size();
                if (m == 0)
                {
                  if (localTroopManager.b((String)localObject6)) {
                    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(22).a(18, true, new Object[] { localObject6, Integer.valueOf(1), Integer.valueOf(0), null });
                  }
                }
                else if (m >= 4)
                {
                  localObject7 = bytes_value.get().toByteArray();
                  localObject8 = new byte[m];
                  System.arraycopy(localObject7, 0, localObject8, 0, 4);
                  if (localTroopManager.a((String)localObject6, MessageHandlerUtils.a((byte[])localObject8))) {
                    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(22).a(18, true, new Object[] { localObject6, Integer.valueOf(0), Integer.valueOf(0), null });
                  }
                }
              }
              else if (m == 13571)
              {
                l1 = uint64_uin.get();
                l2 = uint64_code.get();
                Long.valueOf(l1).toString();
                localObject6 = String.valueOf(Long.valueOf(l2));
                m = bytes_value.get().size();
                localObject7 = bytes_value.get().toByteArray();
                if (m >= 6)
                {
                  if ((localObject7[0] != 1) || (localObject7[0] == 0)) {}
                  m = localObject7[1];
                  if (m == 1)
                  {
                    if (QLog.isColorLevel()) {
                      QLog.d("Q.msg.BaseMessageProcessor", 2, "onlinePush, oprerate external show troop...");
                    }
                    localObject8 = new byte[4];
                    System.arraycopy(localObject7, 2, localObject8, 0, 4);
                    if (localTroopManager.b((String)localObject6, MessageHandlerUtils.a((byte[])localObject8))) {
                      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(20).a(54, true, new Object[] { localObject6, Integer.valueOf(m), Integer.valueOf(0), Integer.valueOf(m) });
                    }
                  }
                  if ((m == 0) && (localTroopManager.d((String)localObject6))) {
                    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(20).a(54, true, new Object[] { localObject6, Integer.valueOf(m), Integer.valueOf(0), Integer.valueOf(m) });
                  }
                }
              }
            }
          }
        }
        if (!msg_mod_friend_rings.has()) {
          break;
        }
        paramArrayOfByte = (SubMsgType0x27.ModSnsGeneralInfo)msg_mod_friend_rings.get();
        if ((paramArrayOfByte != null) && (rpt_msg_sns_general_infos.has()))
        {
          paramArrayOfByte = rpt_msg_sns_general_infos.get();
          localObject4 = new HashMap();
          localObject5 = paramArrayOfByte.iterator();
          while (((Iterator)localObject5).hasNext())
          {
            paramArrayOfByte = (SubMsgType0x27.SnsUpateBuffer)((Iterator)localObject5).next();
            if ((paramArrayOfByte != null) && (uint64_uin.has()) && (rpt_msg_sns_update_item.has()))
            {
              l1 = uint64_uin.get();
              localObject6 = String.valueOf(l1);
              localObject7 = rpt_msg_sns_update_item.get().iterator();
              while (((Iterator)localObject7).hasNext())
              {
                localObject8 = (SubMsgType0x27.SnsUpdateItem)((Iterator)localObject7).next();
                if ((localObject8 != null) && (uint32_update_sns_type.has()) && (bytes_value.has()))
                {
                  if (uint32_update_sns_type.get() == 13568) {
                    QvipSpecialCareManager.a((String)localObject6, bytes_value.get().toStringUtf8(), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
                  }
                  localObject1 = (SpecialCareInfo)((HashMap)localObject4).get(localObject6);
                  paramArrayOfByte = (byte[])localObject1;
                  if (localObject1 == null)
                  {
                    localObject1 = localFriendsManager.a(String.valueOf(l1));
                    paramArrayOfByte = (byte[])localObject1;
                    if (localObject1 == null)
                    {
                      paramArrayOfByte = new SpecialCareInfo();
                      uin = String.valueOf(String.valueOf(l1));
                    }
                    ((HashMap)localObject4).put(uin, paramArrayOfByte);
                  }
                  m = uint32_update_sns_type.get();
                  localObject1 = bytes_value.get().toStringUtf8();
                  FriendListHandler.a(paramArrayOfByte, m, (String)localObject1);
                  if (QLog.isColorLevel()) {
                    QLog.d("Q.msg.BaseMessageProcessor", 2, "handleMsgType0x210SubMsgType0x27 uin=" + uin + ", itemtype=" + m + ",itemVal=" + (String)localObject1);
                  }
                }
              }
            }
          }
          paramArrayOfByte = ((HashMap)localObject4).entrySet().iterator();
          localObject1 = new ArrayList();
          while (paramArrayOfByte.hasNext())
          {
            localObject4 = (SpecialCareInfo)((Map.Entry)paramArrayOfByte.next()).getValue();
            if ((localObject4 != null) && ((((SpecialCareInfo)localObject4).getStatus() != 1000) || (globalSwitch != 0))) {
              ((List)localObject1).add(localObject4);
            }
          }
          if (QLog.isColorLevel()) {
            QLog.d("Q.msg.BaseMessageProcessor", 2, "handleMsgType0x210SubMsgType0x27 bulkSaveOrUpdateSpecialCareInfos=" + ((List)localObject1).size());
          }
          localFriendsManager.c((List)localObject1);
          if (((List)localObject1).size() > 0) {
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1).a(98, true, new Object[] { Boolean.valueOf(true), localObject1 });
          }
        }
        break;
        if (!msg_mod_friend_flag.has()) {
          break;
        }
        paramArrayOfByte = (SubMsgType0x27.SnsUpdateFlag)msg_mod_friend_flag.get();
        if (rpt_msg_update_sns_flag.has())
        {
          paramArrayOfByte = rpt_msg_update_sns_flag.get().iterator();
          while (paramArrayOfByte.hasNext())
          {
            localObject1 = (SubMsgType0x27.SnsUpdateOneFlag)paramArrayOfByte.next();
            l1 = uint64__uin.get();
            m = uint32_flag.get();
            l2 = uint64_id.get();
            if (QLog.isColorLevel()) {
              QLog.d("Q.msg.BaseMessageProcessor", 2, "FriendShield : onLinePush : uin : " + l1 + " flag:" + m + " id:" + l2);
            }
            if (l2 == 4051L)
            {
              localObject1 = localFriendsManager.c(String.valueOf(l1));
              if (localObject1 != null)
              {
                if (m == 1) {}
                for (bool1 = true;; bool1 = false)
                {
                  ((Friends)localObject1).setShieldFlag(bool1);
                  localFriendsManager.a((Friends)localObject1);
                  jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1).a(56, true, new Object[] { Long.valueOf(l1), Boolean.valueOf(bool1), Boolean.valueOf(true), Boolean.valueOf(true), "" });
                  break;
                }
              }
            }
          }
        }
        break;
        if (!msg_mod_profile.has()) {
          break;
        }
        paramArrayOfByte = (SubMsgType0x27.ModProfile)msg_mod_profile.get();
        n = k;
        if (uint64_uin.has())
        {
          l1 = uint64_uin.get();
          localObject4 = rpt_msg_profile_infos.get().iterator();
          m = k;
          do
          {
            for (;;)
            {
              n = m;
              if (!((Iterator)localObject4).hasNext()) {
                break;
              }
              paramArrayOfByte = (SubMsgType0x27.ProfileInfo)((Iterator)localObject4).next();
              if ((uint32_field.has()) && (bytes_value.has())) {
                switch (uint32_field.get())
                {
                default: 
                  if (QLog.isColorLevel()) {
                    QLog.d("cardpush", 2, "push a unknow field Uint32Field = " + uint32_field.get());
                  }
                  break;
                case 20002: 
                  paramArrayOfByte = bytes_value.get();
                  if (QLog.isColorLevel()) {
                    QLog.d("cardpush", 2, "push a ModProfile Nick = " + paramArrayOfByte.toStringUtf8());
                  }
                  arrayOfFriends[m] = localFriendsManager.a(l1 + "", paramArrayOfByte.toStringUtf8());
                  localObject1 = localFriendsManager.a(l1 + "");
                  if (localObject1 != null)
                  {
                    strNick = paramArrayOfByte.toStringUtf8();
                    localFriendsManager.a((Card)localObject1);
                    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(2).a(1, true, localObject1);
                  }
                  jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1).a(3, true, Long.toString(l1));
                  m += 1;
                  break;
                case 20015: 
                  paramArrayOfByte = bytes_value.get();
                  if ((paramArrayOfByte != null) && (paramArrayOfByte.size() == 2))
                  {
                    k = paramArrayOfByte.byteAt(0);
                    k = (short)(paramArrayOfByte.byteAt(1) | k << 8);
                    if (QLog.isColorLevel()) {
                      QLog.d("cardpush", 2, "push a ModProfile Head = " + k);
                    }
                    ((FriendListHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1)).c(Long.toString(l1));
                    paramArrayOfByte = localFriendsManager.a(l1 + "");
                    if (paramArrayOfByte != null)
                    {
                      nFaceID = k;
                      localFriendsManager.a(paramArrayOfByte);
                      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1).a(4, true, new Object[] { l1 + "", paramArrayOfByte, null });
                      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(2).a(1, true, paramArrayOfByte);
                    }
                  }
                  break;
                case 20009: 
                  n = bytes_value.get().byteAt(0);
                  if (n == 1) {
                    k = 0;
                  }
                  for (;;)
                  {
                    if (QLog.isColorLevel()) {
                      QLog.d("cardpush", 2, "push a ModProfile Sex = " + k);
                    }
                    paramArrayOfByte = localFriendsManager.a(l1 + "");
                    if (paramArrayOfByte == null) {
                      break;
                    }
                    shGender = ((short)k);
                    localFriendsManager.a(paramArrayOfByte);
                    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(2).a(1, true, paramArrayOfByte);
                    break;
                    if (n == 2)
                    {
                      k = 1;
                    }
                    else
                    {
                      k = n;
                      if (n == 0) {
                        k = 2;
                      }
                    }
                  }
                case 20059: 
                  k = ByteBuffer.wrap(bytes_value.get().toByteArray()).asIntBuffer().get(0);
                  a(k);
                  ((SVIPHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(13)).a(101, true, Integer.valueOf(k));
                  if (QLog.isColorLevel()) {
                    QLog.d("vip", 2, "bubble id = " + k);
                  }
                  break;
                case 23105: 
                  if (QLog.isColorLevel()) {
                    QLog.d("vip", 2, "vip update uin=" + l1);
                  }
                  paramArrayOfByte = bytes_value.get();
                  localObject1 = (Friends)localFriendsManager.c(Long.toString(l1)).clone();
                  if (QLog.isColorLevel()) {
                    QLog.d("vip", 2, String.format("bit info = %02X", new Object[] { Byte.valueOf(paramArrayOfByte.byteAt(0)) }));
                  }
                  n = qqVipInfo;
                  if ((paramArrayOfByte.byteAt(0) & 0x80) == 0)
                  {
                    k = 0;
                    qqVipInfo = (k << 24 | 0xFFFFFF & n);
                    n = superQqInfo;
                    if ((paramArrayOfByte.byteAt(0) & 0x8) != 0) {
                      break label4564;
                    }
                    k = 0;
                    superQqInfo = (k << 24 | 0xFFFFFF & n);
                    if ((paramArrayOfByte.byteAt(0) & 0x40) == 0) {
                      break label4570;
                    }
                    bool1 = true;
                    if (QLog.isColorLevel()) {
                      QLog.d("vip", 2, "is year vip =" + bool1);
                    }
                    if (!bool1) {
                      break label4576;
                    }
                    k = 65536;
                    if (!((Friends)localObject1).isServiceEnabled(EVIPSPEC.E_SP_SUPERVIP)) {
                      break label4582;
                    }
                    superVipInfo = (k | superVipInfo & 0xFF00FFFF);
                  }
                  for (;;)
                  {
                    if (QLog.isColorLevel()) {
                      QLog.d("vip", 2, String.format("SVIP = %08X, VIP = %08X, SuperQQ = %08X", new Object[] { Integer.valueOf(superVipInfo), Integer.valueOf(qqVipInfo), Integer.valueOf(superQqInfo) }));
                    }
                    localFriendsManager.a((Friends)localObject1);
                    ((SVIPHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(13)).a(100, true, null);
                    if (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().equals(Long.toString(l1))) {
                      break;
                    }
                    if (QLog.isColorLevel()) {
                      QLog.d("vip", 2, "[EmoticonUpdateAuth] 23105 updateEmoticonAuth");
                    }
                    ((EmoticonManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(13)).b();
                    break;
                    k = 1;
                    break label4281;
                    k = 1;
                    break label4319;
                    bool1 = false;
                    break label4350;
                    k = 0;
                    break label4394;
                    if (((Friends)localObject1).isServiceEnabled(EVIPSPEC.E_SP_QQVIP)) {
                      qqVipInfo = (k | qqVipInfo & 0xFF00FFFF);
                    } else if (((Friends)localObject1).isServiceEnabled(EVIPSPEC.E_SP_SUPERQQ)) {
                      superQqInfo = (k | superQqInfo & 0xFF00FFFF);
                    }
                  }
                case 23106: 
                  if (QLog.isColorLevel()) {
                    QLog.d("vip", 2, "vip update uin=" + l1);
                  }
                  paramArrayOfByte = bytes_value.get();
                  localObject1 = Long.toString(l1);
                  localObject5 = (Friends)localFriendsManager.c((String)localObject1).clone();
                  bool1 = ((Friends)localObject5).isServiceEnabled(EVIPSPEC.E_SP_SUPERVIP);
                  boolean bool2 = ((Friends)localObject5).isServiceEnabled(EVIPSPEC.E_SP_QQVIP);
                  boolean bool3 = ((Friends)localObject5).isServiceEnabled(EVIPSPEC.E_SP_SUPERQQ);
                  if (QLog.isColorLevel()) {
                    QLog.d("vip", 2, "SVIP: " + bool1 + "; VIP: " + bool2 + "; SuperQQ: " + bool3);
                  }
                  int i2 = 0;
                  int i = paramArrayOfByte.byteAt(4);
                  int j = paramArrayOfByte.byteAt(5);
                  int i1;
                  if ((j & 0xF0) != 0)
                  {
                    n = 16;
                    i1 = 0;
                    k = i2;
                    if (i1 < 4)
                    {
                      if ((j & n) != 0) {
                        k = 13 - i1;
                      }
                    }
                    else
                    {
                      if (QLog.isColorLevel()) {
                        QLog.d("vip", 2, String.format("[%02X%02X] => LV %d", new Object[] { Byte.valueOf(i), Byte.valueOf(j), Integer.valueOf(k) }));
                      }
                      if (!bool1) {
                        break label5039;
                      }
                      superVipInfo = (k & 0xFFFF | superVipInfo & 0xFFFF0000);
                    }
                  }
                  for (;;)
                  {
                    localFriendsManager.a((Friends)localObject5);
                    if (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().equals(localObject1)) {
                      break;
                    }
                    ((SVIPHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(13)).a(100, true, null);
                    break;
                    i1 += 1;
                    n = (byte)(n << 1);
                    break label4824;
                    if (i != 0)
                    {
                      n = 1;
                      i1 = 0;
                      for (;;)
                      {
                        k = i2;
                        if (i1 >= 8) {
                          break;
                        }
                        if ((i & n) != 0)
                        {
                          k = 9 - i1;
                          break;
                        }
                        i1 += 1;
                        n = (byte)(n << 1);
                      }
                    }
                    k = 1;
                    break label4848;
                    if (bool2) {
                      qqVipInfo = (k & 0xFFFF | qqVipInfo & 0xFFFF0000);
                    } else if (bool3) {
                      superQqInfo = (k & 0xFFFF | superQqInfo & 0xFFFF0000);
                    }
                  }
                case 23107: 
                  if (QLog.isColorLevel()) {
                    QLog.d("vip", 2, "svip update uin=" + l1);
                  }
                  paramArrayOfByte = bytes_value.get();
                  localObject1 = Long.toString(l1);
                  localObject5 = (Friends)localFriendsManager.c((String)localObject1).clone();
                  if ((paramArrayOfByte.byteAt(5) & 0x20) != 0)
                  {
                    bool1 = true;
                    n = superVipInfo;
                    if (!bool1) {
                      break label5338;
                    }
                  }
                  for (k = 1;; k = 0)
                  {
                    superVipInfo = (k << 24 | 0xFFFFFF & n);
                    localFriendsManager.a((Friends)localObject5);
                    if (QLog.isColorLevel()) {
                      QLog.d("vip", 2, "isSVip=" + bool1 + "friend.superVipInfo=" + superVipInfo);
                    }
                    if (!jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().equals(localObject1)) {
                      break;
                    }
                    ((SVIPHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(13)).a(100, true, null);
                    if (QLog.isColorLevel()) {
                      QLog.d("vip", 2, "[EmoticonUpdateAuth] 23107 updateEmoticonAuth");
                    }
                    ((EmoticonManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(13)).b();
                    break;
                    bool1 = false;
                    break label5175;
                  }
                case 23104: 
                  paramArrayOfByte = bytes_value.get();
                  if ((paramArrayOfByte.byteAt(5) & 0x2) != 0)
                  {
                    localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getSharedPreferences("vip_message_roam_banner_file", 0);
                    if ((paramArrayOfByte.byteAt(1) & 0x2) != 0) {
                      k = 2;
                    }
                    while (k != -1)
                    {
                      ((SharedPreferences)localObject1).edit().putInt("message_roam_flag" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), k).commit();
                      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1).a(100, true, Integer.valueOf(k));
                      break;
                      if (((SharedPreferences)localObject1).getInt("message_roam_flag" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), -1) == 2) {
                        k = 1;
                      } else {
                        k = -1;
                      }
                    }
                  }
                  break;
                case 23109: 
                  paramArrayOfByte = bytes_value.get();
                  if (((paramArrayOfByte.byteAt(31) & 0x20) != 0) || ((paramArrayOfByte.byteAt(34) & 0x10) != 0) || ((paramArrayOfByte.byteAt(29) & 0x10) != 0))
                  {
                    localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getSharedPreferences("vip_message_roam_banner_file", 0);
                    if (((paramArrayOfByte.byteAt(11) & 0x20) == 0) && ((paramArrayOfByte.byteAt(14) & 0x10) == 0)) {
                      break label5864;
                    }
                    k = 4;
                    if (k != -1)
                    {
                      ((SharedPreferences)localObject1).edit().putInt("message_roam_flag" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), k).commit();
                      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1).a(100, true, Integer.valueOf(k));
                    }
                  }
                  if ((paramArrayOfByte.byteAt(12) & 0x8) != 0)
                  {
                    bool1 = true;
                    SttManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, bool1);
                    if ((paramArrayOfByte.byteAt(13) & 0x40) == 0) {
                      break label5948;
                    }
                  }
                  for (bool1 = true; SettingCloneUtil.readValue(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication(), Long.toString(l1), null, "qqsetting_pcactive_key", false) != bool1; bool1 = false)
                  {
                    SettingCloneUtil.writeValue(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication(), Long.valueOf(l1).toString(), null, "qqsetting_pcactive_key", bool1);
                    paramArrayOfByte = new Intent("com.tencent.mobileqq.activity.NotifyPushSettingActivity.PCActive");
                    paramArrayOfByte.putExtra("pcActive", bool1);
                    paramArrayOfByte.putExtra("uin", Long.valueOf(l1).toString());
                    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().sendBroadcast(paramArrayOfByte);
                    if (!bool1) {
                      break;
                    }
                    SettingCloneUtil.writeValue(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication(), Long.toString(l1), null, "pcactive_config", true);
                    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.openMsfPCActive(Long.toString(l1), "config", true);
                    QLog.d("OnlinePush", 1, "PCActive opened: true by switch push");
                    break;
                    if ((paramArrayOfByte.byteAt(9) & 0x10) != 0)
                    {
                      k = 3;
                      break label5602;
                    }
                    k = ((SharedPreferences)localObject1).getInt("message_roam_flag" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), -1);
                    if ((k == 4) || (k == 3))
                    {
                      k = 1;
                      break label5602;
                    }
                    k = -1;
                    break label5602;
                    bool1 = false;
                    break label5688;
                  }
                case 27025: 
                  l2 = ByteBuffer.wrap(bytes_value.get().toByteArray()).asLongBuffer().get();
                  localObject1 = localFriendsManager.a(String.valueOf(l1));
                  paramArrayOfByte = (byte[])localObject1;
                  if (localObject1 == null)
                  {
                    paramArrayOfByte = new ExtensionInfo();
                    uin = String.valueOf(l1);
                  }
                  pendantId = l2;
                  timestamp = System.currentTimeMillis();
                  localFriendsManager.a(paramArrayOfByte);
                  if (QLog.isColorLevel()) {
                    QLog.d("Q.msg.BaseMessageProcessor", 2, "push, Get Pendant, uin=" + l1 + ", id=" + pendantId);
                  }
                  break;
                case 27032: 
                  k = ByteBuffer.wrap(bytes_value.get().toByteArray()).asIntBuffer().get();
                  localObject1 = localFriendsManager.a(String.valueOf(l1));
                  paramArrayOfByte = (byte[])localObject1;
                  if (localObject1 == null)
                  {
                    paramArrayOfByte = new ExtensionInfo();
                    uin = String.valueOf(l1);
                  }
                  if (uVipFont != k)
                  {
                    uVipFont = k;
                    timestamp = System.currentTimeMillis();
                    localFriendsManager.a(paramArrayOfByte);
                  }
                  if (QLog.isColorLevel()) {
                    QLog.d("Q.msg.BaseMessageProcessor", 2, "push, Get Font, uin=" + l1 + ", id=" + uVipFont);
                  }
                  break;
                case 27041: 
                  k = ByteBuffer.wrap(bytes_value.get().toByteArray()).asIntBuffer().get();
                  localObject1 = localFriendsManager.a(String.valueOf(l1));
                  paramArrayOfByte = (byte[])localObject1;
                  if (localObject1 == null)
                  {
                    paramArrayOfByte = new ExtensionInfo();
                    uin = String.valueOf(l1);
                  }
                  if (colorRingId != k)
                  {
                    colorRingId = k;
                    timestamp = System.currentTimeMillis();
                    localFriendsManager.a(paramArrayOfByte);
                    ColorRingManager.a(uin, 1, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
                  }
                  if (QLog.isColorLevel()) {
                    QLog.d("Q.msg.BaseMessageProcessor", 2, "push, Get ColorRing, uin=" + l1 + ", id=" + colorRingId);
                  }
                  break;
                }
              }
            }
            localObject1 = bytes_value.get();
            n = uint32_field.get();
            if ((n < 42005) || (n > 42012)) {
              break;
            }
            k = ByteBuffer.wrap(((ByteStringMicro)localObject1).toByteArray()).asShortBuffer().get();
            paramArrayOfByte = localPstnManager.a(String.valueOf(l1));
          } while ((paramArrayOfByte == null) || (k == -1));
          if (n == 420005) {
            pstn_c2c_vip = k;
          }
          for (;;)
          {
            localPstnManager.a(paramArrayOfByte);
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(82).a(1, true, paramArrayOfByte);
            localObject1 = new Intent("tencent.video.q2v.pstnCardInfoChanged");
            ((Intent)localObject1).setPackage(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getPackageName());
            ((Intent)localObject1).putExtra("pstnCardInfo", paramArrayOfByte);
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().sendBroadcast((Intent)localObject1);
            if (!QLog.isColorLevel()) {
              break;
            }
            QLog.d("cardpush", 2, "push a pstn attr Uint32Field = " + n + ",bit = " + k);
            break;
            k = ByteBuffer.wrap(((ByteStringMicro)localObject1).toByteArray()).asIntBuffer().get();
            break label6421;
            if (n == 42006) {
              pstn_multi_vip = k;
            } else if (n == 42007) {
              pstn_ever_c2c_vip = k;
            } else if (n == 42008) {
              pstn_ever_multi_vip = k;
            } else if (n == 42011) {
              pstn_multi_try_status = k;
            } else if (n == 42012) {
              pstn_c2c_try_status = k;
            } else if (n == 26012) {
              pstn_multi_call_time = k;
            } else if (n == 26013) {
              pstn_multi_last_guide_recharge_time = k;
            } else if (n == 26014) {
              pstn_c2c_call_time = k;
            } else if (n == 26015) {
              pstn_c2c_last_guide_recharge_time = k;
            }
          }
        }
        k = n;
        break;
        if (!msg_mod_custom_face.has()) {
          break;
        }
        localObject1 = (SubMsgType0x27.ModCustomFace)msg_mod_custom_face.get();
        if ((uint32_type.has()) && (uint64_uin.has()))
        {
          paramArrayOfByte = (FriendListHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1);
          if (uint32_type.get() != 0) {
            break label6896;
          }
          l1 = uint64_uin.get();
          localObject1 = Long.toString(l1);
          if (QLog.isColorLevel()) {
            QLog.d("cardpush", 2, "push a ModCustomFace  :0  Normal user uin = " + l1);
          }
          paramArrayOfByte.c((String)localObject1);
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1).a(3, true, localObject1);
        }
        for (;;)
        {
          break;
          if (uint32_type.get() == 1)
          {
            l1 = uint64_group_code.get();
            if (QLog.isColorLevel()) {
              QLog.d("cardpush", 2, "push a ModCustomFace  :1 Troop uin = " + l1);
            }
            paramArrayOfByte.d(Long.toString(l1));
          }
        }
        if (!msg_daren_notify.has()) {
          break;
        }
        paramArrayOfByte = (SubMsgType0x27.DaRenNotify)msg_daren_notify.get();
        l1 = uint64_uin.get();
        m = uint32_login_days.get();
        n = uint32_days.get();
        if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().equals(String.valueOf(l1)))
        {
          paramArrayOfByte = localFriendsManager.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
          if ((m != lLoginDays) || (n != lQQMasterLogindays))
          {
            lLoginDays = m;
            lQQMasterLogindays = n;
            localFriendsManager.a(paramArrayOfByte);
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(2).a(1, true, paramArrayOfByte);
          }
          if (QLog.isColorLevel()) {
            QLog.d("cardpush", 2, "daren notify received local data logindays=" + lLoginDays + ";days=" + lQQMasterLogindays);
          }
        }
        if (QLog.isColorLevel()) {
          QLog.d("cardpush", 2, "daren notify received uin=" + l1 + ";logindays=" + m + ";days=" + n);
        }
        break;
        if (!msg_mod_friend_remark.has()) {
          break;
        }
        paramArrayOfByte = msg_mod_friend_remark.get()).rpt_msg_frd_rmk.get().iterator();
        while (paramArrayOfByte.hasNext())
        {
          localObject1 = (SubMsgType0x27.FriendRemark)paramArrayOfByte.next();
          if (uint32_type.has()) {
            if (uint32_type.get() == 0)
            {
              if (QLog.isColorLevel()) {
                QLog.d("cardpush", 2, "push a ModFriendRemark  : 0 Friend uin = " + uint64_fuin.get() + "备注 = " + bytes_rmk_name.get().toStringUtf8());
              }
              localFriendsManager.b(uint64_fuin.get() + "", bytes_rmk_name.get().toStringUtf8());
              localObject4 = localFriendsManager.a(uint64_fuin.get() + "");
              if (localObject4 != null)
              {
                localObject5 = bytes_rmk_name.get().toStringUtf8();
                if (!((String)localObject5).equals(strReMark))
                {
                  strReMark = ((String)localObject5);
                  localFriendsManager.a((Card)localObject4);
                }
              }
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1).a(3, true, Long.toString(uint64_fuin.get()));
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1).a(27, true, new Object[] { uint64_fuin.get() + "", bytes_rmk_name.get().toStringUtf8(), Byte.valueOf(1) });
            }
            else if (uint32_type.get() == 1)
            {
              if (uint64_group_code.has())
              {
                if (QLog.isColorLevel()) {
                  QLog.d("cardpush", 2, "push a ModFriendRemark  : 1 troop remarkuin = " + uint64_fuin.get() + " troopcode = " + uint64_group_code.get() + " remark = " + bytes_rmk_name.get().toStringUtf8() + "目前群备注在android上没看到有地方显示？");
                }
              }
              else if (QLog.isColorLevel()) {
                QLog.d("cardpush", 2, "push a ModFriendRemark  : 1 troop remark uin = " + uint64_fuin.get() + " remark = " + bytes_rmk_name.get().toStringUtf8() + "目前群备注在android上没看到有地方显示？");
              }
            }
          }
        }
        break;
        break;
        if (!msg_mod_rich_long_nick.has()) {
          break;
        }
        Object localObject6 = (SubMsgType0x27.ModLongNick)msg_mod_rich_long_nick.get();
        localObject4 = Long.toString(uint64_uin.get());
        paramArrayOfByte = ByteBuffer.wrap(bytes_value.get().toByteArray());
        l1 = paramArrayOfByte.getLong();
        localObject5 = new byte[paramArrayOfByte.remaining()];
        paramArrayOfByte.get((byte[])localObject5);
        localObject1 = localFriendsManager.a((String)localObject4);
        paramArrayOfByte = (byte[])localObject1;
        if (localObject1 == null)
        {
          paramArrayOfByte = new ExtensionInfo();
          uin = ((String)localObject4);
        }
        paramArrayOfByte.setRichBuffer((byte[])localObject5, l1);
        isAdded2C2C = SignatureManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (String)localObject4, paramArrayOfByte.getRichStatus());
        localFriendsManager.a(paramArrayOfByte);
        paramArrayOfByte = localFriendsManager.a(uint64_uin.get() + "");
        if (paramArrayOfByte != null)
        {
          vRichSign = ((byte[])localObject5);
          lSignModifyTime = l1;
          localFriendsManager.a(paramArrayOfByte);
        }
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1).a(3, true, localObject4);
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1).a(2, true, new String[] { localObject4 });
        break;
        if (!msg_mod_group_profile.has()) {
          break;
        }
        localObject1 = (SubMsgType0x27.ModGroupProfile)msg_mod_group_profile.get();
        if (uint64_group_code.has())
        {
          l1 = uint64_group_uin.get();
          l2 = uint64_group_code.get();
          paramArrayOfByte = localFriendsManager.a();
        }
        for (;;)
        {
          try
          {
            paramArrayOfByte.a();
            localObject1 = rpt_msg_group_profile_infos.get().iterator();
            if (!((Iterator)localObject1).hasNext()) {
              break label8575;
            }
            localObject4 = (SubMsgType0x27.GroupProfileInfo)((Iterator)localObject1).next();
            if ((!uint32_field.has()) || (!bytes_value.has())) {
              continue;
            }
            if (uint32_field.get() == 1)
            {
              if (QLog.isColorLevel()) {
                QLog.d("cardpush", 2, "push a ModGroupProfile 1--TroopName  = " + bytes_value.get().toStringUtf8());
              }
              localObject5 = localTroopManager.a(l2 + "");
              if (localObject5 == null) {
                continue;
              }
              troopname = bytes_value.get().toStringUtf8();
              localTroopManager.b((TroopInfo)localObject5);
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(20).a(1, false, null);
              continue;
            }
          }
          catch (Exception localException)
          {
            localException.printStackTrace();
            paramArrayOfByte.b();
            break;
            if (uint32_field.get() == 2)
            {
              localObject4 = bytes_value.get();
              if ((localObject4 == null) || (((ByteStringMicro)localObject4).size() != 2)) {
                continue;
              }
              m = ((ByteStringMicro)localObject4).byteAt(0);
              short s = (short)(((ByteStringMicro)localObject4).byteAt(1) | m << 8);
              localObject4 = localTroopManager.a(l1 + "");
              troopface = s;
              if (QLog.isColorLevel()) {
                QLog.d("cardpush", 2, "push a ModGroupProfile 2--TroopHead(2bytes) = " + s);
              }
              localTroopManager.b((TroopInfo)localObject4);
              ((FriendListHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1)).d(l1 + "");
              continue;
            }
          }
          finally
          {
            paramArrayOfByte.b();
          }
          if (uint32_field.get() == 3)
          {
            localObject4 = bytes_value.get().toStringUtf8();
            if (QLog.isColorLevel()) {
              QLog.i("troop.credit.data", 2, "onLinePush, creditLevelChange:" + l1 + "," + l2 + "," + (String)localObject4);
            }
            localObject5 = localTroopManager.a(l2 + "");
            if (localObject5 != null)
            {
              troopCreditLevel = Long.valueOf((String)localObject4).longValue();
              localTroopManager.b((TroopInfo)localObject5);
              if (QLog.isColorLevel())
              {
                QLog.i("troop.credit.data", 2, "onLinePush, creditLevelChange, save");
                continue;
                paramArrayOfByte.c();
                paramArrayOfByte.b();
              }
            }
          }
        }
        if (!msg_mod_group_member_profile.has()) {
          break;
        }
        Object localObject3 = (SubMsgType0x27.ModGroupMemberProfile)msg_mod_group_member_profile.get();
        if ((uint64_group_code.has()) && (uint64_group_uin.has()))
        {
          l1 = uint64_group_uin.get();
          l2 = uint64_group_code.get();
          long l3 = uint64_uin.get();
          paramArrayOfByte = DBUtils.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, l2 + "", l3 + "");
          localObject3 = rpt_msg_group_member_profile_infos.get().iterator();
          while (((Iterator)localObject3).hasNext())
          {
            localObject4 = (SubMsgType0x27.GroupMemberProfileInfo)((Iterator)localObject3).next();
            if ((uint32_field.has()) && (bytes_value.has()))
            {
              if (uint32_field.get() != 1) {
                break label9052;
              }
              if (QLog.isColorLevel()) {
                QLog.d("cardpush", 2, "push a ModGroupMemberProfile 1--Nick = " + bytes_value.get().toStringUtf8() + " info.bytes_value.get().size() = " + bytes_value.get().size());
              }
              QQProfileItem.a("cardpush", bytes_value.get().toByteArray(), bytes_value.get().size());
              localTroopManager.a(l1 + "", l3 + "", bytes_value.get().toStringUtf8(), -100, null, null, -100, -100, -100, -100L, -100L);
              if (paramArrayOfByte != null) {
                name = bytes_value.get().toStringUtf8();
              }
            }
            for (;;)
            {
              if (paramArrayOfByte == null) {
                break label9564;
              }
              DBUtils.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramArrayOfByte);
              localObject4 = new ArrayList();
              ((ArrayList)localObject4).add(paramArrayOfByte);
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(20).a(16, true, localObject4);
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(20).a(10, true, new Object[] { localObject4, Boolean.valueOf(true) });
              break;
              if (uint32_field.get() == 2)
              {
                if (bytes_value.get().size() == 1)
                {
                  byte b = bytes_value.get().byteAt(0);
                  if (QLog.isColorLevel()) {
                    QLog.d("cardpush", 2, "push a ModGroupMemberProfile 2--sex = " + b);
                  }
                  localTroopManager.a(l1 + "", l3 + "", null, -100, null, null, -100, b, -100, -100L, -100L);
                  if (paramArrayOfByte != null) {
                    sex = b;
                  }
                }
              }
              else if (uint32_field.get() == 3)
              {
                localObject4 = bytes_value.get().toStringUtf8();
                if (QLog.isColorLevel()) {
                  QLog.d("cardpush", 2, "push a ModGroupMemberProfile 3--phone = " + (String)localObject4);
                }
                if (paramArrayOfByte != null) {
                  tel = ((String)localObject4);
                }
              }
              else if (uint32_field.get() == 4)
              {
                localObject4 = bytes_value.get().toStringUtf8();
                if (QLog.isColorLevel()) {
                  QLog.d("cardpush", 2, "push a ModGroupMemberProfile 4--email= " + (String)localObject4);
                }
                if (paramArrayOfByte != null) {
                  email = ((String)localObject4);
                }
              }
              else if (uint32_field.get() == 5)
              {
                localObject4 = bytes_value.get().toStringUtf8();
                if (QLog.isColorLevel()) {
                  QLog.d("cardpush", 2, "push a ModGroupMemberProfile 5--remark= " + (String)localObject4);
                }
                ((TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51)).a(l1 + "", l3 + "", null, -100, null, (String)localObject4, -100, -100, -100, -100L, -100L);
                if (paramArrayOfByte != null) {
                  memo = ((String)localObject4);
                }
              }
              else if (uint32_field.get() == 6)
              {
                localObject4 = bytes_value.get().toStringUtf8();
                if (QLog.isColorLevel()) {
                  QLog.d("cardpush", 2, "push a ModGroupMemberProfile 6--job= " + (String)localObject4);
                }
                if (paramArrayOfByte != null) {
                  job = ((String)localObject4);
                }
              }
            }
          }
        }
        break;
        if (!msg_appointment_notify.has()) {
          break;
        }
        localObject6 = (SubMsgType0x27.AppointmentNotify)msg_appointment_notify.get();
        if (uint32_notifytype.has())
        {
          l1 = uint32_notifytype.get();
          if ((l1 == 2L) || (l1 == 4L) || (l1 == 5L) || ((l1 == 6L) && (bytes_feed_event_info.has()))) {
            jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a((SubMsgType0x27.AppointmentNotify)localObject6);
          }
        }
        else
        {
          break;
        }
        if (((l1 == 0L) || (l1 == 1L) || (l1 == 3L)) && (uint64_from_uin.has()))
        {
          l2 = uint64_from_uin.get();
          localObject3 = null;
          localObject4 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
          localObject5 = Long.toString(l2);
          if (l1 != 0L) {
            break label9932;
          }
        }
        for (paramArrayOfByte = (byte[])localObject4;; paramArrayOfByte = (byte[])localObject5)
        {
          if (str_tips_content.has()) {
            localObject3 = str_tips_content.get();
          }
          localObject6 = new ArrayList();
          localObject7 = MessageRecordFactory.a(64512);
          l2 = MessageCache.a();
          if (QLog.isColorLevel()) {
            QLog.d("Q.msg.BaseMessageProcessor", 2, "handle date push friendUin=" + (String)localObject5 + ",senderUin=" + paramArrayOfByte + ",notifytype=" + l1);
          }
          ((MessageRecord)localObject7).init((String)localObject4, (String)localObject5, paramArrayOfByte, (String)localObject3, l2, 64512, 1010, l2);
          isread = false;
          if (l1 == 0L)
          {
            issend = 1;
            isread = true;
          }
          ((ArrayList)localObject6).add(localObject7);
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a((MessageRecord)localObject7, selfuin);
          a("handleMsgType0x210SubMsgType0x27", true, (List)localObject6, false, false);
          break;
          break;
          if ((l1 == 1L) && (bytes_sig.has()))
          {
            paramArrayOfByte = bytes_sig.get().toByteArray();
            if (paramArrayOfByte != null) {
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().k((String)localObject5, paramArrayOfByte);
            }
          }
        }
        if (!msg_push_search_dev.has()) {
          break;
        }
        paramArrayOfByte = (SubMsgType0x27.PushSearchDev)msg_push_search_dev.get();
        localObject3 = new Bundle();
        ((Bundle)localObject3).putInt("optype", 200);
        if (uint32_msg_type.has()) {
          ((Bundle)localObject3).putInt("msgtype", uint32_msg_type.get());
        }
        if (uint32_dev_time.has()) {
          ((Bundle)localObject3).putInt("devtime", uint32_dev_time.get());
        }
        if (uint64_din.has()) {
          ((Bundle)localObject3).putLong("din", uint64_din.get());
        }
        if (str_data.has()) {
          ((Bundle)localObject3).putString("data", str_data.get());
        }
        ((SmartDeviceProxyMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51)).a(39, (Bundle)localObject3);
        break;
        if (!msg_push_report_dev.has()) {
          break;
        }
        paramArrayOfByte = (SubMsgType0x27.PushReportDev)msg_push_report_dev.get();
        localObject3 = new Bundle();
        ((Bundle)localObject3).putInt("optype", 201);
        if (uint32_msg_type.has()) {
          ((Bundle)localObject3).putInt("msgtype", uint32_msg_type.get());
        }
        if (bytes_cookie.has()) {
          ((Bundle)localObject3).putString("cookie", bytes_cookie.get().toStringUtf8());
        }
        if (uint32_report_max_num.has()) {
          ((Bundle)localObject3).putInt("count", uint32_report_max_num.get());
        }
        if (bytes_sn.has()) {
          ((Bundle)localObject3).putString("sn", bytes_sn.get().toStringUtf8());
        }
        ((SmartDeviceProxyMgr)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(51)).a(39, (Bundle)localObject3);
        break;
        if (!msg_qq_pay_push.has()) {
          break;
        }
        paramArrayOfByte = (SubMsgType0x27.QQPayPush)msg_qq_pay_push.get();
        l1 = uint64_uin.get();
        boolean bool1 = bool_pay_ok.get();
        if (QLog.isColorLevel()) {
          QLog.i("Q.msg.BaseMessageProcessor", 2, " === qq pay push uin: " + l1 + ", isPaySuccess | " + bool1);
        }
        ((PstnHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(82)).a(l1, bool1);
        break;
        if (!msg_new_comein_user_notify.has()) {
          break;
        }
        paramArrayOfByte = (SubMsgType0x27.NewComeinUserNotify)msg_new_comein_user_notify.get();
        if (uint32_msg_type.has()) {}
        for (m = uint32_msg_type.get();; m = -1)
        {
          if (QLog.isColorLevel()) {
            QLog.d("SecMsgHandler", 2, "receive msg0x210submsg0x27 face2face add friend push, type:" + m);
          }
          if (m == 1)
          {
            localObject3 = (LBSHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(3);
            if (localObject3 != null) {
              ((LBSHandler)localObject3).a(paramArrayOfByte);
            }
          }
          for (;;)
          {
            break;
            if ((m == 2) || (m == 3))
            {
              localObject3 = (NearFieldTroopHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(57);
              if (localObject3 != null) {
                ((NearFieldTroopHandler)localObject3).a(m, paramArrayOfByte);
              }
            }
          }
          localFriendsManager.a(arrayOfFriends, k);
          return;
        }
      }
    }
  }
  
  public boolean a()
  {
    return ((jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.isBackground_Pause) || (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.isBackground_Stop)) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.bJ == 0);
  }
  
  public void b(byte[] paramArrayOfByte)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.BaseMessageProcessor", 2, "handleMsgType0x210SubMsgType0x26");
    }
    submsgtype0x26.MsgBody localMsgBody = new submsgtype0x26.MsgBody();
    do
    {
      do
      {
        do
        {
          do
          {
            try
            {
              localMsgBody.mergeFrom(paramArrayOfByte);
              if (!uint32_sub_cmd.has())
              {
                if (QLog.isColorLevel()) {
                  QLog.e("Q.msg.BaseMessageProcessor", 2, "handleMsgType0x210SubMsgType0x26 : msg has not body");
                }
                return;
              }
            }
            catch (Exception paramArrayOfByte)
            {
              while (!QLog.isColorLevel()) {}
              QLog.e("Q.msg.BaseMessageProcessor", 2, "handleMsgType0x210SubMsgType0x26 : fail to parse submsgtype0x26.");
              return;
            }
            if ((uint32_sub_cmd.get() == 1) || (uint32_sub_cmd.get() == 4))
            {
              ((TroopHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(20)).a(paramArrayOfByte);
              return;
            }
          } while (uint32_sub_cmd.get() != 3);
          if ((!msg_subcmd_0x3_push_body.has()) && (QLog.isColorLevel())) {
            QLog.e("Q.msg.BaseMessageProcessor", 2, "handleMsgType0x210SubMsgType0x26 : msg has not 0x3_push_body");
          }
          paramArrayOfByte = (submsgtype0x26.MsgBody.SubCmd0x3UpdateDiscussAppInfo)msg_subcmd_0x3_push_body.get();
        } while ((!uint64_conf_uin.has()) || (!msg_app_tip_notify.has()));
        uint64_conf_uin.get();
        paramArrayOfByte = (submsgtype0x26.AppTipNotify)msg_app_tip_notify.get();
      } while (!bytes_text.has());
      paramArrayOfByte = bytes_text.get().toByteArray();
    } while (paramArrayOfByte.length <= 0);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().c(paramArrayOfByte);
  }
  
  public void c(byte[] paramArrayOfByte)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.BaseMessageProcessor", 2, "handleMsgType0x210SubMsgType0x83");
    }
    Object localObject1 = new SubMsgType0x83.MsgBody();
    do
    {
      try
      {
        ((SubMsgType0x83.MsgBody)localObject1).mergeFrom(paramArrayOfByte);
        if (!uint64_group_id.has())
        {
          if (QLog.isColorLevel()) {
            QLog.e("Q.msg.BaseMessageProcessor", 2, "handleMsgType0x210SubMsgType0x83 : msg has not uint64_group_id");
          }
          return;
        }
      }
      catch (Exception paramArrayOfByte)
      {
        while (!QLog.isColorLevel()) {}
        QLog.e("Q.msg.BaseMessageProcessor", 2, "handleMsgType0x210SubMsgType0x83 : fail to parse submsgtype0x83.");
        return;
      }
    } while (!rpt_msg_params.has());
    paramArrayOfByte = rpt_msg_params;
    long l1 = -1L;
    if (uint64_seq.has()) {
      l1 = uint64_seq.get();
    }
    long l2 = -1L;
    if (uint64_group_id.has()) {
      l2 = uint64_group_id.get();
    }
    int i = 0;
    while (i < paramArrayOfByte.size())
    {
      localObject1 = (SubMsgType0x83.MsgParams)paramArrayOfByte.get(0);
      int j;
      Object localObject2;
      if ((localObject1 != null) && (uint32_type.has()) && (str_data.has()) && (uint64_from_uin.has()) && (uint64_to_uin.has()))
      {
        j = uint32_type.get();
        if ((j < 2001) || (j > 3000)) {
          break label303;
        }
        localObject2 = str_data.get();
      }
      try
      {
        int k = new JSONObject((String)localObject2).getInt("count");
        jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(j, uint64_from_uin.get(), uint64_to_uin.get(), k, l1, l2);
        for (;;)
        {
          i += 1;
          break;
          label303:
          if (j == 1005)
          {
            localObject2 = str_data.get();
            try
            {
              localObject2 = new JSONObject((String)localObject2);
              j = ((JSONObject)localObject2).optInt("enable");
              k = ((JSONObject)localObject2).optInt("level");
              jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(uint32_type.get(), uint64_from_uin.get(), uint64_to_uin.get(), j, k, l1, l2);
            }
            catch (Exception localException1) {}
          }
        }
      }
      catch (Exception localException2)
      {
        for (;;) {}
      }
    }
  }
}
