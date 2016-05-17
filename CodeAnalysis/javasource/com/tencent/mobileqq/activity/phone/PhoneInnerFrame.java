package com.tencent.mobileqq.activity.phone;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.AttributeSet;
import com.tencent.common.app.InnerFrame;
import com.tencent.common.app.InnerFrameManager;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;
import lzd;

public class PhoneInnerFrame
  extends InnerFrame
{
  private int jdField_a_of_type_Int;
  private BaseActivityView.IPhoneContext jdField_a_of_type_ComTencentMobileqqActivityPhoneBaseActivityView$IPhoneContext;
  private BaseActivityView jdField_a_of_type_ComTencentMobileqqActivityPhoneBaseActivityView;
  private ContactListView jdField_a_of_type_ComTencentMobileqqActivityPhoneContactListView;
  private PhoneLaunchView jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneLaunchView;
  private PhoneMatchView jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneMatchView;
  private ContactBindObserver jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver;
  public boolean a;
  
  public PhoneInnerFrame(Context paramContext)
  {
    super(paramContext);
    jdField_a_of_type_Int = 0;
  }
  
  public PhoneInnerFrame(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    jdField_a_of_type_Int = 0;
  }
  
  public PhoneInnerFrame(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = 0;
  }
  
  private void a(Intent paramIntent, BaseActivityView paramBaseActivityView)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityPhoneBaseActivityView != paramBaseActivityView)
    {
      if (jdField_a_of_type_ComTencentMobileqqActivityPhoneBaseActivityView != null)
      {
        if (jdField_a_of_type_Boolean) {
          jdField_a_of_type_ComTencentMobileqqActivityPhoneBaseActivityView.c();
        }
        jdField_a_of_type_ComTencentMobileqqActivityPhoneBaseActivityView.d();
      }
      jdField_a_of_type_ComTencentMobileqqActivityPhoneBaseActivityView = paramBaseActivityView;
      jdField_a_of_type_ComTencentMobileqqActivityPhoneBaseActivityView.a(paramIntent, this);
      jdField_a_of_type_ComTencentMobileqqActivityPhoneBaseActivityView.a();
      if (jdField_a_of_type_Boolean) {
        jdField_a_of_type_ComTencentMobileqqActivityPhoneBaseActivityView.b();
      }
      setContentView(jdField_a_of_type_ComTencentMobileqqActivityPhoneBaseActivityView);
    }
  }
  
  private void b(Intent paramIntent)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneMatchView == null) {
      jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneMatchView = new PhoneMatchView(a(), jdField_a_of_type_Int);
    }
    a(paramIntent, jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneMatchView);
  }
  
  private void c(Intent paramIntent)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneLaunchView == null) {
      jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneLaunchView = new PhoneLaunchView(a(), jdField_a_of_type_Int);
    }
    a(paramIntent, jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneLaunchView);
  }
  
  private void h()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityPhoneContactListView == null) {
      jdField_a_of_type_ComTencentMobileqqActivityPhoneContactListView = new ContactListView(getContext(), jdField_a_of_type_Int);
    }
    a(null, jdField_a_of_type_ComTencentMobileqqActivityPhoneContactListView);
  }
  
  protected BaseActivityView.IPhoneContext a()
  {
    return null;
  }
  
  public ForwardBaseOption a()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityPhoneContactListView != null) {
      return jdField_a_of_type_ComTencentMobileqqActivityPhoneContactListView.a;
    }
    return null;
  }
  
  public void a()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityPhoneBaseActivityView != null) {
      jdField_a_of_type_ComTencentMobileqqActivityPhoneBaseActivityView.b();
    }
    jdField_a_of_type_Boolean = true;
    super.a();
  }
  
  public void a(int paramInt1, int paramInt2)
  {
    a().overridePendingTransition(paramInt1, paramInt2);
  }
  
  public void a(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.a(paramInt1, paramInt2, paramIntent);
    if (jdField_a_of_type_ComTencentMobileqqActivityPhoneBaseActivityView != null) {
      jdField_a_of_type_ComTencentMobileqqActivityPhoneBaseActivityView.a(paramInt1, paramInt2, paramIntent);
    }
  }
  
  public void a(Intent paramIntent, int paramInt)
  {
    String str = paramIntent.getComponent().getClassName();
    if (str.equals(ContactListView.class.getName()))
    {
      h();
      return;
    }
    if (str.equals(PhoneLaunchActivity.class.getName()))
    {
      c(paramIntent);
      return;
    }
    if (str.equals(PhoneMatchView.class.getName()))
    {
      b(null);
      return;
    }
    a().startActivityForResult(paramIntent, paramInt);
  }
  
  public final BaseActivityView.IPhoneContext b()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityPhoneBaseActivityView$IPhoneContext == null) {
      jdField_a_of_type_ComTencentMobileqqActivityPhoneBaseActivityView$IPhoneContext = a();
    }
    return jdField_a_of_type_ComTencentMobileqqActivityPhoneBaseActivityView$IPhoneContext;
  }
  
  public void b()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityPhoneBaseActivityView != null) {
      jdField_a_of_type_ComTencentMobileqqActivityPhoneBaseActivityView.c();
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityPhoneContactListView != null) {
      jdField_a_of_type_ComTencentMobileqqActivityPhoneContactListView.c();
    }
    jdField_a_of_type_Boolean = false;
    super.b();
  }
  
  public void b(Bundle paramBundle)
  {
    super.b(paramBundle);
    if (paramBundle != null) {
      jdField_a_of_type_Int = paramBundle.getInt("key_req_type");
    }
    g();
    if (jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver == null)
    {
      jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver = new lzd(this);
      b().a().registObserver(jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver);
    }
  }
  
  public void c()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityPhoneBaseActivityView != null)
    {
      jdField_a_of_type_ComTencentMobileqqActivityPhoneBaseActivityView.d();
      jdField_a_of_type_ComTencentMobileqqActivityPhoneBaseActivityView = null;
      removeAllViews();
    }
    if (jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver != null)
    {
      b().a().unRegistObserver(jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver);
      jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver = null;
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityPhoneContactListView != null)
    {
      jdField_a_of_type_ComTencentMobileqqActivityPhoneContactListView.e();
      jdField_a_of_type_ComTencentMobileqqActivityPhoneContactListView = null;
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneLaunchView != null)
    {
      jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneLaunchView.e();
      jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneLaunchView = null;
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneMatchView != null)
    {
      jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneMatchView.e();
      jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneMatchView = null;
    }
    super.c();
  }
  
  public void d()
  {
    jdField_a_of_type_ComTencentMobileqqActivityPhoneContactListView = null;
    jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneMatchView = null;
    jdField_a_of_type_ComTencentMobileqqActivityPhonePhoneLaunchView = null;
    jdField_a_of_type_ComTencentMobileqqActivityPhoneBaseActivityView = null;
    super.d();
  }
  
  public void f()
  {
    a().a(0);
  }
  
  public void g()
  {
    PhoneContactManagerImp localPhoneContactManagerImp = (PhoneContactManagerImp)b().a().getManager(10);
    switch (localPhoneContactManagerImp.d())
    {
    default: 
      h();
      return;
    case 0: 
    case 4: 
    case 5: 
    case 6: 
      h();
      return;
    case 1: 
    case 2: 
      c(null);
      return;
    }
    if (localPhoneContactManagerImp.d())
    {
      h();
      return;
    }
    b(null);
  }
}
