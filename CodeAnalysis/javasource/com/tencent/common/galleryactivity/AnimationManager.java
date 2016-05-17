package com.tencent.common.galleryactivity;

import android.app.Activity;
import android.content.res.Resources;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.DisplayMetrics;
import android.view.View;
import android.widget.RelativeLayout;
import com.tencent.image.GifDrawable;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.util.VersionUtils;
import com.tencent.widget.Gallery;
import java.util.ArrayList;
import java.util.Iterator;

public class AnimationManager
  extends AbstractAnimationManager
{
  public static final String a = "KEY_THUMBNAL_BOUND";
  int jdField_a_of_type_Int;
  Activity jdField_a_of_type_AndroidAppActivity;
  View jdField_a_of_type_AndroidViewView;
  AbstractImageListModel jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListModel;
  AnimationView jdField_a_of_type_ComTencentCommonGalleryactivityAnimationView;
  View b;
  View c;
  
  public AnimationManager(Activity paramActivity, AbstractImageListModel paramAbstractImageListModel)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidAppActivity = paramActivity;
    jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListModel = paramAbstractImageListModel;
    jdField_a_of_type_Int = getResourcesgetDisplayMetricsdensityDpi;
  }
  
  private Drawable a(Rect paramRect1, Rect paramRect2, Rect paramRect3, Rect paramRect4, GalleryImage paramGalleryImage, boolean paramBoolean)
  {
    if (paramGalleryImage == null) {
      return null;
    }
    Drawable localDrawable = paramGalleryImage.c();
    paramRect1 = paramGalleryImage.b();
    if ((paramRect1 == null) || (localDrawable == null) || (!paramGalleryImage.a(paramBoolean))) {
      return null;
    }
    int i = jdField_a_of_type_AndroidViewView.getWidth();
    int j = jdField_a_of_type_AndroidViewView.getHeight();
    int k = localDrawable.getIntrinsicWidth();
    int m = localDrawable.getIntrinsicHeight();
    paramRect2.set(0, 0, k, m);
    paramRect3.set(paramRect1);
    if ((!VersionUtils.e()) && ((localDrawable instanceof URLDrawable)) && ((((URLDrawable)localDrawable).getCurrDrawable() instanceof GifDrawable))) {}
    for (paramRect1 = AnimationUtils.a(k, m, i, j, false);; paramRect1 = null)
    {
      paramRect2 = paramRect1;
      if (paramRect1 == null) {
        paramRect2 = AnimationUtils.a(k, m, i, j);
      }
      paramRect4.set(paramRect2);
      return localDrawable;
    }
  }
  
  public void b()
  {
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_ComTencentCommonGalleryactivityAnimationView.setVisibility(4);
    Iterator localIterator = jdField_a_of_type_JavaUtilArrayList.iterator();
    while (localIterator.hasNext()) {
      ((AnimationLister)localIterator.next()).b();
    }
    jdField_a_of_type_JavaUtilArrayList.clear();
  }
  
  public boolean b()
  {
    boolean bool = true;
    if (a()) {
      return true;
    }
    if (jdField_a_of_type_AndroidViewView == null) {
      f();
    }
    Rect localRect1 = new Rect();
    Rect localRect2 = new Rect();
    GalleryImage localGalleryImage = jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListModel.a();
    Rect localRect3 = localGalleryImage.a();
    Rect localRect4 = new Rect();
    Drawable localDrawable = a(null, localRect4, localRect1, localRect2, localGalleryImage, true);
    jdField_a_of_type_Boolean = true;
    if (localDrawable != null)
    {
      jdField_b_of_type_Boolean = bool;
      if (jdField_b_of_type_Boolean) {
        break label119;
      }
      jdField_a_of_type_ComTencentCommonGalleryactivityAnimationView.setVisibility(4);
    }
    for (;;)
    {
      return jdField_b_of_type_Boolean;
      bool = false;
      break;
      label119:
      jdField_a_of_type_ComTencentCommonGalleryactivityAnimationView.setVisibility(0);
      jdField_a_of_type_ComTencentCommonGalleryactivityAnimationView.setAnimationListener(this);
      if (localRect3 == null) {
        jdField_a_of_type_ComTencentCommonGalleryactivityAnimationView.a(localDrawable, localRect1, localRect2, localGalleryImage.a(), jdField_a_of_type_Long);
      } else {
        jdField_a_of_type_ComTencentCommonGalleryactivityAnimationView.a(localDrawable, localRect3, localRect4, localRect1, localRect2, jdField_a_of_type_Long);
      }
    }
  }
  
  public void c()
  {
    Iterator localIterator = jdField_a_of_type_JavaUtilArrayList.iterator();
    while (localIterator.hasNext()) {
      ((AnimationLister)localIterator.next()).c();
    }
  }
  
  public boolean c()
  {
    if (a()) {
      return true;
    }
    if (jdField_a_of_type_AndroidViewView == null) {
      f();
    }
    Rect localRect2 = new Rect();
    Rect localRect3 = new Rect();
    GalleryImage localGalleryImage = jdField_a_of_type_ComTencentCommonGalleryactivityAbstractImageListModel.a();
    Rect localRect1 = null;
    if (localGalleryImage != null) {
      localRect1 = localGalleryImage.a();
    }
    Rect localRect4 = new Rect();
    Drawable localDrawable = a(localRect1, localRect4, localRect2, localRect3, localGalleryImage, false);
    jdField_a_of_type_Boolean = true;
    boolean bool;
    if (localDrawable != null)
    {
      bool = true;
      jdField_b_of_type_Boolean = bool;
      if (jdField_b_of_type_Boolean) {
        break label127;
      }
      jdField_a_of_type_ComTencentCommonGalleryactivityAnimationView.setVisibility(4);
    }
    for (;;)
    {
      return jdField_b_of_type_Boolean;
      bool = false;
      break;
      label127:
      jdField_a_of_type_ComTencentCommonGalleryactivityAnimationView.setVisibility(0);
      jdField_a_of_type_ComTencentCommonGalleryactivityAnimationView.setAnimationListener(this);
      jdField_a_of_type_ComTencentCommonGalleryactivityAnimationView.a(localDrawable, localRect2, localRect3, localGalleryImage.a(), localGalleryImage.c(), localGalleryImage.d(), jdField_a_of_type_Long);
      if (localRect1 == null) {
        jdField_a_of_type_ComTencentCommonGalleryactivityAnimationView.a(localDrawable, localRect2, localRect3, localGalleryImage.a(), localGalleryImage.c(), localGalleryImage.d(), jdField_a_of_type_Long);
      } else {
        jdField_a_of_type_ComTencentCommonGalleryactivityAnimationView.b(localDrawable, localRect1, localRect4, localRect2, localRect3, jdField_a_of_type_Long);
      }
    }
  }
  
  public void d()
  {
    Iterator localIterator = jdField_a_of_type_JavaUtilArrayList.iterator();
    while (localIterator.hasNext()) {
      ((AnimationLister)localIterator.next()).d();
    }
  }
  
  public void e()
  {
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_ComTencentCommonGalleryactivityAnimationView.setVisibility(4);
    Iterator localIterator = jdField_a_of_type_JavaUtilArrayList.iterator();
    while (localIterator.hasNext()) {
      ((AnimationLister)localIterator.next()).e();
    }
    jdField_a_of_type_JavaUtilArrayList.clear();
  }
  
  public void f()
  {
    jdField_a_of_type_AndroidViewView = ((Gallery)jdField_a_of_type_AndroidAppActivity.findViewById(2131298267));
    jdField_a_of_type_ComTencentCommonGalleryactivityAnimationView = ((AnimationView)jdField_a_of_type_AndroidAppActivity.findViewById(2131298268));
    jdField_b_of_type_AndroidViewView = ((RelativeLayout)jdField_a_of_type_AndroidAppActivity.findViewById(2131296923));
    c = jdField_a_of_type_AndroidAppActivity.findViewById(2131296709);
  }
}
