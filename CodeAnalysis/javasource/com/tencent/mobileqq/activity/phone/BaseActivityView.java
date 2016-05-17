package com.tencent.mobileqq.activity.phone;

import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.os.Message;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.widget.BounceScrollView;
import com.tencent.mobileqq.widget.QQProgressDialog;
import com.tencent.mobileqq.widget.QQToast;
import lxh;
import lxi;
import lxj;
import lxk;
import lxl;
import lxm;

public class BaseActivityView
  extends FrameLayout
{
  static final long jdField_a_of_type_Long = 120000L;
  public static final int b = 1;
  public static final int c = 2;
  static final int jdField_d_of_type_Int = 1;
  static final int e = 2;
  static final int f = 3;
  public int a;
  private Drawable jdField_a_of_type_AndroidGraphicsDrawableDrawable;
  protected View a;
  protected ImageView a;
  public TextView a;
  private PhoneInnerFrame jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneInnerFrame;
  public BaseActivity a;
  public PhoneContactManagerImp a;
  public QQAppInterface a;
  public QQProgressDialog a;
  private lxm jdField_a_of_type_Lxm;
  private boolean jdField_a_of_type_Boolean;
  protected View b;
  protected TextView b;
  private View c;
  protected TextView c;
  private TextView jdField_d_of_type_AndroidWidgetTextView;
  
  public BaseActivityView(Context paramContext, int paramInt)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    if ((paramContext instanceof BaseActivity)) {
      jdField_a_of_type_ComTencentMobileqqAppBaseActivity = ((BaseActivity)paramContext);
    }
    jdField_a_of_type_Int = paramInt;
  }
  
  private int a()
  {
    return jdField_a_of_type_AndroidViewView.getHeight();
  }
  
  private void a(BaseActivityView.IPhoneContext paramIPhoneContext)
  {
    jdField_c_of_type_AndroidWidgetTextView = paramIPhoneContext.a();
    d = paramIPhoneContext.d();
    jdField_a_of_type_AndroidViewView = paramIPhoneContext.a();
    jdField_b_of_type_AndroidViewView = paramIPhoneContext.b();
    jdField_a_of_type_AndroidWidgetImageView = paramIPhoneContext.a();
    jdField_a_of_type_AndroidWidgetTextView = paramIPhoneContext.b();
    jdField_b_of_type_AndroidWidgetTextView = paramIPhoneContext.c();
  }
  
  private void j()
  {
    DialogUtil.a(getContext(), 231, "请求出错", "请稍后重试", new lxl(this), null).show();
  }
  
  protected View a(int paramInt)
  {
    if (jdField_c_of_type_AndroidViewView != null) {
      return jdField_c_of_type_AndroidViewView.findViewById(paramInt);
    }
    return findViewById(paramInt);
  }
  
  protected void a()
  {
    jdField_c_of_type_AndroidWidgetTextView.setVisibility(8);
    d.setVisibility(0);
    if (jdField_a_of_type_Int == 2)
    {
      d.setText("返回");
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
      jdField_a_of_type_AndroidWidgetTextView.setText(2131366996);
      jdField_a_of_type_AndroidWidgetTextView.setContentDescription("取消本次转发");
      jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
    }
    for (;;)
    {
      d.setOnClickListener(new lxh(this));
      jdField_a_of_type_Boolean = false;
      return;
      if (jdField_a_of_type_Int == 1)
      {
        d.setText("返回");
      }
      else if (jdField_a_of_type_Int == 0)
      {
        d.setText("联系人");
        jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
        jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
        jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130838462);
      }
      else if (jdField_a_of_type_Int == 4)
      {
        d.setText(2131367298);
        jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
        jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
        jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130838462);
      }
      else if (jdField_a_of_type_Int == 5)
      {
        d.setText("返回");
        jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
        jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
      }
      else
      {
        d.setText("添加");
        jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
        jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
      }
    }
  }
  
  protected final void a(int paramInt)
  {
    a(paramInt, false);
  }
  
  protected final void a(int paramInt1, int paramInt2)
  {
    jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneInnerFrame.a(paramInt1, paramInt2);
  }
  
  public void a(int paramInt1, int paramInt2, Intent paramIntent) {}
  
  public void a(int paramInt, long paramLong)
  {
    if (!a())
    {
      b(paramInt);
      jdField_a_of_type_Lxm.sendEmptyMessageDelayed(2, paramLong);
    }
  }
  
  public void a(int paramInt, long paramLong, boolean paramBoolean)
  {
    Object localObject = jdField_a_of_type_Lxm;
    if (paramBoolean) {}
    for (int i = 0;; i = 1)
    {
      localObject = ((lxm)localObject).obtainMessage(1, paramInt, i);
      jdField_a_of_type_Lxm.sendMessageDelayed((Message)localObject, paramLong);
      return;
    }
  }
  
  protected final void a(int paramInt, boolean paramBoolean)
  {
    LayoutInflater localLayoutInflater = (LayoutInflater)getContext().getSystemService("layout_inflater");
    if (paramBoolean)
    {
      BounceScrollView localBounceScrollView = (BounceScrollView)localLayoutInflater.inflate(2130903145, null);
      jdField_c_of_type_AndroidViewView = localLayoutInflater.inflate(paramInt, null);
      localBounceScrollView.addView(jdField_c_of_type_AndroidViewView);
      addView(localBounceScrollView);
      return;
    }
    localLayoutInflater.inflate(paramInt, this, true);
  }
  
  public final void a(Intent paramIntent)
  {
    b(paramIntent, 0);
  }
  
  protected final void a(Intent paramIntent, int paramInt)
  {
    b(paramIntent, paramInt);
  }
  
  protected void a(Intent paramIntent, PhoneInnerFrame paramPhoneInnerFrame)
  {
    jdField_a_of_type_Lxm = new lxm(this);
    jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneInnerFrame = paramPhoneInnerFrame;
    paramIntent = paramPhoneInnerFrame.b();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramIntent.a();
    jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp = ((PhoneContactManagerImp)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(10));
    a(paramIntent);
  }
  
  public void a(String paramString)
  {
    if (!a()) {
      QQToast.a(getContext(), 0, paramString, 0).b(a());
    }
  }
  
  protected void a(String paramString1, String paramString2)
  {
    if (!a()) {
      DialogUtil.a(getContext(), 231, paramString1, paramString2, new lxi(this), null).show();
    }
  }
  
  protected boolean a()
  {
    return jdField_a_of_type_Boolean;
  }
  
  protected void b() {}
  
  protected void b(int paramInt)
  {
    a(getResources().getString(paramInt));
  }
  
  public void b(int paramInt, boolean paramBoolean)
  {
    if ((!a()) && (jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog == null))
    {
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog = new QQProgressDialog(getContext(), a());
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.setOnDismissListener(new lxj(this));
      if (paramBoolean) {
        jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.setOnKeyListener(new lxk(this));
      }
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.b(paramInt);
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.setCanceledOnTouchOutside(false);
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.show();
    }
  }
  
  public final void b(Intent paramIntent, int paramInt)
  {
    jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneInnerFrame.a(paramIntent, paramInt);
  }
  
  protected void c() {}
  
  protected void d()
  {
    jdField_a_of_type_Boolean = true;
    g();
  }
  
  protected void e() {}
  
  public void f()
  {
    jdField_a_of_type_Boolean = true;
    jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneInnerFrame.f();
  }
  
  public void g()
  {
    jdField_a_of_type_Lxm.removeMessages(1);
    if (jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog != null)
    {
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.cancel();
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog = null;
    }
  }
  
  protected void h()
  {
    if ((jdField_b_of_type_AndroidWidgetTextView != null) && (jdField_a_of_type_AndroidGraphicsDrawableDrawable == null))
    {
      jdField_a_of_type_AndroidGraphicsDrawableDrawable = getResources().getDrawable(2130838193);
      jdField_b_of_type_AndroidWidgetTextView.setCompoundDrawablePadding(10);
      jdField_b_of_type_AndroidWidgetTextView.setCompoundDrawablesWithIntrinsicBounds(jdField_a_of_type_AndroidGraphicsDrawableDrawable, null, null, null);
      ((Animatable)jdField_a_of_type_AndroidGraphicsDrawableDrawable).start();
      jdField_a_of_type_Lxm.removeMessages(3);
      jdField_a_of_type_Lxm.sendEmptyMessageDelayed(3, 120000L);
    }
  }
  
  public void i()
  {
    if ((jdField_b_of_type_AndroidWidgetTextView != null) && (jdField_a_of_type_AndroidGraphicsDrawableDrawable != null))
    {
      jdField_a_of_type_Lxm.removeMessages(3);
      ((Animatable)jdField_a_of_type_AndroidGraphicsDrawableDrawable).stop();
      jdField_a_of_type_AndroidGraphicsDrawableDrawable = null;
      jdField_b_of_type_AndroidWidgetTextView.setCompoundDrawables(null, null, null, null);
    }
  }
}
