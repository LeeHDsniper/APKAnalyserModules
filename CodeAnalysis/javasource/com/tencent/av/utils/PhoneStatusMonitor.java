package com.tencent.av.utils;

import android.content.Context;
import android.content.IntentFilter;
import android.os.SystemClock;
import android.telephony.PhoneStateListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import fyw;
import fyy;

public class PhoneStatusMonitor
{
  static final String jdField_a_of_type_JavaLangString = "PhoneStatusMonitor";
  public Context a;
  PhoneStateListener jdField_a_of_type_AndroidTelephonyPhoneStateListener;
  public PhoneStatusMonitor.PhoneStatusListener a;
  fyw jdField_a_of_type_Fyw;
  public boolean a;
  
  public PhoneStatusMonitor(Context paramContext, PhoneStatusMonitor.PhoneStatusListener paramPhoneStatusListener)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
    long l = SystemClock.elapsedRealtime();
    if (QLog.isColorLevel()) {
      QLog.d("PhoneStatusMonitor", 2, "PhoneStatusMonitor Begin");
    }
    jdField_a_of_type_AndroidContentContext = paramContext;
    jdField_a_of_type_ComTencentAvUtilsPhoneStatusMonitor$PhoneStatusListener = paramPhoneStatusListener;
    jdField_a_of_type_AndroidTelephonyPhoneStateListener = new fyy(this);
    jdField_a_of_type_Fyw = new fyw(this);
    PhoneStatusTools.a(paramContext, jdField_a_of_type_AndroidTelephonyPhoneStateListener, 32);
    if (QLog.isColorLevel()) {
      QLog.d("PhoneStatusMonitor", 2, "PhoneStatusMonitor Step1,time=" + (SystemClock.elapsedRealtime() - l));
    }
    paramPhoneStatusListener = new IntentFilter();
    paramPhoneStatusListener.addAction("android.intent.action.PHONE_STATE");
    paramPhoneStatusListener.addAction("android.intent.action.PHONE_STATE2");
    paramPhoneStatusListener.addAction("android.intent.action.PHONE_STATE_2");
    paramPhoneStatusListener.addAction("android.intent.action.PHONE_STATE_EXT");
    paramPhoneStatusListener.addAction("android.intent.action.NEW_OUTGOING_CALL");
    paramContext.registerReceiver(jdField_a_of_type_Fyw, paramPhoneStatusListener);
    if (QLog.isColorLevel()) {
      QLog.d("PhoneStatusMonitor", 2, "PhoneStatusMonitor End,time=" + (SystemClock.elapsedRealtime() - l));
    }
  }
  
  public boolean a()
  {
    return jdField_a_of_type_Boolean;
  }
  
  protected void finalize()
  {
    PhoneStatusTools.a(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_AndroidTelephonyPhoneStateListener, 0);
    jdField_a_of_type_AndroidContentContext.unregisterReceiver(jdField_a_of_type_Fyw);
    jdField_a_of_type_ComTencentAvUtilsPhoneStatusMonitor$PhoneStatusListener = null;
    jdField_a_of_type_Fyw = null;
    jdField_a_of_type_AndroidTelephonyPhoneStateListener = null;
    jdField_a_of_type_AndroidContentContext = null;
    super.finalize();
  }
}
