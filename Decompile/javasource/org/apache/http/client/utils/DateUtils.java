package org.apache.http.client.utils;

import java.lang.ref.SoftReference;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
import org.apache.http.annotation.Immutable;
import org.apache.http.util.Args;

@Immutable
public final class DateUtils
{
  private static final String[] DEFAULT_PATTERNS = { "EEE, dd MMM yyyy HH:mm:ss zzz", "EEE, dd-MMM-yy HH:mm:ss zzz", "EEE MMM d HH:mm:ss yyyy" };
  private static final Date DEFAULT_TWO_DIGIT_YEAR_START;
  public static final TimeZone GMT = TimeZone.getTimeZone("GMT");
  public static final String PATTERN_ASCTIME = "EEE MMM d HH:mm:ss yyyy";
  public static final String PATTERN_RFC1036 = "EEE, dd-MMM-yy HH:mm:ss zzz";
  public static final String PATTERN_RFC1123 = "EEE, dd MMM yyyy HH:mm:ss zzz";
  
  static
  {
    Calendar localCalendar = Calendar.getInstance();
    localCalendar.setTimeZone(GMT);
    localCalendar.set(2000, 0, 1, 0, 0, 0);
    localCalendar.set(14, 0);
    DEFAULT_TWO_DIGIT_YEAR_START = localCalendar.getTime();
  }
  
  private DateUtils() {}
  
  public static void clearThreadLocal() {}
  
  public static String formatDate(Date paramDate)
  {
    return formatDate(paramDate, "EEE, dd MMM yyyy HH:mm:ss zzz");
  }
  
  public static String formatDate(Date paramDate, String paramString)
  {
    Args.notNull(paramDate, "Date");
    Args.notNull(paramString, "Pattern");
    return DateFormatHolder.formatFor(paramString).format(paramDate);
  }
  
  public static Date parseDate(String paramString)
  {
    return parseDate(paramString, null, null);
  }
  
  public static Date parseDate(String paramString, String[] paramArrayOfString)
  {
    return parseDate(paramString, paramArrayOfString, null);
  }
  
  public static Date parseDate(String paramString, String[] paramArrayOfString, Date paramDate)
  {
    Args.notNull(paramString, "Date value");
    label15:
    Object localObject1;
    int j;
    int i;
    if (paramArrayOfString != null)
    {
      if (paramDate == null) {
        break label134;
      }
      localObject1 = paramString;
      paramString = (String)localObject1;
      if (((String)localObject1).length() > 1)
      {
        paramString = (String)localObject1;
        if (((String)localObject1).startsWith("'"))
        {
          paramString = (String)localObject1;
          if (((String)localObject1).endsWith("'")) {
            paramString = ((String)localObject1).substring(1, ((String)localObject1).length() - 1);
          }
        }
      }
      j = paramArrayOfString.length;
      i = 0;
    }
    for (;;)
    {
      if (i >= j) {
        break label148;
      }
      Object localObject2 = DateFormatHolder.formatFor(paramArrayOfString[i]);
      ((SimpleDateFormat)localObject2).set2DigitYearStart(paramDate);
      localObject1 = new ParsePosition(0);
      localObject2 = ((SimpleDateFormat)localObject2).parse(paramString, (ParsePosition)localObject1);
      if (((ParsePosition)localObject1).getIndex() != 0)
      {
        return localObject2;
        paramArrayOfString = DEFAULT_PATTERNS;
        break;
        label134:
        paramDate = DEFAULT_TWO_DIGIT_YEAR_START;
        break label15;
      }
      i += 1;
    }
    label148:
    return null;
  }
  
  static final class DateFormatHolder
  {
    private static final ThreadLocal<SoftReference<Map<String, SimpleDateFormat>>> THREADLOCAL_FORMATS = new ThreadLocal()
    {
      protected SoftReference<Map<String, SimpleDateFormat>> initialValue()
      {
        return new SoftReference(new HashMap());
      }
    };
    
    DateFormatHolder() {}
    
    public static void clearThreadLocal()
    {
      THREADLOCAL_FORMATS.remove();
    }
    
    public static SimpleDateFormat formatFor(String paramString)
    {
      Object localObject2 = (Map)((SoftReference)THREADLOCAL_FORMATS.get()).get();
      Object localObject1 = localObject2;
      if (localObject2 == null)
      {
        localObject1 = new HashMap();
        THREADLOCAL_FORMATS.set(new SoftReference(localObject1));
      }
      SimpleDateFormat localSimpleDateFormat = (SimpleDateFormat)((Map)localObject1).get(paramString);
      localObject2 = localSimpleDateFormat;
      if (localSimpleDateFormat == null)
      {
        localObject2 = new SimpleDateFormat(paramString, Locale.US);
        ((SimpleDateFormat)localObject2).setTimeZone(TimeZone.getTimeZone("GMT"));
        ((Map)localObject1).put(paramString, localObject2);
      }
      return localObject2;
    }
  }
}
