package com.tencent.msf.service.protocol.push;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class SvcMsgInfo
  extends JceStruct
{
  public int iMsgType = 0;
  public long lFromUin = 0L;
  public String strOther = "";
  public int tTimeStamp = 0;
  
  public SvcMsgInfo() {}
  
  public SvcMsgInfo(long paramLong, int paramInt1, int paramInt2, String paramString)
  {
    lFromUin = paramLong;
    tTimeStamp = paramInt1;
    iMsgType = paramInt2;
    strOther = paramString;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    lFromUin = paramJceInputStream.read(lFromUin, 0, true);
    tTimeStamp = paramJceInputStream.read(tTimeStamp, 1, true);
    iMsgType = paramJceInputStream.read(iMsgType, 2, true);
    strOther = paramJceInputStream.readString(3, true);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(lFromUin, 0);
    paramJceOutputStream.write(tTimeStamp, 1);
    paramJceOutputStream.write(iMsgType, 2);
    paramJceOutputStream.write(strOther, 3);
  }
}
