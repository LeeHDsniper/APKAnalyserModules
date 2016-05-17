package com.tencent.mobileqq.activity.selectmember;

import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.widget.FrameLayout;
import com.tencent.common.app.InnerFrameManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public abstract class TroopDiscussionBaseV
  extends FrameLayout
{
  public Context a;
  public LayoutInflater a;
  public InnerFrameManager a;
  public SelectMemberActivity a;
  public QQAppInterface a;
  
  public TroopDiscussionBaseV(SelectMemberActivity paramSelectMemberActivity)
  {
    super(paramSelectMemberActivity);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = app;
    jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity = paramSelectMemberActivity;
    jdField_a_of_type_AndroidContentContext = paramSelectMemberActivity;
    jdField_a_of_type_AndroidViewLayoutInflater = paramSelectMemberActivity.getLayoutInflater();
    jdField_a_of_type_ComTencentCommonAppInnerFrameManager = jdField_a_of_type_ComTencentCommonAppInnerFrameManager;
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
  
  public void a(Bundle paramBundle) {}
  
  protected void b() {}
  
  public void b(Bundle paramBundle) {}
  
  protected void e() {}
  
  protected void f() {}
}
