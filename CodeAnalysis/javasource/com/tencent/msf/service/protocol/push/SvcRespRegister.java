package com.tencent.msf.service.protocol.push;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class SvcRespRegister
  extends JceStruct
{
  public byte bCrashFlag = 0;
  public byte bLargeSeqUpdate = 0;
  public byte bLogQQ = 0;
  public byte bNeedKik = 0;
  public byte bUpdateFlag = 0;
  public byte cReplyCode = 0;
  public int iClientPort = 0;
  public int iHelloInterval = 300;
  public long iLargeSeq = 0L;
  public long lBid = 0L;
  public long lServerTime = 0L;
  public long lUin = 0L;
  public String strClientIP = "";
  public String strResult = "";
  public long timeStamp = 0L;
  
  public SvcRespRegister() {}
  
  public SvcRespRegister(long paramLong1, long paramLong2, byte paramByte1, String paramString1, long paramLong3, byte paramByte2, byte paramByte3, byte paramByte4, long paramLong4, byte paramByte5, String paramString2, int paramInt1, int paramInt2, long paramLong5, byte paramByte6)
  {
    lUin = paramLong1;
    lBid = paramLong2;
    cReplyCode = paramByte1;
    strResult = paramString1;
    lServerTime = paramLong3;
    bLogQQ = paramByte2;
    bNeedKik = paramByte3;
    bUpdateFlag = paramByte4;
    timeStamp = paramLong4;
    bCrashFlag = paramByte5;
    strClientIP = paramString2;
    iClientPort = paramInt1;
    iHelloInterval = paramInt2;
    iLargeSeq = paramLong5;
    bLargeSeqUpdate = paramByte6;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    lUin = paramJceInputStream.read(lUin, 0, true);
    lBid = paramJceInputStream.read(lBid, 1, true);
    cReplyCode = paramJceInputStream.read(cReplyCode, 2, true);
    strResult = paramJceInputStream.readString(3, true);
    lServerTime = paramJceInputStream.read(lServerTime, 4, false);
    bLogQQ = paramJceInputStream.read(bLogQQ, 5, false);
    bNeedKik = paramJceInputStream.read(bNeedKik, 6, false);
    bUpdateFlag = paramJceInputStream.read(bUpdateFlag, 7, false);
    timeStamp = paramJceInputStream.read(timeStamp, 8, false);
    bCrashFlag = paramJceInputStream.read(bCrashFlag, 9, false);
    strClientIP = paramJceInputStream.readString(10, false);
    iClientPort = paramJceInputStream.read(iClientPort, 11, false);
    iHelloInterval = paramJceInputStream.read(iHelloInterval, 12, false);
    iLargeSeq = paramJceInputStream.read(iLargeSeq, 13, false);
    bLargeSeqUpdate = paramJceInputStream.read(bLargeSeqUpdate, 14, false);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(lUin, 0);
    paramJceOutputStream.write(lBid, 1);
    paramJceOutputStream.write(cReplyCode, 2);
    paramJceOutputStream.write(strResult, 3);
    paramJceOutputStream.write(lServerTime, 4);
    paramJceOutputStream.write(bLogQQ, 5);
    paramJceOutputStream.write(bNeedKik, 6);
    paramJceOutputStream.write(bUpdateFlag, 7);
    paramJceOutputStream.write(timeStamp, 8);
    paramJceOutputStream.write(bCrashFlag, 9);
    if (strClientIP != null) {
      paramJceOutputStream.write(strClientIP, 10);
    }
    paramJceOutputStream.write(iClientPort, 11);
    paramJceOutputStream.write(iHelloInterval, 12);
    paramJceOutputStream.write(iLargeSeq, 13);
    paramJceOutputStream.write(bLargeSeqUpdate, 14);
  }
}
