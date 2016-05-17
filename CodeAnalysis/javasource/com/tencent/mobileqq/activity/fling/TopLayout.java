package com.tencent.mobileqq.activity.fling;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.drawable.ColorDrawable;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class TopLayout
  extends RelativeLayout
  implements TopContentLayout.OnOutScreenListener
{
  private static final String jdField_a_of_type_JavaLangString = TopLayout.class.getSimpleName();
  private TopBehindLayout jdField_a_of_type_ComTencentMobileqqActivityFlingTopBehindLayout;
  private TopContentLayout jdField_a_of_type_ComTencentMobileqqActivityFlingTopContentLayout;
  private TopLayout.OnDraggingListener jdField_a_of_type_ComTencentMobileqqActivityFlingTopLayout$OnDraggingListener;
  private boolean jdField_a_of_type_Boolean;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public TopLayout(Context paramContext)
  {
    super(paramContext);
    a(paramContext);
  }
  
  public TopLayout(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public TopLayout(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    a(paramContext);
  }
  
  private void a(Context paramContext)
  {
    RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-1, -1);
    jdField_a_of_type_ComTencentMobileqqActivityFlingTopBehindLayout = new TopBehindLayout(paramContext);
    addView(jdField_a_of_type_ComTencentMobileqqActivityFlingTopBehindLayout, localLayoutParams);
    localLayoutParams = new RelativeLayout.LayoutParams(-1, -1);
    jdField_a_of_type_ComTencentMobileqqActivityFlingTopContentLayout = new TopContentLayout(paramContext);
    jdField_a_of_type_ComTencentMobileqqActivityFlingTopContentLayout.setOnOutScreenListener(this);
    addView(jdField_a_of_type_ComTencentMobileqqActivityFlingTopContentLayout, localLayoutParams);
  }
  
  private void a(View paramView, float paramFloat)
  {
    int i = getWidth();
    int j = getHeight();
    RelativeLayout.LayoutParams localLayoutParams = (RelativeLayout.LayoutParams)paramView.getLayoutParams();
    width = ((int)(i * paramFloat));
    height = ((int)(j * paramFloat));
    leftMargin = ((i - width) / 2);
    topMargin = ((j - height) / 2);
    paramView.setLayoutParams(localLayoutParams);
  }
  
  public TopLayout.OnDraggingListener getOnDraggingListener()
  {
    return jdField_a_of_type_ComTencentMobileqqActivityFlingTopLayout$OnDraggingListener;
  }
  
  public void onConfigChanged(Configuration paramConfiguration) {}
  
  public void outing(int paramInt1, int paramInt2, View paramView)
  {
    paramInt2 = getContextgetResourcesgetDisplayMetricswidthPixels;
    paramView = jdField_a_of_type_ComTencentMobileqqActivityFlingTopBehindLayout;
    if (paramView != null)
    {
      float f1 = Math.abs(paramInt1 / paramInt2);
      float f2 = 0.95F + (1.0F - 0.95F) * f1;
      if (f2 < 1.0F) {
        paramView.setForeground(new ColorDrawable((int)((1.0F - f1) * 128.0F) << 24));
      }
      a(paramView, f2);
    }
    if (Math.abs(paramInt1) >= paramInt2) {
      if (jdField_a_of_type_ComTencentMobileqqActivityFlingTopLayout$OnDraggingListener != null) {
        jdField_a_of_type_ComTencentMobileqqActivityFlingTopLayout$OnDraggingListener.endDrag();
      }
    }
    while ((paramInt1 != 0) || (jdField_a_of_type_ComTencentMobileqqActivityFlingTopLayout$OnDraggingListener == null)) {
      return;
    }
    jdField_a_of_type_ComTencentMobileqqActivityFlingTopLayout$OnDraggingListener.cancelDrag();
  }
  
  public void setBehind(View paramView)
  {
    jdField_a_of_type_ComTencentMobileqqActivityFlingTopBehindLayout.setContent(paramView);
  }
  
  public void setContent(ContentWrapView paramContentWrapView)
  {
    jdField_a_of_type_ComTencentMobileqqActivityFlingTopContentLayout.setContent(paramContentWrapView);
  }
  
  public void setOnDraggingListener(TopLayout.OnDraggingListener paramOnDraggingListener)
  {
    jdField_a_of_type_ComTencentMobileqqActivityFlingTopLayout$OnDraggingListener = paramOnDraggingListener;
  }
  
  public void startDrag()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityFlingTopLayout$OnDraggingListener != null) {
      jdField_a_of_type_ComTencentMobileqqActivityFlingTopLayout$OnDraggingListener.startDrag();
    }
  }
}
