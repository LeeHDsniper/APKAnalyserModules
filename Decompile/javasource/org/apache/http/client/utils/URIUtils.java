package org.apache.http.client.utils;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Stack;
import org.apache.http.HttpHost;
import org.apache.http.annotation.Immutable;
import org.apache.http.util.Args;
import org.apache.http.util.TextUtils;

@Immutable
public class URIUtils
{
  private URIUtils() {}
  
  @Deprecated
  public static URI createURI(String paramString1, String paramString2, int paramInt, String paramString3, String paramString4, String paramString5)
    throws URISyntaxException
  {
    StringBuilder localStringBuilder = new StringBuilder();
    if (paramString2 != null)
    {
      if (paramString1 != null)
      {
        localStringBuilder.append(paramString1);
        localStringBuilder.append("://");
      }
      localStringBuilder.append(paramString2);
      if (paramInt > 0)
      {
        localStringBuilder.append(':');
        localStringBuilder.append(paramInt);
      }
    }
    if ((paramString3 == null) || (!paramString3.startsWith("/"))) {
      localStringBuilder.append('/');
    }
    if (paramString3 != null) {
      localStringBuilder.append(paramString3);
    }
    if (paramString4 != null)
    {
      localStringBuilder.append('?');
      localStringBuilder.append(paramString4);
    }
    if (paramString5 != null)
    {
      localStringBuilder.append('#');
      localStringBuilder.append(paramString5);
    }
    return new URI(localStringBuilder.toString());
  }
  
  public static HttpHost extractHost(URI paramURI)
  {
    if (paramURI == null) {}
    for (;;)
    {
      return null;
      if (!paramURI.isAbsolute()) {
        continue;
      }
      int j = paramURI.getPort();
      Object localObject2 = paramURI.getHost();
      Object localObject1 = localObject2;
      int i = j;
      int n;
      int m;
      int k;
      if (localObject2 == null)
      {
        String str = paramURI.getAuthority();
        localObject1 = str;
        i = j;
        if (str != null)
        {
          i = str.indexOf('@');
          localObject2 = str;
          if (i >= 0) {
            if (str.length() <= i + 1) {
              break label163;
            }
          }
          label163:
          for (localObject2 = str.substring(i + 1);; localObject2 = null)
          {
            localObject1 = localObject2;
            i = j;
            if (localObject2 == null) {
              break label200;
            }
            n = ((String)localObject2).indexOf(':');
            localObject1 = localObject2;
            i = j;
            if (n < 0) {
              break label200;
            }
            m = n + 1;
            k = 0;
            i = m;
            while ((i < ((String)localObject2).length()) && (Character.isDigit(((String)localObject2).charAt(i))))
            {
              k += 1;
              i += 1;
            }
          }
          i = j;
          if (k <= 0) {}
        }
      }
      try
      {
        i = Integer.parseInt(((String)localObject2).substring(m, m + k));
        localObject1 = ((String)localObject2).substring(0, n);
        label200:
        paramURI = paramURI.getScheme();
        if (localObject1 == null) {
          continue;
        }
        return new HttpHost((String)localObject1, i, paramURI);
      }
      catch (NumberFormatException localNumberFormatException)
      {
        for (;;)
        {
          i = j;
        }
      }
    }
  }
  
  private static URI normalizeSyntax(URI paramURI)
  {
    if (paramURI.isOpaque()) {
      return paramURI;
    }
    Args.check(paramURI.isAbsolute(), "Base URI must be absolute");
    Object localObject1;
    int i;
    label51:
    Object localObject4;
    if (paramURI.getPath() == null)
    {
      localObject1 = "";
      localObject3 = ((String)localObject1).split("/");
      localObject2 = new Stack();
      int j = localObject3.length;
      i = 0;
      if (i >= j) {
        break label133;
      }
      localObject4 = localObject3[i];
      if ((((String)localObject4).length() != 0) && (!".".equals(localObject4))) {
        break label95;
      }
    }
    for (;;)
    {
      i += 1;
      break label51;
      localObject1 = paramURI.getPath();
      break;
      label95:
      if ("..".equals(localObject4))
      {
        if (!((Stack)localObject2).isEmpty()) {
          ((Stack)localObject2).pop();
        }
      }
      else {
        ((Stack)localObject2).push(localObject4);
      }
    }
    label133:
    Object localObject3 = new StringBuilder();
    Object localObject2 = ((Stack)localObject2).iterator();
    while (((Iterator)localObject2).hasNext())
    {
      localObject4 = (String)((Iterator)localObject2).next();
      ((StringBuilder)localObject3).append('/').append((String)localObject4);
    }
    if (((String)localObject1).lastIndexOf('/') == ((String)localObject1).length() - 1) {
      ((StringBuilder)localObject3).append('/');
    }
    try
    {
      localObject1 = new URI(paramURI.getScheme().toLowerCase(), paramURI.getAuthority().toLowerCase(), ((StringBuilder)localObject3).toString(), null, null);
      if ((paramURI.getQuery() == null) && (paramURI.getFragment() == null)) {
        return localObject1;
      }
      localObject1 = new StringBuilder(((URI)localObject1).toASCIIString());
      if (paramURI.getQuery() != null) {
        ((StringBuilder)localObject1).append('?').append(paramURI.getRawQuery());
      }
      if (paramURI.getFragment() != null) {
        ((StringBuilder)localObject1).append('#').append(paramURI.getRawFragment());
      }
      paramURI = URI.create(((StringBuilder)localObject1).toString());
      return paramURI;
    }
    catch (URISyntaxException paramURI)
    {
      throw new IllegalArgumentException(paramURI);
    }
  }
  
