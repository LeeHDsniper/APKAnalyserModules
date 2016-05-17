package com.tencent.mobileqq.app.message;

import android.content.res.Resources;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.proxy.ProxyManager;
import com.tencent.mobileqq.app.proxy.RecentUserProxy;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.TroopInfoManager;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.troop.data.MessageInfo;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.Map;

public class DiscMessageManager
  extends BaseMessageManagerForTroopAndDisc
{
  public DiscMessageManager(QQAppInterface paramQQAppInterface, QQMessageFacade paramQQMessageFacade)
  {
    super(paramQQAppInterface, paramQQMessageFacade);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public String a(String paramString1, String paramString2)
  {
    if (a.a().equals(paramString1)) {
      return a.a().getResources().getString(2131368952);
    }
    return ContactUtils.c(a, paramString2, paramString1);
  }
  
  public void a(MessageRecord paramMessageRecord, EntityManager paramEntityManager, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, boolean paramBoolean4, BaseMessageManager.AddMessageContext paramAddMessageContext)
  {
    if (paramMessageRecord == null) {
      return;
    }
    Map localMap = jdField_a_of_type_JavaUtilMap;
    Object localObject = jdField_a_of_type_ComTencentMobileqqAppProxyRecentUserProxy;
    if (time == 0L) {
      time = MessageCache.a();
    }
    if (msgseq == 0L) {
      msgseq = ((int)time);
    }
    String str1 = frienduin;
    int i = istroop;
    long l = time;
    RecentUser localRecentUser = ((RecentUserProxy)localObject).a(str1, istroop);
    localObject = null;
    TroopInfoManager localTroopInfoManager = jdField_a_of_type_ComTencentMobileqqModelTroopInfoManager;
    String str2;
    MessageInfo localMessageInfo;
    if (localTroopInfoManager != null)
    {
      str2 = str1 + "&" + 3000;
      localMessageInfo = localTroopInfoManager.a(str2);
      if (localMessageInfo == null) {
        break label500;
      }
      if (localMessageInfo.a() == shmsgseq) {
        break label443;
      }
      localMessageInfo = null;
      localObject = localMessageInfo;
      if (QLog.isColorLevel())
      {
        QLog.d("Q.msg.BaseMessageManager_At_Me_DISC", 2, "addMessageRecord:not the same msg:" + str2);
        localObject = localMessageInfo;
      }
    }
    if ((localObject != null) && (((MessageInfo)localObject).a()))
    {
      int j = ((MessageInfo)localObject).a();
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.BaseMessageManager_At_Me_DISC", 2, "addMessageRecord, bizType" + j + "|ru.msgType:" + msgType);
      }
      if (j >= msgType)
      {
        msgType = j;
        msg = MessageInfo.a(a, str1, (MessageInfo)localObject, msg, paramMessageRecord, false);
        localMap.put(MsgProxyUtils.a(str1, i), localRecentUser);
      }
    }
    if (localMap.containsKey(MsgProxyUtils.a(uin, type))) {}
    for (localObject = (RecentUser)localMap.get(MsgProxyUtils.a(uin, type));; localObject = localRecentUser)
    {
      if (!MsgProxyUtils.g(msgtype))
      {
        uin = str1;
        type = i;
        if (l > lastmsgtime)
        {
          lastmsgtime = l;
          localMap.put(MsgProxyUtils.a(str1, i), localObject);
        }
      }
      super.a(paramMessageRecord, paramEntityManager, paramBoolean1, paramBoolean2, paramBoolean3, paramBoolean4, paramAddMessageContext);
      return;
      label443:
      localObject = localMessageInfo;
      if (!isread) {
        break;
      }
      localTroopInfoManager.b(str2);
      if (QLog.isColorLevel()) {
        QLog.d("Q.msg.BaseMessageManager_At_Me_DISC", 2, "addMessageRecord:readed msg been removed:" + str2);
      }
      localObject = null;
      break;
      label500:
      localObject = localMessageInfo;
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.d("Q.msg.BaseMessageManager_At_Me_DISC", 2, "addMessageRecord:msgInfo == null " + str2);
      localObject = localMessageInfo;
      break;
    }
  }
  
  public void a(String paramString, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.BaseMessageManager_At_Me_DISC", 2, "afterCleanUnRead:" + paramString + "-" + paramInt);
    }
    super.a(paramString, paramInt);
    ProxyManager localProxyManager = a.a();
    paramString = localProxyManager.a().a(paramString, paramInt);
    if (paramString.shouldShowInRecentList())
    {
      paramString.cleanMsgAndMsgData(msgType);
      localProxyManager.a().a(paramString);
    }
  }
  
  protected void b(String paramString, int paramInt, long paramLong)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.BaseMessageManager_At_Me_DISC", 2, "afterCleanUnRead:" + paramString + "-" + paramInt + "-" + paramLong);
    }
    super.b(paramString, paramInt, paramLong);
    d(paramString, paramInt, paramLong);
  }
  
  public void c(String paramString, int paramInt, long paramLong)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.BaseMessageManager_At_Me_DISC", 2, "afterCleanUnRead:" + paramString + "-" + paramInt + "-" + paramLong);
    }
    if (a.a().a(paramString, paramInt) > 0) {
      d(paramString, paramInt, paramLong);
    }
    super.c(paramString, paramInt, paramLong);
  }
}
