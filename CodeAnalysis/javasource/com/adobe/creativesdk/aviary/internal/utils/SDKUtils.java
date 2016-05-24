package com.adobe.creativesdk.aviary.internal.utils;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.os.Bundle;

public final class SDKUtils
{
  public static final int IAP_RELEASE_VERSION = 212;
  static final String LOG_TAG = "SDKUtils";
  private static int sCdsDebug = -1;
  private static final Object sCdsDebugLock = new Object();
  
  private SDKUtils() {}
  
  public static boolean getCDSDebug(Context paramContext)
  {
    synchronized (sCdsDebugLock)
    {
      if (sCdsDebug == -1)
      {
        if (PackageManagerUtils.isDebugVersion(paramContext)) {
          break label51;
        }
        i = 1;
        if (i != 0) {
          break label61;
        }
        if (!ApiKeyReader.isCdsReleaseFromMetadata(paramContext, false)) {
          break label56;
        }
      }
      label51:
      label56:
      for (int i = 0;; i = 1)
      {
        sCdsDebug = i;
        if (sCdsDebug != 1) {
          break label73;
        }
        return true;
        i = 0;
        break;
      }
      label61:
      sCdsDebug = 0;
    }
    label73:
    return false;
  }
  
  public static String getMetadataValue(Context paramContext, String paramString1, String paramString2)
  {
    return ApiKeyReader.getMetadataValue(paramContext, paramString1, paramString2);
  }
  
  private static final class ApiKeyReader
  {
    private static final String METADATA_CDS = "com.aviary.android.feather.v1.CDS_RELEASE";
    
    private ApiKeyReader() {}
    
    public static String getMetadataValue(Context paramContext, String paramString1, String paramString2)
    {
      paramContext = getApplicationInfometaData;
      if (paramContext == null) {}
      while (!paramContext.containsKey(paramString1)) {
        return paramString2;
      }
      return paramContext.getString(paramString1);
    }
    
    static boolean isCdsReleaseFromMetadata(Context paramContext, boolean paramBoolean)
    {
      paramContext = getApplicationInfometaData;
      boolean bool = paramBoolean;
      if (paramContext != null) {
        bool = paramContext.getBoolean("com.aviary.android.feather.v1.CDS_RELEASE", paramBoolean);
      }
      return bool;
    }
  }
}
