package com.tencent.mobileqq.activity.photo;

import android.os.FileObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class MediaScannerFileObserver
  extends FileObserver
{
  private MediaScanner jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaScanner;
  private final String jdField_a_of_type_JavaLangString;
  private String b;
  
  public MediaScannerFileObserver(MediaScanner paramMediaScanner, String paramString)
  {
    super(paramString);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = "MediaScannerFileObserver";
    jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaScanner = null;
    b = null;
    b = paramString;
    jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaScanner = paramMediaScanner;
  }
  
  public void onEvent(int paramInt, String paramString)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaScanner == null) {}
    do
    {
      return;
      switch (paramInt)
      {
      default: 
        return;
      }
    } while ((paramString == null) || (!paramString.endsWith(".mp4")));
    jdField_a_of_type_ComTencentMobileqqActivityPhotoMediaScanner.a(paramInt, b, paramString);
  }
}
