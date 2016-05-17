package com.tencent.mobileqq.activity.qqcard;

import LBS.LBSInfo;
import QCARD.CouponMobileFolder;
import QCARD.CouponMobileItem;
import QCARD.GetListRsp;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Message;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.app.IphoneTitleBarActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.QQCardHandler;
import com.tencent.mobileqq.app.QQCardObserver;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.fragment.BaseFragment;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.PullRefreshHeader;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.AdapterView;
import com.tencent.widget.AdapterView.OnItemClickListener;
import com.tencent.widget.ListView;
import com.tencent.widget.OverScrollViewListener;
import com.tencent.widget.XListView;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import mcd;
import mce;
import mcf;
import mqq.os.MqqHandler;

public class NearByQQCardFragment
  extends BaseFragment
  implements Handler.Callback, RefreshFooter.RefreshListener, AdapterView.OnItemClickListener, OverScrollViewListener
{
  public static final int a = 1;
  public static final String a;
  private long jdField_a_of_type_Long = 0L;
  private LBSInfo jdField_a_of_type_LBSLBSInfo;
  private Handler jdField_a_of_type_AndroidOsHandler;
  private QQCardAdapter jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardAdapter;
  private RefreshFooter jdField_a_of_type_ComTencentMobileqqActivityQqcardRefreshFooter;
  private QQCardHandler jdField_a_of_type_ComTencentMobileqqAppQQCardHandler;
  private QQCardObserver jdField_a_of_type_ComTencentMobileqqAppQQCardObserver;
  private PullRefreshHeader jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader;
  private XListView jdField_a_of_type_ComTencentWidgetXListView;
  private Map jdField_a_of_type_JavaUtilMap = null;
  private boolean d = false;
  private boolean e;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = NearByQQCardFragment.class.getSimpleName();
  }
  
  public NearByQQCardFragment() {}
  
  public static NearByQQCardFragment a(int paramInt)
  {
    NearByQQCardFragment localNearByQQCardFragment = new NearByQQCardFragment();
    Bundle localBundle = new Bundle();
    localBundle.putInt("tabID", paramInt);
    localNearByQQCardFragment.setArguments(localBundle);
    return localNearByQQCardFragment;
  }
  
  private void a(boolean paramBoolean)
  {
    e = paramBoolean;
    if (d)
    {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "getNearCouponList, is requesting");
      }
      return;
    }
    d = true;
    if (!e) {
      jdField_a_of_type_ComTencentMobileqqActivityQqcardRefreshFooter.a(0);
    }
    ThreadManager.a().post(new mcf(this, paramBoolean));
  }
  
  private void a(boolean paramBoolean, GetListRsp paramGetListRsp)
  {
    d = false;
    Object localObject;
    int i;
    if (e)
    {
      localObject = jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader;
      if (paramBoolean)
      {
        i = 0;
        ((PullRefreshHeader)localObject).a(i);
        label30:
        jdField_a_of_type_AndroidOsHandler.sendEmptyMessageDelayed(1, 800L);
        if ((paramBoolean) && (paramGetListRsp != null)) {
          break label81;
        }
        QQToast.a(jdField_a_of_type_ComTencentMobileqqAppIphoneTitleBarActivity, "系统繁忙，请稍后重试！", 0).a();
      }
    }
    label81:
    label325:
    label327:
    do
    {
      return;
      i = 1;
      break;
      jdField_a_of_type_ComTencentMobileqqActivityQqcardRefreshFooter.a(0);
      break label30;
      jdField_a_of_type_Long = sequence;
      jdField_a_of_type_JavaUtilMap = map_folderid_nextindex;
      if ((map_folderid_nextindex == null) || (map_folderid_nextindex.isEmpty()))
      {
        jdField_a_of_type_ComTencentMobileqqActivityQqcardRefreshFooter.a(2);
        if (QLog.isColorLevel()) {
          QLog.d(jdField_a_of_type_JavaLangString, 2, "onGetNearbyCardList isSuccess=" + paramBoolean + ",isPullRefreshing=" + e + ",mFolderIndexMap=" + jdField_a_of_type_JavaUtilMap);
        }
        localObject = new ArrayList();
        paramGetListRsp = folder_list.iterator();
      }
      for (;;)
      {
        if (!paramGetListRsp.hasNext()) {
          break label327;
        }
        CouponMobileFolder localCouponMobileFolder = (CouponMobileFolder)paramGetListRsp.next();
        Iterator localIterator = coupon_list.iterator();
        for (;;)
        {
          if (!localIterator.hasNext()) {
            break label325;
          }
          CouponMobileItem localCouponMobileItem = (CouponMobileItem)localIterator.next();
          if (b == 1)
          {
            ((List)localObject).add(new QQCardItem(localCouponMobileItem, 1, folder_id));
            continue;
            jdField_a_of_type_ComTencentMobileqqActivityQqcardRefreshFooter.a(0);
            break;
          }
          if (b == 0) {
            ((List)localObject).add(new QQCardItem(localCouponMobileItem, 5, folder_id));
          }
        }
      }
    } while (((List)localObject).size() <= 0);
    if (e) {
      jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardAdapter.a((List)localObject);
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardAdapter.notifyDataSetChanged();
      return;
      jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardAdapter.b((List)localObject);
    }
  }
  
  public void a()
  {
    a(false);
  }
  
  public void a(int paramInt, View paramView, ListView paramListView)
  {
    if (d)
    {
      jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader.a();
      return;
    }
    jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader.a(0L);
  }
  
  public void a(AdapterView paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    paramAdapterView = (QQCardItem)jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardAdapter.getItem(paramInt);
    if (paramAdapterView != null)
    {
      paramView = new Intent(jdField_a_of_type_ComTencentMobileqqAppIphoneTitleBarActivity, QQBrowserActivity.class);
      paramView.putExtra("url", jumpUrl);
      jdField_a_of_type_ComTencentMobileqqAppIphoneTitleBarActivity.startActivity(paramView);
    }
  }
  
  public boolean a(int paramInt, View paramView, ListView paramListView)
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "onViewCompleteVisableAndReleased overScrollPosition=" + paramInt);
    }
    if (d)
    {
      paramListView.H();
      return true;
    }
    jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader.c(0L);
    a(true);
    return true;
  }
  
  public void b(int paramInt, View paramView, ListView paramListView)
  {
    if (!d) {
      jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader.b(0L);
    }
  }
  
  public void c(int paramInt, View paramView, ListView paramListView) {}
  
  public boolean handleMessage(Message paramMessage)
  {
    switch (what)
    {
    }
    for (;;)
    {
      return false;
      jdField_a_of_type_ComTencentWidgetXListView.H();
    }
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    super.onCreateView(paramLayoutInflater, paramViewGroup, paramBundle);
    if (jdField_a_of_type_ComTencentWidgetXListView != null)
    {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "onCreateView, reuse list view");
      }
      return jdField_a_of_type_ComTencentWidgetXListView;
    }
    jdField_a_of_type_AndroidOsHandler = new Handler(this);
    jdField_a_of_type_ComTencentMobileqqAppQQCardHandler = ((QQCardHandler)jdField_a_of_type_ComTencentMobileqqAppIphoneTitleBarActivity.app.a(69));
    jdField_a_of_type_ComTencentWidgetXListView = new XListView(jdField_a_of_type_ComTencentMobileqqAppIphoneTitleBarActivity);
    jdField_a_of_type_ComTencentWidgetXListView.setDivider(null);
    paramViewGroup = jdField_a_of_type_ComTencentWidgetXListView.getLayoutParams();
    if (paramViewGroup == null)
    {
      paramViewGroup = new ViewGroup.LayoutParams(-1, -1);
      jdField_a_of_type_ComTencentWidgetXListView.setPadding(0, QQCardConstant.v, 0, 0);
      jdField_a_of_type_ComTencentWidgetXListView.setLayoutParams(paramViewGroup);
      jdField_a_of_type_ComTencentWidgetXListView.setOverscrollHeader(getResources().getDrawable(2130838185));
      jdField_a_of_type_ComTencentWidgetXListView.setContentBackground(getResources().getDrawable(2130837739), false, true);
      jdField_a_of_type_ComTencentWidgetXListView.setNeedCheckSpringback(true);
      jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader = ((PullRefreshHeader)paramLayoutInflater.inflate(2130903467, jdField_a_of_type_ComTencentWidgetXListView, false));
      jdField_a_of_type_ComTencentWidgetXListView.setOverScrollHeader(jdField_a_of_type_ComTencentMobileqqWidgetPullRefreshHeader);
      jdField_a_of_type_ComTencentWidgetXListView.setOverScrollHeight(getResources().getDimensionPixelSize(2131492895));
      jdField_a_of_type_ComTencentWidgetXListView.setOverScrollListener(this);
      jdField_a_of_type_ComTencentMobileqqActivityQqcardRefreshFooter = new RefreshFooter(jdField_a_of_type_ComTencentMobileqqAppIphoneTitleBarActivity, this, null);
      paramLayoutInflater = new LinearLayout(jdField_a_of_type_ComTencentMobileqqAppIphoneTitleBarActivity);
      paramViewGroup = new LinearLayout.LayoutParams(-2, -2);
      gravity = 1;
      paramLayoutInflater.addView(jdField_a_of_type_ComTencentMobileqqActivityQqcardRefreshFooter.a, paramViewGroup);
      jdField_a_of_type_ComTencentWidgetXListView.b(paramLayoutInflater);
      jdField_a_of_type_ComTencentWidgetXListView.setOnScrollListener(jdField_a_of_type_ComTencentMobileqqActivityQqcardRefreshFooter);
      jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardAdapter = new QQCardAdapter(jdField_a_of_type_ComTencentMobileqqAppIphoneTitleBarActivity);
      jdField_a_of_type_ComTencentWidgetXListView.setAdapter(jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardAdapter);
      b = getArguments().getInt("tabID");
      if (b != 0) {
        break label412;
      }
      jdField_a_of_type_ComTencentWidgetXListView.setOnItemClickListener(this);
      jdField_a_of_type_ComTencentMobileqqAppQQCardObserver = new mcd(this);
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqAppIphoneTitleBarActivity.app.a(jdField_a_of_type_ComTencentMobileqqAppQQCardObserver);
      a(true);
      return jdField_a_of_type_ComTencentWidgetXListView;
      width = -1;
      height = -1;
      break;
      label412:
      if (b == 1) {
        jdField_a_of_type_ComTencentMobileqqAppQQCardObserver = new mce(this);
      }
    }
  }
  
  public void onDestroyView()
  {
    super.onDestroyView();
    jdField_a_of_type_ComTencentMobileqqAppIphoneTitleBarActivity.app.b(jdField_a_of_type_ComTencentMobileqqAppQQCardObserver);
  }
}
