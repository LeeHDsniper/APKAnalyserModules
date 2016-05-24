package org.apache.http;

public abstract interface RequestLine
{
  public abstract String getMethod();
  
  public abstract ProtocolVersion getProtocolVersion();
  
  public abstract String getUri();
}
