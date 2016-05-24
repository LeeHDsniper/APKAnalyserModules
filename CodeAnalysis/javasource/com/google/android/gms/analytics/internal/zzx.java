package com.google.android.gms.analytics.internal;

import android.os.Build.VERSION;
import java.io.File;

public class zzx
{
  public static int version()
  {
    try
    {
      int i = Integer.parseInt(Build.VERSION.SDK);
      return i;
    }
    catch (NumberFormatException localNumberFormatException)
    {
      zzae.zzf("Invalid version number", Build.VERSION.SDK);
    }
    return 0;
  }
  
  public static boolean zzbj(String paramString)
  {
    if (version() < 9) {
      return false;
    }
    paramString = new File(paramString);
    paramString.setReadable(false, false);
    paramString.setWritable(false, false);
    paramString.setReadable(true, true);
    paramString.setWritable(true, true);
    return true;
  }
}
