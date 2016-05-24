package org.apache.http.impl.cookie;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import org.apache.http.Header;
import org.apache.http.HeaderElement;
import org.apache.http.NameValuePair;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.cookie.ClientCookie;
import org.apache.http.cookie.Cookie;
import org.apache.http.cookie.CookieAttributeHandler;
import org.apache.http.cookie.CookieOrigin;
import org.apache.http.cookie.MalformedCookieException;
import org.apache.http.cookie.SetCookie;
import org.apache.http.message.BufferedHeader;
import org.apache.http.util.Args;
import org.apache.http.util.CharArrayBuffer;

@NotThreadSafe
public class RFC2965Spec
  extends RFC2109Spec
{
  public RFC2965Spec()
  {
    this(null, false);
  }
  
  public RFC2965Spec(String[] paramArrayOfString, boolean paramBoolean)
  {
    super(paramArrayOfString, paramBoolean);
    registerAttribHandler("domain", new RFC2965DomainAttributeHandler());
    registerAttribHandler("port", new RFC2965PortAttributeHandler());
    registerAttribHandler("commenturl", new RFC2965CommentUrlAttributeHandler());
    registerAttribHandler("discard", new RFC2965DiscardAttributeHandler());
    registerAttribHandler("version", new RFC2965VersionAttributeHandler());
  }
  
  private static CookieOrigin adjustEffectiveHost(CookieOrigin paramCookieOrigin)
  {
    String str = paramCookieOrigin.getHost();
    int k = 1;
    int i = 0;
    for (;;)
    {
      int j = k;
      if (i < str.length())
      {
        j = str.charAt(i);
        if ((j == 46) || (j == 58)) {
          j = 0;
        }
      }
      else
      {
        CookieOrigin localCookieOrigin = paramCookieOrigin;
        if (j != 0) {
          localCookieOrigin = new CookieOrigin(str + ".local", paramCookieOrigin.getPort(), paramCookieOrigin.getPath(), paramCookieOrigin.isSecure());
        }
        return localCookieOrigin;
      }
      i += 1;
    }
  }
  
  private List<Cookie> createCookies(HeaderElement[] paramArrayOfHeaderElement, CookieOrigin paramCookieOrigin)
    throws MalformedCookieException
  {
    ArrayList localArrayList = new ArrayList(paramArrayOfHeaderElement.length);
    int k = paramArrayOfHeaderElement.length;
    int i = 0;
    while (i < k)
    {
      Object localObject2 = paramArrayOfHeaderElement[i];
      Object localObject1 = ((HeaderElement)localObject2).getName();
      Object localObject3 = ((HeaderElement)localObject2).getValue();
      if ((localObject1 == null) || (((String)localObject1).length() == 0)) {
        throw new MalformedCookieException("Cookie name may not be empty");
      }
      localObject1 = new BasicClientCookie2((String)localObject1, (String)localObject3);
      ((BasicClientCookie2)localObject1).setPath(getDefaultPath(paramCookieOrigin));
      ((BasicClientCookie2)localObject1).setDomain(getDefaultDomain(paramCookieOrigin));
      ((BasicClientCookie2)localObject1).setPorts(new int[] { paramCookieOrigin.getPort() });
      localObject2 = ((HeaderElement)localObject2).getParameters();
      localObject3 = new HashMap(localObject2.length);
      int j = localObject2.length - 1;
      Object localObject4;
      while (j >= 0)
      {
        localObject4 = localObject2[j];
        ((Map)localObject3).put(((NameValuePair)localObject4).getName().toLowerCase(Locale.ENGLISH), localObject4);
        j -= 1;
      }
      localObject2 = ((Map)localObject3).entrySet().iterator();
      while (((Iterator)localObject2).hasNext())
      {
        localObject3 = (NameValuePair)((Map.Entry)((Iterator)localObject2).next()).getValue();
        localObject4 = ((NameValuePair)localObject3).getName().toLowerCase(Locale.ENGLISH);
        ((BasicClientCookie2)localObject1).setAttribute((String)localObject4, ((NameValuePair)localObject3).getValue());
        localObject4 = findAttribHandler((String)localObject4);
        if (localObject4 != null) {
          ((CookieAttributeHandler)localObject4).parse((SetCookie)localObject1, ((NameValuePair)localObject3).getValue());
        }
      }
      localArrayList.add(localObject1);
      i += 1;
    }
    return localArrayList;
  }
  
  protected void formatCookieAsVer(CharArrayBuffer paramCharArrayBuffer, Cookie paramCookie, int paramInt)
  {
    super.formatCookieAsVer(paramCharArrayBuffer, paramCookie, paramInt);
    if ((paramCookie instanceof ClientCookie))
    {
      String str = ((ClientCookie)paramCookie).getAttribute("port");
      if (str != null)
      {
        paramCharArrayBuffer.append("; $Port");
        paramCharArrayBuffer.append("=\"");
        if (str.trim().length() > 0)
        {
          paramCookie = paramCookie.getPorts();
          if (paramCookie != null)
          {
            int i = paramCookie.length;
            paramInt = 0;
            while (paramInt < i)
            {
              if (paramInt > 0) {
                paramCharArrayBuffer.append(",");
              }
              paramCharArrayBuffer.append(Integer.toString(paramCookie[paramInt]));
              paramInt += 1;
            }
          }
        }
        paramCharArrayBuffer.append("\"");
      }
    }
  }
  
  public int getVersion()
  {
    return 1;
  }
  
  public Header getVersionHeader()
  {
    CharArrayBuffer localCharArrayBuffer = new CharArrayBuffer(40);
    localCharArrayBuffer.append("Cookie2");
    localCharArrayBuffer.append(": ");
    localCharArrayBuffer.append("$Version=");
    localCharArrayBuffer.append(Integer.toString(getVersion()));
    return new BufferedHeader(localCharArrayBuffer);
  }
  
  public boolean match(Cookie paramCookie, CookieOrigin paramCookieOrigin)
  {
    Args.notNull(paramCookie, "Cookie");
    Args.notNull(paramCookieOrigin, "Cookie origin");
    return super.match(paramCookie, adjustEffectiveHost(paramCookieOrigin));
  }
  
  public List<Cookie> parse(Header paramHeader, CookieOrigin paramCookieOrigin)
    throws MalformedCookieException
  {
    Args.notNull(paramHeader, "Header");
    Args.notNull(paramCookieOrigin, "Cookie origin");
    if (!paramHeader.getName().equalsIgnoreCase("Set-Cookie2")) {
      throw new MalformedCookieException("Unrecognized cookie header '" + paramHeader.toString() + "'");
    }
    return createCookies(paramHeader.getElements(), adjustEffectiveHost(paramCookieOrigin));
  }
  
  protected List<Cookie> parse(HeaderElement[] paramArrayOfHeaderElement, CookieOrigin paramCookieOrigin)
    throws MalformedCookieException
  {
    return createCookies(paramArrayOfHeaderElement, adjustEffectiveHost(paramCookieOrigin));
  }
  
  public String toString()
  {
    return "rfc2965";
  }
  
  public void validate(Cookie paramCookie, CookieOrigin paramCookieOrigin)
    throws MalformedCookieException
  {
    Args.notNull(paramCookie, "Cookie");
    Args.notNull(paramCookieOrigin, "Cookie origin");
    super.validate(paramCookie, adjustEffectiveHost(paramCookieOrigin));
  }
}
