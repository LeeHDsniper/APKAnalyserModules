package com.tencent.commonsdk.soload;

public abstract class BufferIterator
{
  public BufferIterator() {}
  
  public abstract int readInt();
  
  public abstract short readShort();
  
  public abstract void seek(int paramInt);
  
  public abstract void skip(int paramInt);
}
