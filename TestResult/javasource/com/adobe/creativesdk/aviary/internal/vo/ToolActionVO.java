package com.adobe.creativesdk.aviary.internal.vo;

public class ToolActionVO<T>
{
  String contentIdentifier;
  String packIdentifier;
  T value;
  
  public ToolActionVO() {}
  
  public ToolActionVO(T paramT)
  {
    value = paramT;
  }
  
  public T getValue()
  {
    return value;
  }
  
  public void setContentIdentifier(String paramString)
  {
    contentIdentifier = paramString;
  }
  
  public void setPackIdentifier(String paramString)
  {
    packIdentifier = paramString;
  }
  
  public void setValue(T paramT)
  {
    value = paramT;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder("ToolActionVO{");
    if (value != null) {
      localStringBuilder.append("value:" + value);
    }
    if (packIdentifier != null)
    {
      if (value != null) {
        localStringBuilder.append(", ");
      }
      localStringBuilder.append("pack:" + packIdentifier);
      localStringBuilder.append(", content:" + contentIdentifier);
    }
    localStringBuilder.append("}");
    return localStringBuilder.toString();
  }
}
