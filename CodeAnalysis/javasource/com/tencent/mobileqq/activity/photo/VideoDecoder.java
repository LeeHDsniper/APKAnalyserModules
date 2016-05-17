package com.tencent.mobileqq.activity.photo;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory.Options;
import android.media.ThumbnailUtils;
import android.provider.MediaStore.Video.Thumbnails;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.transfile.bitmapcreator.BitmapDecoder;
import java.net.URL;

public class VideoDecoder
  implements BitmapDecoder
{
  Context jdField_a_of_type_AndroidContentContext;
  LocalMediaInfo jdField_a_of_type_ComTencentMobileqqActivityPhotoLocalMediaInfo;
  
  public VideoDecoder(Context paramContext, LocalMediaInfo paramLocalMediaInfo)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidContentContext = paramContext;
    jdField_a_of_type_ComTencentMobileqqActivityPhotoLocalMediaInfo = paramLocalMediaInfo;
  }
  
  public Bitmap a(URL paramURL)
  {
    paramURL = jdField_a_of_type_AndroidContentContext.getContentResolver();
    BitmapFactory.Options localOptions = new BitmapFactory.Options();
    return ThumbnailUtils.extractThumbnail(MediaStore.Video.Thumbnails.getThumbnail(paramURL, jdField_a_of_type_ComTencentMobileqqActivityPhotoLocalMediaInfo.a, 1, localOptions), jdField_a_of_type_ComTencentMobileqqActivityPhotoLocalMediaInfo.f, jdField_a_of_type_ComTencentMobileqqActivityPhotoLocalMediaInfo.g);
  }
}
