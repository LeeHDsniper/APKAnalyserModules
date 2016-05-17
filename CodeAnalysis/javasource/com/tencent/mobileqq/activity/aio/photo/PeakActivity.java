package com.tencent.mobileqq.activity.aio.photo;

import android.content.res.Resources;
import android.os.Bundle;
import android.os.Handler;
import com.tencent.image.AbstractGifImage;
import com.tencent.image.NativeVideoImage;
import com.tencent.mobileqq.app.BaseActivity2;
import com.tencent.mobileqq.app.PeakAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.HashSet;

public class PeakActivity
  extends BaseActivity2
{
  public static final HashSet a;
  public PeakAppInterface a;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilHashSet = new HashSet();
  }
  
  public PeakActivity() {}
  
  public int a()
  {
    int i = 0;
    int j = getResources().getIdentifier("status_bar_height", "dimen", "android");
    if (j > 0) {
      i = getResources().getDimensionPixelSize(j);
    }
    return i;
  }
  
  public void onCreate(Bundle paramBundle)
  {
    if (AIOGalleryUtils.a != null) {
      AIOGalleryUtils.a.removeMessages(1);
    }
    String str = getClass().getName() + "@" + hashCode();
    jdField_a_of_type_JavaUtilHashSet.add(str);
    super.onCreate(paramBundle);
    if ((getAppRuntime() instanceof PeakAppInterface)) {
      jdField_a_of_type_ComTencentMobileqqAppPeakAppInterface = ((PeakAppInterface)getAppRuntime());
    }
    setVolumeControlStream(3);
  }
  
  public void onDestroy()
  {
    super.onDestroy();
    String str = getClass().getName() + "@" + hashCode();
    jdField_a_of_type_JavaUtilHashSet.remove(str);
    if ((jdField_a_of_type_JavaUtilHashSet.size() == 0) && (AIOGalleryUtils.a != null)) {
      AIOGalleryUtils.a.removeMessages(1);
    }
  }
  
  public void onPause()
  {
    super.onPause();
    NativeVideoImage.pauseAll();
    AbstractGifImage.pauseAll();
  }
  
  public void onResume()
  {
    super.onResume();
    NativeVideoImage.resumeAll();
    AbstractGifImage.resumeAll();
  }
}
