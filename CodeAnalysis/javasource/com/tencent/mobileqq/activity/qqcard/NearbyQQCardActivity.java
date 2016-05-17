package com.tencent.mobileqq.activity.qqcard;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.util.SparseArray;
import com.tencent.mobileqq.app.IphoneTitleBarActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.fragment.BaseFragment;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.widget.TabBarView;
import com.tencent.mobileqq.widget.TabBarView.OnTabChangeListener;
import com.tencent.qphone.base.util.QLog;

public class NearbyQQCardActivity
  extends IphoneTitleBarActivity
  implements TabBarView.OnTabChangeListener
{
  public static final int a = 0;
  public static final String a = "NearbyQQCardActivity";
  public static final int b = 1;
  private FragmentManager jdField_a_of_type_AndroidSupportV4AppFragmentManager;
  SparseArray jdField_a_of_type_AndroidUtilSparseArray;
  private BaseFragment jdField_a_of_type_ComTencentMobileqqFragmentBaseFragment;
  private TabBarView jdField_a_of_type_ComTencentMobileqqWidgetTabBarView;
  
  public NearbyQQCardActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt1, int paramInt2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("NearbyQQCardActivity", 2, "onTabSelected, " + paramInt1 + ", " + paramInt2);
    }
    Object localObject2 = (BaseFragment)jdField_a_of_type_AndroidUtilSparseArray.get(paramInt2);
    Object localObject1 = localObject2;
    if (localObject2 == null) {
      switch (paramInt2)
      {
      default: 
        localObject1 = localObject2;
      }
    }
    while (localObject1 == null)
    {
      return;
      localObject1 = NearByQQCardFragment.a(1);
      jdField_a_of_type_AndroidUtilSparseArray.put(1, localObject1);
      continue;
      localObject1 = NearByQQCardFragment.a(0);
      jdField_a_of_type_AndroidUtilSparseArray.put(0, localObject1);
    }
    localObject2 = jdField_a_of_type_AndroidSupportV4AppFragmentManager.beginTransaction();
    if (jdField_a_of_type_ComTencentMobileqqFragmentBaseFragment != null)
    {
      if (jdField_a_of_type_ComTencentMobileqqFragmentBaseFragment == localObject1)
      {
        jdField_a_of_type_ComTencentMobileqqFragmentBaseFragment.b();
        return;
      }
      ((FragmentTransaction)localObject2).hide(jdField_a_of_type_ComTencentMobileqqFragmentBaseFragment);
    }
    if (!((BaseFragment)localObject1).isAdded()) {
      ((FragmentTransaction)localObject2).add(2131302589, (Fragment)localObject1);
    }
    for (;;)
    {
      ((FragmentTransaction)localObject2).commitAllowingStateLoss();
      jdField_a_of_type_ComTencentMobileqqFragmentBaseFragment = ((BaseFragment)localObject1);
      ReportController.b(null, "P_CliOper", "Vip_pay_mywallet", app.getAccount(), "wallet", "nearticket.tabselect." + paramInt2, 1, 0, "", "", "", "");
      return;
      ((FragmentTransaction)localObject2).show((Fragment)localObject1);
    }
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    super.doOnCreate(paramBundle);
    setContentView(2130904412);
    jdField_a_of_type_AndroidSupportV4AppFragmentManager = getSupportFragmentManager();
    jdField_a_of_type_AndroidUtilSparseArray = new SparseArray();
    setTitle(getString(2131366369));
    jdField_a_of_type_ComTencentMobileqqWidgetTabBarView = ((TabBarView)findViewById(2131302588));
    jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.a(getString(2131366371));
    jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.a(getString(2131366370));
    jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.setOnTabChangeListener(this);
    jdField_a_of_type_ComTencentMobileqqWidgetTabBarView.setSelectedTab(0, false);
    ReportController.b(null, "P_CliOper", "Vip_pay_mywallet", app.getAccount(), "wallet", "cardmenu.nearticket.show", 1, 0, "", "", "", "");
    return true;
  }
  
  protected void doOnSaveInstanceState(Bundle paramBundle) {}
}
