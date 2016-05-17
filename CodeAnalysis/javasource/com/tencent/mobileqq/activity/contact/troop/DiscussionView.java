package com.tencent.mobileqq.activity.contact.troop;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Message;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.selectmember.SelectMemberActivity;
import com.tencent.mobileqq.adapter.DiscussionListAdapter2;
import com.tencent.mobileqq.app.DiscussionHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.DiscussionInfo;
import com.tencent.mobileqq.forward.ForwardAbility.ForwardAbilityType;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.search.activity.ContactSearchComponentActivity;
import com.tencent.mobileqq.search.util.SearchUtils;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.util.ThreadPriorityManager;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.PullRefreshHeader;
import com.tencent.mobileqq.widget.QQProgressDialog;
import com.tencent.open.agent.report.ReportCenter;
import com.tencent.widget.ListView;
import com.tencent.widget.OverScrollViewListener;
import com.tencent.widget.XListView;
import cooperation.dingdong.DingdongOpenIdProvider;
import java.util.ArrayList;
import java.util.List;
import lsz;
import lta;
import tencent.im.oidb.cmd0x589.oidb_0x589.GetUserOpenIdReq;

public class DiscussionView
  extends BaseTroopView
  implements View.OnClickListener, OverScrollViewListener
{
  private static final String jdField_a_of_type_JavaLangString = "DiscussionView";
  static final int jdField_b_of_type_Int = 100;
  private static final String jdField_b_of_type_JavaLangString = "rec_last_discussion_list_refresh_time";
  static final int c = 102;
  static final int d = 1000;
  private long jdField_a_of_type_Long;
  Button jdField_a_of_type_AndroidWidgetButton;
  public DiscussionListAdapter2 a;
  private PullRefreshHeader jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader;
  public XListView a;
  private DingdongOpenIdProvider jdField_a_of_type_CooperationDingdongDingdongOpenIdProvider;
  private lta jdField_a_of_type_Lta;
  public boolean c;
  View e;
  
  public DiscussionView(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    c = false;
    jdField_a_of_type_Lta = new lta(this, null);
  }
  
  private long a()
  {
    return a().getSharedPreferences("rec_last_discussion_list_refresh_time", 0).getLong("rec_last_discussion_list_refresh_time", 0L);
  }
  
  private void a(String paramString1, String paramString2)
  {
    ThreadPriorityManager.a(true);
    Intent localIntent = AIOUtils.a(new Intent(a(), SplashActivity.class), null);
    localIntent.putExtra("uin", paramString1);
    localIntent.putExtra("uintype", 3000);
    localIntent.putExtra("uinname", paramString2);
    a(localIntent);
  }
  
  private boolean c()
  {
    if (NetworkUtil.g(a()))
    {
      c = true;
      ((DiscussionHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(6)).g(Long.valueOf(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a()).longValue());
      return true;
    }
    return false;
  }
  
  private void k()
  {
    e = findViewById(2131299389);
    jdField_a_of_type_AndroidWidgetButton = ((Button)e.findViewById(2131299391));
    e.setVisibility(8);
    jdField_a_of_type_ComTencentWidgetXListView = ((XListView)findViewById(2131299392));
    LayoutInflater localLayoutInflater = LayoutInflater.from(a());
    View localView = localLayoutInflater.inflate(2130904750, jdField_a_of_type_ComTencentWidgetXListView, false);
    localView.findViewById(2131300492).setVisibility(8);
    EditText localEditText = (EditText)localView.findViewById(2131300511);
    localEditText.setFocusableInTouchMode(false);
    localEditText.setOnClickListener(this);
    localEditText.setCursorVisible(false);
    jdField_a_of_type_ComTencentWidgetXListView.a(localView);
    jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader = ((PullRefreshHeader)localLayoutInflater.inflate(2130903467, jdField_a_of_type_ComTencentWidgetXListView, false));
    jdField_a_of_type_ComTencentWidgetXListView.setOverScrollHeader(jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader);
    jdField_a_of_type_ComTencentWidgetXListView.setOverScrollListener(this);
    jdField_a_of_type_ComTencentWidgetXListView.setContentBackground(2130837739);
    jdField_a_of_type_ComTencentWidgetXListView.setEmptyView(e);
    jdField_a_of_type_AndroidWidgetButton.setOnClickListener(this);
    jdField_a_of_type_ComTencentWidgetXListView.setVisibility(8);
  }
  
  private void l()
  {
    Intent localIntent = new Intent(a(), SelectMemberActivity.class);
    localIntent.putExtra("param_type", 3000);
    localIntent.putExtra("param_subtype", 0);
    localIntent.putExtra("param_from", 1002);
    localIntent.putExtra("param_min", 2);
    localIntent.putExtra("param_max", 49);
    b(localIntent, 1300);
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Contacts_tab", "Contacts_tab_creat_discuss", 0, 0, "", "", "", "");
  }
  
  public void a()
  {
    long l = System.currentTimeMillis();
    a().getSharedPreferences("rec_last_discussion_list_refresh_time", 0).edit().putLong("rec_last_discussion_list_refresh_time", l).commit();
  }
  
  public void a(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if (paramInt2 == -1) {
      switch (paramInt1)
      {
      }
    }
    do
    {
      return;
    } while (paramIntent == null);
    if (jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.a())
    {
      SearchUtils.a(paramIntent, jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.a());
      return;
    }
    a(paramIntent.getStringExtra("contactSearchResultTroopUin"), paramIntent.getStringExtra("contactSearchResultName"));
  }
  
  public void a(int paramInt, View paramView, ListView paramListView)
  {
    jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader.a(a());
  }
  
  protected void a(Intent paramIntent, BaseTroopView.ITroopContext paramITroopContext)
  {
    super.a(paramIntent, paramITroopContext);
    a(2130903623);
    k();
    jdField_a_of_type_ComTencentMobileqqAdapterDiscussionListAdapter2 = new DiscussionListAdapter2(a(), this, jdField_a_of_type_ComTencentWidgetXListView, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, false);
    jdField_a_of_type_ComTencentWidgetXListView.setAdapter(jdField_a_of_type_ComTencentMobileqqAdapterDiscussionListAdapter2);
    a(jdField_a_of_type_Lta);
    if (jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.a())
    {
      jdField_a_of_type_Int = 7;
      return;
    }
    jdField_a_of_type_Int = 2;
  }
  
  public void a(DiscussionInfo paramDiscussionInfo)
  {
    Object localObject1 = jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.a().getIntent();
    Object localObject2;
    if (((Intent)localObject1).getBooleanExtra("param_from_dingdong_office", false))
    {
      localObject2 = new QQProgressDialog(jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.a(), getResources().getDimensionPixelSize(2131492908));
      ((QQProgressDialog)localObject2).show();
      ArrayList localArrayList = new ArrayList(1);
      oidb_0x589.GetUserOpenIdReq localGetUserOpenIdReq = new oidb_0x589.GetUserOpenIdReq();
      localGetUserOpenIdReq.setHasFlag(true);
      uint32_req_flag.set(3);
      uint64_req_uin.set(Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.a().a()));
      uint64_req_host_uin.set(Long.parseLong(uin));
      localArrayList.add(localGetUserOpenIdReq);
      jdField_a_of_type_CooperationDingdongDingdongOpenIdProvider = new DingdongOpenIdProvider(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      jdField_a_of_type_Long = jdField_a_of_type_CooperationDingdongDingdongOpenIdProvider.a(((Intent)localObject1).getLongExtra("param_dingdong_appId", 0L), localArrayList, false, new lsz(this, (QQProgressDialog)localObject2));
      return;
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.a())
    {
      localObject1 = jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.a();
      if (localObject1 != null)
      {
        localObject2 = new Bundle();
        ((Bundle)localObject2).putString("uin", uin);
        ((Bundle)localObject2).putInt("uintype", 3000);
        ((Bundle)localObject2).putString("uinname", discussionName);
        ((Bundle)localObject2).putBoolean("forward_report_confirm", true);
        ((Bundle)localObject2).putString("forward_report_confirm_action_name", "0X8005A12");
        ((ForwardBaseOption)localObject1).a(ForwardAbility.ForwardAbilityType.d.intValue(), (Bundle)localObject2);
      }
      paramDiscussionInfo = "";
      try
      {
        long l = jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.a().getIntent().getLongExtra("req_share_id", 0L);
        if (l > 0L) {
          paramDiscussionInfo = String.valueOf(l);
        }
      }
      catch (Exception paramDiscussionInfo)
      {
        for (;;)
        {
          paramDiscussionInfo = "";
        }
      }
      ReportCenter.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), "", paramDiscussionInfo, "1000", "32", "0", false);
      return;
    }
    a(uin, discussionName);
  }
  
  public boolean a(int paramInt, View paramView, ListView paramListView)
  {
    jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader.c(a());
    if (!c()) {
      a(102, 1000L);
    }
    return true;
  }
  
  public boolean a(Message paramMessage)
  {
    switch (what)
    {
    }
    for (;;)
    {
      return true;
      jdField_a_of_type_ComTencentWidgetXListView.H();
      continue;
      jdField_a_of_type_ComTencentWidgetXListView.H();
      b(2131368310);
    }
  }
  
  public void b(int paramInt, View paramView, ListView paramListView)
  {
    jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader.b(a());
  }
  
  public void c(int paramInt, View paramView, ListView paramListView) {}
  
  public void e()
  {
    jdField_a_of_type_ComTencentMobileqqAdapterDiscussionListAdapter2.notifyDataSetChanged();
  }
  
  protected void h()
  {
    super.h();
    b(jdField_a_of_type_Lta);
    jdField_a_of_type_ComTencentMobileqqAdapterDiscussionListAdapter2.a();
    if (jdField_a_of_type_CooperationDingdongDingdongOpenIdProvider != null) {
      jdField_a_of_type_CooperationDingdongDingdongOpenIdProvider.a();
    }
  }
  
  public void j()
  {
    ContactSearchComponentActivity.a(a(), null, 5, 8, 561249);
  }
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default: 
      return;
    case 2131300511: 
      j();
      return;
    }
    l();
  }
}
