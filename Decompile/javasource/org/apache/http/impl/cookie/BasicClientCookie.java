package org.apache.http.impl.cookie;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.cookie.ClientCookie;
import org.apache.http.cookie.SetCookie;
import org.apache.http.util.Args;

@NotThreadSafe
public class BasicClientCookie
  implements Serializable, Cloneable, ClientCookie, SetCookie
{
  private static final long serialVersionUID = -3869795591041535538L;
  private Map<String, String> attribs;
  private String cookieComment;
  private String cookieDomain;
  private Date cookieExpiryDate;
  private String cookiePath;
  private int cookieVersion;
  private boolean isSecure;
  private final String name;
  private String value;
  
  public BasicClientCookie(String paramString1, String paramString2)
  {
    Args.notNull(paramString1, "Name");
    name = paramString1;
    attribs = new HashMap();
    value = paramString2;
  }
  
  public Object clone()
    throws CloneNotSupportedException
  {
    BasicClientCookie localBasicClientCookie = (BasicClientCookie)super.clone();
    attribs = new HashMap(attribs);
    return localBasicClientCookie;
  }
  
  public boolean containsAttribute(String paramString)
  {
    return attribs.get(paramString) != null;
  }
  
  public String getAttribute(String paramString)
  {
    return (String)attribs.get(paramString);
  }
  
  public String getComment()
  {
    return cookieComment;
  }
  
  public String getCommentURL()
  {
    return null;
  }
  
  public String getDomain()
  {
    return cookieDomain;
  }
  
  public Date getExpiryDate()
  {
    return cookieExpiryDate;
  }
  
  public String getName()
  {
    return name;
  }
  
  public String getPath()
  {
    return cookiePath;
  }
  
  public int[] getPorts()
  {
    return null;
  }
  
  public String getValue()
  {
    return value;
  }
  
  public int getVersion()
  {
    return cookieVersion;
  }
  
  public boolean isExpired(Date paramDate)
  {
    Args.notNull(paramDate, "Date");
    return (cookieExpiryDate != null) && (cookieExpiryDate.getTime() <= paramDate.getTime());
  }
  
  public boolean isPersistent()
  {
    return cookieExpiryDate != null;
  }
  
  public boolean isSecure()
  {
    return isSecure;
  }
  
  public void setAttribute(String paramString1, String paramString2)
  {
    attribs.put(paramString1, paramString2);
  }
  
  public void setComment(String paramString)
  {
    cookieComment = paramString;
  }
  
  public void setDomain(String paramString)
  {
    if (paramString != null)
    {
      cookieDomain = paramString.toLowerCase(Locale.ENGLISH);
      return;
    }
    cookieDomain = null;
  }
  
  public void setExpiryDate(Date paramDate)
  {
    cookieExpiryDate = paramDate;
  }
  
  public void setPath(String paramString)
  {
    cookiePath = paramString;
  }
  
  public void setSecure(boolean paramBoolean)
  {
    isSecure = paramBoolean;
  }
  
  public void setValue(String paramString)
  {
    value = paramString;
  }
  
  public void setVersion(int paramInt)
  {
    cookieVersion = paramInt;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("[version: ");
    localStringBuilder.append(Integer.toString(cookieVersion));
    localStringBuilder.append("]");
    localStringBuilder.append("[name: ");
    localStringBuilder.append(name);
    localStringBuilder.append("]");
    localStringBuilder.append("[value: ");
    localStringBuilder.append(value);
    localStringBuilder.append("]");
    localStringBuilder.append("[domain: ");
    localStringBuilder.append(cookieDomain);
    localStringBuilder.append("]");
    localStringBuilder.append("[path: ");
    localStringBuilder.append(cookiePath);
    localStringBuilder.append("]");
    localStringBuilder.append("[expiry: ");
    localStringBuilder.append(cookieExpiryDate);
    localStringBuilder.append("]");
    return localStringBuilder.toString();
  }
}
