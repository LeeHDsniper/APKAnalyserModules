package org.apache.http.config;

import org.apache.http.util.Args;

public class MessageConstraints
  implements Cloneable
{
  public static final MessageConstraints DEFAULT = new Builder().build();
  private final int maxHeaderCount;
  private final int maxLineLength;
  
  MessageConstraints(int paramInt1, int paramInt2)
  {
    maxLineLength = paramInt1;
    maxHeaderCount = paramInt2;
  }
  
  public static Builder copy(MessageConstraints paramMessageConstraints)
  {
    Args.notNull(paramMessageConstraints, "Message constraints");
    return new Builder().setMaxHeaderCount(paramMessageConstraints.getMaxHeaderCount()).setMaxLineLength(paramMessageConstraints.getMaxLineLength());
  }
  
  public static Builder custom()
  {
    return new Builder();
  }
  
  public static MessageConstraints lineLen(int paramInt)
  {
    return new MessageConstraints(Args.notNegative(paramInt, "Max line length"), -1);
  }
  
  protected MessageConstraints clone()
    throws CloneNotSupportedException
  {
    return (MessageConstraints)super.clone();
  }
  
  public int getMaxHeaderCount()
  {
    return maxHeaderCount;
  }
  
  public int getMaxLineLength()
  {
    return maxLineLength;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("[maxLineLength=").append(maxLineLength).append(", maxHeaderCount=").append(maxHeaderCount).append("]");
    return localStringBuilder.toString();
  }
  
  public static class Builder
  {
    private int maxHeaderCount = -1;
    private int maxLineLength = -1;
    
    Builder() {}
    
    public MessageConstraints build()
    {
      return new MessageConstraints(maxLineLength, maxHeaderCount);
    }
    
    public Builder setMaxHeaderCount(int paramInt)
    {
      maxHeaderCount = paramInt;
      return this;
    }
    
    public Builder setMaxLineLength(int paramInt)
    {
      maxLineLength = paramInt;
      return this;
    }
  }
}
