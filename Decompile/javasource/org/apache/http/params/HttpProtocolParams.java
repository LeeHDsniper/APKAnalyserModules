package org.apache.http.params;

import java.nio.charset.Charset;
import java.nio.charset.CodingErrorAction;
import org.apache.http.HttpVersion;
import org.apache.http.ProtocolVersion;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.Args;

@Deprecated
public final class HttpProtocolParams
  implements CoreProtocolPNames
{
  private HttpProtocolParams() {}
  
  public static String getContentCharset(HttpParams paramHttpParams)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    String str = (String)paramHttpParams.getParameter("http.protocol.content-charset");
    paramHttpParams = str;
    if (str == null) {
      paramHttpParams = HTTP.DEF_CONTENT_CHARSET.name();
    }
    return paramHttpParams;
  }
  
  public static String getHttpElementCharset(HttpParams paramHttpParams)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    String str = (String)paramHttpParams.getParameter("http.protocol.element-charset");
    paramHttpParams = str;
    if (str == null) {
      paramHttpParams = HTTP.DEF_PROTOCOL_CHARSET.name();
    }
    return paramHttpParams;
  }
  
  public static CodingErrorAction getMalformedInputAction(HttpParams paramHttpParams)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    paramHttpParams = paramHttpParams.getParameter("http.malformed.input.action");
    if (paramHttpParams == null) {
      return CodingErrorAction.REPORT;
    }
    return (CodingErrorAction)paramHttpParams;
  }
  
  public static CodingErrorAction getUnmappableInputAction(HttpParams paramHttpParams)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    paramHttpParams = paramHttpParams.getParameter("http.unmappable.input.action");
    if (paramHttpParams == null) {
      return CodingErrorAction.REPORT;
    }
    return (CodingErrorAction)paramHttpParams;
  }
  
  public static String getUserAgent(HttpParams paramHttpParams)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    return (String)paramHttpParams.getParameter("http.useragent");
  }
  
  public static ProtocolVersion getVersion(HttpParams paramHttpParams)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    paramHttpParams = paramHttpParams.getParameter("http.protocol.version");
    if (paramHttpParams == null) {
      return HttpVersion.HTTP_1_1;
    }
    return (ProtocolVersion)paramHttpParams;
  }
  
  public static void setContentCharset(HttpParams paramHttpParams, String paramString)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    paramHttpParams.setParameter("http.protocol.content-charset", paramString);
  }
  
  public static void setHttpElementCharset(HttpParams paramHttpParams, String paramString)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    paramHttpParams.setParameter("http.protocol.element-charset", paramString);
  }
  
  public static void setMalformedInputAction(HttpParams paramHttpParams, CodingErrorAction paramCodingErrorAction)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    paramHttpParams.setParameter("http.malformed.input.action", paramCodingErrorAction);
  }
  
  public static void setUnmappableInputAction(HttpParams paramHttpParams, CodingErrorAction paramCodingErrorAction)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    paramHttpParams.setParameter("http.unmappable.input.action", paramCodingErrorAction);
  }
  
  public static void setUseExpectContinue(HttpParams paramHttpParams, boolean paramBoolean)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    paramHttpParams.setBooleanParameter("http.protocol.expect-continue", paramBoolean);
  }
  
  public static void setUserAgent(HttpParams paramHttpParams, String paramString)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    paramHttpParams.setParameter("http.useragent", paramString);
  }
  
  public static void setVersion(HttpParams paramHttpParams, ProtocolVersion paramProtocolVersion)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    paramHttpParams.setParameter("http.protocol.version", paramProtocolVersion);
  }
  
  public static boolean useExpectContinue(HttpParams paramHttpParams)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    return paramHttpParams.getBooleanParameter("http.protocol.expect-continue", false);
  }
}
