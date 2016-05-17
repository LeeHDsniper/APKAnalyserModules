package com.tencent.mobileqq.utils;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.Resources.NotFoundException;
import android.provider.Settings.SettingNotFoundException;
import android.provider.Settings.System;
import android.text.TextUtils;
import android.text.format.Time;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.BaseApplication;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.TimeZone;

public class TimeFormatterUtils
{
  private static final char jdField_a_of_type_Char = '/';
  public static final int a = 0;
  public static final long a = 86400000L;
  private static final String jdField_a_of_type_JavaLangString = "EEEE";
  private static StringBuffer jdField_a_of_type_JavaLangStringBuffer;
  private static java.text.DateFormat jdField_a_of_type_JavaTextDateFormat;
  private static Calendar jdField_a_of_type_JavaUtilCalendar;
  public static final int b = 1;
  private static java.text.DateFormat b;
  public static final int c = 2;
  public static final int d = 3;
  public static final int e = 1;
  public static final int f = 2;
  public static final int g = 3;
  public static final int h = 4;
  public static final int i = 5;
  private static int j = 0;
  private static final int k = 1;
  private static final int l = 7;
  
  public TimeFormatterUtils()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private static int a(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6)
  {
    GregorianCalendar localGregorianCalendar1 = new GregorianCalendar(paramInt1, paramInt2, paramInt3);
    GregorianCalendar localGregorianCalendar2 = new GregorianCalendar(paramInt4, paramInt5, paramInt6);
    return (int)((localGregorianCalendar1.getTimeInMillis() - localGregorianCalendar2.getTimeInMillis()) / 1000L / 60L / 60L / 24L);
  }
  
  public static int a(long paramLong)
  {
    int m = -1;
    int n = (int)((System.currentTimeMillis() + j) / 86400000L);
    int i1 = (int)((j + paramLong) / 86400000L);
    if (i1 == n) {
      m = 2131368543;
    }
    do
    {
      return m;
      if (i1 == n - 1) {
        return 2131368544;
      }
    } while (i1 != n - 2);
    return 2131368545;
  }
  
  public static int a(long paramLong, Calendar paramCalendar)
  {
    int n = -1;
    int i1 = (int)((System.currentTimeMillis() + j) / 86400000L);
    int i2 = i1 - 1;
    int i3 = (int)((j + paramLong) / 86400000L);
    int m;
    if (i3 == i1) {
      m = 2131368543;
    }
    do
    {
      do
      {
        return m;
        if (i3 == i2) {
          return 2131368544;
        }
        m = n;
      } while (i3 >= i2);
      m = n;
    } while (i3 <= i1 - 7);
    Calendar localCalendar = paramCalendar;
    if (paramCalendar == null)
    {
      localCalendar = Calendar.getInstance();
      localCalendar.setTimeInMillis(paramLong);
    }
    switch (localCalendar.get(7))
    {
    default: 
      return -1;
    case 1: 
      return 2131368552;
    case 2: 
      return 2131368546;
    case 3: 
      return 2131368547;
    case 4: 
      return 2131368548;
    case 5: 
      return 2131368549;
    case 6: 
      return 2131368550;
    }
    return 2131368551;
  }
  
  public static CharSequence a(Context paramContext, int paramInt, long paramLong)
  {
    return a(paramContext, paramInt, paramLong, true);
  }
  
