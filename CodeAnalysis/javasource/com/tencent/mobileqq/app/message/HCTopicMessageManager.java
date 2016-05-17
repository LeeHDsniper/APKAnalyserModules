package com.tencent.mobileqq.app.message;

import com.tencent.mobileqq.app.HotChatManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.proxy.RecentUserProxy;
import com.tencent.mobileqq.data.ConversationInfo;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotchat.PttShowRoomMng;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.nearby.NearbyUtils;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.qphone.base.util.QLog;
import java.util.Map;

public class HCTopicMessageManager
  extends BaseMessageManagerForTroopAndDisc
{
  public HCTopicMessageManager(QQAppInterface paramQQAppInterface, QQMessageFacade paramQQMessageFacade)
  {
    super(paramQQAppInterface, paramQQMessageFacade);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public int a(int paramInt, ConversationInfo paramConversationInfo)
  {
    if (ConversationFacade.a(paramConversationInfo) > 0) {
      return 0;
    }
    return super.a(paramInt, paramConversationInfo);
  }
  
  protected String a(String paramString1, String paramString2)
  {
    if (a.a().equals(paramString1)) {}
    String str;
    for (paramString2 = "我";; paramString2 = ContactUtils.f(a, paramString2, paramString1))
    {
      if ((paramString2 != null) && (paramString2.length() != 0))
      {
        str = paramString2;
        if (!paramString2.equals(paramString1)) {}
      }
      else
      {
        str = a.a(true).a(true).a(paramString1);
      }
      if (str != null) {
        break;
      }
      return paramString1;
    }
    return str;
  }
  
  public void a(MessageRecord paramMessageRecord, EntityManager paramEntityManager, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, boolean paramBoolean4, BaseMessageManager.AddMessageContext paramAddMessageContext)
  {
    if (paramMessageRecord == null) {
      return;
    }
    Map localMap2 = jdField_a_of_type_JavaUtilMap;
    Map localMap1 = c;
    Object localObject1 = jdField_a_of_type_ComTencentMobileqqAppProxyRecentUserProxy;
    String str = frienduin;
    long l = time;
    if (time == 0L) {
      time = MessageCache.a();
    }
    if (msgseq == 0L) {
      msgseq = ((int)time);
    }
    Object localObject2 = ((RecentUserProxy)localObject1).a(str, 1);
    localObject1 = localObject2;
    if (localMap2.containsKey(MsgProxyUtils.a(uin, type))) {
      localObject1 = (RecentUser)localMap2.get(MsgProxyUtils.a(uin, type));
    }
    if (!MsgProxyUtils.g(msgtype))
    {
      localObject2 = MsgProxyUtils.a(str, 1);
      uin = str;
      type = 1;
      if (l > lastmsgtime) {
        lastmsgtime = l;
      }
      localMap2.put(localObject2, localObject1);
      localObject1 = (MessageRecord)localMap1.get(localObject2);
      if ((localObject1 != null) && (!paramMessageRecord.isSendFromLocal())) {
        break label267;
      }
      localMap1.put(localObject2, paramMessageRecord);
    }
    for (;;)
    {
      if (paramMessageRecord.isSendFromLocal())
      {
        extraflag = 32772;
        sendFailCode = 0;
      }
      super.a(paramMessageRecord, paramEntityManager, paramBoolean1, paramBoolean2, paramBoolean3, paramBoolean4, paramAddMessageContext);
      return;
      label267:
      if (a(paramMessageRecord) >= a((MessageRecord)localObject1)) {
        localMap1.put(localObject2, paramMessageRecord);
      }
    }
  }
  
  protected void b(QQMessageFacade.Message paramMessage)
  {
    nickName = a(senderuin, frienduin);
    Object localObject;
    if ((nickName == null) || (nickName.equals(senderuin))) {
      localObject = nickName;
    }
    try
    {
      String str = paramMessage.getExtInfoFromExtStr("hotchat_nick");
      localObject = str;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        localException.printStackTrace();
      }
    }
    if ((localObject != null) && (((String)localObject).length() > 0)) {
      nickName = ((String)localObject);
    }
    if (QLog.isDevelopLevel()) {
      NearbyUtils.a("PttShow", "processNickName", new Object[] { senderuin, nickName });
    }
  }
}
