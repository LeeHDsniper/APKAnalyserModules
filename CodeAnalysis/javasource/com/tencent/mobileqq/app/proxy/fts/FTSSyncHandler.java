package com.tencent.mobileqq.app.proxy.fts;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.app.proxy.FTSDBManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class FTSSyncHandler
  extends Handler
{
  public static final int a = 1;
  private static final String jdField_a_of_type_JavaLangString = "Q.fts.sync_worker";
  public static final int b = 2;
  private static final int c = 30000;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private boolean jdField_a_of_type_Boolean;
  
  public FTSSyncHandler(Looper paramLooper, QQAppInterface paramQQAppInterface, FTSDBManager paramFTSDBManager)
  {
    super(paramLooper);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
  }
  
  private boolean a()
  {
    boolean bool2 = true;
    boolean bool1 = bool2;
    int i;
    if (!jdField_a_of_type_Boolean)
    {
      i = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a.a();
      if (i != 0) {
        break label69;
      }
      jdField_a_of_type_Boolean = true;
      if (QLog.isColorLevel()) {
        QLog.d("Q.fts.sync_worker", 2, "isSaveDBAtOnce timeout 30s isSaveDBAtOnceFlag:" + jdField_a_of_type_Boolean);
      }
      bool1 = false;
    }
    label69:
    do
    {
      do
      {
        return bool1;
        bool1 = bool2;
      } while (i != 1);
      jdField_a_of_type_Boolean = true;
      bool1 = bool2;
    } while (!QLog.isColorLevel());
    QLog.d("Q.fts.sync_worker", 2, "isSaveDBAtOnce unActionLoginB isSaveDBAtOnceFlag:" + jdField_a_of_type_Boolean);
    return true;
  }
  
  public void a()
  {
    removeCallbacksAndMessages(null);
  }
  
  public void handleMessage(Message paramMessage)
  {
    FTSIndexOperator localFTSIndexOperator = (FTSIndexOperator)obj;
    switch (what)
    {
    default: 
    case 1: 
      do
      {
        return;
        if (localFTSIndexOperator.c())
        {
          sendMessageDelayed(obtainMessage(2, localFTSIndexOperator), 30000L);
          return;
        }
      } while (!QLog.isColorLevel());
      QLog.w("Q.fts.sync_worker", 2, "readSyncedCursor is false!!");
      return;
    }
    removeMessages(2, localFTSIndexOperator);
    if (a()) {
      localFTSIndexOperator.e();
    }
    sendMessageDelayed(obtainMessage(2, localFTSIndexOperator), 30000L);
  }
}
