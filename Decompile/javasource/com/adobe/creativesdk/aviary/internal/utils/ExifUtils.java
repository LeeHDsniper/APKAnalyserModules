package com.adobe.creativesdk.aviary.internal.utils;

import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.log.LoggerFactory.LoggerType;
import it.sephiroth.android.library.exif2.ExifInterface;

public final class ExifUtils
{
  private static LoggerFactory.Logger logger = LoggerFactory.getLogger("ExifUtils", LoggerFactory.LoggerType.ConsoleLoggerType);
  
  public static int getOrientation(ExifInterface paramExifInterface)
  {
    paramExifInterface = paramExifInterface.getTagIntValue(ExifInterface.TAG_ORIENTATION);
    if (paramExifInterface == null) {
      return 0;
    }
    return ExifInterface.getRotationForOrientationValue(paramExifInterface.shortValue());
  }
}
