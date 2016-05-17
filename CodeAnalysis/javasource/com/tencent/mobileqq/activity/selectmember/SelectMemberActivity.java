package com.tencent.mobileqq.activity.selectmember;

import QQService.AddDiscussMemberInfo;
import android.app.Dialog;
import android.content.BroadcastReceiver;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Message;
import android.support.v4.app.FragmentActivity;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup.LayoutParams;
import android.view.Window;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.GridView;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.av.gaudio.AVNotifyCenter;
import com.tencent.av.service.QavWrapper;
import com.tencent.av.smallscreen.SmallScreenUtils;
import com.tencent.av.utils.PstnUtils;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.common.app.InnerFrameManager;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.bless.BlessManager;
import com.tencent.mobileqq.activity.bless.BlessTypeActivity;
import com.tencent.mobileqq.app.DiscussionObserver;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.IphoneTitleBarActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.TroopHandler;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.app.TroopObserver;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.data.PhoneContact;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.PhoneContactManager;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.qcall.QCallFacade;
import com.tencent.mobileqq.search.fragment.ContactSearchFragment;
import com.tencent.mobileqq.search.model.ContactSearchModelCircleBuddy;
import com.tencent.mobileqq.search.model.ContactSearchModelDiscussionMember;
import com.tencent.mobileqq.search.model.ContactSearchModelFriend;
import com.tencent.mobileqq.search.model.ContactSearchModelPhoneContact;
import com.tencent.mobileqq.search.model.IContactSearchModel;
import com.tencent.mobileqq.search.presenter.ContactSearchResultPresenter.OnActionListener;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.util.FaceDecoder;
import com.tencent.mobileqq.util.Utils;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.ImageUtil;
import com.tencent.mobileqq.widget.QQProgressDialog;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.mobileqq.widget.QQToastNotifier;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.immersive.ImmersiveUtils;
import com.tencent.widget.immersive.SystemBarCompact;
import cooperation.dingdong.DingdongOpenIdProvider;
import cooperation.dingdong.DingdongPluginHelper;
import cooperation.groupvideo.GroupVideoWrapper;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import mmj;
import mmk;
import mml;
import mmm;
import mmn;
import mmo;
import mmp;
import mmq;
import mms;
import mmt;
import mmu;
import mmw;
import mmx;
import mmy;
import mnb;
import mnc;
import mnd;
import mne;
import mnf;
import mqq.app.MobileQQ;
import tencent.im.oidb.cmd0x589.oidb_0x589.GetUserOpenIdReq;

