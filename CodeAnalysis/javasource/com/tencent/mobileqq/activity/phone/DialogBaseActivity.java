package com.tencent.mobileqq.activity.phone;

import android.content.DialogInterface.OnClickListener;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Message;
import android.view.View;
import com.tencent.mobileqq.app.IphoneTitleBarActivity;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.widget.QQProgressDialog;
import com.tencent.mobileqq.widget.QQToast;
import lyw;
import lyx;
import lyy;
import lyz;
import mqq.app.AppActivity;

public class DialogBaseActivity
  extends IphoneTitleBarActivity
{
  public static final int p = 1;
  public static final int q = 2;
  static final int r = 1;
  static final int s = 2;
  private View jdField_a_of_type_AndroidViewView;
  public PhoneContactManagerImp a;
  public QQProgressDialog a;
  private lyz jdField_a_of_type_Lyz;
  
  public DialogBaseActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public static QQCustomDialog a(AppActivity paramAppActivity, DialogInterface.OnClickListener paramOnClickListener)
  {
    if (paramAppActivity.isFinishing()) {
      return null;
    }
    ReportController.b((QQAppInterface)paramAppActivity.getAppRuntime(), "CliOper", "", "", "0X8005B17", "0X8005B17", 0, 0, "", "", "", "");
    paramAppActivity = DialogUtil.a(paramAppActivity, 231, paramAppActivity.getString(2131362898), paramAppActivity.getString(2131362897), 2131362899, 2131362900, paramOnClickListener, paramOnClickListener);
    paramAppActivity.setOnKeyListener(new lyy());
    paramAppActivity.setCanceledOnTouchOutside(false);
    paramAppActivity.show();
    return paramAppActivity;
  }
  
  protected void a(int paramInt, long paramLong)
  {
    if (!isFinishing())
    {
      b(paramInt);
      jdField_a_of_type_Lyz.sendEmptyMessageDelayed(2, paramLong);
    }
  }
  
  public void a(int paramInt, long paramLong, boolean paramBoolean)
  {
    Object localObject = jdField_a_of_type_Lyz;
    if (paramBoolean) {}
    for (int i = 1;; i = 0)
    {
      localObject = ((lyz)localObject).obtainMessage(1, paramInt, i);
      jdField_a_of_type_Lyz.sendMessageDelayed((Message)localObject, paramLong);
      return;
    }
  }
  
  public void a(int paramInt, boolean paramBoolean)
  {
    if ((!isFinishing()) && (jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog == null))
    {
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog = new QQProgressDialog(this, getTitleBarHeight());
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.setOnDismissListener(new lyx(this));
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.b(paramInt);
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.setCancelable(paramBoolean);
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.setCanceledOnTouchOutside(false);
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.show();
    }
  }
  
  public void a(String paramString)
  {
    if (!isFinishing()) {
      QQToast.a(this, 0, paramString, 0).b(getTitleBarHeight());
    }
  }
  
  public void a(String paramString1, String paramString2)
  {
    if (!isFinishing()) {
      DialogUtil.a(this, 231, paramString1, paramString2, new lyw(this), null).show();
    }
  }
  
  public void b(int paramInt)
  {
    a(getResources().getString(paramInt));
  }
  
  public boolean b()
  {
    boolean bool = false;
    if (jdField_a_of_type_Lyz.hasMessages(1))
    {
      jdField_a_of_type_Lyz.removeMessages(1);
      bool = true;
    }
    if (jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog != null)
    {
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.cancel();
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog = null;
      return true;
    }
    return bool;
  }
  
  public boolean doOnCreate(Bundle paramBundle)
  {
    super.doOnCreate(paramBundle);
    jdField_a_of_type_Lyz = new lyz(this);
    jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp = ((PhoneContactManagerImp)app.getManager(10));
    return true;
  }
  
  public View findViewById(int paramInt)
  {
    View localView1 = null;
    if (jdField_a_of_type_AndroidViewView != null) {
      localView1 = jdField_a_of_type_AndroidViewView.findViewById(paramInt);
    }
    View localView2 = localView1;
    if (localView1 == null) {
      localView2 = super.findViewById(paramInt);
    }
    return localView2;
  }
  
  public void setContentView(int paramInt)
  {
    jdField_a_of_type_AndroidViewView = setContentViewB(paramInt);
  }
  
  protected String setLastActivityName()
  {
    return null;
  }
}
