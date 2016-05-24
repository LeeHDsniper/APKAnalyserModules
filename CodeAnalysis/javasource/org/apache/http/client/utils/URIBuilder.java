package org.apache.http.client.utils;

import java.net.URI;
import java.net.URISyntaxException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.apache.http.Consts;
import org.apache.http.NameValuePair;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.conn.util.InetAddressUtils;
import org.apache.http.message.BasicNameValuePair;

@NotThreadSafe
public class URIBuilder
{
  private String encodedAuthority;
  private String encodedFragment;
  private String encodedPath;
  private String encodedQuery;
  private String encodedSchemeSpecificPart;
  private String encodedUserInfo;
  private String fragment;
  private String host;
  private String path;
  private int port;
  private String query;
  private List<NameValuePair> queryParams;
  private String scheme;
  private String userInfo;
  
  public URIBuilder()
  {
    port = -1;
  }
  
  public URIBuilder(String paramString)
    throws URISyntaxException
  {
    digestURI(new URI(paramString));
  }
  
  public URIBuilder(URI paramURI)
  {
    digestURI(paramURI);
  }
  
  private String buildString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    if (scheme != null) {
      localStringBuilder.append(scheme).append(':');
    }
    if (encodedSchemeSpecificPart != null)
    {
      localStringBuilder.append(encodedSchemeSpecificPart);
      if (encodedFragment == null) {
        break label345;
      }
      localStringBuilder.append("#").append(encodedFragment);
    }
    for (;;)
    {
      return localStringBuilder.toString();
      if (encodedAuthority != null)
      {
        localStringBuilder.append("//").append(encodedAuthority);
        label92:
        if (encodedPath == null) {
          break label263;
        }
        localStringBuilder.append(normalizePath(encodedPath));
      }
      for (;;)
      {
        if (encodedQuery == null) {
          break label289;
        }
        localStringBuilder.append("?").append(encodedQuery);
        break;
        if (host == null) {
          break label92;
        }
        localStringBuilder.append("//");
        if (encodedUserInfo != null)
        {
          localStringBuilder.append(encodedUserInfo).append("@");
          label170:
          if (!InetAddressUtils.isIPv6Address(host)) {
            break label251;
          }
          localStringBuilder.append("[").append(host).append("]");
        }
        for (;;)
        {
          if (port < 0) {
            break label261;
          }
          localStringBuilder.append(":").append(port);
          break;
          if (userInfo == null) {
            break label170;
          }
          localStringBuilder.append(encodeUserInfo(userInfo)).append("@");
          break label170;
          label251:
          localStringBuilder.append(host);
        }
        label261:
        break label92;
        label263:
        if (path != null) {
          localStringBuilder.append(encodePath(normalizePath(path)));
        }
      }
      label289:
      if (queryParams != null)
      {
        localStringBuilder.append("?").append(encodeUrlForm(queryParams));
        break;
      }
      if (query == null) {
        break;
      }
      localStringBuilder.append("?").append(encodeUric(query));
      break;
      label345:
      if (fragment != null) {
        localStringBuilder.append("#").append(encodeUric(fragment));
      }
    }
  }
  
  private void digestURI(URI paramURI)
  {
    scheme = paramURI.getScheme();
    encodedSchemeSpecificPart = paramURI.getRawSchemeSpecificPart();
    encodedAuthority = paramURI.getRawAuthority();
    host = paramURI.getHost();
    port = paramURI.getPort();
    encodedUserInfo = paramURI.getRawUserInfo();
    userInfo = paramURI.getUserInfo();
    encodedPath = paramURI.getRawPath();
    path = paramURI.getPath();
    encodedQuery = paramURI.getRawQuery();
    queryParams = parseQuery(paramURI.getRawQuery(), Consts.UTF_8);
    encodedFragment = paramURI.getRawFragment();
    fragment = paramURI.getFragment();
  }
  
  private String encodePath(String paramString)
  {
    return URLEncodedUtils.encPath(paramString, Consts.UTF_8);
  }
  
  private String encodeUric(String paramString)
  {
    return URLEncodedUtils.encUric(paramString, Consts.UTF_8);
  }
  
  private String encodeUrlForm(List<NameValuePair> paramList)
  {
    return URLEncodedUtils.format(paramList, Consts.UTF_8);
  }
  
  private String encodeUserInfo(String paramString)
  {
    return URLEncodedUtils.encUserInfo(paramString, Consts.UTF_8);
  }
  
  private static String normalizePath(String paramString)
  {
    if (paramString == null) {
      return null;
    }
    int i = 0;
    for (;;)
    {
      if ((i >= paramString.length()) || (paramString.charAt(i) != '/'))
      {
        String str = paramString;
        if (i > 1) {
          str = paramString.substring(i - 1);
        }
        return str;
      }
      i += 1;
    }
  }
  
  private List<NameValuePair> parseQuery(String paramString, Charset paramCharset)
  {
    if ((paramString != null) && (paramString.length() > 0)) {
      return URLEncodedUtils.parse(paramString, paramCharset);
    }
    return null;
  }
  
  public URIBuilder addParameter(String paramString1, String paramString2)
  {
    if (queryParams == null) {
      queryParams = new ArrayList();
    }
    queryParams.add(new BasicNameValuePair(paramString1, paramString2));
    encodedQuery = null;
    encodedSchemeSpecificPart = null;
    query = null;
    return this;
  }
  
  public URIBuilder addParameters(List<NameValuePair> paramList)
  {
    if (queryParams == null) {
      queryParams = new ArrayList();
    }
    queryParams.addAll(paramList);
    encodedQuery = null;
    encodedSchemeSpecificPart = null;
    query = null;
    return this;
  }
  
  public URI build()
    throws URISyntaxException
  {
    return new URI(buildString());
  }
  
  public URIBuilder clearParameters()
  {
    queryParams = null;
    encodedQuery = null;
    encodedSchemeSpecificPart = null;
    return this;
  }
  
  public String getFragment()
  {
    return fragment;
  }
  
  public String getHost()
  {
    return host;
  }
  
  public String getPath()
  {
    return path;
  }
  
  public int getPort()
  {
    return port;
  }
  
  public List<NameValuePair> getQueryParams()
  {
    if (queryParams != null) {
      return new ArrayList(queryParams);
    }
    return new ArrayList();
  }
  
  public String getScheme()
  {
    return scheme;
  }
  
  public String getUserInfo()
  {
    return userInfo;
  }
  
  public boolean isAbsolute()
  {
    return scheme != null;
  }
  
  public boolean isOpaque()
  {
    return path == null;
  }
  
  public URIBuilder removeQuery()
  {
    queryParams = null;
    query = null;
    encodedQuery = null;
    encodedSchemeSpecificPart = null;
    return this;
  }
  
  public URIBuilder setCustomQuery(String paramString)
  {
    query = paramString;
    encodedQuery = null;
    encodedSchemeSpecificPart = null;
    queryParams = null;
    return this;
  }
  
  public URIBuilder setFragment(String paramString)
  {
    fragment = paramString;
    encodedFragment = null;
    return this;
  }
  
  public URIBuilder setHost(String paramString)
  {
    host = paramString;
    encodedSchemeSpecificPart = null;
    encodedAuthority = null;
    return this;
  }
  
  public URIBuilder setParameter(String paramString1, String paramString2)
  {
    if (queryParams == null) {
      queryParams = new ArrayList();
    }
    if (!queryParams.isEmpty())
    {
      Iterator localIterator = queryParams.iterator();
      while (localIterator.hasNext()) {
        if (((NameValuePair)localIterator.next()).getName().equals(paramString1)) {
          localIterator.remove();
        }
      }
    }
    queryParams.add(new BasicNameValuePair(paramString1, paramString2));
    encodedQuery = null;
    encodedSchemeSpecificPart = null;
    query = null;
    return this;
  }
  
  public URIBuilder setParameters(List<NameValuePair> paramList)
  {
    if (queryParams == null) {
      queryParams = new ArrayList();
    }
    for (;;)
    {
      queryParams.addAll(paramList);
      encodedQuery = null;
      encodedSchemeSpecificPart = null;
      query = null;
      return this;
      queryParams.clear();
    }
  }
  
  public URIBuilder setParameters(NameValuePair... paramVarArgs)
  {
    if (queryParams == null) {
      queryParams = new ArrayList();
    }
    for (;;)
    {
      int j = paramVarArgs.length;
      int i = 0;
      while (i < j)
      {
        NameValuePair localNameValuePair = paramVarArgs[i];
        queryParams.add(localNameValuePair);
        i += 1;
      }
      queryParams.clear();
    }
    encodedQuery = null;
    encodedSchemeSpecificPart = null;
    query = null;
    return this;
  }
  
  public URIBuilder setPath(String paramString)
  {
    path = paramString;
    encodedSchemeSpecificPart = null;
    encodedPath = null;
    return this;
  }
  
  public URIBuilder setPort(int paramInt)
  {
    int i = paramInt;
    if (paramInt < 0) {
      i = -1;
    }
    port = i;
    encodedSchemeSpecificPart = null;
    encodedAuthority = null;
    return this;
  }
  
  @Deprecated
  public URIBuilder setQuery(String paramString)
  {
    queryParams = parseQuery(paramString, Consts.UTF_8);
    query = null;
    encodedQuery = null;
    encodedSchemeSpecificPart = null;
    return this;
  }
  
  public URIBuilder setScheme(String paramString)
  {
    scheme = paramString;
    return this;
  }
  
  public URIBuilder setUserInfo(String paramString)
  {
    userInfo = paramString;
    encodedSchemeSpecificPart = null;
    encodedAuthority = null;
    encodedUserInfo = null;
    return this;
  }
  
  public URIBuilder setUserInfo(String paramString1, String paramString2)
  {
    return setUserInfo(paramString1 + ':' + paramString2);
  }
  
  public String toString()
  {
    return buildString();
  }
}
