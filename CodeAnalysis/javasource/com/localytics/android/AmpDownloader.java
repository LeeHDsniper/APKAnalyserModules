package com.localytics.android;

import android.content.Context;
import android.util.Log;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.net.URLConnection;
import java.util.Map;

class AmpDownloader
{
  public static String downloadFile(String paramString1, String paramString2, boolean paramBoolean)
  {
    String str = paramString2;
    File localFile = new File(paramString2);
    if ((localFile.exists()) && (!paramBoolean))
    {
      if (Constants.IS_LOGGABLE) {
        Log.w("Localytics", String.format("The file %s does exist and overwrite is turned off.", new Object[] { localFile.getAbsolutePath() }));
      }
      return paramString2;
    }
    Object localObject = localFile.getParentFile();
    if ((!((File)localObject).mkdirs()) && (!((File)localObject).isDirectory()))
    {
      if (Constants.IS_LOGGABLE) {
        Log.w("Localytics", String.format("Could not create the directory %s for saving file.", new Object[] { ((File)localObject).getAbsolutePath() }));
      }
      return null;
    }
    do
    {
      try
      {
        paramString2 = new File(String.format("%s_temp", new Object[] { paramString2 }));
        paramString2.createNewFile();
        paramString1 = new BufferedInputStream(new URL(paramString1).openConnection().getInputStream(), 16384);
        localObject = new FileOutputStream(paramString2.getPath());
        byte[] arrayOfByte = new byte[' '];
        for (;;)
        {
          int i = paramString1.read(arrayOfByte);
          if (i == -1) {
            break;
          }
          ((FileOutputStream)localObject).write(arrayOfByte, 0, i);
        }
        ((FileOutputStream)localObject).close();
      }
      catch (IOException paramString1)
      {
        if (Constants.IS_LOGGABLE) {
          Log.w("Localytics", "AMP campaign not found. Creating a new one.");
        }
        str = null;
        return str;
      }
    } while (paramString2.renameTo(localFile));
    paramString2.delete();
    return null;
  }
  
  public static String getAmpDataDirectory(Context paramContext, String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(paramContext.getFilesDir().getAbsolutePath());
    localStringBuilder.append(File.separator);
    localStringBuilder.append(".localytics");
    localStringBuilder.append(File.separator);
    localStringBuilder.append(paramString);
    return localStringBuilder.toString();
  }
  
  public static String getLocalFileURL(Context paramContext, String paramString, long paramLong, boolean paramBoolean)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(getAmpDataDirectory(paramContext, paramString));
    localStringBuilder.append(File.separator);
    if (paramBoolean) {
      localStringBuilder.append(String.format("amp_rule_%d.zip", new Object[] { Long.valueOf(paramLong) }));
    }
    for (;;)
    {
      return localStringBuilder.toString();
      localStringBuilder.append(String.format("amp_rule_%d", new Object[] { Long.valueOf(paramLong) }));
      paramContext = new File(localStringBuilder.toString());
      if (((!paramContext.exists()) || (!paramContext.isDirectory())) && (!paramContext.mkdirs()))
      {
        if (Constants.IS_LOGGABLE) {
          Log.w("Localytics", String.format("Could not create the directory %s for saving the HTML file.", new Object[] { paramContext.getAbsolutePath() }));
        }
        return null;
      }
      localStringBuilder.append(File.separator);
      localStringBuilder.append("index.html");
    }
  }
  
  public static String getRemoteFileURL(Map<String, Object> paramMap)
  {
    String str = JsonHelper.getSafeStringFromMap(paramMap, "devices");
    if (str.equals("tablet")) {
      return JsonHelper.getSafeStringFromMap(paramMap, "tablet_location");
    }
    if (str.equals("both")) {
      return JsonHelper.getSafeStringFromMap(paramMap, "phone_location");
    }
    return JsonHelper.getSafeStringFromMap(paramMap, "phone_location");
  }
}
