package com.tencent.mobileqq.widget;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.widget.Toast;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.BaseApplication;
import svv;
import svw;

public class QQToastNotifier
{
  private static final int jdField_a_of_type_Int = 1;
  public Context a;
  private Handler jdField_a_of_type_AndroidOsHandler;
  public Toast a;
  
  public QQToastNotifier(Context paramContext)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidWidgetToast = null;
    jdField_a_of_type_AndroidOsHandler = new svv(this, Looper.getMainLooper());
    jdField_a_of_type_AndroidContentContext = BaseApplication.getContext();
  }
  
  public void a()
  {
    if (jdField_a_of_type_AndroidWidgetToast != null) {
      jdField_a_of_type_AndroidWidgetToast.cancel();
    }
  }
  
  public void a(int paramInt)
  {
    a(paramInt, 0, 0, 0);
  }
  
  public void a(int paramInt1, int paramInt2)
  {
    a(paramInt1, paramInt2, 0, 0);
  }
  
  public void a(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    Message localMessage = Message.obtain();
    what = 1;
    svw localSvw = new svw(null);
    jdField_a_of_type_Int = paramInt4;
    b = paramInt1;
    c = paramInt3;
    d = paramInt2;
    obj = localSvw;
    jdField_a_of_type_AndroidOsHandler.sendMessage(localMessage);
  }
  
  public void a(String paramString, int paramInt1, int paramInt2, int paramInt3)
  {
    Message localMessage = Message.obtain();
    what = 1;
    svw localSvw = new svw(null);
    jdField_a_of_type_Int = paramInt3;
    jdField_a_of_type_JavaLangString = paramString;
    c = paramInt2;
    d = paramInt1;
    obj = localSvw;
    jdField_a_of_type_AndroidOsHandler.sendMessage(localMessage);
  }
}
