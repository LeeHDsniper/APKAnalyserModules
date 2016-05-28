package org.apache.http.entity.mime;

public class MinimalField
{
  private final String name;
  private final String value;
  
  public MinimalField(String paramString1, String paramString2)
  {
    name = paramString1;
    value = paramString2;
  }
  
  public String getBody()
  {
    return value;
  }
  
  public String getName()
  {
    return name;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(name);
    localStringBuilder.append(": ");
    localStringBuilder.append(value);
    return localStringBuilder.toString();
  }
}
