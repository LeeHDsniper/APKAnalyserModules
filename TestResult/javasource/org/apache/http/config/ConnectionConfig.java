package org.apache.http.config;

import java.nio.charset.Charset;
import java.nio.charset.CodingErrorAction;
import org.apache.http.Consts;
import org.apache.http.annotation.Immutable;
import org.apache.http.util.Args;

@Immutable
public class ConnectionConfig
  implements Cloneable
{
  public static final ConnectionConfig DEFAULT = new Builder().build();
  private final int bufferSize;
  private final Charset charset;
  private final int fragmentSizeHint;
  private final CodingErrorAction malformedInputAction;
  private final MessageConstraints messageConstraints;
  private final CodingErrorAction unmappableInputAction;
  
  ConnectionConfig(int paramInt1, int paramInt2, Charset paramCharset, CodingErrorAction paramCodingErrorAction1, CodingErrorAction paramCodingErrorAction2, MessageConstraints paramMessageConstraints)
  {
    bufferSize = paramInt1;
    fragmentSizeHint = paramInt2;
    charset = paramCharset;
    malformedInputAction = paramCodingErrorAction1;
    unmappableInputAction = paramCodingErrorAction2;
    messageConstraints = paramMessageConstraints;
  }
  
  public static Builder copy(ConnectionConfig paramConnectionConfig)
  {
    Args.notNull(paramConnectionConfig, "Connection config");
    return new Builder().setCharset(paramConnectionConfig.getCharset()).setMalformedInputAction(paramConnectionConfig.getMalformedInputAction()).setUnmappableInputAction(paramConnectionConfig.getUnmappableInputAction()).setMessageConstraints(paramConnectionConfig.getMessageConstraints());
  }
  
  public static Builder custom()
  {
    return new Builder();
  }
  
  protected ConnectionConfig clone()
    throws CloneNotSupportedException
  {
    return (ConnectionConfig)super.clone();
  }
  
  public int getBufferSize()
  {
    return bufferSize;
  }
  
  public Charset getCharset()
  {
    return charset;
  }
  
  public int getFragmentSizeHint()
  {
    return fragmentSizeHint;
  }
  
  public CodingErrorAction getMalformedInputAction()
  {
    return malformedInputAction;
  }
  
  public MessageConstraints getMessageConstraints()
  {
    return messageConstraints;
  }
  
  public CodingErrorAction getUnmappableInputAction()
  {
    return unmappableInputAction;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("[bufferSize=").append(bufferSize).append(", fragmentSizeHint=").append(fragmentSizeHint).append(", charset=").append(charset).append(", malformedInputAction=").append(malformedInputAction).append(", unmappableInputAction=").append(unmappableInputAction).append(", messageConstraints=").append(messageConstraints).append("]");
    return localStringBuilder.toString();
  }
  
  public static class Builder
  {
    private int bufferSize;
    private Charset charset;
    private int fragmentSizeHint = -1;
    private CodingErrorAction malformedInputAction;
    private MessageConstraints messageConstraints;
    private CodingErrorAction unmappableInputAction;
    
    Builder() {}
    
    public ConnectionConfig build()
    {
      Charset localCharset2 = charset;
      Charset localCharset1 = localCharset2;
      if (localCharset2 == null) {
        if (malformedInputAction == null)
        {
          localCharset1 = localCharset2;
          if (unmappableInputAction == null) {}
        }
        else
        {
          localCharset1 = Consts.ASCII;
        }
      }
      int i;
      if (bufferSize > 0)
      {
        i = bufferSize;
        if (fragmentSizeHint < 0) {
          break label89;
        }
      }
      label89:
      for (int j = fragmentSizeHint;; j = i)
      {
        return new ConnectionConfig(i, j, localCharset1, malformedInputAction, unmappableInputAction, messageConstraints);
        i = 8192;
        break;
      }
    }
    
    public Builder setBufferSize(int paramInt)
    {
      bufferSize = paramInt;
      return this;
    }
    
    public Builder setCharset(Charset paramCharset)
    {
      charset = paramCharset;
      return this;
    }
    
    public Builder setFragmentSizeHint(int paramInt)
    {
      fragmentSizeHint = paramInt;
      return this;
    }
    
    public Builder setMalformedInputAction(CodingErrorAction paramCodingErrorAction)
    {
      malformedInputAction = paramCodingErrorAction;
      if ((paramCodingErrorAction != null) && (charset == null)) {
        charset = Consts.ASCII;
      }
      return this;
    }
    
    public Builder setMessageConstraints(MessageConstraints paramMessageConstraints)
    {
      messageConstraints = paramMessageConstraints;
      return this;
    }
    
    public Builder setUnmappableInputAction(CodingErrorAction paramCodingErrorAction)
    {
      unmappableInputAction = paramCodingErrorAction;
      if ((paramCodingErrorAction != null) && (charset == null)) {
        charset = Consts.ASCII;
      }
      return this;
    }
  }
}
