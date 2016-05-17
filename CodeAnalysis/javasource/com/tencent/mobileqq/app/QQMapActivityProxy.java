package com.tencent.mobileqq.app;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.IntentFilter;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import mqq.app.AccountNotMatchException;
import neg;
import neh;

public class QQMapActivityProxy
{
  public static final String a = "QQMapActivityProxy";
  public static final String b = "com.tencent.mobileqq.getLbsShareSearch";
  public static final String c = "com.tencent.mobileqq.getLbsShareShop";
  public static final String d = "com.tencent.mobileqq.getShareShopDetail";
  public static final String e = "com.tencent.mobileqq.onGetLbsShareSearch";
  public static final String f = "com.tencent.mobileqq.onGetLbsShareShop";
  public static final String g = "com.tencent.mobileqq.onGetShareShopDetail";
  private static final String h = "com.tencent.mobileqq.addLbsObserver";
  private static final String i = "com.tencent.mobileqq.removeLbsObserver";
  private static final String j = "com.tencent.mobileqq.getStreetViewUrl";
  private static final String k = "com.tencent.mobileqq.unregisterReceiver";
  private BroadcastReceiver jdField_a_of_type_AndroidContentBroadcastReceiver;
  private Context jdField_a_of_type_AndroidContentContext;
  private LBSObserver jdField_a_of_type_ComTencentMobileqqAppLBSObserver;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  
  public QQMapActivityProxy(String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidContentBroadcastReceiver = new neg(this);
    jdField_a_of_type_ComTencentMobileqqAppLBSObserver = new neh(this);
    try
    {
      jdField_a_of_type_AndroidContentContext = BaseApplication.getContext();
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = ((QQAppInterface)((BaseApplicationImpl)jdField_a_of_type_AndroidContentContext).getAppRuntime(paramString));
      paramString = new IntentFilter();
      paramString.addAction("com.tencent.mobileqq.addLbsObserver");
      paramString.addAction("com.tencent.mobileqq.removeLbsObserver");
      paramString.addAction("com.tencent.mobileqq.getStreetViewUrl");
      paramString.addAction("com.tencent.mobileqq.unregisterReceiver");
      paramString.addAction("com.tencent.mobileqq.getLbsShareSearch");
      paramString.addAction("com.tencent.mobileqq.getLbsShareShop");
      paramString.addAction("com.tencent.mobileqq.getShareShopDetail");
      jdField_a_of_type_AndroidContentContext.registerReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver, paramString);
      return;
    }
    catch (AccountNotMatchException paramString)
    {
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.d("QQMapActivityProxy", 2, "AccountNotMatchException " + paramString.toString());
        }
      }
    }
  }
}
