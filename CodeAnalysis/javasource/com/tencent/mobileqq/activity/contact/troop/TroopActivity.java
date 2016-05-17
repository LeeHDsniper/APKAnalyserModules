package com.tencent.mobileqq.activity.contact.troop;

import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Handler.Callback;
import android.os.Message;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup.LayoutParams;
import android.view.Window;
import android.view.WindowManager;
import android.view.WindowManager.BadTokenException;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.BaseForwardSelectionActivity;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.selectmember.SelectMemberActivity;
import com.tencent.mobileqq.app.NewFriendManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.RecommendTroopManagerImp;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.systemmsg.GroupSystemMsgController;
import com.tencent.mobileqq.troop.data.TroopCreateLogic;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.widget.RedDotTextView;
import com.tencent.mobileqq.widget.TabBarView;
import com.tencent.mobileqq.widget.TabBarView.OnTabChangeListener;
import com.tencent.util.MqqWeakReferenceHandler;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheetHelper;
import com.tencent.widget.PopupMenuDialog;
import com.tencent.widget.PopupMenuDialog.MenuItem;
import com.tencent.widget.immersive.ImmersiveUtils;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Observable;
import java.util.Observer;
import ltu;
import ltv;
import ltw;
import ltx;
import lty;
import ltz;
import lua;
import lub;
import luc;
import lud;

