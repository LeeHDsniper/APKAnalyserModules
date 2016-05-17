package com.tencent.mobileqq.activity.contact.addcontact;

import android.app.Activity;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.view.InflateException;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.tencent.biz.addContactTroopView.AddContactTroopHandler;
import com.tencent.biz.addContactTroopView.AddContactTroopHandler.IGetPopClassAndSearchCB;
import com.tencent.biz.addContactTroopView.AddContactTroopManage;
import com.tencent.biz.addContactTroopView.TroopCardBanner;
import com.tencent.biz.addContactTroopView.TroopCardPopClassfic;
import com.tencent.mobileqq.activity.fling.TopGestureLayout;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBRepeatMessageField;
import com.tencent.mobileqq.util.DisplayUtil;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.PullRefreshHeader;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.AbsListView.LayoutParams;
import com.tencent.widget.OverScrollViewListener;
import com.tencent.widget.XListView;
import java.util.List;
import lre;
import lrf;
import lrg;
import lrh;
import lri;
import lrj;
import mqq.app.AppActivity;
import tencent.im.troop_search_popclassifc.popclassifc.BannerCard;
import tencent.im.troop_search_popclassifc.popclassifc.PopCard;
import tencent.im.troop_search_searchtab.searchtab.RspBody;
import tencent.im.troop_view.troopviewInfo.RspBody;

