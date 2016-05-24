package org.apache.http.io;

public abstract interface BufferInfo
{
  public abstract int available();
  
  public abstract int capacity();
  
  public abstract int length();
}
