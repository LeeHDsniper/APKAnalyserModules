package com.tencent.mobileqq.activity.photo;

import android.content.Context;
import android.graphics.Bitmap;
import android.media.ThumbnailUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.transfile.bitmapcreator.BitmapDecoder;
import java.net.URL;

public class AppVideoDecoder
  implements BitmapDecoder
{
  Context jdField_a_of_type_AndroidContentContext;
  LocalMediaInfo jdField_a_of_type_ComTencentMobileqqActivityPhotoLocalMediaInfo;
  
  public AppVideoDecoder(Context paramContext, LocalMediaInfo paramLocalMediaInfo)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidContentContext = paramContext;
    jdField_a_of_type_ComTencentMobileqqActivityPhotoLocalMediaInfo = paramLocalMediaInfo;
  }
  
  public Bitmap a(URL paramURL)
  {
    return ThumbnailUtils.extractThumbnail(ThumbnailUtils.createVideoThumbnail(jdField_a_of_type_ComTencentMobileqqActivityPhotoLocalMediaInfo.a, 3), jdField_a_of_type_ComTencentMobileqqActivityPhotoLocalMediaInfo.f, jdField_a_of_type_ComTencentMobileqqActivityPhotoLocalMediaInfo.g);
  }
}
