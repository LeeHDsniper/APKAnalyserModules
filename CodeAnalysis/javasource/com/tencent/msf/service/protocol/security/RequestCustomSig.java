package com.tencent.msf.service.protocol.security;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import java.util.HashMap;
import java.util.Map;

public final class RequestCustomSig
  extends JceStruct
{
  static Map cache_customSigPara;
  static byte[] cache_reserved;
  public Map customSigPara = null;
  public long nlTestFlag = 0L;
  public byte[] reserved = null;
  public long ulCustumFlag = 0L;
  public long ulSType = 0L;
  
  public RequestCustomSig() {}
  
  public RequestCustomSig(long paramLong1, long paramLong2, byte[] paramArrayOfByte, Map paramMap, long paramLong3)
  {
    ulCustumFlag = paramLong1;
    ulSType = paramLong2;
    reserved = paramArrayOfByte;
    customSigPara = paramMap;
    nlTestFlag = paramLong3;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    ulCustumFlag = paramJceInputStream.read(ulCustumFlag, 0, true);
    ulSType = paramJceInputStream.read(ulSType, 1, true);
    if (cache_reserved == null)
    {
      cache_reserved = (byte[])new byte[1];
      ((byte[])cache_reserved)[0] = 0;
    }
    reserved = ((byte[])paramJceInputStream.read(cache_reserved, 2, true));
    if (cache_customSigPara == null)
    {
      cache_customSigPara = new HashMap();
      cache_customSigPara.put("", "");
    }
    customSigPara = ((Map)paramJceInputStream.read(cache_customSigPara, 3, false));
    nlTestFlag = paramJceInputStream.read(nlTestFlag, 4, false);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(ulCustumFlag, 0);
    paramJceOutputStream.write(ulSType, 1);
    paramJceOutputStream.write(reserved, 2);
    if (customSigPara != null) {
      paramJceOutputStream.write(customSigPara, 3);
    }
    paramJceOutputStream.write(nlTestFlag, 4);
  }
}
