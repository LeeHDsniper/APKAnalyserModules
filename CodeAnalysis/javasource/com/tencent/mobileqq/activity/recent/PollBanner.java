package com.tencent.mobileqq.activity.recent;

import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.AnimationUtils;
import android.widget.FrameLayout.LayoutParams;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.WeakReferenceHandler;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import mga;

public class PollBanner
  implements Animation.AnimationListener
{
  private static final int jdField_a_of_type_Int = 1;
  public static final String a = "PollBanner";
  private static final int jdField_b_of_type_Int = 3000;
  private Handler.Callback jdField_a_of_type_AndroidOsHandler$Callback;
  public Handler a;
  private Animation jdField_a_of_type_AndroidViewAnimationAnimation;
  private BannerFrameLayout jdField_a_of_type_ComTencentMobileqqActivityRecentBannerFrameLayout;
  private BaseActivity jdField_a_of_type_ComTencentMobileqqAppBaseActivity;
  private List jdField_a_of_type_JavaUtilList;
  private Animation jdField_b_of_type_AndroidViewAnimationAnimation;
  private int c;
  
  public PollBanner(BaseActivity paramBaseActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidOsHandler$Callback = new mga(this);
    jdField_a_of_type_AndroidOsHandler = new WeakReferenceHandler(Looper.getMainLooper(), jdField_a_of_type_AndroidOsHandler$Callback);
    jdField_a_of_type_JavaUtilList = new ArrayList();
    c = 0;
    jdField_a_of_type_ComTencentMobileqqAppBaseActivity = paramBaseActivity;
    jdField_a_of_type_ComTencentMobileqqActivityRecentBannerFrameLayout = new BannerFrameLayout(paramBaseActivity);
    a();
  }
  
  public View a()
  {
    return jdField_a_of_type_ComTencentMobileqqActivityRecentBannerFrameLayout;
  }
  
  public void a()
  {
    jdField_a_of_type_AndroidViewAnimationAnimation = AnimationUtils.loadAnimation(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, 2130968744);
    jdField_a_of_type_AndroidViewAnimationAnimation.setFillAfter(true);
    jdField_a_of_type_AndroidViewAnimationAnimation.setAnimationListener(this);
    b = AnimationUtils.loadAnimation(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, 2130968745);
    b.setFillAfter(false);
  }
  
  public void a(Banner paramBanner, boolean paramBoolean)
  {
    if ((paramBanner == null) || (jdField_a_of_type_AndroidViewView == null)) {}
    do
    {
      return;
      if (QLog.isColorLevel()) {
        QLog.d("PollBanner", 2, "addBanner " + paramBanner.toString() + ", isShow = " + paramBoolean);
      }
    } while (jdField_a_of_type_JavaUtilList.contains(paramBanner));
    Object localObject = new FrameLayout.LayoutParams(-1, -2);
    jdField_a_of_type_AndroidViewView.setLayoutParams((ViewGroup.LayoutParams)localObject);
    jdField_a_of_type_JavaUtilList.add(paramBanner);
    localObject = jdField_a_of_type_AndroidViewView;
    if (paramBoolean) {}
    for (int i = 0;; i = 8)
    {
      ((View)localObject).setVisibility(i);
      jdField_a_of_type_ComTencentMobileqqActivityRecentBannerFrameLayout.addView(jdField_a_of_type_AndroidViewView);
      if (paramBoolean) {
        c = jdField_a_of_type_JavaUtilList.indexOf(paramBanner);
      }
      if ((jdField_a_of_type_JavaUtilList.size() < 2) || (jdField_a_of_type_AndroidOsHandler.hasMessages(1))) {
        break;
      }
      jdField_a_of_type_AndroidOsHandler.sendEmptyMessageDelayed(1, 3000L);
      return;
    }
  }
  
  public void a(boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.d("PollBanner", 2, "stopAnim isRemove = " + paramBoolean);
    }
    jdField_a_of_type_AndroidOsHandler.removeMessages(1);
    int i = 0;
    while (i < jdField_a_of_type_ComTencentMobileqqActivityRecentBannerFrameLayout.getChildCount())
    {
      View localView = jdField_a_of_type_ComTencentMobileqqActivityRecentBannerFrameLayout.getChildAt(i);
      if (localView != null) {
        localView.clearAnimation();
      }
      i += 1;
    }
    jdField_a_of_type_ComTencentMobileqqActivityRecentBannerFrameLayout.setAnimEnd(true);
    if (paramBoolean) {
      c = 0;
    }
  }
  
  public boolean a()
  {
    return jdField_a_of_type_JavaUtilList.isEmpty();
  }
  
  public void b()
  {
    if (QLog.isColorLevel()) {
      QLog.d("PollBanner", 2, "removeAll");
    }
    a(true);
    jdField_a_of_type_JavaUtilList.clear();
    jdField_a_of_type_ComTencentMobileqqActivityRecentBannerFrameLayout.removeAllViews();
  }
  
  public boolean b()
  {
    Iterator localIterator = jdField_a_of_type_JavaUtilList.iterator();
    while (localIterator.hasNext()) {
      if (nextjdField_a_of_type_Boolean) {
        return true;
      }
    }
    return false;
  }
  
  public void c()
  {
    int i = jdField_a_of_type_JavaUtilList.size();
    if (QLog.isColorLevel()) {
      QLog.d("PollBanner", 2, "startAnim mBannerList = " + jdField_a_of_type_JavaUtilList + ", size = " + i);
    }
    if (i <= 1) {
      return;
    }
    Banner localBanner1 = (Banner)jdField_a_of_type_JavaUtilList.get(c % i);
    Banner localBanner2 = (Banner)jdField_a_of_type_JavaUtilList.get((c + 1) % i);
    if (jdField_a_of_type_ComTencentMobileqqActivityRecentBannerFrameLayout.indexOfChild(jdField_a_of_type_AndroidViewView) == -1)
    {
      jdField_a_of_type_ComTencentMobileqqActivityRecentBannerFrameLayout.addView(jdField_a_of_type_AndroidViewView);
      jdField_a_of_type_AndroidViewView.setVisibility(0);
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityRecentBannerFrameLayout.indexOfChild(jdField_a_of_type_AndroidViewView) == -1)
    {
      jdField_a_of_type_ComTencentMobileqqActivityRecentBannerFrameLayout.addView(jdField_a_of_type_AndroidViewView);
      jdField_a_of_type_AndroidViewView.setVisibility(8);
    }
    jdField_a_of_type_AndroidViewView.startAnimation(b);
    jdField_a_of_type_AndroidViewView.startAnimation(jdField_a_of_type_AndroidViewAnimationAnimation);
    int j = c + 1;
    c = j;
    c = (j % i);
  }
  
  public void onAnimationEnd(Animation paramAnimation)
  {
    if (QLog.isColorLevel()) {
      QLog.d("PollBanner", 2, "onAnimationEnd");
    }
    jdField_a_of_type_ComTencentMobileqqActivityRecentBannerFrameLayout.setAnimEnd(true);
    int i = jdField_a_of_type_JavaUtilList.size();
    if (i > 2)
    {
      paramAnimation = jdField_a_of_type_JavaUtilList.get((c + 1) % i)).jdField_a_of_type_AndroidViewView;
      if (c == 0)
      {
        jdField_a_of_type_ComTencentMobileqqActivityRecentBannerFrameLayout.removeViewAt(i - 1);
        jdField_a_of_type_ComTencentMobileqqActivityRecentBannerFrameLayout.addView(paramAnimation);
        paramAnimation.setVisibility(8);
        jdField_a_of_type_JavaUtilList.get(c)).jdField_a_of_type_AndroidViewView.setVisibility(0);
      }
    }
    for (;;)
    {
      jdField_a_of_type_AndroidOsHandler.sendEmptyMessageDelayed(1, 3000L);
      return;
      jdField_a_of_type_ComTencentMobileqqActivityRecentBannerFrameLayout.removeViewAt(c - 1);
      break;
      paramAnimation = jdField_a_of_type_JavaUtilList.get((c + 1) % i)).jdField_a_of_type_AndroidViewView;
      jdField_a_of_type_JavaUtilList.get(c)).jdField_a_of_type_AndroidViewView.setVisibility(0);
      paramAnimation.setVisibility(8);
    }
  }
  
  public void onAnimationRepeat(Animation paramAnimation) {}
  
  public void onAnimationStart(Animation paramAnimation)
  {
    if (QLog.isColorLevel()) {
      QLog.d("PollBanner", 2, "onAnimationStart");
    }
    jdField_a_of_type_ComTencentMobileqqActivityRecentBannerFrameLayout.setAnimEnd(false);
  }
}
