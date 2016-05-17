package com.tencent.common.galleryactivity;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.AlphaAnimation;
import android.view.animation.AnimationSet;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.ScaleAnimation;
import android.widget.RelativeLayout;
import com.tencent.mobileqq.activity.aio.photo.AIOGalleryActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.ViscousFluidInterpolator;
import com.tencent.widget.AdapterView;
import com.tencent.widget.AdapterView.OnItemClickListener;
import com.tencent.widget.AdapterView.OnItemLongClickListener;
import com.tencent.widget.AdapterView.OnItemSelectedListener;
import com.tencent.widget.Gallery;
import com.tencent.widget.Gallery.OnItemRotateListener;
import com.tencent.widget.Gallery.OnScollListener;
import com.tencent.widget.immersive.ImmersiveUtils;
import com.tencent.widget.immersive.SystemBarCompact;
import hcy;
import hcz;
import hda;

public abstract class AbstractGalleryScene
  extends ImageScene
  implements AnimationLister, AdapterView.OnItemClickListener, AdapterView.OnItemLongClickListener, AdapterView.OnItemSelectedListener, Gallery.OnItemRotateListener, Gallery.OnScollListener
{
  private static final String jdField_a_of_type_JavaLangString = "AbstractGalleryScene";
  public Activity a;
  protected RelativeLayout a;
  public AbstractGalleryPageView a;
  protected AbstractImageAdapter a;
  protected AbstractImageListModel a;
  public AbstractProgressView a;
  AnimationLister jdField_a_of_type_ComTencentCommonGalleryactivityAnimationLister;
  public Gallery a;
  protected int b;
  View b;
  boolean f;
  
  public AbstractGalleryScene(Activity paramActivity, AbstractImageListModel paramAbstractImageListModel)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentCommonGalleryactivityAnimationLister = new hcy(this);
    f = false;
    jdField_a_of_type_AndroidAppActivity = paramActivity;
    jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListModel = paramAbstractImageListModel;
  }
  
  protected RelativeLayout a()
  {
    return (RelativeLayout)LayoutInflater.from(jdField_a_of_type_AndroidAppActivity).inflate(2130904221, null);
  }
  
  public AbstractGalleryPageView a(Context paramContext)
  {
    return new GalleryPageView();
  }
  
  protected abstract AbstractImageAdapter a(Context paramContext);
  
  protected AbstractProgressView a()
  {
    return new GalleryProgressView();
  }
  
  public abstract void a();
  
  public void a(int paramInt)
  {
    if ((jdField_a_of_type_ComTencentCommonGalleryactivityAbstractProgressView != null) && (!jdField_a_of_type_ComTencentCommonGalleryactivityAbstractProgressView.a())) {
      jdField_a_of_type_ComTencentCommonGalleryactivityAbstractProgressView.a();
    }
    if (QLog.isColorLevel()) {
      QLog.d("AbstractGalleryScene", 2, "onScrollEnd:" + paramInt);
    }
  }
  
  public void a(View paramView, int paramInt1, int paramInt2) {}
  
  public void a(ViewGroup paramViewGroup)
  {
    a();
    jdField_a_of_type_AndroidWidgetRelativeLayout = a();
    if (paramViewGroup == null) {
      jdField_a_of_type_AndroidAppActivity.addContentView(jdField_a_of_type_AndroidWidgetRelativeLayout, new ViewGroup.LayoutParams(-1, -1));
    }
    for (;;)
    {
      b((ViewGroup)jdField_a_of_type_AndroidWidgetRelativeLayout.findViewById(2131296923));
      jdField_a_of_type_ComTencentWidgetGallery = ((Gallery)jdField_a_of_type_AndroidAppActivity.findViewById(2131298267));
      jdField_b_of_type_AndroidViewView = jdField_a_of_type_AndroidAppActivity.findViewById(2131296709);
      jdField_a_of_type_ComTencentCommonGalleryactivityAbstractGalleryPageView = a(jdField_a_of_type_AndroidAppActivity);
      if (jdField_a_of_type_ComTencentCommonGalleryactivityAbstractGalleryPageView != null) {
        jdField_a_of_type_ComTencentCommonGalleryactivityAbstractGalleryPageView.a(jdField_a_of_type_AndroidAppActivity, this, jdField_b_of_type_Int);
      }
      jdField_a_of_type_ComTencentCommonGalleryactivityAbstractProgressView = a();
      if (jdField_a_of_type_ComTencentCommonGalleryactivityAbstractProgressView != null) {
        jdField_a_of_type_ComTencentCommonGalleryactivityAbstractProgressView.a(jdField_a_of_type_AndroidAppActivity, this);
      }
      jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageAdapter = a(jdField_a_of_type_AndroidAppActivity);
      jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageAdapter.a(jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListModel);
      if (jdField_a_of_type_ComTencentCommonGalleryactivityAbstractProgressView != null)
      {
        jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageAdapter.a(jdField_a_of_type_ComTencentCommonGalleryactivityAbstractProgressView);
        jdField_a_of_type_ComTencentCommonGalleryactivityAbstractProgressView.a();
      }
      jdField_a_of_type_ComTencentWidgetGallery.setAdapter(jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageAdapter);
      jdField_a_of_type_ComTencentWidgetGallery.setRotateEnable(true);
      jdField_a_of_type_ComTencentWidgetGallery.setSpacing(jdField_a_of_type_AndroidAppActivity.getResources().getDimensionPixelSize(2131492970));
      jdField_a_of_type_ComTencentWidgetGallery.setSelection(jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListModel.b());
      jdField_a_of_type_ComTencentWidgetGallery.setOnItemSelectedListener(this);
      jdField_a_of_type_ComTencentWidgetGallery.setOnItemClickListener(this);
      jdField_a_of_type_ComTencentWidgetGallery.setOnItemLongClickListener(this);
      jdField_a_of_type_ComTencentWidgetGallery.setOnItemRotateListener(this);
      jdField_a_of_type_ComTencentWidgetGallery.setOnScollListener(this);
      jdField_a_of_type_AndroidWidgetRelativeLayout.setVisibility(4);
      return;
      paramViewGroup.addView(jdField_a_of_type_AndroidWidgetRelativeLayout, new ViewGroup.LayoutParams(-1, -1));
    }
  }
  
  public void a(AdapterView paramAdapterView) {}
  
  public void a(AdapterView paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AbstractGalleryScene", 2, "onItemClick");
    }
    e();
  }
  
  public void a(boolean paramBoolean1, boolean paramBoolean2)
  {
    super.a(paramBoolean1, paramBoolean2);
    if (jdField_b_of_type_AndroidViewView.getAnimation() != null) {
      jdField_b_of_type_AndroidViewView.clearAnimation();
    }
    if (jdField_a_of_type_ComTencentWidgetGallery.getAnimation() != null) {
      jdField_a_of_type_ComTencentWidgetGallery.clearAnimation();
    }
    AlphaAnimation localAlphaAnimation = new AlphaAnimation(0.0F, 1.0F);
    localAlphaAnimation.setInterpolator(new AccelerateInterpolator());
    localAlphaAnimation.setDuration(jdField_a_of_type_ComTencentCommonGalleryactivityGalleryManager.a().a());
    localAlphaAnimation.setFillAfter(true);
    if (paramBoolean2)
    {
      jdField_b_of_type_AndroidViewView.startAnimation(localAlphaAnimation);
      return;
    }
    localAlphaAnimation.setAnimationListener(new hcz(this));
    a().startAnimation(localAlphaAnimation);
  }
  
  public boolean a()
  {
    return true;
  }
  
  public boolean a(AdapterView paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    return true;
  }
  
  public void b() {}
  
  public void b(int paramInt)
  {
    if (jdField_a_of_type_ComTencentCommonGalleryactivityAbstractProgressView.a()) {
      jdField_a_of_type_ComTencentCommonGalleryactivityAbstractProgressView.b();
    }
    if (jdField_a_of_type_ComTencentCommonGalleryactivityAbstractProgressView.b()) {
      jdField_a_of_type_ComTencentCommonGalleryactivityAbstractProgressView.c();
    }
    if (QLog.isColorLevel()) {
      QLog.d("AbstractGalleryScene", 2, "onScrollStart:" + paramInt);
    }
  }
  
  public void b(AdapterView paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    if (paramView == null) {}
    do
    {
      return;
      if ((jdField_a_of_type_ComTencentCommonGalleryactivityAbstractGalleryPageView != null) && (a())) {
        jdField_a_of_type_ComTencentCommonGalleryactivityAbstractGalleryPageView.a(paramAdapterView, paramInt);
      }
      jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListModel.a(paramInt);
      if ((!d()) && (jdField_a_of_type_ComTencentCommonGalleryactivityAbstractProgressView != null) && (!jdField_a_of_type_ComTencentCommonGalleryactivityAbstractProgressView.a())) {
        jdField_a_of_type_ComTencentCommonGalleryactivityAbstractProgressView.a();
      }
      jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageAdapter.a(paramView, paramInt);
    } while (!QLog.isColorLevel());
    QLog.i("AbstractGalleryScene", 2, "AbstractGalleryScene.onItemSelected(): position=" + paramInt);
  }
  
  public void b(boolean paramBoolean)
  {
    if (b())
    {
      a(paramBoolean, jdField_a_of_type_ComTencentCommonGalleryactivityGalleryManager.a().b());
      return;
    }
    if (jdField_a_of_type_ComTencentWidgetGallery != null) {
      jdField_a_of_type_ComTencentWidgetGallery.setBackgroundColor(-16777216);
    }
    jdField_a_of_type_ComTencentCommonGalleryactivityAnimationLister.b();
  }
  
  public void b(boolean paramBoolean1, boolean paramBoolean2)
  {
    super.b(paramBoolean1, paramBoolean2);
    if (jdField_b_of_type_AndroidViewView.getAnimation() != null) {
      jdField_b_of_type_AndroidViewView.clearAnimation();
    }
    if (a().getAnimation() != null) {
      a().clearAnimation();
    }
    if (paramBoolean2)
    {
      localAlphaAnimation = new AlphaAnimation(1.0F, 0.0F);
      localAlphaAnimation.setFillAfter(true);
      jdField_b_of_type_AndroidViewView.startAnimation(localAlphaAnimation);
      localAlphaAnimation.setDuration(jdField_a_of_type_ComTencentCommonGalleryactivityGalleryManager.a().a());
      return;
    }
    AlphaAnimation localAlphaAnimation = new AlphaAnimation(1.0F, 0.0F);
    localAlphaAnimation.setInterpolator(new ViscousFluidInterpolator());
    localAlphaAnimation.setDuration(jdField_a_of_type_ComTencentCommonGalleryactivityGalleryManager.a().a());
    ScaleAnimation localScaleAnimation = new ScaleAnimation(1.0F, 0.5F, 1.0F, 0.5F, jdField_a_of_type_AndroidViewViewGroup.getWidth() / 2, jdField_a_of_type_AndroidViewViewGroup.getHeight() / 2);
    localScaleAnimation.setInterpolator(new DecelerateInterpolator());
    localScaleAnimation.setDuration(jdField_a_of_type_ComTencentCommonGalleryactivityGalleryManager.a().a());
    AnimationSet localAnimationSet = new AnimationSet(true);
    localAnimationSet.setFillAfter(true);
    localAnimationSet.addAnimation(localAlphaAnimation);
    localAnimationSet.addAnimation(localScaleAnimation);
    localAnimationSet.setAnimationListener(new hda(this));
    jdField_b_of_type_AndroidViewView.startAnimation(localAlphaAnimation);
    jdField_a_of_type_ComTencentWidgetGallery.startAnimation(localAnimationSet);
  }
  
  protected boolean b()
  {
    return true;
  }
  
  public void c() {}
  
  protected boolean c()
  {
    return true;
  }
  
  public void d() {}
  
  public boolean d()
  {
    return jdField_a_of_type_ComTencentCommonGalleryactivityGalleryManager.a().a();
  }
  
  public void e() {}
  
  public boolean e()
  {
    i();
    if (f) {
      jdField_a_of_type_ComTencentCommonGalleryactivityGalleryManager.a();
    }
    for (;;)
    {
      return true;
      if (c()) {
        b(false, jdField_a_of_type_ComTencentCommonGalleryactivityGalleryManager.a().c());
      } else {
        jdField_a_of_type_ComTencentCommonGalleryactivityAnimationLister.e();
      }
    }
  }
  
  public void h()
  {
    jdField_a_of_type_ComTencentCommonGalleryactivityGalleryManager.a().a(jdField_a_of_type_ComTencentCommonGalleryactivityAnimationLister);
  }
  
  public void i()
  {
    jdField_a_of_type_ComTencentCommonGalleryactivityGalleryManager.a().a(jdField_a_of_type_ComTencentCommonGalleryactivityAnimationLister);
  }
  
  public void j()
  {
    if ((jdField_a_of_type_AndroidAppActivity instanceof AIOGalleryActivity))
    {
      if (QLog.isColorLevel()) {
        QLog.d("ImmerseTest", 2, "gallery setColor black");
      }
      if ((ImmersiveUtils.isSupporImmersive() == 1) && (jdField_a_of_type_AndroidWidgetRelativeLayout != null)) {
        jdField_a_of_type_AndroidWidgetRelativeLayout.setSystemUiVisibility(4);
      }
      if (jdField_a_of_type_AndroidAppActivity).a != null)
      {
        jdField_a_of_type_AndroidAppActivity).a.a(-16777216);
        jdField_a_of_type_AndroidAppActivity).a.b(-16777216);
      }
    }
    jdField_a_of_type_AndroidWidgetRelativeLayout.setVisibility(0);
    if (QLog.isColorLevel()) {
      QLog.d("GalleryComponent", 2, "gallery onstart");
    }
  }
  
  public void k()
  {
    jdField_a_of_type_AndroidWidgetRelativeLayout.setVisibility(4);
    if (QLog.isColorLevel()) {
      QLog.d("GalleryComponent", 2, "gallery onstop");
    }
  }
  
  public void l()
  {
    jdField_a_of_type_ComTencentCommonGalleryactivityGalleryManager.a().a(jdField_a_of_type_ComTencentCommonGalleryactivityAnimationLister);
  }
  
  public void m()
  {
    jdField_a_of_type_ComTencentCommonGalleryactivityGalleryManager.a().a(jdField_a_of_type_ComTencentCommonGalleryactivityAnimationLister);
    f = true;
  }
}
