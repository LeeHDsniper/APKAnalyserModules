package com.tencent.mobileqq.activity.recent;

import android.graphics.drawable.Drawable;
import android.support.v4.view.ViewPager;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewStub;
import android.view.ViewStub.OnInflateListener;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.av.utils.BitmapTools;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.List;
import mhq;
import mhr;
import mhs;
import mhu;

public class RecommendCallHelper
  implements ViewStub.OnInflateListener
{
  public static final String a = "RecommendCallHelper";
  public ViewPager a;
  public View.OnClickListener a;
  public View a;
  ViewStub jdField_a_of_type_AndroidViewViewStub;
  Button jdField_a_of_type_AndroidWidgetButton;
  ImageView jdField_a_of_type_AndroidWidgetImageView;
  TextView jdField_a_of_type_AndroidWidgetTextView;
  public AnonymousEntranceView a;
  OnRecentUserOpsListener jdField_a_of_type_ComTencentMobileqqActivityRecentOnRecentUserOpsListener;
  RecommendAdapter jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendAdapter;
  QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  public boolean a;
  ImageView jdField_b_of_type_AndroidWidgetImageView;
  TextView jdField_b_of_type_AndroidWidgetTextView;
  public boolean b;
  ImageView jdField_c_of_type_AndroidWidgetImageView;
  boolean jdField_c_of_type_Boolean;
  ImageView jdField_d_of_type_AndroidWidgetImageView;
  boolean jdField_d_of_type_Boolean;
  ImageView jdField_e_of_type_AndroidWidgetImageView;
  boolean jdField_e_of_type_Boolean;
  
  public RecommendCallHelper(QQAppInterface paramQQAppInterface, View paramView, OnRecentUserOpsListener paramOnRecentUserOpsListener, View.OnClickListener paramOnClickListener)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
    jdField_b_of_type_Boolean = false;
    jdField_c_of_type_Boolean = false;
    jdField_d_of_type_Boolean = true;
    jdField_e_of_type_Boolean = false;
    jdField_a_of_type_AndroidViewViewStub = ((ViewStub)paramView.findViewById(2131301101));
    if (jdField_a_of_type_AndroidViewViewStub != null) {
      jdField_a_of_type_AndroidViewViewStub.setOnInflateListener(this);
    }
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_AndroidViewView$OnClickListener = paramOnClickListener;
    jdField_a_of_type_ComTencentMobileqqActivityRecentOnRecentUserOpsListener = paramOnRecentUserOpsListener;
  }
  
  private void a(boolean paramBoolean)
  {
    View localView = jdField_a_of_type_AndroidViewView.findViewById(2131301123);
    if (paramBoolean)
    {
      jdField_e_of_type_Boolean = false;
      localView.setBackgroundDrawable(null);
    }
    while (jdField_e_of_type_Boolean) {
      return;
    }
    jdField_e_of_type_Boolean = true;
    Drawable localDrawable = BitmapTools.b(BaseApplication.getContext(), 2130838256);
    if (localDrawable != null)
    {
      localView.setBackgroundDrawable(localDrawable);
      return;
    }
    localView.setBackgroundResource(2130838256);
  }
  
  private void b(int paramInt)
  {
    if (!jdField_c_of_type_Boolean) {}
    int i;
    do
    {
      do
      {
        return;
        jdField_c_of_type_Boolean = false;
      } while (jdField_a_of_type_ComTencentMobileqqActivityRecentAnonymousEntranceView == null);
      i = paramInt;
      if (paramInt < 0) {
        i = 0;
      }
    } while (jdField_b_of_type_Boolean);
    jdField_b_of_type_Boolean = true;
    jdField_a_of_type_ComTencentMobileqqActivityRecentAnonymousEntranceView.postDelayed(new mhu(this), i);
  }
  
  private void b(boolean paramBoolean)
  {
    if (paramBoolean) {}
    try
    {
      if (jdField_a_of_type_AndroidWidgetImageView != null)
      {
        localAnimation = AnimationUtils.loadAnimation(jdField_a_of_type_AndroidViewView.getContext(), 2130968607);
        jdField_a_of_type_AndroidWidgetImageView.startAnimation(localAnimation);
        jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
      }
      if (jdField_b_of_type_AndroidWidgetImageView != null)
      {
        localAnimation = AnimationUtils.loadAnimation(jdField_a_of_type_AndroidViewView.getContext(), 2130968608);
        jdField_b_of_type_AndroidWidgetImageView.startAnimation(localAnimation);
        jdField_b_of_type_AndroidWidgetImageView.setVisibility(0);
      }
      if (jdField_c_of_type_AndroidWidgetImageView != null)
      {
        localAnimation = AnimationUtils.loadAnimation(jdField_a_of_type_AndroidViewView.getContext(), 2130968609);
        jdField_c_of_type_AndroidWidgetImageView.startAnimation(localAnimation);
        jdField_c_of_type_AndroidWidgetImageView.setVisibility(0);
      }
      if (jdField_d_of_type_AndroidWidgetImageView != null)
      {
        localAnimation = AnimationUtils.loadAnimation(jdField_a_of_type_AndroidViewView.getContext(), 2130968605);
        jdField_d_of_type_AndroidWidgetImageView.startAnimation(localAnimation);
        jdField_d_of_type_AndroidWidgetImageView.setVisibility(0);
      }
      if (jdField_e_of_type_AndroidWidgetImageView == null) {
        return;
      }
      Animation localAnimation = AnimationUtils.loadAnimation(jdField_a_of_type_AndroidViewView.getContext(), 2130968606);
      jdField_e_of_type_AndroidWidgetImageView.startAnimation(localAnimation);
      jdField_e_of_type_AndroidWidgetImageView.setVisibility(0);
      return;
    }
    catch (Exception localException)
    {
      if (!QLog.isColorLevel()) {
        return;
      }
      QLog.i("RecommendCallHelper", 2, "playStarAnimation", localException);
    }
    if (jdField_a_of_type_AndroidWidgetImageView != null)
    {
      jdField_a_of_type_AndroidWidgetImageView.clearAnimation();
      jdField_a_of_type_AndroidWidgetImageView.setVisibility(8);
    }
    if (jdField_b_of_type_AndroidWidgetImageView != null)
    {
      jdField_b_of_type_AndroidWidgetImageView.clearAnimation();
      jdField_b_of_type_AndroidWidgetImageView.setVisibility(8);
    }
    if (jdField_c_of_type_AndroidWidgetImageView != null)
    {
      jdField_c_of_type_AndroidWidgetImageView.clearAnimation();
      jdField_c_of_type_AndroidWidgetImageView.setVisibility(8);
    }
    if (jdField_d_of_type_AndroidWidgetImageView != null)
    {
      jdField_d_of_type_AndroidWidgetImageView.clearAnimation();
      jdField_d_of_type_AndroidWidgetImageView.setVisibility(8);
    }
    if (jdField_e_of_type_AndroidWidgetImageView != null)
    {
      jdField_e_of_type_AndroidWidgetImageView.clearAnimation();
      jdField_e_of_type_AndroidWidgetImageView.setVisibility(8);
      return;
    }
  }
  
  private void e()
  {
    if (jdField_a_of_type_AndroidSupportV4ViewViewPager != null)
    {
      if (jdField_a_of_type_AndroidSupportV4ViewViewPager.getVisibility() != 0) {
        b(0);
      }
    }
    else {
      return;
    }
    if (!jdField_a_of_type_Boolean)
    {
      jdField_a_of_type_Boolean = true;
      jdField_a_of_type_AndroidSupportV4ViewViewPager.postDelayed(new mhs(this), 100L);
      return;
    }
    jdField_a_of_type_Boolean = false;
  }
  
  public List a()
  {
    if ((jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendAdapter != null) && (jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendAdapter.a() != null)) {
      return jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendAdapter.a();
    }
    return null;
  }
  
  public void a()
  {
    b(true);
    e();
  }
  
  public void a(int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d("RecommendCallHelper", 2, "setVisibility visibility: " + paramInt);
    }
    if (jdField_a_of_type_AndroidViewViewStub != null) {
      jdField_a_of_type_AndroidViewViewStub.setVisibility(paramInt);
    }
    if (jdField_a_of_type_AndroidViewView != null)
    {
      if (paramInt != 0) {
        break label285;
      }
      a(false);
      jdField_a_of_type_AndroidViewView.setVisibility(0);
      jdField_c_of_type_Boolean = true;
      if ((jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendAdapter == null) || (jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendAdapter.a() <= 0)) {
        break label190;
      }
      b(true);
      e();
      if (jdField_a_of_type_AndroidWidgetTextView != null) {
        jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
      }
      if (jdField_a_of_type_AndroidSupportV4ViewViewPager != null) {
        jdField_a_of_type_AndroidSupportV4ViewViewPager.setCurrentItem(0, false);
      }
      if ((jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendAdapter == null) || (jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendAdapter.a() <= 0)) {
        break label253;
      }
      b(true);
      e();
      if (!jdField_d_of_type_Boolean) {
        ReportController.b(null, "CliOper", "", "", "0X8004C11", "0X8004C11", 0, 0, "", "", "", "");
      }
    }
    label190:
    label253:
    while (jdField_d_of_type_Boolean)
    {
      return;
      if (jdField_a_of_type_AndroidSupportV4ViewViewPager != null) {
        jdField_a_of_type_AndroidSupportV4ViewViewPager.setVisibility(8);
      }
      if (jdField_a_of_type_AndroidWidgetTextView != null) {
        jdField_a_of_type_AndroidWidgetTextView.setVisibility(4);
      }
      if (jdField_b_of_type_AndroidWidgetTextView != null)
      {
        jdField_b_of_type_AndroidWidgetTextView.setText(2131368590);
        jdField_b_of_type_AndroidWidgetTextView.setVisibility(0);
      }
      b(false);
      break;
    }
    ReportController.b(null, "CliOper", "", "", "0X8004C10", "0X8004C10", 0, 0, "", "", "", "");
    return;
    label285:
    jdField_a_of_type_AndroidViewView.setVisibility(8);
    a(true);
    b(false);
  }
  
  public void a(QQAppInterface paramQQAppInterface)
  {
    if (QLog.isColorLevel()) {
      QLog.d("RecommendCallHelper", 2, "onAccountChanged");
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendAdapter != null) {
      jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendAdapter.a(paramQQAppInterface);
    }
    jdField_d_of_type_Boolean = true;
  }
  
  public void a(String paramString)
  {
    if (QLog.isColorLevel()) {
      QLog.d("RecommendCallHelper", 2, "updateItem uin: " + paramString);
    }
    int i;
    if ((jdField_a_of_type_AndroidSupportV4ViewViewPager != null) && (jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendAdapter != null)) {
      i = 0;
    }
    for (;;)
    {
      if (i < jdField_a_of_type_AndroidSupportV4ViewViewPager.getChildCount())
      {
        View localView = jdField_a_of_type_AndroidSupportV4ViewViewPager.getChildAt(i);
        if (!jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendAdapter.a(localView, paramString)) {}
      }
      else
      {
        return;
      }
      i += 1;
    }
  }
  
  public void a(boolean paramBoolean, List paramList)
  {
    if (QLog.isColorLevel()) {
      QLog.i("RecommendCallHelper", 2, "refreshRecommendFriendList isSuccess: " + paramBoolean);
    }
    if (!paramBoolean) {
      if ((jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendAdapter == null) || (jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendAdapter.a() == 0))
      {
        if (jdField_a_of_type_AndroidSupportV4ViewViewPager != null) {
          jdField_a_of_type_AndroidSupportV4ViewViewPager.setVisibility(8);
        }
        if (jdField_a_of_type_AndroidWidgetTextView != null) {
          jdField_a_of_type_AndroidWidgetTextView.setVisibility(4);
        }
        if (jdField_b_of_type_AndroidWidgetTextView != null)
        {
          jdField_b_of_type_AndroidWidgetTextView.setText(2131368589);
          jdField_b_of_type_AndroidWidgetTextView.setVisibility(0);
        }
        b(false);
        b(0);
        if (jdField_d_of_type_Boolean)
        {
          jdField_d_of_type_Boolean = false;
          ReportController.b(null, "CliOper", "", "", "0X8004C10", "0X8004C10", 0, 0, "", "", "", "");
        }
      }
    }
    label374:
    do
    {
      for (;;)
      {
        return;
        if ((paramList != null) && (paramList.size() > 0))
        {
          if (jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendAdapter != null) {
            jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendAdapter.a(paramList);
          }
          if (jdField_d_of_type_Boolean)
          {
            jdField_d_of_type_Boolean = false;
            ReportController.b(null, "CliOper", "", "", "0X8004C11", "0X8004C11", 0, 0, "", "", "", "");
          }
          if (jdField_b_of_type_AndroidWidgetTextView != null) {
            jdField_b_of_type_AndroidWidgetTextView.setVisibility(8);
          }
        }
        while (jdField_a_of_type_AndroidViewView != null)
        {
          a(false);
          jdField_a_of_type_AndroidViewView.setVisibility(0);
          if ((paramList == null) || (paramList.size() <= 0)) {
            break label374;
          }
          if (jdField_a_of_type_AndroidSupportV4ViewViewPager != null)
          {
            jdField_a_of_type_AndroidSupportV4ViewViewPager.setCurrentItem(0, false);
            jdField_a_of_type_AndroidSupportV4ViewViewPager.setVisibility(0);
          }
          if (jdField_a_of_type_AndroidWidgetTextView != null) {
            jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
          }
          b(true);
          e();
          return;
          if (((jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendAdapter == null) || (jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendAdapter.a() == 0)) && (jdField_d_of_type_Boolean))
          {
            jdField_d_of_type_Boolean = false;
            ReportController.b(null, "CliOper", "", "", "0X8004C10", "0X8004C10", 0, 0, "", "", "", "");
          }
        }
      }
    } while ((jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendAdapter != null) && (jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendAdapter.a() != 0));
    if (jdField_a_of_type_AndroidSupportV4ViewViewPager != null) {
      jdField_a_of_type_AndroidSupportV4ViewViewPager.setVisibility(8);
    }
    if (jdField_a_of_type_AndroidWidgetTextView != null) {
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(4);
    }
    if (jdField_b_of_type_AndroidWidgetTextView != null)
    {
      jdField_b_of_type_AndroidWidgetTextView.setText(2131368589);
      jdField_b_of_type_AndroidWidgetTextView.setVisibility(0);
    }
    b(false);
    b(0);
  }
  
  public boolean a()
  {
    return (jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendAdapter == null) || (jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendAdapter.a() <= 0);
  }
  
  public void b()
  {
    b(false);
  }
  
  public void c()
  {
    if (jdField_a_of_type_AndroidSupportV4ViewViewPager != null) {
      jdField_a_of_type_AndroidSupportV4ViewViewPager.setAdapter(null);
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendAdapter != null) {
      jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendAdapter.a();
    }
    jdField_a_of_type_AndroidViewViewStub = null;
    jdField_a_of_type_AndroidViewView = null;
    jdField_a_of_type_AndroidSupportV4ViewViewPager = null;
    jdField_a_of_type_AndroidWidgetImageView = null;
    jdField_b_of_type_AndroidWidgetImageView = null;
    jdField_c_of_type_AndroidWidgetImageView = null;
    jdField_d_of_type_AndroidWidgetImageView = null;
    jdField_e_of_type_AndroidWidgetImageView = null;
    jdField_a_of_type_AndroidWidgetTextView = null;
    jdField_b_of_type_AndroidWidgetTextView = null;
    jdField_a_of_type_AndroidWidgetButton = null;
    jdField_a_of_type_ComTencentMobileqqActivityRecentAnonymousEntranceView = null;
    jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendAdapter = null;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = null;
    jdField_a_of_type_AndroidViewView$OnClickListener = null;
    jdField_a_of_type_ComTencentMobileqqActivityRecentOnRecentUserOpsListener = null;
  }
  
  public void d()
  {
    if (QLog.isColorLevel()) {
      QLog.d("RecommendCallHelper", 2, "updateOnlineStatus");
    }
    if ((jdField_a_of_type_AndroidSupportV4ViewViewPager != null) && (jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendAdapter != null))
    {
      int i = 0;
      while (i < jdField_a_of_type_AndroidSupportV4ViewViewPager.getChildCount())
      {
        View localView = jdField_a_of_type_AndroidSupportV4ViewViewPager.getChildAt(i);
        jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendAdapter.a(localView);
        i += 1;
      }
    }
  }
  
  public void onInflate(ViewStub paramViewStub, View paramView)
  {
    if (QLog.isColorLevel()) {
      QLog.d("RecommendCallHelper", 2, "onInflate");
    }
    if (paramView != null)
    {
      jdField_a_of_type_AndroidViewView = paramView.findViewById(2131301122);
      jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendAdapter = new RecommendAdapter(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
      jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendAdapter.a(jdField_a_of_type_ComTencentMobileqqActivityRecentOnRecentUserOpsListener);
      jdField_a_of_type_AndroidSupportV4ViewViewPager = ((ViewPager)jdField_a_of_type_AndroidViewView.findViewById(2131298062));
      jdField_a_of_type_AndroidSupportV4ViewViewPager.setAdapter(jdField_a_of_type_ComTencentMobileqqActivityRecentRecommendAdapter);
      jdField_a_of_type_AndroidWidgetImageView = ((ImageView)jdField_a_of_type_AndroidViewView.findViewById(2131301124));
      jdField_b_of_type_AndroidWidgetImageView = ((ImageView)jdField_a_of_type_AndroidViewView.findViewById(2131301125));
      jdField_c_of_type_AndroidWidgetImageView = ((ImageView)jdField_a_of_type_AndroidViewView.findViewById(2131301126));
      jdField_d_of_type_AndroidWidgetImageView = ((ImageView)jdField_a_of_type_AndroidViewView.findViewById(2131301127));
      jdField_e_of_type_AndroidWidgetImageView = ((ImageView)jdField_a_of_type_AndroidViewView.findViewById(2131301128));
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)jdField_a_of_type_AndroidViewView.findViewById(2131301129));
      jdField_b_of_type_AndroidWidgetTextView = ((TextView)jdField_a_of_type_AndroidViewView.findViewById(2131301130));
      jdField_a_of_type_AndroidWidgetButton = ((Button)jdField_a_of_type_AndroidViewView.findViewById(2131298638));
      jdField_a_of_type_AndroidWidgetButton.setContentDescription("返回通话记录界面");
      jdField_a_of_type_AndroidWidgetButton.setOnClickListener(new mhq(this));
      jdField_a_of_type_ComTencentMobileqqActivityRecentAnonymousEntranceView = ((AnonymousEntranceView)jdField_a_of_type_AndroidViewView.findViewById(2131301131));
      jdField_a_of_type_ComTencentMobileqqActivityRecentAnonymousEntranceView.setOnClickListener(new mhr(this));
      a(true);
    }
  }
}
