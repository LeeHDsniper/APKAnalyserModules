package com.tencent.mobileqq.activity.contact.addcontact;

import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.view.LayoutInflater;
import android.widget.FrameLayout;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public abstract class ContactBaseView
  extends FrameLayout
{
  public Context a;
  public ContactBaseView.IAddContactContext a;
  public QQAppInterface a;
  
  public ContactBaseView(ContactBaseView.IAddContactContext paramIAddContactContext)
  {
    super(paramIAddContactContext.a());
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView$IAddContactContext = paramIAddContactContext;
    jdField_a_of_type_AndroidContentContext = jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView$IAddContactContext.a();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramIAddContactContext.a();
  }
  
  public int a()
  {
    return getResources().getDimensionPixelSize(2131493424);
  }
  
  protected void a() {}
  
  protected final void a(int paramInt)
  {
    ((LayoutInflater)getContext().getSystemService("layout_inflater")).inflate(paramInt, this, true);
  }
  
  protected void a(int paramInt1, int paramInt2, Intent paramIntent) {}
  
  protected void b() {}
  
  protected void c() {}
  
  protected void e() {}
  
  protected void f() {}
  
  protected void g() {}
}
