package com.tencent.mobileqq.activity.recent;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Resources;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import android.support.v4.view.ViewPager;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewStub;
import android.view.ViewStub.OnInflateListener;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RadioGroup;
import android.widget.RadioGroup.OnCheckedChangeListener;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.av.utils.BitmapTools;
import com.tencent.biz.eqq.CrmUtils;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.recent.data.RecentCallItem;
import com.tencent.mobileqq.activity.selectmember.PhoneContactSelectActivity;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.FrameHelperActivity;
import com.tencent.mobileqq.app.FriendListHandler;
import com.tencent.mobileqq.app.IphoneTitleBarActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.data.QCallRecent;
import com.tencent.mobileqq.fpsreport.FPSSwipListView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.jumplightalk.CallRedDotLightalkLis;
import com.tencent.mobileqq.qcall.PstnCardInfo;
import com.tencent.mobileqq.qcall.PstnManager;
import com.tencent.mobileqq.qcall.QCallFacade;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.theme.diy.ThemeBackground;
import com.tencent.mobileqq.troop.widget.RedDotRadioButton;
import com.tencent.mobileqq.util.BitmapManager;
import com.tencent.mobileqq.utils.CustomHandler;
import com.tencent.mobileqq.utils.SharedPreUtils;
import com.tencent.mobileqq.vipav.VipFunCallManager;
import com.tencent.mobileqq.widget.GuideViewBuilder;
import com.tencent.mobileqq.widget.GuideViewBuilder.GuideLayoutParams;
import com.tencent.mobileqq.widget.PullRefreshHeader;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.AbsListView;
import com.tencent.widget.AbsListView.OnScrollListener;
import com.tencent.widget.ListView;
import com.tencent.widget.ListView.FixedViewInfo;
import com.tencent.widget.OverScrollViewListener;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import mge;
import mgf;
import mgg;
import mgh;
import mgi;
import mgj;
import mgk;
import mgm;
import mgn;
import mgo;
import mgp;
import mgq;
import mgr;
import mgs;
import mgt;
import mgu;
import mgv;
import mgw;
import mgx;
import mqq.app.Constants.LogoutReason;
import mqq.os.MqqHandler;

public class RecentCallHelper
{
  public static final int a = 1;
  public static final String a = "RecentCallHelper";
  public static final boolean a = true;
  public static final int b = 2;
  public static final String b = "-";
  public static final int c = 3;
  private long jdField_a_of_type_Long;
  protected Handler.Callback a;
  private ViewPager jdField_a_of_type_AndroidSupportV4ViewViewPager;
  private View jdField_a_of_type_AndroidViewView;
  private ViewStub.OnInflateListener jdField_a_of_type_AndroidViewViewStub$OnInflateListener;
  private ViewStub jdField_a_of_type_AndroidViewViewStub;
  private Button jdField_a_of_type_AndroidWidgetButton;
  private ImageView jdField_a_of_type_AndroidWidgetImageView;
  private LinearLayout jdField_a_of_type_AndroidWidgetLinearLayout;
  private RadioGroup jdField_a_of_type_AndroidWidgetRadioGroup;
  private RelativeLayout jdField_a_of_type_AndroidWidgetRelativeLayout;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  private AnonymousEntranceView jdField_a_of_type_ComTencentMobileqqActivityRecentAnonymousEntranceView;
  private LocalSearchBar jdField_a_of_type_ComTencentMobileqqActivityRecentLocalSearchBar;
  public RecentAdapter a;
  private RecommendAdapter jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendAdapter;
  private RecommendCallHelper jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper;
  public BaseActivity a;
  public QQAppInterface a;
  private FPSSwipListView jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView;
  private CallRedDotLightalkLis jdField_a_of_type_ComTencentMobileqqJumplightalkCallRedDotLightalkLis;
  private PstnManager jdField_a_of_type_ComTencentMobileqqQcallPstnManager;
  ThemeBackground jdField_a_of_type_ComTencentMobileqqThemeDiyThemeBackground;
  private RedDotRadioButton jdField_a_of_type_ComTencentMobileqqTroopWidgetRedDotRadioButton;
  private PullRefreshHeader jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader;
  private Runnable jdField_a_of_type_JavaLangRunnable;
  private HashMap jdField_a_of_type_JavaUtilHashMap;
  public MqqHandler a;
  private View jdField_b_of_type_AndroidViewView;
  private ImageView jdField_b_of_type_AndroidWidgetImageView;
  private RelativeLayout jdField_b_of_type_AndroidWidgetRelativeLayout;
  private TextView jdField_b_of_type_AndroidWidgetTextView;
  public boolean b;
  private ImageView jdField_c_of_type_AndroidWidgetImageView;
  private String jdField_c_of_type_JavaLangString;
  public boolean c;
  private int jdField_d_of_type_Int;
  private ImageView jdField_d_of_type_AndroidWidgetImageView;
  boolean jdField_d_of_type_Boolean;
  private int jdField_e_of_type_Int;
  private ImageView jdField_e_of_type_AndroidWidgetImageView;
  boolean jdField_e_of_type_Boolean;
  boolean f;
  boolean g;
  public boolean h;
  public boolean i;
  private boolean j;
  private boolean k;
  private boolean l;
  private boolean m;
  private boolean n;
  private boolean o;
  private boolean p;
  private boolean q;
  private boolean r;
  
