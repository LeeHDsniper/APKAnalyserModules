package com.tencent.mobileqq.activity.aio.photo;

import android.content.BroadcastReceiver;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.view.KeyEvent;
import android.view.MotionEvent;
import com.tencent.av.smallscreen.SmallScreenUtils;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.common.galleryactivity.GalleryManager;
import com.tencent.image.AbstractGifImage;
import com.tencent.image.ApngImage;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.richmedia.dc.DCAIOPreview;
import com.tencent.mobileqq.richmedia.dc.DCAIOPreviewProgressive;
import com.tencent.mobileqq.shortvideo.ShortVideoUtils;
import com.tencent.qphone.base.util.QLog;
import lcs;
import lcx;

public class AIOGalleryActivity
  extends PeakActivity
{
  public static final String a;
  int jdField_a_of_type_Int;
  BroadcastReceiver jdField_a_of_type_AndroidContentBroadcastReceiver = null;
  GalleryManager jdField_a_of_type_ComTencentCommonGalleryactivityGalleryManager = new lcs(this);
  public IAIOImageProvider a;
  DCAIOPreview jdField_a_of_type_ComTencentMobileqqRichmediaDcDCAIOPreview;
  DCAIOPreviewProgressive jdField_a_of_type_ComTencentMobileqqRichmediaDcDCAIOPreviewProgressive;
  boolean jdField_a_of_type_Boolean = false;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = AIOGalleryActivity.class.getSimpleName();
  }
  
  public AIOGalleryActivity() {}
  
  public DCAIOPreview a()
  {
    if (jdField_a_of_type_ComTencentMobileqqRichmediaDcDCAIOPreview == null) {
      jdField_a_of_type_ComTencentMobileqqRichmediaDcDCAIOPreview = new DCAIOPreview(this);
    }
    return jdField_a_of_type_ComTencentMobileqqRichmediaDcDCAIOPreview;
  }
  
  public DCAIOPreviewProgressive a()
  {
    if (jdField_a_of_type_ComTencentMobileqqRichmediaDcDCAIOPreviewProgressive == null) {
      jdField_a_of_type_ComTencentMobileqqRichmediaDcDCAIOPreviewProgressive = new DCAIOPreviewProgressive(this);
    }
    return jdField_a_of_type_ComTencentMobileqqRichmediaDcDCAIOPreviewProgressive;
  }
  
  protected boolean a()
  {
    return false;
  }
  
  public boolean dispatchTouchEvent(MotionEvent paramMotionEvent)
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "dispatchTouchEvent action: " + paramMotionEvent.getAction());
    }
    return super.dispatchTouchEvent(paramMotionEvent);
  }
  
  public void finish()
  {
    super.finish();
    overridePendingTransition(0, 0);
  }
  
  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    jdField_a_of_type_ComTencentCommonGalleryactivityGalleryManager.a(paramInt1, paramInt2, paramIntent);
  }
  
  public void onBackPressed()
  {
    if (!jdField_a_of_type_ComTencentCommonGalleryactivityGalleryManager.b()) {
      super.onBackPressed();
    }
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    super.onConfigurationChanged(paramConfiguration);
    jdField_a_of_type_ComTencentCommonGalleryactivityGalleryManager.a(paramConfiguration);
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    H = false;
    super.onCreate(paramBundle);
    AIOConstants.a = getResourcesgetDisplayMetricsdensity;
    ShortVideoUtils.a(jdField_a_of_type_ComTencentMobileqqAppPeakAppInterface);
    jdField_a_of_type_ComTencentMobileqqRichmediaDcDCAIOPreview = new DCAIOPreview(this);
    jdField_a_of_type_ComTencentMobileqqRichmediaDcDCAIOPreviewProgressive = new DCAIOPreviewProgressive(this);
    try
    {
      jdField_a_of_type_ComTencentCommonGalleryactivityGalleryManager.a(this);
      return;
    }
    catch (Exception paramBundle)
    {
      if (QLog.isColorLevel()) {
        QLog.e(jdField_a_of_type_JavaLangString, 2, "", paramBundle);
      }
      finish();
    }
  }
  
  protected void onDestroy()
  {
    super.onDestroy();
    if (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider != null) {}
    try
    {
      jdField_a_of_type_ComTencentMobileqqActivityAioPhotoIAIOImageProvider.a();
      jdField_a_of_type_ComTencentCommonGalleryactivityGalleryManager.c(this);
      if (jdField_a_of_type_ComTencentMobileqqRichmediaDcDCAIOPreview != null)
      {
        jdField_a_of_type_ComTencentMobileqqRichmediaDcDCAIOPreview.b(jdField_a_of_type_Int);
        jdField_a_of_type_ComTencentMobileqqRichmediaDcDCAIOPreview.a();
      }
      if (jdField_a_of_type_ComTencentMobileqqRichmediaDcDCAIOPreviewProgressive != null) {
        jdField_a_of_type_ComTencentMobileqqRichmediaDcDCAIOPreviewProgressive.a();
      }
      return;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
  
  public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    if (!jdField_a_of_type_ComTencentCommonGalleryactivityGalleryManager.a(paramInt, paramKeyEvent)) {
      return super.onKeyDown(paramInt, paramKeyEvent);
    }
    return true;
  }
  
  protected void onPause()
  {
    SmallScreenUtils.a(BaseApplicationImpl.getContext(), false);
    AbstractGifImage.pauseAll();
    ApngImage.pauseAll();
    super.onPause();
    if ((Build.MODEL.equals("Coolpad 5930")) && (jdField_a_of_type_AndroidContentBroadcastReceiver != null)) {}
    try
    {
      unregisterReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver);
      return;
    }
    catch (Exception localException)
    {
      while (!QLog.isColorLevel()) {}
      QLog.e(jdField_a_of_type_JavaLangString, 2, localException.getMessage());
    }
  }
  
  protected void onResume()
  {
    super.onResume();
    SmallScreenUtils.a(BaseApplicationImpl.getContext(), true);
    com.tencent.image.AbstractGifImage.DoAccumulativeRunnable.DELAY = 0;
    AbstractGifImage.resumeAll();
    ApngImage.resumeAll();
    if (Build.MODEL.equals("Coolpad 5930"))
    {
      jdField_a_of_type_AndroidContentBroadcastReceiver = new lcx(this);
      IntentFilter localIntentFilter = new IntentFilter();
      localIntentFilter.addAction("android.intent.action.SCREEN_OFF");
      localIntentFilter.addAction("android.intent.action.SCREEN_ON");
      localIntentFilter.addAction("android.intent.action.USER_PRESENT");
      registerReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver, localIntentFilter);
    }
  }
  
  public void onWindowFocusChanged(boolean paramBoolean)
  {
    super.onWindowFocusChanged(paramBoolean);
    if (paramBoolean) {
      jdField_a_of_type_ComTencentCommonGalleryactivityGalleryManager.b(this);
    }
  }
}
