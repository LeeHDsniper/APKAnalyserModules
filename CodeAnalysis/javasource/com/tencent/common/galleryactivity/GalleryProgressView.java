package com.tencent.common.galleryactivity;

import android.app.Activity;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.Rect;
import android.util.DisplayMetrics;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.PhotoProgressDrawable;

public class GalleryProgressView
  implements AbstractProgressView
{
  int jdField_a_of_type_Int;
  Rect jdField_a_of_type_AndroidGraphicsRect;
  ImageView jdField_a_of_type_AndroidWidgetImageView;
  PhotoProgressDrawable jdField_a_of_type_ComTencentMobileqqWidgetPhotoProgressDrawable;
  boolean jdField_a_of_type_Boolean;
  boolean b;
  
  public GalleryProgressView()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
    b = false;
    jdField_a_of_type_Int = 0;
  }
  
  private void a(Activity paramActivity)
  {
    Object localObject1 = null;
    try
    {
      localObject2 = BitmapFactory.decodeResource(paramActivity.getResources(), 2130841954);
      localObject1 = localObject2;
    }
    catch (OutOfMemoryError localOutOfMemoryError)
    {
      Object localObject2;
      for (;;) {}
    }
    localObject2 = localObject1;
    if (localObject1 == null) {
      localObject2 = Bitmap.createBitmap(4, 4, Bitmap.Config.ARGB_8888);
    }
    jdField_a_of_type_ComTencentMobileqqWidgetPhotoProgressDrawable = new PhotoProgressDrawable((Bitmap)localObject2, (int)(getResourcesgetDisplayMetricsdensity * 12.0F));
    jdField_a_of_type_ComTencentMobileqqWidgetPhotoProgressDrawable.setLevel(0);
    jdField_a_of_type_AndroidGraphicsRect = new Rect(0, 0, 0, 0);
  }
  
  public void a()
  {
    jdField_a_of_type_Boolean = true;
    if ((b) && (jdField_a_of_type_AndroidWidgetImageView.getVisibility() == 4))
    {
      if ((jdField_a_of_type_AndroidGraphicsRect.width() == 0) || (jdField_a_of_type_AndroidGraphicsRect.height() == 0))
      {
        jdField_a_of_type_AndroidGraphicsRect.set(0, 0, jdField_a_of_type_AndroidWidgetImageView.getWidth(), jdField_a_of_type_AndroidWidgetImageView.getHeight());
        jdField_a_of_type_ComTencentMobileqqWidgetPhotoProgressDrawable.setBounds(jdField_a_of_type_AndroidGraphicsRect);
        jdField_a_of_type_AndroidWidgetImageView.setImageDrawable(jdField_a_of_type_ComTencentMobileqqWidgetPhotoProgressDrawable);
      }
      jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
    }
  }
  
  public void a(int paramInt)
  {
    if ((paramInt >= 0) && (paramInt <= 100))
    {
      jdField_a_of_type_ComTencentMobileqqWidgetPhotoProgressDrawable.setLevel(paramInt * 100);
      jdField_a_of_type_ComTencentMobileqqWidgetPhotoProgressDrawable.invalidateSelf();
    }
  }
  
  public void a(Activity paramActivity, ImageView paramImageView)
  {
    jdField_a_of_type_AndroidWidgetImageView = paramImageView;
    a(paramActivity);
  }
  
  public void a(Activity paramActivity, AbstractGalleryScene paramAbstractGalleryScene)
  {
    jdField_a_of_type_AndroidWidgetImageView = ((ImageView)((RelativeLayout)paramAbstractGalleryScene.a()).findViewById(2131299494));
    a(paramActivity);
  }
  
  public boolean a()
  {
    return jdField_a_of_type_Boolean;
  }
  
  public void b()
  {
    jdField_a_of_type_Boolean = false;
    if (jdField_a_of_type_AndroidWidgetImageView.getVisibility() == 0) {
      jdField_a_of_type_AndroidWidgetImageView.setVisibility(4);
    }
  }
  
  public void b(int paramInt)
  {
    jdField_a_of_type_Int = paramInt;
    b = true;
    if (jdField_a_of_type_Boolean)
    {
      if ((jdField_a_of_type_AndroidGraphicsRect.width() == 0) || (jdField_a_of_type_AndroidGraphicsRect.height() == 0))
      {
        jdField_a_of_type_AndroidGraphicsRect.set(0, 0, jdField_a_of_type_AndroidWidgetImageView.getWidth(), jdField_a_of_type_AndroidWidgetImageView.getHeight());
        jdField_a_of_type_ComTencentMobileqqWidgetPhotoProgressDrawable.setBounds(jdField_a_of_type_AndroidGraphicsRect);
        jdField_a_of_type_AndroidWidgetImageView.setImageDrawable(jdField_a_of_type_ComTencentMobileqqWidgetPhotoProgressDrawable);
      }
      jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
    }
    if ((paramInt >= 0) && (paramInt < 100))
    {
      jdField_a_of_type_ComTencentMobileqqWidgetPhotoProgressDrawable.setLevel(paramInt * 100);
      jdField_a_of_type_ComTencentMobileqqWidgetPhotoProgressDrawable.invalidateSelf();
    }
  }
  
  public boolean b()
  {
    return b;
  }
  
  public void c()
  {
    jdField_a_of_type_Int = 0;
    b = false;
    if (jdField_a_of_type_AndroidWidgetImageView.getVisibility() == 0) {
      jdField_a_of_type_AndroidWidgetImageView.setVisibility(4);
    }
  }
}