  public RecentCallHelper(QQAppInterface paramQQAppInterface, View paramView1, View paramView2, RadioGroup.OnCheckedChangeListener paramOnCheckedChangeListener, ViewStub.OnInflateListener paramOnInflateListener)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_b_of_type_Boolean = true;
    jdField_a_of_type_AndroidWidgetRelativeLayout = null;
    j = false;
    jdField_b_of_type_AndroidWidgetRelativeLayout = null;
    jdField_a_of_type_AndroidWidgetLinearLayout = null;
    k = false;
    l = true;
    jdField_d_of_type_Boolean = false;
    jdField_e_of_type_Boolean = false;
    f = false;
    m = false;
    n = true;
    g = false;
    jdField_d_of_type_Int = 300;
    jdField_c_of_type_JavaLangString = "";
    jdField_e_of_type_Int = 0;
    o = false;
    p = false;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = null;
    q = false;
    jdField_a_of_type_AndroidViewViewStub$OnInflateListener = null;
    jdField_b_of_type_AndroidViewView = null;
    jdField_a_of_type_ComTencentMobileqqJumplightalkCallRedDotLightalkLis = new mge(this);
    jdField_a_of_type_AndroidOsHandler$Callback = new mgq(this);
    jdField_a_of_type_MqqOsMqqHandler = new CustomHandler(Looper.getMainLooper(), jdField_a_of_type_AndroidOsHandler$Callback);
    r = false;
    jdField_a_of_type_JavaLangRunnable = null;
    jdField_a_of_type_ComTencentMobileqqThemeDiyThemeBackground = null;
    jdField_a_of_type_AndroidWidgetRadioGroup = ((RadioGroup)paramView1.findViewById(2131297682));
    IphoneTitleBarActivity.setLayerType(jdField_a_of_type_AndroidWidgetRadioGroup);
    jdField_a_of_type_AndroidWidgetRadioGroup.setVisibility(0);
    jdField_a_of_type_AndroidWidgetRadioGroup.setOnCheckedChangeListener(paramOnCheckedChangeListener);
    jdField_a_of_type_ComTencentMobileqqTroopWidgetRedDotRadioButton = ((RedDotRadioButton)jdField_a_of_type_AndroidWidgetRadioGroup.findViewById(2131297684));
    if (AppSetting.i)
    {
      paramView1 = jdField_a_of_type_AndroidWidgetRadioGroup.findViewById(2131297683);
      paramView1.setContentDescription("消息 标签");
      paramView1.setFocusable(true);
      jdField_a_of_type_ComTencentMobileqqTroopWidgetRedDotRadioButton.setContentDescription("电话 标签");
      jdField_a_of_type_ComTencentMobileqqTroopWidgetRedDotRadioButton.setFocusable(true);
    }
    jdField_e_of_type_Int = SharedPreUtils.e(BaseApplication.getContext());
    a(paramQQAppInterface);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(jdField_a_of_type_ComTencentMobileqqJumplightalkCallRedDotLightalkLis);
    i = (BaseApplicationImpl.getContext().getSharedPreferences("call_tab_lightalk_red_dot", 0).getBoolean("show_reddot", true) | i);
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null) {
      ThreadManager.a(new mgr(this), 5, null, true);
    }
    jdField_a_of_type_AndroidViewViewStub = ((ViewStub)paramView2.findViewById(2131297328));
    if (jdField_a_of_type_AndroidViewViewStub != null)
    {
      jdField_a_of_type_AndroidViewViewStub.setLayoutResource(2130904056);
      jdField_a_of_type_AndroidViewViewStub.setOnInflateListener(paramOnInflateListener);
      return;
    }
    q = true;
    jdField_a_of_type_AndroidViewViewStub$OnInflateListener = paramOnInflateListener;
    jdField_b_of_type_AndroidViewView = paramView2.findViewById(2131301099);
  }
  
  public RecentCallHelper(QQAppInterface paramQQAppInterface, View paramView, ViewStub.OnInflateListener paramOnInflateListener)
  {
    jdField_b_of_type_Boolean = true;
    jdField_a_of_type_AndroidWidgetRelativeLayout = null;
    j = false;
    jdField_b_of_type_AndroidWidgetRelativeLayout = null;
    jdField_a_of_type_AndroidWidgetLinearLayout = null;
    k = false;
    l = true;
    jdField_d_of_type_Boolean = false;
    jdField_e_of_type_Boolean = false;
    f = false;
    m = false;
    n = true;
    g = false;
    jdField_d_of_type_Int = 300;
    jdField_c_of_type_JavaLangString = "";
    jdField_e_of_type_Int = 0;
    o = false;
    p = false;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = null;
    q = false;
    jdField_a_of_type_AndroidViewViewStub$OnInflateListener = null;
    jdField_b_of_type_AndroidViewView = null;
    jdField_a_of_type_ComTencentMobileqqJumplightalkCallRedDotLightalkLis = new mge(this);
    jdField_a_of_type_AndroidOsHandler$Callback = new mgq(this);
    jdField_a_of_type_MqqOsMqqHandler = new CustomHandler(Looper.getMainLooper(), jdField_a_of_type_AndroidOsHandler$Callback);
    r = false;
    jdField_a_of_type_JavaLangRunnable = null;
    jdField_a_of_type_ComTencentMobileqqThemeDiyThemeBackground = null;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    BaseApplication localBaseApplication = BaseApplication.getContext();
    jdField_e_of_type_Int = SharedPreUtils.e(localBaseApplication);
    o = SharedPreUtils.a(localBaseApplication, paramQQAppInterface.a(), jdField_e_of_type_Int, "acount_uin_first_use_app");
    m = o;
    jdField_a_of_type_AndroidViewViewStub = ((ViewStub)paramView.findViewById(2131297328));
    if (jdField_a_of_type_AndroidViewViewStub != null)
    {
      jdField_a_of_type_AndroidViewViewStub.setLayoutResource(2130904056);
      jdField_a_of_type_AndroidViewViewStub.setOnInflateListener(paramOnInflateListener);
      return;
    }
    q = true;
    jdField_a_of_type_AndroidViewViewStub$OnInflateListener = paramOnInflateListener;
    jdField_b_of_type_AndroidViewView = paramView.findViewById(2131301099);
  }
  
  private RecentCallItem a(String paramString)
  {
    if ((jdField_a_of_type_JavaUtilHashMap == null) || (TextUtils.isEmpty(paramString))) {
      return null;
    }
    return (RecentCallItem)jdField_a_of_type_JavaUtilHashMap.get(paramString);
  }
  
  private void a(int paramInt)
  {
    if (paramInt == 1) {
      PhoneContactSelectActivity.a(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, false);
    }
    while (paramInt != 2) {
      return;
    }
    Intent localIntent = new Intent(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, RecentT9SearchActivity.class);
    localIntent.putExtra("key_is_from_try", false);
    jdField_a_of_type_ComTencentMobileqqAppBaseActivity.startActivity(localIntent);
    jdField_a_of_type_ComTencentMobileqqAppBaseActivity.overridePendingTransition(2130968592, 2130968589);
  }
  
  private void a(Context paramContext, View paramView)
  {
    if (h) {
      return;
    }
    Object localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), 0);
    Object localObject2 = ((PstnManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(142)).a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
    if ((localObject2 != null) && ((pstn_ever_c2c_vip == 1) || (pstn_ever_multi_vip == 1))) {}
    for (int i1 = 1;; i1 = 0)
    {
      FrameHelperActivity.a(jdField_a_of_type_ComTencentMobileqqAppBaseActivity);
      if ((localObject1 == null) || (((SharedPreferences)localObject1).getBoolean("show_pstn_vip_guide_new_flag", false)) || (i1 == 0) || (FrameHelperActivity.a())) {
        break;
      }
      ((SharedPreferences)localObject1).edit().putBoolean("show_pstn_vip_guide_new_flag", true).commit();
      paramView.removeCallbacks(jdField_a_of_type_JavaLangRunnable);
      localObject1 = new GuideViewBuilder(paramContext);
      ((GuideViewBuilder)localObject1).a(paramView.findViewById(2131301095), 1);
      ((GuideViewBuilder)localObject1).a(1, new mgw(this, (GuideViewBuilder)localObject1));
      ((GuideViewBuilder)localObject1).a(paramView.findViewById(2131301096), 2);
      ((GuideViewBuilder)localObject1).a(2, new mgx(this, (GuideViewBuilder)localObject1));
      localObject2 = paramContext.getResources().getDisplayMetrics();
      paramContext = View.inflate(paramContext, 2130904060, null);
      Object localObject3 = (Button)paramContext.findViewById(2131301114);
      if (localObject3 != null) {
        ((Button)localObject3).setOnClickListener(new mgf(this, (GuideViewBuilder)localObject1));
      }
      localObject3 = new GuideViewBuilder.GuideLayoutParams(-2, -2, 48);
      int[] arrayOfInt = new int[2];
      paramView.getLocationOnScreen(arrayOfInt);
      c = ((widthPixels - (int)(228.0F * density)) / 2 - arrayOfInt[0]);
      i1 = paramView.getMeasuredHeight();
      jdField_d_of_type_Int = ((int)(density * 15.0F) + i1);
      ((GuideViewBuilder)localObject1).a(1, paramContext, (GuideViewBuilder.GuideLayoutParams)localObject3);
      ((GuideViewBuilder)localObject1).a(new mgg(this), false);
      return;
    }
  }
  
  private void a(BaseActivity paramBaseActivity, OverScrollViewListener paramOverScrollViewListener)
  {
    if (QLog.isColorLevel()) {
      QLog.d("RecentCallHelper", 2, "initDelay");
    }
    if ((paramBaseActivity == null) || (jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView == null))
    {
      if (QLog.isColorLevel()) {
        QLog.d("RecentCallHelper", 2, "initDelay invalid parameter!");
      }
      return;
    }
    LayoutInflater localLayoutInflater = LayoutInflater.from(paramBaseActivity);
    jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader = ((PullRefreshHeader)localLayoutInflater.inflate(2130903467, jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView, false));
    jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.setOverScrollHeader(jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader);
    jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.setOverScrollListener(paramOverScrollViewListener);
    jdField_b_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)localLayoutInflater.inflate(2130903153, null));
    paramOverScrollViewListener = (ImageView)jdField_b_of_type_AndroidWidgetRelativeLayout.findViewById(2131297331);
    jdField_b_of_type_AndroidWidgetRelativeLayout.setOnClickListener(new mgj(this, paramBaseActivity));
    paramOverScrollViewListener.setOnClickListener(new mgk(this));
    paramOverScrollViewListener.setContentDescription("关闭");
    jdField_a_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)localLayoutInflater.inflate(2130903153, null));
    paramOverScrollViewListener = (ImageView)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131297329);
    TextView localTextView = (TextView)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131297330);
    ImageView localImageView = (ImageView)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131297331);
    paramOverScrollViewListener.setImageResource(2130840227);
    localTextView.setText(2131367577);
    localImageView.setOnClickListener(new mgm(this));
    jdField_a_of_type_AndroidWidgetRelativeLayout.setOnClickListener(new mgn(this, paramBaseActivity));
    jdField_a_of_type_AndroidWidgetLinearLayout = ((LinearLayout)localLayoutInflater.inflate(2130903154, null));
    jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(8);
    paramBaseActivity = (ImageView)jdField_a_of_type_AndroidWidgetLinearLayout.findViewById(2131297333);
    paramBaseActivity.setOnClickListener(new mgo(this));
    paramBaseActivity.setContentDescription("关闭");
    if (!p) {
      f();
    }
    if (QCallFacade.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface)) {
      b(QCallFacade.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface));
    }
    r = true;
  }
  
  private void a(QQAppInterface paramQQAppInterface, MqqHandler paramMqqHandler, boolean paramBoolean)
  {
    jdField_c_of_type_Boolean = true;
    if (paramBoolean)
    {
      FriendListHandler localFriendListHandler = (FriendListHandler)paramQQAppInterface.a(1);
      if (localFriendListHandler != null) {
        localFriendListHandler.d(paramQQAppInterface.a(), (byte)0);
      }
      a(paramMqqHandler, 60000L);
      return;
    }
    a(paramMqqHandler, 800L);
  }
  
  private void a(List paramList)
  {
    if ((paramList == null) || (paramList.size() <= 0)) {
      return;
    }
    if (jdField_a_of_type_JavaUtilHashMap == null) {
      jdField_a_of_type_JavaUtilHashMap = new HashMap(40);
    }
    for (;;)
    {
      int i2 = paramList.size();
      int i1 = 0;
      while (i1 < i2)
      {
        RecentCallItem localRecentCallItem = (RecentCallItem)paramList.get(i1);
        if (localRecentCallItem != null)
        {
          String str = localRecentCallItem.a() + "-" + localRecentCallItem.a();
          jdField_a_of_type_JavaUtilHashMap.put(str, localRecentCallItem);
        }
        i1 += 1;
      }
      break;
      jdField_a_of_type_JavaUtilHashMap.clear();
    }
  }
  
  private void b(Context paramContext, View paramView)
  {
    if (h) {
      return;
    }
    Object localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), 0);
    Object localObject2 = (PstnManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(142);
    Object localObject3 = ((PstnManager)localObject2).a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
    if ((localObject3 != null) && ((pstn_ever_c2c_vip == 1) || (pstn_ever_multi_vip == 1))) {}
    for (int i1 = 1;; i1 = 0)
    {
      FrameHelperActivity.a(jdField_a_of_type_ComTencentMobileqqAppBaseActivity);
      if ((localObject1 == null) || (((SharedPreferences)localObject1).getBoolean("show_pstn_vip_guide_flag", false)) || (i1 != 0) || ((((PstnManager)localObject2).b() != 1) && (((PstnManager)localObject2).c() != 1)) || (FrameHelperActivity.a())) {
        break;
      }
      ((SharedPreferences)localObject1).edit().putBoolean("show_pstn_vip_guide_flag", true).commit();
      if (jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView != null) {
        jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.removeCallbacks(jdField_a_of_type_JavaLangRunnable);
      }
      localObject1 = new GuideViewBuilder(paramContext);
      ((GuideViewBuilder)localObject1).a(paramView, 1);
      ((GuideViewBuilder)localObject1).a(1, new mgh(this));
      localObject2 = paramContext.getResources().getDisplayMetrics();
      paramContext = new View(paramContext);
      paramContext.setBackgroundResource(2130838964);
      localObject3 = new GuideViewBuilder.GuideLayoutParams((int)(density * 190.0F), (int)(103.0F * density), 48);
      int[] arrayOfInt = new int[2];
      paramView.getLocationOnScreen(arrayOfInt);
      c = ((widthPixels - (int)(density * 190.0F)) / 2 - arrayOfInt[0]);
      i1 = paramView.getMeasuredHeight();
      jdField_d_of_type_Int = ((int)(density * 5.0F) + i1);
      ((GuideViewBuilder)localObject1).a(1, paramContext, (GuideViewBuilder.GuideLayoutParams)localObject3);
      ((GuideViewBuilder)localObject1).a(new mgi(this));
      return;
    }
  }
  
  private void b(String paramString)
  {
    if ((jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView != null) && (jdField_a_of_type_AndroidWidgetLinearLayout != null) && (paramString != null) && (paramString.length() > 0))
    {
      TextView localTextView = (TextView)jdField_a_of_type_AndroidWidgetLinearLayout.findViewById(2131297332);
      if (localTextView != null)
      {
        localTextView.setText(paramString);
        localTextView.setContentDescription(paramString);
      }
      if (!k) {
        jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.a(jdField_a_of_type_AndroidWidgetLinearLayout);
      }
      jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(0);
      k = true;
    }
  }
  
  private boolean c()
  {
    PstnCardInfo localPstnCardInfo = ((PstnManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(142)).a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (localPstnCardInfo != null) {
      if (pstn_ever_c2c_vip != 1)
      {
        bool1 = bool2;
        if (pstn_ever_multi_vip != 1) {}
      }
      else
      {
        bool1 = true;
      }
    }
    return bool1;
  }
  
  private void d(boolean paramBoolean)
  {
    if (paramBoolean) {}
    try
    {
      Animation localAnimation1 = AnimationUtils.loadAnimation(jdField_a_of_type_AndroidViewView.getContext(), 2130968607);
      Animation localAnimation2 = AnimationUtils.loadAnimation(jdField_a_of_type_AndroidViewView.getContext(), 2130968608);
      Animation localAnimation3 = AnimationUtils.loadAnimation(jdField_a_of_type_AndroidViewView.getContext(), 2130968609);
      Animation localAnimation4 = AnimationUtils.loadAnimation(jdField_a_of_type_AndroidViewView.getContext(), 2130968605);
      Animation localAnimation5 = AnimationUtils.loadAnimation(jdField_a_of_type_AndroidViewView.getContext(), 2130968606);
      jdField_a_of_type_AndroidWidgetImageView.startAnimation(localAnimation1);
      jdField_b_of_type_AndroidWidgetImageView.startAnimation(localAnimation2);
      jdField_c_of_type_AndroidWidgetImageView.startAnimation(localAnimation3);
      jdField_d_of_type_AndroidWidgetImageView.startAnimation(localAnimation4);
      jdField_e_of_type_AndroidWidgetImageView.startAnimation(localAnimation5);
      jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
      jdField_b_of_type_AndroidWidgetImageView.setVisibility(0);
      jdField_c_of_type_AndroidWidgetImageView.setVisibility(0);
      jdField_d_of_type_AndroidWidgetImageView.setVisibility(0);
      jdField_e_of_type_AndroidWidgetImageView.setVisibility(0);
      return;
    }
    catch (Exception localException)
    {
      if (!QLog.isColorLevel()) {
        return;
      }
      QLog.i("RecentCallHelper", 2, "playStarAnimation", localException);
    }
    jdField_a_of_type_AndroidWidgetImageView.clearAnimation();
    jdField_b_of_type_AndroidWidgetImageView.clearAnimation();
    jdField_c_of_type_AndroidWidgetImageView.clearAnimation();
    jdField_d_of_type_AndroidWidgetImageView.clearAnimation();
    jdField_e_of_type_AndroidWidgetImageView.clearAnimation();
    jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
    jdField_b_of_type_AndroidWidgetImageView.setVisibility(8);
    jdField_c_of_type_AndroidWidgetImageView.setVisibility(8);
    jdField_d_of_type_AndroidWidgetImageView.setVisibility(8);
    jdField_e_of_type_AndroidWidgetImageView.setVisibility(8);
    return;
  }
  
  private void m()
  {
    QCallFacade.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, false, "");
    if ((jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView != null) && (jdField_a_of_type_AndroidWidgetLinearLayout != null))
    {
      jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(8);
      jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.a(jdField_a_of_type_AndroidWidgetLinearLayout);
      k = false;
    }
  }
  
  private void n()
  {
    if ((jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView != null) && (jdField_a_of_type_AndroidWidgetLinearLayout != null) && (jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.indexOfChild(jdField_a_of_type_AndroidWidgetLinearLayout) != -1))
    {
      jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.a(jdField_a_of_type_AndroidWidgetLinearLayout);
      jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.a(jdField_a_of_type_AndroidWidgetLinearLayout);
    }
  }
  
  public void a()
  {
    if (jdField_a_of_type_AndroidWidgetRadioGroup != null) {
      jdField_a_of_type_AndroidWidgetRadioGroup.check(2131297683);
    }
  }
  
  public void a(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityRecentLocalSearchBar != null) {
      jdField_a_of_type_ComTencentMobileqqActivityRecentLocalSearchBar.a(paramInt1, paramInt2, paramIntent);
    }
  }
  
  public void a(int paramInt, View paramView, ListView paramListView)
  {
    if ((jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader == null) || (paramListView != jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView)) {
      return;
    }
    if (jdField_c_of_type_Boolean)
    {
      jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader.a();
      return;
    }
    jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader.a(0L);
  }
  
  public void a(Context paramContext)
  {
    Object localObject1;
    Object localObject2;
    if ((!p) && (jdField_b_of_type_AndroidWidgetRelativeLayout != null))
    {
      p = true;
      g();
      localObject1 = LightTalkTipsData.a();
      localObject2 = (TextView)jdField_b_of_type_AndroidWidgetRelativeLayout.findViewById(2131297330);
      ((TextView)localObject2).setText(e);
      ((TextView)localObject2).setContentDescription(e + "点击进入");
      localObject2 = (ImageView)jdField_b_of_type_AndroidWidgetRelativeLayout.findViewById(2131297329);
    }
    try
    {
      localObject1 = new BitmapDrawable(paramContext.getResources(), BitmapManager.a(LightTalkTipsData.d));
      paramContext = (Context)localObject1;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        paramContext = (BitmapDrawable)paramContext.getResources().getDrawable(2130840228);
      }
    }
    ((ImageView)localObject2).setImageDrawable(paramContext);
    jdField_b_of_type_AndroidWidgetRelativeLayout.setVisibility(0);
    jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.a(jdField_b_of_type_AndroidWidgetRelativeLayout);
    n();
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005812", "0X8005812", 0, 0, "", "", "", "");
  }
  
  public void a(Context paramContext, String paramString)
  {
    if (SharedPreUtils.a(paramContext, paramString, jdField_e_of_type_Int, "acount_uin_first_use_app")) {
      SharedPreUtils.a(paramContext, paramString, jdField_e_of_type_Int, "acount_uin_first_use_app");
    }
  }
  
  public void a(Message paramMessage)
  {
    if (QLog.isDevelopLevel()) {
      QLog.i("RecentCallHelper", 4, "refreshCallList|msg: " + paramMessage);
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter != null)
    {
      jdField_a_of_type_Long = System.currentTimeMillis();
      paramMessage = (List)obj;
      jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter.b(paramMessage);
      if (jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView != null)
      {
        if (m)
        {
          jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.setSelection(jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter.getCount() - 1);
          m = false;
        }
        jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.post(new mgt(this));
      }
      if (QLog.isDevelopLevel()) {
        QLog.i("RecentCallHelper", 4, "REFRESH_FLAG_CALL_LIST|" + jdField_a_of_type_Long);
      }
    }
    while (!QLog.isDevelopLevel()) {
      return;
    }
    QLog.i("RecentCallHelper", 4, "REFRESH_FLAG_CALL_LIST|call adapter is null");
  }
  
  public void a(BaseActivity paramBaseActivity, ViewStub paramViewStub, View paramView1, QQAppInterface paramQQAppInterface, View paramView2, View paramView3, OverScrollViewListener paramOverScrollViewListener, OnRecentUserOpsListener paramOnRecentUserOpsListener, AbsListView.OnScrollListener paramOnScrollListener)
  {
    jdField_a_of_type_ComTencentMobileqqAppBaseActivity = paramBaseActivity;
    if ((paramViewStub.getLayoutResource() == 2130904056) && (paramView1 != null))
    {
      jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView = ((FPSSwipListView)paramView1.findViewById(2131301100));
      jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.setActTAG("actFPSRecent");
      j();
      jdField_a_of_type_ComTencentMobileqqActivityRecentLocalSearchBar = new LocalSearchBar(jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView, paramView2, paramView3, paramBaseActivity, null, 10);
      jdField_a_of_type_JavaLangRunnable = new mgu(this, paramBaseActivity, paramOverScrollViewListener);
      jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.postDelayed(jdField_a_of_type_JavaLangRunnable, 1000L);
      jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter = new RecentAdapter(paramBaseActivity, paramQQAppInterface, jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView, paramOnRecentUserOpsListener, 4);
      jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.setAdapter(jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter);
      jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.setOnScrollListener(paramOnScrollListener);
      jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper = new RecommendCallHelper(paramQQAppInterface, paramView2, paramOnRecentUserOpsListener, new mgv(this, paramBaseActivity));
      if (QLog.isColorLevel()) {
        QLog.d("RecentCallHelper", 2, "onInflate end");
      }
    }
  }
  
  public void a(QQAppInterface paramQQAppInterface)
  {
    i = SharedPreUtils.a(paramQQAppInterface.getApplication(), paramQQAppInterface.a(), jdField_e_of_type_Int, "acount_uin_first_use_app");
    a(i);
  }
  
  public void a(QQAppInterface paramQQAppInterface, int paramInt, boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.d("RecentCallHelper", 2, "setVisibility|visibility: " + paramInt + ", forceRecommend: " + paramBoolean);
    }
    if (jdField_a_of_type_AndroidViewViewStub != null)
    {
      jdField_a_of_type_AndroidViewViewStub.setVisibility(paramInt);
      if (!l) {
        break label291;
      }
      if (jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView != null)
      {
        jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.setVisibility(paramInt);
        if (paramInt == 8) {
          jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.N();
        }
      }
    }
    for (;;)
    {
      if (paramInt == 0)
      {
        if ((jdField_a_of_type_ComTencentMobileqqTroopWidgetRedDotRadioButton != null) && (jdField_a_of_type_ComTencentMobileqqTroopWidgetRedDotRadioButton.isChecked()))
        {
          if (jdField_a_of_type_ComTencentMobileqqTroopWidgetRedDotRadioButton.a()) {
            ReportController.b(paramQQAppInterface, "CliOper", "", "", "0X8004C0B", "0X8004C0B", 0, 0, "", "", "", "");
          }
          jdField_a_of_type_ComTencentMobileqqTroopWidgetRedDotRadioButton.a(false);
          a(paramQQAppInterface.getApplication(), paramQQAppInterface.a());
        }
        if (k) {
          a(paramQQAppInterface.getApplication(), paramQQAppInterface.a());
        }
      }
      return;
      if ((q) && (jdField_a_of_type_AndroidViewViewStub$OnInflateListener != null) && (jdField_b_of_type_AndroidViewView != null)) {}
      try
      {
        jdField_a_of_type_AndroidViewViewStub$OnInflateListener.onInflate(null, jdField_b_of_type_AndroidViewView);
        q = false;
        jdField_a_of_type_AndroidViewViewStub$OnInflateListener = null;
        if (jdField_b_of_type_AndroidViewView == null) {
          break;
        }
        jdField_b_of_type_AndroidViewView.setVisibility(paramInt);
      }
      catch (Exception localException)
      {
        for (;;)
        {
          if (QLog.isColorLevel()) {
            QLog.e("RecentCallHelper", 2, "ViewStub inflate manual error " + localException);
          }
        }
      }
      label291:
      if (jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper != null) {
        jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper.a(paramInt);
      }
    }
  }
  
  public void a(QQAppInterface paramQQAppInterface, Context paramContext, MqqHandler paramMqqHandler)
  {
    if (QLog.isDevelopLevel()) {
      QLog.i("RecentCallHelper", 4, "refreshData|REFRESH_FLAG_CALL_LIST");
    }
    label63:
    ArrayList localArrayList;
    if ((paramQQAppInterface != null) && (paramContext != null) && (jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView != null))
    {
      Object localObject = (QCallFacade)paramQQAppInterface.getManager(37);
      int i1;
      int i2;
      label82:
      QCallRecent localQCallRecent;
      RecentCallItem localRecentCallItem;
      if (localObject == null)
      {
        localObject = null;
        if (localObject == null) {
          break label219;
        }
        i1 = ((List)localObject).size();
        if (i1 <= 0) {
          break label328;
        }
        localArrayList = new ArrayList(30);
        i2 = 0;
        if (i2 >= i1) {
          break label265;
        }
        localQCallRecent = (QCallRecent)((List)localObject).get(i2);
        if ((localQCallRecent != null) && (!TextUtils.isEmpty(uin)))
        {
          localRecentCallItem = a(uin + "-" + type);
          if (localRecentCallItem != null) {
            break label225;
          }
          localRecentCallItem = new RecentCallItem(localQCallRecent);
          label172:
          if ((type != 1024) || (CrmUtils.b(paramQQAppInterface, uin, type))) {
            break label235;
          }
        }
      }
      for (;;)
      {
        i2 += 1;
        break label82;
        localObject = ((QCallFacade)localObject).a();
        break;
        label219:
        i1 = 0;
        break label63;
        label225:
        localRecentCallItem.a(localQCallRecent);
        break label172;
        label235:
        H = missedCallCount;
        localRecentCallItem.a(paramQQAppInterface, paramContext);
        localArrayList.add(localRecentCallItem);
      }
      label265:
      a(localArrayList);
    }
    label328:
    for (paramContext = localArrayList;; paramContext = null)
    {
      if ((paramMqqHandler != null) && (paramContext != null) && (paramContext.size() > 0)) {
        paramMqqHandler.obtainMessage(1021, 0, 0, paramContext).sendToTarget();
      }
      do
      {
        return;
        c(paramQQAppInterface);
      } while (paramMqqHandler == null);
      paramMqqHandler.obtainMessage(1021, 0, 0, null).sendToTarget();
      return;
    }
  }
  
  public void a(QQAppInterface paramQQAppInterface, boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.d("RecentCallHelper", 2, "onAccountChanged");
    }
    if ((jdField_c_of_type_Boolean) && (jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView != null))
    {
      jdField_c_of_type_Boolean = false;
      jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.J();
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityRecentLocalSearchBar != null) {
      jdField_a_of_type_ComTencentMobileqqActivityRecentLocalSearchBar.a(paramQQAppInterface);
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper != null) {
      jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper.a(paramQQAppInterface);
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter != null) {
      jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter.a(paramQQAppInterface);
    }
    if ((jdField_a_of_type_ComTencentMobileqqTroopWidgetRedDotRadioButton != null) && (!jdField_a_of_type_ComTencentMobileqqTroopWidgetRedDotRadioButton.isChecked())) {
      a(paramQQAppInterface);
    }
    m = false;
    jdField_d_of_type_Int = 300;
    jdField_c_of_type_JavaLangString = "";
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    if ((paramQQAppInterface != null) && (!paramBoolean))
    {
      l = true;
      if (jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView != null)
      {
        jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.setVisibility(0);
        j();
      }
      if (jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper != null) {
        jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper.a(8);
      }
    }
  }
  
  public void a(QQAppInterface paramQQAppInterface, boolean paramBoolean1, boolean paramBoolean2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("RecentCallHelper", 2, "showRecommendView|visibility: " + paramBoolean1 + ", back: " + paramBoolean2);
    }
    if (paramBoolean1)
    {
      l = false;
      if (jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView != null)
      {
        jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.setVisibility(8);
        jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.N();
      }
      if (paramQQAppInterface != null)
      {
        QCallFacade localQCallFacade = (QCallFacade)paramQQAppInterface.getManager(37);
        if (localQCallFacade != null) {
          localQCallFacade.a(false);
        }
        c(paramQQAppInterface);
      }
      if (jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper != null)
      {
        paramQQAppInterface = jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper;
        if (!paramBoolean1) {
          break label154;
        }
      }
    }
    label154:
    for (int i1 = 0;; i1 = 8)
    {
      paramQQAppInterface.a(i1);
      return;
      l = true;
      if (jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView == null) {
        break;
      }
      jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.setVisibility(0);
      break;
    }
  }
  
  public void a(AbsListView paramAbsListView, int paramInt)
  {
    if (paramAbsListView == null) {}
    while ((paramAbsListView != jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView) || (jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter == null)) {
      return;
    }
    if ((paramInt == 0) || (paramInt == 1))
    {
      jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter.b(false);
      return;
    }
    jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter.b(true);
  }
  
  public void a(String paramString)
  {
    if (QLog.isColorLevel()) {
      QLog.d("RecentCallHelper", 2, "updateItem");
    }
    if (l) {
      if (jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter != null) {
        jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter.a(paramString, false);
      }
    }
    while (jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper == null) {
      return;
    }
    jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper.a(paramString);
  }
  
  public void a(String paramString, int paramInt)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter != null) {
      jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter.a(paramString, paramInt);
    }
  }
  
  public void a(Constants.LogoutReason paramLogoutReason)
  {
    if ((jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView != null) && (jdField_c_of_type_Boolean))
    {
      jdField_c_of_type_Boolean = false;
      jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.H();
    }
  }
  
  protected void a(MqqHandler paramMqqHandler, long paramLong)
  {
    if ((jdField_c_of_type_Boolean) && (paramMqqHandler != null))
    {
      paramMqqHandler.removeMessages(1022);
      paramMqqHandler.sendEmptyMessageDelayed(1022, paramLong);
    }
  }
  
  public void a(MqqHandler paramMqqHandler, boolean paramBoolean)
  {
    if (jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader == null) {}
    while (!jdField_c_of_type_Boolean) {
      return;
    }
    a(paramMqqHandler, 800L);
    paramMqqHandler = jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader;
    if (paramBoolean) {}
    for (int i1 = 0;; i1 = 2)
    {
      paramMqqHandler.a(i1);
      return;
    }
  }
  
  public void a(boolean paramBoolean)
  {
    if (jdField_a_of_type_ComTencentMobileqqTroopWidgetRedDotRadioButton != null) {
      jdField_a_of_type_ComTencentMobileqqTroopWidgetRedDotRadioButton.a(paramBoolean);
    }
    if (paramBoolean) {
      ThreadManager.a().post(new mgs(this));
    }
    m = paramBoolean;
  }
  
  public void a(boolean paramBoolean, int paramInt, String paramString, List paramList)
  {
    if (QLog.isColorLevel()) {
      QLog.d("RecentCallHelper", 2, "refreshRecommendFriendList isSuccess: " + paramBoolean);
    }
    boolean bool;
    if (!paramBoolean) {
      if ((jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter != null) && (jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter.a() != null))
      {
        bool = paramBoolean;
        paramString = paramList;
        if (jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper != null)
        {
          bool = paramBoolean;
          paramString = paramList;
          if (jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper.a())
          {
            bool = true;
            paramString = jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter.a();
          }
        }
      }
    }
    for (;;)
    {
      if (jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper != null) {
        jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper.a(bool, paramString);
      }
      return;
      bool = paramBoolean;
      paramString = paramList;
      if (jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper != null)
      {
        bool = paramBoolean;
        paramString = paramList;
        if (!jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper.a())
        {
          bool = paramBoolean;
          paramString = paramList;
          if (jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter != null)
          {
            bool = paramBoolean;
            paramString = paramList;
            if (jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper.a() != null)
            {
              jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter.a(jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper.a());
              bool = paramBoolean;
              paramString = paramList;
              continue;
              jdField_d_of_type_Int = paramInt;
              jdField_c_of_type_JavaLangString = paramString;
              if ((paramList != null) && (paramList.size() > 0) && (jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter != null)) {
                jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter.a(paramList);
              }
              if (l)
              {
                bool = paramBoolean;
                paramString = paramList;
                if (jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter != null)
                {
                  jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter.notifyDataSetChanged();
                  bool = paramBoolean;
                  paramString = paramList;
                }
              }
              else
              {
                l = false;
                bool = paramBoolean;
                paramString = paramList;
                if (jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView != null)
                {
                  jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.setVisibility(8);
                  jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.N();
                  bool = paramBoolean;
                  paramString = paramList;
                }
              }
            }
          }
        }
      }
    }
  }
  
  public void a(boolean paramBoolean, String paramString)
  {
    if (paramBoolean)
    {
      b(paramString);
      return;
    }
    m();
  }
  
  public void a(boolean paramBoolean1, boolean paramBoolean2, MqqHandler paramMqqHandler)
  {
    if (QLog.isDevelopLevel()) {
      QLog.i("RecentCallHelper", 4, "refreshCallList|mInRecentCallList: " + l + ", isListViewIdle: " + paramBoolean1 + ", bImmediate: " + paramBoolean2);
    }
    if ((jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView == null) || (paramMqqHandler == null)) {
      if (QLog.isDevelopLevel()) {
        QLog.i("RecentCallHelper", 4, "refreshCallList|invalidate to refresh");
      }
    }
    do
    {
      do
      {
        return;
        if (!paramBoolean1) {
          break;
        }
        jdField_b_of_type_Boolean = false;
        long l1;
        if (paramBoolean2) {
          l1 = 0L;
        }
        while (!paramMqqHandler.hasMessages(16)) {
          if (l1 == 0L)
          {
            paramMqqHandler.sendEmptyMessage(16);
            return;
            l1 = Math.max(2000L - Math.abs(jdField_a_of_type_Long - System.currentTimeMillis()), 500L);
          }
          else
          {
            paramMqqHandler.sendEmptyMessageDelayed(16, l1);
            return;
          }
        }
      } while (!QLog.isDevelopLevel());
      QLog.i("RecentCallHelper", 4, "refreshCallList|already has not complete refresh");
      return;
      jdField_b_of_type_Boolean = true;
    } while (!QLog.isDevelopLevel());
    QLog.i("RecentCallHelper", 4, "refreshCallList|list scrolling");
  }
  
  public boolean a()
  {
    return (jdField_a_of_type_AndroidWidgetButton != null) && (jdField_a_of_type_AndroidWidgetButton.isShown());
  }
  
  public boolean a(int paramInt, View paramView, ListView paramListView, QQAppInterface paramQQAppInterface, MqqHandler paramMqqHandler, boolean paramBoolean)
  {
    if ((jdField_c_of_type_Boolean) || (jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader == null) || (paramListView != jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView)) {
      return true;
    }
    jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader.c(0L);
    a(paramQQAppInterface, paramMqqHandler, paramBoolean);
    return true;
  }
  
  public void b()
  {
    if (jdField_a_of_type_AndroidWidgetRadioGroup != null) {
      jdField_a_of_type_AndroidWidgetRadioGroup.check(2131297684);
    }
  }
  
  public void b(int paramInt, View paramView, ListView paramListView)
  {
    if ((jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader == null) || (paramListView != jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView)) {}
    while (jdField_c_of_type_Boolean) {
      return;
    }
    jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader.b(0L);
  }
  
  public void b(QQAppInterface paramQQAppInterface)
  {
    if (QLog.isColorLevel()) {
      QLog.d("RecentCallHelper", 2, "updateOnlineStatus");
    }
    if ((!l) && (jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper != null)) {
      jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper.d();
    }
  }
  
  void b(boolean paramBoolean)
  {
    View localView = jdField_a_of_type_AndroidViewView.findViewById(2131301123);
    if (paramBoolean)
    {
      g = false;
      localView.setBackgroundDrawable(null);
    }
    while (g) {
      return;
    }
    g = true;
    Drawable localDrawable = BitmapTools.b(BaseApplication.getContext(), 2130838256);
    if (localDrawable != null)
    {
      localView.setBackgroundDrawable(localDrawable);
      return;
    }
    localView.setBackgroundResource(2130838256);
  }
  
  public boolean b()
  {
    return (jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter == null) || (jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter.getCount() == 1);
  }
  
  public void c()
  {
    if (QLog.isColorLevel()) {
      QLog.d("RecentCallHelper", 2, "onResume|mInRecentCallList: " + l);
    }
    if ((QLog.isColorLevel()) && (jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter != null)) {
      QLog.d("lightalktips", 2, "onresume adapter size is " + jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter.getCount());
    }
    if ((!l) && (jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper != null)) {
      jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper.a();
    }
    if (!h) {
      c(true);
    }
    if (!p) {
      f();
    }
  }
  
  public void c(QQAppInterface paramQQAppInterface)
  {
    if (QLog.isColorLevel()) {
      QLog.d("RecentCallHelper", 2, "send_oidb_0x7d7_0");
    }
    paramQQAppInterface = (RecentCallHandler)paramQQAppInterface.a(45);
    if (paramQQAppInterface != null) {
      paramQQAppInterface.a(jdField_c_of_type_JavaLangString);
    }
  }
  
  public void c(boolean paramBoolean)
  {
    if ((jdField_b_of_type_AndroidWidgetRelativeLayout == null) || (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface == null)) {}
    int i1;
    do
    {
      return;
      i1 = SharedPreUtils.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a()).getInt("show_tab_lightalk_tips", 0);
    } while ((i1 < 0) || (i1 >= 3));
    ThreadManager.a(new mgp(this, i1, paramBoolean), 5, null, true);
  }
  
  public void d()
  {
    if (QLog.isColorLevel()) {
      QLog.d("RecentCallHelper", 2, "onPause|mInRecentCallList: " + l);
    }
    if ((!l) && (jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper != null)) {
      jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper.b();
    }
    if (jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView != null)
    {
      if (jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.getVisibility() == 0) {
        jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.N();
      }
      jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.a();
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityRecentLocalSearchBar != null) {
      jdField_a_of_type_ComTencentMobileqqActivityRecentLocalSearchBar.b();
    }
  }
  
  public void e()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityRecentLocalSearchBar != null) {
      jdField_a_of_type_ComTencentMobileqqActivityRecentLocalSearchBar.a();
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter != null) {
      jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter.b();
    }
    if (jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView != null) {
      try
      {
        Object localObject = Class.forName("com.tencent.widget.ListView").getDeclaredField("mHeaderViewInfos");
        ((Field)localObject).setAccessible(true);
        localObject = ((List)((Field)localObject).get(jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView)).iterator();
        while (((Iterator)localObject).hasNext())
        {
          ListView.FixedViewInfo localFixedViewInfo = (ListView.FixedViewInfo)((Iterator)localObject).next();
          jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.a(jdField_a_of_type_AndroidViewView);
        }
        if (jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper == null) {
          break label178;
        }
      }
      catch (Exception localException)
      {
        if (QLog.isColorLevel()) {
          QLog.d("RecentCallHelper", 2, "" + localException);
        }
        jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.setAdapter(null);
        jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.setOverScrollListener(null);
        jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.removeCallbacks(jdField_a_of_type_JavaLangRunnable);
      }
    }
    jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendCallHelper.c();
    label178:
    jdField_d_of_type_Int = 300;
    jdField_c_of_type_JavaLangString = "";
    jdField_a_of_type_AndroidViewViewStub = null;
    jdField_a_of_type_AndroidViewViewStub$OnInflateListener = null;
    jdField_b_of_type_AndroidViewView = null;
    jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView = null;
    jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter = null;
    jdField_a_of_type_ComTencentMobileqqActivityRecentLocalSearchBar = null;
    jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader = null;
    jdField_a_of_type_AndroidWidgetRelativeLayout = null;
    jdField_a_of_type_AndroidWidgetLinearLayout = null;
    jdField_a_of_type_AndroidWidgetRadioGroup = null;
    jdField_a_of_type_ComTencentMobileqqTroopWidgetRedDotRadioButton = null;
    if (jdField_a_of_type_JavaUtilHashMap != null)
    {
      jdField_a_of_type_JavaUtilHashMap.clear();
      jdField_a_of_type_JavaUtilHashMap = null;
    }
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null) {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(null);
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = null;
    jdField_b_of_type_AndroidWidgetRelativeLayout = null;
    jdField_a_of_type_MqqOsMqqHandler.removeCallbacksAndMessages(null);
  }
  
  public void f()
  {
    if ((jdField_a_of_type_AndroidWidgetRelativeLayout == null) || (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface == null)) {
      break label14;
    }
    label14:
    while (VipFunCallManager.b() != 0) {
      return;
    }
    Object localObject = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getPreferences();
    int i1 = ((SharedPreferences)localObject).getInt("funcall_RecentCall_Tipsnum", 0);
    if (i1 < 3)
    {
      localObject = ((SharedPreferences)localObject).edit();
      ((SharedPreferences.Editor)localObject).putInt("funcall_RecentCall_Tipsnum", i1 + 1);
      ((SharedPreferences.Editor)localObject).commit();
    }
    for (i1 = 1;; i1 = 0)
    {
      if (i1 != 0)
      {
        if (j) {
          break;
        }
        jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.a(jdField_a_of_type_AndroidWidgetRelativeLayout);
        j = true;
        n();
        return;
      }
      if (j != true) {
        break;
      }
      jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.a(jdField_a_of_type_AndroidWidgetRelativeLayout);
      j = false;
      return;
    }
  }
  
  public void g()
  {
    if ((jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView != null) && (jdField_a_of_type_AndroidWidgetRelativeLayout != null)) {}
    try
    {
      jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.a(jdField_a_of_type_AndroidWidgetRelativeLayout);
      j = false;
      return;
    }
    catch (Exception localException)
    {
      while (!QLog.isColorLevel()) {}
      QLog.d("RecentCallHelper", 2, "dismiss funcall bar exception");
    }
  }
  
  public void h()
  {
    if ((jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView != null) && (jdField_b_of_type_AndroidWidgetRelativeLayout != null))
    {
      jdField_b_of_type_AndroidWidgetRelativeLayout.setVisibility(8);
      jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.a(jdField_b_of_type_AndroidWidgetRelativeLayout);
      p = false;
    }
  }
  
  public void i()
  {
    jdField_c_of_type_Boolean = false;
    if (jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView != null) {
      jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.H();
    }
  }
  
  public void j()
  {
    if (jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView == null) {}
    do
    {
      do
      {
        return;
        if (!ThemeBackground.getThemeBackgroundEnable())
        {
          jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.setContentBackground(2130837740);
          jdField_a_of_type_ComTencentMobileqqThemeDiyThemeBackground = null;
          return;
        }
        if (jdField_a_of_type_ComTencentMobileqqThemeDiyThemeBackground == null) {
          jdField_a_of_type_ComTencentMobileqqThemeDiyThemeBackground = new ThemeBackground();
        }
      } while (!ThemeBackground.getThemeBackground(jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.getContext(), "theme_bg_message_path_png", jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), jdField_a_of_type_ComTencentMobileqqThemeDiyThemeBackground));
      if (("null".equals(jdField_a_of_type_ComTencentMobileqqThemeDiyThemeBackground.path)) || (jdField_a_of_type_ComTencentMobileqqThemeDiyThemeBackground.img == null))
      {
        jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.setContentBackground(2130837740);
        jdField_a_of_type_ComTencentMobileqqThemeDiyThemeBackground = null;
        return;
      }
    } while (jdField_a_of_type_ComTencentMobileqqThemeDiyThemeBackground.img == null);
    jdField_a_of_type_ComTencentMobileqqFpsreportFPSSwipListView.setContentBackground(jdField_a_of_type_ComTencentMobileqqThemeDiyThemeBackground.img);
  }
  
  public void k()
  {
    Object localObject;
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null)
    {
      localObject = (QCallFacade)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(37);
      if (localObject != null) {
        if (localObject == null)
        {
          localObject = null;
          if ((localObject == null) || (((List)localObject).size() <= 0)) {
            break label52;
          }
        }
      }
    }
    label52:
    while (jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter == null)
    {
      return;
      localObject = ((QCallFacade)localObject).a();
      break;
    }
    jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter.notifyDataSetChanged();
  }
  
  public void l()
  {
    if ((jdField_a_of_type_ComTencentMobileqqActivityRecentLocalSearchBar != null) && (jdField_a_of_type_ComTencentMobileqqActivityRecentLocalSearchBar.a())) {
      jdField_a_of_type_ComTencentMobileqqActivityRecentLocalSearchBar.d();
    }
  }
}
