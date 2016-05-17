package com.tencent.mobileqq.activity.selectmember;

import SecurityAccountServer.RespondQueryQQBindingStat;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.LinearLayout;
import com.tencent.av.config.ConfigSystemImpl;
import com.tencent.common.app.InnerFrameManager;
import com.tencent.mobileqq.activity.contact.SearchResultDialog;
import com.tencent.mobileqq.activity.phone.BindNumberActivity;
import com.tencent.mobileqq.activity.phone.GuideBindPhoneActivity;
import com.tencent.mobileqq.activity.phone.PhoneFrameActivity;
import com.tencent.mobileqq.activity.phone.PhoneLaunchActivity;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.search.IContactSearchable;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.PinnedFooterExpandableListView;
import java.util.List;
import mkx;
import mky;
import mkz;

public class FriendTabView
  extends TroopDiscussionBaseV
  implements View.OnClickListener
{
  public static final String a = "FriendTabView";
  private SelectMemberBuddyListAdapter jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberBuddyListAdapter;
  private PinnedFooterExpandableListView jdField_a_of_type_ComTencentWidgetPinnedFooterExpandableListView;
  List jdField_a_of_type_JavaUtilList;
  public boolean a;
  boolean b;
  boolean c;
  boolean d;
  
  public FriendTabView(SelectMemberActivity paramSelectMemberActivity)
  {
    super(paramSelectMemberActivity);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
    b = false;
    c = false;
    d = false;
    jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity = paramSelectMemberActivity;
  }
  
  public static List a(Context paramContext, QQAppInterface paramQQAppInterface)
  {
    FriendsManager localFriendsManager = (FriendsManager)paramQQAppInterface.getManager(50);
    return SearchResultDialog.a(paramContext, paramQQAppInterface, IContactSearchable.B, 0, false, null);
  }
  
  private boolean a()
  {
    return (d) && (c);
  }
  
  private void d()
  {
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005D0C", "0X8005D0C", 0, 0, "", "", "", "");
    Object localObject = (PhoneContactManagerImp)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(10);
    if (localObject == null)
    {
      jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a(0);
      b = false;
      return;
    }
    if (!((PhoneContactManagerImp)localObject).e())
    {
      localObject = new Intent(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity, GuideBindPhoneActivity.class);
      jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.startActivity((Intent)localObject);
      b = false;
      return;
    }
    switch (((PhoneContactManagerImp)localObject).d())
    {
    case 2: 
    case 3: 
    case 4: 
    default: 
      if ((((PhoneContactManagerImp)localObject).a() != null) && (aisStopFindMatch))
      {
        localObject = new Intent(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity, PhoneLaunchActivity.class);
        ((Intent)localObject).putExtra("needAlert", true);
        ((Intent)localObject).putExtra("fromStopAndMatch", true);
        ((Intent)localObject).putExtra("fromAVCallInvite", true);
        ((Intent)localObject).putExtra("leftViewText", "返回");
        jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.startActivity((Intent)localObject);
      }
      break;
    }
    for (;;)
    {
      b = true;
      return;
      localObject = new Intent(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity, BindNumberActivity.class);
      ((Intent)localObject).putExtra("key_is_from_qav_multi_call", true);
      jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.startActivity((Intent)localObject);
      b = true;
      return;
      jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a(0);
      b = false;
      return;
      localObject = new Intent(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity, PhoneFrameActivity.class);
      ((Intent)localObject).putExtra("key_req_type", 6);
      ((Intent)localObject).putExtra("kSrouce", 6);
      jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.startActivity((Intent)localObject);
    }
  }
  
  public String a()
  {
    return null;
  }
  
  public List a()
  {
    boolean bool = true;
    if (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a() == 0)
    {
      jdField_a_of_type_Boolean = true;
      jdField_a_of_type_ComTencentWidgetPinnedFooterExpandableListView.setFooterEnable(false);
    }
    Object localObject;
    QQAppInterface localQQAppInterface;
    long l;
    if (jdField_a_of_type_JavaUtilList == null)
    {
      localObject = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
      localObject = jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity;
      localQQAppInterface = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
      l = IContactSearchable.B;
      if (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.u) {
        break label101;
      }
    }
    for (;;)
    {
      jdField_a_of_type_JavaUtilList = SearchResultDialog.a((Context)localObject, localQQAppInterface, l, 0, bool, jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.i);
      return jdField_a_of_type_JavaUtilList;
      label101:
      bool = false;
    }
  }
  
  public void a()
  {
    super.a();
    if ((b) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null))
    {
      PhoneContactManagerImp localPhoneContactManagerImp = (PhoneContactManagerImp)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(10);
      if (localPhoneContactManagerImp != null)
      {
        int i = localPhoneContactManagerImp.d();
        if ((i != 5) && (i != 6)) {}
      }
    }
    try
    {
      jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a(0);
      return;
    }
    finally
    {
      b = false;
    }
  }
  
  public void a(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.a(paramInt1, paramInt2, paramIntent);
  }
  
  public void a(Bundle paramBundle)
  {
    super.a(paramBundle);
    a(2130903739);
    jdField_a_of_type_ComTencentWidgetPinnedFooterExpandableListView = ((PinnedFooterExpandableListView)findViewById(2131299813));
    jdField_a_of_type_Boolean = false;
    if (QLog.isColorLevel()) {
      QLog.d("FriendTabView", 2, "firstUserClicked is " + jdField_a_of_type_Boolean);
    }
    if (!jdField_a_of_type_Boolean)
    {
      jdField_a_of_type_ComTencentWidgetPinnedFooterExpandableListView.setFooterEnable(true);
      jdField_a_of_type_ComTencentWidgetPinnedFooterExpandableListView.setListener(new mkx(this));
      paramBundle = (LinearLayout)jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getLayoutInflater().inflate(2130904870, null);
      jdField_a_of_type_ComTencentWidgetPinnedFooterExpandableListView.a(paramBundle);
      paramBundle.findViewById(2131304245).setOnClickListener(new mky(this));
      QLog.d("FriendTabView", 2, "----->onCreate");
      jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberBuddyListAdapter = new SelectMemberBuddyListAdapter(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentWidgetPinnedFooterExpandableListView, new mkz(this));
      jdField_a_of_type_ComTencentWidgetPinnedFooterExpandableListView.setAdapter(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberBuddyListAdapter);
      jdField_a_of_type_ComTencentWidgetPinnedFooterExpandableListView.setSelector(2131427378);
      jdField_a_of_type_ComTencentWidgetPinnedFooterExpandableListView.setGroupIndicator(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getResources().getDrawable(2130838230));
      jdField_a_of_type_ComTencentWidgetPinnedFooterExpandableListView.setOnScrollListener(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberBuddyListAdapter);
      paramBundle = (PhoneContactManagerImp)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(10);
      if (((paramBundle != null) && (!paramBundle.c()) && (paramBundle.d() == 5)) && (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.L != 10)) {
        break label300;
      }
    }
    label300:
    for (boolean bool = true;; bool = false)
    {
      c = bool;
      d = ConfigSystemImpl.b(getContext());
      return;
      jdField_a_of_type_ComTencentWidgetPinnedFooterExpandableListView.setFooterEnable(false);
      break;
    }
  }
  
  public void b()
  {
    super.b();
    if (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberBuddyListAdapter != null) {
      jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberBuddyListAdapter.b();
    }
    d = false;
  }
  
  public void b(Bundle paramBundle)
  {
    super.b(paramBundle);
    c();
  }
  
  public void c()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberBuddyListAdapter != null) {
      jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberBuddyListAdapter.a();
    }
  }
  
  public void onClick(View paramView) {}
}
