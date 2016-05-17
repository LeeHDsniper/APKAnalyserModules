package com.tencent.mobileqq.activity.contact.addcontact;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Resources;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.animation.Animation;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.LinearInterpolator;
import android.view.animation.RotateAnimation;
import android.widget.Button;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.biz.pubaccount.PublicAccountBrowser;
import com.tencent.biz.pubaccount.util.PublicAccountUtil;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.FontSettingManager;
import com.tencent.mobileqq.app.PublicAccountDataManager;
import com.tencent.mobileqq.app.PublicAccountHandler;
import com.tencent.mobileqq.app.PublicAccountObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.soso.SosoInterface;
import com.tencent.mobileqq.app.soso.SosoInterface.SosoLbsInfo;
import com.tencent.mobileqq.data.PublicRecommendAccountInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.theme.ThemeUtil;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.webviewplugin.WebViewPluginConfig;
import com.tencent.mobileqq.widget.PullRefreshHeader;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.ListView;
import com.tencent.widget.OverScrollViewListener;
import com.tencent.widget.XListView;
import java.util.ArrayList;
import java.util.Map;
import lqg;
import lqh;
import lqj;
import lqk;
import lql;
import lqm;
import lqn;
import mqq.app.AppActivity;
import mqq.app.MobileQQ;

