package org.apache.http.impl;

import org.apache.http.HttpRequest;
import org.apache.http.HttpRequestFactory;
import org.apache.http.MethodNotSupportedException;
import org.apache.http.RequestLine;
import org.apache.http.annotation.Immutable;
import org.apache.http.message.BasicHttpEntityEnclosingRequest;
import org.apache.http.message.BasicHttpRequest;
import org.apache.http.util.Args;

@Immutable
public class DefaultHttpRequestFactory
  implements HttpRequestFactory
{
  public static final DefaultHttpRequestFactory INSTANCE = new DefaultHttpRequestFactory();
  private static final String[] RFC2616_COMMON_METHODS = { "GET" };
  private static final String[] RFC2616_ENTITY_ENC_METHODS = { "POST", "PUT" };
  private static final String[] RFC2616_SPECIAL_METHODS = { "HEAD", "OPTIONS", "DELETE", "TRACE", "CONNECT" };
  
  public DefaultHttpRequestFactory() {}
  
  private static boolean isOneOf(String[] paramArrayOfString, String paramString)
  {
    int j = paramArrayOfString.length;
    int i = 0;
    while (i < j)
    {
      if (paramArrayOfString[i].equalsIgnoreCase(paramString)) {
        return true;
      }
      i += 1;
    }
    return false;
  }
  
  public HttpRequest newHttpRequest(String paramString1, String paramString2)
    throws MethodNotSupportedException
  {
    if (isOneOf(RFC2616_COMMON_METHODS, paramString1)) {
      return new BasicHttpRequest(paramString1, paramString2);
    }
    if (isOneOf(RFC2616_ENTITY_ENC_METHODS, paramString1)) {
      return new BasicHttpEntityEnclosingRequest(paramString1, paramString2);
    }
    if (isOneOf(RFC2616_SPECIAL_METHODS, paramString1)) {
      return new BasicHttpRequest(paramString1, paramString2);
    }
    throw new MethodNotSupportedException(paramString1 + " method not supported");
  }
  
  public HttpRequest newHttpRequest(RequestLine paramRequestLine)
    throws MethodNotSupportedException
  {
    Args.notNull(paramRequestLine, "Request line");
    String str = paramRequestLine.getMethod();
    if (isOneOf(RFC2616_COMMON_METHODS, str)) {
      return new BasicHttpRequest(paramRequestLine);
    }
    if (isOneOf(RFC2616_ENTITY_ENC_METHODS, str)) {
      return new BasicHttpEntityEnclosingRequest(paramRequestLine);
    }
    if (isOneOf(RFC2616_SPECIAL_METHODS, str)) {
      return new BasicHttpRequest(paramRequestLine);
    }
    throw new MethodNotSupportedException(str + " method not supported");
  }
}
