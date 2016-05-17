package com.tencent.mobileqq.activity.selectmember;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.util.AttributeSet;
import android.widget.FrameLayout;
import com.tencent.common.app.InnerFrameManager;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.search.fragment.ContactSearchFragment;
import com.tencent.mobileqq.widget.RedDotTextView;
import com.tencent.mobileqq.widget.TabBarView;
import com.tencent.mobileqq.widget.TabBarView.OnTabChangeListener;

public class TroopDiscussionListInnerFrame
  extends SelectMemberInnerFrame
  implements TabBarView.OnTabChangeListener
{
  public static final int a = 0;
  public static final int b = 1;
  private FrameLayout jdField_a_of_type_AndroidWidgetFrameLayout;
  private TroopDiscussionBaseV jdField_a_of_type_ComTencentMobileqqActivitySelectmemberTroopDiscussionBaseV;
  private TabBarView jdField_a_of_type_ComTencentMobileqqWidgetTabBarView;
  private TroopDiscussionBaseV b;
  private TroopDiscussionBaseV c;
  
  public TroopDiscussionListInnerFrame(Context paramContext)
  {
    this(paramContext, null, 0);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public TroopDiscussionListInnerFrame(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public TroopDiscussionListInnerFrame(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  private void a(TroopDiscussionBaseV paramTroopDiscussionBaseV)
  {
    BaseActivity localBaseActivity = (BaseActivity)a();
    if (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberTroopDiscussionBaseV != paramTroopDiscussionBaseV)
    {
      if (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberTroopDiscussionBaseV != null)
      {
        if (localBaseActivity.isResume()) {
          jdField_a_of_type_ComTencentMobileqqActivitySelectmemberTroopDiscussionBaseV.e();
        }
        jdField_a_of_type_ComTencentMobileqqActivitySelectmemberTroopDiscussionBaseV.f();
      }
      jdField_a_of_type_ComTencentMobileqqActivitySelectmemberTroopDiscussionBaseV = paramTroopDiscussionBaseV;
      if (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberTroopDiscussionBaseV != null)
      {
        jdField_a_of_type_ComTencentMobileqqActivitySelectmemberTroopDiscussionBaseV.b(null);
        if (localBaseActivity.isResume()) {
          jdField_a_of_type_ComTencentMobileqqActivitySelectmemberTroopDiscussionBaseV.a();
        }
        jdField_a_of_type_AndroidWidgetFrameLayout.removeAllViews();
        jdField_a_of_type_AndroidWidgetFrameLayout.addView(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberTroopDiscussionBaseV);
      }
    }
  }
  
  public ContactSearchFragment a()
  {
    return ((SelectMemberInnerFrame)jdField_a_of_type_ComTencentCommonAppInnerFrameManager.getChildAt(1)).a();
  }
  
  public String a()
  {
    return "-1";
  }
  
  public void a(int paramInt1, int paramInt2)
  {
    switch (paramInt2)
    {
    default: 
      return;
    case 0: 
      g();
      return;
    }
    h();
  }
  
  public void a(Bundle paramBundle)
  {
    super.a(paramBundle);
    paramBundle = a();
    setContentView(2130903741);
    jdField_a_of_type_ComTencentMobileqqWidgetTabBarView = ((TabBarView)findViewById(2131298434));
    jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.setOnTabChangeListener(this);
    jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.a(0, paramBundle.getString(2131367276));
    jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.a(0).setContentDescription("已选定" + paramBundle.getString(2131367276));
    jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.a(1, paramBundle.getString(2131367279));
    jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.a(1).setContentDescription(paramBundle.getString(2131367279));
    jdField_a_of_type_AndroidWidgetFrameLayout = ((FrameLayout)findViewById(2131299388));
    jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.setSelectedTab(0, false);
  }
  
  public void b(Bundle paramBundle)
  {
    super.b(paramBundle);
    jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(true, jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getString(2131369858), jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getString(2131369851));
  }
  
  public void c()
  {
    super.c();
  }
  
  public void d()
  {
    if (b != null) {
      b.b();
    }
    if (c != null) {
      c.b();
    }
    super.d();
  }
  
  public void f() {}
  
  public void g()
  {
    if (b == null)
    {
      b = new TroopDiscussionTroop(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity);
      b.a(null);
    }
    a(b);
  }
  
  public void h()
  {
    if (c == null)
    {
      c = new TroopDiscussionDiscussion(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity);
      c.a(null);
    }
    a(c);
  }
}
