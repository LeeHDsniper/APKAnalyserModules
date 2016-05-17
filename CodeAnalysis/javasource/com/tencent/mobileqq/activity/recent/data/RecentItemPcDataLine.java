package com.tencent.mobileqq.activity.recent.data;

import android.content.Context;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.recent.MsgSummary;
import com.tencent.mobileqq.app.DataLineHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.ConversationFacade;
import com.tencent.mobileqq.app.message.DatalineMessageManager;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade.Message;
import com.tencent.mobileqq.data.DataLineMsgSet;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.filemanager.util.FileManagerUtil;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.text.QQText;

public class RecentItemPcDataLine
  extends RecentUserBaseData
{
  int R;
  CharSequence d;
  String i;
  
  public RecentItemPcDataLine(RecentUser paramRecentUser)
  {
    super(paramRecentUser);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected CharSequence a(String paramString, boolean paramBoolean1, boolean paramBoolean2, CharSequence paramCharSequence, MsgSummary paramMsgSummary)
  {
    if (paramCharSequence == null)
    {
      paramCharSequence = new SpannableStringBuilder();
      if (paramBoolean1)
      {
        paramCharSequence.append("F ");
        paramCharSequence.append(paramString);
      }
    }
    for (g = 0;; g = 1)
    {
      if (!paramBoolean1) {
        break label76;
      }
      f = 2;
      return paramCharSequence;
      if (!paramBoolean2) {
        break;
      }
      paramCharSequence.append("S ");
      break;
    }
    label76:
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
    if ((paramQQAppInterface == null) || (paramContext == null)) {}
    label126:
    do
    {
      return;
      super.a(paramQQAppInterface, paramContext);
      if (jdField_a_of_type_ComTencentMobileqqDataRecentUser.type != 6000) {
        break;
      }
      i = paramContext.getString(2131362096);
      d = paramContext.getString(2131362183);
      R = 0;
      QQMessageFacade.Message localMessage = null;
      Object localObject = paramQQAppInterface.a();
      if (localObject != null) {
        localMessage = ((QQMessageFacade)localObject).a(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type);
      }
      if (localMessage == null) {
        break label334;
      }
      jdField_b_of_type_Long = time;
      localObject = paramQQAppInterface.a();
      if (localObject == null) {
        break label326;
      }
      H = ((ConversationFacade)localObject).a(frienduin, istroop);
      if (TextUtils.isEmpty(jdField_a_of_type_JavaLangString)) {
        jdField_a_of_type_JavaLangString = i;
      }
      localObject = a();
      a(localMessage, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type, paramQQAppInterface, paramContext, (MsgSummary)localObject);
      a(paramQQAppInterface);
      a(paramQQAppInterface, (MsgSummary)localObject);
      a(paramQQAppInterface, paramContext, (MsgSummary)localObject);
    } while (!AppSetting.i);
    paramQQAppInterface = new StringBuilder();
    paramQQAppInterface.append(jdField_a_of_type_JavaLangString).append(",");
    if (H == 0) {}
    for (;;)
    {
      if (jdField_c_of_type_JavaLangCharSequence != null) {
        paramQQAppInterface.append(jdField_c_of_type_JavaLangCharSequence + ",");
      }
      paramQQAppInterface.append(jdField_b_of_type_JavaLangCharSequence).append(",").append(jdField_b_of_type_JavaLangString);
      jdField_c_of_type_JavaLangString = paramQQAppInterface.toString();
      return;
      if (jdField_a_of_type_ComTencentMobileqqDataRecentUser.type != 6003) {
        break;
      }
      i = paramContext.getString(2131362097);
      d = paramContext.getString(2131362184);
      R = 1;
      break;
      label326:
      H = 0;
      break label126;
      label334:
      H = 0;
      jdField_b_of_type_Long = 0L;
      break label126;
      if (H == 1) {
        paramQQAppInterface.append("有一条未读");
      } else if (H == 2) {
        paramQQAppInterface.append("有两条未读");
      } else if (H > 0) {
        paramQQAppInterface.append("有").append(H).append("条未读,");
      }
    }
  }
  
  protected void a(QQMessageFacade.Message paramMessage, int paramInt, QQAppInterface paramQQAppInterface, Context paramContext, MsgSummary paramMsgSummary)
  {
    boolean bool3 = false;
    paramContext = (DataLineHandler)paramQQAppInterface.a(8);
    if ((paramContext != null) && (paramContext.a(R)))
    {
      jdField_b_of_type_Long = paramContext.a(R);
      jdField_b_of_type_JavaLangCharSequence = d;
      return;
    }
    if ((paramMessage != null) && (msg != null))
    {
      paramContext = paramQQAppInterface.a().a(R).a(msgId);
      boolean bool1;
      label93:
      boolean bool2;
      if (paramContext == null)
      {
        bool1 = false;
        if (paramContext != null) {
          break label214;
        }
        bool2 = bool3;
      }
      for (;;)
      {
        switch (msgtype)
        {
        default: 
          return;
        case -2335: 
        case -2009: 
        case -2005: 
        case -2000: 
          if (paramContext != null) {
            break label436;
          }
          jdField_b_of_type_JavaLangCharSequence = "";
          return;
          if ((paramContext.hasFailed()) && (!paramContext.hasSendingOrRecving()) && (!paramContext.hasWaiting()))
          {
            bool1 = true;
            break label93;
          }
          bool1 = false;
          break label93;
          label214:
          bool2 = bool3;
          if (paramContext.isSendFromLocal())
          {
            bool2 = bool3;
            if (paramContext.hasSendingOrRecving()) {
              bool2 = true;
            }
          }
          break;
        }
      }
      paramQQAppInterface = paramMessage.getMessageText();
      if (paramQQAppInterface != null)
      {
        if (bool1) {
          paramMessage = "F " + paramQQAppInterface;
        }
        for (;;)
        {
          jdField_b_of_type_JavaLangCharSequence = a(null, bool1, bool2, new QQText(paramMessage, 1, 16), paramMsgSummary);
          return;
          paramMessage = paramQQAppInterface;
          if (bool2) {
            paramMessage = "S " + paramQQAppInterface;
          }
        }
      }
      paramContext = new StringBuffer();
      if (bool1)
      {
        paramContext.append("F ");
        if (paramQQAppInterface == null) {
          break label430;
        }
      }
      label430:
      for (paramMessage = paramQQAppInterface.toString().trim();; paramMessage = "")
      {
        paramContext.append(paramMessage);
        try
        {
          jdField_b_of_type_JavaLangCharSequence = a(null, bool1, bool2, new QQText(paramContext, 1, 16), paramMsgSummary);
          return;
        }
        catch (Exception paramMessage)
        {
          paramMessage.printStackTrace();
          return;
        }
        if (!bool2) {
          break;
        }
        paramContext.append("S ");
        break;
      }
      label436:
      jdField_b_of_type_JavaLangCharSequence = a(FileManagerUtil.a(paramQQAppInterface, paramContext.getFirstItem()), bool1, bool2, null, paramMsgSummary);
      return;
      jdField_b_of_type_JavaLangCharSequence = "";
      return;
    }
    jdField_b_of_type_JavaLangCharSequence = "";
  }
}