public class TroopActivity
  extends BaseForwardSelectionActivity
  implements Handler.Callback, Observer
{
  public static final int a = 0;
  protected static final int[] a;
  public static final int b = 0;
  protected static final int[] b;
  public static final int c = 1;
  public static final int d = 1;
  public static final int e = 4;
  public static final String e = "onlyOneSegement";
  public static final int f = 0;
  public static final String f = "_key_mode";
  public static final int g = 1;
  public static final String g = "messageTab";
  public static final int h = 2;
  public static final String h = "key_tab_mode";
  protected static final String j = "last_tab_mode";
  public static final int k = 1234;
  protected static final String k = "noti_and_rec_last_tab_mode";
  protected View.OnClickListener a;
  protected FrameLayout a;
  ImageView jdField_a_of_type_AndroidWidgetImageView;
  protected BaseTroopView.ITroopContext a;
  public BaseTroopView a;
  protected ShowExternalTroopListActivity.IShowExternalTroopDataChangedCallBack a;
  protected TabBarView.OnTabChangeListener a;
  public TabBarView a;
  public MqqWeakReferenceHandler a;
  protected PopupMenuDialog a;
  ArrayList jdField_a_of_type_JavaUtilArrayList = new ArrayList();
  public HashMap a;
  protected boolean b;
  protected boolean c = false;
  protected boolean d = false;
  boolean e;
  public int i;
  protected String i;
  public int j = 0;
  protected int l = 0;
  protected int m = 0;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ArrayOfInt = new int[] { 2131363906, 2131369386, 2131363908, 2131363909 };
    jdField_b_of_type_ArrayOfInt = new int[] { 2130839155, 2130839159, 2130839156, 2130839154 };
  }
  
  public TroopActivity()
  {
    jdField_i_of_type_Int = 0;
    jdField_b_of_type_Boolean = false;
    jdField_i_of_type_JavaLangString = "DEFAULT";
    jdField_a_of_type_ComTencentMobileqqWidgetTabBarView$OnTabChangeListener = new lua(this);
    jdField_a_of_type_AndroidViewView$OnClickListener = new luc(this);
  }
  
  private int a()
  {
    if (j == 2) {}
    for (SharedPreferences localSharedPreferences = getSharedPreferences("noti_and_rec_last_tab_mode_" + app.a(), 0);; localSharedPreferences = getSharedPreferences("last_tab_mode_" + app.a(), 0)) {
      return localSharedPreferences.getInt("last_tab_mode", 0);
    }
  }
  
  private BaseTroopView a(int paramInt)
  {
    Object localObject;
    if (paramInt >= 4) {
      localObject = null;
    }
    BaseTroopView localBaseTroopView;
    do
    {
      return localObject;
      localBaseTroopView = (BaseTroopView)jdField_a_of_type_JavaUtilArrayList.get(paramInt);
      localObject = localBaseTroopView;
    } while (localBaseTroopView != null);
    if (j != 2) {
      switch (paramInt)
      {
      default: 
        localObject = new TroopView(this, jdField_b_of_type_Boolean, jdField_a_of_type_ComTencentMobileqqActivityContactTroopShowExternalTroopListActivity$IShowExternalTroopDataChangedCallBack);
      }
    }
    for (;;)
    {
      jdField_a_of_type_JavaUtilArrayList.set(paramInt, localObject);
      ((BaseTroopView)localObject).a(null, jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext);
      return localObject;
      localObject = new TroopView(this, jdField_b_of_type_Boolean, jdField_a_of_type_ComTencentMobileqqActivityContactTroopShowExternalTroopListActivity$IShowExternalTroopDataChangedCallBack);
      continue;
      localObject = new DiscussionView(this);
      continue;
      switch (paramInt)
      {
      default: 
        localObject = new NotificationView(this);
        break;
      case 1: 
        localObject = new RecommendTroopView(this);
        break;
      case 0: 
        localObject = new NotificationView(this);
      }
    }
  }
  
  private void a(int paramInt, String paramString)
  {
    TroopCreateLogic localTroopCreateLogic = (TroopCreateLogic)app.getManager(31);
    if (localTroopCreateLogic != null) {
      localTroopCreateLogic.a(this, paramInt, paramString);
    }
  }
  
  private void b(int paramInt)
  {
    if (d) {
      return;
    }
    d = true;
    if (j == 2) {}
    for (SharedPreferences localSharedPreferences = getSharedPreferences("noti_and_rec_last_tab_mode_" + app.a(), 0);; localSharedPreferences = getSharedPreferences("last_tab_mode_" + app.a(), 0))
    {
      localSharedPreferences.edit().putInt("last_tab_mode", paramInt).commit();
      return;
    }
  }
  
  private void c()
  {
    jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext = new ltw(this);
  }
  
  private void c(int paramInt)
  {
    if (AppSetting.i)
    {
      int i1 = jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.getChildCount();
      int n = 0;
      while (n < i1)
      {
        RedDotTextView localRedDotTextView = jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.a(n);
        StringBuilder localStringBuilder = new StringBuilder(24);
        if (paramInt == n) {
          localStringBuilder.append("已选定");
        }
        localStringBuilder.append(localRedDotTextView.getText()).append(" 按钮");
        localRedDotTextView.setContentDescription(localStringBuilder);
        n += 1;
      }
    }
  }
  
  private void d()
  {
    Object localObject1 = findViewById(2131296923);
    if ((mNeedStatusTrans) && (ImmersiveUtils.isSupporImmersive() == 1))
    {
      ((View)localObject1).setPadding(0, ImmersiveUtils.a(this), 0, 0);
      ((View)localObject1).setBackgroundColor(getResources().getColor(2131428205));
    }
    TextView localTextView = (TextView)findViewById(2131297035);
    localObject1 = getIntent().getExtras().getString("leftViewText");
    if (localObject1 == null) {
      localObject1 = getString(2131367694);
    }
    for (;;)
    {
      localTextView.setText((CharSequence)localObject1);
      localTextView.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
      jdField_a_of_type_AndroidWidgetImageView = ((ImageView)findViewById(2131297324));
      jdField_a_of_type_ComTencentMobileqqWidgetTabBarView = ((TabBarView)findViewById(2131297593));
      Object localObject2;
      if (j != 2) {
        if (jdField_a_of_type_Boolean)
        {
          jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
          localObject2 = (TextView)findViewById(2131297034);
          if (getIntent().getBooleanExtra("onlyOneSegement", false))
          {
            findViewById(2131299387).setVisibility(8);
            if (jdField_i_of_type_Int != 0) {
              break label607;
            }
            ((TextView)localObject2).setText(2131367276);
          }
          label201:
          if (j == 2) {
            break label626;
          }
          jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.a(0, getString(2131367276));
          jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.a(1, getString(2131367279));
          label241:
          if (jdField_b_of_type_Boolean)
          {
            jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
            ((TextView)localObject2).setText(2131364742);
          }
          jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.setOnTabChangeListener(jdField_a_of_type_ComTencentMobileqqWidgetTabBarView$OnTabChangeListener);
          jdField_a_of_type_AndroidWidgetFrameLayout = ((FrameLayout)findViewById(2131299388));
          h();
          f();
          g();
          if (AppSetting.i)
          {
            if (!jdField_a_of_type_Boolean) {
              break label669;
            }
            localTextView.setContentDescription(((TextView)localObject2).getText() + "页面，已选中" + (String)localObject1 + "按钮");
            localTextView.postDelayed(new lty(this, localTextView), 1000L);
          }
        }
      }
      for (;;)
      {
        if (jdField_a_of_type_AndroidWidgetImageView.getVisibility() == 0) {
          jdField_a_of_type_AndroidWidgetImageView.setContentDescription("更多选项");
        }
        if (getIntent().getBooleanExtra("param_from_dingdong_office", false)) {
          jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
        }
        return;
        jdField_a_of_type_AndroidWidgetImageView.setBackgroundResource(2130842905);
        jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130838440);
        jdField_a_of_type_AndroidWidgetImageView.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        localObject2 = jdField_a_of_type_AndroidWidgetImageView.getLayoutParams();
        DisplayMetrics localDisplayMetrics = new DisplayMetrics();
        getWindowManager().getDefaultDisplay().getMetrics(localDisplayMetrics);
        width = (densityDpi * 36 / 160);
        height = -2;
        jdField_a_of_type_AndroidWidgetImageView.setLayoutParams((ViewGroup.LayoutParams)localObject2);
        int n = densityDpi * 100 / 160;
        jdField_a_of_type_AndroidWidgetImageView.setMaxWidth(n);
        jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
        jdField_a_of_type_AndroidWidgetImageView.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
        break;
        if (jdField_a_of_type_Boolean)
        {
          jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
          break;
        }
        jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
        jdField_a_of_type_AndroidWidgetImageView.setBackgroundResource(2130838440);
        jdField_a_of_type_AndroidWidgetImageView.setOnClickListener(new ltx(this));
        break;
        label607:
        if (1 != jdField_i_of_type_Int) {
          break label201;
        }
        ((TextView)localObject2).setText(2131367279);
        break label201;
        label626:
        ((TextView)localObject2).setText(2131367277);
        jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.a(0, getString(2131367038));
        jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.a(1, getString(2131367278));
        break label241;
        label669:
        localTextView.setContentDescription(localTextView.getText() + "返回按钮");
      }
    }
  }
  
  private void e()
  {
    ActionSheet localActionSheet = (ActionSheet)ActionSheetHelper.a(this, null);
    localActionSheet.a(2131364703, 5);
    localActionSheet.a(2131364704, 5);
    localActionSheet.d(2131366996);
    localActionSheet.a(new ltz(this, localActionSheet));
    if ((!localActionSheet.isShowing()) && (this != null) && (!isFinishing())) {}
    try
    {
      localActionSheet.show();
      return;
    }
    catch (WindowManager.BadTokenException localBadTokenException)
    {
      localBadTokenException.printStackTrace();
    }
  }
  
  private void f()
  {
    if (isFinishing()) {}
    BaseTroopView localBaseTroopView1;
    boolean bool;
    do
    {
      do
      {
        do
        {
          return;
        } while (j != 2);
        localBaseTroopView1 = a(1);
        BaseTroopView localBaseTroopView2 = a(0);
        if (jdField_i_of_type_Int == 1)
        {
          int n = GroupSystemMsgController.a().a(app);
          if ((!localBaseTroopView2.a()) && (n > 0))
          {
            jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.a(0).a(true);
            return;
          }
          jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.a(0).a(false);
          return;
        }
      } while (jdField_i_of_type_Int != 0);
      bool = ((RecommendTroopManagerImp)app.getManager(21)).b();
    } while ((j != 0) && (j != 2));
    if ((!localBaseTroopView1.a()) && (bool))
    {
      jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.a(1).a(true);
      return;
    }
    jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.a(1).a(false);
  }
  
  private void g()
  {
    if (j != 2)
    {
      switch (jdField_i_of_type_Int)
      {
      default: 
        jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.setSelectedTab(0, true);
        return;
      case 0: 
        jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.setSelectedTab(0, true);
        return;
      }
      jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.setSelectedTab(1, true);
      return;
    }
    switch (jdField_i_of_type_Int)
    {
    default: 
      jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.setSelectedTab(0, true);
      return;
    case 0: 
      jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.setSelectedTab(0, true);
      return;
    }
    jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.setSelectedTab(1, true);
  }
  
  private void h()
  {
    ArrayList localArrayList = new ArrayList();
    int n = 0;
    while (n < jdField_a_of_type_ArrayOfInt.length)
    {
      PopupMenuDialog.MenuItem localMenuItem = new PopupMenuDialog.MenuItem();
      jdField_a_of_type_Int = n;
      jdField_a_of_type_JavaLangString = getString(jdField_a_of_type_ArrayOfInt[n]);
      jdField_b_of_type_JavaLangString = jdField_a_of_type_JavaLangString;
      jdField_b_of_type_Int = jdField_b_of_type_ArrayOfInt[n];
      localArrayList.add(localMenuItem);
      n += 1;
    }
    jdField_a_of_type_ComTencentWidgetPopupMenuDialog = PopupMenuDialog.a(this, localArrayList, new lub(this));
  }
  
  private void i()
  {
    Intent localIntent = new Intent(this, SelectMemberActivity.class);
    localIntent.putExtra("param_type", 3000);
    localIntent.putExtra("param_subtype", 0);
    localIntent.putExtra("param_from", 1002);
    localIntent.putExtra("param_min", 2);
    localIntent.putExtra("param_max", 49);
    startActivityForResult(localIntent, 1300);
    ReportController.b(app, "CliOper", "", "", "Contacts_tab", "Contacts_tab_creat_discuss", 0, 0, "", "", "", "");
    ReportController.b(app, "P_CliOper", "Grp_contacts", "", "discuss", "creat_discuss_contact", 0, 0, "", "", "", "");
  }
  
  public void a()
  {
    jdField_a_of_type_ComTencentWidgetPopupMenuDialog.showAsDropDown(jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.b(), jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView$ITroopContext.b().getWidth() - getResources().getDimensionPixelSize(2131493340) - getResources().getDimensionPixelSize(2131493344), getResources().getDimensionPixelSize(2131493345));
  }
  
  public void a(int paramInt)
  {
    BaseTroopView localBaseTroopView = a(paramInt);
    if (localBaseTroopView == null) {}
    do
    {
      do
      {
        return;
      } while (jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView == localBaseTroopView);
      if (jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView != null)
      {
        if (isResume()) {
          jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView.f();
        }
        jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView.g();
      }
      jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView = localBaseTroopView;
    } while (jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView == null);
    jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView.d();
    if (isResume()) {
      jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView.e();
    }
    jdField_a_of_type_AndroidWidgetFrameLayout.removeAllViews();
    jdField_a_of_type_AndroidWidgetFrameLayout.addView(jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView);
  }
  
  public boolean a()
  {
    return (jdField_a_of_type_ComTencentWidgetPopupMenuDialog != null) && (jdField_a_of_type_ComTencentWidgetPopupMenuDialog.isShowing());
  }
  
  public void b()
  {
    if (a()) {
      jdField_a_of_type_ComTencentWidgetPopupMenuDialog.dismiss();
    }
  }
  
  protected void doOnActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.doOnActivityResult(paramInt1, paramInt2, paramIntent);
    if (jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView != null) {
      jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView.a(paramInt1, paramInt2, paramIntent);
    }
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    super.doOnCreate(paramBundle);
    super.setContentView(2130903622);
    super.getWindow().setBackgroundDrawable(null);
    jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler = new MqqWeakReferenceHandler(this);
    jdField_a_of_type_JavaUtilArrayList.add(null);
    jdField_a_of_type_JavaUtilArrayList.add(null);
    jdField_a_of_type_JavaUtilArrayList.add(null);
    jdField_a_of_type_JavaUtilArrayList.add(null);
    paramBundle = (NewFriendManager)app.getManager(33);
    if (paramBundle != null) {
      paramBundle.addObserver(this);
    }
    jdField_b_of_type_Boolean = getIntent().getBooleanExtra("is_from_show_ext_troop_list", false);
    if (jdField_b_of_type_Boolean)
    {
      jdField_a_of_type_JavaUtilHashMap = new HashMap();
      jdField_a_of_type_ComTencentMobileqqActivityContactTroopShowExternalTroopListActivity$IShowExternalTroopDataChangedCallBack = new ltu(this);
    }
    c = getIntent().getBooleanExtra("fromH5", false);
    jdField_i_of_type_JavaLangString = getIntent().getStringExtra("troopType");
    j = getIntent().getIntExtra("key_tab_mode", 0);
    jdField_i_of_type_Int = getIntent().getIntExtra("_key_mode", a());
    if (jdField_i_of_type_Int == 4) {
      jdField_i_of_type_Int = a();
    }
    if (j == 2)
    {
      if (GroupSystemMsgController.a().a(app) <= 0) {
        break label306;
      }
      jdField_i_of_type_Int = 0;
      if (jdField_i_of_type_Int != 1) {
        break label324;
      }
      ReportController.b(app, "P_CliOper", "Grp_contacts", "", "notice", "enter_recom", 0, 0, "", "", "", "");
    }
    for (;;)
    {
      j = getIntent().getIntExtra("key_tab_mode", 0);
      c();
      d();
      return true;
      label306:
      if (RecommendTroopManagerImp.a(app) <= 0) {
        break;
      }
      jdField_i_of_type_Int = 1;
      break;
      label324:
      if (jdField_i_of_type_Int == 0) {
        ReportController.b(app, "P_CliOper", "Grp_contacts", "", "notice", "enter_verify", 0, 0, "", "", "", "");
      }
    }
  }
  
  protected void doOnDestroy()
  {
    ((NewFriendManager)app.getManager(33)).deleteObserver(this);
    Iterator localIterator = jdField_a_of_type_JavaUtilArrayList.iterator();
    while (localIterator.hasNext())
    {
      BaseTroopView localBaseTroopView = (BaseTroopView)localIterator.next();
      if (localBaseTroopView != null) {
        localBaseTroopView.h();
      }
    }
    if (!jdField_a_of_type_Boolean) {
      b(jdField_i_of_type_Int);
    }
    super.doOnDestroy();
    jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption = null;
  }
  
  protected boolean doOnKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    Intent localIntent;
    if ((paramInt == 4) && (jdField_a_of_type_JavaUtilHashMap != null))
    {
      localIntent = new Intent();
      if (jdField_a_of_type_JavaUtilHashMap.isEmpty()) {
        break label57;
      }
    }
    label57:
    for (boolean bool = true;; bool = false)
    {
      localIntent.putExtra("isDataChanged", bool);
      setResult(-1, localIntent);
      return super.doOnKeyDown(paramInt, paramKeyEvent);
    }
  }
  
  protected void doOnPause()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView != null) {
      jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView.f();
    }
    if (jdField_a_of_type_ComTencentWidgetPopupMenuDialog != null) {
      jdField_a_of_type_ComTencentWidgetPopupMenuDialog.a();
    }
    e = false;
    if (!jdField_a_of_type_Boolean) {
      b(jdField_i_of_type_Int);
    }
    super.doOnPause();
  }
  
  protected void doOnResume()
  {
    super.doOnResume();
    if (jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView != null) {
      jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView.e();
    }
    e = true;
    f();
  }
  
  protected void doOnStart()
  {
    super.doOnStart();
    if (jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView != null) {
      jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView.d();
    }
    if (c)
    {
      a(4, jdField_i_of_type_JavaLangString);
      c = false;
      jdField_i_of_type_JavaLangString = "DEFAULT";
    }
  }
  
  protected void doOnStop()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView != null) {
      jdField_a_of_type_ComTencentMobileqqActivityContactTroopBaseTroopView.g();
    }
    super.doOnStop();
  }
  
  public void finish()
  {
    super.finish();
    overridePendingTransition(2130968587, 2130968588);
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    if (what == 1234) {
      runOnUiThread(new lud(this));
    }
    for (;;)
    {
      return true;
      Iterator localIterator = jdField_a_of_type_JavaUtilArrayList.iterator();
      while (localIterator.hasNext())
      {
        BaseTroopView localBaseTroopView = (BaseTroopView)localIterator.next();
        if (localBaseTroopView != null) {
          localBaseTroopView.a(paramMessage);
        }
      }
    }
  }
  
  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if ((-1 == paramInt2) && (paramInt1 == 1300))
    {
      jdField_i_of_type_Int = 1;
      g();
      if (paramIntent != null)
      {
        String str1 = paramIntent.getStringExtra("roomId");
        if (str1 != null)
        {
          String str2 = ContactUtils.a(app, getApplicationContext(), str1);
          Intent localIntent = AIOUtils.a(new Intent(getActivity(), SplashActivity.class), null);
          localIntent.putExtra("uin", str1);
          localIntent.putExtra("uintype", 3000);
          localIntent.putExtra("uinname", str2);
          startActivity(localIntent);
          ReportController.b(app, "CliOper", "", "", "0X8006264", "0X8006264", 0, 0, "", "", "", "");
        }
      }
    }
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
  }
  
  protected void requestWindowFeature(Intent paramIntent)
  {
    requestWindowFeature(1);
  }
  
  public void update(Observable paramObservable, Object paramObject)
  {
    runOnUiThread(new ltv(this));
  }
}
