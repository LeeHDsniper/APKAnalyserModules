package com.adobe.creativesdk.foundation.adobeinternal.storage.dcx;

public class AdobeDCXUtils
{
  private static AdobeDCXLocalStorageCopyOnWrite sharedLocalStorageCopyOnWrite = null;
  private static AdobeDCXLocalStorageDirectories sharedLocalStorageDirectories = null;
  
  public static long getLongVal(Object paramObject)
  {
    return ((Number)paramObject).longValue();
  }
  
  public static String stringByAppendingLastPathComponent(String paramString1, String paramString2)
  {
    if ((paramString1 == null) || (paramString1.isEmpty())) {
      return paramString2;
    }
    if (paramString1.endsWith("/")) {
      return paramString1 + paramString2;
    }
    return paramString1 + "/" + paramString2;
  }
}
