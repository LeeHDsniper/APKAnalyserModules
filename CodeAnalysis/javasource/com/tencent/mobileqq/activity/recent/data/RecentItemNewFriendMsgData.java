package com.tencent.mobileqq.activity.recent.data;

import android.content.Context;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.recent.TimeManager;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.NewFriendManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.proxy.ProxyManager;
import com.tencent.mobileqq.app.proxy.RecentUserProxy;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.newfriend.NewFriendMessage;
import com.tencent.qphone.base.util.QLog;

public class RecentItemNewFriendMsgData
  extends RecentUserBaseData
{
  private static final String i = "RecentItemNewFriendMsgData";
  int R;
  private boolean a;
  
  public RecentItemNewFriendMsgData(RecentUser paramRecentUser)
  {
    super(paramRecentUser);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    R = 0;
    jdField_a_of_type_Boolean = true;
    R = 2131367311;
  }
  
  private void b(QQAppInterface paramQQAppInterface)
  {
    paramQQAppInterface = paramQQAppInterface.a().a().a(AppConstants.am, 4000);
    if (QLog.isColorLevel()) {
      QLog.d("RecentItemNewFriendMsgData", 2, "resetRecentUser data.msg");
    }
    a(paramQQAppInterface);
  }
  
  private void e()
  {
    Object localObject = a();
    if (QLog.isColorLevel()) {
      QLog.d("RecentItemNewFriendMsgData", 2, "initMsgAndCount");
    }
    if (msg != null)
    {
      jdField_b_of_type_Long = lastmsgtime;
      if ((msg instanceof String))
      {
        localObject = ((String)msg).split(NewFriendManager.jdField_b_of_type_JavaLangString);
        if (localObject.length != 2) {
          break label100;
        }
        jdField_b_of_type_JavaLangCharSequence = localObject[0];
        H = Integer.parseInt(localObject[1]);
        jdField_b_of_type_JavaLangString = TimeManager.a().a(a(), jdField_b_of_type_Long);
      }
    }
    return;
    label100:
    jdField_b_of_type_JavaLangCharSequence = "";
    H = 0;
  }
  
  public void a(QQAppInterface paramQQAppInterface, Context paramContext)
  {
    if (QLog.isColorLevel()) {
      QLog.d("RecentItemNewFriendMsgData", 2, "RecentItemNewFriendMsgData update");
    }
    super.a(paramQQAppInterface, paramContext);
    NewFriendManager localNewFriendManager = (NewFriendManager)paramQQAppInterface.getManager(33);
    localNewFriendManager.d();
    NewFriendMessage localNewFriendMessage = localNewFriendManager.a();
    jdField_a_of_type_JavaLangString = paramContext.getString(R);
    if (localNewFriendMessage == null)
    {
      if (QLog.isColorLevel()) {
        QLog.d("RecentItemNewFriendMsgData", 2, "isFirstShow = " + jdField_a_of_type_Boolean);
      }
      if ((jdField_a_of_type_Boolean) && (amsg == null))
      {
        jdField_a_of_type_Boolean = false;
        a().reParse();
        e();
        label124:
        if (AppSetting.i)
        {
          paramQQAppInterface = new StringBuilder();
          paramQQAppInterface.append(jdField_a_of_type_JavaLangString).append(",");
          if (H != 0) {
            break label329;
          }
        }
      }
    }
    for (;;)
    {
      if (jdField_c_of_type_JavaLangCharSequence != null) {
        paramQQAppInterface.append(jdField_c_of_type_JavaLangCharSequence + ",");
      }
      paramQQAppInterface.append(jdField_b_of_type_JavaLangCharSequence).append(",").append(jdField_b_of_type_JavaLangString);
      jdField_c_of_type_JavaLangString = paramQQAppInterface.toString();
      return;
      b(paramQQAppInterface);
      break;
      if (jdField_a_of_type_Boolean)
      {
        b(paramQQAppInterface);
        e();
        break label124;
      }
      if (jdField_a_of_type_JavaLangString != null) {}
      for (paramQQAppInterface = jdField_a_of_type_JavaLangString;; paramQQAppInterface = jdField_b_of_type_JavaLangCharSequence)
      {
        jdField_b_of_type_JavaLangCharSequence = paramQQAppInterface;
        H = localNewFriendManager.a();
        if (jdField_b_of_type_Long < jdField_a_of_type_Long) {
          jdField_b_of_type_Long = jdField_a_of_type_Long;
        }
        jdField_b_of_type_JavaLangString = TimeManager.a().a(a(), jdField_b_of_type_Long);
        break;
      }
      label329:
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
