package com.tencent.mobileqq.activity.contact.troop;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Message;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.FrameLayout;
import com.tencent.mobileqq.app.BusinessObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.util.MqqWeakReferenceHandler;

public class BaseTroopView
  extends FrameLayout
{
  protected int a;
  View a;
  public BaseTroopView.ITroopContext a;
  public QQAppInterface a;
  protected boolean a;
  View b;
  public boolean b;
  View c;
  View d;
  private View e;
  
  public BaseTroopView(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = true;
    jdField_b_of_type_Boolean = false;
    jdField_a_of_type_Int = 0;
  }
  
  public Activity a()
  {
    return jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.a();
  }
  
  protected View a(int paramInt)
  {
    if (e != null) {
      return e.findViewById(paramInt);
    }
    return findViewById(paramInt);
  }
  
  protected final void a(int paramInt)
  {
    ((LayoutInflater)getContext().getSystemService("layout_inflater")).inflate(paramInt, this, true);
    setBackgroundDrawable(null);
  }
  
  protected final void a(int paramInt1, int paramInt2)
  {
    jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.a().overridePendingTransition(paramInt1, paramInt2);
  }
  
  public void a(int paramInt1, int paramInt2, Intent paramIntent) {}
  
  public void a(int paramInt, long paramLong)
  {
    jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.a().sendEmptyMessageDelayed(paramInt, paramLong);
  }
  
  public void a(int paramInt, boolean paramBoolean)
  {
    jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.a(paramInt, paramBoolean);
  }
  
  protected void a(Intent paramIntent)
  {
    b(paramIntent, 0);
  }
  
  protected final void a(Intent paramIntent, int paramInt)
  {
    b(paramIntent, paramInt);
  }
  
  protected void a(Intent paramIntent, BaseTroopView.ITroopContext paramITroopContext)
  {
    jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext = paramITroopContext;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.a();
    jdField_a_of_type_AndroidViewView = jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.b();
    jdField_b_of_type_AndroidViewView = jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.c();
    c = jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.a();
    d = jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.d();
  }
  
  public void a(BusinessObserver paramBusinessObserver)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null) {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramBusinessObserver);
    }
  }
  
  public final void a(String paramString)
  {
    if (!b()) {
      jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.a(paramString);
    }
  }
  
  public boolean a()
  {
    return jdField_b_of_type_Boolean;
  }
  
  public boolean a(Message paramMessage)
  {
    return false;
  }
  
  public void b()
  {
    jdField_b_of_type_Boolean = true;
  }
  
  public final void b(int paramInt)
  {
    a(getResources().getString(paramInt));
  }
  
  protected final void b(Intent paramIntent, int paramInt)
  {
    jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.a().startActivityForResult(paramIntent, paramInt);
  }
  
  public void b(BusinessObserver paramBusinessObserver)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null) {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(paramBusinessObserver);
    }
  }
  
  protected final boolean b()
  {
    return jdField_a_of_type_Boolean;
  }
  
  public void c()
  {
    jdField_b_of_type_Boolean = false;
  }
  
  protected void d()
  {
    jdField_a_of_type_Boolean = false;
  }
  
  protected void e() {}
  
  protected void f() {}
  
  protected void g()
  {
    jdField_a_of_type_Boolean = true;
  }
  
  protected void h() {}
  
  public void i()
  {
    jdField_a_of_type_Boolean = true;
    jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.a().finish();
  }
  
  public void j() {}
}
