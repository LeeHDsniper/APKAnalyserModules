package com.tencent.mobileqq.activity.contact.newfriend;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.contact.CircleMemberListActivity;
import com.tencent.mobileqq.app.CircleManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.CircleGroup;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.circle.IGroupObserver;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.widget.XListView;
import java.util.ArrayList;
import lrk;
import lrl;
import lrm;

public class CircleGroupListView
  extends BaseNewFriendView
  implements View.OnClickListener
{
  static final boolean b = AppSetting.i;
  public CircleManager a;
  private ForwardBaseOption jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption;
  IGroupObserver jdField_a_of_type_ComTencentMobileqqServiceCircleIGroupObserver = new lrk(this);
  private XListView jdField_a_of_type_ComTencentWidgetXListView;
  public ArrayList a;
  public lrl a;
  private View d;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public CircleGroupListView(Context paramContext, ForwardBaseOption paramForwardBaseOption)
  {
    super(paramContext);
    jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption = paramForwardBaseOption;
  }
  
  private void a()
  {
    jdField_a_of_type_ComTencentMobileqqAppCircleManager = ((CircleManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(34));
    jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(jdField_a_of_type_ComTencentMobileqqServiceCircleIGroupObserver);
    jdField_a_of_type_JavaUtilArrayList = new ArrayList();
    int i = jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(jdField_a_of_type_JavaUtilArrayList);
    boolean bool;
    if (i != 0)
    {
      CircleManager localCircleManager = jdField_a_of_type_ComTencentMobileqqAppCircleManager;
      if (jdField_a_of_type_JavaUtilArrayList.size() == 0)
      {
        bool = true;
        i = localCircleManager.a(i, bool);
        if (i != 0) {
          break label116;
        }
        b();
      }
    }
    for (;;)
    {
      jdField_a_of_type_Lrl = new lrl(this, null);
      jdField_a_of_type_ComTencentWidgetXListView.setAdapter(jdField_a_of_type_Lrl);
      return;
      bool = false;
      break;
      label116:
      if (i == -2)
      {
        a(2131368714, 1);
        continue;
        if (jdField_a_of_type_JavaUtilArrayList.size() == 0) {
          d(true);
        }
      }
    }
  }
  
  private void c(int paramInt) {}
  
  private void d(boolean paramBoolean)
  {
    int j = 8;
    Object localObject = d;
    if (paramBoolean)
    {
      i = 0;
      ((View)localObject).setVisibility(i);
      localObject = jdField_a_of_type_ComTencentWidgetXListView;
      if (!paramBoolean) {
        break label46;
      }
    }
    label46:
    for (int i = j;; i = 0)
    {
      ((XListView)localObject).setVisibility(i);
      return;
      i = 8;
      break;
    }
  }
  
  private void j()
  {
    jdField_a_of_type_ComTencentWidgetXListView = ((XListView)findViewById(2131301025));
    jdField_a_of_type_ComTencentWidgetXListView.setContentBackground(null);
    d = findViewById(2131301026);
    View localView = ((Activity)getContext()).getLayoutInflater().inflate(2130904750, jdField_a_of_type_ComTencentWidgetXListView, false);
    localView.findViewById(2131300492).setVisibility(8);
    EditText localEditText = (EditText)localView.findViewById(2131300511);
    localEditText.setFocusableInTouchMode(false);
    localEditText.setOnClickListener(this);
    localEditText.setCursorVisible(false);
    ((TextView)localView.findViewById(2131300512)).setText(2131367314);
    jdField_a_of_type_ComTencentWidgetXListView.a(localView);
  }
  
  public View a()
  {
    View localView = ((Activity)getContext()).getLayoutInflater().inflate(2130904032, null);
    localView.setId(2130904032);
    lrm localLrm = new lrm(null);
    jdField_a_of_type_AndroidWidgetImageView = ((ImageView)localView.findViewById(2131296683));
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)localView.findViewById(2131297636));
    b = ((TextView)localView.findViewById(2131297640));
    Button localButton = (Button)localView.findViewById(2131298506);
    localButton.setBackgroundResource(2130838114);
    localButton.setVisibility(0);
    localButton.setClickable(false);
    localView.setTag(localLrm);
    localView.setOnClickListener(this);
    return localView;
  }
  
  protected void a(Intent paramIntent, BaseNewFriendView.INewFriendContext paramINewFriendContext)
  {
    super.a(paramIntent, paramINewFriendContext);
    a(2130904031);
    j();
    a();
  }
  
  public void a(View paramView, CircleGroup paramCircleGroup)
  {
    lrm localLrm = (lrm)paramView.getTag();
    jdField_a_of_type_AndroidWidgetImageView.setImageResource(jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(groupId));
    jdField_a_of_type_AndroidWidgetTextView.setText(groupName);
    b.setText(buddyCount + " 人");
    jdField_a_of_type_Int = groupId;
    jdField_a_of_type_JavaLangString = groupName;
    if (b)
    {
      StringBuilder localStringBuilder = new StringBuilder();
      localStringBuilder.append(jdField_a_of_type_JavaLangString).append("分组,");
      localStringBuilder.append("共").append(buddyCount).append("人");
      paramView.setContentDescription(localStringBuilder.toString());
    }
  }
  
  protected void d()
  {
    super.d();
    if (!jdField_a_of_type_Boolean) {
      a(true);
    }
  }
  
  protected void h()
  {
    jdField_a_of_type_ComTencentMobileqqAppCircleManager.b(jdField_a_of_type_ComTencentMobileqqServiceCircleIGroupObserver);
    super.h();
  }
  
  public void onClick(View paramView)
  {
    lrm localLrm;
    switch (paramView.getId())
    {
    default: 
      localLrm = (lrm)paramView.getTag();
      paramView = jdField_a_of_type_AndroidContentIntent;
      if (paramView == null) {
        paramView = new Intent();
      }
      break;
    }
    for (;;)
    {
      paramView.setClass(getContext(), CircleMemberListActivity.class);
      paramView.putExtra("k_group_id", jdField_a_of_type_Int);
      paramView.putExtra("k_group_name", jdField_a_of_type_JavaLangString);
      if (jdField_a_of_type_Boolean)
      {
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Network_circle", "Forward_circle_grp", 0, 0, jdField_a_of_type_Int - 1 + "", "", "", "");
        b(paramView, 20000);
        return;
        if (jdField_a_of_type_Boolean)
        {
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Network_circle", "Forward_search", 0, 0, "", "", "", "");
          c(14);
          return;
        }
        c(13);
        return;
      }
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Network_circle", "Circle_list_exp", 0, 0, jdField_a_of_type_Int - 1 + "", "", "", "");
      a(paramView);
      return;
    }
  }
}
