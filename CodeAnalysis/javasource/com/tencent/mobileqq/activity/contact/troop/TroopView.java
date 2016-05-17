package com.tencent.mobileqq.activity.contact.troop;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Message;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup.LayoutParams;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.mobileqq.activity.ChatActivityConstants;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.adapter.TroopListAdapter2;
import com.tencent.mobileqq.adapter.TroopListAdapter2.OnTroopListClickListener;
import com.tencent.mobileqq.adapter.TroopListAdapter2.TroopListItem;
import com.tencent.mobileqq.app.BizTroopObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopHandler;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.data.TroopInfo;
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
import com.tencent.mobileqq.widget.ShaderAnimLayout;
import com.tencent.mobileqq.widget.SlideDetectListView;
import com.tencent.mobileqq.widget.SlideDetectListView.OnSlideListener;
import com.tencent.open.agent.report.ReportCenter;
import com.tencent.widget.ListView;
import com.tencent.widget.OverScrollViewListener;
import cooperation.dingdong.DingdongOpenIdProvider;
import java.util.ArrayList;
import java.util.List;
import lue;
import luf;
import lug;
import tencent.im.oidb.cmd0x589.oidb_0x589.GetUserOpenIdReq;

public class TroopView
  extends BaseTroopView
  implements View.OnClickListener, TroopListAdapter2.OnTroopListClickListener, SlideDetectListView.OnSlideListener, OverScrollViewListener
{
  protected static final String a = "TroopView";
  protected static final String b = "rec_last_troop_list_refresh_time";
  static final int jdField_c_of_type_Int = 101;
  static final int d = 103;
  static final int e = 1000;
  private long jdField_a_of_type_Long;
  TextView jdField_a_of_type_AndroidWidgetTextView;
  protected ShowExternalTroopListActivity.IShowExternalTroopDataChangedCallBack a;
  protected TroopView.MyFriendListObserver a;
  protected TroopView.MyMessageObserver a;
  protected TroopView.MyTroopObserver a;
  public TroopListAdapter2 a;
  BizTroopObserver jdField_a_of_type_ComTencentMobileqqAppBizTroopObserver;
  protected PullRefreshHeader a;
  SlideDetectListView jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView;
  private DingdongOpenIdProvider jdField_a_of_type_CooperationDingdongDingdongOpenIdProvider;
  int b;
  boolean jdField_c_of_type_Boolean;
  protected boolean d;
  protected View e;
  
  public TroopView(Context paramContext, boolean paramBoolean, ShowExternalTroopListActivity.IShowExternalTroopDataChangedCallBack paramIShowExternalTroopDataChangedCallBack)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    c = false;
    jdField_a_of_type_ComTencentMobileqqActivityContactTroopTroopView$MyFriendListObserver = new TroopView.MyFriendListObserver(this);
    jdField_a_of_type_ComTencentMobileqqActivityContactTroopTroopView$MyTroopObserver = new TroopView.MyTroopObserver(this);
    jdField_a_of_type_ComTencentMobileqqActivityContactTroopTroopView$MyMessageObserver = new TroopView.MyMessageObserver(this);
    e = null;
    jdField_a_of_type_AndroidWidgetTextView = null;
    d = false;
    jdField_a_of_type_ComTencentMobileqqAppBizTroopObserver = new luf(this);
    d = paramBoolean;
    jdField_a_of_type_ComTencentMobileqqActivityContactTroopShowExternalTroopListActivity$IShowExternalTroopDataChangedCallBack = paramIShowExternalTroopDataChangedCallBack;
  }
  
  private long a()
  {
    return a().getSharedPreferences("rec_last_troop_list_refresh_time", 0).getLong("rec_last_troop_list_refresh_time", 0L);
  }
  
  private void c(int paramInt)
  {
    Object localObject2 = a();
    if ((localObject2 == null) || (jdField_a_of_type_ComTencentMobileqqAdapterTroopListAdapter2 == null)) {}
    do
    {
      int i;
      do
      {
        return;
        if (paramInt == 0)
        {
          jdField_a_of_type_AndroidWidgetTextView.setVisibility(4);
          return;
        }
        i = paramInt - 1;
      } while ((i < 0) || (i >= jdField_a_of_type_ComTencentMobileqqAdapterTroopListAdapter2.getCount()));
      localObject1 = jdField_a_of_type_ComTencentMobileqqAdapterTroopListAdapter2.getItem(i);
    } while (!(localObject1 instanceof TroopListAdapter2.TroopListItem));
    TroopListAdapter2.TroopListItem localTroopListItem = (TroopListAdapter2.TroopListItem)localObject1;
    Object localObject1 = null;
    switch (i)
    {
    default: 
      label128:
      if (paramInt < jdField_a_of_type_ComTencentMobileqqAdapterTroopListAdapter2.getCount())
      {
        localObject2 = (TroopListAdapter2.TroopListItem)jdField_a_of_type_ComTencentMobileqqAdapterTroopListAdapter2.getItem(paramInt);
        if ((i != 6) && (i != 4) && (i != 2)) {
          break label393;
        }
        localObject2 = jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.getChildAt(0);
        if (localObject2 != null)
        {
          paramInt = ((View)localObject2).getBottom();
          localObject2 = (RelativeLayout.LayoutParams)jdField_a_of_type_AndroidWidgetTextView.getLayoutParams();
          if (paramInt >= b) {
            break label384;
          }
          topMargin = (paramInt - b);
          label232:
          jdField_a_of_type_AndroidWidgetTextView.setLayoutParams((ViewGroup.LayoutParams)localObject2);
          jdField_a_of_type_AndroidWidgetTextView.requestLayout();
        }
      }
      break;
    }
    while (!TextUtils.isEmpty((CharSequence)localObject1))
    {
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
      jdField_a_of_type_AndroidWidgetTextView.setText((CharSequence)localObject1);
      return;
      localObject1 = ((Activity)localObject2).getString(2131364108, new Object[] { String.valueOf(jdField_a_of_type_ComTencentMobileqqAdapterTroopListAdapter2.g) });
      break label128;
      localObject1 = ((Activity)localObject2).getString(2131364111, new Object[] { String.valueOf(jdField_a_of_type_ComTencentMobileqqAdapterTroopListAdapter2.f) });
      break label128;
      localObject1 = ((Activity)localObject2).getString(2131364109, new Object[] { String.valueOf(jdField_a_of_type_ComTencentMobileqqAdapterTroopListAdapter2.d) });
      break label128;
      localObject1 = ((Activity)localObject2).getString(2131364110, new Object[] { String.valueOf(jdField_a_of_type_ComTencentMobileqqAdapterTroopListAdapter2.e) });
      break label128;
      label384:
      topMargin = 0;
      break label232;
      label393:
      localObject2 = (RelativeLayout.LayoutParams)jdField_a_of_type_AndroidWidgetTextView.getLayoutParams();
      if (topMargin != 0)
      {
        topMargin = 0;
        jdField_a_of_type_AndroidWidgetTextView.setLayoutParams((ViewGroup.LayoutParams)localObject2);
        jdField_a_of_type_AndroidWidgetTextView.requestLayout();
      }
    }
  }
  
  private boolean c()
  {
    if (NetworkUtil.g(a()))
    {
      ((TroopHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(20)).a();
      c = true;
      return true;
    }
    return false;
  }
  
  private void k()
  {
    b = getResources().getDimensionPixelSize(2131493335);
  }
  
  private void l()
  {
    jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView = ((SlideDetectListView)findViewById(2131300289));
    LayoutInflater localLayoutInflater = LayoutInflater.from(a());
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131299438));
    Object localObject;
    if (d)
    {
      localObject = localLayoutInflater.inflate(2130903875, jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView, false);
      ((TextView)((View)localObject).findViewById(2131300376)).setText(a().getString(2131364735));
      jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.a((View)localObject);
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader = ((PullRefreshHeader)localLayoutInflater.inflate(2130903467, jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView, false));
      jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.setTranscriptMode(0);
      jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.setContentBackground(2130837739);
      jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.setOverScrollHeader(jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader);
      jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.setOverScrollListener(this);
      if (!jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.a()) {
        jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.setOnSlideListener(this);
      }
      return;
      e = localLayoutInflater.inflate(2130904750, jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView, false);
      e.findViewById(2131300492).setVisibility(8);
      localObject = (EditText)e.findViewById(2131300511);
      ((EditText)localObject).setFocusableInTouchMode(false);
      ((EditText)localObject).setOnClickListener(this);
      ((EditText)localObject).setCursorVisible(false);
      jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.a(e);
    }
  }
  
  private void m()
  {
    long l = System.currentTimeMillis();
    a().getSharedPreferences("rec_last_troop_list_refresh_time", 0).edit().putLong("rec_last_troop_list_refresh_time", l).commit();
  }
  
  public void a()
  {
    if (jdField_a_of_type_ComTencentMobileqqAdapterTroopListAdapter2 != null) {
      jdField_a_of_type_ComTencentMobileqqAdapterTroopListAdapter2.notifyDataSetChanged();
    }
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
    a(2130903852);
    l();
    k();
    a(jdField_a_of_type_ComTencentMobileqqActivityContactTroopTroopView$MyFriendListObserver);
    a(jdField_a_of_type_ComTencentMobileqqActivityContactTroopTroopView$MyMessageObserver);
    a(jdField_a_of_type_ComTencentMobileqqAppBizTroopObserver);
    a(jdField_a_of_type_ComTencentMobileqqActivityContactTroopTroopView$MyTroopObserver);
    if (jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.a())
    {
      jdField_a_of_type_Int = 6;
      return;
    }
    jdField_a_of_type_Int = 1;
  }
  
  public void a(TroopInfo paramTroopInfo, int paramInt)
  {
    Object localObject1 = jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.a().getIntent();
    Object localObject2;
    if (((Intent)localObject1).getBooleanExtra("param_from_dingdong_office", false))
    {
      localObject2 = new QQProgressDialog(jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.a(), getResources().getDimensionPixelSize(2131492908));
      ((QQProgressDialog)localObject2).show();
      localArrayList = new ArrayList(1);
      localGetUserOpenIdReq = new oidb_0x589.GetUserOpenIdReq();
      localGetUserOpenIdReq.setHasFlag(true);
      uint32_req_flag.set(2);
      uint64_req_uin.set(Long.parseLong(jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.a().a()));
      uint64_req_host_uin.set(Long.parseLong(troopuin));
      localArrayList.add(localGetUserOpenIdReq);
      jdField_a_of_type_CooperationDingdongDingdongOpenIdProvider = new DingdongOpenIdProvider(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      jdField_a_of_type_Long = jdField_a_of_type_CooperationDingdongDingdongOpenIdProvider.a(((Intent)localObject1).getLongExtra("param_dingdong_appId", 0L), localArrayList, false, new lug(this, (QQProgressDialog)localObject2));
    }
    while ((d) || (paramTroopInfo == null))
    {
      ArrayList localArrayList;
      oidb_0x589.GetUserOpenIdReq localGetUserOpenIdReq;
      return;
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.a())
    {
      localObject1 = jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.a();
      if (localObject1 != null)
      {
        localObject2 = new Bundle();
        ((Bundle)localObject2).putString("uin", troopuin);
        ((Bundle)localObject2).putInt("uintype", 1);
        ((Bundle)localObject2).putString("troop_uin", troopuin);
        ((Bundle)localObject2).putString("uinname", troopname);
        ((Bundle)localObject2).putBoolean("forward_report_confirm", true);
        ((Bundle)localObject2).putString("forward_report_confirm_action_name", "0X8005A11");
        ((ForwardBaseOption)localObject1).a(ForwardAbility.ForwardAbilityType.c.intValue(), (Bundle)localObject2);
      }
      switch (paramInt)
      {
      case 2: 
      case 4: 
      case 6: 
      default: 
        paramInt = 0;
      }
      for (;;)
      {
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_contacts", "", "choose_grp", "turn", 0, 0, troopuin + "", String.valueOf(paramInt), "", "");
        paramTroopInfo = "";
        try
        {
          long l = jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.a().getIntent().getLongExtra("req_share_id", 0L);
          if (l > 0L) {
            paramTroopInfo = String.valueOf(l);
          }
        }
        catch (Exception paramTroopInfo)
        {
          for (;;)
          {
            paramTroopInfo = "";
          }
        }
        ReportCenter.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount(), "", paramTroopInfo, "1000", "31", "0", false);
        return;
        paramInt = 0;
        continue;
        paramInt = 1;
        continue;
        paramInt = 2;
        continue;
        paramInt = 3;
      }
    }
    int i;
    switch (paramInt)
    {
    case 2: 
    case 4: 
    case 6: 
    default: 
      paramInt = 0;
      switch (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.b(troopuin))
      {
      default: 
        i = 0;
      }
      break;
    }
    for (;;)
    {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_contacts", "", "choose_grp", "grplist", 0, 0, troopuin + "", String.valueOf(paramInt), i + "", "");
      a(troopuin, troopname);
      return;
      paramInt = 0;
      break;
      paramInt = 1;
      break;
      paramInt = 2;
      break;
      paramInt = 3;
      break;
      i = 0;
      continue;
      i = 2;
      continue;
      i = 3;
      continue;
      i = 1;
    }
  }
  
  public void a(SlideDetectListView paramSlideDetectListView, View paramView, int paramInt)
  {
    if (d) {}
    TroopInfo localTroopInfo;
    Button localButton;
    do
    {
      do
      {
        do
        {
          return;
          localTroopInfo = jdField_a_of_type_ComTencentMobileqqAdapterTroopListAdapter2.a(paramInt);
        } while (localTroopInfo == null);
        paramView = (ShaderAnimLayout)paramView.findViewById(2131299440);
      } while (paramView == null);
      localButton = (Button)paramView.findViewById(2131299441);
    } while (localButton == null);
    paramSlideDetectListView.setDeleteAreaWidth(getLayoutParamswidth);
    paramSlideDetectListView = (TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51);
    Activity localActivity = a();
    if (paramSlideDetectListView.a(troopuin)) {}
    for (paramInt = 2131364114;; paramInt = 2131364113)
    {
      paramSlideDetectListView = localActivity.getString(paramInt);
      localButton.setText(paramSlideDetectListView);
      localButton.setVisibility(0);
      localButton.setTag(localTroopInfo);
      if (ChatActivityConstants.F) {
        localButton.setContentDescription(paramSlideDetectListView);
      }
      paramView.a();
      return;
    }
  }
  
  void a(String paramString1, String paramString2)
  {
    ThreadPriorityManager.a(true);
    Intent localIntent = AIOUtils.a(new Intent(a(), SplashActivity.class), null);
    localIntent.putExtra("uin", paramString1);
    paramString1 = ((TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51)).a(paramString1);
    if ((paramString1 != null) && (troopcode != null)) {
      localIntent.putExtra("troop_uin", troopcode);
    }
    localIntent.putExtra("uintype", 1);
    localIntent.putExtra("uinname", paramString2);
    a(localIntent);
  }
  
  public boolean a(int paramInt, View paramView, ListView paramListView)
  {
    jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader.c(a());
    if (!c()) {
      a(103, 1000L);
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
      jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.H();
      continue;
      jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.H();
      b(2131368310);
    }
  }
  
  public void b()
  {
    super.b();
    if (jdField_a_of_type_ComTencentMobileqqAdapterTroopListAdapter2 == null) {
      if (!jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.a()) {
        break label92;
      }
    }
    label92:
    for (int i = 1;; i = 0)
    {
      jdField_a_of_type_ComTencentMobileqqAdapterTroopListAdapter2 = new TroopListAdapter2(a(), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, this, jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView, i, d, jdField_a_of_type_ComTencentMobileqqActivityContactTroopShowExternalTroopListActivity$IShowExternalTroopDataChangedCallBack);
      jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.setAdapter(jdField_a_of_type_ComTencentMobileqqAdapterTroopListAdapter2);
      jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.setOnScrollGroupFloatingListener(new lue(this));
      jdField_a_of_type_ComTencentMobileqqAdapterTroopListAdapter2.notifyDataSetChanged();
      return;
    }
  }
  
  public void b(int paramInt, View paramView, ListView paramListView)
  {
    jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader.b(a());
  }
  
  public void b(SlideDetectListView paramSlideDetectListView, View paramView, int paramInt)
  {
    if (jdField_a_of_type_ComTencentMobileqqAdapterTroopListAdapter2.a(paramInt) == null) {}
    do
    {
      do
      {
        return;
        paramSlideDetectListView = (ShaderAnimLayout)paramView.findViewById(2131299440);
      } while (paramSlideDetectListView == null);
      paramSlideDetectListView.d();
      paramSlideDetectListView = (Button)paramSlideDetectListView.findViewById(2131299441);
    } while (paramSlideDetectListView == null);
    paramSlideDetectListView.setTag(null);
  }
  
  public void c(int paramInt, View paramView, ListView paramListView) {}
  
  protected void h()
  {
    super.h();
    if (jdField_a_of_type_ComTencentMobileqqAdapterTroopListAdapter2 != null) {
      jdField_a_of_type_ComTencentMobileqqAdapterTroopListAdapter2.b();
    }
    b(jdField_a_of_type_ComTencentMobileqqActivityContactTroopTroopView$MyFriendListObserver);
    b(jdField_a_of_type_ComTencentMobileqqActivityContactTroopTroopView$MyMessageObserver);
    b(jdField_a_of_type_ComTencentMobileqqAppBizTroopObserver);
    b(jdField_a_of_type_ComTencentMobileqqActivityContactTroopTroopView$MyTroopObserver);
    if (jdField_a_of_type_ComTencentMobileqqAdapterTroopListAdapter2 != null) {
      jdField_a_of_type_ComTencentMobileqqAdapterTroopListAdapter2.b();
    }
    if (jdField_a_of_type_CooperationDingdongDingdongOpenIdProvider != null) {
      jdField_a_of_type_CooperationDingdongDingdongOpenIdProvider.a();
    }
  }
  
  public void j()
  {
    ContactSearchComponentActivity.a(a(), null, 8, 16, 561250);
  }
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default: 
      return;
    }
    j();
  }
}
