package com.tencent.mobileqq.activity;

import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.SystemClock;
import android.support.v4.view.ViewCompat;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.dataline.activities.LiteActivity;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.common.config.AppSetting;
import com.tencent.device.DeviceHeadMgr;
import com.tencent.device.datadef.DeviceInfo;
import com.tencent.device.devicemgr.SmartDeviceProxyMgr;
import com.tencent.device.utils.SmartDeviceUtil;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.photo.PhotoMagicStickUtils;
import com.tencent.mobileqq.activity.photo.PhotoUtils;
import com.tencent.mobileqq.activity.photo.SendPhotoActivity;
import com.tencent.mobileqq.adapter.ForwardRecentListAdapter;
import com.tencent.mobileqq.adapter.ForwardRecentListAdapter.ForwardViewHolder;
import com.tencent.mobileqq.app.AutomatorObserver;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.RegisterProxySvcPackHandler;
import com.tencent.mobileqq.app.TroopObserver;
import com.tencent.mobileqq.app.proxy.ProxyManager;
import com.tencent.mobileqq.app.proxy.RecentUserProxy;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.forward.ForwardAbility.ForwardAbilityType;
import com.tencent.mobileqq.forward.ForwardBaseActivity;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.forward.ForwardConstants;
import com.tencent.mobileqq.forward.ForwardH5PTVOption;
import com.tencent.mobileqq.forward.ForwardOptionBuilder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.search.activity.ContactSearchComponentActivity;
import com.tencent.mobileqq.search.util.SearchUtils;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.ForwardSendPicUtil;
import com.tencent.mobileqq.utils.StringUtil;
import com.tencent.open.agent.report.ReportCenter;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.AdapterView;
import com.tencent.widget.XListView;
import com.tencent.widget.immersive.ImmersiveUtils;
import ixn;
import ixo;
import ixp;
import ixq;
import ixr;
import ixs;
import ixt;
import ixu;
import ixw;
import ixx;
import ixy;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class ForwardRecentActivity
  extends ForwardBaseActivity
  implements ForwardConstants
{
  public static final int a = 10;
  static final String jdField_a_of_type_JavaLangString = "ForwardOption.ForwardEntranceActivity";
  public static final int b = 20000;
  public static final String b = "k_cancel_button";
  public static final int c = 20001;
  public static final String c = "k_forward_title";
  public static final int d = 20002;
  public static final String d = "call_by_forward";
  public static final int e = 20003;
  protected static final String e = "forward_type";
  protected static final String f = "forward_thumb";
  protected static final String g = "forward_text";
  protected static final String h = "key_jump_from_qzone_feed";
  protected static final String i = "key_jump_from_qzone_feed_left_title";
  public Uri a;
  Bundle jdField_a_of_type_AndroidOsBundle;
  private View.OnClickListener jdField_a_of_type_AndroidViewView$OnClickListener;
  View jdField_a_of_type_AndroidViewView;
  LinearLayout jdField_a_of_type_AndroidWidgetLinearLayout;
  RelativeLayout jdField_a_of_type_AndroidWidgetRelativeLayout;
  public TextView a;
  private ForwardRecentListAdapter jdField_a_of_type_ComTencentMobileqqAdapterForwardRecentListAdapter;
  private AutomatorObserver jdField_a_of_type_ComTencentMobileqqAppAutomatorObserver;
  private FriendListObserver jdField_a_of_type_ComTencentMobileqqAppFriendListObserver;
  private TroopObserver jdField_a_of_type_ComTencentMobileqqAppTroopObserver;
  public ForwardBaseOption a;
  private XListView jdField_a_of_type_ComTencentWidgetXListView;
  private List jdField_a_of_type_JavaUtilList;
  public boolean a;
  View jdField_b_of_type_AndroidViewView;
  private TextView jdField_b_of_type_AndroidWidgetTextView;
  boolean jdField_b_of_type_Boolean;
  View c;
  View d;
  View e;
  View f;
  View g;
  View h;
  View i;
  private View jdField_j_of_type_AndroidViewView;
  String jdField_j_of_type_JavaLangString;
  public String k;
  
  public ForwardRecentActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
    k = "";
    jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption = null;
    jdField_a_of_type_AndroidViewView$OnClickListener = new ixx(this);
    jdField_a_of_type_ComTencentMobileqqAppFriendListObserver = new ixy(this);
    jdField_a_of_type_ComTencentMobileqqAppTroopObserver = new ixo(this);
    jdField_a_of_type_ComTencentMobileqqAppAutomatorObserver = new ixp(this);
  }
  
  public static String a(Context paramContext, Uri paramUri)
  {
    String str = paramUri.getScheme();
    if ((str == null) || (str.equals("file"))) {
      return new File(paramUri.getPath()).getAbsolutePath();
    }
    if (str.equals("content")) {
      try
      {
        paramContext = paramContext.getContentResolver().query(paramUri, new String[] { "_data" }, null, null, null);
        int m = paramContext.getColumnIndexOrThrow("_data");
        paramContext.moveToFirst();
        paramUri = paramContext.getString(m);
        paramContext.close();
        return paramUri;
      }
      catch (Exception paramContext)
      {
        paramContext.printStackTrace();
        return null;
      }
    }
    return null;
  }
  
  private List a(List paramList)
  {
    return jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(paramList);
  }
  
  private void a()
  {
    jdField_a_of_type_AndroidWidgetLinearLayout = ((LinearLayout)super.findViewById(2131296923));
    if ((mNeedStatusTrans) && (ImmersiveUtils.isSupporImmersive() == 1))
    {
      jdField_a_of_type_AndroidWidgetLinearLayout.setFitsSystemWindows(true);
      jdField_a_of_type_AndroidWidgetLinearLayout.setPadding(0, ImmersiveUtils.a(this), 0, 0);
    }
    jdField_a_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)super.findViewById(2131297591));
    super.findViewById(2131297035).setVisibility(8);
    super.findViewById(2131297323).setVisibility(8);
    super.findViewById(2131297324).setVisibility(8);
    jdField_b_of_type_AndroidWidgetTextView = ((TextView)super.findViewById(2131297034));
    jdField_b_of_type_AndroidWidgetTextView.setText(jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a());
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)super.findViewById(2131297081));
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
    jdField_a_of_type_AndroidWidgetTextView.setText(2131366996);
    jdField_a_of_type_AndroidWidgetTextView.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
    jdField_a_of_type_ComTencentWidgetXListView = ((XListView)super.findViewById(2131297349));
    if (AppSetting.i) {
      ViewCompat.setImportantForAccessibility(jdField_a_of_type_ComTencentWidgetXListView, 2);
    }
    Object localObject = LayoutInflater.from(this);
    View localView = ((LayoutInflater)localObject).inflate(2130904750, jdField_a_of_type_ComTencentWidgetXListView, false);
    localView.findViewById(2131300492).setVisibility(8);
    EditText localEditText = (EditText)localView.findViewById(2131300511);
    localEditText.setFocusable(false);
    localEditText.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
    localEditText.setCursorVisible(false);
    jdField_a_of_type_ComTencentWidgetXListView.a(localView);
    jdField_j_of_type_AndroidViewView = ((LayoutInflater)localObject).inflate(2130903353, jdField_a_of_type_ComTencentWidgetXListView, false);
    if (Build.VERSION.SDK_INT >= 9) {
      jdField_j_of_type_AndroidViewView.setOverScrollMode(2);
    }
    jdField_a_of_type_ComTencentWidgetXListView.a(jdField_j_of_type_AndroidViewView);
    jdField_a_of_type_AndroidViewView = jdField_j_of_type_AndroidViewView.findViewById(2131298191);
    jdField_b_of_type_AndroidViewView = jdField_j_of_type_AndroidViewView.findViewById(2131298195);
    c = jdField_j_of_type_AndroidViewView.findViewById(2131297647);
    d = jdField_j_of_type_AndroidViewView.findViewById(2131297654);
    e = jdField_j_of_type_AndroidViewView.findViewById(2131298193);
    f = jdField_j_of_type_AndroidViewView.findViewById(2131298197);
    g = jdField_j_of_type_AndroidViewView.findViewById(2131298199);
    h = jdField_j_of_type_AndroidViewView.findViewById(2131298189);
    i = jdField_j_of_type_AndroidViewView.findViewById(2131298190);
    h.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
    i.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
    jdField_a_of_type_AndroidViewView.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
    jdField_b_of_type_AndroidViewView.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
    c.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
    d.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
    e.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
    f.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
    g.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
    localObject = ((LayoutInflater)localObject).inflate(2130903201, null);
    ((View)localObject).setFocusable(true);
    ((TextView)((View)localObject).findViewById(2131297601)).setText(2131367301);
    jdField_a_of_type_ComTencentWidgetXListView.a((View)localObject);
    if (jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(ForwardAbility.ForwardAbilityType.f)) {
      c();
    }
    if (jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(ForwardAbility.ForwardAbilityType.k)) {
      e();
    }
    if (jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(ForwardAbility.ForwardAbilityType.g)) {
      d();
    }
    if (jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(ForwardAbility.ForwardAbilityType.e)) {
      f();
    }
  }
  
  private void a(int paramInt)
  {
    int m = 32;
    if (jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(ForwardAbility.ForwardAbilityType.b)) {
      m = 33;
    }
    paramInt = m;
    if (jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(ForwardAbility.ForwardAbilityType.i)) {
      paramInt = m | 0x100;
    }
    m = paramInt;
    if (jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(ForwardAbility.ForwardAbilityType.j)) {
      m = paramInt | 0x4;
    }
    paramInt = m;
    if (jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(ForwardAbility.ForwardAbilityType.h)) {
      paramInt = m | 0x800;
    }
    m = paramInt;
    if (jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(ForwardAbility.ForwardAbilityType.d)) {
      m = paramInt | 0x8;
    }
    paramInt = m;
    if (jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(ForwardAbility.ForwardAbilityType.c)) {
      paramInt = m | 0x10;
    }
    ContactSearchComponentActivity.a(this, null, 7, paramInt, 561243);
    Contacts.a += 1;
    ReportController.b(app, "CliOper", "", "", "0X8004049", "0X8004049", 0, 0, "", "", "", "");
  }
  
  private void b()
  {
    if ((!jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(ForwardAbility.ForwardAbilityType.b)) && (!jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(ForwardAbility.ForwardAbilityType.c)) && (!jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(ForwardAbility.ForwardAbilityType.d)))
    {
      if (QLog.isColorLevel()) {
        QLog.w("ForwardOption.ForwardEntranceActivity", 2, "-->adjustEntryLayout--don't support friends, troop and discuss forward, remove mEntryHeader");
      }
      jdField_a_of_type_ComTencentWidgetXListView.a(jdField_j_of_type_AndroidViewView);
    }
    do
    {
      do
      {
        return;
        if ((!jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(ForwardAbility.ForwardAbilityType.b)) && (!jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(ForwardAbility.ForwardAbilityType.d)))
        {
          if (QLog.isColorLevel()) {
            QLog.w("ForwardOption.ForwardEntranceActivity", 2, "-->adjustEntryLayout--don't support friends and discuss forward, set newSessionBtn gone");
          }
          h.setVisibility(8);
        }
        if ((!jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(ForwardAbility.ForwardAbilityType.c)) && (!jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(ForwardAbility.ForwardAbilityType.d)))
        {
          if (QLog.isColorLevel()) {
            QLog.w("ForwardOption.ForwardEntranceActivity", 2, "-->adjustEntryLayout--don't support troop and discuss forward, set troopDiscussionBtn gone");
          }
          i.setVisibility(8);
        }
      } while (!(jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption instanceof ForwardH5PTVOption));
      if ((!jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(ForwardAbility.ForwardAbilityType.b)) && (!jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(ForwardAbility.ForwardAbilityType.c)))
      {
        if (QLog.isColorLevel()) {
          QLog.w("ForwardOption.ForwardEntranceActivity", 2, "-->adjustEntryLayout--don't support friends and troop forward, set newSessionBtn gone");
        }
        h.setVisibility(8);
      }
    } while (jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(ForwardAbility.ForwardAbilityType.b));
    if (QLog.isColorLevel()) {
      QLog.w("ForwardOption.ForwardEntranceActivity", 2, "-->adjustEntryLayout--don't support friends");
    }
    h.setVisibility(8);
  }
  
  private void c()
  {
    View localView = getLayoutInflater().inflate(2130904726, jdField_a_of_type_ComTencentWidgetXListView, false);
    ((ImageView)localView.findViewById(2131296683)).setBackgroundResource(2130839766);
    TextView localTextView = (TextView)localView.findViewById(2131297636);
    localTextView.setText("我的电脑");
    localTextView.setContentDescription("我的电脑");
    localView.setOnClickListener(new ixq(this));
    jdField_a_of_type_ComTencentWidgetXListView.a(localView);
    if (((RegisterProxySvcPackHandler)app.a(10)).f() != 0)
    {
      localView = getLayoutInflater().inflate(2130904726, jdField_a_of_type_ComTencentWidgetXListView, false);
      ((ImageView)localView.findViewById(2131296683)).setBackgroundResource(2130839764);
      localTextView = (TextView)localView.findViewById(2131297636);
      localTextView.setText("我的iPad");
      localTextView.setContentDescription("我的iPad");
      localView.setOnClickListener(new ixr(this));
      jdField_a_of_type_ComTencentWidgetXListView.a(localView);
    }
  }
  
  private void d()
  {
    View localView = getLayoutInflater().inflate(2130904726, jdField_a_of_type_ComTencentWidgetXListView, false);
    ((ImageView)localView.findViewById(2131296683)).setBackgroundResource(2130839756);
    ((TextView)localView.findViewById(2131297636)).setText(2131365781);
    localView.setOnClickListener(new ixs(this));
    jdField_a_of_type_ComTencentWidgetXListView.a(localView);
  }
  
  private void e()
  {
    SmartDeviceProxyMgr localSmartDeviceProxyMgr = (SmartDeviceProxyMgr)app.a(51);
    DeviceInfo[] arrayOfDeviceInfo;
    if (localSmartDeviceProxyMgr.a())
    {
      arrayOfDeviceInfo = localSmartDeviceProxyMgr.a();
      if ((arrayOfDeviceInfo != null) && (arrayOfDeviceInfo.length > 0)) {
        break label38;
      }
    }
    label38:
    do
    {
      return;
      arrayOfDeviceInfo = jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(arrayOfDeviceInfo);
    } while (arrayOfDeviceInfo == null);
    int n = arrayOfDeviceInfo.length;
    int m = 0;
    label60:
    DeviceInfo localDeviceInfo;
    if (m < n)
    {
      localDeviceInfo = arrayOfDeviceInfo[m];
      if (isAdmin != 2) {
        break label87;
      }
    }
    for (;;)
    {
      m += 1;
      break label60;
      break;
      label87:
      if (!localSmartDeviceProxyMgr.d(din))
      {
        View localView = super.getLayoutInflater().inflate(2130904726, jdField_a_of_type_ComTencentWidgetXListView, false);
        ((ImageView)localView.findViewById(2131296683)).setImageBitmap(DeviceHeadMgr.a().a(String.valueOf(din)));
        TextView localTextView = (TextView)localView.findViewById(2131297636);
        String str = SmartDeviceUtil.a(localDeviceInfo);
        localTextView.setText(str);
        localView.setOnClickListener(new ixt(this, super.getResources(), localDeviceInfo, str));
        jdField_a_of_type_ComTencentWidgetXListView.a(localView);
      }
    }
  }
  
  private void f()
  {
    View localView = getLayoutInflater().inflate(2130904726, jdField_a_of_type_ComTencentWidgetXListView, false);
    ((ImageView)localView.findViewById(2131296683)).setBackgroundResource(2130842108);
    ((TextView)localView.findViewById(2131297636)).setText(2131368992);
    localView.setOnClickListener(new ixu(this));
    jdField_a_of_type_ComTencentWidgetXListView.a(localView);
  }
  
  private void g()
  {
    if (app.e())
    {
      jdField_a_of_type_JavaUtilList = a(app.a().a().a(true));
      if (jdField_a_of_type_ComTencentMobileqqAdapterForwardRecentListAdapter == null)
      {
        ixw localIxw = new ixw(this);
        jdField_a_of_type_ComTencentMobileqqAdapterForwardRecentListAdapter = new ForwardRecentListAdapter(this, app, jdField_a_of_type_ComTencentWidgetXListView, jdField_a_of_type_JavaUtilList, localIxw);
        jdField_a_of_type_ComTencentWidgetXListView.setAdapter(jdField_a_of_type_ComTencentMobileqqAdapterForwardRecentListAdapter);
      }
    }
    else
    {
      return;
    }
    jdField_a_of_type_ComTencentMobileqqAdapterForwardRecentListAdapter.a(jdField_a_of_type_JavaUtilList);
  }
  
  private void h()
  {
    Intent localIntent = AIOUtils.a(new Intent(this, SplashActivity.class), null);
    Object localObject = new Bundle(jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a());
    ((Bundle)localObject).putBoolean("PhotoConst.HANDLE_DEST_RESULT", false);
    ((Bundle)localObject).putBoolean("PhotoConst.IS_FORWARD", true);
    ((Bundle)localObject).putInt("PhotoConst.SEND_BUSINESS_TYPE", 1031);
    ((Bundle)localObject).putBoolean("PicContants.NEED_COMPRESS", false);
    localIntent.putExtra("PhotoConst.INIT_ACTIVITY_CLASS_NAME", SplashActivity.class.getName());
    localIntent.putExtra("PhotoConst.INIT_ACTIVITY_PACKAGE_NAME", "com.tencent.mobileqq");
    localIntent.putExtra("PhotoConst.DEST_ACTIVITY_CLASS_NAME", SendPhotoActivity.class.getName());
    localIntent.putExtra("PhotoConst.DEST_ACTIVITY_PACKAGE_NAME", "com.tencent.mobileqq");
    localIntent.putExtra("extra_image_sender_tag", "sessionInfo.aioAlbum");
    localIntent.putExtra("isBack2Root", false);
    localIntent.putExtras((Bundle)localObject);
    localObject = ((Bundle)localObject).getString("GALLERY.FORWORD_LOCAL_PATH");
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(localObject);
    PhotoUtils.a(this, localIntent, localArrayList, 0, false);
  }
  
  public void a(AdapterView paramAdapterView, View paramView, long paramLong)
  {
    paramAdapterView = (ForwardRecentListAdapter.ForwardViewHolder)paramView.getTag();
    paramView = jdField_a_of_type_ComTencentMobileqqDataRecentUser;
    if ((jdField_a_of_type_Boolean) && (paramView != null)) {
      switch (type)
      {
      }
    }
    for (;;)
    {
      if (paramView != null)
      {
        Bundle localBundle = new Bundle();
        localBundle.putString("uin", uin);
        localBundle.putInt("uintype", type);
        localBundle.putString("troop_uin", troopUin);
        localBundle.putString("uinname", jdField_a_of_type_JavaLangString);
        localBundle.putBoolean("forward_report_confirm", true);
        localBundle.putString("forward_report_confirm_action_name", "0X8005A13");
        localBundle.putString("forward_report_confirm_reverse2", "5");
        jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(ForwardAbility.ForwardAbilityType.a.intValue(), localBundle);
        jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.d();
      }
      return;
      ReportCenter.a().a(app.getAccount(), "", k, "1000", "30", "0", false);
      continue;
      ReportCenter.a().a(app.getAccount(), "", k, "1000", "31", "0", false);
      continue;
      ReportCenter.a().a(app.getAccount(), "", k, "1000", "32", "0", false);
    }
  }
  
  protected boolean a(Bundle paramBundle)
  {
    jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption = ForwardOptionBuilder.a(getIntent(), app, this);
    if (jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption != null)
    {
      jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a();
      if (isFinishing()) {
        return false;
      }
    }
    else
    {
      finish();
      return false;
    }
    paramBundle = getIntent();
    try
    {
      jdField_a_of_type_AndroidNetUri = paramBundle.getData();
      if (paramBundle.getIntExtra("forward_type", -1) == 11) {
        jdField_a_of_type_Boolean = true;
      }
      jdField_j_of_type_JavaLangString = paramBundle.getStringExtra("pkg_name");
      long l = paramBundle.getLongExtra("req_share_id", 0L);
      if (l > 0L) {
        k = String.valueOf(l);
      }
      if (QLog.isColorLevel()) {
        QLog.d("ForwardOption.ForwardEntranceActivity", 2, "-->doOnCreate_init--isSdkShare = " + jdField_a_of_type_Boolean + ", pkgName = " + jdField_j_of_type_JavaLangString + ", appid =" + k);
      }
      a();
      if (app.a() == null) {
        finish();
      }
      g();
      jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.c();
      b();
    }
    catch (Exception paramBundle)
    {
      for (;;)
      {
        finish();
      }
    }
    if (QLog.isDevelopLevel()) {
      QLog.d("StructingMsgItemBuildertime", 4, "zhuanfa end:" + System.currentTimeMillis());
    }
    return true;
  }
  
  protected void doOnActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if (paramInt2 == -1) {
      switch (paramInt1)
      {
      }
    }
    while ((paramInt2 != 1) || (20000 != paramInt1))
    {
      do
      {
        return;
        if (getIntent().getExtras().getBoolean("jump_to_mobileqq_share", false)) {
          setResult(10, paramIntent);
        }
        for (;;)
        {
          finish();
          return;
          setResult(-1, paramIntent);
        }
        setResult(-1, paramIntent);
        finish();
        return;
        if (paramIntent.getBooleanExtra("select_memeber_single_friend", false))
        {
          localObject1 = paramIntent.getExtras();
          paramInt2 = paramIntent.getIntExtra("select_memeber_single_friend_type", 2);
          paramInt1 = paramInt2;
          if (paramInt2 == 4) {
            paramInt1 = 1;
          }
          paramInt2 = paramInt1;
          if (paramInt1 == 0) {
            paramInt2 = 2;
          }
          ((Bundle)localObject1).putBoolean("forward_report_confirm", true);
          ((Bundle)localObject1).putString("forward_report_confirm_action_name", "0X8005A14");
          ((Bundle)localObject1).putString("forward_report_confirm_reverse2", Integer.toString(paramInt2));
          jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(ForwardAbility.ForwardAbilityType.b.intValue(), (Bundle)localObject1);
          ReportCenter.a().a(app.getAccount(), "", k, "1000", "30", "0", false);
          return;
        }
        localObject1 = paramIntent.getStringExtra("roomId");
        if (!StringUtil.b((String)localObject1))
        {
          g();
          ReportController.b(app, "CliOper", "", "", "0X80056B0", "0X80056B0", 0, 0, "", "", "", "");
          paramInt1 = paramIntent.getIntExtra("select_memeber_discussion_memeber_count", 0);
          localObject2 = new Bundle();
          ((Bundle)localObject2).putBoolean("forward_report_confirm", true);
          ((Bundle)localObject2).putString("forward_report_confirm_action_name", "0X8005A15");
          ((Bundle)localObject2).putString("forward_report_confirm_reverse2", Integer.toString(paramInt1));
          jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a((String)localObject1, paramIntent.getStringExtra("discussName"), (Bundle)localObject2);
        }
        ReportCenter.a().a(app.getAccount(), "", k, "1000", "32", "0", false);
        return;
        jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(paramInt1, paramInt2, paramIntent);
        return;
        paramIntent = jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a().getString("EditImagePath");
      } while (paramIntent == null);
      Object localObject1 = app.getAccount();
      Object localObject2 = app.b();
      String str = app.a(false, (String)localObject1);
      if ((getIntent().getFlags() & 0x2000000) == 33554432) {
        QLog.e("ForwardOption.ForwardEntranceActivity", 2, "contain FLAG_ACTIVITY_FORWARD_RESULT Flag");
      }
      PhotoMagicStickUtils.a(paramIntent, this, true, -1, (String)localObject1, (String)localObject2, str);
      overridePendingTransition(2130968619, 2130968620);
      return;
      SearchUtils.a(paramIntent, jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption);
      return;
    }
    finish();
  }
  
  public void doOnBackPressed()
  {
    if (!isFinishing())
    {
      jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a(false);
      com.tencent.mobileqq.app.PhoneContactManagerImp.f = false;
    }
    super.doOnBackPressed();
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    setTheme(2131559121);
    super.doOnCreate(paramBundle);
    app.a(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
    app.a(jdField_a_of_type_ComTencentMobileqqAppTroopObserver);
    app.a(jdField_a_of_type_ComTencentMobileqqAppAutomatorObserver);
    setContentViewNoTitle(2130903355);
    return a(paramBundle);
  }
  
  protected void doOnDestroy()
  {
    app.b(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
    app.b(jdField_a_of_type_ComTencentMobileqqAppTroopObserver);
    app.b(jdField_a_of_type_ComTencentMobileqqAppAutomatorObserver);
    if (jdField_a_of_type_ComTencentMobileqqAdapterForwardRecentListAdapter != null)
    {
      jdField_a_of_type_ComTencentMobileqqAdapterForwardRecentListAdapter.b();
      jdField_a_of_type_ComTencentWidgetXListView.setAdapter(null);
    }
    if (jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption != null) {
      jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.q();
    }
    super.doOnDestroy();
  }
  
  protected void doOnNewIntent(Intent paramIntent)
  {
    int m = 1;
    super.doOnNewIntent(paramIntent);
    if (QLog.isColorLevel()) {
      QLog.d("ForwardOption.ForwardEntranceActivity", 2, "ForwardOption.ForwardEntranceActivity onNewIntent()");
    }
    if (paramIntent.getBooleanExtra("PhotoConst.SEND_FLAG", false))
    {
      paramIntent = paramIntent.getStringArrayListExtra("PhotoConst.PHOTO_PATHS");
      if ((paramIntent != null) && (!paramIntent.isEmpty())) {
        break label53;
      }
    }
    label53:
    int n;
    label272:
    label288:
    for (;;)
    {
      return;
      paramIntent = (String)paramIntent.get(0);
      Bundle localBundle = jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a();
      n = localBundle.getInt("key_forward_ability_type", 0);
      String str1 = localBundle.getString("uin");
      int i1 = localBundle.getInt("uintype", -1);
      String str2 = localBundle.getString("troop_uin");
      localBundle.getString("uinname");
      boolean bool = localBundle.getBoolean("FORWARD_IS_QZONE_SHARE");
      localBundle.putBoolean("FORWARD_IS_EDITED", true);
      if (!bool) {
        break;
      }
      if ((n == ForwardAbility.ForwardAbilityType.f.intValue()) || (n == ForwardAbility.ForwardAbilityType.l.intValue()))
      {
        LiteActivity.a(app, paramIntent, this);
        bool = true;
        m = 0;
        if (!bool) {
          break label272;
        }
        setResult(-1);
      }
      for (;;)
      {
        if (m != 0) {
          break label288;
        }
        finish();
        return;
        if (n == ForwardAbility.ForwardAbilityType.g.intValue())
        {
          jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a().putString("forward_filepath", paramIntent);
          jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a().putString("GALLERY.FORWORD_LOCAL_PATH", paramIntent);
          jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.o();
          bool = true;
          break;
        }
        bool = ForwardSendPicUtil.a(app, paramIntent, str1, i1, str2, true, this);
        m = 0;
        break;
        if (QLog.isColorLevel()) {
          QLog.d("ForwardOption.ForwardEntranceActivity", 2, "failed to send pic from qzone");
        }
      }
    }
    if ((n == ForwardAbility.ForwardAbilityType.f.intValue()) || (n == ForwardAbility.ForwardAbilityType.l.intValue()))
    {
      jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a().putString("forward_extra", paramIntent);
      jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.b(n);
      return;
    }
    if (n == ForwardAbility.ForwardAbilityType.g.intValue())
    {
      jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a().putString("forward_filepath", paramIntent);
      jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a().putString("GALLERY.FORWORD_LOCAL_PATH", paramIntent);
      jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.o();
      return;
    }
    jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a().putString("GALLERY.FORWORD_LOCAL_PATH", paramIntent);
    h();
    ReportController.b(app, "CliOper", "", "", "0X800514C", "0X800514C", 0, 0, "", "", "", "");
  }
  
  protected void doOnResume()
  {
    super.doOnResume();
    if (AppSetting.i)
    {
      jdField_a_of_type_AndroidWidgetTextView.setContentDescription(jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a() + "页面，已选中取消按钮");
      jdField_a_of_type_AndroidWidgetTextView.postDelayed(new ixn(this), 1000L);
    }
    if (BaseApplicationImpl.c > 0L) {
      Log.d("AutoMonitor", "actStartSel, cost=" + (SystemClock.uptimeMillis() - BaseApplicationImpl.c));
    }
  }
  
  public void finish()
  {
    super.finish();
    overridePendingTransition(2130968583, 2130968584);
  }
}
