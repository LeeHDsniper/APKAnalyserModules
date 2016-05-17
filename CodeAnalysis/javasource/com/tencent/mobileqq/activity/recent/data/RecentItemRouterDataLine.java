package com.tencent.mobileqq.activity.recent.data;

import android.content.Context;
import android.text.SpannableStringBuilder;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.recent.MsgSummary;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.RouterHandler;
import com.tencent.mobileqq.app.message.MsgProxyUtils;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade.Message;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.text.QQText;
import com.tencent.qphone.base.util.QLog;
import java.util.Map;

public class RecentItemRouterDataLine
  extends RecentUserBaseData
{
  public RecentItemRouterDataLine(RecentUser paramRecentUser)
  {
    super(paramRecentUser);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private QQMessageFacade.Message a(QQAppInterface paramQQAppInterface)
  {
    paramQQAppInterface = paramQQAppInterface.a();
    if (paramQQAppInterface != null)
    {
      QQMessageFacade.Message localMessage = paramQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type);
      if (localMessage != null)
      {
        paramQQAppInterface = localMessage;
        if (msgtype != 0) {}
      }
      else
      {
        return null;
      }
    }
    else
    {
      paramQQAppInterface = null;
    }
    return paramQQAppInterface;
  }
  
  private CharSequence a(String paramString, boolean paramBoolean1, boolean paramBoolean2, CharSequence paramCharSequence, MsgSummary paramMsgSummary)
  {
    if (paramCharSequence == null)
    {
      paramCharSequence = new SpannableStringBuilder();
      if (paramBoolean1)
      {
        paramCharSequence.append("F ");
        paramCharSequence.append(paramString);
        paramCharSequence = new SpannableStringBuilder(paramCharSequence.toString());
      }
    }
    for (g = 0;; g = 1)
    {
      if (!paramBoolean1) {
        break label90;
      }
      f = 2;
      return paramCharSequence;
      if (!paramBoolean2) {
        break;
      }
      paramCharSequence.append("S ");
      break;
    }
    label90:
    if (paramBoolean2)
    {
      f = 1;
      return paramCharSequence;
    }
    f = 0;
    return paramCharSequence;
  }
  
  public void a(QQAppInterface paramQQAppInterface, Context paramContext)
  {
    if ((paramQQAppInterface == null) || (paramContext == null)) {
      return;
    }
    super.a(paramQQAppInterface, paramContext);
    H = 0;
    jdField_b_of_type_Long = 0L;
    RouterHandler localRouterHandler = (RouterHandler)paramQQAppInterface.a(48);
    Object localObject2 = a(paramQQAppInterface);
    Object localObject1 = localObject2;
    QQMessageFacade localQQMessageFacade;
    String str;
    if (localObject2 == null)
    {
      localQQMessageFacade = paramQQAppInterface.a();
      str = MsgProxyUtils.a(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin, 6002);
      localObject2 = localRouterHandler.a(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin);
      if (localObject2 != null) {
        break label250;
      }
      localObject1 = new QQMessageFacade.Message();
      extInt = 0;
      time = MessageCache.a();
      msgtype = 0;
    }
    for (;;)
    {
      a.put(str, localObject1);
      jdField_a_of_type_JavaLangString = localRouterHandler.a(Long.parseLong(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin));
      jdField_b_of_type_Long = time;
      localObject2 = a();
      a((QQMessageFacade.Message)localObject1, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type, paramQQAppInterface, paramContext, (MsgSummary)localObject2);
      a(paramQQAppInterface);
      a(paramQQAppInterface, paramContext, (MsgSummary)localObject2);
      if (!AppSetting.i) {
        break;
      }
      c = ("与我的路由的会话 [有" + H + "条未读] " + " " + b + jdField_b_of_type_JavaLangString);
      return;
      label250:
      if (localQQMessageFacade == null) {
        break;
      }
      localObject1 = localObject2;
      if (a.containsKey(str))
      {
        a.remove(str);
        localObject1 = localObject2;
      }
    }
  }
  
  protected void a(QQMessageFacade.Message paramMessage, int paramInt, QQAppInterface paramQQAppInterface, Context paramContext, MsgSummary paramMsgSummary)
  {
    boolean bool2 = false;
    if (paramMessage != null)
    {
      paramInt = extInt;
      if (paramInt != 4) {
        break label442;
      }
    }
    label439:
    label442:
    for (boolean bool1 = true;; bool1 = false)
    {
      if (paramInt == 1) {
        bool2 = true;
      }
      if (msgtype == 64536)
      {
        paramQQAppInterface = paramMessage.getMessageText();
        if (paramQQAppInterface != null) {
          if (bool1) {
            paramQQAppInterface = "F " + paramQQAppInterface;
          }
        }
      }
      for (;;)
      {
        b = a(null, bool1, bool2, new QQText(paramQQAppInterface, 1, 16), paramMsgSummary);
        for (;;)
        {
          if (paramMessage != null) {
            QLog.d("RecentItemRouterDataLine", 2, "msg info: " + extInt + ":" + msgtype + "msgSummary.strContent:" + b);
          }
          return;
          if (!bool2) {
            break label439;
          }
          paramQQAppInterface = "S " + paramQQAppInterface;
          break;
          paramQQAppInterface = new StringBuffer();
          if (bool1) {
            paramQQAppInterface.append("F ");
          }
          for (;;)
          {
            paramQQAppInterface.append("");
            try
            {
              b = a(null, bool1, bool2, new QQText(paramQQAppInterface, 1, 16), paramMsgSummary);
            }
            catch (Exception paramQQAppInterface)
            {
              paramQQAppInterface.printStackTrace();
            }
            break;
            if (bool2) {
              paramQQAppInterface.append("S ");
            }
          }
          if (msgtype == 63536)
          {
            b = a(paramContext.getString(2131368148), bool1, bool2, null, paramMsgSummary);
          }
          else if (msgtype == 63531)
          {
            b = a(paramContext.getString(2131368985), bool1, bool2, null, paramMsgSummary);
          }
          else if (msgtype == 63527)
          {
            b = a(paramContext.getString(2131369829), bool1, bool2, null, paramMsgSummary);
          }
          else if (msgtype == 63201)
          {
            b = a(paramContext.getString(2131368985), bool1, bool2, null, paramMsgSummary);
          }
          else if (msgtype == 63521)
          {
            b = "";
            continue;
            b = "";
          }
        }
      }
    }
  }
}
