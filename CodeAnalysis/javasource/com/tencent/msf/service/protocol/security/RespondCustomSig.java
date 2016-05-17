package com.tencent.msf.service.protocol.security;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import java.util.ArrayList;

public final class RespondCustomSig
  extends JceStruct
{
  static ArrayList cache_SigList;
  static byte[] cache_reserved;
  public ArrayList SigList = null;
  public byte[] reserved = null;
  public long ulCustumFlag = 0L;
  public long ulSType = 0L;
  
  public RespondCustomSig() {}
  
  public RespondCustomSig(long paramLong1, long paramLong2, ArrayList paramArrayList, byte[] paramArrayOfByte)
  {
    ulCustumFlag = paramLong1;
    ulSType = paramLong2;
    SigList = paramArrayList;
    reserved = paramArrayOfByte;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    ulCustumFlag = paramJceInputStream.read(ulCustumFlag, 0, true);
    ulSType = paramJceInputStream.read(ulSType, 1, true);
    if (cache_SigList == null)
    {
      cache_SigList = new ArrayList();
      CustomSigContent localCustomSigContent = new CustomSigContent();
      cache_SigList.add(localCustomSigContent);
    }
    SigList = ((ArrayList)paramJceInputStream.read(cache_SigList, 2, true));
    if (cache_reserved == null)
    {
      cache_reserved = (byte[])new byte[1];
      ((byte[])cache_reserved)[0] = 0;
    }
    reserved = ((byte[])paramJceInputStream.read(cache_reserved, 3, true));
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(ulCustumFlag, 0);
    paramJceOutputStream.write(ulSType, 1);
    paramJceOutputStream.write(SigList, 2);
    paramJceOutputStream.write(reserved, 3);
  }
}
