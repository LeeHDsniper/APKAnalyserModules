package com.tencent.mobileqq.activity.messagesearch;

import android.app.Dialog;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.drawable.ColorDrawable;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.Window;
import android.widget.EditText;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.QQProgressDialog;
import com.tencent.util.MqqWeakReferenceHandler;
import com.tencent.widget.BubblePopupWindow;
import com.tencent.widget.XListView;

public class BaseMessageSearchDialog
  extends Dialog
  implements Handler.Callback
{
  public static final int a = 0;
  public static final int b = 1;
  public static final int c = 2;
  public static final int d = 3;
  public static final int e = 4;
  public static final int f = 5;
  public static final int g = 6;
  public static final int h = 7;
  public static final int i = 8;
  public Context a;
  public EditText a;
  public SessionInfo a;
  public MessageItem a;
  public QQAppInterface a;
  public MessageRecord a;
  QQProgressDialog jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog;
  protected MqqWeakReferenceHandler a;
  public BubblePopupWindow a;
  public XListView a;
  boolean jdField_a_of_type_Boolean;
  public int j;
  
  public BaseMessageSearchDialog(Context paramContext, QQAppInterface paramQQAppInterface, SessionInfo paramSessionInfo)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
    j = 0;
    jdField_a_of_type_ComTencentMobileqqDataMessageRecord = null;
    jdField_a_of_type_AndroidContentContext = paramContext;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo = paramSessionInfo;
    jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler = new MqqWeakReferenceHandler(Looper.getMainLooper(), this);
    requestWindowFeature(1);
    getWindow().setSoftInputMode(36);
    getWindow().setBackgroundDrawable(new ColorDrawable());
    setContentView(2130903396);
    paramContext = getWindow().getAttributes();
    x = 0;
    y = 0;
    width = -1;
    windowAnimations = 16973824;
    gravity = 51;
  }
  
  public int a()
  {
    return j;
  }
  
  public MessageRecord a()
  {
    return jdField_a_of_type_ComTencentMobileqqDataMessageRecord;
  }
  
  protected void a() {}
  
  protected void a(int paramInt)
  {
    if (jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog == null) {
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog = new QQProgressDialog(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_AndroidContentContext.getResources().getDimensionPixelSize(2131492908));
    }
    jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.setCancelable(false);
    jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.setCanceledOnTouchOutside(false);
    jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.b(paramInt);
    jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.show();
  }
  
  public void a(boolean paramBoolean)
  {
    jdField_a_of_type_Boolean = paramBoolean;
  }
  
  public boolean a()
  {
    return jdField_a_of_type_Boolean;
  }
  
  protected void b()
  {
    if ((jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog != null) && (jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.isShowing())) {
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.dismiss();
    }
  }
  
  protected void c()
  {
    if (getContextgetResourcesgetConfigurationorientation == 2) {
      jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler.sendEmptyMessageDelayed(1, 0L);
    }
  }
  
  protected void d()
  {
    if (isShowing())
    {
      long l = SystemClock.uptimeMillis();
      MotionEvent localMotionEvent = MotionEvent.obtain(l, l, 0, 0.0F, 0.0F, 0);
      jdField_a_of_type_AndroidWidgetEditText.dispatchTouchEvent(localMotionEvent);
      localMotionEvent.recycle();
      localMotionEvent = MotionEvent.obtain(l, l, 1, 0.0F, 0.0F, 0);
      jdField_a_of_type_AndroidWidgetEditText.dispatchTouchEvent(localMotionEvent);
      localMotionEvent.recycle();
    }
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    return false;
  }
}
