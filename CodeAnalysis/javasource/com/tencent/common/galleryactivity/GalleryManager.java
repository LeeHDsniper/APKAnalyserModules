package com.tencent.common.galleryactivity;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Configuration;
import android.view.KeyEvent;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.RelativeLayout;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.immersive.ImmersiveUtils;
import hdf;
import hdg;

public abstract class GalleryManager
{
  private Activity jdField_a_of_type_AndroidAppActivity;
  ViewGroup jdField_a_of_type_AndroidViewViewGroup;
  public AbstractAnimationManager a;
  public AbstractGalleryScene a;
  protected AbstractImageListModel a;
  public AbstractImageListScene a;
  private ImageScene jdField_a_of_type_ComTencentCommonGalleryactivityImageScene;
  private boolean jdField_a_of_type_Boolean;
  ViewGroup b;
  
  public GalleryManager()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private void a(boolean paramBoolean)
  {
    jdField_a_of_type_ComTencentCommonGalleryactivityAbstractGalleryScene.j();
    if (QLog.isColorLevel()) {
      QLog.d("GalleryComponent", 2, "startGalleryScene jumpFromImageList:" + paramBoolean);
    }
    GalleryImage localGalleryImage = jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListModel.a();
    if (paramBoolean)
    {
      jdField_a_of_type_ComTencentCommonGalleryactivityAbstractGalleryScene.m();
      jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListScene.a();
      a = jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListScene.a();
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentCommonGalleryactivityAbstractGalleryScene.b(paramBoolean);
      return;
      jdField_a_of_type_ComTencentCommonGalleryactivityAbstractGalleryScene.h();
    }
  }
  
  private void b()
  {
    jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListModel.a().a = jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListScene.a();
    jdField_a_of_type_ComTencentCommonGalleryactivityAbstractGalleryScene.l();
    if (QLog.isColorLevel()) {
      QLog.d("GalleryComponent", 2, "startImageListScene");
    }
    jdField_a_of_type_ComTencentCommonGalleryactivityAbstractGalleryScene.b(true, jdField_a_of_type_ComTencentCommonGalleryactivityAbstractAnimationManager.c());
  }
  
  public RelativeLayout a()
  {
    RelativeLayout localRelativeLayout = new RelativeLayout(jdField_a_of_type_AndroidAppActivity);
    jdField_a_of_type_AndroidAppActivity.addContentView(localRelativeLayout, new ViewGroup.LayoutParams(-1, -1));
    return localRelativeLayout;
  }
  
  public AbstractAnimationManager a()
  {
    return jdField_a_of_type_ComTencentCommonGalleryactivityAbstractAnimationManager;
  }
  
  public AbstractAnimationManager a(Activity paramActivity, AbstractImageListModel paramAbstractImageListModel)
  {
    return new AnimationManager(paramActivity, paramAbstractImageListModel);
  }
  
  public abstract AbstractGalleryScene a(Activity paramActivity, AbstractImageListModel paramAbstractImageListModel);
  
  public abstract AbstractImageListModel a(Activity paramActivity);
  
  public abstract AbstractImageListScene a(Activity paramActivity, AbstractImageListModel paramAbstractImageListModel);
  
  public AnimationView a()
  {
    AnimationView localAnimationView = new AnimationView(jdField_a_of_type_AndroidAppActivity, null);
    localAnimationView.setId(2131298268);
    localAnimationView.setVisibility(4);
    return localAnimationView;
  }
  
  public ImageScene a()
  {
    return jdField_a_of_type_ComTencentCommonGalleryactivityImageScene;
  }
  
  public void a()
  {
    if (!a()) {}
    label121:
    do
    {
      do
      {
        do
        {
          return;
        } while (a().a());
        if (jdField_a_of_type_ComTencentCommonGalleryactivityImageScene != jdField_a_of_type_ComTencentCommonGalleryactivityAbstractGalleryScene) {
          break label121;
        }
        if (jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListScene != null) {
          break;
        }
        jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListScene = a(jdField_a_of_type_AndroidAppActivity, jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListModel);
      } while (jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListScene == null);
      jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListScene.a(this);
      jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListScene.a(jdField_a_of_type_AndroidViewViewGroup);
      jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListScene.a(this);
      jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListScene.j();
      jdField_a_of_type_ComTencentCommonGalleryactivityAbstractGalleryScene.a().post(new hdf(this));
      jdField_a_of_type_ComTencentCommonGalleryactivityImageScene = jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListScene;
      return;
    } while (jdField_a_of_type_ComTencentCommonGalleryactivityImageScene != jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListScene);
    jdField_a_of_type_ComTencentCommonGalleryactivityAbstractGalleryScene.a().post(new hdg(this));
  }
  
