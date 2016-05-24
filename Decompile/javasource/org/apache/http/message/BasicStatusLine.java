package org.apache.http.message;

import java.io.Serializable;
import org.apache.http.ProtocolVersion;
import org.apache.http.StatusLine;
import org.apache.http.annotation.Immutable;
import org.apache.http.util.Args;
import org.apache.http.util.CharArrayBuffer;

@Immutable
public class BasicStatusLine
  implements Serializable, Cloneable, StatusLine
{
  private static final long serialVersionUID = -2443303766890459269L;
  private final ProtocolVersion protoVersion;
  private final String reasonPhrase;
  private final int statusCode;
  
  public BasicStatusLine(ProtocolVersion paramProtocolVersion, int paramInt, String paramString)
  {
    protoVersion = ((ProtocolVersion)Args.notNull(paramProtocolVersion, "Version"));
    statusCode = Args.notNegative(paramInt, "Status code");
    reasonPhrase = paramString;
  }
  
  public Object clone()
    throws CloneNotSupportedException
  {
    return super.clone();
  }
  
  public ProtocolVersion getProtocolVersion()
  {
    return protoVersion;
  }
  
  public String getReasonPhrase()
  {
    return reasonPhrase;
  }
  
  public int getStatusCode()
  {
    return statusCode;
  }
  
  public String toString()
  {
    return BasicLineFormatter.INSTANCE.formatStatusLine(null, this).toString();
  }
}
