package com.adobe.creativesdk.foundation.internal.storage.model.util;

public class AdobeStorageLastPathComponentUtil
{
  public static String getLastPathComponent(String paramString)
  {
    if (paramString != null) {
      return paramString.replaceFirst(".*/([^/?]+).*", "$1");
    }
    return null;
  }
  
  public static String getRelativeTo(String paramString1, String paramString2)
  {
    String str = paramString1;
    if (paramString1.startsWith("/")) {
      str = paramString1.substring(1);
    }
    paramString1 = paramString2;
    if (paramString2.endsWith("/")) {
      paramString1 = paramString2.substring(0, paramString2.lastIndexOf("/"));
    }
    return paramString1 + "/" + str;
  }
  
  public static String stringByDeletingLastPathComponent(String paramString)
  {
    String str2 = getLastPathComponent(paramString);
    String str1 = str2;
    if (paramString.endsWith("/")) {
      str1 = str2 + "/";
    }
    return paramString.replace(str1, "");
  }
}
