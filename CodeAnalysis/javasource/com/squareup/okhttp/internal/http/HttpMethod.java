package com.squareup.okhttp.internal.http;

import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.Set;

public final class HttpMethod
{
  public static final Set<String> METHODS = new LinkedHashSet(Arrays.asList(new String[] { "OPTIONS", "GET", "HEAD", "POST", "PUT", "DELETE", "TRACE", "PATCH" }));
  
  public static boolean invalidatesCache(String paramString)
  {
    return (paramString.equals("POST")) || (paramString.equals("PATCH")) || (paramString.equals("PUT")) || (paramString.equals("DELETE"));
  }
  
  public static boolean permitsRequestBody(String paramString)
  {
    return (requiresRequestBody(paramString)) || (paramString.equals("DELETE"));
  }
  
  public static boolean requiresRequestBody(String paramString)
  {
    return (paramString.equals("POST")) || (paramString.equals("PUT")) || (paramString.equals("PATCH"));
  }
}
