package com.tencent.mobileqq.activity.aio.photo;

import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.support.v4.util.MQLruCache;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.common.galleryactivity.GalleryImage;
import com.tencent.image.URLDrawable;
import com.tencent.image.URLDrawable.URLDrawableOptions;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pic.PicUiInterface;
import com.tencent.mobileqq.transfile.URLDrawableHelper;
import com.tencent.qphone.base.util.QLog;
import java.io.File;

public class AIORichMediaInfo
  extends GalleryImage
{
  public static final int g = -2;
  public int a;
  public AIORichMediaData a;
  boolean a;
  public int b;
  public Rect b;
  boolean b;
  Rect c;
  public int h;
  
  public AIORichMediaInfo(AIORichMediaData paramAIORichMediaData)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = 0;
    jdField_b_of_type_Int = -2;
    jdField_a_of_type_Boolean = true;
    jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData = paramAIORichMediaData;
  }
  
  @Deprecated
  public static URLDrawable a(PicUiInterface paramPicUiInterface)
  {
    return URLDrawableHelper.b(paramPicUiInterface, 1);
  }
  
  public int a()
  {
    return h;
  }
  
  public Rect a()
  {
    return c;
  }
  
  public Rect b()
  {
    if ((jdField_b_of_type_Boolean) && (jdField_a_of_type_Boolean)) {
      return jdField_b_of_type_AndroidGraphicsRect;
    }
    return super.b();
  }
  
  public int c()
  {
    return 0;
  }
  
  public Drawable c()
  {
    for (;;)
    {
      try
      {
        if (!AIOImageData.class.isInstance(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData)) {
          continue;
        }
        localObject1 = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData.a(2);
        localObject3 = jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData.a(4);
        localURLDrawableOptions = URLDrawable.URLDrawableOptions.obtain();
        mLoadingDrawable = URLDrawableHelper.d;
        mFailedDrawable = URLDrawableHelper.d;
        if ((localObject1 == null) || (BaseApplicationImpl.a.get(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData.a(2)) == null)) {
          continue;
        }
        if (URLDrawableHelper.a(((File)localObject1).getAbsolutePath()) != 0) {
          return null;
        }
        localObject1 = URLDrawable.getDrawable(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData.a(2), localURLDrawableOptions);
      }
      catch (Throwable localThrowable)
      {
        Object localObject1;
        if (!QLog.isColorLevel()) {
          break label340;
        }
        QLog.e("AIOImageInfo", 2, "getAnimationBitmap " + localThrowable.toString());
        return null;
        if (!AIOShortVideoData.class.isInstance(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData)) {
          continue;
        }
        Object localObject2 = (AIOShortVideoData)jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData;
        Object localObject3 = ((AIOShortVideoData)localObject2).a(0);
        URLDrawable.URLDrawableOptions localURLDrawableOptions = URLDrawable.URLDrawableOptions.obtain();
        mLoadingDrawable = URLDrawableHelper.d;
        mFailedDrawable = URLDrawableHelper.d;
        if ((localObject3 == null) || (BaseApplicationImpl.a.get(((AIOShortVideoData)localObject2).a(0)) == null)) {
          continue;
        }
        localObject2 = URLDrawable.getDrawable(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData.a(0), localURLDrawableOptions);
        continue;
        if (localObject3 == null) {
          continue;
        }
        localObject2 = URLDrawable.getDrawable(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData.a(0), localURLDrawableOptions);
        ((URLDrawable)localObject2).downloadImediatly();
        continue;
        localObject2 = null;
        continue;
      }
      localObject3 = b();
      if ((localObject1 == null) || (localObject3 == null)) {
        break label340;
      }
      h = a((Rect)localObject3, (Drawable)localObject1);
      return localObject1;
      if ((localObject3 != null) && (BaseApplicationImpl.a.get(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData.a(4)) != null))
      {
        if (URLDrawableHelper.a(((File)localObject3).getAbsolutePath()) != 0) {
          break label340;
        }
        localObject1 = URLDrawable.getDrawable(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData.a(4), localURLDrawableOptions);
      }
      else
      {
        if (jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData.a(1) == null) {
          continue;
        }
        localObject1 = URLDrawable.getDrawable(jdField_a_of_type_ComTencentMobileqqActivityAioPhotoAIORichMediaData.a(1), localURLDrawableOptions);
        ((URLDrawable)localObject1).downloadImediatly();
      }
    }
    label340:
    return null;
  }
  
  public int d()
  {
    return 0;
  }
}
