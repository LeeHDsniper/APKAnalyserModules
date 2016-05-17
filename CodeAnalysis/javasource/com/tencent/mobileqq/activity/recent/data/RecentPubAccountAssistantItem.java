package com.tencent.mobileqq.activity.recent.data;

import android.content.Context;
import android.text.TextUtils;
import com.tencent.biz.pubaccount.assistant.PubAccountAssistantManager;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.aio.XMLMessageUtils;
import com.tencent.mobileqq.activity.recent.MsgSummary;
import com.tencent.mobileqq.activity.recent.RecentBaseData;
import com.tencent.mobileqq.app.PublicAccountDataManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.ConversationFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade.Message;
import com.tencent.mobileqq.data.PAMessage;
import com.tencent.mobileqq.data.PAMessage.Item;
import com.tencent.mobileqq.data.PubAccountAssistantData;
import com.tencent.mobileqq.data.PublicAccountInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.ArrayList;
import java.util.List;

public class RecentPubAccountAssistantItem
  extends RecentBaseData
{
  private PubAccountAssistantData a;
  
  public RecentPubAccountAssistantItem(PubAccountAssistantData paramPubAccountAssistantData)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    if (paramPubAccountAssistantData == null) {
      throw new NullPointerException("PubAccountAssistantData is null");
    }
    jdField_a_of_type_ComTencentMobileqqDataPubAccountAssistantData = paramPubAccountAssistantData;
    G = 3;
  }
  
  public int a()
  {
    return PubAccountAssistantManager.a().a(a());
  }
  
  public long a()
  {
    return jdField_a_of_type_ComTencentMobileqqDataPubAccountAssistantData.mLastMsgTime;
  }
  
  public String a()
  {
    return jdField_a_of_type_ComTencentMobileqqDataPubAccountAssistantData.mUin;
  }
  
  public void a(QQAppInterface paramQQAppInterface, Context paramContext)
  {
    String str = null;
    if ((paramQQAppInterface == null) || (paramContext == null)) {
      return;
    }
    Object localObject3 = a();
    int i = a();
    Object localObject1 = paramQQAppInterface.a();
    if (localObject1 != null) {}
    for (QQMessageFacade.Message localMessage = ((QQMessageFacade)localObject1).a((String)localObject3, i);; localMessage = null)
    {
      Object localObject2;
      if (localMessage != null)
      {
        jdField_b_of_type_Long = time;
        localObject1 = paramQQAppInterface.a();
        if (localObject1 != null)
        {
          H = ((ConversationFacade)localObject1).a(frienduin, istroop);
          localObject1 = (PublicAccountDataManager)paramQQAppInterface.getManager(55);
          if (localObject1 == null) {
            break label606;
          }
          localObject2 = ((PublicAccountDataManager)localObject1).b((String)localObject3);
          if (localObject2 == null) {
            break label606;
          }
          localObject1 = name;
          str = summary;
        }
      }
      for (;;)
      {
        localObject2 = localObject1;
        if (localObject1 == null) {
          localObject2 = localObject3;
        }
        jdField_a_of_type_JavaLangString = ((String)localObject2);
        localObject2 = a();
        if (localMessage != null)
        {
          int j = msgtype;
          if ((j != 62530) && (j != 60532)) {
            a(localMessage, i, paramQQAppInterface, paramContext, (MsgSummary)localObject2);
          }
        }
        else
        {
          label196:
          if ((TextUtils.isEmpty(jdField_b_of_type_JavaLangCharSequence)) && (TextUtils.isEmpty(jdField_c_of_type_JavaLangCharSequence)))
          {
            if (str != null) {
              break label538;
            }
            str = "";
            label227:
            jdField_b_of_type_JavaLangCharSequence = str;
          }
          a(paramQQAppInterface);
          a(paramQQAppInterface, (MsgSummary)localObject2);
          a(paramQQAppInterface, paramContext, (MsgSummary)localObject2);
          if (!AppSetting.i) {
            break;
          }
          paramQQAppInterface = new StringBuilder(24);
          paramQQAppInterface.append(jdField_a_of_type_JavaLangString);
          if (H != 0) {
            break label541;
          }
        }
        for (;;)
        {
          if (jdField_c_of_type_JavaLangCharSequence != null) {
            paramQQAppInterface.append(jdField_c_of_type_JavaLangCharSequence + ",");
          }
          paramQQAppInterface.append(jdField_b_of_type_JavaLangCharSequence).append(' ').append(jdField_b_of_type_JavaLangString);
          jdField_c_of_type_JavaLangString = paramQQAppInterface.toString();
          return;
          H = 0;
          break;
          jdField_b_of_type_Long = 0L;
          H = 0;
          break;
          jdField_b_of_type_JavaLangCharSequence = "";
          localObject3 = XMLMessageUtils.a(localMessage);
          if ((localObject3 == null) || (items == null) || (items.size() == 0))
          {
            a(localMessage, i, paramQQAppInterface, paramContext, (MsgSummary)localObject2);
            break label196;
          }
          localObject1 = items.get(0)).title;
          if ((items.get(0)).cover == null) && (items.get(0)).digestList != null)) {
            localObject1 = (String)localObject1 + "：" + (String)items.get(0)).digestList.get(0);
          }
          for (;;)
          {
            jdField_b_of_type_JavaLangCharSequence = ((CharSequence)localObject1);
            break;
          }
          label538:
          break label227;
          label541:
          if (H == 1) {
            paramQQAppInterface.append("有一条未读");
          } else if (H == 2) {
            paramQQAppInterface.append("有两条未读");
          } else if (H > 0) {
            paramQQAppInterface.append("有").append(H).append("条未读");
          }
        }
        label606:
        localObject1 = null;
      }
    }
  }
  
  public boolean a()
  {
    return false;
  }
  
  public long b()
  {
    return jdField_a_of_type_ComTencentMobileqqDataPubAccountAssistantData.mLastDraftTime;
  }
  
  public void b(QQAppInterface paramQQAppInterface)
  {
    if (paramQQAppInterface == null) {}
    QQMessageFacade.Message localMessage;
    do
    {
      do
      {
        return;
        localMessage = null;
        String str = a();
        int i = a();
        QQMessageFacade localQQMessageFacade = paramQQAppInterface.a();
        if (localQQMessageFacade != null) {
          localMessage = localQQMessageFacade.a(str, i);
        }
      } while (localMessage == null);
      paramQQAppInterface = paramQQAppInterface.a();
    } while (paramQQAppInterface == null);
    paramQQAppInterface.a(frienduin, istroop, true);
  }
  
  public int c()
  {
    return jdField_a_of_type_ComTencentMobileqqDataPubAccountAssistantData.mDistance;
  }
}
