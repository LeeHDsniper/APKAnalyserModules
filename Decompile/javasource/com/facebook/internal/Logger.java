package com.facebook.internal;

import android.util.Log;
import com.facebook.LoggingBehavior;
import com.facebook.Settings;
import java.util.HashMap;

public class Logger
{
  private static final HashMap<String, String> stringsToReplace = new HashMap();
  private final LoggingBehavior behavior;
  private StringBuilder contents;
  private int priority = 3;
  private final String tag;
  
  public Logger(LoggingBehavior paramLoggingBehavior, String paramString)
  {
    Validate.notNullOrEmpty(paramString, "tag");
    behavior = paramLoggingBehavior;
    tag = ("FacebookSDK." + paramString);
    contents = new StringBuilder();
  }
  
  public static void log(LoggingBehavior paramLoggingBehavior, int paramInt, String paramString1, String paramString2)
  {
    if (Settings.isLoggingBehaviorEnabled(paramLoggingBehavior))
    {
      String str = replaceStrings(paramString2);
      paramString2 = paramString1;
      if (!paramString1.startsWith("FacebookSDK.")) {
        paramString2 = "FacebookSDK." + paramString1;
      }
      Log.println(paramInt, paramString2, str);
      if (paramLoggingBehavior == LoggingBehavior.DEVELOPER_ERRORS) {
        new Exception().printStackTrace();
      }
    }
  }
  
  public static void log(LoggingBehavior paramLoggingBehavior, String paramString1, String paramString2)
  {
    log(paramLoggingBehavior, 3, paramString1, paramString2);
  }
  
  public static void log(LoggingBehavior paramLoggingBehavior, String paramString1, String paramString2, Object... paramVarArgs)
  {
    if (Settings.isLoggingBehaviorEnabled(paramLoggingBehavior)) {
      log(paramLoggingBehavior, 3, paramString1, String.format(paramString2, paramVarArgs));
    }
  }
  
  public static void registerAccessToken(String paramString)
  {
    try
    {
      if (!Settings.isLoggingBehaviorEnabled(LoggingBehavior.INCLUDE_ACCESS_TOKENS)) {
        registerStringToReplace(paramString, "ACCESS_TOKEN_REMOVED");
      }
      return;
    }
    finally
    {
      paramString = finally;
      throw paramString;
    }
  }
  
  public static void registerStringToReplace(String paramString1, String paramString2)
  {
    try
    {
      stringsToReplace.put(paramString1, paramString2);
      return;
    }
    finally
    {
      paramString1 = finally;
      throw paramString1;
    }
  }
  
  /* Error */
  private static String replaceStrings(String paramString)
  {
    // Byte code:
    //   0: ldc 2
    //   2: monitorenter
    //   3: getstatic 24	com/facebook/internal/Logger:stringsToReplace	Ljava/util/HashMap;
    //   6: invokevirtual 118	java/util/HashMap:entrySet	()Ljava/util/Set;
    //   9: invokeinterface 124 1 0
    //   14: astore_2
    //   15: aload_2
    //   16: invokeinterface 130 1 0
    //   21: istore_1
    //   22: iload_1
    //   23: ifne +8 -> 31
    //   26: ldc 2
    //   28: monitorexit
    //   29: aload_0
    //   30: areturn
    //   31: aload_2
    //   32: invokeinterface 134 1 0
    //   37: checkcast 136	java/util/Map$Entry
    //   40: astore_3
    //   41: aload_0
    //   42: aload_3
    //   43: invokeinterface 139 1 0
    //   48: checkcast 141	java/lang/CharSequence
    //   51: aload_3
    //   52: invokeinterface 144 1 0
    //   57: checkcast 141	java/lang/CharSequence
    //   60: invokevirtual 148	java/lang/String:replace	(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    //   63: astore_0
    //   64: goto -49 -> 15
    //   67: astore_0
    //   68: ldc 2
    //   70: monitorexit
    //   71: aload_0
    //   72: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	73	0	paramString	String
    //   21	2	1	bool	boolean
    //   14	18	2	localIterator	java.util.Iterator
    //   40	12	3	localEntry	java.util.Map.Entry
    // Exception table:
    //   from	to	target	type
    //   3	15	67	finally
    //   15	22	67	finally
    //   31	64	67	finally
  }
  
  private boolean shouldLog()
  {
    return Settings.isLoggingBehaviorEnabled(behavior);
  }
  
  public void append(String paramString)
  {
    if (shouldLog()) {
      contents.append(paramString);
    }
  }
  
  public void append(String paramString, Object... paramVarArgs)
  {
    if (shouldLog()) {
      contents.append(String.format(paramString, paramVarArgs));
    }
  }
  
  public void appendKeyValue(String paramString, Object paramObject)
  {
    append("  %s:\t%s\n", new Object[] { paramString, paramObject });
  }
  
  public void log()
  {
    logString(contents.toString());
    contents = new StringBuilder();
  }
  
  public void logString(String paramString)
  {
    log(behavior, priority, tag, paramString);
  }
}
