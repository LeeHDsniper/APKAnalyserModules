package com.tencent.mobileqq.activity.selectmember;

import SecurityAccountServer.RespondQueryQQBindingStat;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.graphics.Paint;
import android.os.Bundle;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup.LayoutParams;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.av.config.ConfigSystemImpl;
import com.tencent.common.app.InnerFrameManager;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.phone.BindNumberActivity;
import com.tencent.mobileqq.activity.phone.GuideBindPhoneActivity;
import com.tencent.mobileqq.activity.phone.PhoneFrameActivity;
import com.tencent.mobileqq.activity.phone.PhoneLaunchActivity;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.search.fragment.ContactSearchFragment;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.PinnedFooterExpandableListView;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.List;
import mlb;
import mlc;
import mle;

public class FriendTeamListInnerFrame
  extends SelectMemberInnerFrame
  implements View.OnClickListener
{
  public static final int a = -1;
  public static final String a = "FriendTeamListInnerFrameNew";
  private static final int jdField_b_of_type_Int = 0;
  private static final int jdField_c_of_type_Int = 1;
  private Button jdField_a_of_type_AndroidWidgetButton;
  private EditText jdField_a_of_type_AndroidWidgetEditText;
  private LinearLayout jdField_a_of_type_AndroidWidgetLinearLayout;
  private RelativeLayout jdField_a_of_type_AndroidWidgetRelativeLayout;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  private SelectMemberBuddyListAdapter jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberBuddyListAdapter;
  private FriendListObserver jdField_a_of_type_ComTencentMobileqqAppFriendListObserver;
  private PinnedFooterExpandableListView jdField_a_of_type_ComTencentWidgetPinnedFooterExpandableListView;
  List jdField_a_of_type_JavaUtilList;
  public boolean a;
  private Button jdField_b_of_type_AndroidWidgetButton;
  private SelectMemberBuddyListAdapter jdField_b_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberBuddyListAdapter;
  List jdField_b_of_type_JavaUtilList;
  boolean jdField_b_of_type_Boolean;
  private Button jdField_c_of_type_AndroidWidgetButton;
  boolean jdField_c_of_type_Boolean;
  private Button jdField_d_of_type_AndroidWidgetButton;
  boolean jdField_d_of_type_Boolean;
  
  public FriendTeamListInnerFrame(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilList = new ArrayList();
    jdField_a_of_type_Boolean = false;
    jdField_b_of_type_Boolean = false;
    jdField_c_of_type_Boolean = false;
    jdField_d_of_type_Boolean = false;
  }
  
  public FriendTeamListInnerFrame(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    jdField_a_of_type_JavaUtilList = new ArrayList();
    jdField_a_of_type_Boolean = false;
    jdField_b_of_type_Boolean = false;
    jdField_c_of_type_Boolean = false;
    jdField_d_of_type_Boolean = false;
  }
  
  public FriendTeamListInnerFrame(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    jdField_a_of_type_JavaUtilList = new ArrayList();
    jdField_a_of_type_Boolean = false;
    jdField_b_of_type_Boolean = false;
    jdField_c_of_type_Boolean = false;
    jdField_d_of_type_Boolean = false;
  }
  
  private boolean a()
  {
    return (jdField_d_of_type_Boolean) && (jdField_c_of_type_Boolean);
  }
  
  private void h() {}
  
  private void i()
  {
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005D0C", "0X8005D0C", 0, 0, "", "", "", "");
    Object localObject = (PhoneContactManagerImp)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(10);
    if (localObject == null)
    {
      jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a(2);
      jdField_b_of_type_Boolean = false;
      return;
    }
    if (!((PhoneContactManagerImp)localObject).e())
    {
      a(new Intent(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity, GuideBindPhoneActivity.class));
      jdField_b_of_type_Boolean = false;
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
      jdField_b_of_type_Boolean = true;
      return;
      localObject = new Intent(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity, BindNumberActivity.class);
      ((Intent)localObject).putExtra("key_is_from_qav_multi_call", true);
      jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.startActivity((Intent)localObject);
      jdField_b_of_type_Boolean = true;
      return;
      jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a(2);
      jdField_b_of_type_Boolean = false;
      return;
      localObject = new Intent(a(), PhoneFrameActivity.class);
      ((Intent)localObject).putExtra("key_req_type", 6);
      ((Intent)localObject).putExtra("kSrouce", 6);
      jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.startActivity((Intent)localObject);
    }
  }
  
  public ContactSearchFragment a()
  {
    int j = 1;
    int i = 1;
    if (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a() == 0)
    {
      jdField_a_of_type_Boolean = true;
      jdField_a_of_type_ComTencentWidgetPinnedFooterExpandableListView.setFooterEnable(false);
    }
    if (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.n)
    {
      j = i;
      if (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.m) {
        j = 5;
      }
      i = j;
      if (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.k) {
        i = j | 0x100;
      }
      j = i;
      if (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.j) {
        j = i | 0x800;
      }
    }
    return ContactSearchFragment.a(-1, j, null, jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.i, jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity);
  }
  
  public String a()
  {
    return null;
  }
  
  public void a()
  {
    super.a();
    if ((jdField_b_of_type_Boolean) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null))
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
      jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a(2);
      return;
    }
    finally
    {
      jdField_b_of_type_Boolean = false;
    }
  }
  
  public void a(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.a(paramInt1, paramInt2, paramIntent);
  }
  
  public void a(Bundle paramBundle)
  {
    super.a(paramBundle);
    Object localObject = a();
    jdField_a_of_type_ComTencentWidgetPinnedFooterExpandableListView = ((PinnedFooterExpandableListView)((Activity)localObject).getLayoutInflater().inflate(2130903739, null));
    jdField_a_of_type_Boolean = false;
    if (QLog.isColorLevel()) {
      QLog.d("FriendTeamListInnerFrameNew", 2, "firstUserClicked is " + jdField_a_of_type_Boolean);
    }
    int i;
    if (!jdField_a_of_type_Boolean)
    {
      jdField_a_of_type_ComTencentWidgetPinnedFooterExpandableListView.setFooterEnable(true);
      jdField_a_of_type_ComTencentWidgetPinnedFooterExpandableListView.setListener(new mlb(this));
      paramBundle = (LinearLayout)jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getLayoutInflater().inflate(2130903740, null);
      jdField_a_of_type_ComTencentWidgetPinnedFooterExpandableListView.a(paramBundle);
      QLog.d("FriendTeamListInnerFrameNew", 2, "----->onCreate");
      jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberBuddyListAdapter = new SelectMemberBuddyListAdapter((Context)localObject, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentWidgetPinnedFooterExpandableListView, new mlc(this));
      jdField_a_of_type_ComTencentWidgetPinnedFooterExpandableListView.setAdapter(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberBuddyListAdapter);
      jdField_a_of_type_ComTencentWidgetPinnedFooterExpandableListView.setSelector(2131427378);
      jdField_a_of_type_ComTencentWidgetPinnedFooterExpandableListView.setGroupIndicator(a().getResources().getDrawable(2130838230));
      jdField_a_of_type_ComTencentWidgetPinnedFooterExpandableListView.setOnScrollListener(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberBuddyListAdapter);
      setContentView(jdField_a_of_type_ComTencentWidgetPinnedFooterExpandableListView);
      jdField_a_of_type_AndroidWidgetLinearLayout = ((LinearLayout)paramBundle.findViewById(2131299814));
      jdField_a_of_type_AndroidWidgetButton = ((Button)paramBundle.findViewById(2131299815));
      jdField_a_of_type_AndroidWidgetButton.setVisibility(8);
      jdField_b_of_type_AndroidWidgetButton = ((Button)paramBundle.findViewById(2131299818));
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)paramBundle.findViewById(2131299819));
      jdField_a_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)paramBundle.findViewById(2131299817));
      jdField_c_of_type_AndroidWidgetButton = ((Button)paramBundle.findViewById(2131299820));
      localObject = (PhoneContactManagerImp)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(10);
      if ((localObject == null) || ((!((PhoneContactManagerImp)localObject).c()) && (((PhoneContactManagerImp)localObject).d() != 5))) {
        break label612;
      }
      i = 1;
      label352:
      if ((jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.L != 10) && (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.L != 11)) {
        break label617;
      }
    }
    label612:
    label617:
    for (boolean bool = true;; bool = false)
    {
      jdField_c_of_type_Boolean = bool;
      jdField_d_of_type_Boolean = ConfigSystemImpl.b(getContext());
      if ((!jdField_d_of_type_Boolean) || (i == 0) || (!jdField_c_of_type_Boolean)) {
        jdField_a_of_type_AndroidWidgetRelativeLayout.setVisibility(8);
      }
      if (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.n) {
        break label622;
      }
      jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(8);
      if (AppSetting.i)
      {
        jdField_a_of_type_AndroidWidgetButton.setContentDescription("人脉圈");
        jdField_b_of_type_AndroidWidgetButton.setContentDescription(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getString(2131369410));
        jdField_c_of_type_AndroidWidgetButton.setContentDescription("从群或讨论组中选择");
      }
      jdField_d_of_type_AndroidWidgetButton = ((Button)paramBundle.findViewById(2131299816));
      jdField_d_of_type_AndroidWidgetButton.setContentDescription(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getString(2131369388));
      jdField_d_of_type_AndroidWidgetButton.setOnClickListener(this);
      if (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getIntent().getBooleanExtra("multi_chat", false)) {
        jdField_d_of_type_AndroidWidgetButton.setVisibility(8);
      }
      if ((jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.l) && (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.m)) {
        jdField_c_of_type_AndroidWidgetButton.setVisibility(8);
      }
      jdField_a_of_type_ComTencentMobileqqAppFriendListObserver = new mle(this);
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
      return;
      jdField_a_of_type_ComTencentWidgetPinnedFooterExpandableListView.setFooterEnable(false);
      break;
      i = 0;
      break label352;
    }
    label622:
    if (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.j)
    {
      jdField_a_of_type_AndroidWidgetButton.setVisibility(8);
      label641:
      if (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.k) {
        break label682;
      }
      jdField_a_of_type_AndroidWidgetRelativeLayout.setVisibility(8);
    }
    for (;;)
    {
      jdField_c_of_type_AndroidWidgetButton.setOnClickListener(this);
      break;
      jdField_a_of_type_AndroidWidgetButton.setOnClickListener(this);
      break label641;
      label682:
      if (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), 0).getInt("select_member_contacts_flag", 0) == 1) {
        jdField_b_of_type_AndroidWidgetButton.setOnClickListener(this);
      } else {
        jdField_a_of_type_AndroidWidgetRelativeLayout.setVisibility(8);
      }
    }
  }
  
  public void b(Bundle paramBundle)
  {
    super.b(paramBundle);
    jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(false, jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getString(2131369857), jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.aa);
    f();
  }
  
  public void d()
  {
    super.d();
    if (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberBuddyListAdapter != null) {
      jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberBuddyListAdapter.b();
    }
    jdField_d_of_type_Boolean = false;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
  }
  
  public void f()
  {
    System.out.println("----->notifyDataSetChanged");
    if (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberBuddyListAdapter != null) {
      jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberBuddyListAdapter.a();
    }
  }
  
  void g()
  {
    int i = getResourcesgetDisplayMetricswidthPixels;
    int j = getResources().getDimensionPixelSize(2131493920);
    Paint localPaint = new Paint(1);
    localPaint.setColor(-1);
    localPaint.setTextSize(getResources().getDimensionPixelSize(2131493919));
    float f1 = localPaint.measureText(getResources().getString(2131369408));
    localPaint.setTextSize(getResources().getDimensionPixelSize(2131493918));
    float f2 = localPaint.measureText(getResources().getString(2131369409));
    if (i - j - f1 - f2 < 0.0F)
    {
      i = (int)(i - j - f1);
      jdField_a_of_type_AndroidWidgetTextView.getLayoutParams().width = i;
    }
    i = jdField_a_of_type_AndroidWidgetTextView.getLayoutParams().width;
  }
  
  public void onClick(View paramView)
  {
    if (paramView == jdField_a_of_type_AndroidWidgetButton)
    {
      jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a(1);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Friends_select", "Fs_tab_clk", 0, 0, "0", "", "", "");
    }
    do
    {
      do
      {
        do
        {
          return;
          if (paramView != jdField_b_of_type_AndroidWidgetButton) {
            break;
          }
          if (a()) {
            i();
          }
          for (;;)
          {
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Friends_select", "Fs_tab_clk", 0, 0, "1", "", "", "");
            if (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.L != 11) {
              break;
            }
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005525", "0X8005525", 0, 0, "", "", "", "");
            return;
            jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a(2);
            jdField_b_of_type_Boolean = false;
          }
        } while (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.L != 10);
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005520", "0X8005520", 0, 0, "", "", "", "");
        return;
        if (paramView != jdField_c_of_type_AndroidWidgetButton) {
          break;
        }
        jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a(4);
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005441", "0X8005441", 0, 0, "", "", "", "");
      } while (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.L != 12);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005A16", "0X8005A16", 0, 0, "", "", "", "");
      return;
    } while (paramView != jdField_d_of_type_AndroidWidgetButton);
    a(new Intent(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity, CreateFaceToFaceDiscussionActivity.class));
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005440", "0X8005440", 0, 0, "", "", "", "");
  }
}
