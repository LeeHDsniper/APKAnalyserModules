package org.apache.http.message;

import java.util.Locale;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpVersion;
import org.apache.http.ProtocolVersion;
import org.apache.http.ReasonPhraseCatalog;
import org.apache.http.StatusLine;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.util.Args;

@NotThreadSafe
public class BasicHttpResponse
  extends AbstractHttpMessage
  implements HttpResponse
{
  private int code;
  private HttpEntity entity;
  private Locale locale;
  private final ReasonPhraseCatalog reasonCatalog;
  private String reasonPhrase;
  private StatusLine statusline;
  private ProtocolVersion ver;
  
  public BasicHttpResponse(ProtocolVersion paramProtocolVersion, int paramInt, String paramString)
  {
    Args.notNegative(paramInt, "Status code");
    statusline = null;
    ver = paramProtocolVersion;
    code = paramInt;
    reasonPhrase = paramString;
    reasonCatalog = null;
    locale = null;
  }
  
  public BasicHttpResponse(StatusLine paramStatusLine)
  {
    statusline = ((StatusLine)Args.notNull(paramStatusLine, "Status line"));
    ver = paramStatusLine.getProtocolVersion();
    code = paramStatusLine.getStatusCode();
    reasonPhrase = paramStatusLine.getReasonPhrase();
    reasonCatalog = null;
    locale = null;
  }
  
  @Deprecated
  public BasicHttpResponse(StatusLine paramStatusLine, ReasonPhraseCatalog paramReasonPhraseCatalog, Locale paramLocale)
  {
    statusline = ((StatusLine)Args.notNull(paramStatusLine, "Status line"));
    ver = paramStatusLine.getProtocolVersion();
    code = paramStatusLine.getStatusCode();
    reasonPhrase = paramStatusLine.getReasonPhrase();
    reasonCatalog = paramReasonPhraseCatalog;
    locale = paramLocale;
  }
  
  public HttpEntity getEntity()
  {
    return entity;
  }
  
  @Deprecated
  public Locale getLocale()
  {
    return locale;
  }
  
  public ProtocolVersion getProtocolVersion()
  {
    return ver;
  }
  
  @Deprecated
  protected String getReason(int paramInt)
  {
    if (reasonCatalog != null)
    {
      ReasonPhraseCatalog localReasonPhraseCatalog = reasonCatalog;
      if (locale != null) {}
      for (Locale localLocale = locale;; localLocale = Locale.getDefault()) {
        return localReasonPhraseCatalog.getReason(paramInt, localLocale);
      }
    }
    return null;
  }
  
  public StatusLine getStatusLine()
  {
    if (statusline == null) {
      if (ver == null) {
        break label44;
      }
    }
    label44:
    for (Object localObject = ver;; localObject = HttpVersion.HTTP_1_1)
    {
      statusline = new BasicStatusLine((ProtocolVersion)localObject, code, reasonPhrase);
      return statusline;
    }
  }
  
  public void setEntity(HttpEntity paramHttpEntity)
  {
    entity = paramHttpEntity;
  }
  
  @Deprecated
  public void setLocale(Locale paramLocale)
  {
    locale = ((Locale)Args.notNull(paramLocale, "Locale"));
    statusline = null;
  }
  
  public void setReasonPhrase(String paramString)
  {
    statusline = null;
    reasonPhrase = paramString;
  }
  
  public void setStatusCode(int paramInt)
  {
    Args.notNegative(paramInt, "Status code");
    statusline = null;
    code = paramInt;
  }
  
  public void setStatusLine(ProtocolVersion paramProtocolVersion, int paramInt)
  {
    Args.notNegative(paramInt, "Status code");
    statusline = null;
    ver = paramProtocolVersion;
    code = paramInt;
    reasonPhrase = null;
  }
  
  public void setStatusLine(ProtocolVersion paramProtocolVersion, int paramInt, String paramString)
  {
    Args.notNegative(paramInt, "Status code");
    statusline = null;
    ver = paramProtocolVersion;
    code = paramInt;
    reasonPhrase = paramString;
  }
  
  public void setStatusLine(StatusLine paramStatusLine)
  {
    statusline = ((StatusLine)Args.notNull(paramStatusLine, "Status line"));
    ver = paramStatusLine.getProtocolVersion();
    code = paramStatusLine.getStatusCode();
    reasonPhrase = paramStatusLine.getReasonPhrase();
  }
  
  public String toString()
  {
    StatusLine localStatusLine = getStatusLine();
    return localStatusLine + " " + headergroup;
  }
}
