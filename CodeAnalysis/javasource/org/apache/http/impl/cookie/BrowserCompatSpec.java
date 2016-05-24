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
import org.apache.http.message.BasicHeaderElement;
import org.apache.http.message.BasicHeaderValueFormatter;
import org.apache.http.message.BufferedHeader;
import org.apache.http.message.ParserCursor;
import org.apache.http.util.Args;
import org.apache.http.util.CharArrayBuffer;

@NotThreadSafe
public class BrowserCompatSpec
  extends CookieSpecBase
{
  private static final String[] DEFAULT_DATE_PATTERNS = { "EEE, dd MMM yyyy HH:mm:ss zzz", "EEE, dd-MMM-yy HH:mm:ss zzz", "EEE MMM d HH:mm:ss yyyy", "EEE, dd-MMM-yyyy HH:mm:ss z", "EEE, dd-MMM-yyyy HH-mm-ss z", "EEE, dd MMM yy HH:mm:ss z", "EEE dd-MMM-yyyy HH:mm:ss z", "EEE dd MMM yyyy HH:mm:ss z", "EEE dd-MMM-yyyy HH-mm-ss z", "EEE dd-MMM-yy HH:mm:ss z", "EEE dd MMM yy HH:mm:ss z", "EEE,dd-MMM-yy HH:mm:ss z", "EEE,dd-MMM-yyyy HH:mm:ss z", "EEE, dd-MM-yyyy HH:mm:ss z" };
  private final String[] datepatterns;
  
  public BrowserCompatSpec()
  {
    this(null, BrowserCompatSpecFactory.SecurityLevel.SECURITYLEVEL_DEFAULT);
  }
  
  public BrowserCompatSpec(String[] paramArrayOfString)
  {
    this(paramArrayOfString, BrowserCompatSpecFactory.SecurityLevel.SECURITYLEVEL_DEFAULT);
  }
  
  public BrowserCompatSpec(String[] paramArrayOfString, BrowserCompatSpecFactory.SecurityLevel paramSecurityLevel)
  {
    if (paramArrayOfString != null) {}
    for (datepatterns = ((String[])paramArrayOfString.clone());; datepatterns = DEFAULT_DATE_PATTERNS) {
      switch (2.$SwitchMap$org$apache$http$impl$cookie$BrowserCompatSpecFactory$SecurityLevel[paramSecurityLevel.ordinal()])
      {
      default: 
        throw new RuntimeException("Unknown security level");
      }
    }
    registerAttribHandler("path", new BasicPathHandler());
    for (;;)
    {
      registerAttribHandler("domain", new BasicDomainHandler());
      registerAttribHandler("max-age", new BasicMaxAgeHandler());
      registerAttribHandler("secure", new BasicSecureHandler());
      registerAttribHandler("comment", new BasicCommentHandler());
      registerAttribHandler("expires", new BasicExpiresHandler(datepatterns));
      registerAttribHandler("version", new BrowserCompatVersionAttributeHandler());
      return;
      registerAttribHandler("path", new BasicPathHandler()
      {
        public void validate(Cookie paramAnonymousCookie, CookieOrigin paramAnonymousCookieOrigin)
          throws MalformedCookieException
        {}
      });
    }
  }
  
  public List<Header> formatCookies(List<Cookie> paramList)
  {
    Args.notEmpty(paramList, "List of cookies");
    CharArrayBuffer localCharArrayBuffer = new CharArrayBuffer(paramList.size() * 20);
    localCharArrayBuffer.append("Cookie");
    localCharArrayBuffer.append(": ");
    int i = 0;
    if (i < paramList.size())
    {
      Cookie localCookie = (Cookie)paramList.get(i);
      if (i > 0) {
        localCharArrayBuffer.append("; ");
      }
      String str1 = localCookie.getName();
      String str2 = localCookie.getValue();
      if ((localCookie.getVersion() > 0) && ((!str2.startsWith("\"")) || (!str2.endsWith("\"")))) {
        BasicHeaderValueFormatter.INSTANCE.formatHeaderElement(localCharArrayBuffer, new BasicHeaderElement(str1, str2), false);
      }
      for (;;)
      {
        i += 1;
        break;
        localCharArrayBuffer.append(str1);
        localCharArrayBuffer.append("=");
        if (str2 != null) {
          localCharArrayBuffer.append(str2);
        }
      }
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
    Object localObject1 = paramHeader.getElements();
    int k = 0;
    int j = 0;
    int m = localObject1.length;
    int i = 0;
    Object localObject2;
    while (i < m)
    {
      localObject2 = localObject1[i];
      if (((HeaderElement)localObject2).getParameterByName("version") != null) {
        k = 1;
      }
      if (((HeaderElement)localObject2).getParameterByName("expires") != null) {
        j = 1;
      }
      i += 1;
    }
    NetscapeDraftHeaderParser localNetscapeDraftHeaderParser;
    if ((j != 0) || (k == 0))
    {
      localNetscapeDraftHeaderParser = NetscapeDraftHeaderParser.DEFAULT;
      if (!(paramHeader instanceof FormattedHeader)) {
        break label222;
      }
      localObject2 = ((FormattedHeader)paramHeader).getBuffer();
      localObject1 = new ParserCursor(((FormattedHeader)paramHeader).getValuePos(), ((CharArrayBuffer)localObject2).length());
      paramHeader = (Header)localObject2;
    }
    for (;;)
    {
      localObject2 = new HeaderElement[1];
      localObject2[0] = localNetscapeDraftHeaderParser.parseHeader(paramHeader, (ParserCursor)localObject1);
      localObject1 = localObject2;
      return parse((HeaderElement[])localObject1, paramCookieOrigin);
      label222:
      localObject1 = paramHeader.getValue();
      if (localObject1 == null) {
        throw new MalformedCookieException("Header value is null");
      }
      paramHeader = new CharArrayBuffer(((String)localObject1).length());
      paramHeader.append((String)localObject1);
      localObject1 = new ParserCursor(0, paramHeader.length());
    }
  }
  
  public String toString()
  {
    return "compatibility";
  }
}
