package org.apache.http.impl.cookie;

import java.util.ArrayList;
import java.util.List;
import org.apache.http.FormattedHeader;
import org.apache.http.Header;
import org.apache.http.HeaderElement;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.cookie.Cookie;
import org.apache.http.cookie.CookieOrigin;
import org.apache.http.cookie.MalformedCookieException;
import org.apache.http.message.BufferedHeader;
import org.apache.http.message.ParserCursor;
import org.apache.http.util.Args;
import org.apache.http.util.CharArrayBuffer;

@NotThreadSafe
public class NetscapeDraftSpec
  extends CookieSpecBase
{
  protected static final String EXPIRES_PATTERN = "EEE, dd-MMM-yy HH:mm:ss z";
  private final String[] datepatterns;
  
  public NetscapeDraftSpec()
  {
    this(null);
  }
  
  public NetscapeDraftSpec(String[] paramArrayOfString)
  {
    if (paramArrayOfString != null) {}
    for (datepatterns = ((String[])paramArrayOfString.clone());; datepatterns = new String[] { "EEE, dd-MMM-yy HH:mm:ss z" })
    {
      registerAttribHandler("path", new BasicPathHandler());
      registerAttribHandler("domain", new NetscapeDomainHandler());
      registerAttribHandler("max-age", new BasicMaxAgeHandler());
      registerAttribHandler("secure", new BasicSecureHandler());
      registerAttribHandler("comment", new BasicCommentHandler());
      registerAttribHandler("expires", new BasicExpiresHandler(datepatterns));
      return;
    }
  }
  
  public List<Header> formatCookies(List<Cookie> paramList)
  {
    Args.notEmpty(paramList, "List of cookies");
    CharArrayBuffer localCharArrayBuffer = new CharArrayBuffer(paramList.size() * 20);
    localCharArrayBuffer.append("Cookie");
    localCharArrayBuffer.append(": ");
    int i = 0;
    while (i < paramList.size())
    {
      Object localObject = (Cookie)paramList.get(i);
      if (i > 0) {
        localCharArrayBuffer.append("; ");
      }
      localCharArrayBuffer.append(((Cookie)localObject).getName());
      localObject = ((Cookie)localObject).getValue();
      if (localObject != null)
      {
        localCharArrayBuffer.append("=");
        localCharArrayBuffer.append((String)localObject);
      }
      i += 1;
    }
    paramList = new ArrayList(1);
    paramList.add(new BufferedHeader(localCharArrayBuffer));
    return paramList;
  }
  
  public int getVersion()
  {
    return 0;
  }
  
  public Header getVersionHeader()
  {
    return null;
  }
  
  public List<Cookie> parse(Header paramHeader, CookieOrigin paramCookieOrigin)
    throws MalformedCookieException
  {
    Args.notNull(paramHeader, "Header");
    Args.notNull(paramCookieOrigin, "Cookie origin");
    if (!paramHeader.getName().equalsIgnoreCase("Set-Cookie")) {
      throw new MalformedCookieException("Unrecognized cookie header '" + paramHeader.toString() + "'");
    }
    NetscapeDraftHeaderParser localNetscapeDraftHeaderParser = NetscapeDraftHeaderParser.DEFAULT;
    Object localObject;
    if ((paramHeader instanceof FormattedHeader))
    {
      CharArrayBuffer localCharArrayBuffer = ((FormattedHeader)paramHeader).getBuffer();
      localObject = new ParserCursor(((FormattedHeader)paramHeader).getValuePos(), localCharArrayBuffer.length());
      paramHeader = localCharArrayBuffer;
    }
    for (;;)
    {
      return parse(new HeaderElement[] { localNetscapeDraftHeaderParser.parseHeader(paramHeader, (ParserCursor)localObject) }, paramCookieOrigin);
      localObject = paramHeader.getValue();
      if (localObject == null) {
        throw new MalformedCookieException("Header value is null");
      }
      paramHeader = new CharArrayBuffer(((String)localObject).length());
      paramHeader.append((String)localObject);
      localObject = new ParserCursor(0, paramHeader.length());
    }
  }
  
  public String toString()
  {
    return "netscape";
  }
}
