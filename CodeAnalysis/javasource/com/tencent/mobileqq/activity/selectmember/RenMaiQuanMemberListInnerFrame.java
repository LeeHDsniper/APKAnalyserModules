package com.tencent.mobileqq.activity.selectmember;

import android.content.Context;
import android.os.Bundle;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.CheckBox;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.app.CircleManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.CircleBuddy;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.search.fragment.ContactSearchFragment;
import com.tencent.mobileqq.service.circle.IGroupObserver;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.widget.XListView;
import java.util.ArrayList;
import mmc;
import mmd;
import mme;

public class RenMaiQuanMemberListInnerFrame
  extends SelectMemberInnerFrame
  implements View.OnClickListener
{
  public int a;
  public CircleManager a;
  IGroupObserver jdField_a_of_type_ComTencentMobileqqServiceCircleIGroupObserver;
  XListView jdField_a_of_type_ComTencentWidgetXListView;
  String jdField_a_of_type_JavaLangString;
  public ArrayList a;
  public mmd a;
  
  public RenMaiQuanMemberListInnerFrame(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilArrayList = new ArrayList();
    jdField_a_of_type_ComTencentMobileqqServiceCircleIGroupObserver = new mmc(this);
  }
  
  public RenMaiQuanMemberListInnerFrame(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    jdField_a_of_type_JavaUtilArrayList = new ArrayList();
    jdField_a_of_type_ComTencentMobileqqServiceCircleIGroupObserver = new mmc(this);
  }
  
  public RenMaiQuanMemberListInnerFrame(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    jdField_a_of_type_JavaUtilArrayList = new ArrayList();
    jdField_a_of_type_ComTencentMobileqqServiceCircleIGroupObserver = new mmc(this);
  }
  
  public ContactSearchFragment a()
  {
    return ContactSearchFragment.a(-1, 2048, null, jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.i, jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity);
  }
  
  public String a()
  {
    return String.valueOf(jdField_a_of_type_Int);
  }
  
  public void a(Bundle paramBundle)
  {
    super.a(paramBundle);
    setContentView(2130904802);
    jdField_a_of_type_ComTencentWidgetXListView = ((XListView)findViewById(2131299626));
    jdField_a_of_type_ComTencentWidgetXListView.setSelector(2131427378);
    jdField_a_of_type_Mmd = new mmd(this, jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentWidgetXListView, 1, false);
    jdField_a_of_type_ComTencentWidgetXListView.setAdapter(jdField_a_of_type_Mmd);
    jdField_a_of_type_ComTencentMobileqqAppCircleManager = ((CircleManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(34));
    if (jdField_a_of_type_ComTencentMobileqqAppCircleManager != null) {
      jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(jdField_a_of_type_ComTencentMobileqqServiceCircleIGroupObserver);
    }
  }
  
  public void b(Bundle paramBundle)
  {
    super.b(paramBundle);
    jdField_a_of_type_ComTencentWidgetXListView.setSelection(0);
    jdField_a_of_type_Int = paramBundle.getInt("group_uin");
    jdField_a_of_type_JavaLangString = paramBundle.getString("group_name");
    jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(true, "人脉圈", jdField_a_of_type_JavaLangString);
    int i = jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(jdField_a_of_type_Int, jdField_a_of_type_JavaUtilArrayList, true);
    if (i != 0)
    {
      i = jdField_a_of_type_ComTencentMobileqqAppCircleManager.c(i);
      if (i != 0) {
        break label96;
      }
      jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.m();
    }
    for (;;)
    {
      jdField_a_of_type_Mmd.notifyDataSetChanged();
      return;
      label96:
      if (i == -2) {
        QQToast.a(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity, jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getString(2131366990), 0).b(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.b.getHeight());
      }
    }
  }
  
  public void d()
  {
    super.d();
    if (jdField_a_of_type_Mmd != null) {
      jdField_a_of_type_Mmd.b();
    }
    jdField_a_of_type_ComTencentMobileqqAppCircleManager.b(jdField_a_of_type_ComTencentMobileqqServiceCircleIGroupObserver);
  }
  
  public void f()
  {
    jdField_a_of_type_Mmd.notifyDataSetChanged();
  }
  
  public void onClick(View paramView)
  {
    mme localMme = (mme)paramView.getTag();
    if ((localMme != null) && (jdField_a_of_type_AndroidWidgetCheckBox != null) && (jdField_a_of_type_ComTencentMobileqqDataCircleBuddy != null))
    {
      CircleBuddy localCircleBuddy = jdField_a_of_type_ComTencentMobileqqDataCircleBuddy;
      if (jdField_a_of_type_AndroidWidgetCheckBox.isEnabled())
      {
        boolean bool = jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(uin, jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(localCircleBuddy), 3, "-1");
        jdField_a_of_type_AndroidWidgetCheckBox.setChecked(bool);
        if (AppSetting.i)
        {
          if (!jdField_a_of_type_AndroidWidgetCheckBox.isChecked()) {
            break label126;
          }
          paramView.setContentDescription(jdField_a_of_type_AndroidWidgetTextView.getText().toString() + "已选中,双击取消");
        }
      }
    }
    return;
    label126:
    paramView.setContentDescription(jdField_a_of_type_AndroidWidgetTextView.getText().toString() + "未选中,双击选中");
  }
}
