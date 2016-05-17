package com.tencent.mobileqq.activity.selectmember;

import android.content.Context;
import android.os.Bundle;
import android.util.AttributeSet;
import android.view.View;
import com.tencent.mobileqq.app.CircleManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.search.fragment.ContactSearchFragment;
import com.tencent.mobileqq.service.circle.IGroupObserver;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.widget.XListView;
import java.util.ArrayList;
import mmf;
import mmg;

public class RenMaiQuanTeamListInnerFrame
  extends SelectMemberInnerFrame
{
  public CircleManager a;
  IGroupObserver jdField_a_of_type_ComTencentMobileqqServiceCircleIGroupObserver;
  private XListView jdField_a_of_type_ComTencentWidgetXListView;
  public ArrayList a;
  private mmg jdField_a_of_type_Mmg;
  
  public RenMaiQuanTeamListInnerFrame(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilArrayList = new ArrayList();
    jdField_a_of_type_ComTencentMobileqqServiceCircleIGroupObserver = new mmf(this);
  }
  
  public RenMaiQuanTeamListInnerFrame(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    jdField_a_of_type_JavaUtilArrayList = new ArrayList();
    jdField_a_of_type_ComTencentMobileqqServiceCircleIGroupObserver = new mmf(this);
  }
  
  public RenMaiQuanTeamListInnerFrame(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    jdField_a_of_type_JavaUtilArrayList = new ArrayList();
    jdField_a_of_type_ComTencentMobileqqServiceCircleIGroupObserver = new mmf(this);
  }
  
  public ContactSearchFragment a()
  {
    return ContactSearchFragment.a(-1, 2048, null, jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.i, jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity);
  }
  
  public String a()
  {
    return "-1";
  }
  
  public void a(Bundle paramBundle)
  {
    super.a(paramBundle);
    setContentView(2130904802);
    jdField_a_of_type_ComTencentWidgetXListView = ((XListView)findViewById(2131299626));
    jdField_a_of_type_ComTencentWidgetXListView.setSelector(2131427378);
    jdField_a_of_type_ComTencentMobileqqAppCircleManager = ((CircleManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(34));
    int i;
    if (jdField_a_of_type_ComTencentMobileqqAppCircleManager != null)
    {
      jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(jdField_a_of_type_ComTencentMobileqqServiceCircleIGroupObserver);
      i = jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(jdField_a_of_type_JavaUtilArrayList);
      if (i != 0)
      {
        i = jdField_a_of_type_ComTencentMobileqqAppCircleManager.c(i);
        if (i != 0) {
          break label128;
        }
        jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.m();
      }
    }
    for (;;)
    {
      jdField_a_of_type_Mmg = new mmg(this, null);
      jdField_a_of_type_ComTencentWidgetXListView.setAdapter(jdField_a_of_type_Mmg);
      return;
      label128:
      if (i == -2) {
        QQToast.a(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity, jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getString(2131366990), 0).b(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.b.getHeight());
      }
    }
  }
  
  public void b(Bundle paramBundle)
  {
    super.b(paramBundle);
    jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(true, jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getString(2131369858), jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getString(2131369844));
  }
  
  public void d()
  {
    super.d();
    jdField_a_of_type_ComTencentMobileqqAppCircleManager.b(jdField_a_of_type_ComTencentMobileqqServiceCircleIGroupObserver);
  }
  
  public void f()
  {
    jdField_a_of_type_Mmg.notifyDataSetChanged();
  }
}
