package com.tencent.mobileqq.activity.recent;

import android.content.Context;
import android.content.res.Resources;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.ViewGroup.LayoutParams;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.AnimationSet;
import android.view.animation.RotateAnimation;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import mer;
import mes;

public class AnonymousEntranceView
  extends RelativeLayout
{
  private static final int jdField_a_of_type_Int = 300;
  private static final int jdField_b_of_type_Int = 1500;
  private static final int jdField_c_of_type_Int = 300;
  private static final int jdField_d_of_type_Int = 400;
  private static final int e = 400;
  private static final int f = 2300;
  private AnimationSet jdField_a_of_type_AndroidViewAnimationAnimationSet;
  private ImageView jdField_a_of_type_AndroidWidgetImageView;
  private AnimationSet jdField_b_of_type_AndroidViewAnimationAnimationSet;
  private ImageView jdField_b_of_type_AndroidWidgetImageView;
  private ImageView jdField_c_of_type_AndroidWidgetImageView;
  private ImageView jdField_d_of_type_AndroidWidgetImageView;
  
  public AnonymousEntranceView(Context paramContext)
  {
    super(paramContext);
    b();
  }
  
  public AnonymousEntranceView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    b();
  }
  
  public AnonymousEntranceView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    b();
  }
  
  public static int a()
  {
    return 2300;
  }
  
  public static int a(Context paramContext, float paramFloat)
  {
    return (int)(getResourcesgetDisplayMetricsdensity * paramFloat + 0.5F);
  }
  
  private void b()
  {
    jdField_a_of_type_AndroidViewAnimationAnimationSet = new AnimationSet(true);
    Object localObject = new AlphaAnimation(0.0F, 1.0F);
    ((Animation)localObject).setDuration(300L);
    jdField_a_of_type_AndroidViewAnimationAnimationSet.addAnimation((Animation)localObject);
    localObject = new RotateAnimation(-75.0F, 75.0F, 1, 0.5F, 1, 1.073F);
    ((Animation)localObject).setDuration(1500L);
    jdField_a_of_type_AndroidViewAnimationAnimationSet.addAnimation((Animation)localObject);
    localObject = new AlphaAnimation(1.0F, 0.0F);
    ((Animation)localObject).setDuration(300L);
    ((Animation)localObject).setStartOffset(1200L);
    jdField_a_of_type_AndroidViewAnimationAnimationSet.addAnimation((Animation)localObject);
    jdField_a_of_type_AndroidViewAnimationAnimationSet.setAnimationListener(new mer(this));
    jdField_b_of_type_AndroidViewAnimationAnimationSet = new AnimationSet(true);
    localObject = new AlphaAnimation(0.0F, 1.0F);
    ((Animation)localObject).setDuration(400L);
    jdField_b_of_type_AndroidViewAnimationAnimationSet.addAnimation((Animation)localObject);
    localObject = new AlphaAnimation(1.0F, 0.0F);
    ((Animation)localObject).setDuration(400L);
    ((Animation)localObject).setStartOffset(400L);
    jdField_b_of_type_AndroidViewAnimationAnimationSet.addAnimation((Animation)localObject);
    jdField_b_of_type_AndroidViewAnimationAnimationSet.setAnimationListener(new mes(this));
    jdField_a_of_type_AndroidWidgetImageView = new ImageView(getContext());
    localObject = new RelativeLayout.LayoutParams(-2, -2);
    ((RelativeLayout.LayoutParams)localObject).addRule(14, -1);
    ((RelativeLayout.LayoutParams)localObject).setMargins(0, a(getContext(), 30.0F), 0, 0);
    jdField_a_of_type_AndroidWidgetImageView.setLayoutParams((ViewGroup.LayoutParams)localObject);
    jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130838233);
    addView(jdField_a_of_type_AndroidWidgetImageView);
    jdField_b_of_type_AndroidWidgetImageView = new ImageView(getContext());
    localObject = new RelativeLayout.LayoutParams(-2, -2);
    ((RelativeLayout.LayoutParams)localObject).addRule(14, -1);
    jdField_b_of_type_AndroidWidgetImageView.setLayoutParams((ViewGroup.LayoutParams)localObject);
    jdField_b_of_type_AndroidWidgetImageView.setImageResource(2130838234);
    jdField_b_of_type_AndroidWidgetImageView.setVisibility(4);
    addView(jdField_b_of_type_AndroidWidgetImageView);
    localObject = new RelativeLayout.LayoutParams(-2, -2);
    ((RelativeLayout.LayoutParams)localObject).addRule(14, -1);
    ((RelativeLayout.LayoutParams)localObject).setMargins(0, a(getContext(), 59.0F), 0, 0);
    c = new ImageView(getContext());
    c.setImageResource(2130838238);
    c.setLayoutParams((ViewGroup.LayoutParams)localObject);
    c.setPadding(0, 0, a(getContext(), 10.0F), 0);
    addView(c);
    d = new ImageView(getContext());
    d.setLayoutParams((ViewGroup.LayoutParams)localObject);
    d.setImageResource(2130838242);
    d.setPadding(0, 0, a(getContext(), 10.0F), 0);
    d.setVisibility(4);
    addView(d);
  }
  
  public void a()
  {
    jdField_b_of_type_AndroidWidgetImageView.clearAnimation();
    d.clearAnimation();
    jdField_b_of_type_AndroidWidgetImageView.startAnimation(jdField_a_of_type_AndroidViewAnimationAnimationSet);
  }
}
