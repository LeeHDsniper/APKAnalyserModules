package org.apache.http.impl.cookie;

import java.util.Iterator;
import java.util.List;
import org.apache.http.FormattedHeader;
import org.apache.http.Header;
import org.apache.http.HeaderElement;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.cookie.Cookie;
import org.apache.http.cookie.CookieOrigin;
import org.apache.http.cookie.CookieSpec;
import org.apache.http.cookie.MalformedCookieException;
import org.apache.http.cookie.SetCookie2;
import org.apache.http.message.ParserCursor;
import org.apache.http.util.Args;
import org.apache.http.util.CharArrayBuffer;

@NotThreadSafe
public class BestMatchSpec
  implements CookieSpec
{
  private BrowserCompatSpec compat;
  private final String[] datepatterns;
  private RFC2109Spec obsoleteStrict;
  private final boolean oneHeader;
  private RFC2965Spec strict;
  
  public BestMatchSpec()
  {
    this(null, false);
  }
  
  public BestMatchSpec(String[] paramArrayOfString, boolean paramBoolean)
  {
    if (paramArrayOfString == null) {}
    for (paramArrayOfString = null;; paramArrayOfString = (String[])paramArrayOfString.clone())
    {
      datepatterns = paramArrayOfString;
      oneHeader = paramBoolean;
      return;
    }
  }
  
  private BrowserCompatSpec getCompat()
  {
    if (compat == null) {
      compat = new BrowserCompatSpec(datepatterns);
    }
    return compat;
  }
  
  private RFC2109Spec getObsoleteStrict()
  {
    if (obsoleteStrict == null) {
      obsoleteStrict = new RFC2109Spec(datepatterns, oneHeader);
    }
    return obsoleteStrict;
  }
  
  private RFC2965Spec getStrict()
  {
    if (strict == null) {
      strict = new RFC2965Spec(datepatterns, oneHeader);
    }
    return strict;
  }
  
  public List<Header> formatCookies(List<Cookie> paramList)
  {
    Args.notNull(paramList, "List of cookies");
    int i = Integer.MAX_VALUE;
    int j = 1;
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext())
    {
      Cookie localCookie = (Cookie)localIterator.next();
      int k = j;
      if (!(localCookie instanceof SetCookie2)) {
        k = 0;
      }
      j = k;
      if (localCookie.getVersion() < i)
      {
        i = localCookie.getVersion();
        j = k;
      }
    }
    if (i > 0)
    {
      if (j != 0) {
        return getStrict().formatCookies(paramList);
      }
      return getObsoleteStrict().formatCookies(paramList);
    }
    return getCompat().formatCookies(paramList);
  }
  
  public int getVersion()
  {
    return getStrict().getVersion();
  }
  
  public Header getVersionHeader()
  {
    return getStrict().getVersionHeader();
  }
  
  public boolean match(Cookie paramCookie, CookieOrigin paramCookieOrigin)
  {
    Args.notNull(paramCookie, "Cookie");
    Args.notNull(paramCookieOrigin, "Cookie origin");
    if (paramCookie.getVersion() > 0)
    {
      if ((paramCookie instanceof SetCookie2)) {
        return getStrict().match(paramCookie, paramCookieOrigin);
      }
      return getObsoleteStrict().match(paramCookie, paramCookieOrigin);
    }
    return getCompat().match(paramCookie, paramCookieOrigin);
  }
  
  public List<Cookie> parse(Header paramHeader, CookieOrigin paramCookieOrigin)
    throws MalformedCookieException
  {
    Args.notNull(paramHeader, "Header");
    Args.notNull(paramCookieOrigin, "Cookie origin");
    Object localObject = paramHeader.getElements();
    int k = 0;
    int j = 0;
    int m = localObject.length;
    int i = 0;
    CharArrayBuffer localCharArrayBuffer;
    while (i < m)
    {
      localCharArrayBuffer = localObject[i];
      if (localCharArrayBuffer.getParameterByName("version") != null) {
        k = 1;
      }
      if (localCharArrayBuffer.getParameterByName("expires") != null) {
        j = 1;
      }
      i += 1;
    }
    if ((j != 0) || (k == 0))
    {
      NetscapeDraftHeaderParser localNetscapeDraftHeaderParser = NetscapeDraftHeaderParser.DEFAULT;
      if ((paramHeader instanceof FormattedHeader))
      {
        localCharArrayBuffer = ((FormattedHeader)paramHeader).getBuffer();
        localObject = new ParserCursor(((FormattedHeader)paramHeader).getValuePos(), localCharArrayBuffer.length());
        paramHeader = localCharArrayBuffer;
      }
      for (;;)
      {
        paramHeader = localNetscapeDraftHeaderParser.parseHeader(paramHeader, (ParserCursor)localObject);
        return getCompat().parse(new HeaderElement[] { paramHeader }, paramCookieOrigin);
        localObject = paramHeader.getValue();
        if (localObject == null) {
          throw new MalformedCookieException("Header value is null");
        }
        paramHeader = new CharArrayBuffer(((String)localObject).length());
        paramHeader.append((String)localObject);
        localObject = new ParserCursor(0, paramHeader.length());
      }
    }
    if ("Set-Cookie2".equals(paramHeader.getName())) {
      return getStrict().parse((HeaderElement[])localObject, paramCookieOrigin);
    }
    return getObsoleteStrict().parse((HeaderElement[])localObject, paramCookieOrigin);
  }
  
  public String toString()
  {
    return "best-match";
  }
  
  public void validate(Cookie paramCookie, CookieOrigin paramCookieOrigin)
    throws MalformedCookieException
  {
    Args.notNull(paramCookie, "Cookie");
    Args.notNull(paramCookieOrigin, "Cookie origin");
    if (paramCookie.getVersion() > 0)
    {
      if ((paramCookie instanceof SetCookie2))
      {
        getStrict().validate(paramCookie, paramCookieOrigin);
        return;
      }
      getObsoleteStrict().validate(paramCookie, paramCookieOrigin);
      return;
    }
    getCompat().validate(paramCookie, paramCookieOrigin);
  }
}
