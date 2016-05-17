package com.tencent.mobileqq.msf.sdk;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import java.util.ArrayList;

public final class PushRegisterInfo
  extends JceStruct
{
  static ArrayList cache_pushIds;
  public byte bKikPC = 0;
  public byte bKikWeak = 0;
  public long iLargeSeq = 0L;
  public int iStatus = 0;
  public ArrayList pushIds = null;
  public long timeStamp = 0L;
  public String uin = "";
  
  public PushRegisterInfo() {}
  
  public PushRegisterInfo(String paramString, ArrayList paramArrayList, int paramInt, byte paramByte1, byte paramByte2, long paramLong1, long paramLong2)
  {
    uin = paramString;
    pushIds = paramArrayList;
    iStatus = paramInt;
    bKikPC = paramByte1;
    bKikWeak = paramByte2;
    timeStamp = paramLong1;
    iLargeSeq = paramLong2;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    uin = paramJceInputStream.readString(1, true);
    if (cache_pushIds == null)
    {
      cache_pushIds = new ArrayList();
      cache_pushIds.add(Long.valueOf(0L));
    }
    pushIds = ((ArrayList)paramJceInputStream.read(cache_pushIds, 2, true));
    iStatus = paramJceInputStream.read(iStatus, 3, true);
    bKikPC = paramJceInputStream.read(bKikPC, 4, true);
    bKikWeak = paramJceInputStream.read(bKikWeak, 5, true);
    timeStamp = paramJceInputStream.read(timeStamp, 6, true);
    iLargeSeq = paramJceInputStream.read(iLargeSeq, 7, false);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(uin, 1);
    paramJceOutputStream.write(pushIds, 2);
    paramJceOutputStream.write(iStatus, 3);
    paramJceOutputStream.write(bKikPC, 4);
    paramJceOutputStream.write(bKikWeak, 5);
    paramJceOutputStream.write(timeStamp, 6);
    paramJceOutputStream.write(iLargeSeq, 7);
  }
}
