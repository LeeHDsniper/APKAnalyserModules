package org.apache.http.message;

import java.io.Serializable;
import org.apache.http.NameValuePair;
import org.apache.http.annotation.Immutable;
import org.apache.http.util.Args;
import org.apache.http.util.LangUtils;

@Immutable
public class BasicNameValuePair
  implements Serializable, Cloneable, NameValuePair
{
  private static final long serialVersionUID = -6437800749411518984L;
  private final String name;
  private final String value;
  
  public BasicNameValuePair(String paramString1, String paramString2)
  {
    name = ((String)Args.notNull(paramString1, "Name"));
    value = paramString2;
  }
  
  public Object clone()
    throws CloneNotSupportedException
  {
    return super.clone();
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    do
    {
      return true;
      if (!(paramObject instanceof NameValuePair)) {
        break;
      }
      paramObject = (BasicNameValuePair)paramObject;
    } while ((name.equals(name)) && (LangUtils.equals(value, value)));
    return false;
    return false;
  }
  
  public String getName()
  {
    return name;
  }
  
  public String getValue()
  {
    return value;
  }
  
  public int hashCode()
  {
    return LangUtils.hashCode(LangUtils.hashCode(17, name), value);
  }
  
  public String toString()
  {
    if (value == null) {
      return name;
    }
    StringBuilder localStringBuilder = new StringBuilder(name.length() + 1 + value.length());
    localStringBuilder.append(name);
    localStringBuilder.append("=");
    localStringBuilder.append(value);
    return localStringBuilder.toString();
  }
}