  public void a(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if (jdField_a_of_type_ComTencentCommonGalleryactivityImageScene != null) {
      jdField_a_of_type_ComTencentCommonGalleryactivityImageScene.a(paramInt1, paramInt2, paramIntent);
    }
  }
  
  public void a(Activity paramActivity)
  {
    jdField_a_of_type_AndroidAppActivity = paramActivity;
    jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListModel = a(paramActivity);
    jdField_a_of_type_ComTencentCommonGalleryactivityAbstractAnimationManager = a(paramActivity, jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListModel);
    if (jdField_a_of_type_ComTencentCommonGalleryactivityAbstractGalleryScene == null)
    {
      jdField_a_of_type_ComTencentCommonGalleryactivityAbstractGalleryScene = a(paramActivity, jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListModel);
      jdField_a_of_type_ComTencentCommonGalleryactivityAbstractGalleryScene.a(this);
    }
    if (a()) {
      jdField_a_of_type_AndroidViewViewGroup = a();
    }
    jdField_a_of_type_ComTencentCommonGalleryactivityAbstractGalleryScene.a(jdField_a_of_type_AndroidViewViewGroup);
    if (jdField_a_of_type_AndroidViewViewGroup == null) {
      jdField_a_of_type_AndroidViewViewGroup = jdField_a_of_type_ComTencentCommonGalleryactivityAbstractGalleryScene.a();
    }
    if (jdField_a_of_type_AndroidViewViewGroup != null) {
      jdField_a_of_type_AndroidViewViewGroup.addView(a());
    }
    jdField_a_of_type_ComTencentCommonGalleryactivityImageScene = jdField_a_of_type_ComTencentCommonGalleryactivityAbstractGalleryScene;
    if ((ImmersiveUtils.isSupporImmersive() == 1) && (jdField_a_of_type_AndroidViewViewGroup != null)) {
      jdField_a_of_type_AndroidViewViewGroup.setSystemUiVisibility(4);
    }
  }
  
  public void a(Configuration paramConfiguration)
  {
    if (jdField_a_of_type_ComTencentCommonGalleryactivityImageScene != null) {
      jdField_a_of_type_ComTencentCommonGalleryactivityImageScene.a(paramConfiguration);
    }
  }
  
  public void a(AbstractAnimationManager paramAbstractAnimationManager)
  {
    jdField_a_of_type_ComTencentCommonGalleryactivityAbstractAnimationManager = paramAbstractAnimationManager;
  }
  
  public boolean a()
  {
    return false;
  }
  
  public boolean a(int paramInt, KeyEvent paramKeyEvent)
  {
    if (jdField_a_of_type_ComTencentCommonGalleryactivityImageScene != null) {
      return jdField_a_of_type_ComTencentCommonGalleryactivityImageScene.a(paramInt, paramKeyEvent);
    }
    return false;
  }
  
  public void b(Activity paramActivity)
  {
    if ((!jdField_a_of_type_Boolean) && (jdField_a_of_type_ComTencentCommonGalleryactivityImageScene == jdField_a_of_type_ComTencentCommonGalleryactivityAbstractGalleryScene)) {
      a(false);
    }
    jdField_a_of_type_Boolean = true;
  }
  
  public boolean b()
  {
    if (jdField_a_of_type_ComTencentCommonGalleryactivityImageScene != null)
    {
      if (QLog.isColorLevel()) {
        QLog.d("GalleryManager", 2, "onBackEvent, isAnimating: " + jdField_a_of_type_ComTencentCommonGalleryactivityAbstractAnimationManager.a());
      }
      if ((!a().a()) && (!jdField_a_of_type_ComTencentCommonGalleryactivityImageScene.e())) {}
      return true;
    }
    return false;
  }
  
  public void c(Activity paramActivity)
  {
    if (jdField_a_of_type_ComTencentCommonGalleryactivityAbstractGalleryScene != null) {
      jdField_a_of_type_ComTencentCommonGalleryactivityAbstractGalleryScene.f();
    }
    if (jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListScene != null) {
      jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListScene.f();
    }
  }
}
