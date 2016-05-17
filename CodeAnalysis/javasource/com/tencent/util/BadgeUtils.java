package com.tencent.util;

import android.app.Notification;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.core.push.BadgeUtilImpl;
import com.tencent.qphone.base.util.QLog;
import tzk;
import tzl;

public class BadgeUtils
{
  private static Handler jdField_a_of_type_AndroidOsHandler;
  private static BadgeUtils jdField_a_of_type_ComTencentUtilBadgeUtils;
  private static Runnable jdField_a_of_type_JavaLangRunnable = new tzl();
  public static boolean a;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentUtilBadgeUtils = null;
    jdField_a_of_type_AndroidOsHandler = new Handler(Looper.getMainLooper());
    jdField_a_of_type_Boolean = true;
  }
  
  public BadgeUtils() {}
  
  public static BadgeUtils a()
  {
    if (jdField_a_of_type_ComTencentUtilBadgeUtils == null) {}
    try
    {
      if (jdField_a_of_type_ComTencentUtilBadgeUtils == null) {
        jdField_a_of_type_ComTencentUtilBadgeUtils = new BadgeUtils();
      }
      return jdField_a_of_type_ComTencentUtilBadgeUtils;
    }
    finally {}
  }
  
  public static void a()
  {
    if (QLog.isColorLevel()) {
      QLog.d("BadgeUtilImpl", 2, "enableBadge mobileqq");
    }
    jdField_a_of_type_AndroidOsHandler.removeCallbacksAndMessages(null);
    BadgeUtilImpl.enableBadge(BaseApplicationImpl.a);
  }
  
  public static void a(Context paramContext, int paramInt)
  {
    if ((!jdField_a_of_type_Boolean) && (paramInt > 0)) {}
    while (!a()) {
      return;
    }
    if (Looper.myLooper() != Looper.getMainLooper())
    {
      BadgeUtilImpl.setBadge(paramContext, paramInt);
      return;
    }
    ThreadManager.b(new tzk(paramContext, paramInt));
  }
  
  public static void a(Context paramContext, int paramInt, Notification paramNotification)
  {
    if (!BadgeUtilImpl.isMIUI6()) {
      return;
    }
    BadgeUtilImpl.setMIUI6Badge(paramContext, paramInt, paramNotification);
  }
  
  public static boolean a()
  {
    return BadgeUtilImpl.isSupportBadge();
  }
  
  public static void b()
  {
    if (QLog.isColorLevel()) {
      QLog.d("BadgeUtilImpl", 2, "disableBadge mobileqq");
    }
    jdField_a_of_type_AndroidOsHandler.removeCallbacksAndMessages(null);
    BadgeUtilImpl.disableBadge(BaseApplicationImpl.a);
    jdField_a_of_type_AndroidOsHandler.postDelayed(jdField_a_of_type_JavaLangRunnable, 2000L);
  }
  
  public static void c()
  {
    jdField_a_of_type_AndroidOsHandler.removeCallbacksAndMessages(null);
  }
}
