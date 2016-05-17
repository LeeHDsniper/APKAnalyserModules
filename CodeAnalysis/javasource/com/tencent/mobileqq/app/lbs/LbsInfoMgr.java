package com.tencent.mobileqq.app.lbs;

import android.app.KeyguardManager;
import android.content.Context;
import android.os.PowerManager;
import com.tencent.mobileqq.app.BizTroopHandler;
import com.tencent.mobileqq.app.BizTroopObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.TroopInfoManager;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import mqq.manager.Manager;
import niv;
import niw;

public class LbsInfoMgr
  implements Manager
{
  private static final String jdField_a_of_type_JavaLangString = "LbsInfoMgr";
  public static final int b = 900000;
  public static final int c = 3600000;
  public int a;
  public long a;
  private BizTroopHandler jdField_a_of_type_ComTencentMobileqqAppBizTroopHandler;
  public BizTroopObserver a;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private LbsInfoMgr.LocationInfo jdField_a_of_type_ComTencentMobileqqAppLbsLbsInfoMgr$LocationInfo;
  
  public LbsInfoMgr(QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Long = 0L;
    jdField_a_of_type_Int = 900000;
    jdField_a_of_type_ComTencentMobileqqAppBizTroopObserver = new niw(this);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqAppBizTroopHandler = ((BizTroopHandler)paramQQAppInterface.a(22));
    jdField_a_of_type_ComTencentMobileqqAppLbsLbsInfoMgr$LocationInfo = new LbsInfoMgr.LocationInfo();
  }
  
  private void c()
  {
    if (b())
    {
      if (QLog.isColorLevel()) {
        QLog.i("LbsInfoMgr", 2, "start  reportLbsInfoToServer");
      }
      b();
    }
  }
  
  public LbsInfoMgr.LocationInfo a()
  {
    if ((a()) && (b()))
    {
      long l1 = System.currentTimeMillis();
      long l2 = jdField_a_of_type_Long;
      if (QLog.isColorLevel()) {
        QLog.i("LbsInfoMgr", 2, "isApplicationShowing True, Check timeSpan");
      }
      if (l1 - l2 >= jdField_a_of_type_Int) {
        b();
      }
    }
    if (QLog.isColorLevel()) {
      QLog.i("LbsInfoMgr", 2, "getSeltLocation:  + latitude: " + jdField_a_of_type_ComTencentMobileqqAppLbsLbsInfoMgr$LocationInfo.b + " longitude: " + jdField_a_of_type_ComTencentMobileqqAppLbsLbsInfoMgr$LocationInfo.jdField_a_of_type_Long);
    }
    return jdField_a_of_type_ComTencentMobileqqAppLbsLbsInfoMgr$LocationInfo;
  }
  
  public void a()
  {
    if (a()) {
      c();
    }
  }
  
  public boolean a()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null)
    {
      TroopInfoManager localTroopInfoManager = (TroopInfoManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(36);
      if (localTroopInfoManager != null) {
        return localTroopInfoManager.c();
      }
    }
    return false;
  }
  
  public void b()
  {
    if (!a()) {
      return;
    }
    ThreadManager.a(new niv(this), 5, null, false);
  }
  
  public boolean b()
  {
    long l1 = System.currentTimeMillis();
    BaseApplication localBaseApplication = BaseApplication.getContext();
    if (!((PowerManager)localBaseApplication.getSystemService("power")).isScreenOn()) {
      return false;
    }
    if (((KeyguardManager)localBaseApplication.getSystemService("keyguard")).inKeyguardRestrictedInputMode()) {
      return false;
    }
    if ((jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.isBackground_Pause)) {
      return false;
    }
    long l2 = System.currentTimeMillis();
    if (QLog.isColorLevel()) {
      QLog.i("LbsInfoMgr", 2, "isApplicationShowing time cost " + (l2 - l1));
    }
    return true;
  }
  
  public void onDestroy()
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqAppBizTroopObserver);
  }
}
