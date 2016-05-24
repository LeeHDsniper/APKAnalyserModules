package org.apache.http.config;

import org.apache.http.annotation.Immutable;
import org.apache.http.util.Args;

@Immutable
public class SocketConfig
  implements Cloneable
{
  public static final SocketConfig DEFAULT = new Builder().build();
  private final boolean soKeepAlive;
  private final int soLinger;
  private final boolean soReuseAddress;
  private final int soTimeout;
  private final boolean tcpNoDelay;
  
  SocketConfig(int paramInt1, boolean paramBoolean1, int paramInt2, boolean paramBoolean2, boolean paramBoolean3)
  {
    soTimeout = paramInt1;
    soReuseAddress = paramBoolean1;
    soLinger = paramInt2;
    soKeepAlive = paramBoolean2;
    tcpNoDelay = paramBoolean3;
  }
  
  public static Builder copy(SocketConfig paramSocketConfig)
  {
    Args.notNull(paramSocketConfig, "Socket config");
    return new Builder().setSoTimeout(paramSocketConfig.getSoTimeout()).setSoReuseAddress(paramSocketConfig.isSoReuseAddress()).setSoLinger(paramSocketConfig.getSoLinger()).setSoKeepAlive(paramSocketConfig.isSoKeepAlive()).setTcpNoDelay(paramSocketConfig.isTcpNoDelay());
  }
  
  public static Builder custom()
  {
    return new Builder();
  }
  
  protected SocketConfig clone()
    throws CloneNotSupportedException
  {
    return (SocketConfig)super.clone();
  }
  
  public int getSoLinger()
  {
    return soLinger;
  }
  
  public int getSoTimeout()
  {
    return soTimeout;
  }
  
  public boolean isSoKeepAlive()
  {
    return soKeepAlive;
  }
  
  public boolean isSoReuseAddress()
  {
    return soReuseAddress;
  }
  
  public boolean isTcpNoDelay()
  {
    return tcpNoDelay;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("[soTimeout=").append(soTimeout).append(", soReuseAddress=").append(soReuseAddress).append(", soLinger=").append(soLinger).append(", soKeepAlive=").append(soKeepAlive).append(", tcpNoDelay=").append(tcpNoDelay).append("]");
    return localStringBuilder.toString();
  }
  
  public static class Builder
  {
    private boolean soKeepAlive;
    private int soLinger = -1;
    private boolean soReuseAddress;
    private int soTimeout;
    private boolean tcpNoDelay = true;
    
    Builder() {}
    
    public SocketConfig build()
    {
      return new SocketConfig(soTimeout, soReuseAddress, soLinger, soKeepAlive, tcpNoDelay);
    }
    
    public Builder setSoKeepAlive(boolean paramBoolean)
    {
      soKeepAlive = paramBoolean;
      return this;
    }
    
    public Builder setSoLinger(int paramInt)
    {
      soLinger = paramInt;
      return this;
    }
    
    public Builder setSoReuseAddress(boolean paramBoolean)
    {
      soReuseAddress = paramBoolean;
      return this;
    }
    
    public Builder setSoTimeout(int paramInt)
    {
      soTimeout = paramInt;
      return this;
    }
    
    public Builder setTcpNoDelay(boolean paramBoolean)
    {
      tcpNoDelay = paramBoolean;
      return this;
    }
  }
}
