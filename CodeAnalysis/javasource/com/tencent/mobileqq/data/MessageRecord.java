package com.tencent.mobileqq.data;

import android.text.TextUtils;
import com.tencent.biz.anonymous.AnonymousChatHelper;
import com.tencent.mobileqq.app.message.MsgProxyUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.ConflictClause;
import com.tencent.mobileqq.persistence.Entity;
import com.tencent.mobileqq.persistence.notColumn;
import com.tencent.mobileqq.persistence.uniqueConstraints;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.troop.data.MessageInfo;
import com.tencent.mobileqq.util.Utils;
import com.tencent.mobileqq.utils.MsgUtils;
import com.tencent.qphone.base.util.QLog;
import java.io.UnsupportedEncodingException;
import java.util.Random;
import org.json.JSONObject;

@uniqueConstraints(clause=ConflictClause.IGNORE, columnNames="time,senderuin,msgData,istroop,shmsgseq,msgseq")
public class MessageRecord
  extends Entity
{
  public static final int EXTRA_STREAM_PTT_FLAG = 10001;
  public static final int MIN_VERSION_CODE_SUPPORT_IMAGE_MD5_TRANS = 2;
  public static final int MSG_TYPE_0x7F = -2006;
  public static final int MSG_TYPE_ACTIVATE_FRIENDS = -5003;
  public static final int MSG_TYPE_ACTIVITY = -4002;
  public static final int MSG_TYPE_APPROVAL_GRAY_TIPS = -2041;
  public static final int MSG_TYPE_APPROVAL_MSG = -2040;
  public static final int MSG_TYPE_ARK_APP = -5008;
  public static final int MSG_TYPE_AUTHORIZE_FAILED = -4005;
  public static final int MSG_TYPE_AUTOREPLY = -10000;
  public static final int MSG_TYPE_BAT_PROCESS_FILE = -3013;
  public static final int MSG_TYPE_BIT_APP_MSG = -5009;
  public static final int MSG_TYPE_BIZ_DATA = -2023;
  public static final int MSG_TYPE_C2C_CHAT_FREQ_CALL_TIP = -1014;
  public static final int MSG_TYPE_C2C_KEYWORD_CALL_TIP = -1015;
  public static final int MSG_TYPE_C2C_MIXED = -30002;
  public static final int MSG_TYPE_COLOR_RING_TIPS = -3012;
  public static final int MSG_TYPE_CONFIGURABLE_GRAY_TIPS = 2024;
  public static final int MSG_TYPE_CONFIGURABLE_TAB_VISIBLE_GRAY_TIPS = -2042;
  public static final int MSG_TYPE_DATE_FEED = -1042;
  public static final int MSG_TYPE_DEVICE_CLOSEGROUPCHAT = -4506;
  public static final int MSG_TYPE_DEVICE_DISMISSBIND = -4507;
  public static final int MSG_TYPE_DEVICE_FILE = -4500;
  public static final int MSG_TYPE_DEVICE_LITTLE_VIDEO = -4509;
  public static final int MSG_TYPE_DEVICE_OPENGROUPCHAT = -4505;
  public static final int MSG_TYPE_DEVICE_PTT = -4501;
  public static final int MSG_TYPE_DEVICE_SHORT_VIDEO = -4503;
  public static final int MSG_TYPE_DEVICE_SINGLESTRUCT = -4502;
  public static final int MSG_TYPE_DEVICE_TEXT = -4508;
  public static final int MSG_TYPE_DINGDONG_SCHEDULE_MSG = -5010;
  public static final int MSG_TYPE_DING_DONG_GRAY_TIPS = -2034;
  public static final int MSG_TYPE_DISCUSS_PUSH = -1004;
  public static final int MSG_TYPE_DISCUSS_UPGRADE_TO_GROUP_TIPS = -1050;
  public static final int MSG_TYPE_DISC_CREATE_CALL_TIP = -1016;
  public static final int MSG_TYPE_DISC_PTT_FREQ_CALL_TIP = -1017;
  public static final int MSG_TYPE_ENTER_TROOP = -4003;
  public static final int MSG_TYPE_FAILED_MSG = -2013;
  public static final int MSG_TYPE_FILE_RECEIPT = -3008;
  public static final int MSG_TYPE_FORWARD_IMAGE = -20000;
  public static final int MSG_TYPE_GAME_INVITE = -3004;
  public static final int MSG_TYPE_GAME_SHARE = -3005;
  public static final int MSG_TYPE_GRAY_TIPS = -5000;
  public static final int MSG_TYPE_GRAY_TIPS_TAB_VISIBLE = -5001;
  public static final int MSG_TYPE_GROUPDISC_FILE = -2014;
  public static final int MSG_TYPE_HOMEWORK_PRAISE = -2043;
  public static final int MSG_TYPE_HONGBAO_KEYWORDS_TIPS = -1045;
  public static final int MSG_TYPE_HOT_CHAT_TO_SEE_TIP = 1018;
  public static final int MSG_TYPE_INCOMPATIBLE_GRAY_TIPS = -5002;
  public static final int MSG_TYPE_LIFEONLINEACCOUNT = -5004;
  public static final int MSG_TYPE_LIGHTALK_MSG = -2026;
  public static final int MSG_TYPE_LOCAL_COMMON = -4000;
  public static final int MSG_TYPE_LOCAL_URL = -4001;
  public static final int MSG_TYPE_LONG_MIX = -1036;
  public static final int MSG_TYPE_LONG_TEXT = -1037;
  public static final int MSG_TYPE_MEDIA_EMO = -2001;
  public static final int MSG_TYPE_MEDIA_FILE = -2005;
  public static final int MSG_TYPE_MEDIA_FUNNY_FACE = -2010;
  public static final int MSG_TYPE_MEDIA_MARKFACE = -2007;
  public static final int MSG_TYPE_MEDIA_MULTI09 = -2003;
  public static final int MSG_TYPE_MEDIA_MULTI513 = -2004;
  public static final int MSG_TYPE_MEDIA_PIC = -2000;
  public static final int MSG_TYPE_MEDIA_PTT = -2002;
  public static final int MSG_TYPE_MEDIA_SECRETFILE = -2008;
  public static final int MSG_TYPE_MEDIA_SHORTVIDEO = -2022;
  public static final int MSG_TYPE_MEDIA_VIDEO = -2009;
  public static final int MSG_TYPE_MEETING_NOTIFY = -5006;
  public static final int MSG_TYPE_MIX = -1035;
  public static final int MSG_TYPE_MULTI_TEXT_VIDEO = -4008;
  public static final int MSG_TYPE_MULTI_VIDEO = -2016;
  public static final int MSG_TYPE_MY_ENTER_TROOP = -4004;
  public static final int MSG_TYPE_NEARBY_DATING_SAFETY_TIP = -1028;
  public static final int MSG_TYPE_NEARBY_DATING_TIP = -1024;
  public static final int MSG_TYPE_NEARBY_FLOWER_TIP = -2037;
  public static final int MSG_TYPE_NEARBY_MARKET = -2027;
  public static final int MSG_TYPE_NEARBY_RECOMMENDER = -4011;
  public static final int MSG_TYPE_NEW_FRIEND_TIPS = -1013;
  public static final int MSG_TYPE_NEW_FRIEND_TIPS_GAME_ADDEE = -1019;
  public static final int MSG_TYPE_NEW_FRIEND_TIPS_GAME_ADDER = -1018;
  public static final int MSG_TYPE_NULL = -999;
  public static final int MSG_TYPE_ONLINE_FILE_REQ = -3007;
  public static final int MSG_TYPE_OPERATE_TIPS = -1041;
  public static final int MSG_TYPE_PA_PHONE_MSG_TIPS = -1048;
  public static final int MSG_TYPE_PC_PUSH = -3001;
  public static final int MSG_TYPE_PIC_AND_TEXT_MIXED = -3000;
  public static final int MSG_TYPE_PIC_QSECRETARY = -1032;
  public static final int MSG_TYPE_PSTN_CALL = -2046;
  public static final int MSG_TYPE_PTT_QSECRETARY = -1031;
  public static final int MSG_TYPE_PUBLIC_ACCOUNT = -3006;
  public static final int MSG_TYPE_QLINK_AP_CREATE_SUC_TIPS = -3011;
  public static final int MSG_TYPE_QLINK_FILE_TIPS = -3009;
  public static final int MSG_TYPE_QLINK_SEND_FILE_TIPS = -3010;
  public static final int MSG_TYPE_QQWALLET_MSG = -2025;
  public static final int MSG_TYPE_QQWALLET_TIPS = -2029;
  public static final int MSG_TYPE_QZONE_NEWEST_FEED = -2015;
  public static final int MSG_TYPE_RECOMMAND_TIPS = -5007;
  public static final int MSG_TYPE_RED_PACKET_TIPS = -1044;
  public static final int MSG_TYPE_RENEWAL_TAIL_TIP = -4020;
  public static final int MSG_TYPE_REPLY_TEXT = -1049;
  public static final int MSG_TYPE_REVOKE_GRAY_TIPS = -2031;
  public static final int MSG_TYPE_SENSITIVE_MSG_MASK_TIPS = -1046;
  public static final int MSG_TYPE_SHAKE_WINDOW = -2020;
  public static final int MSG_TYPE_SHARE_HOT_CHAT_GRAY_TIPS = -2033;
  public static final int MSG_TYPE_SHARE_LBS_PUSH = -4010;
  public static final int MSG_TYPE_SHIELD_MSG = -2012;
  public static final int MSG_TYPE_SINGLE_WAY_FRIEND_MSG = -2019;
  public static final int MSG_TYPE_SOUGOU_INPUT_TIPS = -1043;
  public static final int MSG_TYPE_SPECIALCARE_TIPS = -5005;
  public static final int MSG_TYPE_STRUCT_MSG = -2011;
  public static final int MSG_TYPE_STRUCT_TROOP_NOTIFICATION = -2021;
  public static final int MSG_TYPE_SYSTEM_STRUCT_MSG = -2018;
  public static final int MSG_TYPE_TEXT = -1000;
  public static final int MSG_TYPE_TEXT_FRIEND_FEED = -1034;
  public static final int MSG_TYPE_TEXT_GROUPMAN_ACCEPT = -1021;
  public static final int MSG_TYPE_TEXT_GROUPMAN_ADDREQUEST = -1020;
  public static final int MSG_TYPE_TEXT_GROUPMAN_INVITE = -1023;
  public static final int MSG_TYPE_TEXT_GROUPMAN_REFUSE = -1022;
  public static final int MSG_TYPE_TEXT_GROUP_CREATED = -1047;
  public static final int MSG_TYPE_TEXT_QSECRETARY = -1003;
  public static final int MSG_TYPE_TEXT_RECOMMEND_CIRCLE = -1033;
  public static final int MSG_TYPE_TEXT_RECOMMEND_CONTACT = -1030;
  public static final int MSG_TYPE_TEXT_RECOMMEND_TROOP = -1039;
  public static final int MSG_TYPE_TEXT_RECOMMEND_TROOP_BUSINESS = -1040;
  public static final int MSG_TYPE_TEXT_SAFE = -1002;
  public static final int MSG_TYPE_TEXT_SYSTEM_ACCEPT = -1008;
  public static final int MSG_TYPE_TEXT_SYSTEM_ACCEPTANDADD = -1007;
  public static final int MSG_TYPE_TEXT_SYSTEM_ADDREQUEST = -1006;
  public static final int MSG_TYPE_TEXT_SYSTEM_ADDSUCCESS = -1010;
  public static final int MSG_TYPE_TEXT_SYSTEM_OLD_VERSION_ADDREQUEST = -1011;
  public static final int MSG_TYPE_TEXT_SYSTEM_REFUSE = -1009;
  public static final int MSG_TYPE_TEXT_VIDEO = -1001;
  public static final int MSG_TYPE_TROOP_DELIVER_GIFT = -2035;
  public static final int MSG_TYPE_TROOP_DELIVER_GIFT_OBJ = -2038;
  public static final int MSG_TYPE_TROOP_FEE = -2036;
  public static final int MSG_TYPE_TROOP_GAP_GRAY_TIPS = -2030;
  public static final int MSG_TYPE_TROOP_MIXED = -30003;
  public static final int MSG_TYPE_TROOP_OBJ_MSG = -2017;
  public static final int MSG_TYPE_TROOP_TIPS_ADD_MEMBER = -1012;
  public static final int MSG_TYPE_TROOP_TIPS_MODIFY_CONTACTSMODE = -2028;
  public static final int MSG_TYPE_TROOP_TOPIC = -2044;
  public static final int MSG_TYPE_TROOP_TOPIC_OPEN_TIPS = -2032;
  public static final int MSG_TYPE_TROOP_UNREAD_TIPS = -4009;
  public static final int MSG_TYPE_UNCOMMONLY_USED_CONTACTS = -1026;
  public static final int MSG_TYPE_UNCOMMONLY_USED_CONTACTS_CANCEL_SET = -1027;
  public static final int MSG_TYPE_VAS_APOLLO = -2039;
  public static final int MSG_TYPE_VIP_VIDEO = -2045;
  public static final int MSG_VERSION_CODE = 3;
  public static final int MSG_VERSION_CODE_FOR_PICPTT = 3;
  public static final String QUERY_NEW_TABLE_FIELDS = "_id, extraflag, frienduin, isread, issend, istroop, NULL as msg, msgData, msgId, msgseq, msgtype, selfuin, senderuin, shmsgseq, time, versionCode, longMsgIndex, longMsgId, longMsgCount, isValid, msgUid, vipBubbleID, uniseq, sendFailCode, extStr, extInt, extLong ";
  public static final String QUERY_OLD_TABLE_FIELDS = "_id, extraflag, frienduin, isread, issend, istroop, msg, NULL as msgData, msgId, msgseq, msgtype, selfuin, senderuin, shmsgseq, time, 0 as versionCode, NULL as longMsgIndex, NULL as longMsgId, NULL as longMsgCount, 1 as isValid, NULL as msgUid, NULL as vipBubbleID, 0 as uniseq, 0 as sendFailCode, NULL as extStr, 0 as extInt, 0 as extLong";
  public static final String[] QUERY_OLD_TABLE_FIELDS_ARRAY = { "_id", "extraflag", "frienduin", "isread", "issend", "istroop", "msg", "msgId", "msgseq", "msgtype", "selfuin", "senderuin", "shmsgseq", "time" };
  public static final int SEND_FAIL_CODE_DEFAULT = 0;
  public int extInt;
  public int extLong;
  public String extStr;
  public int extraflag;
  public String frienduin;
  @notColumn
  public boolean isBlessMsg = false;
  @notColumn
  public boolean isMultiMsg = false;
  public boolean isValid = true;
  public boolean isread;
  public int issend;
  public int istroop;
  public int longMsgCount;
  public int longMsgId;
  public int longMsgIndex;
  @notColumn
  public MessageInfo mMessageInfo;
  @notColumn
  public String msg;
  public byte[] msgData;
  @Deprecated
  public long msgId;
  public long msgUid;
  public long msgseq;
  public int msgtype;
  public String selfuin;
  public int sendFailCode;
  public String senderuin;
  public long shmsgseq;
  public long time;
  public long uniseq;
  public int versionCode = 3;
  @notColumn
  public int vipBubbleDiyTextId;
  public long vipBubbleID;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public MessageRecord()
  {
    createMessageUniseq();
  }
  
  public static void copyMessageRecordBaseField(MessageRecord paramMessageRecord1, MessageRecord paramMessageRecord2)
  {
    selfuin = selfuin;
    senderuin = senderuin;
    msgtype = msgtype;
    msg = msg;
    time = time;
    shmsgseq = shmsgseq;
    msgseq = msgseq;
    isread = isread;
    issend = issend;
    frienduin = frienduin;
    istroop = istroop;
    extraflag = extraflag;
    sendFailCode = sendFailCode;
    msgId = msgId;
    msgUid = msgUid;
    uniseq = uniseq;
    extInt = extInt;
    extLong = extLong;
    extStr = extStr;
    isValid = isValid;
    versionCode = versionCode;
    vipBubbleID = vipBubbleID;
    longMsgCount = longMsgCount;
    longMsgId = longMsgId;
    longMsgIndex = longMsgIndex;
    msgData = msgData;
    vipBubbleDiyTextId = vipBubbleDiyTextId;
  }
  
  public static void copyMessageRecordStatusField(MessageRecord paramMessageRecord1, MessageRecord paramMessageRecord2)
  {
    time = time;
    shmsgseq = shmsgseq;
    msgseq = msgseq;
    isread = isread;
    issend = issend;
    extraflag = extraflag;
    sendFailCode = sendFailCode;
    msgUid = msgUid;
    uniseq = uniseq;
    extInt = extInt;
    extLong = extLong;
    extStr = extStr;
    isValid = isValid;
    versionCode = versionCode;
    vipBubbleID = vipBubbleID;
    longMsgCount = longMsgCount;
    longMsgId = longMsgId;
    longMsgIndex = longMsgIndex;
    vipBubbleDiyTextId = vipBubbleDiyTextId;
  }
  
  public static long getDatabaseMsgID(long paramLong)
  {
    if (getVersionCode(paramLong) > 0) {
      return paramLong;
    }
    return -100L - paramLong;
  }
  
  public static long getLogicMsgID(long paramLong, int paramInt)
  {
    if (paramInt > 0) {
      return paramLong;
    }
    return -100L - paramLong;
  }
  
  public static String getOldTableName(String paramString, int paramInt)
  {
    String str = "friend";
    switch (paramInt)
    {
    }
    for (;;)
    {
      return "mr_" + str + "_" + MsgProxyUtils.a(paramString);
      str = "troop";
      continue;
      str = "discusssion";
      continue;
      str = "contact";
    }
  }
  
  public static String getTableName(String paramString, int paramInt)
  {
    String str = "friend";
    switch (paramInt)
    {
    }
    while (!TextUtils.isEmpty(paramString))
    {
      return "mr_" + str + "_" + MsgProxyUtils.a(paramString) + "_New";
      str = "troop_hctopic";
      continue;
      str = "troop";
      continue;
      str = "discusssion";
      continue;
      str = "contact";
      continue;
      str = "devicemsg";
    }
    return "MessageRecord_frienduin_null";
  }
  
  public static int getTypeByTableName(String paramString)
  {
    if (paramString.startsWith("mr_troop")) {
      return 1;
    }
    if (paramString.startsWith("mr_discusssion")) {
      return 3000;
    }
    if (paramString.startsWith("mr_contact")) {
      return 1006;
    }
    if (paramString.startsWith("mr_devicemsg")) {
      return 9501;
    }
    return 0;
  }
  
  public static int getVersionCode(long paramLong)
  {
    if (paramLong < 0L) {
      return 0;
    }
    return 3;
  }
  
  public void createMessageUniseq()
  {
    uniseq = ((int)time);
    if (uniseq == 0L) {
      uniseq = ((int)(System.currentTimeMillis() / 1000L));
    }
    uniseq = (uniseq << 32 | Math.abs(new Random().nextInt()));
  }
  
  public String getBaseInfoString()
  {
    if (isLongMsg()) {}
    for (int i = 69;; i = 0)
    {
      StringBuilder localStringBuilder = new StringBuilder(i + 256);
      localStringBuilder.append("MessageRecord BaseInfo=friendUin:").append(frienduin).append(",_id:").append(getId()).append(",shmsgseq:").append(shmsgseq).append(",uid:").append(msgUid).append(",uniseq:").append(uniseq).append(",time:").append(time).append(",extraFlag:").append(extraflag).append(",istroop:").append(istroop).append(",msgType:").append(msgtype).append(",msg:").append(Utils.a(msg));
      if (isLongMsg()) {
        localStringBuilder.append(",longMsgId:").append(longMsgId).append(",longMsgCount:").append(longMsgCount).append(",longMsgIndex:").append(longMsgIndex);
      }
      return localStringBuilder.toString();
    }
  }
  
  protected Class getClassForTable()
  {
    return MessageRecord.class;
  }
  
  public String getContentForSearch()
  {
    if (isSupportFTS()) {
      return msg;
    }
    return null;
  }
  
  public String getExtInfoFromExtStr(String paramString)
  {
    if ((extLong & 0x1) != 1) {
      return "";
    }
    if (TextUtils.isEmpty(extStr)) {
      return "";
    }
    try
    {
      JSONObject localJSONObject = new JSONObject(extStr);
      if (localJSONObject.has(paramString)) {
        return localJSONObject.getString(paramString);
      }
      return "";
    }
    catch (Exception paramString)
    {
      if (QLog.isColorLevel()) {
        QLog.e("MessageRecord", 2, paramString.getMessage(), paramString);
      }
    }
    return "";
  }
  
  public String getLogColorContent()
  {
    return Utils.a(msg);
  }
  
  public String getLongMsgInfoString()
  {
    if (isLongMsg()) {}
    for (int i = 69;; i = 0)
    {
      StringBuilder localStringBuilder = new StringBuilder(i + 129);
      localStringBuilder.append("MessageRecord LongMsgInfo=friendUin:").append(frienduin).append(",istroop:").append(istroop).append(",msgType:").append(msgtype).append(",msg:").append(Utils.a(msg)).append(",time:").append(time);
      if (isLongMsg()) {
        localStringBuilder.append(",longMsgId:").append(longMsgId).append(",longMsgCount:").append(longMsgCount).append(",longMsgIndex:").append(longMsgIndex);
      }
      return localStringBuilder.toString();
    }
  }
  
  public int getPttStreamFlag()
  {
    return (short)(extInt & 0xFFFF);
  }
  
  public int getRepeatCount()
  {
    return (short)(extInt >> 16);
  }
  
  public String getTableName()
  {
    if (isMultiMsg) {
      return "mr_multimessage";
    }
    return getTableName(frienduin, istroop);
  }
  
  public String getUserLogString()
  {
    StringBuilder localStringBuilder = new StringBuilder(133);
    localStringBuilder.append("MessageRecord=");
    if ((frienduin != null) && (frienduin.length() >= 4)) {
      localStringBuilder.append("friendUin:").append(frienduin.substring(frienduin.length() - 4));
    }
    if ((senderuin != null) && (senderuin.length() >= 4)) {
      localStringBuilder.append("senderuin:").append(senderuin.substring(senderuin.length() - 4));
    }
    localStringBuilder.append(",istroop:").append(istroop).append(",msgType:").append(msgtype).append(",time:").append(time).append(",shmsgseq:").append(shmsgseq);
    return localStringBuilder.toString();
  }
  
  public void init(long paramLong1, long paramLong2, long paramLong3, String paramString, long paramLong4, int paramInt1, int paramInt2, long paramLong5)
  {
    selfuin = String.valueOf(paramLong1);
    frienduin = String.valueOf(paramLong2);
    senderuin = String.valueOf(paramLong3);
    msg = paramString;
    paramLong1 = paramLong4;
    if (paramLong4 <= 0L) {
      paramLong1 = (int)MessageCache.a();
    }
    time = paramLong1;
    msgtype = paramInt1;
    istroop = paramInt2;
    msgseq = paramLong5;
  }
  
  public void init(String paramString1, String paramString2, String paramString3, String paramString4, long paramLong1, int paramInt1, int paramInt2, long paramLong2)
  {
    selfuin = paramString1;
    frienduin = paramString2;
    senderuin = paramString3;
    msg = paramString4;
    long l = paramLong1;
    if (paramLong1 <= 0L) {
      l = (int)MessageCache.a();
    }
    time = l;
    msgtype = paramInt1;
    istroop = paramInt2;
    msgseq = paramLong2;
  }
  
  public boolean isLongMsg()
  {
    return longMsgCount > 1;
  }
  
  public boolean isSend()
  {
    if ((AnonymousChatHelper.a(this)) && (AnonymousChatHelper.b(this))) {
      return true;
    }
    return MsgUtils.a(issend);
  }
  
  public boolean isSendFromLocal()
  {
    return MsgUtils.b(issend);
  }
  
  public boolean isSendFromOtherTerminal()
  {
    return MsgUtils.c(issend);
  }
  
  public boolean isSupportFTS()
  {
    return false;
  }
  
  public boolean needVipBubble()
  {
    return (istroop == 0) || (istroop == 1) || (istroop == 3000) || (istroop == 1001) || (istroop == 1010) || (istroop == 1020);
  }
  
  protected void postRead()
  {
    try
    {
      if (versionCode > 0) {
        msg = new String(msgData, "UTF-8");
      }
      return;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      localUnsupportedEncodingException.printStackTrace();
    }
  }
  
  protected void postwrite() {}
  
  protected void prewrite()
  {
    if (msg != null) {}
    try
    {
      if (versionCode > 0) {
        msgData = msg.getBytes("UTF-8");
      }
      return;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      localUnsupportedEncodingException.printStackTrace();
    }
  }
  
  public void removeExtInfoToExtStr(String paramString)
  {
    try
    {
      if (TextUtils.isEmpty(extStr)) {
        return;
      }
      JSONObject localJSONObject = new JSONObject(extStr);
      if (localJSONObject.has(paramString))
      {
        localJSONObject.remove(paramString);
        extStr = localJSONObject.toString();
      }
      if (localJSONObject.length() == 0)
      {
        extStr = null;
        extLong = ((int)(extLong & 0xFFFFFFFFFFFFFFFE));
        return;
      }
    }
    catch (Exception paramString)
    {
      if (QLog.isColorLevel()) {
        QLog.e("MessageRecord", 2, paramString.getMessage(), paramString);
      }
    }
  }
  
  public void saveExtInfoToExtStr(String paramString1, String paramString2)
  {
    try
    {
      JSONObject localJSONObject;
      if (TextUtils.isEmpty(extStr))
      {
        localJSONObject = new JSONObject();
        localJSONObject.put(paramString1, paramString2);
      }
      for (extStr = localJSONObject.toString();; extStr = localJSONObject.toString())
      {
        extLong |= 0x1;
        return;
        localJSONObject = new JSONObject(extStr);
        localJSONObject.put(paramString1, paramString2);
      }
      return;
    }
    catch (Exception paramString1)
    {
      if (QLog.isColorLevel()) {
        QLog.e("MessageRecord", 2, paramString1.getMessage(), paramString1);
      }
    }
  }
  
  public void setPttStreamFlag(int paramInt)
  {
    extInt &= 0xFFFF0000;
    extInt = ((short)paramInt & 0xFFFF | extInt);
  }
  
  public void setRepeatCount(int paramInt)
  {
    extInt &= 0xFFFF;
    extInt = (paramInt << 16 | extInt);
  }
  
  public String toString()
  {
    int j = getClass().getSimpleName().length();
    if (isLongMsg()) {}
    for (int i = 69;; i = 0)
    {
      StringBuilder localStringBuilder = new StringBuilder(i + (j + 39 + 9 + 10 + 11 + 10 + 11 + 10 + 10 + 10 + 5 + 19 + 6 + 19 + 8 + 5 + 8 + 5 + 11 + 10 + 14 + 10 + 9 + 5 + 9 + 10 + 5 + 14 + 10 + 19 + 8 + 19 + 12 + 5 + 8 + 19));
      localStringBuilder.append("-----Dump MessageRecord-----,classname:").append(getClass().getSimpleName()).append(",selfUin:").append(selfuin).append(",friendUin:").append(frienduin).append(",senderUin:").append(senderuin).append(",shmsgseq:").append(shmsgseq).append(",uid:").append(msgUid).append(",time:").append(time).append(",isRead:").append(isread).append(",isSend:").append(issend).append(",extraFlag:").append(extraflag).append(",sendFailCode:").append(sendFailCode).append(",istroop:").append(istroop).append(",msgType:").append(msgtype).append(",msg:").append(Utils.a(msg)).append(",bubbleid:").append(vipBubbleID).append(",uniseq:").append(uniseq).append(",isMultiMsg:").append(isMultiMsg).append(",msgseq:").append(msgseq);
      if (isLongMsg()) {
        localStringBuilder.append(",longMsgId:").append(longMsgId).append(",longMsgCount:").append(longMsgCount).append(",longMsgIndex:").append(longMsgIndex);
      }
      return localStringBuilder.toString();
    }
  }
}
