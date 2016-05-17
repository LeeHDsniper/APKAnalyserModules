package com.tencent.msf.service.protocol.push;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class RequestMSFForceOffline
  extends JceStruct
{
  static byte[] cache_vecSigKickData;
  public byte bKickType = 0;
  public byte bSameDevice = 0;
  public byte bSigKick = 0;
  public long iSeqno = 0L;
  public long lUin = 0L;
  public String strInfo = "";
  public String strTitle = "";
  public byte[] vecSigKickData = null;
  
  public RequestMSFForceOffline() {}
  
  public RequestMSFForceOffline(long paramLong1, long paramLong2, byte paramByte1, String paramString1, String paramString2, byte paramByte2, byte[] paramArrayOfByte, byte paramByte3)
  {
    lUin = paramLong1;
    iSeqno = paramLong2;
    bKickType = paramByte1;
    strInfo = paramString1;
    strTitle = paramString2;
    bSigKick = paramByte2;
    vecSigKickData = paramArrayOfByte;
    bSameDevice = paramByte3;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    lUin = paramJceInputStream.read(lUin, 0, true);
    iSeqno = paramJceInputStream.read(iSeqno, 1, true);
    bKickType = paramJceInputStream.read(bKickType, 2, true);
    strInfo = paramJceInputStream.readString(3, true);
    strTitle = paramJceInputStream.readString(4, false);
    bSigKick = paramJceInputStream.read(bSigKick, 5, false);
    if (cache_vecSigKickData == null)
    {
      cache_vecSigKickData = (byte[])new byte[1];
      ((byte[])cache_vecSigKickData)[0] = 0;
    }
    vecSigKickData = ((byte[])paramJceInputStream.read(cache_vecSigKickData, 6, false));
    bSameDevice = paramJceInputStream.read(bSameDevice, 7, false);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(lUin, 0);
    paramJceOutputStream.write(iSeqno, 1);
    paramJceOutputStream.write(bKickType, 2);
    paramJceOutputStream.write(strInfo, 3);
    if (strTitle != null) {
      paramJceOutputStream.write(strTitle, 4);
    }
    paramJceOutputStream.write(bSigKick, 5);
    if (vecSigKickData != null) {
      paramJceOutputStream.write(vecSigKickData, 6);
    }
    paramJceOutputStream.write(bSameDevice, 7);
  }
}
