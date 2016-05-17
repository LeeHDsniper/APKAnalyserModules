package com.tencent.mobileqq.activity.recent.data;

import android.content.Context;
import android.text.TextUtils;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.recent.TimeManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.ConversationFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade.Message;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class RecentItemActivateFriendsData
  extends RecentUserBaseData
{
  private static final String i = "ActivateFriends.Recent";
  
  public RecentItemActivateFriendsData(RecentUser paramRecentUser)
  {
    super(paramRecentUser);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(QQAppInterface paramQQAppInterface, Context paramContext)
  {
    if ((paramQQAppInterface == null) || (paramContext == null)) {}
    label111:
    do
    {
      return;
      super.a(paramQQAppInterface, paramContext);
      QQMessageFacade.Message localMessage = null;
      QQMessageFacade localQQMessageFacade = paramQQAppInterface.a();
      if (localQQMessageFacade != null) {
        localMessage = localQQMessageFacade.a(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type);
      }
      if (localMessage == null) {
        break label242;
      }
      jdField_b_of_type_Long = time;
      paramQQAppInterface = paramQQAppInterface.a();
      if (paramQQAppInterface == null) {
        break;
      }
      H = paramQQAppInterface.a(frienduin, istroop);
      jdField_b_of_type_JavaLangString = TimeManager.a().a(a(), jdField_b_of_type_Long);
      jdField_b_of_type_JavaLangCharSequence = localMessage.getMessageText();
      d();
      if (TextUtils.isEmpty(jdField_a_of_type_JavaLangString)) {
        jdField_a_of_type_JavaLangString = paramContext.getString(2131371024);
      }
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
      H = 0;
      break;
      label242:
      H = 0;
      jdField_b_of_type_Long = 0L;
      if (QLog.isColorLevel()) {
        QLog.e("ActivateFriends.Recent", 2, "RecentActivateFriends update, last msg is null");
      }
      jdField_b_of_type_JavaLangString = "";
      jdField_b_of_type_JavaLangCharSequence = "";
      break label111;
      if (H == 1) {
        paramQQAppInterface.append("有一条未读");
      } else if (H == 2) {
        paramQQAppInterface.append("有两条未读");
      } else if (H > 0) {
        paramQQAppInterface.append("有").append(H).append("条未读,");
      }
    }
  }
}
