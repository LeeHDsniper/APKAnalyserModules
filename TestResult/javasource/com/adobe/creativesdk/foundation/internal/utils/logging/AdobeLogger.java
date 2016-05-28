package com.adobe.creativesdk.foundation.internal.utils.logging;

import android.content.Context;
import android.util.Log;
import com.adobe.creativesdk.foundation.internal.common.AdobeCommonApplicationContextHolder;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class AdobeLogger
{
  private static boolean consoleLoggingEnabled;
  private static boolean fileLoggingEnabled = false;
  private static PrintWriter pr;
  
  static
  {
    consoleLoggingEnabled = false;
    File localFile;
    if (fileLoggingEnabled) {
      localFile = new File(AdobeCommonApplicationContextHolder.getSharedApplicationContextHolder().getApplicationContext().getCacheDir(), "log.txt");
    }
    try
    {
      pr = new PrintWriter(new FileWriter(localFile), true);
      return;
    }
    catch (IOException localIOException)
    {
      localIOException.printStackTrace();
    }
  }
  
  private static int convertToAndroidLogLevel(Level paramLevel)
  {
    switch (1.$SwitchMap$com$adobe$creativesdk$foundation$internal$utils$logging$Level[paramLevel.ordinal()])
    {
    default: 
      return 3;
    case 1: 
      return 3;
    case 2: 
      return 4;
    case 4: 
      return 5;
    }
    return 6;
  }
  
  private static void debug(String paramString1, String paramString2, Throwable paramThrowable)
  {
    Log.d(paramString1, paramString2, paramThrowable);
    writeToFile(paramString1, paramString2, paramThrowable);
  }
  
  private static void error(String paramString1, String paramString2, Throwable paramThrowable)
  {
    Log.d(paramString1, paramString2, paramThrowable);
    writeToFile(paramString1, paramString2, paramThrowable);
  }
  
  private static void info(String paramString1, String paramString2, Throwable paramThrowable)
  {
    Log.d(paramString1, paramString2, paramThrowable);
    writeToFile(paramString1, paramString2, paramThrowable);
  }
  
  public static void log(Level paramLevel, String paramString1, String paramString2)
  {
    if (consoleLoggingEnabled) {
      log(paramLevel, paramString1, paramString2, (Exception)null);
    }
  }
  
  public static void log(Level paramLevel, String paramString1, String paramString2, AdobeCSDKException paramAdobeCSDKException)
  {
    int i = convertToAndroidLogLevel(paramLevel);
    try
    {
      if (!Log.isLoggable(paramString1, i)) {
        return;
      }
      switch (1.$SwitchMap$com$adobe$creativesdk$foundation$internal$utils$logging$Level[paramLevel.ordinal()])
      {
      case 1: 
        debug(paramString1, paramString2, null);
        debug(paramString1, paramAdobeCSDKException.toString(), null);
        return;
      }
    }
    catch (Exception paramLevel)
    {
      paramLevel.printStackTrace();
      return;
    }
    info(paramString1, paramString2, null);
    info(paramString1, paramAdobeCSDKException.toString(), null);
    return;
    error(paramString1, paramString2, null);
    error(paramString1, paramAdobeCSDKException.toString(), null);
    return;
    warn(paramString1, paramString2, null);
    warn(paramString1, paramAdobeCSDKException.toString(), null);
    return;
  }
  
  public static void log(Level paramLevel, String paramString1, String paramString2, Throwable paramThrowable)
  {
    if (!consoleLoggingEnabled) {
      return;
    }
    int i = convertToAndroidLogLevel(paramLevel);
    for (;;)
    {
      try
      {
        paramString1 = paramString1.substring(paramString1.lastIndexOf(".") + 1);
        if (paramString1.length() <= 23)
        {
          if (!Log.isLoggable(paramString1, i)) {
            break;
          }
          switch (1.$SwitchMap$com$adobe$creativesdk$foundation$internal$utils$logging$Level[paramLevel.ordinal()])
          {
          case 1: 
            debug(paramString1, paramString2, paramThrowable);
            return;
          }
        }
      }
      catch (Exception paramLevel)
      {
        paramLevel.printStackTrace();
        return;
      }
      paramString1 = paramString1.substring(0, 23);
    }
    info(paramString1, paramString2, paramThrowable);
    return;
    error(paramString1, paramString2, paramThrowable);
    return;
    warn(paramString1, paramString2, paramThrowable);
    return;
  }
  
  private static void warn(String paramString1, String paramString2, Throwable paramThrowable)
  {
    Log.w(paramString1, paramString2, paramThrowable);
    writeToFile(paramString1, paramString2, paramThrowable);
  }
  
  private static void writeToFile(String paramString1, String paramString2, Throwable paramThrowable)
  {
    if (pr != null)
    {
      pr.println(paramString1 + ":" + paramString2);
      if (paramThrowable != null) {
        paramThrowable.printStackTrace(pr);
      }
    }
  }
}
