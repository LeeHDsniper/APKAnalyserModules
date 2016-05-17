package com.tencent.mobileqq.activity.recent;

import android.content.ContentResolver;
import android.content.Context;
import android.os.Looper;
import android.provider.Settings.System;
import android.text.TextUtils;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.photopreview.CountDownTimer;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.TimeFormatterUtils;
import com.tencent.qphone.base.util.QLog;
import java.util.Calendar;
import java.util.HashMap;

public class TimeManager
{
  private static TimeManager jdField_a_of_type_ComTencentMobileqqActivityRecentTimeManager;
  private long jdField_a_of_type_Long;
  public CountDownTimer a;
  private String jdField_a_of_type_JavaLangString;
  private StringBuffer jdField_a_of_type_JavaLangStringBuffer;
  private HashMap jdField_a_of_type_JavaUtilHashMap;
  private HashMap b;
  
  private TimeManager()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = "yyyy-MM-dd";
    b = new HashMap();
    jdField_a_of_type_JavaLangStringBuffer = new StringBuffer(25);
    BaseApplicationImpl localBaseApplicationImpl = BaseApplicationImpl.a;
    jdField_a_of_type_JavaUtilHashMap = new HashMap();
    e();
    Object localObject3 = null;
    Object localObject1 = localObject3;
    if (localBaseApplicationImpl != null) {
      localObject1 = localBaseApplicationImpl.getContentResolver();
    }
    try
    {
      localObject1 = Settings.System.getString((ContentResolver)localObject1, "date_format");
      if (!TextUtils.isEmpty((CharSequence)localObject1)) {}
      for (jdField_a_of_type_JavaLangString = ((String)localObject1);; jdField_a_of_type_JavaLangString = "yyyy-MM-dd")
      {
        jdField_a_of_type_ComTencentMobileqqActivityPhotopreviewCountDownTimer = new CountDownTimer(Looper.getMainLooper());
        return;
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        Object localObject2 = localObject3;
      }
    }
  }
  
  public static TimeManager a()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityRecentTimeManager == null) {}
    try
    {
      if (jdField_a_of_type_ComTencentMobileqqActivityRecentTimeManager == null) {
        jdField_a_of_type_ComTencentMobileqqActivityRecentTimeManager = new TimeManager();
      }
      return jdField_a_of_type_ComTencentMobileqqActivityRecentTimeManager;
    }
    finally {}
  }
  
  private boolean a()
  {
    if (System.currentTimeMillis() >= jdField_a_of_type_Long)
    {
      e();
      jdField_a_of_type_JavaUtilHashMap.clear();
      return false;
    }
    return true;
  }
  
  private void e()
  {
    Calendar localCalendar = Calendar.getInstance();
    localCalendar.add(5, 1);
    localCalendar.set(10, 0);
    localCalendar.set(12, 0);
    localCalendar.set(13, 0);
    jdField_a_of_type_Long = localCalendar.getTimeInMillis();
  }
  
  public String a()
  {
    return jdField_a_of_type_JavaLangString;
  }
  
  public String a(String arg1, long paramLong)
  {
    HashMap localHashMap = (HashMap)jdField_a_of_type_JavaUtilHashMap.get(???);
    if ((localHashMap == null) || (!a()))
    {
      localHashMap = new HashMap();
      jdField_a_of_type_JavaUtilHashMap.put(???, localHashMap);
      ??? = null;
    }
    for (;;)
    {
      String str = ???;
      if (??? == null) {}
      synchronized (jdField_a_of_type_JavaLangStringBuffer)
      {
        str = TimeFormatterUtils.a(jdField_a_of_type_JavaLangStringBuffer, 1000L * paramLong, true, jdField_a_of_type_JavaLangString);
        if (QLog.isDevelopLevel()) {
          QLog.i("Q.recent", 4, "getMsgDisplayTime, " + jdField_a_of_type_JavaLangStringBuffer.toString() + "," + str);
        }
        localHashMap.put(String.valueOf(paramLong), str);
        return str;
        ??? = (String)localHashMap.get(String.valueOf(paramLong));
        if (??? == null) {
          localHashMap.clear();
        }
      }
    }
  }
  
  public void a()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityPhotopreviewCountDownTimer != null) {
      jdField_a_of_type_ComTencentMobileqqActivityPhotopreviewCountDownTimer.g();
    }
  }
  
  public void a(String paramString, boolean paramBoolean)
  {
    b.put(paramString, Boolean.valueOf(paramBoolean));
  }
  
  public boolean a(String paramString)
  {
    if (!TextUtils.equals(jdField_a_of_type_JavaLangString, paramString))
    {
      if (!TextUtils.isEmpty(paramString)) {}
      for (jdField_a_of_type_JavaLangString = paramString;; jdField_a_of_type_JavaLangString = "yyyy-MM-dd")
      {
        if (jdField_a_of_type_JavaUtilHashMap != null) {
          jdField_a_of_type_JavaUtilHashMap.clear();
        }
        return true;
      }
    }
    return false;
  }
  
  public void b()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityPhotopreviewCountDownTimer != null) {
      jdField_a_of_type_ComTencentMobileqqActivityPhotopreviewCountDownTimer.f();
    }
  }
  
  public boolean b(String paramString)
  {
    return b.containsKey(paramString);
  }
  
  public void c()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityPhotopreviewCountDownTimer != null) {
      jdField_a_of_type_ComTencentMobileqqActivityPhotopreviewCountDownTimer.d();
    }
  }
  
  public void d()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityPhotopreviewCountDownTimer != null) {
      jdField_a_of_type_ComTencentMobileqqActivityPhotopreviewCountDownTimer.e();
    }
  }
}
