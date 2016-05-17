package com.tencent.mobileqq.app.message;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Resources;
import android.text.TextUtils;
import com.tencent.biz.pubaccount.troopbarassit.TroopBarAssistantManager;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.LifeOnlineAccountInfoManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.proxy.ProxyManager;
import com.tencent.mobileqq.app.proxy.RecentUserProxy;
import com.tencent.mobileqq.data.ConversationInfo;
import com.tencent.mobileqq.data.MessageForQQWalletMsg;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.dating.DatingUtil;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.openapi.OpenApiManager;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.utils.SecurityUtile;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Observable;
import java.util.Set;
import mqq.app.MobileQQ;
import mqq.manager.Manager;

public class ConversationFacade
  extends Observable
  implements Manager
{
  public static final int a = 0;
  public static final String a = "sp_nearby_summary";
  public static final int b = 0;
  public static final String b = "sm";
  public static final String c = "lastuin";
  private static final String e = "date_box_last_read_time";
  private static final String f = "lbs_box_last_read_time";
  private static final String g = "%s_%s_%s";
  private final QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private Object jdField_a_of_type_JavaLangObject;
  private Set jdField_a_of_type_JavaUtilSet;
  private Set b;
  private final String d;
  
  public ConversationFacade(QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    d = "Q.unread.Facade";
    jdField_a_of_type_JavaLangObject = new Object();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
  }
  
  public static int a(ConversationInfo paramConversationInfo)
  {
    if (paramConversationInfo == null) {
      return 0;
    }
    return Math.max(unreadCount, unreadMark);
  }
  
  private static SharedPreferences a(QQAppInterface paramQQAppInterface, int paramInt)
  {
    if (paramInt == 1001) {}
    for (String str = "sp_nearby_summary_" + paramQQAppInterface.a(); !TextUtils.isEmpty(str); str = "") {
      return BaseApplicationImpl.a.getSharedPreferences("sp_nearby_summary_" + paramQQAppInterface.a(), 0);
    }
    return null;
  }
  
  private FriendsManager a()
  {
    return (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
  }
  
  private ConversationProxy a()
  {
    return jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a();
  }
  
  private MsgProxy a(int paramInt)
  {
    return jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt);
  }
  
  private QQMessageFacade a()
  {
    return jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
  }
  
  private static String a(String paramString, int paramInt, boolean paramBoolean)
  {
    if (paramBoolean) {}
    for (String str = "lastuin";; str = "sm") {
      return String.format("%s_%s_%s", new Object[] { str, paramString, Integer.valueOf(paramInt) });
    }
  }
  
  private Set a(int paramInt)
  {
    if (paramInt == 1010)
    {
      if (jdField_a_of_type_JavaUtilSet == null) {
        jdField_a_of_type_JavaUtilSet = a(AppConstants.aO, paramInt, "date_box_last_read_time");
      }
      return jdField_a_of_type_JavaUtilSet;
    }
    if (paramInt == 1001)
    {
      if (b == null) {
        b = a(AppConstants.aN, paramInt, "lbs_box_last_read_time");
      }
      return b;
    }
    return null;
  }
  
  private Set a(String paramString1, int paramInt, String paramString2)
  {
    long l1 = 0L;
    if (QLog.isColorLevel())
    {
      l1 = System.currentTimeMillis();
      QLog.d("Q.msg_box", 2, "initSayHelloSet,boxType:" + paramInt + ",startTime:" + l1);
    }
    SharedPreferences localSharedPreferences = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), 0);
    HashSet localHashSet = new HashSet();
    paramString1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramInt).a(paramString1, paramInt);
    long l2 = localSharedPreferences.getLong(paramString2, 0L);
    paramString1 = paramString1.iterator();
    while (paramString1.hasNext())
    {
      paramString2 = (MessageRecord)paramString1.next();
      if (QLog.isDevelopLevel()) {
        QLog.d("Q.msg_box", 4, "lastTime:" + l2 + ",mr.time:" + time + ",uin:" + senderuin + ",istroop:" + istroop);
      }
      if ((a(senderuin, paramInt) > 0) && (time > l2)) {
        localHashSet.add(senderuin);
      }
    }
    if (QLog.isColorLevel())
    {
      l2 = System.currentTimeMillis();
      QLog.d("Q.msg_box", 2, "initSayHelloSet,endTime:" + l2 + ",costTime:" + (l2 - l1));
    }
    return localHashSet;
  }
  
  public static boolean a(int paramInt)
  {
    return (paramInt == 3000) || (paramInt == 1);
  }
  
  private boolean a(MessageRecord paramMessageRecord, Set paramSet)
  {
    if ((paramSet == null) || (paramSet.isEmpty())) {
      return false;
    }
    paramSet = paramSet.iterator();
    while (paramSet.hasNext()) {
      if (MsgProxyUtils.a(paramMessageRecord, (MessageRecord)paramSet.next())) {
        return true;
      }
    }
    return false;
  }
  
  public static int b(ConversationInfo paramConversationInfo)
  {
    if (paramConversationInfo == null) {
      return 0;
    }
    return unreadCount;
  }
  
  public static int c(ConversationInfo paramConversationInfo)
  {
    if (paramConversationInfo == null) {
      return 0;
    }
    return unreadMark;
  }
  
  private void d()
  {
    b(AppConstants.aq, 1001);
    b(AppConstants.af, 1009);
    b(AppConstants.aG, 1010);
  }
  
  public int a(int paramInt)
  {
    Object localObject;
    int i;
    if (paramInt == 1001)
    {
      localObject = a(paramInt).a(AppConstants.aN, 1001);
      if ((localObject != null) && (!((List)localObject).isEmpty())) {
        break label72;
      }
      if (QLog.isColorLevel()) {
        QLog.d("Q.unread.Facade", 2, "list is null or list is empty");
      }
      i = 0;
    }
    label72:
    do
    {
      return i;
      localObject = a(paramInt).a(AppConstants.aO, 1010);
      break;
      localObject = ((List)localObject).iterator();
      MessageRecord localMessageRecord;
      for (paramInt = 0; ((Iterator)localObject).hasNext(); paramInt = a(senderuin, istroop) + paramInt) {
        localMessageRecord = (MessageRecord)((Iterator)localObject).next();
      }
      i = paramInt;
    } while (!QLog.isColorLevel());
    QLog.d("Q.unread.Facade", 2, "nUnreadCount=" + paramInt);
    return paramInt;
  }
  
  public int a(MessageRecord paramMessageRecord)
  {
    if (paramMessageRecord == null) {
      return 0;
    }
    return DatingUtil.a(paramMessageRecord);
  }
  
  public int a(String paramString, int paramInt)
  {
    return a(a().a(paramString, paramInt));
  }
  
  public int a(String paramString, int paramInt1, int paramInt2)
  {
    paramString = a(paramInt1).a(paramString, paramInt1);
    if ((paramString == null) || (paramString.isEmpty()))
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.unread.Facade", 2, "list is null or list is empty");
      }
      paramInt2 = 0;
      return paramInt2;
    }
    label56:
    MessageRecord localMessageRecord;
    if (paramInt2 == 0)
    {
      paramString = paramString.iterator();
      paramInt2 = 0;
      paramInt1 = paramInt2;
      if (!paramString.hasNext()) {
        break label176;
      }
      localMessageRecord = (MessageRecord)paramString.next();
      if (!MsgProxyUtils.c(localMessageRecord)) {
        break label217;
      }
    }
    label122:
    label176:
    label212:
    label217:
    for (paramInt1 = d(senderuin, istroop) + paramInt2;; paramInt1 = paramInt2)
    {
      paramInt2 = paramInt1;
      break label56;
      if (paramInt2 == 1)
      {
        paramString = paramString.iterator();
        paramInt2 = 0;
        paramInt1 = paramInt2;
        if (!paramString.hasNext()) {
          break label176;
        }
        localMessageRecord = (MessageRecord)paramString.next();
        if (!MsgProxyUtils.c(localMessageRecord)) {
          break label212;
        }
      }
      for (paramInt1 = e(senderuin, istroop) + paramInt2;; paramInt1 = paramInt2)
      {
        paramInt2 = paramInt1;
        break label122;
        paramInt1 = 0;
        paramInt2 = paramInt1;
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.d("Q.unread.Facade", 2, "nUnreadGiftCount=" + paramInt1);
        return paramInt1;
      }
    }
  }
  
  public long a(String paramString, int paramInt)
  {
    return a().a(paramString, paramInt);
  }
  
  public String a(String paramString1, int paramInt1, String paramString2, int paramInt2)
  {
    if ((TextUtils.isEmpty(paramString1)) || (!MsgProxyUtils.v(paramInt1))) {}
    for (;;)
    {
      return paramString2;
      SharedPreferences localSharedPreferences = a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramInt1);
      String str;
      if (paramInt1 == 1001)
      {
        if ((paramInt2 < 0) || (paramInt2 > 0)) {
          continue;
        }
        if (AppConstants.aq.equals(paramString1))
        {
          paramString1 = localSharedPreferences.getString(a(AppConstants.aq, paramInt2, true), "");
          str = paramString1;
          if (AppConstants.aN.equals(paramString1)) {
            str = localSharedPreferences.getString(a(AppConstants.aN, paramInt2, true), "");
          }
        }
      }
      while (!TextUtils.isEmpty(str))
      {
        return SecurityUtile.a(localSharedPreferences.getString(a(str, paramInt2, false), paramString2));
        str = paramString1;
        if (AppConstants.aN.equals(paramString1))
        {
          str = localSharedPreferences.getString(a(AppConstants.aN, paramInt2, true), "");
          continue;
          str = null;
        }
      }
    }
  }
  
  public Set a()
  {
    return a().a();
  }
  
  public void a()
  {
    a().c();
    Object localObject2 = a().a();
    Object localObject1 = new HashSet();
    localObject2 = ((Set)localObject2).iterator();
    label290:
    while (((Iterator)localObject2).hasNext())
    {
      ConversationInfo localConversationInfo = (ConversationInfo)((Iterator)localObject2).next();
      if (b(uin, type))
      {
        if (MsgProxyUtils.a(uin, type)) {
          b(uin, type);
        }
        if ((QLog.isColorLevel()) && ((a(localConversationInfo) != 0) || (unreadGiftCount != 0) || (extInt1 != 0))) {
          QLog.d("Q.unread.Facade", 2, "initCache info=" + localConversationInfo.toString());
        }
      }
      for (;;)
      {
        if ((a(localConversationInfo) != 0) || ((unreadGiftCount == 0) && (extInt1 == 0))) {
          break label290;
        }
        a(uin, unreadGiftCount, false);
        break;
        if ((MsgProxyUtils.s(type)) && (!MsgProxyUtils.a(uin, type)) && (!a(uin, MsgProxyUtils.a(type)))) {
          ((Set)localObject1).add(localConversationInfo);
        }
        if ((QLog.isColorLevel()) && ((a(localConversationInfo) != 0) || (unreadGiftCount != 0) || (extInt1 != 0))) {
          QLog.d("Q.unread.Facade", 2, "initCache [not in recent] info=" + localConversationInfo.toString());
        }
      }
    }
    if (!((Set)localObject1).isEmpty())
    {
      localObject1 = ((Set)localObject1).iterator();
      while (((Iterator)localObject1).hasNext())
      {
        localObject2 = (ConversationInfo)((Iterator)localObject1).next();
        if (QLog.isColorLevel()) {
          QLog.d("Q.unread.Facade", 2, "initCache remove info=" + ((ConversationInfo)localObject2).toString());
        }
        a().a(uin, type);
      }
    }
  }
  
  public void a(int paramInt, long paramLong)
  {
    Set localSet = a(paramInt);
    if (localSet == null) {
      return;
    }
    for (;;)
    {
      synchronized (jdField_a_of_type_JavaLangObject)
      {
        localSet.clear();
        ??? = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), 0);
        if (paramInt == 1010)
        {
          ((SharedPreferences)???).edit().putLong("date_box_last_read_time", paramLong).commit();
          if (!QLog.isColorLevel()) {
            break;
          }
          QLog.d("Q.msg_box", 2, "clearNewSayHelloSet,boxType:" + paramInt + ",time:" + paramLong);
          return;
        }
      }
      if (paramInt == 1001) {
        ((SharedPreferences)???).edit().putLong("lbs_box_last_read_time", paramLong).commit();
      }
    }
  }
  
  public void a(int paramInt, String paramString)
  {
    Set localSet = a(paramInt);
    if ((localSet == null) || (TextUtils.isEmpty(paramString))) {
      return;
    }
    synchronized (jdField_a_of_type_JavaLangObject)
    {
      if (!localSet.contains(paramString)) {
        localSet.add(paramString);
      }
      return;
    }
  }
  
  public void a(ConversationInfo paramConversationInfo, String paramString)
  {
    int i = 1;
    if (QLog.isColorLevel()) {
      QLog.i("Q.msg_box", 2, "updateSummaryLastUin info = " + paramConversationInfo + ", lbsHongbaoLastUin = " + paramString);
    }
    if ((paramConversationInfo == null) || (!MsgProxyUtils.v(type)) || (TextUtils.isEmpty(uin))) {}
    for (;;)
    {
      return;
      SharedPreferences.Editor localEditor = a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, type).edit();
      if (type == 1001)
      {
        if ((!AppConstants.aN.equals(uin)) && (!AppConstants.aq.equals(uin))) {
          continue;
        }
        if ((extInt1 <= 0) || (TextUtils.isEmpty(paramString))) {
          localEditor.remove(a(uin, 0, true));
        }
      }
      while (i != 0)
      {
        localEditor.commit();
        return;
        localEditor.putString(a(uin, 0, true), paramString);
        continue;
        i = 0;
      }
    }
  }
  
  protected void a(String paramString, int paramInt)
  {
    a(paramString, paramInt, true);
    a().a(paramString, paramInt);
  }
  
  public void a(String paramString, int paramInt1, int paramInt2)
  {
    a().a(paramString, paramInt1, paramInt2);
  }
  
  protected void a(String paramString, int paramInt, long paramLong)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.unread.Facade", 2, "cleanUnreadFrom uin=" + paramString + ",type=" + paramInt + ",lastread=" + paramLong);
    }
    if ((paramInt == 1008) && (TroopBarAssistantManager.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramString))) {
      if (QLog.isColorLevel()) {
        QLog.d("Q.unread.Facade", 2, "isTroopBarAccount");
      }
    }
    do
    {
      return;
      if ((paramInt != 1008) || (!TextUtils.equals(paramString, AppConstants.aX))) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.d("Q.unread.Facade", 2, "NEW_KANDIAN_UIN not unread");
    return;
    b(paramString, paramInt, paramLong);
    a(paramInt).a(paramString, paramInt, paramLong);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.G();
    OpenApiManager localOpenApiManager = OpenApiManager.a();
    if (a(paramString, paramInt) == 0) {}
    for (boolean bool = true;; bool = false)
    {
      localOpenApiManager.a(paramString, paramInt, bool, paramLong);
      return;
    }
  }
  
  protected void a(String paramString, int paramInt, long paramLong, boolean paramBoolean)
  {
    a(paramString, paramInt, paramLong, true, paramBoolean);
  }
  
  protected void a(String paramString, int paramInt, long paramLong, boolean paramBoolean1, boolean paramBoolean2)
  {
    long l = a().a(paramString, paramInt);
    if (QLog.isColorLevel()) {
      QLog.d("Q.unread.Facade", 2, "cleanUnread uin=" + paramString + ",type" + paramInt + ",unread" + l + " ,lastread" + paramLong + ",needDelMark" + paramBoolean2);
    }
    if ((MsgProxyUtils.b(paramInt)) && (paramInt == 1008)) {
      ((LifeOnlineAccountInfoManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(86)).a(paramString);
    }
    if (paramBoolean2) {
      a().a(paramString, paramInt, 0);
    }
    a().a(paramString, paramInt, paramLong, 0, 0, 0);
    if (l > 0L)
    {
      if ((MsgProxyUtils.c(paramInt)) && (paramBoolean1)) {
        d();
      }
      QQMessageFacade.Message localMessage = a().a(paramString, paramInt);
      if (localMessage != null) {
        a(paramInt).a(paramString, paramInt, localMessage);
      }
    }
    OpenApiManager.a().a(paramString, paramInt, true, 0L);
  }
  
  protected void a(String paramString, int paramInt, MessageRecord paramMessageRecord)
  {
    int j = 0;
    int i;
    if (paramMessageRecord != null)
    {
      i = a(paramMessageRecord) * -1;
      j = b(paramMessageRecord) * -1;
    }
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.unread.Facade", 2, "increaseUnread uin=" + paramString + ",type" + paramInt + ",unreadDiff" + -1 + ",unreadGiftDiff=" + i + ",unreadRedPacketDiff=" + j + ",mr=" + paramMessageRecord);
      }
      a().a(paramString, paramInt, -1, i, j);
      if (MsgProxyUtils.c(paramInt)) {
        d();
      }
      return;
      i = 0;
    }
  }
  
  @Deprecated
  public void a(String paramString1, int paramInt1, String paramString2, int paramInt2)
  {
    paramInt2 = a().a(paramString2, paramInt2);
    int i = a().a(paramString1, paramInt1);
    if (QLog.isColorLevel()) {
      QLog.d("Q.unread.Facade", 2, "moveBoxToMessageTab innerItemUnread=" + paramInt2 + ", convsItemUnread=" + i);
    }
    b(paramString1, paramInt1);
  }
  
  protected void a(String paramString, int paramInt, List paramList)
  {
    int i = 0;
    Iterator localIterator = paramList.iterator();
    int j = 0;
    while (localIterator.hasNext())
    {
      MessageRecord localMessageRecord = (MessageRecord)localIterator.next();
      int n = a(localMessageRecord) * -1;
      int i1 = b(localMessageRecord) * -1;
      if (localMessageRecord != null)
      {
        int k = j + n;
        int m = i + i1;
        j = k;
        i = m;
        if (QLog.isColorLevel())
        {
          QLog.d("Q.unread.Facade", 2, "increaseUnread uin=" + paramString + ",type" + paramInt + ",unreadDiff" + -1 + ",unreadGiftDiff=" + n + ",unreadRedPacketDiff=" + i1 + ",mr=" + localMessageRecord);
          j = k;
          i = m;
        }
      }
    }
    a().a(paramString, paramInt, paramList.size(), j, i);
    if (MsgProxyUtils.c(paramInt)) {
      d();
    }
  }
  
  public void a(String paramString, int paramInt, boolean paramBoolean)
  {
    a(paramString, paramInt, a().a(paramString, paramInt), paramBoolean);
  }
  
  public void a(String paramString1, String paramString2, int paramInt1, int paramInt2)
  {
    if (QLog.isColorLevel()) {
      QLog.i("Q.msg_box", 2, "saveMrSummary uin = " + paramString1 + ", istroop = " + paramInt1 + ", summaryType=" + paramInt2);
    }
    if ((TextUtils.isEmpty(paramString1)) || (paramString2 == null) || (!MsgProxyUtils.v(paramInt1))) {}
    do
    {
      return;
      str1 = paramString2;
      if (paramInt1 != 1001) {
        break;
      }
    } while ((paramInt2 < 0) || (paramInt2 > 0));
    String str1 = paramString2;
    if (paramInt2 == 0)
    {
      String str2 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getResources().getString(2131371653);
      str1 = paramString2;
      if (paramString2.indexOf(str2) == 0) {
        str1 = paramString2.substring(str2.length());
      }
    }
    paramString2 = a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramInt1).edit();
    paramString2.putString(a(paramString1, paramInt2, false), SecurityUtile.b(str1));
    paramString2.commit();
  }
  
  public void a(List paramList)
  {
    MessageRecord localMessageRecord = null;
    int i;
    String str;
    if (paramList != null)
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.unread.Facade", 2, "addUnread msg size=" + paramList.size());
      }
      Iterator localIterator = paramList.iterator();
      i = 0;
      paramList = localMessageRecord;
      for (;;)
      {
        if (localIterator.hasNext())
        {
          localMessageRecord = (MessageRecord)localIterator.next();
          if ((localMessageRecord.isSendFromLocal()) || (isread)) {
            break label361;
          }
          if (!localMessageRecord.isLongMsg()) {
            break label358;
          }
          str = MsgProxyUtils.a(localMessageRecord);
          if (paramList != null) {
            break label355;
          }
          paramList = new HashSet();
          label115:
          if (MsgProxyUtils.a(localMessageRecord))
          {
            if ((jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(localMessageRecord)) || (paramList.contains(str))) {
              continue;
            }
            paramList.add(str);
            label162:
            if (1001 != istroop) {
              break label276;
            }
            if (!AppConstants.aq.equals(frienduin)) {
              break label248;
            }
            a().a(senderuin, 1001, 1, a(localMessageRecord), b(localMessageRecord));
            label210:
            if (!MsgProxyUtils.c(istroop)) {
              break label352;
            }
            i = 1;
          }
        }
      }
    }
    label248:
    label276:
    label352:
    label355:
    label358:
    label361:
    for (;;)
    {
      break;
      if (paramList.contains(str)) {
        paramList.remove(str);
      }
      break label162;
      a().a(frienduin, 1001, 1, a(localMessageRecord), b(localMessageRecord));
      break label210;
      if (1009 == istroop)
      {
        a().a(frienduin, 1009, 1, a(localMessageRecord), b(localMessageRecord));
        break label210;
      }
      a().a(frienduin, istroop, 1, a(localMessageRecord), b(localMessageRecord));
      break label210;
      if (i != 0) {
        d();
      }
      return;
      continue;
      break label115;
      break label162;
    }
  }
  
  protected void a(boolean paramBoolean1, boolean paramBoolean2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.unread.Facade", 2, "cleanAllUnread needUpdateMsgtable=" + paramBoolean1 + ",needDelMark=" + paramBoolean2);
    }
    if (paramBoolean1)
    {
      Iterator localIterator = a().a().iterator();
      while (localIterator.hasNext())
      {
        ConversationInfo localConversationInfo = (ConversationInfo)localIterator.next();
        if (a(localConversationInfo) > 0) {
          a(uin, type, paramBoolean2);
        }
      }
    }
    a().d();
  }
  
  public boolean a(String paramString)
  {
    return jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a(paramString);
  }
  
  public boolean a(String paramString, int paramInt)
  {
    if (paramString == null) {}
    label196:
    label197:
    label199:
    label206:
    for (;;)
    {
      return false;
      Object localObject;
      String str;
      if (paramInt == 1009)
      {
        localObject = a(paramInt).a(AppConstants.af, 1009);
        str = null;
      }
      for (;;)
      {
        if ((localObject == null) || (((List)localObject).isEmpty())) {
          break label206;
        }
        localObject = ((List)localObject).iterator();
        int i = 0;
        if (((Iterator)localObject).hasNext())
        {
          MessageRecord localMessageRecord = (MessageRecord)((Iterator)localObject).next();
          if (paramString.equals(senderuin))
          {
            return true;
            if (paramInt == 1001)
            {
              localObject = a(paramInt).a(AppConstants.aq, 1001);
              str = AppConstants.aN;
              continue;
            }
            if (paramInt != 1010) {
              break label199;
            }
            localObject = a(paramInt).a(AppConstants.aG, 1010);
            str = AppConstants.aO;
            continue;
          }
          if ((str == null) || (i != 0) || (!str.equals(senderuin))) {
            break label196;
          }
          i = 1;
        }
        for (;;)
        {
          break;
          if (i == 0) {
            break label197;
          }
          return a(paramString, paramInt, str);
        }
        break;
        str = null;
        localObject = null;
      }
    }
  }
  
  public boolean a(String paramString1, int paramInt, String paramString2)
  {
    if ((paramString1 == null) || (TextUtils.isEmpty(paramString2))) {
      return false;
    }
    paramString2 = a(paramInt).a(paramString2, paramInt);
    if ((paramString2 != null) && (!paramString2.isEmpty()))
    {
      paramString2 = paramString2.iterator();
      while (paramString2.hasNext()) {
        if (paramString1.equals(nextsenderuin)) {
          return true;
        }
      }
    }
    return false;
  }
  
  public int b(int paramInt)
  {
    Set localSet = a(paramInt);
    int i = 0;
    if (localSet != null) {}
    synchronized (jdField_a_of_type_JavaLangObject)
    {
      i = localSet.size();
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg_box", 2, "getUnreadSayHelloNum,boxType:" + paramInt + ",num:" + i);
      }
      return i;
    }
  }
  
  public int b(MessageRecord paramMessageRecord)
  {
    if (paramMessageRecord == null) {}
    while ((paramMessageRecord.isSend()) || (isread) || (!MessageForQQWalletMsg.isRedPacketMsg(paramMessageRecord))) {
      return 0;
    }
    return 1;
  }
  
  public int b(String paramString, int paramInt)
  {
    return b(a().a(paramString, paramInt));
  }
  
  public void b()
  {
    Iterator localIterator = a().a().iterator();
    while (localIterator.hasNext())
    {
      ConversationInfo localConversationInfo = (ConversationInfo)localIterator.next();
      if (QLog.isColorLevel()) {
        QLog.d("Q.unread.Facade", 2, "printAllGiftConversation info=" + localConversationInfo.toString());
      }
    }
  }
  
  public void b(String paramString, int paramInt)
  {
    Object localObject1 = a(paramInt).a(paramString, paramInt);
    if ((localObject1 == null) || (((List)localObject1).isEmpty())) {
      return;
    }
    if (MsgProxyUtils.c(paramString))
    {
      c(paramString, paramInt);
      return;
    }
    String str = "";
    localObject1 = ((List)localObject1).iterator();
    int i = 0;
    int j = 0;
    int k = 0;
    label63:
    Object localObject2;
    int m;
    if (((Iterator)localObject1).hasNext())
    {
      localObject2 = (MessageRecord)((Iterator)localObject1).next();
      if (MsgProxyUtils.c(senderuin))
      {
        c(senderuin, istroop);
        m = k;
        label114:
        j += d(senderuin, istroop);
        i += e(senderuin, istroop);
        if ((!TextUtils.isEmpty(str)) || (i <= 0)) {
          break label397;
        }
        str = senderuin;
      }
    }
    label223:
    label387:
    label397:
    for (;;)
    {
      k = m;
      break label63;
      m = k;
      if (MsgProxyUtils.c((MessageRecord)localObject2)) {
        break label114;
      }
      m = k + a(senderuin, istroop);
      break label114;
      if (e(paramString, paramInt) != i)
      {
        m = 1;
        if ((a(paramString, paramInt) != k) || (d(paramString, paramInt) != j) || (m != 0))
        {
          localObject1 = a().a(paramString, paramInt);
          localObject2 = a();
          if (localObject1 != null) {
            break label387;
          }
        }
      }
      for (long l = 0L;; l = lastread)
      {
        ((ConversationProxy)localObject2).a(paramString, paramInt, l, k, j, i);
        if ((MsgProxyUtils.v(paramInt)) && (m != 0)) {
          a(a().a(paramString, paramInt), str);
        }
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.d("Q.unread.Facade", 2, "calculateMsgBoxUnreadCount boxUin=" + paramString + ", unread=" + k + ", giftCount=" + j + ", redPacketCount=" + i);
        return;
        m = 0;
        break label223;
      }
    }
  }
  
  public void b(String paramString, int paramInt1, int paramInt2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.unread.Facade", 2, "rewriteUnreadCount uin=" + paramString + ",type" + paramInt1 + ",unread" + paramInt2);
    }
    a().b(paramString, paramInt1, paramInt2);
  }
  
  protected void b(String paramString, int paramInt, long paramLong)
  {
    Object localObject1 = a(paramInt).b(paramString, paramInt);
    if ((localObject1 == null) || (((List)localObject1).isEmpty()))
    {
      if (a().a(paramString, paramInt) > 0) {
        a(paramString, paramInt, paramLong, true);
      }
      return;
    }
    ConversationInfo localConversationInfo;
    long l;
    label216:
    int i1;
    if (((a(paramInt)) && (getsize1shmsgseq <= paramLong)) || ((a(paramInt)) || (getsize1time > paramLong) || (MsgProxyUtils.a(paramInt)) || (MsgProxyUtils.b(paramInt))))
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.unread.Facade", 2, "updateLastReadSeq uin=" + paramString + ",type=" + paramInt + ",lastread=" + paramLong);
      }
      localConversationInfo = a().a(paramString, paramInt);
      if (localConversationInfo == null) {
        break label1128;
      }
      if (!a(paramInt)) {
        break label1122;
      }
      l = Math.max(paramLong, lastread);
      i1 = unreadCount;
    }
    for (;;)
    {
      label256:
      int i;
      int j;
      int k;
      Object localObject2;
      label314:
      MessageRecord localMessageRecord;
      if (a(paramInt))
      {
        paramLong = getsize1shmsgseq - l;
        i = (int)paramLong;
        j = 0;
        k = 0;
        if (QLog.isColorLevel()) {
          QLog.d("Q.unread.Facade", 2, "updateLastReadSeq unread =" + i);
        }
        localObject2 = null;
        Iterator localIterator = ((List)localObject1).iterator();
        localObject1 = null;
        if (!localIterator.hasNext()) {
          break label889;
        }
        localMessageRecord = (MessageRecord)localIterator.next();
        if (!a(paramInt)) {
          break label550;
        }
        paramLong = shmsgseq;
        label349:
        if (paramLong > l) {
          break label1116;
        }
        if (!localMessageRecord.isLongMsg()) {
          break label593;
        }
        if (localObject1 != null) {
          break label1119;
        }
        localObject1 = new HashMap();
      }
      label550:
      label593:
      label745:
      label856:
      label889:
      label1100:
      label1106:
      label1109:
      label1116:
      label1119:
      for (;;)
      {
        Object localObject3 = MsgProxyUtils.a(localMessageRecord);
        if (((Map)localObject1).containsKey(MsgProxyUtils.a(localMessageRecord)))
        {
          localObject3 = (Set)((Map)localObject1).get(localObject3);
          if ((localObject3 != null) && (!((Set)localObject3).isEmpty()) && (!a(localMessageRecord, (Set)localObject3))) {
            ((Set)localObject3).add(localMessageRecord);
          }
        }
        for (;;)
        {
          localObject3 = localObject2;
          int n = j;
          int m = k;
          Object localObject4;
          if (paramLong > l)
          {
            if (MsgProxyUtils.o(msgtype))
            {
              i -= 1;
              break label314;
              if ((a().a(paramString, paramInt) <= 0) && (a().c(paramString, paramInt) <= 0) && (a().d(paramString, paramInt) <= 0)) {
                break;
              }
              a(paramString, paramInt, paramLong, false);
              return;
              paramLong = a(paramInt).a(paramString, paramInt, paramLong);
              break label256;
              paramLong = time;
              break label349;
              localObject4 = new HashSet();
              ((Set)localObject4).add(localMessageRecord);
              ((Map)localObject1).put(localObject3, localObject4);
              continue;
              if ((!MsgProxyUtils.j(msgtype)) || (isread)) {
                break label1116;
              }
              j += a(localMessageRecord);
              k += b(localMessageRecord);
              i += 1;
              continue;
            }
            if ((a(paramInt)) && (MsgProxyUtils.p(msgtype)))
            {
              i -= 1;
              break label314;
            }
            if (!localMessageRecord.isLongMsg()) {
              break label1109;
            }
            if ((localObject1 != null) && (((Map)localObject1).containsKey(MsgProxyUtils.a(localMessageRecord))) && (a(localMessageRecord, (Set)((Map)localObject1).get(MsgProxyUtils.a(localMessageRecord)))))
            {
              i -= 1;
              break label314;
            }
            if (localObject2 != null) {
              break label1106;
            }
            localObject2 = new HashSet();
            localObject4 = MsgProxyUtils.a(localMessageRecord);
            if (!MsgProxyUtils.a(localMessageRecord)) {
              break label856;
            }
            if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(localMessageRecord))
            {
              i -= 1;
              break label314;
            }
            if (((Set)localObject2).contains(localObject4))
            {
              i -= 1;
              break label314;
            }
            ((Set)localObject2).add(localObject4);
            localObject3 = localObject2;
          }
          for (;;)
          {
            n = j + a(localMessageRecord);
            m = k + b(localMessageRecord);
            localObject2 = localObject3;
            j = n;
            k = m;
            break label314;
            localObject3 = localObject2;
            if (((Set)localObject2).contains(localObject4))
            {
              ((Set)localObject2).remove(localObject4);
              localObject3 = localObject2;
              continue;
              m = i;
              if (MsgProxyUtils.b(paramInt))
              {
                m = i;
                if (paramInt == 1008)
                {
                  m = ((LifeOnlineAccountInfoManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(86)).a(paramString, l);
                  if (QLog.isColorLevel()) {
                    QLog.d("Q.unread.Facade", 2, "updateLastReadSeq PreSendMsgCount=" + m);
                  }
                  m = i + m;
                }
              }
              if (QLog.isColorLevel())
              {
                localObject2 = new StringBuilder().append("updateLastReadSeq before=");
                if (localConversationInfo == null) {
                  break label1100;
                }
              }
              for (localObject1 = localConversationInfo.toString();; localObject1 = null)
              {
                QLog.d("Q.unread.Facade", 2, (String)localObject1 + " , end unread=" + m + ", lastread=" + l + ",unreadGift=" + j + ",unreadRedPacket=" + k);
                a().a(paramString, paramInt, l, m, j, k);
                if ((m == i1) || (!MsgProxyUtils.c(paramInt))) {
                  break;
                }
                d();
                return;
              }
              break label745;
              localObject3 = localObject2;
            }
          }
        }
      }
      label1122:
      l = paramLong;
      break label216;
      label1128:
      i1 = 0;
      l = paramLong;
    }
  }
  
  public boolean b(String paramString)
  {
    return jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().b(paramString);
  }
  
  public boolean b(String paramString, int paramInt)
  {
    boolean bool2 = false;
    boolean bool1;
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().b(paramString, paramInt) != null) {
      bool1 = true;
    }
    do
    {
      do
      {
        return bool1;
        bool1 = bool2;
      } while (7000 == paramInt);
      bool1 = bool2;
    } while (a(paramInt));
    return b(paramString);
  }
  
  public int c(String paramString, int paramInt)
  {
    return c(a().a(paramString, paramInt));
  }
  
  public void c()
  {
    SharedPreferences localSharedPreferences = a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 1001);
    SharedPreferences.Editor localEditor = localSharedPreferences.edit();
    ConversationFacade localConversationFacade = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
    Iterator localIterator = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1001).a(AppConstants.aq, 1001).iterator();
    int i = 0;
    int j = 0;
    Object localObject;
    if (localIterator.hasNext())
    {
      localObject = (MessageRecord)localIterator.next();
      if (localConversationFacade.e(senderuin, 1001) > 0) {
        break label289;
      }
      localObject = a(senderuin, 0, false);
      if (!localSharedPreferences.contains((String)localObject)) {
        break label289;
      }
      localEditor.remove((String)localObject);
      i += 1;
      j = 1;
    }
    label289:
    for (;;)
    {
      break;
      localIterator = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1001).a(AppConstants.aN, 1001).iterator();
      while (localIterator.hasNext())
      {
        localObject = (MessageRecord)localIterator.next();
        if (localConversationFacade.e(senderuin, 1001) <= 0)
        {
          localObject = a(senderuin, 0, false);
          if (localSharedPreferences.contains((String)localObject))
          {
            localEditor.remove((String)localObject);
            i += 1;
            j = 1;
          }
        }
      }
      if (j != 0) {
        localEditor.commit();
      }
      if (QLog.isColorLevel()) {
        QLog.i("Q.msg_box", 2, "clearMrSummary2, count=" + i);
      }
      return;
    }
  }
  
  public void c(String paramString, int paramInt)
  {
    Object localObject1 = a(paramInt).a(paramString, paramInt);
    if ((localObject1 == null) || (((List)localObject1).isEmpty())) {
      return;
    }
    String str = "";
    localObject1 = ((List)localObject1).iterator();
    int i = 0;
    int j = 0;
    int k = 0;
    label49:
    Object localObject2;
    if (((Iterator)localObject1).hasNext())
    {
      localObject2 = (MessageRecord)((Iterator)localObject1).next();
      k += a(senderuin, istroop);
      j += d(senderuin, istroop);
      i += e(senderuin, istroop);
      if ((i <= 0) || (!TextUtils.isEmpty(str))) {
        break label335;
      }
      str = senderuin;
    }
    label161:
    label325:
    label335:
    for (;;)
    {
      break label49;
      int m;
      if (e(paramString, paramInt) != i)
      {
        m = 1;
        if ((a(paramString, paramInt) != k) || (d(paramString, paramInt) != j) || (m != 0))
        {
          localObject1 = a().a(paramString, paramInt);
          localObject2 = a();
          if (localObject1 != null) {
            break label325;
          }
        }
      }
      for (long l = 0L;; l = lastread)
      {
        ((ConversationProxy)localObject2).a(paramString, paramInt, l, k, j, i);
        if ((MsgProxyUtils.v(paramInt)) && (m != 0)) {
          a(a().a(paramString, paramInt), str);
        }
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.d("Q.unread.Facade", 2, "calculateSayHelloBoxUnreadCount boxUin=" + paramString + ", unread=" + k + ", giftCount=" + j + ", redPacketCount=" + i);
        return;
        m = 0;
        break label161;
      }
    }
  }
  
  public void c(String paramString, int paramInt1, int paramInt2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.unread.Facade", 2, "increaseUnread uin=" + paramString + ",type" + paramInt1 + ",count" + paramInt2);
    }
    a().c(paramString, paramInt1, paramInt2);
    if (MsgProxyUtils.c(paramInt1)) {
      d();
    }
  }
  
  public boolean c(String paramString, int paramInt)
  {
    Object localObject = a(paramInt).a(paramString, paramInt);
    if ((localObject == null) || (((List)localObject).isEmpty())) {
      return false;
    }
    localObject = ((List)localObject).iterator();
    while (((Iterator)localObject).hasNext()) {
      if (!MsgProxyUtils.c((MessageRecord)((Iterator)localObject).next())) {
        return false;
      }
    }
    if (QLog.isColorLevel()) {
      QLog.d("Q.unread.Facade", 2, "isAllOneWayConversation boxUin=" + paramString + ", rtn true");
    }
    return true;
  }
  
  public int d(String paramString, int paramInt)
  {
    return a().c(paramString, paramInt);
  }
  
  public int e(String paramString, int paramInt)
  {
    return a().d(paramString, paramInt);
  }
  
  public void onDestroy()
  {
    deleteObservers();
  }
}
