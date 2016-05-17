package com.tencent.msf.service.protocol.security;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class CustomSigContent
  extends JceStruct
{
  static byte[] cache_SigContent;
  public byte[] SigContent = null;
  public long length = 0L;
  public short sResult = 0;
  public long ulSigType = 0L;
  
  public CustomSigContent() {}
  
  public CustomSigContent(long paramLong1, short paramShort, long paramLong2, byte[] paramArrayOfByte)
  {
    ulSigType = paramLong1;
    sResult = paramShort;
    length = paramLong2;
    SigContent = paramArrayOfByte;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    ulSigType = paramJceInputStream.read(ulSigType, 0, true);
    sResult = paramJceInputStream.read(sResult, 1, true);
    length = paramJceInputStream.read(length, 2, true);
    if (cache_SigContent == null)
    {
      cache_SigContent = (byte[])new byte[1];
      ((byte[])cache_SigContent)[0] = 0;
    }
    SigContent = ((byte[])paramJceInputStream.read(cache_SigContent, 3, true));
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(ulSigType, 0);
    paramJceOutputStream.write(sResult, 1);
    paramJceOutputStream.write(length, 2);
    paramJceOutputStream.write(SigContent, 3);
  }
}
