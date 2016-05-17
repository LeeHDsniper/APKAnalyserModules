package com.tencent.mobileqq.activity.contact.troop;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Handler;
import android.text.TextUtils;
import android.text.TextUtils.TruncateAt;
import android.util.DisplayMetrics;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup.LayoutParams;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.biz.ui.MultiLineLayout;
import com.tencent.mobileqq.activity.ChatSettingForTroop;
import com.tencent.mobileqq.activity.TroopInfoActivity;
import com.tencent.mobileqq.adapter.ShowExternalTroopListAdapter;
import com.tencent.mobileqq.adapter.ShowExternalTroopListAdapter.OnTroopListClickListener;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.IphoneTitleBarActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopHandler;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.app.TroopObserver;
import com.tencent.mobileqq.data.Card;
import com.tencent.mobileqq.data.TroopMemberCard;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.utils.StackBlur;
import com.tencent.mobileqq.widget.PullRefreshHeader;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.mobileqq.widget.RedDotTextView;
import com.tencent.widget.ListView;
import com.tencent.widget.OverScrollViewListener;
import com.tencent.widget.XListView;
import com.tencent.widget.immersive.ImmersiveUtils;
import java.util.List;
import ltq;
import ltr;
import lts;
import ltt;

public class ShowExternalTroopListActivity
  extends IphoneTitleBarActivity
  implements View.OnClickListener, ShowExternalTroopListAdapter.OnTroopListClickListener, OverScrollViewListener
{
  public static final int a = 0;
  public static final String a = "isHost";
  public static final int b = 1;
  public static final String b = "dest_uin_str";
  public static final String c = "from_troop_uin";
  public static final int d = 1;
  public static final String d = "is_from_show_ext_troop_list";
  static final int e = 100;
  public static final String e = "from";
  static final int f = 101;
  static final int jdField_g_of_type_Int = 1000;
  public static final String h = "isDataChanged";
  protected static final String i = "rec_last_ext_show_troop_list_refresh_time";
  public Activity a;
  public Handler a;
  public View.OnClickListener a;
  protected View a;
  protected Button a;
  protected RelativeLayout a;
  protected TextView a;
  public ShowExternalTroopListAdapter a;
  protected TroopManager a;
  protected TroopObserver a;
  public PullRefreshHeader a;
  protected RedDotTextView a;
  public XListView a;
  public boolean a;
  protected TextView b;
  public boolean b;
  public int c;
  protected TextView c;
  protected boolean c;
  public TextView d;
  public String f;
  String jdField_g_of_type_JavaLangString;
  
  public ShowExternalTroopListActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
    f = null;
    g = null;
    jdField_c_of_type_Int = 0;
    jdField_b_of_type_Boolean = false;
    jdField_a_of_type_ComTencentMobileqqAppTroopObserver = new ltq(this);
    jdField_a_of_type_AndroidViewView$OnClickListener = new lts(this);
    jdField_c_of_type_Boolean = false;
    jdField_a_of_type_AndroidOsHandler = new ltt(this);
  }
  
  private long a()
  {
    return getActivity().getSharedPreferences("rec_last_ext_show_troop_list_refresh_time", 0).getLong("rec_last_ext_show_troop_list_refresh_time", 0L);
  }
  
  private boolean a()
  {
    if (NetworkUtil.g(getActivity()))
    {
      ((TroopHandler)app.a(20)).a(f, 0, 0);
      jdField_b_of_type_Boolean = true;
      return true;
    }
    QQToast.a(this, 2130838329, getString(2131364053), 0).b(getResources().getDimensionPixelSize(2131492908));
    return false;
  }
  
  private void b()
  {
    setContentViewNoTitle(2130903874);
    Object localObject1 = (LinearLayout)findViewById(2131296923);
    if (ImmersiveUtils.isSupporImmersive() == 1) {
      ((LinearLayout)localObject1).setFitsSystemWindows(true);
    }
    setTitle(2131364740);
    jdField_b_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131297035));
    Intent localIntent = getIntent();
    jdField_a_of_type_Boolean = localIntent.getExtras().getBoolean("isHost");
    Object localObject2 = localIntent.getExtras().getString("leftViewText");
    localObject1 = localObject2;
    if (localObject2 == null) {
      localObject1 = getString(2131367694);
    }
    jdField_b_of_type_AndroidWidgetTextView.setText((CharSequence)localObject1);
    jdField_b_of_type_AndroidWidgetTextView.setOnClickListener(this);
    jdField_a_of_type_ComTencentMobileqqWidgetRedDotTextView = ((RedDotTextView)findViewById(2131297081));
    jdField_a_of_type_ComTencentMobileqqWidgetRedDotTextView.setContentDescription(getString(2131364739));
    jdField_a_of_type_ComTencentMobileqqWidgetRedDotTextView.setText(2131364738);
    jdField_a_of_type_ComTencentMobileqqWidgetRedDotTextView.setOnClickListener(this);
    String str;
    if (!jdField_a_of_type_Boolean)
    {
      jdField_a_of_type_ComTencentMobileqqWidgetRedDotTextView.setVisibility(8);
      IphoneTitleBarActivity.setLayerType(jdField_a_of_type_ComTencentMobileqqWidgetRedDotTextView);
      jdField_a_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)findViewById(2131300243));
      localObject1 = LayoutInflater.from(this).inflate(2130903873, null);
      d = ((TextView)((View)localObject1).findViewById(2131299438));
      d.setText(getString(2131364741));
      jdField_c_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131300245));
      jdField_a_of_type_AndroidWidgetButton = ((Button)findViewById(2131300375));
      jdField_a_of_type_AndroidWidgetButton.setOnClickListener(this);
      if (!jdField_a_of_type_Boolean) {
        jdField_a_of_type_AndroidWidgetButton.setVisibility(8);
      }
      jdField_a_of_type_ComTencentWidgetXListView = ((XListView)findViewById(2131300374));
      jdField_a_of_type_ComTencentWidgetXListView.setContentBackground(2130843006);
      jdField_a_of_type_AndroidViewView = LayoutInflater.from(this).inflate(2130903829, jdField_a_of_type_ComTencentWidgetXListView, false);
      jdField_a_of_type_ComTencentWidgetXListView.a(jdField_a_of_type_AndroidViewView);
      if (jdField_a_of_type_Boolean) {
        jdField_a_of_type_ComTencentWidgetXListView.a((View)localObject1);
      }
      f = localIntent.getExtras().getString("dest_uin_str");
      g = localIntent.getExtras().getString("from_troop_uin");
      jdField_a_of_type_ComTencentMobileqqAdapterShowExternalTroopListAdapter = new ShowExternalTroopListAdapter(getActivity(), app, this, jdField_a_of_type_ComTencentWidgetXListView, jdField_a_of_type_Boolean, f);
      jdField_a_of_type_ComTencentWidgetXListView.setAdapter(jdField_a_of_type_ComTencentMobileqqAdapterShowExternalTroopListAdapter);
      jdField_a_of_type_ComTencentMobileqqAdapterShowExternalTroopListAdapter.notifyDataSetChanged();
      jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader = ((PullRefreshHeader)LayoutInflater.from(this).inflate(2130903467, jdField_a_of_type_ComTencentWidgetXListView, false));
      jdField_a_of_type_ComTencentWidgetXListView.setOverScrollHeader(jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader);
      jdField_a_of_type_ComTencentWidgetXListView.setOverScrollListener(this);
      localObject2 = app;
      str = f;
      if (!jdField_a_of_type_Boolean) {
        break label546;
      }
    }
    label546:
    for (localObject1 = "0";; localObject1 = "1")
    {
      ReportController.b((QQAppInterface)localObject2, "P_CliOper", "Grp_join", "", "person_data", "exp_grp", 0, 0, str, (String)localObject1, "" + localIntent.getIntExtra("from", 0), "");
      return;
      jdField_a_of_type_ComTencentMobileqqWidgetRedDotTextView.setVisibility(0);
      break;
    }
  }
  
  private void c()
  {
    Object localObject1 = app.b(f);
    ImageView localImageView = (ImageView)jdField_a_of_type_AndroidViewView.findViewById(2131297451);
    localImageView.setImageDrawable((Drawable)localObject1);
    localObject1 = a(app.a(f, (byte)1, true));
    jdField_a_of_type_AndroidViewView.findViewById(2131296925).bringToFront();
    if (localObject1 != null) {}
    try
    {
      StackBlur.a((Bitmap)localObject1, 10);
      localObject1 = new BitmapDrawable((Bitmap)localObject1);
      jdField_a_of_type_AndroidViewView.findViewById(2131296923).setBackgroundDrawable((Drawable)localObject1);
      localObject1 = (TextView)jdField_a_of_type_AndroidViewView.findViewById(2131300241);
      Object localObject2 = (TextView)jdField_a_of_type_AndroidViewView.findViewById(2131296707);
      ((TextView)localObject2).setText(ContactUtils.a(app, f));
      if (jdField_a_of_type_Boolean) {
        ((TextView)localObject1).setText("我的群标签");
      }
      for (;;)
      {
        localImageView.setOnClickListener(new ltr(this, localImageView));
        return;
        ((TextView)localObject1).setText("他的群标签");
        if (g != null)
        {
          TroopMemberCard localTroopMemberCard = jdField_a_of_type_ComTencentMobileqqAppTroopManager.a(g, f);
          if (localTroopMemberCard != null)
          {
            if (sex == 1) {
              ((TextView)localObject1).setText("她的群标签");
            }
            ((TextView)localObject2).setText(nick);
          }
        }
        else
        {
          localObject2 = ((FriendsManager)app.getManager(50)).a(f);
          if ((localObject2 != null) && (shGender == 1)) {
            ((TextView)localObject1).setText("她的群标签");
          }
        }
      }
    }
    catch (OutOfMemoryError localOutOfMemoryError)
    {
      for (;;) {}
    }
  }
  
  private void d()
  {
    long l = System.currentTimeMillis();
    getActivity().getSharedPreferences("rec_last_ext_show_troop_list_refresh_time", 0).edit().putLong("rec_last_ext_show_troop_list_refresh_time", l).commit();
  }
  
  public Bitmap a(Bitmap paramBitmap)
  {
    int m = 0;
    if (paramBitmap == null)
    {
      paramBitmap = null;
      return paramBitmap;
    }
    int n = getResourcesgetDisplayMetricswidthPixels;
    int i1 = (int)(120.0F * mDensity);
    int j = paramBitmap.getHeight();
    int k = paramBitmap.getWidth();
    if (k * i1 > j * n)
    {
      i1 = n * j / i1;
      n = (k - i1) / 2;
      k = i1;
    }
    for (;;)
    {
      Bitmap localBitmap = Bitmap.createBitmap(paramBitmap, n, m, k, j);
      paramBitmap = localBitmap;
      if (localBitmap.isMutable()) {
        break;
      }
      paramBitmap = Bitmap.createScaledBitmap(localBitmap, localBitmap.getWidth() / 2, localBitmap.getHeight() / 2, true);
      if ((localBitmap != null) && (!localBitmap.isRecycled())) {
        localBitmap.recycle();
      }
      return paramBitmap;
      n = i1 * k / n;
      m = (j - n) / 2;
      j = n;
      n = 0;
    }
  }
  
  public void a()
  {
    if (jdField_b_of_type_Boolean) {
      return;
    }
    d.setVisibility(8);
    jdField_a_of_type_AndroidWidgetRelativeLayout.setVisibility(0);
    jdField_a_of_type_ComTencentWidgetXListView.setAdapter(null);
    if (jdField_a_of_type_Boolean)
    {
      jdField_c_of_type_AndroidWidgetTextView.setCompoundDrawablesWithIntrinsicBounds(0, 2130839629, 0, 0);
      jdField_c_of_type_AndroidWidgetTextView.setText(2131364743);
      ReportController.b(app, "P_CliOper", "Grp_join", "", "join_page", "exp_blank", 0, 0, "", "", "", "");
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentWidgetXListView.setEmptyView(jdField_a_of_type_AndroidWidgetRelativeLayout);
      return;
      jdField_c_of_type_AndroidWidgetTextView.setCompoundDrawablesWithIntrinsicBounds(0, 2130839598, 0, 0);
      jdField_c_of_type_AndroidWidgetTextView.setText(2131364745);
      QQToast.a(this, 1, getString(2131364746), 0).b(getTitleBarHeight());
    }
  }
  
  public void a(int paramInt, View paramView, ListView paramListView)
  {
    jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader.a(a());
  }
  
  public void a(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {
      return;
    }
    Bundle localBundle = TroopInfoActivity.a(paramString, 18);
    Activity localActivity = getActivity();
    if (jdField_a_of_type_Boolean) {}
    for (int j = 1;; j = 2)
    {
      ChatSettingForTroop.a(localActivity, localBundle, j);
      if (!jdField_a_of_type_Boolean) {
        break;
      }
      ReportController.b(app, "P_CliOper", "Grp_join", "", "join_page", "Clk_data", 0, 0, paramString, "1", "", "");
      return;
    }
    ReportController.b(app, "P_CliOper", "Grp_join", "", "join_page", "Clk_data", 0, 0, paramString, "0", "", "");
  }
  
  public void a(List paramList, boolean paramBoolean)
  {
    MultiLineLayout localMultiLineLayout = (MultiLineLayout)jdField_a_of_type_AndroidViewView.findViewById(2131300242);
    localMultiLineLayout.setShowLine(2);
    localMultiLineLayout.removeAllViews();
    if ((paramList == null) || (paramList.size() == 0)) {}
    for (;;)
    {
      return;
      int j = 0;
      while (j < paramList.size())
      {
        TextView localTextView = new TextView(this);
        localTextView.setBackgroundResource(2130839660);
        localTextView.setTextSize(2, 14.0F);
        if (paramBoolean) {
          localTextView.setMaxWidth((int)(77.0F * mDensity));
        }
        localTextView.setSingleLine();
        localTextView.setTextColor(-1);
        localTextView.setShadowLayer(0.0F, 0.0F, 2.0F, Color.parseColor("#000000"));
        localTextView.setGravity(17);
        localTextView.setText((CharSequence)paramList.get(j));
        localTextView.setEllipsize(TextUtils.TruncateAt.END);
        localMultiLineLayout.addView(localTextView, new ViewGroup.LayoutParams(-2, -2));
        localTextView.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
        j += 1;
      }
    }
  }
  
  public boolean a(int paramInt, View paramView, ListView paramListView)
  {
    jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader.c(a());
    if ((!a()) && (jdField_a_of_type_AndroidOsHandler != null)) {
      jdField_a_of_type_AndroidOsHandler.sendEmptyMessageDelayed(101, 1000L);
    }
    return true;
  }
  
  public void b(int paramInt, View paramView, ListView paramListView)
  {
    jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader.b(a());
  }
  
  public void c(int paramInt, View paramView, ListView paramListView) {}
  
  protected void doOnActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.doOnActivityResult(paramInt1, paramInt2, paramIntent);
    if ((paramInt2 == -1) && (paramInt1 == 1) && (paramIntent != null)) {
      jdField_c_of_type_Boolean = paramIntent.getBooleanExtra("isDataChanged", false);
    }
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    super.doOnCreate(paramBundle);
    jdField_a_of_type_AndroidAppActivity = this;
    jdField_a_of_type_ComTencentMobileqqAppTroopManager = ((TroopManager)app.getManager(51));
    addObserver(jdField_a_of_type_ComTencentMobileqqAppTroopObserver);
    b();
    return true;
  }
  
  protected void doOnDestroy()
  {
    removeObserver(jdField_a_of_type_ComTencentMobileqqAppTroopObserver);
    if (jdField_a_of_type_ComTencentMobileqqAdapterShowExternalTroopListAdapter != null) {
      jdField_a_of_type_ComTencentMobileqqAdapterShowExternalTroopListAdapter.b();
    }
    super.doOnDestroy();
  }
  
  protected boolean doOnKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    if (paramInt == 4)
    {
      Intent localIntent = new Intent();
      localIntent.putExtra("isDataChanged", jdField_c_of_type_Boolean);
      setResult(-1, localIntent);
    }
    return super.doOnKeyDown(paramInt, paramKeyEvent);
  }
  
  protected void doOnPause()
  {
    removeObserver(jdField_a_of_type_ComTencentMobileqqAppTroopObserver);
    super.doOnPause();
  }
  
  protected void doOnResume()
  {
    if (jdField_a_of_type_Boolean)
    {
      if ((jdField_a_of_type_ComTencentMobileqqAppTroopManager != null) && (jdField_a_of_type_ComTencentMobileqqAppTroopManager.b().size() == 0))
      {
        a();
        return;
      }
      jdField_a_of_type_AndroidWidgetRelativeLayout.setVisibility(8);
      jdField_a_of_type_ComTencentWidgetXListView.setAdapter(jdField_a_of_type_ComTencentMobileqqAdapterShowExternalTroopListAdapter);
    }
    a();
    c();
    super.doOnResume();
  }
  
  protected void doOnStart()
  {
    addObserver(jdField_a_of_type_ComTencentMobileqqAppTroopObserver);
    super.doOnStart();
  }
  
  public void onClick(View paramView)
  {
    int j = paramView.getId();
    switch (j)
    {
    default: 
    case 2131297081: 
    case 2131300375: 
      do
      {
        return;
        paramView = new Intent();
        paramView.putExtra("onlyOneSegement", true);
        paramView.putExtra("_key_mode", 0);
        paramView.putExtra("key_tab_mode", 1);
        paramView.putExtra("is_from_show_ext_troop_list", true);
        paramView.setClass(this, TroopActivity.class);
        startActivityForResult(paramView, 1);
        if (j == 2131297081)
        {
          ReportController.b(app, "P_CliOper", "Grp_join", "", "join_page", "Clk_mana", 0, 0, "", "", "", "");
          return;
        }
      } while (j != 2131300375);
      ReportController.b(app, "P_CliOper", "Grp_join", "", "join_page", "Clk_set", 0, 0, "", "", "", "");
      return;
    }
    paramView = new Intent();
    paramView.putExtra("isDataChanged", jdField_c_of_type_Boolean);
    setResult(-1, paramView);
    onBackPressed();
  }
}
