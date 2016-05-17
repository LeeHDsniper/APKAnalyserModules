package com.tencent.mobileqq.activity.qqcard;

import QCARD.CouponMobileFolder;
import QCARD.CouponMobileItem;
import QCARD.GetCollectItemMobileRsp;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Message;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.view.Window;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.app.IphoneTitleBarActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.QQCardHandler;
import com.tencent.mobileqq.app.QQCardObserver;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.PullRefreshHeader;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.ListView;
import com.tencent.widget.OverScrollViewListener;
import com.tencent.widget.XExpandableListView;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import mcg;
import mch;
import mci;
import mcj;

public class QQCardActivity
  extends IphoneTitleBarActivity
  implements Handler.Callback, ViewTreeObserver.OnGlobalLayoutListener, QQCardConstant, RefreshFooter.RefreshListener, OverScrollViewListener
{
  public static final int a = 1;
  public static final String a;
  public static final int b = 2;
  private int A = 0;
  private final int B = 1;
  private final int C = 2;
  private final int D = 3;
  Context jdField_a_of_type_AndroidContentContext;
  public Resources a;
  public Handler a;
  QQCardExpandableAdapter jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardExpandableAdapter;
  public QQCardFolder a;
  public QQCardFooter a;
  QQCardHeader jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardHeader;
  public QQCardManager a;
  QQCardHandler jdField_a_of_type_ComTencentMobileqqAppQQCardHandler;
  QQCardObserver jdField_a_of_type_ComTencentMobileqqAppQQCardObserver = new mcj(this);
  public PullRefreshHeader a;
  XExpandableListView jdField_a_of_type_ComTencentWidgetXExpandableListView;
  public List a;
  public AtomicBoolean a;
  public boolean a;
  private long jdField_b_of_type_Long = 0L;
  public AtomicBoolean b;
  boolean jdField_b_of_type_Boolean = false;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = QQCardActivity.class.getSimpleName();
  }
  
  public QQCardActivity()
  {
    jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean = new AtomicBoolean(false);
    jdField_b_of_type_JavaUtilConcurrentAtomicAtomicBoolean = new AtomicBoolean(false);
    jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFolder = null;
    jdField_a_of_type_JavaUtilList = null;
  }
  
  private void a(long paramLong, CouponMobileFolder paramCouponMobileFolder)
  {
    if (QLog.isColorLevel()) {
      QLog.i(jdField_a_of_type_JavaLangString, 2, "handleChange remoteSequence=" + paramLong + ",folder.aboutexpire_num=" + aboutexpire_num + ",folder.coupons_num=" + coupons_num);
    }
    if (paramCouponMobileFolder == null) {
      return;
    }
    jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFolder = new QQCardFolder(100, paramCouponMobileFolder);
    paramCouponMobileFolder = jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardExpandableAdapter.a(paramCouponMobileFolder);
    jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardExpandableAdapter.a(jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFolder);
    jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardExpandableAdapter.notifyDataSetChanged();
    boolean bool;
    if (!TextUtils.isEmpty(jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFolder.unavailableUrl))
    {
      bool = true;
      if (jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFolder.couponsNum >= 1) {
        break label171;
      }
      jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFooter.a(0, bool);
    }
    for (;;)
    {
      jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.set(true);
      ThreadManager.a(new mci(this, paramCouponMobileFolder, paramLong), 8, null, true);
      return;
      bool = false;
      break;
      label171:
      jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFooter.a(8, bool);
    }
  }
  
  private void a(long paramLong, Map paramMap, CouponMobileFolder paramCouponMobileFolder)
  {
    long l = jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardManager.a("qqcard_sequence");
    if (QLog.isColorLevel()) {
      QLog.i(jdField_a_of_type_JavaLangString, 2, "handleUpdate localSequence=" + l + ",remoteSequence=" + paramLong + ",folder=" + paramCouponMobileFolder + ",folderIndexMap=" + paramMap);
    }
    if ((paramCouponMobileFolder == null) || (paramMap == null)) {
      return;
    }
    if (jdField_b_of_type_JavaUtilConcurrentAtomicAtomicBoolean.get()) {
      c();
    }
    for (int i = 1;; i = 0)
    {
      if (paramMap.isEmpty())
      {
        jdField_a_of_type_Boolean = false;
        jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFooter.a(unavailable_url);
        jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFooter.a(2);
        if (QLog.isColorLevel()) {
          QLog.d(jdField_a_of_type_JavaLangString, 2, "handleUpdate, isRecommendSwitchOn=" + jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardHeader.a());
        }
        if (jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardHeader.a()) {
          jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFooter.a();
        }
      }
      ArrayList localArrayList;
      for (;;)
      {
        if (jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFolder == null) {
          jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFolder = new QQCardFolder(100, paramCouponMobileFolder);
        }
        localArrayList = new ArrayList();
        Iterator localIterator = coupon_list.iterator();
        while (localIterator.hasNext()) {
          localArrayList.add(new QQCardItem((CouponMobileItem)localIterator.next(), 0, folder_id));
        }
        jdField_b_of_type_Boolean = true;
        continue;
        jdField_a_of_type_Boolean = true;
        jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFooter.a(null);
        jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFooter.a(0);
      }
      boolean bool;
      if (i != 0)
      {
        jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardExpandableAdapter.a(jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFolder, localArrayList);
        jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardExpandableAdapter.notifyDataSetChanged();
        if (TextUtils.isEmpty(jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFolder.unavailableUrl)) {
          break label406;
        }
        bool = true;
        label346:
        if (jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFolder.couponsNum > 0) {
          break label412;
        }
        jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFooter.a(0, bool);
      }
      for (;;)
      {
        jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.set(true);
        ThreadManager.a(new mch(this, localArrayList, paramLong, paramMap), 8, null, true);
        return;
        jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardExpandableAdapter.a(localArrayList);
        break;
        label406:
        bool = false;
        break label346;
        label412:
        jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFooter.a(8, bool);
      }
    }
  }
  
  private void a(boolean paramBoolean)
  {
    if (QLog.isDevelopLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 4, "requestCouponList mIsRequesting=" + jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.get() + ",isCheckSequence=" + paramBoolean);
    }
    if (jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.get()) {
      return;
    }
    long l = System.currentTimeMillis();
    if (l - jdField_b_of_type_Long < A)
    {
      if (QLog.isDevelopLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 4, "requestCouponList so fast...lastRequestTime=" + jdField_b_of_type_Long + ",currTime=" + l + ",intervalTime=" + A);
      }
      if (paramBoolean) {
        jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader.a(1);
      }
      for (;;)
      {
        jdField_a_of_type_AndroidOsHandler.sendEmptyMessageDelayed(1, 800L);
        QQToast.a(this, jdField_a_of_type_AndroidContentResResources.getString(2131366382), 0).a();
        return;
        jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFooter.a(0);
      }
    }
    jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.set(true);
    jdField_b_of_type_Long = l;
    jdField_b_of_type_JavaUtilConcurrentAtomicAtomicBoolean.set(paramBoolean);
    Map localMap;
    if (!jdField_b_of_type_JavaUtilConcurrentAtomicAtomicBoolean.get())
    {
      localMap = jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardManager.a();
      jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFooter.a(1);
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqAppQQCardHandler.a(jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardManager.a("qqcard_sequence"), 1, 1, localMap, null);
      return;
      localMap = null;
    }
  }
  
  private void b()
  {
    long l = jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardManager.a("qqcard_cache_time");
    if (System.currentTimeMillis() - l > 3600000L)
    {
      c();
      a(true);
      return;
    }
    jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.set(true);
    ThreadManager.a(new mcg(this), 8, null, true);
  }
  
  private void c()
  {
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFolder = null;
    jdField_a_of_type_JavaUtilList = null;
    jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardManager.a(false);
    jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardManager.a("qqcard_sequence", 0L);
    jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardManager.a(null);
    jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardManager.a();
    jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardManager.a("qqcard_cache_time", System.currentTimeMillis());
  }
  
  private void d()
  {
    if (QLog.isColorLevel()) {
      QLog.i(jdField_a_of_type_JavaLangString, 2, "handleNoChange, localSequence=" + jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardManager.a("qqcard_sequence") + ", hasMore=" + jdField_a_of_type_Boolean + ", recommendSwitch=" + jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardHeader.a());
    }
    if (!jdField_a_of_type_Boolean)
    {
      if (jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardHeader.a()) {
        jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFooter.a();
      }
    }
    else {
      return;
    }
    jdField_b_of_type_Boolean = true;
  }
  
  public void a()
  {
    if (QLog.isDevelopLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 4, "onLoadMore");
    }
    a(false);
  }
  
  public void a(int paramInt, View paramView, ListView paramListView)
  {
    jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader.a(0L);
  }
  
  public void a(String paramString)
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "gotoWebPage url=" + paramString);
    }
    Intent localIntent = new Intent(jdField_a_of_type_AndroidContentContext, QQBrowserActivity.class);
    localIntent.putExtra("url", paramString);
    super.startActivity(localIntent);
  }
  
  public void a(String paramString, GetCollectItemMobileRsp paramGetCollectItemMobileRsp)
  {
    if (folder_list.size() > 0) {}
    CouponMobileItem localCouponMobileItem;
    long l;
    for (CouponMobileFolder localCouponMobileFolder = (CouponMobileFolder)folder_list.get(0);; localCouponMobileFolder = null)
    {
      localCouponMobileItem = item;
      l = sequence;
      if ((localCouponMobileFolder != null) && (localCouponMobileItem != null)) {
        break;
      }
      return;
    }
    QQCardItem localQQCardItem = new QQCardItem(localCouponMobileItem, 0, folder_id);
    isNew = true;
    if (QLog.isColorLevel()) {
      QLog.i(jdField_a_of_type_JavaLangString, 2, "handleCollectCoupon cardId=" + paramString + ",next_card_uid=" + next_card_uid + ",remoteSequence=" + l + ",coupon=" + localCouponMobileItem);
    }
    if (!jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardExpandableAdapter.a(localQQCardItem, next_card_uid))
    {
      a(true);
      return;
    }
    jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFolder = new QQCardFolder(100, localCouponMobileFolder);
    boolean bool;
    if (!TextUtils.isEmpty(jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFolder.unavailableUrl))
    {
      bool = true;
      if (jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFolder.couponsNum >= 1) {
        break label252;
      }
      jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFooter.a(0, bool);
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardExpandableAdapter.a(jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFolder);
      jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardExpandableAdapter.notifyDataSetChanged();
      jdField_a_of_type_ComTencentWidgetXExpandableListView.f(QQCardConstant.y, 1000);
      return;
      bool = false;
      break;
      label252:
      jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFooter.a(8, bool);
    }
  }
  
  public boolean a(int paramInt, View paramView, ListView paramListView)
  {
    jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader.c(0L);
    a(true);
    return true;
  }
  
  public void b(int paramInt, View paramView, ListView paramListView)
  {
    jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader.b(0L);
  }
  
  public void c(int paramInt, View paramView, ListView paramListView) {}
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    super.doOnCreate(paramBundle);
    super.setContentView(2130904410);
    if (Build.VERSION.SDK_INT >= 11) {
      getWindow().setFlags(16777216, 16777216);
    }
    jdField_a_of_type_AndroidContentContext = getBaseContext();
    jdField_a_of_type_AndroidContentResResources = getResources();
    super.setTitle(jdField_a_of_type_AndroidContentResResources.getString(2131366381));
    jdField_a_of_type_ComTencentWidgetXExpandableListView = ((XExpandableListView)findViewById(2131302583));
    jdField_a_of_type_ComTencentWidgetXExpandableListView.setCacheColorHint(0);
    jdField_a_of_type_ComTencentWidgetXExpandableListView.setGroupIndicator(null);
    jdField_a_of_type_ComTencentWidgetXExpandableListView.setOnItemClickListener(null);
    jdField_a_of_type_ComTencentWidgetXExpandableListView.setOverscrollHeader(jdField_a_of_type_AndroidContentResResources.getDrawable(2130838185));
    jdField_a_of_type_ComTencentWidgetXExpandableListView.setNeedCheckSpringback(true);
    paramBundle = getLayoutInflater().inflate(2130904428, null);
    jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardHeader = new QQCardHeader(this, paramBundle);
    jdField_a_of_type_ComTencentWidgetXExpandableListView.a(paramBundle, null, false);
    paramBundle = getLayoutInflater().inflate(2130904427, null);
    jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFooter = new QQCardFooter(this, app, paramBundle);
    jdField_a_of_type_ComTencentWidgetXExpandableListView.b(paramBundle);
    jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardExpandableAdapter = new QQCardExpandableAdapter(this);
    jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader = ((PullRefreshHeader)getLayoutInflater().inflate(2130903467, jdField_a_of_type_ComTencentWidgetXExpandableListView, false));
    jdField_a_of_type_ComTencentWidgetXExpandableListView.setOverScrollHeader(jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader);
    jdField_a_of_type_ComTencentWidgetXExpandableListView.setOverScrollHeight(jdField_a_of_type_AndroidContentResResources.getDimensionPixelSize(2131492895));
    jdField_a_of_type_ComTencentWidgetXExpandableListView.setOverScrollListener(this);
    jdField_a_of_type_ComTencentWidgetXExpandableListView.setOnScrollListener(jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFooter);
    jdField_a_of_type_ComTencentWidgetXExpandableListView.setAdapter(jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardExpandableAdapter);
    int i = 0;
    while (i < jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardExpandableAdapter.getGroupCount())
    {
      jdField_a_of_type_ComTencentWidgetXExpandableListView.a(i);
      i += 1;
    }
    jdField_a_of_type_ComTencentWidgetXExpandableListView.getViewTreeObserver().addOnGlobalLayoutListener(this);
    app.a(jdField_a_of_type_ComTencentMobileqqAppQQCardObserver);
    jdField_a_of_type_ComTencentMobileqqAppQQCardHandler = ((QQCardHandler)app.a(69));
    jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardManager = ((QQCardManager)app.getManager(116));
    jdField_a_of_type_AndroidOsHandler = new Handler(this);
    jdField_a_of_type_Boolean = jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardManager.a();
    if (QLog.isDevelopLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 4, "doOnCreate mHasMore=" + jdField_a_of_type_Boolean);
    }
    jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardHeader.a();
    b();
    jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardManager.a("cardindex", 0);
    return true;
  }
  
  protected void doOnDestroy()
  {
    app.b(jdField_a_of_type_ComTencentMobileqqAppQQCardObserver);
    jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardHeader.b();
    jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFooter.b();
    super.doOnDestroy();
  }
  
  protected void doOnResume()
  {
    super.doOnResume();
    a(true);
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    switch (what)
    {
    default: 
      return false;
    case 1: 
      jdField_a_of_type_ComTencentWidgetXExpandableListView.I();
      return false;
    }
    boolean bool;
    if (jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFolder != null) {
      if (!TextUtils.isEmpty(jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFolder.unavailableUrl)) {
        bool = true;
      }
    }
    for (;;)
    {
      if ((jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFolder != null) && (jdField_a_of_type_JavaUtilList != null) && (jdField_a_of_type_JavaUtilList.size() > 0))
      {
        jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFooter.a(8, bool);
        jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardExpandableAdapter.a(jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFolder, jdField_a_of_type_JavaUtilList);
        jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardExpandableAdapter.notifyDataSetChanged();
        label119:
        if (jdField_a_of_type_Boolean) {
          break label200;
        }
        jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFooter.a(2);
        QQCardFooter localQQCardFooter = jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFooter;
        if (jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFolder == null) {
          break label195;
        }
        paramMessage = jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFolder.unavailableUrl;
        label154:
        localQQCardFooter.a(paramMessage);
      }
      for (;;)
      {
        jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.set(false);
        a(true);
        return false;
        bool = false;
        break;
        jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFooter.a(0, bool);
        c();
        break label119;
        label195:
        paramMessage = null;
        break label154;
        label200:
        jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFooter.a(0);
        jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardFooter.a(null);
      }
      bool = false;
    }
  }
  
  public void onGlobalLayout()
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "onGlobalLayout...");
    }
    jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardExpandableAdapter.a();
  }
}
