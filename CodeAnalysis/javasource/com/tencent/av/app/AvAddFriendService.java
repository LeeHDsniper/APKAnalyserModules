package com.tencent.av.app;

import android.content.Intent;
import android.text.TextUtils;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.FriendListHandler;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.MessageObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.SystemMessageProcessor;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBEnumField;
import com.tencent.mobileqq.pb.PBRepeatMessageField;
import com.tencent.mobileqq.pb.PBStringField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.systemmsg.FriendSystemMsgController;
import com.tencent.mobileqq.systemmsg.MessageForSystemMsg;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import fdr;
import fds;
import fdt;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import tencent.mobileim.structmsg.structmsg.StructMsg;
import tencent.mobileim.structmsg.structmsg.SystemMsg;
import tencent.mobileim.structmsg.structmsg.SystemMsgAction;
import tencent.mobileim.structmsg.structmsg.SystemMsgActionInfo;

public class AvAddFriendService
{
  public static final int a = 0;
  public static String a;
  public static final int b = 1;
  public static final int c = 2;
  public static final int d = 3;
  public static final int e = 4;
  FriendListObserver jdField_a_of_type_ComTencentMobileqqAppFriendListObserver = new fdr(this);
  MessageObserver jdField_a_of_type_ComTencentMobileqqAppMessageObserver = new fds(this);
  public QQAppInterface a;
  public HashMap a;
  public boolean a;
  public int f = 0;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = "AvAddFriendService";
  }
  
  public AvAddFriendService(QQAppInterface paramQQAppInterface)
  {
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = null;
    jdField_a_of_type_JavaUtilHashMap = new HashMap();
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "AvAddFriendLogic");
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqAppMessageObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
  }
  
  private void a(String paramString, int paramInt)
  {
    if (!jdField_a_of_type_JavaUtilHashMap.containsKey(paramString))
    {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "setRelationStatus no uin in map:" + paramString);
      }
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "setRelationStatus :" + paramString + ",status" + paramInt);
    }
    jdField_a_of_type_JavaUtilHashMap.get(paramString)).b = paramInt;
  }
  
  private void a(String paramString, int paramInt1, int paramInt2)
  {
    if (!jdField_a_of_type_JavaUtilHashMap.containsKey(paramString))
    {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "setRelationStatus no uin in map:" + paramString);
      }
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "setRelationStatus :" + paramString + ",status" + paramInt1 + ",safeStatus:" + paramInt2);
    }
    jdField_a_of_type_JavaUtilHashMap.get(paramString)).b = paramInt1;
    jdField_a_of_type_JavaUtilHashMap.get(paramString)).b = paramInt2;
  }
  
  private void a(structmsg.StructMsg paramStructMsg, long paramLong)
  {
    if (paramStructMsg != null)
    {
      long l = getmsg_seq.get() + getmsg_type.get();
      FriendSystemMsgController.a().a(Long.valueOf(l), (structmsg.StructMsg)paramStructMsg.get());
      FriendSystemMsgController.a().b(l);
      FriendSystemMsgController.a().a(paramLong);
    }
  }
  
  private boolean a(int paramInt, String paramString)
  {
    switch (paramInt)
    {
    default: 
      return false;
    }
    if (paramString.equals(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a())) {
      return false;
    }
    for (;;)
    {
      try
      {
        Long.parseLong(paramString);
        FriendsManager localFriendsManager = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
        if (localFriendsManager != null)
        {
          paramString = localFriendsManager.c(paramString);
          if ((paramString == null) || (groupid < 0)) {
            break;
          }
          return false;
        }
      }
      catch (Throwable paramString)
      {
        return false;
      }
      paramString = null;
    }
    return true;
  }
  
  private void d(String paramString)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1) != null) {
      ((FriendListHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1)).a(paramString, f, 0, "");
    }
  }
  
  public int a(String paramString)
  {
    if (!jdField_a_of_type_JavaUtilHashMap.containsKey(paramString))
    {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "getRelationStatus no uin in map:" + paramString);
      }
      return 0;
    }
    return jdField_a_of_type_JavaUtilHashMap.get(paramString)).b;
  }
  
  public void a()
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "AvAddFriendLogic onDestory");
    }
    jdField_a_of_type_JavaUtilHashMap.clear();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqAppMessageObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = null;
  }
  
  public void a(String paramString)
  {
    Intent localIntent = new Intent();
    localIntent.setAction("tencent.video.q2v.AddfrindMsg");
    localIntent.putExtra("peerUin", paramString);
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null) {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().sendBroadcast(localIntent);
    }
  }
  
  public boolean a(String paramString, int paramInt)
  {
    if (TextUtils.isEmpty(paramString))
    {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "addFriend uin is null");
      }
      return false;
    }
    f = paramInt;
    if (((FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50)).b(paramString))
    {
      localFdt = new fdt(this);
      jdField_a_of_type_JavaUtilHashMap.put(paramString, localFdt);
      a(paramString, 4);
      a(paramString);
      return true;
    }
    if (!a(1, paramString)) {
      return false;
    }
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "addFriend uin" + paramString);
    }
    fdt localFdt = new fdt(this);
    jdField_a_of_type_JavaUtilHashMap.put(paramString, localFdt);
    ((FriendListHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(1)).a("OidbSvc.0x476_147", Long.parseLong(paramString), 147);
    return true;
  }
  
  public void b(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {
      jdField_a_of_type_JavaUtilHashMap.clear();
    }
    while (!jdField_a_of_type_JavaUtilHashMap.containsKey(paramString)) {
      return;
    }
    jdField_a_of_type_JavaUtilHashMap.remove(paramString);
  }
  
  public void c(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "acceptAddFriend uin is null");
      }
    }
    label514:
    do
    {
      List localList;
      structmsg.StructMsg localStructMsg;
      do
      {
        do
        {
          return;
          new ArrayList();
          localList = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().b(AppConstants.au, 0);
          localStructMsg = null;
          if (localList != null) {
            break;
          }
        } while (!QLog.isColorLevel());
        QLog.d(jdField_a_of_type_JavaLangString, 2, "systemMsgList is null");
        return;
        if ((localList.size() <= 0) || ((localList.get(0) instanceof MessageForSystemMsg))) {
          break;
        }
      } while (!QLog.isColorLevel());
      QLog.d(jdField_a_of_type_JavaLangString, 2, "systemMsgList error");
      return;
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "answerAddFriend systemMsgList size" + localList.size());
      }
      int i = localList.size() - 1;
      for (;;)
      {
        if (i >= 0)
        {
          localStructMsg = ((MessageForSystemMsg)localList.get(i)).getSystemMsg();
          if (QLog.isColorLevel()) {
            QLog.d(jdField_a_of_type_JavaLangString, 2, "answerAddFriend structMsg.req_uin =" + String.valueOf(req_uin.get()) + "friendUin=" + paramString);
          }
          if (!paramString.equals(String.valueOf(req_uin.get()))) {}
        }
        else
        {
          if ((localStructMsg == null) || (!paramString.equals(String.valueOf(req_uin.get())))) {
            break label514;
          }
          i = msg_type.get();
          long l1 = msg_seq.get();
          long l2 = req_uin.get();
          int j = msg.sub_type.get();
          int k = msg.src_id.get();
          int m = msg.sub_src_id.get();
          int n = msg.group_msg_type.get();
          paramString = msg.actions.get();
          if ((paramString == null) || (paramString.size() >= 0)) {
            break;
          }
          paramString = (structmsg.SystemMsgActionInfo)get0action_info.get();
          remark.set("");
          group_id.set(0);
          jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a().a(i, l1, l2, j, k, m, n, paramString, 0, localStructMsg, false);
          a(localStructMsg, msg_seq.get());
          if (!QLog.isColorLevel()) {
            break;
          }
          QLog.d(jdField_a_of_type_JavaLangString, 2, "answerAddFriend  structMsg.req_uin:  " + String.valueOf(req_uin.get()));
          return;
        }
        i -= 1;
      }
    } while (!QLog.isColorLevel());
    QLog.d(jdField_a_of_type_JavaLangString, 2, "answerAddFriend  structMsg == null | , friendUin == structMsg.req_uin | ");
  }
  
  protected void finalize()
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "finalize");
    }
    super.finalize();
  }
}
