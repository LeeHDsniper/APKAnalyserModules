package com.tencent.common.galleryactivity;

import android.app.Activity;
import android.content.res.Resources;
import android.graphics.Color;
import android.util.TypedValue;
import android.view.animation.AlphaAnimation;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.AdapterView;
import hdh;
import hdi;
import hdj;

public class GalleryPageView
  extends AbstractGalleryPageView
{
  public int a;
  AlphaAnimation jdField_a_of_type_AndroidViewAnimationAlphaAnimation;
  public TextView a;
  public AbstractGalleryScene a;
  Runnable jdField_a_of_type_JavaLangRunnable;
  private boolean jdField_a_of_type_Boolean;
  public AlphaAnimation b;
  
  public GalleryPageView()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = true;
    jdField_a_of_type_Int = 3;
    jdField_a_of_type_JavaLangRunnable = new hdj(this);
    jdField_a_of_type_AndroidViewAnimationAlphaAnimation = new AlphaAnimation(0.0F, 1.0F);
    b = new AlphaAnimation(1.0F, 0.0F);
  }
  
  public void a(int paramInt)
  {
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(paramInt);
  }
  
  public void a(Activity paramActivity, AbstractGalleryScene paramAbstractGalleryScene, int paramInt)
  {
    RelativeLayout localRelativeLayout = (RelativeLayout)paramAbstractGalleryScene.a();
    jdField_a_of_type_AndroidWidgetTextView = new TextView(paramActivity);
    RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
    localLayoutParams.addRule(12, -1);
    localLayoutParams.addRule(14, -1);
    bottomMargin = ((int)TypedValue.applyDimension(1, jdField_a_of_type_Int, paramActivity.getResources().getDisplayMetrics()) + paramInt);
    jdField_a_of_type_AndroidWidgetTextView.setTextColor(Color.parseColor("#e6e9e9e9"));
    jdField_a_of_type_AndroidWidgetTextView.setTextSize(2, 15.0F);
    jdField_a_of_type_AndroidWidgetTextView.setId(2131296405);
    localRelativeLayout.addView(jdField_a_of_type_AndroidWidgetTextView, localLayoutParams);
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(4);
    jdField_a_of_type_AndroidViewAnimationAlphaAnimation.setDuration(300L);
    b.setDuration(300L);
    jdField_a_of_type_ComTencentCommonGalleryactivityAbstractGalleryScene = paramAbstractGalleryScene;
    jdField_a_of_type_AndroidViewAnimationAlphaAnimation.setAnimationListener(new hdh(this));
    b.setAnimationListener(new hdi(this));
  }
  
  public void a(AdapterView paramAdapterView, int paramInt)
  {
    if (paramAdapterView.c_() > 1)
    {
      jdField_a_of_type_AndroidWidgetTextView.setText(paramInt + 1 + "/" + paramAdapterView.c_());
      if (jdField_a_of_type_AndroidWidgetTextView.getVisibility() == 4)
      {
        jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
        jdField_a_of_type_AndroidWidgetTextView.startAnimation(jdField_a_of_type_AndroidViewAnimationAlphaAnimation);
        if (jdField_a_of_type_Boolean)
        {
          jdField_a_of_type_AndroidWidgetTextView.postDelayed(jdField_a_of_type_JavaLangRunnable, 3000L);
          jdField_a_of_type_Boolean = false;
          return;
        }
        jdField_a_of_type_AndroidWidgetTextView.postDelayed(jdField_a_of_type_JavaLangRunnable, 2000L);
        return;
      }
      jdField_a_of_type_AndroidWidgetTextView.removeCallbacks(jdField_a_of_type_JavaLangRunnable);
      jdField_a_of_type_AndroidWidgetTextView.clearAnimation();
      jdField_a_of_type_AndroidWidgetTextView.postDelayed(jdField_a_of_type_JavaLangRunnable, 2000L);
      return;
    }
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(4);
  }
}