public class TroopView
  extends ContactBaseView
{
  private static final int jdField_a_of_type_Int = 0;
  private static final int jdField_b_of_type_Int = 1;
  private static final int jdField_c_of_type_Int = 2;
  private static final int jdField_d_of_type_Int = 3;
  private static final int jdField_e_of_type_Int = 4;
  private static final int jdField_f_of_type_Int = 5;
  private ProgressBar jdField_a_of_type_AndroidWidgetProgressBar;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  private AddContactTroopHandler.IGetPopClassAndSearchCB jdField_a_of_type_ComTencentBizAddContactTroopViewAddContactTroopHandler$IGetPopClassAndSearchCB;
  private TroopCardBanner jdField_a_of_type_ComTencentBizAddContactTroopViewTroopCardBanner;
  private TroopCardPopClassfic jdField_a_of_type_ComTencentBizAddContactTroopViewTroopCardPopClassfic;
  private TopGestureLayout jdField_a_of_type_ComTencentMobileqqActivityFlingTopGestureLayout;
  private PullRefreshHeader jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader;
  private OverScrollViewListener jdField_a_of_type_ComTencentWidgetOverScrollViewListener;
  private XListView jdField_a_of_type_ComTencentWidgetXListView;
  private lri jdField_a_of_type_Lri;
  private lrj jdField_a_of_type_Lrj;
  private boolean jdField_a_of_type_Boolean;
  private AddContactTroopHandler.IGetPopClassAndSearchCB jdField_b_of_type_ComTencentBizAddContactTroopViewAddContactTroopHandler$IGetPopClassAndSearchCB;
  private boolean jdField_b_of_type_Boolean;
  private boolean jdField_c_of_type_Boolean;
  private boolean jdField_d_of_type_Boolean;
  private boolean jdField_e_of_type_Boolean;
  private boolean jdField_f_of_type_Boolean;
  
  public TroopView(ContactBaseView.IAddContactContext paramIAddContactContext)
  {
    super(paramIAddContactContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
    jdField_b_of_type_Boolean = false;
    c = false;
    d = false;
    e = false;
    f = false;
    jdField_a_of_type_ComTencentWidgetOverScrollViewListener = new lrf(this);
    jdField_a_of_type_ComTencentBizAddContactTroopViewAddContactTroopHandler$IGetPopClassAndSearchCB = new lrg(this);
    jdField_b_of_type_ComTencentBizAddContactTroopViewAddContactTroopHandler$IGetPopClassAndSearchCB = new lrh(this);
  }
  
  private TopGestureLayout a()
  {
    ViewGroup localViewGroup2 = (ViewGroup)jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView$IAddContactContext.a().getWindow().getDecorView();
    View localView = localViewGroup2.getChildAt(0);
    ViewGroup localViewGroup1 = localViewGroup2;
    if (localView != null)
    {
      localViewGroup1 = localViewGroup2;
      if ((localView instanceof ViewGroup)) {
        localViewGroup1 = (ViewGroup)localView;
      }
    }
    if ((localViewGroup1 instanceof TopGestureLayout)) {
      return (TopGestureLayout)localViewGroup1;
    }
    return null;
  }
  
  private void a(int paramInt1, int paramInt2)
  {
    if (((AppActivity)jdField_a_of_type_AndroidContentContext).isResume()) {
      QQToast.a(jdField_a_of_type_AndroidContentContext, paramInt1, getResources().getString(paramInt2), 0).b(((BaseActivity)jdField_a_of_type_AndroidContentContext).getTitleBarHeight());
    }
  }
  
  private void a(List paramList)
  {
    jdField_a_of_type_Lri = new lri(this, null);
    jdField_a_of_type_Lri.a(paramList);
    jdField_a_of_type_ComTencentWidgetXListView.setAdapter(jdField_a_of_type_Lri);
  }
  
  private void a(popclassifc.BannerCard paramBannerCard)
  {
    jdField_a_of_type_ComTencentBizAddContactTroopViewTroopCardBanner = new TroopCardBanner(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView$IAddContactContext);
    jdField_a_of_type_ComTencentBizAddContactTroopViewTroopCardBanner.a();
    jdField_a_of_type_ComTencentBizAddContactTroopViewTroopCardBanner.setData(paramBannerCard);
    jdField_a_of_type_ComTencentWidgetXListView.a(jdField_a_of_type_ComTencentBizAddContactTroopViewTroopCardBanner);
  }
  
  private void a(popclassifc.PopCard paramPopCard)
  {
    try
    {
      jdField_a_of_type_ComTencentBizAddContactTroopViewTroopCardPopClassfic = new TroopCardPopClassfic(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView$IAddContactContext);
      jdField_a_of_type_ComTencentBizAddContactTroopViewTroopCardPopClassfic.a();
      jdField_a_of_type_ComTencentBizAddContactTroopViewTroopCardPopClassfic.setData(paramPopCard);
      jdField_a_of_type_ComTencentWidgetXListView.a(jdField_a_of_type_ComTencentBizAddContactTroopViewTroopCardPopClassfic);
      return;
    }
    catch (OutOfMemoryError paramPopCard)
    {
      while (!QLog.isColorLevel()) {}
      QLog.e("TroopView", 2, "initAddPopClassfic error:" + paramPopCard.getMessage());
      return;
    }
    catch (InflateException paramPopCard)
    {
      while (!QLog.isColorLevel()) {}
      QLog.e("TroopView", 2, "initAddPopClassfic error:" + paramPopCard.getMessage());
    }
  }
  
  private void a(boolean paramBoolean)
  {
    jdField_a_of_type_Boolean = false;
    jdField_b_of_type_Boolean = false;
    c = false;
    d = false;
    if (!NetworkUtil.g(getContext()))
    {
      r();
      return;
    }
    AddContactTroopHandler localAddContactTroopHandler = new AddContactTroopHandler(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    if (paramBoolean)
    {
      if (!f) {
        jdField_a_of_type_Lrj.sendEmptyMessageDelayed(2, 5000L);
      }
      localAddContactTroopHandler.a(jdField_a_of_type_ComTencentBizAddContactTroopViewAddContactTroopHandler$IGetPopClassAndSearchCB, jdField_b_of_type_ComTencentBizAddContactTroopViewAddContactTroopHandler$IGetPopClassAndSearchCB);
      return;
    }
    localAddContactTroopHandler.b(jdField_a_of_type_ComTencentBizAddContactTroopViewAddContactTroopHandler$IGetPopClassAndSearchCB, jdField_b_of_type_ComTencentBizAddContactTroopViewAddContactTroopHandler$IGetPopClassAndSearchCB);
  }
  
  private boolean a()
  {
    AddContactTroopManage localAddContactTroopManage = (AddContactTroopManage)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(79);
    return (jdField_a_of_type_ComTencentBizAddContactTroopViewTroopCardBanner == null) && (jdField_a_of_type_ComTencentBizAddContactTroopViewTroopCardPopClassfic == null) && (asearchRsb.rpt_card.size() <= 0);
  }
  
  private void d()
  {
    if (jdField_a_of_type_ComTencentBizAddContactTroopViewTroopCardBanner != null) {
      jdField_a_of_type_ComTencentBizAddContactTroopViewTroopCardBanner.f();
    }
    if (jdField_a_of_type_Lri != null) {
      jdField_a_of_type_Lri.a();
    }
  }
  
  private void h()
  {
    jdField_a_of_type_Lrj = new lrj(this);
  }
  
  private void i()
  {
    jdField_a_of_type_AndroidWidgetProgressBar = ((ProgressBar)findViewById(2131296916));
    jdField_a_of_type_ComTencentWidgetXListView = ((XListView)findViewById(2131299304));
    jdField_a_of_type_ComTencentWidgetXListView.setContentBackground(2130837739);
    Object localObject = LayoutInflater.from(jdField_a_of_type_AndroidContentContext);
    View localView = ((LayoutInflater)localObject).inflate(2130903599, jdField_a_of_type_ComTencentWidgetXListView, false);
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)localView.findViewById(2131299305));
    jdField_a_of_type_AndroidWidgetTextView.setPadding(getResources().getDimensionPixelSize(2131493312), 0, 0, 0);
    Drawable localDrawable = getResources().getDrawable(2130842718);
    localDrawable.setBounds(0, 0, localDrawable.getIntrinsicWidth(), localDrawable.getIntrinsicHeight());
    jdField_a_of_type_AndroidWidgetTextView.setCompoundDrawables(localDrawable, null, null, null);
    jdField_a_of_type_AndroidWidgetTextView.setFocusable(false);
    jdField_a_of_type_AndroidWidgetTextView.setCursorVisible(false);
    jdField_a_of_type_AndroidWidgetTextView.setOnClickListener(new lre(this));
    jdField_a_of_type_ComTencentWidgetXListView.a(localView, null, false);
    jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader = ((PullRefreshHeader)((LayoutInflater)localObject).inflate(2130903467, jdField_a_of_type_ComTencentWidgetXListView, false));
    jdField_a_of_type_ComTencentWidgetXListView.setOverScrollHeader(jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader);
    jdField_a_of_type_ComTencentWidgetXListView.setOverScrollListener(jdField_a_of_type_ComTencentWidgetOverScrollViewListener);
    localObject = new LinearLayout(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView$IAddContactContext.a());
    ((LinearLayout)localObject).setLayoutParams(new AbsListView.LayoutParams(-1, DisplayUtil.a(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView$IAddContactContext.a(), 20.0F)));
    jdField_a_of_type_ComTencentWidgetXListView.b((View)localObject, null, false);
    jdField_a_of_type_ComTencentMobileqqActivityFlingTopGestureLayout = a();
  }
  
  private void j()
  {
    e = true;
    jdField_a_of_type_Lrj.sendEmptyMessage(3);
  }
  
  private void k()
  {
    AddContactTroopManage localAddContactTroopManage = (AddContactTroopManage)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(79);
    if ((localAddContactTroopManage.a() != null) && (localAddContactTroopManage.a() != null) && (arpt_banner_items.size() > 0) && (jdField_a_of_type_ComTencentBizAddContactTroopViewTroopCardBanner == null)) {
      a(localAddContactTroopManage.a());
    }
    if ((localAddContactTroopManage.a() != null) && (localAddContactTroopManage.a() != null) && (arpt_pop_items.size() > 0) && (jdField_a_of_type_ComTencentBizAddContactTroopViewTroopCardPopClassfic == null)) {
      a(localAddContactTroopManage.a());
    }
  }
  
  private void l()
  {
    a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(79)).a().searchRsb.rpt_card.get());
  }
  
  private void m()
  {
    if (a()) {
      s();
    }
  }
  
  private void n()
  {
    if ((jdField_a_of_type_Boolean) && (jdField_b_of_type_Boolean))
    {
      p();
      q();
    }
  }
  
  private void o()
  {
    if ((jdField_a_of_type_Boolean) && (jdField_b_of_type_Boolean)) {
      q();
    }
  }
  
  private void p()
  {
    try
    {
      AddContactTroopManage localAddContactTroopManage = (AddContactTroopManage)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(79);
      k();
      if (jdField_a_of_type_ComTencentBizAddContactTroopViewTroopCardBanner != null) {
        jdField_a_of_type_ComTencentBizAddContactTroopViewTroopCardBanner.setData(localAddContactTroopManage.a());
      }
      if (jdField_a_of_type_ComTencentBizAddContactTroopViewTroopCardPopClassfic != null) {
        jdField_a_of_type_ComTencentBizAddContactTroopViewTroopCardPopClassfic.setData(localAddContactTroopManage.a());
      }
      if ((jdField_a_of_type_Lri != null) && (localAddContactTroopManage.a() != null))
      {
        jdField_a_of_type_Lri.a(asearchRsb.rpt_card.get());
        jdField_a_of_type_Lri.notifyDataSetChanged();
      }
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  private void q()
  {
    f = true;
    t();
    if ((d) || (c))
    {
      jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader.a(0);
      jdField_a_of_type_Lrj.sendEmptyMessageDelayed(0, 800L);
    }
    do
    {
      return;
      jdField_a_of_type_Lrj.sendEmptyMessageDelayed(0, 800L);
    } while (e);
    a(1, 2131368310);
  }
  
  private void r()
  {
    t();
    if (!e)
    {
      a(1, 2131368714);
      jdField_a_of_type_Lrj.sendEmptyMessageDelayed(1, 800L);
    }
  }
  
  private void s()
  {
    jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(0);
  }
  
  private void t()
  {
    jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(8);
  }
  
  protected void a()
  {
    super.a();
    a(2130903598);
    setBackgroundResource(2130838185);
    h();
    i();
    k();
    l();
    m();
    j();
  }
  
  protected void b()
  {
    super.b();
    if (jdField_a_of_type_ComTencentMobileqqActivityFlingTopGestureLayout != null) {
      jdField_a_of_type_ComTencentMobileqqActivityFlingTopGestureLayout.setInterceptTouchFlag(false);
    }
    if (jdField_a_of_type_ComTencentBizAddContactTroopViewTroopCardBanner != null) {
      jdField_a_of_type_ComTencentBizAddContactTroopViewTroopCardBanner.c();
    }
  }
  
  protected void c()
  {
    super.c();
    d();
  }
  
  protected void f()
  {
    super.f();
    if (jdField_a_of_type_ComTencentMobileqqActivityFlingTopGestureLayout != null) {
      jdField_a_of_type_ComTencentMobileqqActivityFlingTopGestureLayout.setInterceptTouchFlag(true);
    }
    if (jdField_a_of_type_ComTencentBizAddContactTroopViewTroopCardBanner != null) {
      jdField_a_of_type_ComTencentBizAddContactTroopViewTroopCardBanner.d();
    }
  }
  
  protected void g()
  {
    super.g();
    if (jdField_a_of_type_ComTencentBizAddContactTroopViewTroopCardBanner != null) {
      jdField_a_of_type_ComTencentBizAddContactTroopViewTroopCardBanner.e();
    }
  }
}