  public static URI resolve(URI paramURI, String paramString)
  {
    return resolve(paramURI, URI.create(paramString));
  }
  
  public static URI resolve(URI paramURI1, URI paramURI2)
  {
    Args.notNull(paramURI1, "Base URI");
    Args.notNull(paramURI2, "Reference URI");
    String str = paramURI2.toString();
    if (str.startsWith("?")) {
      return resolveReferenceStartingWithQueryString(paramURI1, paramURI2);
    }
    if (str.length() == 0) {}
    for (int i = 1;; i = 0)
    {
      if (i != 0) {
        paramURI2 = URI.create("#");
      }
      paramURI2 = paramURI1.resolve(paramURI2);
      paramURI1 = paramURI2;
      if (i != 0)
      {
        paramURI1 = paramURI2.toString();
        paramURI1 = URI.create(paramURI1.substring(0, paramURI1.indexOf('#')));
      }
      return normalizeSyntax(paramURI1);
    }
  }
  
  public static URI resolve(URI paramURI, HttpHost paramHttpHost, List<URI> paramList)
    throws URISyntaxException
  {
    Args.notNull(paramURI, "Request URI");
    if ((paramList == null) || (paramList.isEmpty())) {}
    URIBuilder localURIBuilder;
    for (paramList = new URIBuilder(paramURI);; paramList = localURIBuilder)
    {
      if (paramList.getFragment() == null) {
        paramList.setFragment(paramURI.getFragment());
      }
      if ((paramHttpHost != null) && (!paramList.isAbsolute()))
      {
        paramList.setScheme(paramHttpHost.getSchemeName());
        paramList.setHost(paramHttpHost.getHostName());
        paramList.setPort(paramHttpHost.getPort());
      }
      return paramList.build();
      localURIBuilder = new URIBuilder((URI)paramList.get(paramList.size() - 1));
      String str = localURIBuilder.getFragment();
      int i = paramList.size() - 1;
      while ((str == null) && (i >= 0))
      {
        str = ((URI)paramList.get(i)).getFragment();
        i -= 1;
      }
      localURIBuilder.setFragment(str);
    }
  }
  
  private static URI resolveReferenceStartingWithQueryString(URI paramURI1, URI paramURI2)
  {
    String str = paramURI1.toString();
    paramURI1 = str;
    if (str.indexOf('?') > -1) {
      paramURI1 = str.substring(0, str.indexOf('?'));
    }
    return URI.create(paramURI1 + paramURI2.toString());
  }
  
  public static URI rewriteURI(URI paramURI)
    throws URISyntaxException
  {
    Args.notNull(paramURI, "URI");
    if (paramURI.isOpaque()) {
      return paramURI;
    }
    paramURI = new URIBuilder(paramURI);
    if (paramURI.getUserInfo() != null) {
      paramURI.setUserInfo(null);
    }
    if (TextUtils.isEmpty(paramURI.getPath())) {
      paramURI.setPath("/");
    }
    if (paramURI.getHost() != null) {
      paramURI.setHost(paramURI.getHost().toLowerCase(Locale.ENGLISH));
    }
    paramURI.setFragment(null);
    return paramURI.build();
  }
  
  public static URI rewriteURI(URI paramURI, HttpHost paramHttpHost)
    throws URISyntaxException
  {
    return rewriteURI(paramURI, paramHttpHost, false);
  }
  
  public static URI rewriteURI(URI paramURI, HttpHost paramHttpHost, boolean paramBoolean)
    throws URISyntaxException
  {
    Args.notNull(paramURI, "URI");
    if (paramURI.isOpaque()) {
      return paramURI;
    }
    paramURI = new URIBuilder(paramURI);
    if (paramHttpHost != null)
    {
      paramURI.setScheme(paramHttpHost.getSchemeName());
      paramURI.setHost(paramHttpHost.getHostName());
      paramURI.setPort(paramHttpHost.getPort());
    }
    for (;;)
    {
      if (paramBoolean) {
        paramURI.setFragment(null);
      }
      if (TextUtils.isEmpty(paramURI.getPath())) {
        paramURI.setPath("/");
      }
      return paramURI.build();
      paramURI.setScheme(null);
      paramURI.setHost(null);
      paramURI.setPort(-1);
    }
  }
}
