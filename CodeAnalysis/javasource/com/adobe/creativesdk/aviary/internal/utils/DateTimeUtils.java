package com.adobe.creativesdk.aviary.internal.utils;

import android.util.Log;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

public final class DateTimeUtils
{
  static final TimeZone GMT_TIME_ZONE = TimeZone.getTimeZone("GMT");
  static final TimeZone LOCAL_TIME_ZONE = TimeZone.getDefault();
  static final SimpleDateFormat S_SQLDATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US);
  
  static
  {
    S_SQLDATE_FORMAT.setTimeZone(TimeZone.getTimeZone("GMT"));
  }
  
  public static long tick()
  {
    return System.nanoTime();
  }
  
  public static long tick(long paramLong, String paramString)
  {
    long l = System.nanoTime();
    Log.d("DateTimeUtils", paramString + ", time: " + (l - paramLong) / 1000000.0D);
    return l;
  }
  
  public static String toSqlDateTime(long paramLong)
  {
    return toSqlDateTime(new Date(paramLong));
  }
  
  public static String toSqlDateTime(Date paramDate)
  {
    S_SQLDATE_FORMAT.setTimeZone(GMT_TIME_ZONE);
    return S_SQLDATE_FORMAT.format(paramDate);
  }
}
