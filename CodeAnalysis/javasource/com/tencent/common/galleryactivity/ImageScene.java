package com.tencent.common.galleryactivity;

import android.content.Intent;
import android.content.res.Configuration;
import android.os.Handler;
import android.view.KeyEvent;
import android.view.ViewGroup;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public abstract class ImageScene
{
  private Handler jdField_a_of_type_AndroidOsHandler;
  ViewGroup jdField_a_of_type_AndroidViewViewGroup;
  public GalleryManager a;
  
  public ImageScene()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidOsHandler = new Handler();
  }
  
  public ViewGroup a()
  {
    return jdField_a_of_type_AndroidViewViewGroup;
  }
  
  public void a(int paramInt1, int paramInt2, Intent paramIntent) {}
  
  public void a(Configuration paramConfiguration) {}
  
  public abstract void a(ViewGroup paramViewGroup);
  
  void a(GalleryManager paramGalleryManager)
  {
    jdField_a_of_type_ComTencentCommonGalleryactivityGalleryManager = paramGalleryManager;
  }
  
  public void a(Runnable paramRunnable)
  {
    jdField_a_of_type_AndroidOsHandler.post(paramRunnable);
  }
  
  public void a(Runnable paramRunnable, long paramLong)
  {
    jdField_a_of_type_AndroidOsHandler.postDelayed(paramRunnable, paramLong);
  }
  
  public void a(boolean paramBoolean1, boolean paramBoolean2) {}
  
  public boolean a(int paramInt, KeyEvent paramKeyEvent)
  {
    return false;
  }
  
  public void b(ViewGroup paramViewGroup)
  {
    jdField_a_of_type_AndroidViewViewGroup = paramViewGroup;
  }
  
  public void b(boolean paramBoolean1, boolean paramBoolean2) {}
  
  public abstract boolean d();
  
  public boolean e()
  {
    return false;
  }
  
  public void f() {}
  
  public void g() {}
  
  public void j() {}
  
  public void k() {}
  
  public void n()
  {
    if (jdField_a_of_type_ComTencentCommonGalleryactivityGalleryManager != null) {
      jdField_a_of_type_ComTencentCommonGalleryactivityGalleryManager.a();
    }
  }
}
