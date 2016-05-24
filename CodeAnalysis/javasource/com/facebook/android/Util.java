package com.facebook.android;

import android.os.Bundle;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLDecoder;

public final class Util
{
  @Deprecated
  public static Bundle decodeUrl(String paramString)
  {
    int i = 0;
    Bundle localBundle = new Bundle();
    int j;
    if (paramString != null)
    {
      paramString = paramString.split("&");
      j = paramString.length;
    }
    for (;;)
    {
      if (i >= j) {
        return localBundle;
      }
      String[] arrayOfString = paramString[i].split("=");
      try
      {
        if (arrayOfString.length == 2) {
          localBundle.putString(URLDecoder.decode(arrayOfString[0], "UTF-8"), URLDecoder.decode(arrayOfString[1], "UTF-8"));
        } else if (arrayOfString.length == 1) {
          localBundle.putString(URLDecoder.decode(arrayOfString[0], "UTF-8"), "");
        }
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException) {}
      i += 1;
    }
  }
  
  @Deprecated
  public static Bundle parseUrl(String paramString)
  {
    paramString = paramString.replace("fbconnect", "http");
    try
    {
      paramString = new URL(paramString);
      Bundle localBundle = decodeUrl(paramString.getQuery());
      localBundle.putAll(decodeUrl(paramString.getRef()));
      return localBundle;
    }
    catch (MalformedURLException paramString) {}
    return new Bundle();
  }
}