public class PublicView
  extends ContactBaseView
  implements View.OnClickListener, OverScrollViewListener
{
  private static final int jdField_a_of_type_Int = 1;
  private static final String jdField_a_of_type_JavaLangString = "PublicView";
  private static final int jdField_b_of_type_Int = 2;
  private static final String jdField_b_of_type_JavaLangString = "http://find.mp.qq.com/public/categories?_wv=67109947&_bid=2258";
  private static final int jdField_c_of_type_Int = 3;
  private static final String jdField_c_of_type_JavaLangString = "http://find.mp.qq.com/public/index?_wv=67109947&_bid=2258";
  private static final int d = 4;
  private long jdField_a_of_type_Long;
  private View jdField_a_of_type_AndroidViewView;
  private Button jdField_a_of_type_AndroidWidgetButton;
  private ProgressBar jdField_a_of_type_AndroidWidgetProgressBar;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  private PublicAccountObserver jdField_a_of_type_ComTencentMobileqqAppPublicAccountObserver;
  private PullRefreshHeader jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader;
  private XListView jdField_a_of_type_ComTencentWidgetXListView;
  private ArrayList jdField_a_of_type_JavaUtilArrayList;
  private lql jdField_a_of_type_Lql;
  private lqm jdField_a_of_type_Lqm;
  private boolean jdField_a_of_type_Boolean;
  private View jdField_b_of_type_AndroidViewView;
  
  public PublicView(ContactBaseView.IAddContactContext paramIAddContactContext)
  {
    super(paramIAddContactContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilArrayList = new ArrayList();
    jdField_a_of_type_Lqm = new lqm(this);
    jdField_a_of_type_Long = 0L;
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_ComTencentMobileqqAppPublicAccountObserver = new lqk(this);
  }
  
  private void a(int paramInt1, int paramInt2)
  {
    if (((AppActivity)jdField_a_of_type_AndroidContentContext).isResume()) {
      QQToast.a(jdField_a_of_type_AndroidContentContext, paramInt1, getResources().getString(paramInt2), 0).b(((BaseActivity)jdField_a_of_type_AndroidContentContext).getTitleBarHeight());
    }
  }
  
  public static void a(QQAppInterface paramQQAppInterface, Context paramContext, int paramInt1, String paramString1, String paramString2, int paramInt2, String paramString3, int paramInt3)
  {
    if (paramInt1 == 1)
    {
      paramString2 = new Intent();
      paramString2.putExtra("source", paramInt3);
      PublicAccountUtil.a(paramString2, paramQQAppInterface, paramContext, paramString1, -7);
      return;
    }
    paramString1 = new Intent();
    paramString1.putExtra("uinname", paramString3);
    paramString1.putExtra("source", paramInt3);
    PublicAccountUtil.a(paramString1, paramQQAppInterface, paramContext, paramString2, paramInt2);
  }
  
  private void a(SosoInterface.SosoLbsInfo paramSosoLbsInfo)
  {
    ((PublicAccountHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(11)).a(paramSosoLbsInfo);
  }
  
  private void a(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {}
    while ((jdField_a_of_type_ComTencentMobileqqAppQQAppInterface == null) || (TextUtils.isEmpty(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount())) || (TextUtils.isEmpty(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getSid()))) {
      return;
    }
    Intent localIntent = new Intent(jdField_a_of_type_AndroidContentContext, PublicAccountBrowser.class);
    localIntent.putExtra("uin", jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
    localIntent.putExtra("url", paramString);
    localIntent.putExtra("assignBackText", jdField_a_of_type_AndroidContentContext.getResources().getString(2131368389));
    if (WebViewPluginConfig.a.containsKey("PublicAccountJs")) {
      localIntent.putExtra("insertPluginsArray", new String[] { "PublicAccountJs" });
    }
    jdField_a_of_type_AndroidContentContext.startActivity(localIntent);
  }
  
  private void a(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      if ((jdField_a_of_type_JavaUtilArrayList != null) && (jdField_a_of_type_JavaUtilArrayList.size() > 0)) {}
      jdField_a_of_type_JavaUtilArrayList = ((PublicAccountDataManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(55)).d();
    }
    if ((jdField_a_of_type_JavaUtilArrayList == null) || ((jdField_a_of_type_JavaUtilArrayList != null) && (jdField_a_of_type_JavaUtilArrayList.size() == 0))) {
      i();
    }
    for (;;)
    {
      if (jdField_a_of_type_Lql == null) {
        jdField_a_of_type_Lql = new lql(this, jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentWidgetXListView);
      }
      jdField_a_of_type_Lql.notifyDataSetChanged();
      return;
      long l1 = System.currentTimeMillis();
      long l2 = jdField_a_of_type_Long;
      if (QLog.isColorLevel()) {
        QLog.i("PublicView", 2, "PublicView onCreate used(milliseconds):" + (l1 - l2));
      }
      j();
    }
  }
  
  private boolean a()
  {
    if (NetworkUtil.g(jdField_a_of_type_AndroidContentContext))
    {
      m();
      return true;
    }
    a(1, 2131368714);
    return false;
  }
  
  private void d()
  {
    if (jdField_a_of_type_AndroidViewView != null)
    {
      Object localObject = jdField_a_of_type_AndroidViewView.findViewById(2131300805);
      View localView1 = jdField_a_of_type_AndroidViewView.findViewById(2131300806);
      View localView2 = jdField_a_of_type_AndroidViewView.findViewById(2131300807);
      RotateAnimation localRotateAnimation = new RotateAnimation(0.0F, 360.0F, 1, 0.5F, 1, 0.5F);
      localRotateAnimation.setDuration(600L);
      localRotateAnimation.setInterpolator(new DecelerateInterpolator());
      ((View)localObject).startAnimation(localRotateAnimation);
      localObject = new RotateAnimation(-90.0F, 0.0F, 1, 0.5F, 1, 0.5F);
      ((RotateAnimation)localObject).setDuration(600L);
      ((RotateAnimation)localObject).setInterpolator(new LinearInterpolator());
      localView1.startAnimation((Animation)localObject);
      new Handler().postDelayed(new lqh(this, localView2), 130L);
    }
  }
  
  private void h()
  {
    jdField_a_of_type_AndroidWidgetProgressBar = ((ProgressBar)findViewById(2131296916));
    jdField_a_of_type_ComTencentWidgetXListView = ((XListView)findViewById(2131299304));
    jdField_a_of_type_ComTencentWidgetXListView.setContentBackground(2130837739);
    LayoutInflater localLayoutInflater = LayoutInflater.from(jdField_a_of_type_AndroidContentContext);
    View localView = localLayoutInflater.inflate(2130903986, jdField_a_of_type_ComTencentWidgetXListView, false);
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)localView.findViewById(2131299305));
    jdField_a_of_type_AndroidWidgetTextView.setPadding(getResources().getDimensionPixelSize(2131493312), 0, 0, 0);
    Drawable localDrawable = getResources().getDrawable(2130842718);
    localDrawable.setBounds(0, 0, localDrawable.getIntrinsicWidth(), localDrawable.getIntrinsicHeight());
    jdField_a_of_type_AndroidWidgetTextView.setCompoundDrawables(localDrawable, null, null, null);
    jdField_a_of_type_AndroidWidgetTextView.setFocusable(false);
    jdField_a_of_type_AndroidWidgetTextView.setCursorVisible(false);
    jdField_a_of_type_AndroidWidgetTextView.setOnClickListener(this);
    jdField_a_of_type_ComTencentWidgetXListView.a(localView, null, false);
    jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader = ((PullRefreshHeader)localLayoutInflater.inflate(2130903467, jdField_a_of_type_ComTencentWidgetXListView, false));
    jdField_a_of_type_ComTencentWidgetXListView.setOverScrollHeader(jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader);
    jdField_a_of_type_ComTencentWidgetXListView.setOverScrollListener(this);
    jdField_a_of_type_AndroidViewView = ((RelativeLayout)localView.findViewById(2131300803));
    b = ((RelativeLayout)localView.findViewById(2131300809));
    float f = FontSettingManager.a() / 16.0F;
    if (f > 1.0F)
    {
      ((TextView)jdField_a_of_type_AndroidViewView.findViewById(2131300808)).setTextSize(16.0F / f);
      ((TextView)b.findViewById(2131300811)).setTextSize(16.0F / f);
    }
    jdField_a_of_type_AndroidViewView.setOnClickListener(this);
    b.setOnClickListener(this);
    jdField_a_of_type_AndroidWidgetButton = ((Button)localView.findViewById(2131297453));
  }
  
  private void i()
  {
    jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(0);
  }
  
  private void j()
  {
    jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(8);
  }
  
  private void k()
  {
    if (QLog.isColorLevel()) {
      QLog.d("PublicView", 2, "getCurrentLocation(): BEGIN");
    }
    SosoInterface.a(new lqj(this, 1, true, true, 0L, false, false, "PublicView"));
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_Lqm.sendEmptyMessageDelayed(4, 3000L);
    if (QLog.isColorLevel()) {
      QLog.d("PublicView", 2, "getCurrentLocation(): END");
    }
  }
  
  private void l()
  {
    if (!jdField_a_of_type_Boolean) {
      a(null);
    }
  }
  
  private void m()
  {
    k();
  }
  
  public int a()
  {
    return getResources().getDimensionPixelSize(2131493424);
  }
  
  protected void a()
  {
    if (QLog.isColorLevel()) {
      jdField_a_of_type_Long = System.currentTimeMillis();
    }
    super.a();
    a(2130903985);
    h();
    ((BaseActivity)jdField_a_of_type_AndroidContentContext).addObserver(jdField_a_of_type_ComTencentMobileqqAppPublicAccountObserver);
    a(true);
    m();
  }
  
  public void a(int paramInt, View paramView, ListView paramListView)
  {
    jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader.a(0L);
  }
  
  public boolean a(int paramInt, View paramView, ListView paramListView)
  {
    jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader.c(0L);
    if (!a()) {
      jdField_a_of_type_Lqm.sendEmptyMessageDelayed(2, 1000L);
    }
    return true;
  }
  
  protected void b()
  {
    super.b();
    if (ThemeUtil.isInNightMode(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface)) {
      jdField_a_of_type_AndroidWidgetButton.setBackgroundColor(Color.parseColor("#0f223d"));
    }
    for (;;)
    {
      SharedPreferences localSharedPreferences = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication().getApplicationContext().getSharedPreferences("sp_public_account_with_cuin_" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), 0);
      if ((localSharedPreferences != null) && (!localSharedPreferences.getBoolean("public_view_pa_center_anim", false)))
      {
        jdField_a_of_type_AndroidViewView.findViewById(2131300807).setVisibility(8);
        new Handler().postDelayed(new lqg(this), 250L);
        localSharedPreferences.edit().putBoolean("public_view_pa_center_anim", true);
      }
      return;
      jdField_a_of_type_AndroidWidgetButton.setBackgroundColor(Color.parseColor("#e5e5e5"));
    }
  }
  
  public void b(int paramInt, View paramView, ListView paramListView)
  {
    jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader.b(0L);
  }
  
  protected void c()
  {
    ((BaseActivity)jdField_a_of_type_AndroidContentContext).removeObserver(jdField_a_of_type_ComTencentMobileqqAppPublicAccountObserver);
    if (jdField_a_of_type_Lql != null) {
      jdField_a_of_type_Lql.b();
    }
    super.c();
  }
  
  public void c(int paramInt, View paramView, ListView paramListView) {}
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default: 
      return;
    case 2131299305: 
      jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView$IAddContactContext.a();
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004BEC", "0X8004BEC", 3, 0, "", "", "", "");
      return;
    case 2131299725: 
      paramView = (lqn)paramView.getTag();
      a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_AndroidContentContext, a.mSource, a.mEqqNameAccount, String.valueOf(a.mPublicuin), a.accountflag, a.mPublicname, 3);
      return;
    case 2131300803: 
      a("http://find.mp.qq.com/public/index?_wv=67109947&_bid=2258");
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", "", "0X800609A", "0X800609A", 0, 0, "", "", "", "");
      return;
    }
    a("http://find.mp.qq.com/public/categories?_wv=67109947&_bid=2258");
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", "", "0X800609B", "0X800609B", 0, 0, "", "", "", "");
  }
}