  public static CharSequence a(Context paramContext, int paramInt, long paramLong, boolean paramBoolean)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    try
    {
      SimpleDateFormat localSimpleDateFormat1 = (SimpleDateFormat)a();
      if (paramInt == 0)
      {
        localStringBuilder.append(localSimpleDateFormat1.toLocalizedPattern());
        return android.text.format.DateFormat.format(localStringBuilder.append(" ").toString(), paramLong) + b().format(Long.valueOf(paramLong));
      }
    }
    catch (Resources.NotFoundException localNotFoundException)
    {
      SimpleDateFormat localSimpleDateFormat2;
      for (;;)
      {
        localSimpleDateFormat2 = new SimpleDateFormat("HH:mm");
      }
      return a(paramContext, paramLong, localStringBuilder, localSimpleDateFormat2, paramInt, paramBoolean);
    }
  }
  
  public static CharSequence a(Context paramContext, long paramLong)
  {
    if (jdField_a_of_type_JavaUtilCalendar == null) {
      jdField_a_of_type_JavaUtilCalendar = Calendar.getInstance();
    }
    jdField_a_of_type_JavaUtilCalendar.setTimeInMillis(paramLong);
    int m = jdField_a_of_type_JavaUtilCalendar.get(2);
    int n = jdField_a_of_type_JavaUtilCalendar.get(5);
    return String.format("%s%s%s%s", new Object[] { Integer.valueOf(m + 1), paramContext.getString(2131368559), Integer.valueOf(n), paramContext.getString(2131368560) });
  }
  
  private static CharSequence a(Context paramContext, long paramLong, StringBuilder paramStringBuilder, SimpleDateFormat paramSimpleDateFormat, int paramInt, boolean paramBoolean)
  {
    int i1 = 0;
    Time localTime1 = new Time();
    localTime1.set(paramLong);
    Time localTime2 = new Time();
    localTime2.setToNow();
    int m;
    if ((paramInt & 0x2) != 0)
    {
      m = 1;
      if ((paramInt & 0x1) == 0) {
        break label112;
      }
      paramInt = 1;
      label52:
      if (year == year) {
        break label118;
      }
      paramStringBuilder.append(paramSimpleDateFormat.toLocalizedPattern()).append(" ");
      paramInt = i1;
    }
    for (;;)
    {
      if ((paramInt == 0) && (!paramBoolean))
      {
        return android.text.format.DateFormat.format(paramStringBuilder.toString().trim(), paramLong);
        m = 0;
        break;
        label112:
        paramInt = 0;
        break label52;
        label118:
        if (yearDay == yearDay) {
          break label393;
        }
        int i2 = Math.abs(yearDay - yearDay);
        if (yearDay > yearDay) {}
        for (int n = 1;; n = 0)
        {
          if (n != 0) {
            break label196;
          }
          paramStringBuilder.append(paramSimpleDateFormat.toLocalizedPattern()).append(" ");
          paramInt = i1;
          break;
        }
        label196:
        if ((i2 == 1) && (paramInt != 0))
        {
          paramStringBuilder.append(paramContext.getString(2131369882)).append(" ");
          if (!paramBoolean) {
            return paramStringBuilder.toString().trim();
          }
          return paramStringBuilder.toString() + b().format(Long.valueOf(paramLong));
        }
        if ((i2 > 1) && (i2 < 7) && (m != 0))
        {
          paramStringBuilder.append("EEEE").append(" ");
          paramInt = i1;
          continue;
        }
        if (year == year)
        {
          paramStringBuilder.append("MM-dd").append(" ");
          paramInt = i1;
          continue;
        }
        paramStringBuilder.append(paramSimpleDateFormat.toLocalizedPattern()).append(" ");
        paramInt = i1;
        continue;
      }
      return android.text.format.DateFormat.format(paramStringBuilder.toString(), paramLong) + b().format(Long.valueOf(paramLong));
      label393:
      paramInt = 1;
    }
  }
  
  public static String a(long paramLong)
  {
    Calendar localCalendar1 = Calendar.getInstance();
    Date localDate = new Date(paramLong);
    localCalendar1.setTime(localDate);
    Calendar localCalendar2 = Calendar.getInstance();
    localCalendar2.setTimeInMillis(System.currentTimeMillis());
    if ((localCalendar1.get(1) == localCalendar2.get(1)) && (localCalendar1.get(6) == localCalendar2.get(6))) {
      return "今天";
    }
    if ((localCalendar1.get(1) == localCalendar2.get(1)) && (localCalendar1.get(6) + 1 == localCalendar2.get(6))) {
      return "昨天";
    }
    if ((localCalendar1.get(1) == localCalendar2.get(1)) && (localCalendar1.get(6) > localCalendar2.get(6) - 7)) {
      switch (localCalendar1.get(7))
      {
      }
    }
    while (localCalendar1.get(1) != localCalendar2.get(1))
    {
      return new SimpleDateFormat("yy-MM-dd").format(localDate);
      return "星期日";
      return "星期一";
      return "星期二";
      return "星期三";
      return "星期四";
      return "星期五";
      return "星期六";
    }
    return new SimpleDateFormat("MM-dd").format(localDate);
  }
  
  public static String a(long paramLong, String paramString)
  {
    if (paramLong <= 0L) {
      return null;
    }
    Date localDate = new Date(paramLong);
    return new SimpleDateFormat(paramString).format(localDate);
  }
  
  public static String a(long paramLong, boolean paramBoolean)
  {
    jdField_a_of_type_JavaLangStringBuffer.setLength(0);
    jdField_a_of_type_JavaUtilCalendar.setTimeInMillis(paramLong);
    int m = 0;
    int i1 = a(paramLong);
    if (i1 != -1)
    {
      n = 1;
      m = n;
      if (i1 != 2131368543)
      {
        jdField_a_of_type_JavaLangStringBuffer.append(BaseApplication.getContext().getString(i1));
        m = n;
      }
    }
    int i2 = jdField_a_of_type_JavaUtilCalendar.get(11);
    int n = jdField_a_of_type_JavaUtilCalendar.get(12);
    if (m != 0) {
      if (i1 == 2131368543) {
        if ((i2 >= 0) && (i2 < 12))
        {
          jdField_a_of_type_JavaLangStringBuffer.append(BaseApplication.getContext().getString(2131368556));
          jdField_a_of_type_JavaLangStringBuffer.append(' ');
          if (i2 != 12) {
            break label220;
          }
          m = 12;
          label137:
          if (m < 10) {
            jdField_a_of_type_JavaLangStringBuffer.append('0');
          }
          jdField_a_of_type_JavaLangStringBuffer.append(m);
          jdField_a_of_type_JavaLangStringBuffer.append(':');
          if (n < 10) {
            jdField_a_of_type_JavaLangStringBuffer.append('0');
          }
          jdField_a_of_type_JavaLangStringBuffer.append(n);
        }
      }
    }
    for (;;)
    {
      return jdField_a_of_type_JavaLangStringBuffer.toString();
      jdField_a_of_type_JavaLangStringBuffer.append(BaseApplication.getContext().getString(2131368557));
      break;
      label220:
      m = i2 % 12;
      break label137;
      if (!paramBoolean)
      {
        jdField_a_of_type_JavaLangStringBuffer.append(' ');
        if (i2 < 10) {
          jdField_a_of_type_JavaLangStringBuffer.append('0');
        }
        jdField_a_of_type_JavaLangStringBuffer.append(i2);
        jdField_a_of_type_JavaLangStringBuffer.append(':');
        if (n < 10) {
          jdField_a_of_type_JavaLangStringBuffer.append('0');
        }
        jdField_a_of_type_JavaLangStringBuffer.append(n);
        continue;
        jdField_a_of_type_JavaLangStringBuffer.append(jdField_a_of_type_JavaUtilCalendar.get(1)).append('/').append(jdField_a_of_type_JavaUtilCalendar.get(2) + 1).append('/').append(jdField_a_of_type_JavaUtilCalendar.get(5));
        if (!paramBoolean)
        {
          jdField_a_of_type_JavaLangStringBuffer.append(' ');
          jdField_a_of_type_JavaLangStringBuffer.append(i2);
          jdField_a_of_type_JavaLangStringBuffer.append(':');
          if (n < 10) {
            jdField_a_of_type_JavaLangStringBuffer.append('0');
          }
          jdField_a_of_type_JavaLangStringBuffer.append(n);
        }
      }
    }
  }
  
  public static String a(long paramLong, boolean paramBoolean, String paramString)
  {
    return a(jdField_a_of_type_JavaLangStringBuffer, paramLong, paramBoolean, paramString);
  }
  
  public static String a(Context paramContext, long paramLong)
  {
    jdField_a_of_type_JavaUtilCalendar.setTimeInMillis(System.currentTimeMillis());
    int m = jdField_a_of_type_JavaUtilCalendar.get(1);
    int n = jdField_a_of_type_JavaUtilCalendar.get(2);
    int i1 = jdField_a_of_type_JavaUtilCalendar.get(5);
    jdField_a_of_type_JavaUtilCalendar.setTimeInMillis(paramLong);
    m = a(m, n, i1, jdField_a_of_type_JavaUtilCalendar.get(1), jdField_a_of_type_JavaUtilCalendar.get(2), jdField_a_of_type_JavaUtilCalendar.get(5));
    if (m == 0)
    {
      try
      {
        m = Settings.System.getInt(paramContext.getContentResolver(), "time_12_24");
        if (m == 12) {
          if (jdField_a_of_type_JavaUtilCalendar.get(11) < 12)
          {
            m = 2131368556;
            return String.format("%s %s", new Object[] { paramContext.getString(m), new SimpleDateFormat("hh:mm", getResourcesgetConfigurationlocale).format(new Date(paramLong)) });
          }
        }
      }
      catch (Settings.SettingNotFoundException localSettingNotFoundException)
      {
        for (;;)
        {
          m = 0;
          continue;
          m = 2131368557;
        }
      }
      return new SimpleDateFormat("HH:mm", getResourcesgetConfigurationlocale).format(new Date(paramLong));
    }
    if (m == 1) {
      return paramContext.getString(2131368544);
    }
    if ((m < 7) && (m > 1)) {
      return new SimpleDateFormat("E", getResourcesgetConfigurationlocale).format(new Date(paramLong));
    }
    return a().format(new Date(paramLong));
  }
  
  public static String a(StringBuffer paramStringBuffer, long paramLong, boolean paramBoolean, String paramString)
  {
    int m = 0;
    if (paramStringBuffer != null)
    {
      paramStringBuffer.setLength(0);
      Calendar localCalendar = Calendar.getInstance();
      localCalendar.setTimeInMillis(paramLong);
      int i1 = b(paramLong, localCalendar);
      if (i1 != -1)
      {
        n = 1;
        m = n;
        if (i1 != 2131368543)
        {
          paramStringBuffer.append(BaseApplication.getContext().getString(i1));
          m = n;
        }
      }
      int i2 = localCalendar.get(11);
      int n = localCalendar.get(12);
      if (m != 0)
      {
        boolean bool = android.text.format.DateFormat.is24HourFormat(BaseApplication.getContext());
        if (i1 == 2131368543) {
          if (!bool) {
            if ((i2 >= 0) && (i2 < 12))
            {
              paramStringBuffer.append(BaseApplication.getContext().getString(2131368556));
              if (i2 != 12) {
                break label205;
              }
              m = 12;
              label148:
              paramStringBuffer.append(m);
              paramStringBuffer.append(':');
              if (n < 10) {
                paramStringBuffer.append('0');
              }
              paramStringBuffer.append(n);
            }
          }
        }
      }
      for (;;)
      {
        return paramStringBuffer.toString();
        paramStringBuffer.append(BaseApplication.getContext().getString(2131368557));
        break;
        label205:
        m = i2 % 12;
        break label148;
        paramStringBuffer.append(i2);
        paramStringBuffer.append(':');
        if (n < 10) {
          paramStringBuffer.append('0');
        }
        paramStringBuffer.append(n);
        continue;
        if (!paramBoolean)
        {
          paramStringBuffer.append(' ');
          paramStringBuffer.append(i2);
          paramStringBuffer.append(':');
          if (n < 10) {
            paramStringBuffer.append('0');
          }
          paramStringBuffer.append(n);
          continue;
          String str = paramString;
          if (TextUtils.isEmpty(paramString)) {
            str = "yyyy-MM-dd";
          }
          try
          {
            paramString = new SimpleDateFormat(str);
            paramStringBuffer.append(paramString.format(localCalendar.getTime()));
            if (!paramBoolean)
            {
              paramStringBuffer.append(' ');
              paramStringBuffer.append(i2);
              paramStringBuffer.append(':');
              if (n < 10) {
                paramStringBuffer.append('0');
              }
              paramStringBuffer.append(n);
            }
          }
          catch (Exception paramString)
          {
            for (;;)
            {
              paramString = new SimpleDateFormat("yyyy-MM-dd");
            }
          }
        }
      }
    }
    return null;
  }
  
  private static java.text.DateFormat a()
  {
    try
    {
      if (b == null) {
        b = android.text.format.DateFormat.getDateFormat(BaseApplicationImpl.a().getApplicationContext());
      }
      java.text.DateFormat localDateFormat = b;
      return localDateFormat;
    }
    finally {}
  }
  
  public static void a()
  {
    j = TimeZone.getTimeZone("GMT+8").getRawOffset();
    jdField_a_of_type_JavaUtilCalendar = Calendar.getInstance();
    jdField_a_of_type_JavaLangStringBuffer = new StringBuffer();
  }
  
  private static int b(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6)
  {
    if (paramInt1 != paramInt4) {
      return 5;
    }
    if (paramInt3 == paramInt6) {
      return 1;
    }
    if (paramInt3 == paramInt6 + 1) {
      return 2;
    }
    if (paramInt3 == paramInt6 + 2) {
      return 3;
    }
    return 4;
  }
  
  public static int b(long paramLong)
  {
    jdField_a_of_type_JavaUtilCalendar.setTimeInMillis(System.currentTimeMillis());
    int m = jdField_a_of_type_JavaUtilCalendar.get(1);
    int n = jdField_a_of_type_JavaUtilCalendar.get(2);
    int i1 = jdField_a_of_type_JavaUtilCalendar.get(6);
    jdField_a_of_type_JavaUtilCalendar.setTimeInMillis(paramLong);
    return b(m, n, i1, jdField_a_of_type_JavaUtilCalendar.get(1), jdField_a_of_type_JavaUtilCalendar.get(2), jdField_a_of_type_JavaUtilCalendar.get(6));
  }
  
  public static int b(long paramLong, Calendar paramCalendar)
  {
    paramCalendar = new Time();
    paramCalendar.set(paramLong);
    long l1 = System.currentTimeMillis();
    Time localTime = new Time();
    localTime.set(l1);
    int m = yearDay - 1;
    int n = yearDay;
    if (year == year) {
      if (yearDay >= yearDay) {}
    }
    do
    {
      do
      {
        do
        {
          return -1;
          if (yearDay == yearDay) {
            return 2131368543;
          }
          if (yearDay == m) {
            return 2131368544;
          }
        } while ((yearDay >= m) || (yearDay <= n - 7));
        switch (weekDay)
        {
        default: 
          return -1;
        case 0: 
          return 2131368552;
        case 1: 
          return 2131368546;
        case 2: 
          return 2131368547;
        case 3: 
          return 2131368548;
        case 4: 
          return 2131368549;
        case 5: 
          return 2131368550;
        }
        return 2131368551;
      } while (year + 1 != year);
      paramLong = (l1 - paramLong + 86400000L - 1L) / 86400000L;
    } while ((paramLong <= 0L) || (paramLong > 7L));
    if (paramLong == 1L) {
      return 2131368544;
    }
    switch (weekDay)
    {
    default: 
      return -1;
    case 0: 
      return 2131368552;
    case 1: 
      return 2131368546;
    case 2: 
      return 2131368547;
    case 3: 
      return 2131368548;
    case 4: 
      return 2131368549;
    case 5: 
      return 2131368550;
    }
    return 2131368551;
  }
  
  public static CharSequence b(Context paramContext, long paramLong)
  {
    return b().format(new Date(paramLong));
  }
  
  public static String b(Context paramContext, long paramLong)
  {
    jdField_a_of_type_JavaUtilCalendar.setTimeInMillis(System.currentTimeMillis());
    int m = jdField_a_of_type_JavaUtilCalendar.get(1);
    int n = jdField_a_of_type_JavaUtilCalendar.get(2);
    int i1 = jdField_a_of_type_JavaUtilCalendar.get(5);
    jdField_a_of_type_JavaUtilCalendar.setTimeInMillis(paramLong);
    m = a(m, n, i1, jdField_a_of_type_JavaUtilCalendar.get(1), jdField_a_of_type_JavaUtilCalendar.get(2), jdField_a_of_type_JavaUtilCalendar.get(5));
    SimpleDateFormat localSimpleDateFormat2;
    Object localObject;
    if (m == 0) {
      try
      {
        m = Settings.System.getInt(paramContext.getContentResolver(), "time_12_24");
        if (m == 12) {
          if (jdField_a_of_type_JavaUtilCalendar.get(11) < 12)
          {
            m = 2131368556;
            String str = paramContext.getString(m);
            localSimpleDateFormat2 = new SimpleDateFormat("hh:mm", getResourcesgetConfigurationlocale);
            return paramContext.getString(2131368543) + " " + String.format("%s %s", new Object[] { str, localSimpleDateFormat2.format(new Date(paramLong)) });
          }
        }
      }
      catch (Settings.SettingNotFoundException localSettingNotFoundException1)
      {
        for (;;)
        {
          m = 0;
          continue;
          m = 2131368557;
        }
        localObject = new SimpleDateFormat("HH:mm", getResourcesgetConfigurationlocale);
        return paramContext.getString(2131368543) + " " + ((SimpleDateFormat)localObject).format(new Date(paramLong));
      }
    }
    if (m == 1) {
      try
      {
        m = Settings.System.getInt(paramContext.getContentResolver(), "time_12_24");
        if (m == 12) {
          if (jdField_a_of_type_JavaUtilCalendar.get(11) < 12)
          {
            m = 2131368556;
            localObject = paramContext.getString(m);
            localSimpleDateFormat2 = new SimpleDateFormat("hh:mm", getResourcesgetConfigurationlocale);
            return paramContext.getString(2131368544) + " " + String.format("%s %s", new Object[] { localObject, localSimpleDateFormat2.format(new Date(paramLong)) });
          }
        }
      }
      catch (Settings.SettingNotFoundException localSettingNotFoundException2)
      {
        for (;;)
        {
          m = 0;
          continue;
          m = 2131368557;
        }
        SimpleDateFormat localSimpleDateFormat1 = new SimpleDateFormat("HH:mm", getResourcesgetConfigurationlocale);
        return paramContext.getString(2131368544) + " " + localSimpleDateFormat1.format(new Date(paramLong));
      }
    }
    if ((m < 7) && (m > 1)) {
      return new SimpleDateFormat("E", getResourcesgetConfigurationlocale).format(new Date(paramLong));
    }
    return new SimpleDateFormat("yyyy-MM-dd", getResourcesgetConfigurationlocale).format(new Date(paramLong));
  }
  
  private static java.text.DateFormat b()
  {
    try
    {
      if (jdField_a_of_type_JavaTextDateFormat == null) {
        jdField_a_of_type_JavaTextDateFormat = android.text.format.DateFormat.getTimeFormat(BaseApplicationImpl.a().getApplicationContext());
      }
      java.text.DateFormat localDateFormat = jdField_a_of_type_JavaTextDateFormat;
      return localDateFormat;
    }
    finally {}
  }
  
  public static String c(Context paramContext, long paramLong)
  {
    jdField_a_of_type_JavaUtilCalendar.setTimeInMillis(System.currentTimeMillis());
    int m = jdField_a_of_type_JavaUtilCalendar.get(1);
    int n = jdField_a_of_type_JavaUtilCalendar.get(2);
    int i1 = jdField_a_of_type_JavaUtilCalendar.get(6);
    jdField_a_of_type_JavaUtilCalendar.setTimeInMillis(paramLong);
    switch (b(m, n, i1, jdField_a_of_type_JavaUtilCalendar.get(1), jdField_a_of_type_JavaUtilCalendar.get(2), jdField_a_of_type_JavaUtilCalendar.get(6)))
    {
    default: 
      return null;
    case 1: 
      return new SimpleDateFormat("HH:mm", getResourcesgetConfigurationlocale).format(new Date(paramLong));
    case 2: 
      return String.format("%s %s", new Object[] { "昨天", new SimpleDateFormat("HH:mm", getResourcesgetConfigurationlocale).format(new Date(paramLong)) });
    case 3: 
      return String.format("%s %s", new Object[] { "前天", new SimpleDateFormat("HH:mm", getResourcesgetConfigurationlocale).format(new Date(paramLong)) });
    case 4: 
      return new SimpleDateFormat("MM-dd HH:mm", getResourcesgetConfigurationlocale).format(new Date(paramLong));
    }
    return new SimpleDateFormat("yyyy-MM-dd HH:mm", getResourcesgetConfigurationlocale).format(new Date(paramLong));
  }
}