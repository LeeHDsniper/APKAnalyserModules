package com.tencent.msf.service.protocol.push;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class SvcReqRegister
  extends JceStruct
{
  static byte[] cache_vecDevParam;
  static byte[] cache_vecGuid;
  public byte bIsOnline = 0;
  public byte bIsShowOnline = 0;
  public byte bKikPC = 0;
  public byte bKikWeak = 0;
  public byte bOnlinePush = 0;
  public byte bOpenPush = 1;
  public byte bRegType = 0;
  public byte bSlientPush = 0;
  public byte cConnType = 0;
  public byte cNetType = 0;
  public long iLargeSeq = 0L;
  public int iLocaleID = 2052;
  public long iOSVersion = 0L;
  public int iStatus = 11;
  public long lBid = 0L;
  public long lUin = 0L;
  public String sBuildVer = "";
  public String sOther = "";
  public String strDevName = "";
  public String strDevType = "";
  public String strOSVer = "";
  public long timeStamp = 0L;
  public byte[] vecDevParam = null;
  public byte[] vecGuid = null;
  
  public SvcReqRegister() {}
  
  public SvcReqRegister(long paramLong1, long paramLong2, byte paramByte1, String paramString1, int paramInt1, byte paramByte2, byte paramByte3, byte paramByte4, byte paramByte5, byte paramByte6, long paramLong3, long paramLong4, byte paramByte7, String paramString2, byte paramByte8, byte[] paramArrayOfByte1, byte[] paramArrayOfByte2, int paramInt2, byte paramByte9, String paramString3, String paramString4, String paramString5, byte paramByte10, long paramLong5)
  {
    lUin = paramLong1;
    lBid = paramLong2;
    cConnType = paramByte1;
    sOther = paramString1;
    iStatus = paramInt1;
    bOnlinePush = paramByte2;
    bIsOnline = paramByte3;
    bIsShowOnline = paramByte4;
    bKikPC = paramByte5;
    bKikWeak = paramByte6;
    timeStamp = paramLong3;
    iOSVersion = paramLong4;
    cNetType = paramByte7;
    sBuildVer = paramString2;
    bRegType = paramByte8;
    vecDevParam = paramArrayOfByte1;
    vecGuid = paramArrayOfByte2;
    iLocaleID = paramInt2;
    bSlientPush = paramByte9;
    strDevName = paramString3;
    strDevType = paramString4;
    strOSVer = paramString5;
    bOpenPush = paramByte10;
    iLargeSeq = paramLong5;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    lUin = paramJceInputStream.read(lUin, 0, true);
    lBid = paramJceInputStream.read(lBid, 1, true);
    cConnType = paramJceInputStream.read(cConnType, 2, true);
    sOther = paramJceInputStream.readString(3, true);
    iStatus = paramJceInputStream.read(iStatus, 4, false);
    bOnlinePush = paramJceInputStream.read(bOnlinePush, 5, false);
    bIsOnline = paramJceInputStream.read(bIsOnline, 6, false);
    bIsShowOnline = paramJceInputStream.read(bIsShowOnline, 7, false);
    bKikPC = paramJceInputStream.read(bKikPC, 8, false);
    bKikWeak = paramJceInputStream.read(bKikWeak, 9, false);
    timeStamp = paramJceInputStream.read(timeStamp, 10, false);
    iOSVersion = paramJceInputStream.read(iOSVersion, 11, false);
    cNetType = paramJceInputStream.read(cNetType, 12, false);
    sBuildVer = paramJceInputStream.readString(13, false);
    bRegType = paramJceInputStream.read(bRegType, 14, false);
    if (cache_vecDevParam == null)
    {
      cache_vecDevParam = (byte[])new byte[1];
      ((byte[])cache_vecDevParam)[0] = 0;
    }
    vecDevParam = ((byte[])paramJceInputStream.read(cache_vecDevParam, 15, false));
    if (cache_vecGuid == null)
    {
      cache_vecGuid = (byte[])new byte[1];
      ((byte[])cache_vecGuid)[0] = 0;
    }
    vecGuid = ((byte[])paramJceInputStream.read(cache_vecGuid, 16, false));
    iLocaleID = paramJceInputStream.read(iLocaleID, 17, false);
    bSlientPush = paramJceInputStream.read(bSlientPush, 18, false);
    strDevName = paramJceInputStream.readString(19, false);
    strDevType = paramJceInputStream.readString(20, false);
    strOSVer = paramJceInputStream.readString(21, false);
    bOpenPush = paramJceInputStream.read(bOpenPush, 22, false);
    iLargeSeq = paramJceInputStream.read(iLargeSeq, 23, false);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(lUin, 0);
    paramJceOutputStream.write(lBid, 1);
    paramJceOutputStream.write(cConnType, 2);
    paramJceOutputStream.write(sOther, 3);
    paramJceOutputStream.write(iStatus, 4);
    paramJceOutputStream.write(bOnlinePush, 5);
    paramJceOutputStream.write(bIsOnline, 6);
    paramJceOutputStream.write(bIsShowOnline, 7);
    paramJceOutputStream.write(bKikPC, 8);
    paramJceOutputStream.write(bKikWeak, 9);
    paramJceOutputStream.write(timeStamp, 10);
    paramJceOutputStream.write(iOSVersion, 11);
    paramJceOutputStream.write(cNetType, 12);
    if (sBuildVer != null) {
      paramJceOutputStream.write(sBuildVer, 13);
    }
    paramJceOutputStream.write(bRegType, 14);
    if (vecDevParam != null) {
      paramJceOutputStream.write(vecDevParam, 15);
    }
    if (vecGuid != null) {
      paramJceOutputStream.write(vecGuid, 16);
    }
    paramJceOutputStream.write(iLocaleID, 17);
    paramJceOutputStream.write(bSlientPush, 18);
    if (strDevName != null) {
      paramJceOutputStream.write(strDevName, 19);
    }
    if (strDevType != null) {
      paramJceOutputStream.write(strDevType, 20);
    }
    if (strOSVer != null) {
      paramJceOutputStream.write(strOSVer, 21);
    }
    paramJceOutputStream.write(bOpenPush, 22);
    paramJceOutputStream.write(iLargeSeq, 23);
  }
}