public class SelectMemberActivity
  extends FragmentActivity
  implements View.OnClickListener, ContactSearchResultPresenter.OnActionListener
{
  static final int A = 3;
  public static final String A = "multi_chat";
  static final int B = 4;
  public static final String B = "param_min";
  static final int C = 5;
  public static final String C = "param_show_myself";
  static final int D = 6;
  public static final String D = "result_set";
  static final int E = 7;
  public static final String E = "param_donot_need_circle";
  public static final int F = 8;
  public static final String F = "param_donot_need_contacts";
  public static final int G = 9;
  public static final String G = "param_donot_need_troop";
  public static final int H = 10;
  public static final String H = "param_donot_need_discussion";
  public static final String I = "param_only_friends";
  public static final String J = "param_only_troop_member";
  public static final String K = "param_only_discussion_member";
  public static final String L = "param_title";
  public static final String M = "param_done_button_wording";
  public static final String N = "param_done_button_highlight_wording";
  public static final String O = "param_add_passed_members_to_result_set";
  public static final String P = "param_exit_animation";
  public static final String Q = "param_back_button_side";
  protected static final int R = 0;
  public static final String R = "param_enable_all_select";
  protected static final int S = 1;
  public static final String S = "param_overload_tips_include_default_count";
  protected static final int T = 2;
  public static final String T = "param_default_selected_troop_members";
  public static final String U = "param_report_type";
  public static final int V = 5;
  public static final String V = "friend_team_id";
  public static final int W = 3;
  public static final String W = "group_uin";
  public static final String X = "group_name";
  public static final String Y = "NEED_CLOSE_WHEN_PSTN_CLOSE";
  private static final int jdField_a_of_type_Int = 1000;
  private static final String jdField_a_of_type_JavaLangString = "not_admin_invite_member_count";
  private static final int d = 3;
  private static final int e = 8;
  public static boolean h = false;
  public static final int j = 0;
  public static final int k = 1;
  public static final int l = 2;
  public static final int m = 10;
  public static final int n = 11;
  static final String jdField_n_of_type_JavaLangString = "SelectMemberActivity";
  public static final int o = 12;
  public static final String o = "param_type";
  public static final int p = 13;
  public static final String p = "param_subtype";
  public static final int q = 14;
  public static final String q = "param_is_troop_admin";
  public static final int r = 15;
  public static final String r = "param_from";
  public static final int s = 16;
  public static final String s = "param_entrance";
  public static final int t = 17;
  public static final String t = "param_groupcode";
  public static final int u = 18;
  public static final String u = "param_face_to_face_troop";
  public static final int v = 19;
  public static final String v = "param_uins_selected_default";
  public static final int w = 20;
  public static final String w = "param_uins_selected_friends";
  static final int x = 0;
  public static final String x = "param_selected_records_for_create_discussion";
  static final int y = 1;
  public static final String y = "param_uins_hide";
  static final int z = 2;
  public static final String z = "param_max";
  protected int I;
  public int J;
  public int K;
  public int L;
  int M;
  public int N;
  int O;
  protected int P;
  protected int Q;
  public int U = -1;
  public String Z;
  protected float a;
  private long jdField_a_of_type_Long = 0L;
  public Dialog a;
  private BroadcastReceiver jdField_a_of_type_AndroidContentBroadcastReceiver = null;
  public Intent a;
  protected Bitmap a;
  private Drawable jdField_a_of_type_AndroidGraphicsDrawableDrawable;
  protected Handler.Callback a;
  public final Handler a;
  public View a;
  InputMethodManager jdField_a_of_type_AndroidViewInputmethodInputMethodManager = null;
  public EditText a;
  public GridView a;
  public HorizontalScrollView a;
  protected ImageView a;
  protected LinearLayout a;
  protected ProgressBar a;
  protected TextView a;
  private QavWrapper jdField_a_of_type_ComTencentAvServiceQavWrapper = null;
  public InnerFrameManager a;
  private BlessManager jdField_a_of_type_ComTencentMobileqqActivityBlessBlessManager;
  public SelectMemberActivity.GridViewAdapter a;
  private DiscussionObserver jdField_a_of_type_ComTencentMobileqqAppDiscussionObserver;
  private FriendListObserver jdField_a_of_type_ComTencentMobileqqAppFriendListObserver;
  private TroopObserver jdField_a_of_type_ComTencentMobileqqAppTroopObserver;
  public ContactSearchFragment a;
  FaceDecoder jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder;
  public QQProgressDialog a;
  protected QQToastNotifier a;
  private DingdongOpenIdProvider jdField_a_of_type_CooperationDingdongDingdongOpenIdProvider;
  private GroupVideoWrapper jdField_a_of_type_CooperationGroupvideoGroupVideoWrapper = null;
  String aa;
  String ab;
  String ac;
  private int jdField_b_of_type_Int = 0;
  private long jdField_b_of_type_Long;
  Bitmap jdField_b_of_type_AndroidGraphicsBitmap;
  public View b;
  protected ImageView b;
  private LinearLayout jdField_b_of_type_AndroidWidgetLinearLayout;
  public TextView b;
  private int c;
  protected TextView c;
  protected TextView d;
  protected TextView e;
  private TextView f;
  public ArrayList h;
  public ArrayList i;
  public boolean i;
  public ArrayList j;
  boolean j;
  public ArrayList k;
  boolean k;
  boolean l;
  boolean m;
  boolean jdField_n_of_type_Boolean;
  boolean o;
  boolean p;
  boolean q;
  boolean r;
  boolean s;
  public boolean t = true;
  protected boolean u;
  boolean v;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_h_of_type_Boolean = false;
  }
  
  public SelectMemberActivity()
  {
    jdField_j_of_type_JavaUtilArrayList = new ArrayList();
    jdField_c_of_type_Int = 0;
    jdField_a_of_type_AndroidOsHandler$Callback = new mmk(this);
    jdField_a_of_type_AndroidOsHandler = new mmq(this);
    jdField_k_of_type_JavaUtilArrayList = null;
  }
  
  public static ResultRecord a(String paramString1, String paramString2, int paramInt, String paramString3)
  {
    ResultRecord localResultRecord = new ResultRecord();
    jdField_a_of_type_JavaLangString = paramString1;
    b = paramString2;
    jdField_a_of_type_Int = paramInt;
    c = paramString3;
    return localResultRecord;
  }
  
  private List a()
  {
    ArrayList localArrayList = new ArrayList();
    int i1 = 0;
    while (i1 < jdField_j_of_type_JavaUtilArrayList.size())
    {
      localArrayList.add(jdField_j_of_type_JavaUtilArrayList.get(i1)).jdField_a_of_type_JavaLangString);
      i1 += 1;
    }
    return localArrayList;
  }
  
  private void a(byte paramByte)
  {
    String str = null;
    if (7 == paramByte) {
      str = getString(2131369859);
    }
    for (;;)
    {
      jdField_a_of_type_AndroidOsHandler.obtainMessage(1, str).sendToTarget();
      return;
      if (9 == paramByte) {
        str = getString(2131369860);
      }
    }
  }
  
  private boolean a()
  {
    boolean bool2 = true;
    boolean bool1 = bool2;
    if (!jdField_i_of_type_Boolean)
    {
      bool1 = bool2;
      if (a() >= 3) {
        bool1 = false;
      }
    }
    return bool1;
  }
  
  private void b(int paramInt)
  {
    b(getString(paramInt));
  }
  
  private void b(String paramString)
  {
    if (System.currentTimeMillis() - jdField_a_of_type_Long > 'ߐ')
    {
      QQToast.a(this, paramString, 2000).b(jdField_b_of_type_AndroidViewView.getHeight());
      jdField_a_of_type_Long = System.currentTimeMillis();
    }
  }
  
  private void b(boolean paramBoolean)
  {
    int i1 = jdField_j_of_type_JavaUtilArrayList.size();
    String str;
    if (i1 <= 1)
    {
      str = ab;
      if (!paramBoolean) {
        break label107;
      }
      d.setEnabled(true);
      d.setText(str);
    }
    for (;;)
    {
      if (AppSetting.jdField_i_of_type_Boolean) {
        d.setContentDescription(ab + ",已选择" + i1 + "人");
      }
      return;
      str = MessageFormat.format(ac, new Object[] { Integer.valueOf(i1) });
      break;
      label107:
      d.setEnabled(false);
      d.setText(str);
    }
  }
  
  private void c()
  {
    jdField_b_of_type_AndroidWidgetTextView.setVisibility(0);
    jdField_c_of_type_AndroidWidgetTextView.setVisibility(8);
    d.setVisibility(0);
    jdField_b_of_type_AndroidWidgetTextView.setText(2131369857);
    jdField_b_of_type_AndroidWidgetTextView.setBackgroundResource(0);
    jdField_b_of_type_AndroidWidgetTextView.setPadding(0, 0, 0, 0);
    jdField_a_of_type_AndroidWidgetTextView.setText(aa);
    if (AppSetting.jdField_i_of_type_Boolean)
    {
      jdField_a_of_type_AndroidWidgetTextView.setContentDescription(aa);
      jdField_b_of_type_AndroidWidgetTextView.setContentDescription(getString(2131369857));
    }
    jdField_b_of_type_AndroidWidgetTextView.setOnClickListener(new mmj(this));
    if (I == 9003)
    {
      jdField_b_of_type_AndroidViewView.setBackgroundColor(getResources().getColor(2131427696));
      jdField_a_of_type_AndroidWidgetTextView.setTextColor(-1);
      jdField_b_of_type_AndroidWidgetTextView.setTextColor(getResources().getColorStateList(2131428057));
      d.setTextColor(getResources().getColorStateList(2131428057));
    }
    i();
  }
  
  private void c(boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.d("SelectMemberActivity", 2, "WL_DEBUG sendIsResumeBroadcast isResume = " + paramBoolean);
    }
    SmallScreenUtils.a(BaseApplicationImpl.getContext(), paramBoolean);
  }
  
  private boolean e()
  {
    boolean bool = false;
    int i1;
    if (J == 1) {
      if (jdField_a_of_type_ComTencentAvServiceQavWrapper != null) {
        i1 = jdField_a_of_type_ComTencentAvServiceQavWrapper.a(Long.valueOf(Z).longValue(), I) + 0;
      }
    }
    for (;;)
    {
      Iterator localIterator = jdField_j_of_type_JavaUtilArrayList.iterator();
      label50:
      int i2;
      if (localIterator.hasNext()) {
        if (nextjdField_a_of_type_Int == 5)
        {
          i2 = i1 + 1;
          i1 = i2;
          if (i2 < 8) {}
        }
      }
      for (;;)
      {
        if (i2 < 8) {
          bool = true;
        }
        return bool;
        if (jdField_a_of_type_CooperationGroupvideoGroupVideoWrapper == null) {
          break label141;
        }
        i1 = jdField_a_of_type_CooperationGroupvideoGroupVideoWrapper.a(Long.valueOf(Z).longValue(), I) + 0;
        break;
        break label50;
        i2 = i1;
      }
      label141:
      i1 = 0;
    }
  }
  
  private void q()
  {
    if (jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog == null) {
      jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog = new QQProgressDialog(this, getResources().getDimensionPixelSize(2131492908));
    }
    jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.show();
    if (jdField_a_of_type_CooperationDingdongDingdongOpenIdProvider == null) {
      jdField_a_of_type_CooperationDingdongDingdongOpenIdProvider = new DingdongOpenIdProvider(app);
    }
    ArrayList localArrayList = new ArrayList(jdField_j_of_type_JavaUtilArrayList.size());
    Iterator localIterator = jdField_j_of_type_JavaUtilArrayList.iterator();
    if (localIterator.hasNext())
    {
      ResultRecord localResultRecord = (ResultRecord)localIterator.next();
      oidb_0x589.GetUserOpenIdReq localGetUserOpenIdReq = new oidb_0x589.GetUserOpenIdReq();
      localGetUserOpenIdReq.setHasFlag(true);
      uint64_req_uin.set(Long.parseLong(jdField_a_of_type_JavaLangString));
      switch (jdField_a_of_type_Int)
      {
      default: 
        uint32_req_flag.set(1);
      }
      for (;;)
      {
        localArrayList.add(localGetUserOpenIdReq);
        break;
        uint32_req_flag.set(2);
        uint64_req_host_uin.set(Long.parseLong(c));
        continue;
        uint32_req_flag.set(3);
        uint64_req_host_uin.set(Long.parseLong(c));
      }
    }
    jdField_b_of_type_Long = jdField_a_of_type_CooperationDingdongDingdongOpenIdProvider.a(jdField_a_of_type_AndroidContentIntent.getLongExtra("param_dingdong_appId", 0L), localArrayList, false, new mmm(this));
  }
  
  private void r()
  {
    if (jdField_a_of_type_AndroidAppDialog != null)
    {
      jdField_a_of_type_AndroidAppDialog.dismiss();
      jdField_a_of_type_AndroidAppDialog = null;
    }
    jdField_a_of_type_AndroidAppDialog = new Dialog(this, 2131558942);
    jdField_a_of_type_AndroidAppDialog.setContentView(2130904740);
    e = ((TextView)jdField_a_of_type_AndroidAppDialog.findViewById(2131296741));
    e.setText(getString(2131368360));
    jdField_a_of_type_AndroidWidgetProgressBar = ((ProgressBar)jdField_a_of_type_AndroidAppDialog.findViewById(2131296740));
    jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(0);
    jdField_b_of_type_AndroidWidgetImageView = ((ImageView)jdField_a_of_type_AndroidAppDialog.findViewById(2131303491));
    jdField_b_of_type_AndroidWidgetImageView.setVisibility(4);
  }
  
  private void s()
  {
    jdField_a_of_type_ComTencentMobileqqAppDiscussionObserver = new mmn(this);
    jdField_a_of_type_ComTencentMobileqqAppTroopObserver = new mmo(this);
    jdField_a_of_type_ComTencentMobileqqAppFriendListObserver = new mmp(this);
    addObserver(jdField_a_of_type_ComTencentMobileqqAppDiscussionObserver);
    addObserver(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
    addObserver(jdField_a_of_type_ComTencentMobileqqAppTroopObserver);
  }
  
  private void t()
  {
    jdField_b_of_type_AndroidWidgetLinearLayout = ((LinearLayout)findViewById(2131298512));
    f = ((TextView)findViewById(2131298513));
    long l1 = app.a().a();
    int i2 = app.a().a();
    int i1 = 0;
    if (l1 > 0L) {
      i1 = app.a().b(l1);
    }
    if ((i2 == 1) && (i1 == 2))
    {
      jdField_a_of_type_CooperationGroupvideoGroupVideoWrapper = new GroupVideoWrapper(app);
      jdField_a_of_type_CooperationGroupvideoGroupVideoWrapper.a(new mms(this));
      return;
    }
    jdField_a_of_type_ComTencentAvServiceQavWrapper = new QavWrapper(this);
    jdField_a_of_type_ComTencentAvServiceQavWrapper.a(new mmt(this));
  }
  
  private void u()
  {
    if (jdField_a_of_type_ComTencentAvServiceQavWrapper != null)
    {
      jdField_a_of_type_ComTencentAvServiceQavWrapper.a();
      jdField_a_of_type_ComTencentAvServiceQavWrapper = null;
    }
    if (jdField_a_of_type_CooperationGroupvideoGroupVideoWrapper != null)
    {
      jdField_a_of_type_CooperationGroupvideoGroupVideoWrapper.a();
      jdField_a_of_type_CooperationGroupvideoGroupVideoWrapper = null;
    }
  }
  
  public int a()
  {
    int i2 = 0;
    long l1 = Utils.a();
    Object localObject = app.a().getSharedPreferences(app.getAccount(), 0).getString("not_admin_invite_member_count", null);
    int i1 = i2;
    if (localObject != null) {}
    try
    {
      localObject = ((String)localObject).split(":");
      i1 = i2;
      if (Long.parseLong(localObject[0]) == l1) {
        i1 = Integer.parseInt(localObject[1]);
      }
      return i1;
    }
    catch (Exception localException) {}
    return 0;
  }
  
  public int a(String paramString)
  {
    switch (PstnUtils.a(paramString.substring("pstn".length()), true))
    {
    case 0: 
    default: 
      return 0;
    case -1: 
      return 2131369869;
    case 1: 
      return 2131369870;
    case 2: 
      return 2131369871;
    case 3: 
      return 2131369872;
    case 4: 
      return 2131369873;
    case 5: 
      return 2131369874;
    }
    return 2131369875;
  }
  
  public ResultRecord a(String paramString1, String paramString2, int paramInt, String paramString3, String paramString4)
  {
    ResultRecord localResultRecord = new ResultRecord();
    jdField_a_of_type_JavaLangString = paramString1;
    b = paramString2;
    jdField_a_of_type_Int = paramInt;
    c = paramString3;
    d = paramString4;
    return localResultRecord;
  }
  
  public String a(String paramString)
  {
    TroopManager localTroopManager = (TroopManager)app.getManager(51);
    if (localTroopManager != null)
    {
      paramString = localTroopManager.a(paramString);
      if (paramString != null) {
        return troopcode;
      }
    }
    return null;
  }
  
  protected ArrayList a()
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = jdField_j_of_type_JavaUtilArrayList.iterator();
    while (localIterator.hasNext())
    {
      ResultRecord localResultRecord = (ResultRecord)localIterator.next();
      if (jdField_a_of_type_Int == 5)
      {
        if (jdField_a_of_type_JavaLangString.startsWith("pstn")) {
          jdField_a_of_type_JavaLangString = jdField_a_of_type_JavaLangString.substring("pstn".length());
        }
        localArrayList.add(localResultRecord);
      }
    }
    return localArrayList;
  }
  
  protected void a()
  {
    setContentView(2130904791);
  }
  
  public void a(int paramInt)
  {
    long l1 = Utils.a();
    SharedPreferences.Editor localEditor = app.a().getSharedPreferences(app.getAccount(), 0).edit();
    localEditor.putString("not_admin_invite_member_count", l1 + ":" + paramInt);
    localEditor.commit();
  }
  
  public void a(View paramView)
  {
    IContactSearchModel localIContactSearchModel = (IContactSearchModel)paramView.getTag(2131296476);
    if (localIContactSearchModel == null) {
      return;
    }
    paramView = localIContactSearchModel.a();
    String str2 = localIContactSearchModel.a().toString();
    if ((localIContactSearchModel instanceof ContactSearchModelDiscussionMember)) {}
    for (String str1 = ((ContactSearchModelDiscussionMember)localIContactSearchModel).e();; str1 = "-1")
    {
      label104:
      SelectMemberInnerFrame localSelectMemberInnerFrame;
      int i1;
      if ((localIContactSearchModel instanceof ContactSearchModelPhoneContact))
      {
        paramView = a;
        if (TextUtils.isEmpty(uin)) {
          paramView = "pstn" + mobileNo;
        }
      }
      else
      {
        if (((jdField_h_of_type_JavaUtilArrayList != null) && (jdField_h_of_type_JavaUtilArrayList.contains(paramView))) || (a(paramView)) || (d()) || (a(paramView, str2))) {
          break label341;
        }
        localSelectMemberInnerFrame = (SelectMemberInnerFrame)jdField_a_of_type_ComTencentCommonAppInnerFrameManager.getCurrentView();
        if ((jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a() != 6) && (jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a() != 0) && (jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a() != 5) && (jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a() != 4)) {
          break label424;
        }
        if (!(localIContactSearchModel instanceof ContactSearchModelDiscussionMember)) {
          break label343;
        }
        i1 = 2;
      }
      for (;;)
      {
        label213:
        if (i1 != -1) {
          jdField_j_of_type_JavaUtilArrayList.add(a(paramView, str2, i1, str1));
        }
        for (;;)
        {
          o();
          i();
          localSelectMemberInnerFrame.f();
          a(true);
          jdField_a_of_type_AndroidWidgetEditText.setText("");
          if ((I != 9003) || (jdField_a_of_type_ComTencentMobileqqActivityBlessBlessManager.a(paramView))) {
            break;
          }
          jdField_b_of_type_Int += 1;
          return;
          if (uin.equals("0"))
          {
            paramView = nationCode + mobileCode;
            break label104;
          }
          paramView = uin;
          break label104;
          label341:
          break;
          label343:
          if ((localIContactSearchModel instanceof ContactSearchModelFriend))
          {
            i1 = 0;
            break label213;
          }
          if ((localIContactSearchModel instanceof ContactSearchModelCircleBuddy))
          {
            i1 = 3;
            break label213;
          }
          if (!(localIContactSearchModel instanceof ContactSearchModelPhoneContact)) {
            break label656;
          }
          if ((paramView.startsWith("pstn")) && (b(paramView, str2, 5, str1)))
          {
            i1 = 5;
            break label213;
          }
          if (paramView.startsWith("+"))
          {
            i1 = 4;
            break label213;
          }
          i1 = 0;
          break label213;
          label424:
          if (jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a() == 8) {
            jdField_j_of_type_JavaUtilArrayList.add(a(paramView, str2, 1, localSelectMemberInnerFrame.a()));
          } else if (jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a() == 9) {
            jdField_j_of_type_JavaUtilArrayList.add(a(paramView, str2, 2, localSelectMemberInnerFrame.a()));
          } else if ((jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a() == 1) || (jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a() == 7)) {
            jdField_j_of_type_JavaUtilArrayList.add(a(paramView, str2, 3, localSelectMemberInnerFrame.a()));
          } else if (jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a() == 2) {
            if ((paramView.startsWith("pstn")) && (b(paramView, str2, 5, localSelectMemberInnerFrame.a()))) {
              jdField_j_of_type_JavaUtilArrayList.add(a(paramView, str2, 5, localSelectMemberInnerFrame.a()));
            } else if (paramView.startsWith("+")) {
              jdField_j_of_type_JavaUtilArrayList.add(a(paramView, str2, 4, localSelectMemberInnerFrame.a()));
            } else {
              jdField_j_of_type_JavaUtilArrayList.add(a(paramView, str2, 0, localSelectMemberInnerFrame.a()));
            }
          }
        }
        label656:
        i1 = -1;
      }
    }
  }
  
  public void a(String paramString)
  {
    int i1 = 0;
    while (i1 < jdField_j_of_type_JavaUtilArrayList.size())
    {
      if (jdField_j_of_type_JavaUtilArrayList.get(i1)).jdField_a_of_type_JavaLangString.equals(paramString))
      {
        jdField_j_of_type_JavaUtilArrayList.remove(i1);
        if ((I == 9003) && (!jdField_a_of_type_ComTencentMobileqqActivityBlessBlessManager.a(paramString))) {
          jdField_b_of_type_Int -= 1;
        }
      }
      i1 += 1;
    }
    o();
  }
  
  public void a(String paramString1, String paramString2)
  {
    Intent localIntent = AIOUtils.a(new Intent(getActivity(), SplashActivity.class), null);
    localIntent.putExtra("uin", paramString1);
    localIntent.putExtra("uintype", 3000);
    localIntent.putExtra("uinname", paramString2);
    startActivity(localIntent);
    paramString2 = new HashMap();
    paramString2.put("MultiAVType", String.valueOf(1));
    ChatActivityUtils.a(app, this, 3000, paramString1, true, true, null, paramString2);
  }
  
  public void a(boolean paramBoolean)
  {
    jdField_a_of_type_AndroidWidgetGridView.setNumColumns(jdField_j_of_type_JavaUtilArrayList.size());
    ViewGroup.LayoutParams localLayoutParams = jdField_a_of_type_AndroidWidgetGridView.getLayoutParams();
    width = ((int)((jdField_j_of_type_JavaUtilArrayList.size() * 40 + jdField_j_of_type_JavaUtilArrayList.size() * 10) * jdField_a_of_type_Float));
    jdField_a_of_type_AndroidWidgetGridView.setLayoutParams(localLayoutParams);
    j();
    if (paramBoolean) {
      jdField_a_of_type_AndroidOsHandler.sendEmptyMessageDelayed(2, 200L);
    }
    jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity$GridViewAdapter.notifyDataSetChanged();
  }
  
  public void a(boolean paramBoolean, long paramLong, ArrayList paramArrayList)
  {
    if (QLog.isColorLevel()) {
      QLog.d("SelectMemberActivity", 2, "sendResultBroadcastToVideo");
    }
    Intent localIntent = new Intent("tencent.video.q2v.AddDiscussMember");
    localIntent.setPackage(app.getApplication().getPackageName());
    localIntent.putExtra("result", paramBoolean);
    localIntent.putExtra("roomId", paramLong);
    localIntent.putStringArrayListExtra("newMemberUin", paramArrayList);
    app.a().sendBroadcast(localIntent);
  }
  
  public void a(boolean paramBoolean, String paramString1, String paramString2)
  {
    if (paramBoolean)
    {
      jdField_b_of_type_AndroidWidgetTextView.setVisibility(0);
      jdField_b_of_type_AndroidWidgetTextView.setText(paramString1);
      jdField_b_of_type_AndroidWidgetTextView.setOnClickListener(new mmu(this));
      jdField_b_of_type_AndroidWidgetTextView.setBackgroundResource(2130842902);
      jdField_c_of_type_AndroidWidgetTextView.setVisibility(8);
      IphoneTitleBarActivity.setLayerType(jdField_b_of_type_AndroidWidgetTextView);
      if (L != 13) {
        break label160;
      }
      jdField_a_of_type_AndroidWidgetTextView.setText(2131363817);
    }
    for (;;)
    {
      if (AppSetting.jdField_i_of_type_Boolean)
      {
        jdField_a_of_type_AndroidWidgetTextView.setContentDescription(jdField_a_of_type_AndroidWidgetTextView.getText());
        jdField_b_of_type_AndroidWidgetTextView.setContentDescription(jdField_b_of_type_AndroidWidgetTextView.getText() + "按钮");
        jdField_b_of_type_AndroidWidgetTextView.postDelayed(new mmw(this), 1000L);
      }
      return;
      c();
      break;
      label160:
      if (L == 14)
      {
        if (!TextUtils.isEmpty(aa)) {
          jdField_a_of_type_AndroidWidgetTextView.setText(aa);
        } else {
          jdField_a_of_type_AndroidWidgetTextView.setText(paramString2);
        }
      }
      else {
        jdField_a_of_type_AndroidWidgetTextView.setText(paramString2);
      }
    }
  }
  
  public boolean a(String paramString)
  {
    boolean bool2 = false;
    int i1 = 0;
    for (;;)
    {
      boolean bool1 = bool2;
      if (i1 < jdField_j_of_type_JavaUtilArrayList.size())
      {
        if (jdField_j_of_type_JavaUtilArrayList.get(i1)).jdField_a_of_type_JavaLangString.equals(paramString)) {
          bool1 = true;
        }
      }
      else {
        return bool1;
      }
      i1 += 1;
    }
  }
  
  boolean a(String paramString1, String paramString2)
  {
    if ((I == 9003) && (!jdField_a_of_type_ComTencentMobileqqActivityBlessBlessManager.a(paramString1)) && (jdField_b_of_type_Int >= jdField_a_of_type_ComTencentMobileqqActivityBlessBlessManager.d()))
    {
      b(String.format(getString(2131371919), new Object[] { Integer.valueOf(jdField_a_of_type_ComTencentMobileqqActivityBlessBlessManager.c()) }));
      return true;
    }
    return false;
  }
  
  public boolean a(String paramString1, String paramString2, int paramInt, String paramString3)
  {
    boolean bool2 = false;
    boolean bool1;
    if (a(paramString1))
    {
      a(paramString1);
      bool1 = bool2;
    }
    for (;;)
    {
      a(bool1);
      i();
      o();
      return bool1;
      bool1 = bool2;
      if (!d())
      {
        bool1 = bool2;
        if (!a(paramString1, paramString2))
        {
          bool1 = bool2;
          if (b(paramString1, paramString2, paramInt, paramString3))
          {
            bool2 = true;
            jdField_j_of_type_JavaUtilArrayList.add(a(paramString1, paramString2, paramInt, paramString3));
            bool1 = bool2;
            if (I == 9003)
            {
              bool1 = bool2;
              if (!jdField_a_of_type_ComTencentMobileqqActivityBlessBlessManager.a(paramString1))
              {
                jdField_b_of_type_Int += 1;
                bool1 = bool2;
              }
            }
          }
        }
      }
    }
  }
  
  public boolean a(String paramString1, String paramString2, int paramInt, String paramString3, String paramString4)
  {
    boolean bool2 = false;
    boolean bool1;
    if (a(paramString1))
    {
      a(paramString1);
      bool1 = bool2;
    }
    for (;;)
    {
      a(bool1);
      i();
      o();
      return bool1;
      bool1 = bool2;
      if (!d())
      {
        bool1 = bool2;
        if (b(paramString1, paramString2, paramInt, paramString3))
        {
          bool1 = true;
          jdField_j_of_type_JavaUtilArrayList.add(a(paramString1, paramString2, paramInt, paramString3, paramString4));
        }
      }
    }
  }
  
  public boolean a(List paramList, boolean paramBoolean)
  {
    if (paramBoolean) {
      jdField_j_of_type_JavaUtilArrayList.clear();
    }
    HashSet localHashSet = new HashSet(jdField_j_of_type_JavaUtilArrayList.size());
    Object localObject = jdField_j_of_type_JavaUtilArrayList.iterator();
    while (((Iterator)localObject).hasNext()) {
      localHashSet.add(nextjdField_a_of_type_JavaLangString);
    }
    if (jdField_h_of_type_JavaUtilArrayList != null)
    {
      localObject = jdField_h_of_type_JavaUtilArrayList.iterator();
      while (((Iterator)localObject).hasNext()) {
        localHashSet.add((String)((Iterator)localObject).next());
      }
    }
    paramList = paramList.iterator();
    do
    {
      for (;;)
      {
        if (!paramList.hasNext()) {
          break label280;
        }
        localObject = (ResultRecord)paramList.next();
        if (!localHashSet.contains(jdField_a_of_type_JavaLangString))
        {
          if ((d()) || (a(jdField_a_of_type_JavaLangString, b)) || (!b(jdField_a_of_type_JavaLangString, b, jdField_a_of_type_Int, c))) {
            break;
          }
          jdField_j_of_type_JavaUtilArrayList.add(localObject);
          if ((I == 9003) && (!jdField_a_of_type_ComTencentMobileqqActivityBlessBlessManager.a(jdField_a_of_type_JavaLangString))) {
            jdField_b_of_type_Int += 1;
          }
        }
      }
      if (9999 == I) {
        DingdongPluginHelper.a("0X8005EA7");
      }
    } while (I == 9003);
    label280:
    a(true);
    i();
    o();
    if (9999 == I) {
      DingdongPluginHelper.a("0X8005EA6");
    }
    return true;
  }
  
  protected void b()
  {
    jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a(this);
    jdField_a_of_type_ComTencentCommonAppInnerFrameManager.setAppIntf(app);
    if (o)
    {
      jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a(8, jdField_a_of_type_AndroidContentIntent.getExtras());
      return;
    }
    if (p)
    {
      jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a(9, jdField_a_of_type_AndroidContentIntent.getExtras());
      return;
    }
    jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a(0);
  }
  
  public void b(boolean paramBoolean, long paramLong, ArrayList paramArrayList)
  {
    if (QLog.isColorLevel()) {
      QLog.d("SelectMemberActivity", 2, "sendResultBroadcastToVideo");
    }
    Intent localIntent = new Intent("tencent.video.q2v.SwitchToDiscuss");
    localIntent.setPackage(app.getApplication().getPackageName());
    localIntent.putExtra("result", paramBoolean);
    localIntent.putExtra("roomId", paramLong);
    localIntent.putExtra("qqPhoneUserList", paramArrayList);
    paramArrayList = null;
    if (jdField_k_of_type_JavaUtilArrayList != null)
    {
      int i2 = jdField_k_of_type_JavaUtilArrayList.size();
      paramArrayList = new long[i2];
      int i1 = 0;
      while (i1 < i2)
      {
        paramArrayList[i1] = jdField_k_of_type_JavaUtilArrayList.get(i1)).Uin;
        i1 += 1;
      }
    }
    localIntent.putExtra("memberUin", paramArrayList);
    app.a().sendBroadcast(localIntent);
    if (paramBoolean) {
      ((QCallFacade)app.getManager(37)).a(1, paramLong, "", "");
    }
  }
  
  public boolean b()
  {
    jdField_j_of_type_JavaUtilArrayList.clear();
    a(false);
    i();
    o();
    return true;
  }
  
  public boolean b(String paramString1, String paramString2, int paramInt, String paramString3)
  {
    boolean bool;
    int i1;
    if (paramInt == 5)
    {
      bool = e();
      if (!bool) {
        QQToast.a(this, 2131369868, 1).b(getTitleBarHeight());
      }
      i1 = a(paramString1);
      if (i1 != 0) {
        break label76;
      }
    }
    label76:
    for (paramInt = 1;; paramInt = 0)
    {
      if (paramInt == 0) {
        QQToast.a(this, i1, 1).b(getTitleBarHeight());
      }
      if ((!bool) || (paramInt == 0)) {
        break;
      }
      return true;
    }
    return false;
  }
  
  public boolean c()
  {
    return v;
  }
  
  protected void d()
  {
    jdField_a_of_type_AndroidContentIntent = getIntent();
    I = jdField_a_of_type_AndroidContentIntent.getExtras().getInt("param_type");
    J = jdField_a_of_type_AndroidContentIntent.getExtras().getInt("param_subtype");
    K = jdField_a_of_type_AndroidContentIntent.getExtras().getInt("param_from");
    L = jdField_a_of_type_AndroidContentIntent.getIntExtra("param_entrance", 0);
    jdField_h_of_type_JavaUtilArrayList = jdField_a_of_type_AndroidContentIntent.getStringArrayListExtra("param_uins_selected_default");
    jdField_i_of_type_JavaUtilArrayList = jdField_a_of_type_AndroidContentIntent.getStringArrayListExtra("param_uins_hide");
    if (jdField_i_of_type_JavaUtilArrayList == null) {
      jdField_i_of_type_JavaUtilArrayList = new ArrayList();
    }
    Z = jdField_a_of_type_AndroidContentIntent.getExtras().getString("param_groupcode");
    jdField_i_of_type_Boolean = jdField_a_of_type_AndroidContentIntent.getExtras().getBoolean("param_is_troop_admin", true);
    P = jdField_a_of_type_AndroidContentIntent.getIntExtra("param_max", Integer.MAX_VALUE);
    Q = jdField_a_of_type_AndroidContentIntent.getIntExtra("param_min", 1);
    u = jdField_a_of_type_AndroidContentIntent.getBooleanExtra("param_show_myself", false);
    jdField_j_of_type_Boolean = jdField_a_of_type_AndroidContentIntent.getBooleanExtra("param_donot_need_circle", false);
    jdField_k_of_type_Boolean = jdField_a_of_type_AndroidContentIntent.getBooleanExtra("param_donot_need_contacts", false);
    l = jdField_a_of_type_AndroidContentIntent.getBooleanExtra("param_donot_need_troop", false);
    m = jdField_a_of_type_AndroidContentIntent.getBooleanExtra("param_donot_need_discussion", false);
    n = jdField_a_of_type_AndroidContentIntent.getBooleanExtra("param_only_friends", false);
    o = jdField_a_of_type_AndroidContentIntent.getBooleanExtra("param_only_troop_member", false);
    p = jdField_a_of_type_AndroidContentIntent.getBooleanExtra("param_only_discussion_member", false);
    q = jdField_a_of_type_AndroidContentIntent.getBooleanExtra("param_face_to_face_troop", false);
    r = jdField_a_of_type_AndroidContentIntent.getBooleanExtra("param_overload_tips_include_default_count", false);
    aa = jdField_a_of_type_AndroidContentIntent.getStringExtra("param_title");
    if (aa == null) {
      aa = getString(2131369834);
    }
    ab = jdField_a_of_type_AndroidContentIntent.getStringExtra("param_done_button_wording");
    if (ab == null) {
      ab = getString(2131369838);
    }
    ac = jdField_a_of_type_AndroidContentIntent.getStringExtra("param_done_button_highlight_wording");
    if (ac == null) {
      ac = (ab + "({0})");
    }
    s = jdField_a_of_type_AndroidContentIntent.getBooleanExtra("param_add_passed_members_to_result_set", false);
    N = jdField_a_of_type_AndroidContentIntent.getIntExtra("param_exit_animation", 0);
    O = jdField_a_of_type_AndroidContentIntent.getIntExtra("param_back_button_side", 1);
    jdField_c_of_type_Int = jdField_a_of_type_AndroidContentIntent.getIntExtra("param_report_type", 0);
    if (L == 14)
    {
      Object localObject = jdField_a_of_type_AndroidContentIntent.getParcelableArrayListExtra("param_default_selected_troop_members");
      if (localObject != null)
      {
        localObject = ((ArrayList)localObject).iterator();
        while (((Iterator)localObject).hasNext())
        {
          ResultRecord localResultRecord = (ResultRecord)((Iterator)localObject).next();
          jdField_j_of_type_JavaUtilArrayList.add(localResultRecord);
        }
      }
    }
  }
  
  boolean d()
  {
    if (I == 3000)
    {
      if (jdField_j_of_type_JavaUtilArrayList.size() >= P)
      {
        if ((L == 12) && (P == 1))
        {
          b(2131367994);
          return true;
        }
        b(2131367993);
        return true;
      }
    }
    else if (I == 1)
    {
      if (J == 0)
      {
        if (jdField_j_of_type_JavaUtilArrayList.size() >= P)
        {
          b(2131369454);
          return true;
        }
      }
      else if ((J == 1) && (!jdField_i_of_type_Boolean) && (jdField_j_of_type_JavaUtilArrayList.size() >= P))
      {
        b(2131369454);
        return true;
      }
    }
    else
    {
      int i1;
      if (I == 9003)
      {
        i1 = jdField_a_of_type_ComTencentMobileqqActivityBlessBlessManager.f();
        if (jdField_j_of_type_JavaUtilArrayList.size() >= i1)
        {
          b(String.format(getString(2131371920), new Object[] { Integer.valueOf(jdField_a_of_type_ComTencentMobileqqActivityBlessBlessManager.e()) }));
          return true;
        }
      }
      else if (jdField_j_of_type_JavaUtilArrayList.size() >= P)
      {
        if ((r) && (jdField_h_of_type_JavaUtilArrayList != null)) {}
        for (i1 = jdField_h_of_type_JavaUtilArrayList.size();; i1 = 0)
        {
          b(String.format(getString(2131369861), new Object[] { Integer.valueOf(i1 + P) }));
          if (9999 != I) {
            break;
          }
          DingdongPluginHelper.a("0X8005EA5");
          return true;
        }
      }
    }
    return false;
  }
  
  public boolean dispatchTouchEvent(MotionEvent paramMotionEvent)
  {
    if (jdField_a_of_type_AndroidWidgetEditText == null) {
      return super.dispatchTouchEvent(paramMotionEvent);
    }
    int[] arrayOfInt = new int[2];
    jdField_a_of_type_AndroidWidgetEditText.getLocationOnScreen(arrayOfInt);
    int i1 = arrayOfInt[0];
    int i2 = arrayOfInt[1];
    if ((paramMotionEvent.getX() >= i1) && (paramMotionEvent.getX() <= i1 + jdField_a_of_type_AndroidWidgetEditText.getWidth()) && (paramMotionEvent.getY() >= i2) && (paramMotionEvent.getY() > i2 + jdField_a_of_type_AndroidWidgetEditText.getHeight())) {}
    return super.dispatchTouchEvent(paramMotionEvent);
  }
  
  protected void doOnActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if (jdField_a_of_type_ComTencentCommonAppInnerFrameManager != null) {
      jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a(paramInt1, paramInt2, paramIntent);
    }
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    setTheme(2131559121);
    super.doOnCreate(paramBundle);
    d();
    a();
    if (jdField_a_of_type_AndroidContentIntent.getBooleanExtra("sendToVideo", false) == true) {
      super.getWindow().addFlags(524288);
    }
    e();
    c();
    jdField_a_of_type_Float = getResourcesgetDisplayMetricsdensity;
    f();
    k();
    s();
    b();
    jdField_a_of_type_AndroidGraphicsBitmap = Bitmap.createBitmap(1, 1, Bitmap.Config.ALPHA_8);
    jdField_b_of_type_AndroidGraphicsBitmap = ImageUtil.a();
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder = new FaceDecoder(this, app);
    jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity$GridViewAdapter);
    paramBundle = new IntentFilter();
    paramBundle.addAction("tencent.av.v2q.StopVideoChat");
    jdField_a_of_type_AndroidContentBroadcastReceiver = new mnf(this);
    registerReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver, paramBundle);
    if (I == 9003)
    {
      jdField_a_of_type_ComTencentMobileqqActivityBlessBlessManager = ((BlessManager)app.getManager(137));
      Object localObject = getIntent().getStringArrayListExtra("param_uins_selected_friends");
      if ((localObject != null) && (((ArrayList)localObject).size() > 0))
      {
        paramBundle = (FriendsManager)app.getManager(50);
        ArrayList localArrayList = new ArrayList();
        localObject = ((ArrayList)localObject).iterator();
        while (((Iterator)localObject).hasNext())
        {
          String str = (String)((Iterator)localObject).next();
          Friends localFriends = paramBundle.c(str);
          if (localFriends != null) {
            localArrayList.add(a(str, localFriends.getFriendNick(), 0, "-1"));
          }
        }
        a(localArrayList, false);
      }
    }
    paramBundle = getIntent().getParcelableArrayListExtra("param_selected_records_for_create_discussion");
    if (paramBundle != null) {
      a(paramBundle, false);
    }
    return true;
  }
  
  protected void doOnDestroy()
  {
    super.doOnDestroy();
    jdField_a_of_type_ComTencentCommonAppInnerFrameManager.d();
    removeObserver(jdField_a_of_type_ComTencentMobileqqAppDiscussionObserver);
    removeObserver(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
    removeObserver(jdField_a_of_type_ComTencentMobileqqAppTroopObserver);
    if ((jdField_a_of_type_AndroidAppDialog != null) && (jdField_a_of_type_AndroidAppDialog.isShowing())) {
      jdField_a_of_type_AndroidAppDialog.dismiss();
    }
    if (jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder != null) {
      jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.d();
    }
    if (jdField_a_of_type_CooperationDingdongDingdongOpenIdProvider != null) {
      jdField_a_of_type_CooperationDingdongDingdongOpenIdProvider.a();
    }
  }
  
  protected void doOnNewIntent(Intent paramIntent)
  {
    super.doOnNewIntent(paramIntent);
    if (QLog.isColorLevel()) {
      QLog.d("SelectMemberActivity", 2, "doOnNewIntent");
    }
    if (I == 9003)
    {
      b();
      ((SelectMemberInnerFrame)jdField_a_of_type_ComTencentCommonAppInnerFrameManager.getCurrentView()).f();
    }
  }
  
  protected void doOnPause()
  {
    super.doOnPause();
    jdField_a_of_type_ComTencentCommonAppInnerFrameManager.b();
    c(false);
  }
  
  protected void doOnResume()
  {
    super.doOnResume();
    jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a();
    c(true);
    if ((I == 9003) && (mSystemBarComp != null))
    {
      int i1 = getResources().getColor(2131427696);
      mSystemBarComp.a(i1);
      mSystemBarComp.b(i1);
    }
  }
  
  protected void doOnStart()
  {
    super.doOnStart();
    getWindow().setSoftInputMode(16);
  }
  
  protected void doOnStop()
  {
    super.doOnStop();
    getWindow().setSoftInputMode(48);
    jdField_a_of_type_ComTencentCommonAppInnerFrameManager.c();
  }
  
  protected void e()
  {
    RelativeLayout localRelativeLayout = (RelativeLayout)findViewById(2131296923);
    if (ImmersiveUtils.isSupporImmersive() == 1)
    {
      localRelativeLayout.setFitsSystemWindows(true);
      localRelativeLayout.setPadding(0, ImmersiveUtils.a(this), 0, 0);
    }
    jdField_b_of_type_AndroidViewView = findViewById(2131296601);
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131297034));
    jdField_b_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131297035));
    jdField_c_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131297323));
    d = ((TextView)findViewById(2131297081));
    jdField_a_of_type_AndroidWidgetLinearLayout = ((LinearLayout)findViewById(2131298519));
    jdField_a_of_type_ComTencentCommonAppInnerFrameManager = ((InnerFrameManager)findViewById(2131298520));
    jdField_a_of_type_AndroidWidgetHorizontalScrollView = ((HorizontalScrollView)findViewById(2131297551));
    jdField_a_of_type_AndroidWidgetGridView = ((GridView)findViewById(2131298515));
    jdField_a_of_type_AndroidWidgetGridView.setContentDescription("");
    jdField_a_of_type_AndroidWidgetImageView = ((ImageView)findViewById(2131298518));
    jdField_a_of_type_AndroidViewView = findViewById(2131296985);
    jdField_a_of_type_AndroidViewView.setVisibility(8);
    jdField_a_of_type_AndroidWidgetEditText = ((EditText)findViewById(2131298385));
  }
  
  protected void f()
  {
    if (Build.VERSION.SDK_INT >= 9)
    {
      jdField_a_of_type_AndroidWidgetHorizontalScrollView.setOverScrollMode(2);
      jdField_a_of_type_AndroidWidgetGridView.setOverScrollMode(2);
    }
    jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity$GridViewAdapter = new SelectMemberActivity.GridViewAdapter(this, this);
    jdField_a_of_type_AndroidWidgetGridView.setAdapter(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity$GridViewAdapter);
    jdField_a_of_type_AndroidWidgetGridView.setSmoothScrollbarEnabled(false);
    if ((jdField_j_of_type_JavaUtilArrayList.size() != 0) && (L == 14))
    {
      Iterator localIterator = jdField_j_of_type_JavaUtilArrayList.iterator();
      while (localIterator.hasNext())
      {
        ResultRecord localResultRecord = (ResultRecord)localIterator.next();
        b = ContactUtils.f(app, c, jdField_a_of_type_JavaLangString);
      }
      a(true);
    }
    jdField_a_of_type_AndroidWidgetGridView.setOnItemClickListener(new mmx(this));
    d.setOnClickListener(new mmy(this));
  }
  
  public void finish()
  {
    super.finish();
    switch (N)
    {
    default: 
      overridePendingTransition(0, 2130968584);
    }
    try
    {
      for (;;)
      {
        if (jdField_a_of_type_AndroidContentBroadcastReceiver != null)
        {
          unregisterReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver);
          jdField_a_of_type_AndroidContentBroadcastReceiver = null;
        }
        if (L == 15) {
          jdField_a_of_type_ComTencentMobileqqActivityBlessBlessManager.a();
        }
        return;
        overridePendingTransition(2130968587, 2130968588);
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.d("SelectMemberActivity", 2, "", localException);
        }
      }
    }
  }
  
  protected void g()
  {
    jdField_a_of_type_AndroidWidgetEditText.setOnFocusChangeListener(new mnb(this));
  }
  
  public void h()
  {
    Object localObject1;
    Object localObject2;
    Object localObject3;
    int i3;
    int i2;
    int i1;
    switch (I)
    {
    default: 
      jdField_a_of_type_AndroidContentIntent.putParcelableArrayListExtra("result_set", jdField_j_of_type_JavaUtilArrayList);
      ((InputMethodManager)getSystemService("input_method")).hideSoftInputFromWindow(getWindow().peekDecorView().getWindowToken(), 0);
      setResult(-1, jdField_a_of_type_AndroidContentIntent);
      finish();
      return;
    case 3000: 
      if (s)
      {
        localObject1 = jdField_h_of_type_JavaUtilArrayList.iterator();
        while (((Iterator)localObject1).hasNext())
        {
          localObject2 = (String)((Iterator)localObject1).next();
          localObject3 = new ResultRecord();
          jdField_a_of_type_JavaLangString = ((String)localObject2);
          jdField_a_of_type_Int = 0;
          c = "-1";
          jdField_j_of_type_JavaUtilArrayList.add(localObject3);
        }
      }
      localObject1 = (FriendsManager)app.getManager(50);
      i3 = jdField_j_of_type_JavaUtilArrayList.size();
      localObject2 = jdField_j_of_type_JavaUtilArrayList.iterator();
      i2 = 0;
      i1 = 0;
      label217:
      if (((Iterator)localObject2).hasNext())
      {
        localObject3 = (ResultRecord)((Iterator)localObject2).next();
        if (jdField_a_of_type_Int == 3) {
          i2 = 1;
        }
        if (jdField_a_of_type_Int != 5)
        {
          i1 = 1;
          label261:
          if ((i2 == 0) || (i1 == 0)) {
            break;
          }
        }
      }
      break;
    }
    for (;;)
    {
      if (i2 != 0)
      {
        ReportController.b(app, "CliOper", "", "", "Network_circle", "Mutichat_start", 0, 0, "0", "", "", "");
        label309:
        if ((J != 0) || (i3 != 1) || ((L == 10) && (L != 13)) || (i1 == 0)) {
          break label933;
        }
        if (QLog.isColorLevel()) {
          QLog.d("SelectMemberActivity", 2, "start C2C conversation");
        }
        localObject2 = AIOUtils.a(new Intent(this, SplashActivity.class), null);
        ((Intent)localObject2).putExtra("uin", jdField_j_of_type_JavaUtilArrayList.get(0)).jdField_a_of_type_JavaLangString);
        if (localObject1 != null)
        {
          localObject3 = ((FriendsManager)localObject1).c(jdField_j_of_type_JavaUtilArrayList.get(0)).jdField_a_of_type_JavaLangString);
          if (!((FriendsManager)localObject1).b(jdField_j_of_type_JavaUtilArrayList.get(0)).jdField_a_of_type_JavaLangString)) {
            break label742;
          }
          ((Intent)localObject2).putExtra("uintype", 0);
        }
      }
      for (;;)
      {
        if (localObject3 != null)
        {
          ((Intent)localObject2).putExtra("cSpecialFlag", cSpecialFlag);
          if (cSpecialFlag == 1)
          {
            ((Intent)localObject2).setClass(this, SplashActivity.class);
            ((Intent)localObject2).putExtra("chat_subType", 1);
          }
        }
        ((Intent)localObject2).putExtra("uinname", jdField_j_of_type_JavaUtilArrayList.get(0)).b);
        startActivity((Intent)localObject2);
        N = 2;
        if (L == 13)
        {
          localObject1 = null;
          localObject3 = ((Intent)localObject2).getStringExtra("troop_uin");
          i1 = ((Intent)localObject2).getIntExtra("uintype", -1);
          if (i1 == -1) {
            break;
          }
          localObject2 = ((PhoneContactManager)app.getManager(10)).a(jdField_j_of_type_JavaUtilArrayList.get(0)).jdField_a_of_type_JavaLangString);
          if (localObject2 != null) {
            localObject1 = nationCode + mobileCode;
          }
          if (!ChatActivityUtils.a(app, this, i1, jdField_j_of_type_JavaUtilArrayList.get(0)).jdField_a_of_type_JavaLangString, jdField_j_of_type_JavaUtilArrayList.get(0)).b, (String)localObject1, true, (String)localObject3, true, true, jdField_a_of_type_AndroidOsHandler$Callback, "from_internal")) {}
        }
        finish();
        return;
        break label217;
        ReportController.b(app, "CliOper", "", "", "Network_circle", "Mutichat_start", 0, 0, "1", "", "", "");
        break label309;
        label742:
        if (jdField_j_of_type_JavaUtilArrayList.get(0)).jdField_a_of_type_Int == 1)
        {
          ((Intent)localObject2).putExtra("uintype", 1000);
          localObject1 = a(jdField_j_of_type_JavaUtilArrayList.get(0)).c);
          if (localObject1 != null) {
            ((Intent)localObject2).putExtra("troop_uin", (String)localObject1);
          }
        }
        else if (jdField_j_of_type_JavaUtilArrayList.get(0)).jdField_a_of_type_Int == 2)
        {
          ((Intent)localObject2).putExtra("uintype", 1004);
          ((Intent)localObject2).putExtra("troop_uin", jdField_j_of_type_JavaUtilArrayList.get(0)).c);
        }
        else if (jdField_j_of_type_JavaUtilArrayList.get(0)).jdField_a_of_type_Int == 3)
        {
          ((Intent)localObject2).putExtra("uintype", 1021);
        }
        else if (jdField_j_of_type_JavaUtilArrayList.get(0)).jdField_a_of_type_Int == 4)
        {
          ((Intent)localObject2).putExtra("uintype", 1006);
        }
      }
      label933:
      if ((J == 0) && (i3 == 1) && (L == 10) && (i1 != 0))
      {
        if (QLog.isColorLevel()) {
          QLog.d("SelectMemberActivity", 2, "start C2C audio");
        }
        if ((jdField_j_of_type_JavaUtilArrayList.get(0)).jdField_a_of_type_Int == 0) && (jdField_j_of_type_JavaUtilArrayList.get(0)).jdField_a_of_type_Int != 1)) {
          break label1647;
        }
        localObject1 = a(jdField_j_of_type_JavaUtilArrayList.get(0)).c);
        i1 = 1000;
      }
      for (;;)
      {
        if (jdField_j_of_type_JavaUtilArrayList.get(0)).jdField_a_of_type_Int == 2)
        {
          i1 = 1004;
          localObject1 = jdField_j_of_type_JavaUtilArrayList.get(0)).c;
        }
        for (;;)
        {
          if (jdField_j_of_type_JavaUtilArrayList.get(0)).jdField_a_of_type_Int == 3) {
            i1 = 1021;
          }
          for (;;)
          {
            localObject2 = null;
            localObject3 = ((PhoneContactManager)app.getManager(10)).a(jdField_j_of_type_JavaUtilArrayList.get(0)).jdField_a_of_type_JavaLangString);
            if (localObject3 != null) {
              localObject2 = nationCode + mobileCode;
            }
            if (!ChatActivityUtils.a(app, this, i1, jdField_j_of_type_JavaUtilArrayList.get(0)).jdField_a_of_type_JavaLangString, jdField_j_of_type_JavaUtilArrayList.get(0)).b, (String)localObject2, true, (String)localObject1, true, true, jdField_a_of_type_AndroidOsHandler$Callback, "from_internal")) {
              break;
            }
            N = 2;
            finish();
            return;
            if (jdField_j_of_type_JavaUtilArrayList.get(0)).jdField_a_of_type_Int == 4) {
              i1 = 1006;
            }
          }
          if (J == 0) {}
          for (i2 = 2131367972;; i2 = 2131367973)
          {
            jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog = new QQProgressDialog(this, getResources().getDimensionPixelSize(2131492908));
            jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.b(i2);
            jdField_a_of_type_ComTencentMobileqqWidgetQQProgressDialog.show();
            if ((J == 0) || (i1 != 0))
            {
              localObject1 = new mml(this, (FriendsManager)localObject1);
              ((Thread)localObject1).setName("SelectMemberActivity_addDiscussion");
              ThreadManager.a((Runnable)localObject1, null, false);
            }
            if (J == 0) {
              break;
            }
            p();
            if (i1 != 0) {
              break;
            }
            finish();
            return;
          }
          localObject1 = new ArrayList();
          localObject2 = jdField_j_of_type_JavaUtilArrayList.iterator();
          while (((Iterator)localObject2).hasNext()) {
            ((ArrayList)localObject1).add(nextjdField_a_of_type_JavaLangString);
          }
          if ((((ArrayList)localObject1).size() > 0) && (Z.length() > 0))
          {
            if (QLog.isColorLevel()) {
              QLog.d("SelectMemberActivity", 2, "add troop member: troopCode: " + Z + " member count: " + ((ArrayList)localObject1).size());
            }
            if (!a())
            {
              QQToast.a(this, 2131369202, 0).b(getTitleBarHeight());
              return;
            }
            ((TroopHandler)app.a(20)).a(Z, (ArrayList)localObject1, "");
            r();
            jdField_a_of_type_AndroidAppDialog.show();
            return;
          }
          finish();
          return;
          ((InputMethodManager)getSystemService("input_method")).hideSoftInputFromWindow(getWindow().peekDecorView().getWindowToken(), 0);
          if (L == 15)
          {
            localObject1 = new Intent(this, BlessTypeActivity.class);
            ((Intent)localObject1).putParcelableArrayListExtra("result_set", jdField_j_of_type_JavaUtilArrayList);
            startActivity((Intent)localObject1);
            return;
          }
          jdField_a_of_type_AndroidContentIntent.putParcelableArrayListExtra("result_set", jdField_j_of_type_JavaUtilArrayList);
          setResult(-1, jdField_a_of_type_AndroidContentIntent);
          finish();
          return;
          q();
          return;
        }
        label1647:
        i1 = 0;
        localObject1 = null;
      }
      break label261;
    }
  }
  
  public void i()
  {
    if (jdField_j_of_type_JavaUtilArrayList.size() >= Q)
    {
      b(true);
      return;
    }
    b(false);
  }
  
  protected void j()
  {
    RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-1, (int)(jdField_a_of_type_Float * 40.0F));
    int i1 = (int)(jdField_a_of_type_Float * 40.0F);
    int i2 = (int)(jdField_a_of_type_Float * 10.0F);
    if (jdField_j_of_type_JavaUtilArrayList.size() > 0) {
      if (jdField_j_of_type_JavaUtilArrayList.size() < 5)
      {
        i1 = (int)((jdField_j_of_type_JavaUtilArrayList.size() * 40 + jdField_j_of_type_JavaUtilArrayList.size() * 10) * jdField_a_of_type_Float) + (int)(jdField_a_of_type_Float * 10.0F);
        jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
      }
    }
    for (;;)
    {
      localLayoutParams.addRule(15);
      localLayoutParams.setMargins(i1, 0, i2, 0);
      jdField_a_of_type_AndroidWidgetEditText.setLayoutParams(localLayoutParams);
      return;
      i1 = (int)(230.0F * jdField_a_of_type_Float);
      break;
      jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
    }
  }
  
  public void k()
  {
    if (jdField_a_of_type_AndroidViewInputmethodInputMethodManager == null) {
      jdField_a_of_type_AndroidViewInputmethodInputMethodManager = ((InputMethodManager)getSystemService("input_method"));
    }
    g();
    jdField_a_of_type_AndroidWidgetEditText.setOnKeyListener(new mnc(this));
    jdField_a_of_type_AndroidWidgetEditText.addTextChangedListener(new mnd(this));
    jdField_a_of_type_AndroidViewView.setOnTouchListener(new mne(this));
  }
  
  void l()
  {
    jdField_a_of_type_AndroidViewInputmethodInputMethodManager.hideSoftInputFromWindow(getWindow().peekDecorView().getWindowToken(), 0);
    jdField_a_of_type_AndroidWidgetEditText.setText("");
    jdField_a_of_type_AndroidWidgetEditText.clearFocus();
    jdField_a_of_type_AndroidViewView.setVisibility(8);
    v = false;
  }
  
  public void m()
  {
    if ((jdField_a_of_type_AndroidWidgetTextView != null) && (jdField_a_of_type_AndroidGraphicsDrawableDrawable == null))
    {
      jdField_a_of_type_AndroidGraphicsDrawableDrawable = getResources().getDrawable(2130838193);
      jdField_a_of_type_AndroidWidgetTextView.setCompoundDrawablePadding(10);
      jdField_a_of_type_AndroidWidgetTextView.setCompoundDrawablesWithIntrinsicBounds(jdField_a_of_type_AndroidGraphicsDrawableDrawable, null, null, null);
      ((Animatable)jdField_a_of_type_AndroidGraphicsDrawableDrawable).start();
    }
  }
  
  public void n()
  {
    if ((jdField_a_of_type_AndroidWidgetTextView != null) && (jdField_a_of_type_AndroidGraphicsDrawableDrawable != null))
    {
      ((Animatable)jdField_a_of_type_AndroidGraphicsDrawableDrawable).stop();
      jdField_a_of_type_AndroidGraphicsDrawableDrawable = null;
      jdField_a_of_type_AndroidWidgetTextView.setCompoundDrawables(null, null, null, null);
    }
  }
  
  public void o()
  {
    String str = null;
    int i1 = 0;
    Iterator localIterator = jdField_j_of_type_JavaUtilArrayList.iterator();
    ResultRecord localResultRecord;
    if (localIterator.hasNext())
    {
      localResultRecord = (ResultRecord)localIterator.next();
      if (jdField_a_of_type_Int != 5) {
        break label139;
      }
      if (i1 >= 3) {
        new StringBuilder().append(str).append("…").toString();
      }
    }
    else
    {
      if (jdField_a_of_type_ComTencentMobileqqSearchFragmentContactSearchFragment != null) {
        jdField_a_of_type_ComTencentMobileqqSearchFragmentContactSearchFragment.a(a(), jdField_h_of_type_JavaUtilArrayList);
      }
      return;
    }
    if (str == null)
    {
      str = b;
      label100:
      i1 += 1;
    }
    label139:
    for (;;)
    {
      break;
      str = str + "、" + b;
      break label100;
    }
  }
  
  public boolean onBackEvent()
  {
    if (!TextUtils.isEmpty(jdField_a_of_type_AndroidWidgetEditText.getText()))
    {
      l();
      return true;
    }
    if (jdField_a_of_type_AndroidWidgetEditText.hasFocus()) {
      l();
    }
    switch (jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a())
    {
    default: 
      return super.onBackEvent();
    case 1: 
    case 2: 
    case 3: 
    case 4: 
    case 5: 
    case 6: 
      n();
      jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a(0);
      return true;
    case 7: 
      n();
      jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a(1);
      return true;
    case 8: 
      if (o)
      {
        finish();
        return true;
      }
      n();
      jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a(4);
      return true;
    }
    if (p)
    {
      finish();
      return true;
    }
    n();
    jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a(4);
    return true;
  }
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    }
    do
    {
      return;
      startActivity(new Intent(this, SelectMemberDetailActivity.class));
      if (L == 11)
      {
        ReportController.b(app, "CliOper", "", "", "0X8005529", "0X8005529", 0, 0, "", "", "", "");
        return;
      }
    } while (L != 10);
    ReportController.b(app, "CliOper", "", "", "0X8005524", "0X8005524", 0, 0, "", "", "", "");
  }
  
  protected void onRestart()
  {
    super.onRestart();
    if ((I == 9003) && (jdField_a_of_type_ComTencentMobileqqActivityBlessBlessManager.h()))
    {
      jdField_a_of_type_ComTencentMobileqqActivityBlessBlessManager.a(false);
      Object localObject = jdField_a_of_type_ComTencentMobileqqActivityBlessBlessManager.a();
      if ((localObject != null) && (((ArrayList)localObject).size() >= 0))
      {
        FriendsManager localFriendsManager = (FriendsManager)app.getManager(50);
        ArrayList localArrayList = new ArrayList();
        localObject = ((ArrayList)localObject).iterator();
        while (((Iterator)localObject).hasNext())
        {
          String str = (String)((Iterator)localObject).next();
          Friends localFriends = localFriendsManager.c(str);
          if (localFriends != null) {
            localArrayList.add(a(str, localFriends.getFriendNick(), 0, "-1"));
          }
        }
        a(localArrayList, true);
        ((SelectMemberInnerFrame)jdField_a_of_type_ComTencentCommonAppInnerFrameManager.getCurrentView()).f();
      }
    }
  }
  
  protected void p()
  {
    if ((jdField_j_of_type_JavaUtilArrayList != null) && (jdField_j_of_type_JavaUtilArrayList.size() > 0))
    {
      Object localObject = a();
      Intent localIntent = new Intent("tencent.video.q2v.SelectMember");
      localIntent.setPackage(app.getApplication().getPackageName());
      if (((ArrayList)localObject).size() > 0) {
        localIntent.putParcelableArrayListExtra("SelectMemberList", (ArrayList)localObject);
      }
      int i1 = jdField_j_of_type_JavaUtilArrayList.size();
      localObject = jdField_j_of_type_JavaUtilArrayList.get(0)).b;
      localIntent.putExtra("InviteCount", i1);
      localIntent.putExtra("FirstName", (String)localObject);
      app.a().sendBroadcast(localIntent);
    }
  }
  
  protected void requestWindowFeature(Intent paramIntent)
  {
    requestWindowFeature(1);
  }
}
