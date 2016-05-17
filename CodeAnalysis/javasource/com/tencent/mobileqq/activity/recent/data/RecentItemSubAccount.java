package com.tencent.mobileqq.activity.recent.data;

import android.content.Context;
import android.text.TextUtils;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.recent.MsgSummary;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.FriendListHandler;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.app.message.ConversationFacade;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.subaccount.SubAccountControll;
import com.tencent.mobileqq.subaccount.datamanager.SubAccountManager;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.qphone.base.util.QLog;

public class RecentItemSubAccount
  extends RecentUserBaseData
{
  public RecentItemSubAccount(RecentUser paramRecentUser)
  {
    super(paramRecentUser);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    G = 1;
  }
  
  public void a(QQAppInterface paramQQAppInterface, Context paramContext)
  {
    if ((paramQQAppInterface == null) || (paramContext == null)) {
      return;
    }
    super.a(paramQQAppInterface, paramContext);
    MsgSummary localMsgSummary = a();
    jdField_a_of_type_JavaLangString = paramContext.getString(2131370129);
    Object localObject1 = SubAccountControll.a(paramQQAppInterface, jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin);
    if (localObject1 != null)
    {
      jdField_b_of_type_JavaLangCharSequence = ((CharSequence)localObject1);
      g = 1;
    }
    localObject1 = paramQQAppInterface.a();
    if (localObject1 != null) {}
    for (H = ((ConversationFacade)localObject1).a(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin, jdField_a_of_type_ComTencentMobileqqDataRecentUser.type);; H = 7000)
    {
      if (QLog.isColorLevel()) {
        QLog.d("SUB_ACCOUNT", 2, "RecentItemSubAccount.update mUser.uin=" + jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin + " mUser.type=" + jdField_a_of_type_ComTencentMobileqqDataRecentUser.type + " mUnreadNum=" + H);
      }
      if (!AppConstants.ag.equals(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin)) {
        break label317;
      }
      jdField_b_of_type_JavaLangString = "";
      jdField_b_of_type_Long = a();
      a(paramQQAppInterface);
      a(paramQQAppInterface, paramContext, localMsgSummary);
      if (!AppSetting.i) {
        break;
      }
      paramQQAppInterface = new StringBuilder();
      paramQQAppInterface.append(jdField_a_of_type_JavaLangString).append(",");
      if (H != 0) {
        break label611;
      }
      label238:
      if (jdField_c_of_type_JavaLangCharSequence != null) {
        paramQQAppInterface.append(jdField_c_of_type_JavaLangCharSequence + ",");
      }
      paramQQAppInterface.append(jdField_b_of_type_JavaLangCharSequence).append(",").append(jdField_b_of_type_JavaLangString);
      jdField_c_of_type_JavaLangString = paramQQAppInterface.toString();
      return;
      H = 0;
    }
    label317:
    long l1 = ((SubAccountManager)paramQQAppInterface.getManager(60)).a(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin);
    long l2 = a();
    if (jdField_a_of_type_ComTencentMobileqqDataRecentUser.showUpTime > 0L)
    {
      label355:
      jdField_b_of_type_JavaLangString = "";
      jdField_b_of_type_Long = l1;
      localObject1 = (FriendsManager)paramQQAppInterface.getManager(50);
      if (localObject1 == null) {
        break label676;
      }
    }
    label611:
    label676:
    for (localObject1 = ((FriendsManager)localObject1).c(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin);; localObject1 = null)
    {
      if ((localObject1 != null) && (name != null)) {}
      for (Object localObject2 = name;; localObject2 = jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin)
      {
        if (!TextUtils.isEmpty((CharSequence)localObject2))
        {
          localObject1 = localObject2;
          if (!((String)localObject2).equals(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin)) {}
        }
        else
        {
          String str = ContactUtils.c(paramQQAppInterface, jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin, true);
          localObject1 = localObject2;
          if (!TextUtils.isEmpty(str)) {
            localObject1 = str;
          }
        }
        localObject2 = localObject1;
        if (TextUtils.isEmpty((CharSequence)localObject1)) {
          localObject2 = jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin;
        }
        jdField_a_of_type_JavaLangString = (jdField_a_of_type_JavaLangString + " ( " + (String)localObject2 + " ) ");
        if ((!d) || (a == null) || (!a.b())) {
          break;
        }
        localObject1 = (FriendListHandler)paramQQAppInterface.a(1);
        if (localObject1 != null) {
          ((FriendListHandler)localObject1).b(jdField_a_of_type_ComTencentMobileqqDataRecentUser.uin);
        }
        d = false;
        break;
        l1 = Math.max(l2, l1);
        break label355;
      }
      if (H == 1)
      {
        paramQQAppInterface.append("有一条未读");
        break label238;
      }
      if (H == 2)
      {
        paramQQAppInterface.append("有两条未读");
        break label238;
      }
      if (H <= 0) {
        break label238;
      }
      paramQQAppInterface.append("有").append(H).append("条未读,");
      break label238;
    }
  }
}
