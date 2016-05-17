package com.tencent.mobileqq.activity.contact.newfriend;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.FrameLayout;
import com.tencent.mobileqq.app.NewFriendManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.BounceScrollView;
import java.util.Observable;
import java.util.Observer;

public class BaseNewFriendView
  extends FrameLayout
  implements Observer
{
  private int jdField_a_of_type_Int;
  protected Intent a;
  private View.OnClickListener jdField_a_of_type_AndroidViewView$OnClickListener;
  View jdField_a_of_type_AndroidViewView;
  public BaseNewFriendView.INewFriendContext a;
  public QQAppInterface a;
  protected boolean a;
  View jdField_b_of_type_AndroidViewView;
  private boolean jdField_b_of_type_Boolean;
  View jdField_c_of_type_AndroidViewView;
  private boolean jdField_c_of_type_Boolean;
  private View jdField_d_of_type_AndroidViewView;
  private boolean jdField_d_of_type_Boolean;
  private boolean e;
  
  public BaseNewFriendView(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_d_of_type_Boolean = false;
  }
  
  protected View a(int paramInt)
  {
    if (jdField_d_of_type_AndroidViewView != null) {
      return jdField_d_of_type_AndroidViewView.findViewById(paramInt);
    }
    return findViewById(paramInt);
  }
  
  protected final void a(int paramInt)
  {
    ((LayoutInflater)getContext().getSystemService("layout_inflater")).inflate(paramInt, this, true);
  }
  
  public final void a(int paramInt1, int paramInt2)
  {
    a(getResources().getString(paramInt1), paramInt2);
  }
  
  public void a(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if ((20000 == paramInt1) && (paramInt2 != 0))
    {
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView$INewFriendContext.getActivity().setResult(paramInt2, paramIntent);
      i();
    }
  }
  
  protected final void a(int paramInt, View.OnClickListener paramOnClickListener)
  {
    jdField_a_of_type_Int = paramInt;
    jdField_a_of_type_AndroidViewView$OnClickListener = paramOnClickListener;
    if (!a()) {
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView$INewFriendContext.a(jdField_a_of_type_Int, jdField_a_of_type_AndroidViewView$OnClickListener);
    }
  }
  
  public void a(int paramInt, boolean paramBoolean)
  {
    jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView$INewFriendContext.a(paramInt, paramBoolean);
  }
  
  protected void a(Intent paramIntent)
  {
    b(paramIntent, 0);
  }
  
  protected final void a(Intent paramIntent, int paramInt)
  {
    b(paramIntent, paramInt);
  }
  
  protected void a(Intent paramIntent, BaseNewFriendView.INewFriendContext paramINewFriendContext)
  {
    if (paramIntent != null) {
      jdField_a_of_type_Boolean = paramIntent.getBooleanExtra("call_by_forward", false);
    }
    jdField_a_of_type_AndroidContentIntent = paramIntent;
    jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView$INewFriendContext = paramINewFriendContext;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView$INewFriendContext.a();
    jdField_a_of_type_AndroidViewView = jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView$INewFriendContext.b();
    jdField_b_of_type_AndroidViewView = jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView$INewFriendContext.a();
    jdField_c_of_type_AndroidViewView = jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView$INewFriendContext.c();
    if (jdField_c_of_type_Boolean) {
      b(true);
    }
  }
  
  protected final void a(String paramString, int paramInt)
  {
    if (!a()) {
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView$INewFriendContext.a(paramString, paramInt);
    }
  }
  
  public void a(boolean paramBoolean)
  {
    e = paramBoolean;
    jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView$INewFriendContext.a(paramBoolean);
  }
  
  protected final boolean a()
  {
    return jdField_b_of_type_Boolean;
  }
  
  protected final void b()
  {
    jdField_d_of_type_Boolean = true;
    if (!a()) {
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView$INewFriendContext.a();
    }
  }
  
  protected final void b(int paramInt)
  {
    LayoutInflater localLayoutInflater = (LayoutInflater)getContext().getSystemService("layout_inflater");
    BounceScrollView localBounceScrollView = (BounceScrollView)localLayoutInflater.inflate(2130903145, null);
    jdField_d_of_type_AndroidViewView = localLayoutInflater.inflate(paramInt, null);
    localBounceScrollView.addView(jdField_d_of_type_AndroidViewView);
    addView(localBounceScrollView);
  }
  
  protected final void b(int paramInt1, int paramInt2)
  {
    jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView$INewFriendContext.getActivity().overridePendingTransition(paramInt1, paramInt2);
  }
  
  protected final void b(Intent paramIntent, int paramInt)
  {
    jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView$INewFriendContext.getActivity().startActivityForResult(paramIntent, paramInt);
  }
  
  protected void b(boolean paramBoolean)
  {
    NewFriendManager localNewFriendManager = (NewFriendManager)jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView$INewFriendContext.a().getManager(33);
    if (paramBoolean)
    {
      localNewFriendManager.addObserver(this);
      return;
    }
    localNewFriendManager.deleteObserver(this);
  }
  
  public final void c()
  {
    jdField_d_of_type_Boolean = false;
    if (!a()) {
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView$INewFriendContext.b();
    }
  }
  
  public void c(boolean paramBoolean)
  {
    jdField_c_of_type_Boolean = paramBoolean;
  }
  
  protected void d()
  {
    jdField_b_of_type_Boolean = false;
    if (jdField_d_of_type_Boolean) {
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView$INewFriendContext.a();
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView$INewFriendContext.a(jdField_a_of_type_Int, jdField_a_of_type_AndroidViewView$OnClickListener);
      a(e);
      return;
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView$INewFriendContext.b();
    }
  }
  
  protected void e() {}
  
  protected void f() {}
  
  protected void g()
  {
    c();
    jdField_b_of_type_Boolean = true;
  }
  
  protected void h()
  {
    if (jdField_c_of_type_Boolean)
    {
      b(false);
      jdField_c_of_type_Boolean = false;
    }
  }
  
  public void i()
  {
    jdField_b_of_type_Boolean = true;
    jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendBaseNewFriendView$INewFriendContext.getActivity().finish();
  }
  
  public void update(Observable paramObservable, Object paramObject) {}
}
