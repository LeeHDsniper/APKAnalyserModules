package com.tencent.mobileqq.activity.selectmember;

import android.content.Context;
import android.os.Bundle;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.common.app.InnerFrameManager;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.proxy.ProxyManager;
import com.tencent.mobileqq.app.proxy.RecentUserProxy;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.search.fragment.ContactSearchFragment;
import com.tencent.widget.XListView;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import mma;
import mmb;

public class RecentMemberInnerFrame
  extends SelectMemberInnerFrame
  implements View.OnClickListener
{
  private EditText jdField_a_of_type_AndroidWidgetEditText;
  private FriendsManager jdField_a_of_type_ComTencentMobileqqAppFriendsManager;
  private XListView jdField_a_of_type_ComTencentWidgetXListView;
  private List jdField_a_of_type_JavaUtilList;
  private mma jdField_a_of_type_Mma;
  
  public RecentMemberInnerFrame(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilList = new ArrayList();
  }
  
  public RecentMemberInnerFrame(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    jdField_a_of_type_JavaUtilList = new ArrayList();
  }
  
  public RecentMemberInnerFrame(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    jdField_a_of_type_JavaUtilList = new ArrayList();
  }
  
  private void g()
  {
    jdField_a_of_type_JavaUtilList.clear();
    Object localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a();
    if (localObject1 != null)
    {
      Object localObject2 = ((RecentUserProxy)localObject1).a(true);
      if (localObject2 != null)
      {
        localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
        localObject2 = ((List)localObject2).iterator();
        while (((Iterator)localObject2).hasNext())
        {
          RecentUser localRecentUser = (RecentUser)((Iterator)localObject2).next();
          if (localRecentUser != null) {
            try
            {
              if ((type == 0) && (Long.parseLong(uin) >= 10000L) && (!uin.equals(localObject1)) && (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.i.contains(uin)))
              {
                Friends localFriends = jdField_a_of_type_ComTencentMobileqqAppFriendsManager.a(uin);
                if ((localFriends != null) && (localFriends.isFriend())) {
                  jdField_a_of_type_JavaUtilList.add(localRecentUser);
                }
              }
            }
            catch (NumberFormatException localNumberFormatException) {}
          }
        }
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
  
  public void a(Bundle paramBundle)
  {
    super.a(paramBundle);
    setContentView(2130904802);
    jdField_a_of_type_ComTencentMobileqqAppFriendsManager = ((FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50));
    jdField_a_of_type_ComTencentWidgetXListView = ((XListView)findViewById(2131299626));
    jdField_a_of_type_ComTencentWidgetXListView.setSelector(2131427378);
    paramBundle = (RelativeLayout)jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getLayoutInflater().inflate(2130904750, jdField_a_of_type_ComTencentWidgetXListView, false);
    jdField_a_of_type_AndroidWidgetEditText = ((EditText)paramBundle.findViewById(2131300511));
    ((Button)paramBundle.findViewById(2131300492)).setVisibility(8);
    jdField_a_of_type_ComTencentWidgetXListView.a(paramBundle);
    g();
    jdField_a_of_type_Mma = new mma(this);
    jdField_a_of_type_ComTencentWidgetXListView.setAdapter(jdField_a_of_type_Mma);
  }
  
  public void b(Bundle paramBundle)
  {
    super.b(paramBundle);
    jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(true, jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getString(2131369858), "最近联系人");
    if (jdField_a_of_type_Mma != null) {
      jdField_a_of_type_Mma.notifyDataSetChanged();
    }
  }
  
  public void d()
  {
    if (jdField_a_of_type_Mma != null) {
      jdField_a_of_type_Mma.b();
    }
    super.d();
  }
  
  public void f()
  {
    jdField_a_of_type_Mma.notifyDataSetChanged();
  }
  
  public void onClick(View paramView)
  {
    mmb localMmb = (mmb)paramView.getTag();
    if ((localMmb != null) && (b != null) && (jdField_a_of_type_AndroidWidgetCheckBox != null) && (jdField_a_of_type_AndroidWidgetTextView != null) && (jdField_a_of_type_AndroidWidgetCheckBox.isEnabled()))
    {
      boolean bool = jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(b, jdField_a_of_type_AndroidWidgetTextView.getText().toString(), 0, "-1");
      jdField_a_of_type_AndroidWidgetCheckBox.setChecked(bool);
      if (AppSetting.i)
      {
        if (!jdField_a_of_type_AndroidWidgetCheckBox.isChecked()) {
          break label130;
        }
        paramView.setContentDescription(jdField_a_of_type_AndroidWidgetTextView.getText().toString() + "已选中,双击取消");
      }
    }
    return;
    label130:
    paramView.setContentDescription(jdField_a_of_type_AndroidWidgetTextView.getText().toString() + "未选中,双击选中");
  }
}
