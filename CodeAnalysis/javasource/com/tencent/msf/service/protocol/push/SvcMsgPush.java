package com.tencent.msf.service.protocol.push;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import java.util.ArrayList;

public final class SvcMsgPush
  extends JceStruct
{
  static ArrayList cache_vecMsgInfos;
  public byte cMore = 0;
  public int iUnread = 0;
  public ArrayList vecMsgInfos = null;
  
  public SvcMsgPush() {}
  
  public SvcMsgPush(byte paramByte, int paramInt, ArrayList paramArrayList)
  {
    cMore = paramByte;
    iUnread = paramInt;
    vecMsgInfos = paramArrayList;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    cMore = paramJceInputStream.read(cMore, 0, true);
    iUnread = paramJceInputStream.read(iUnread, 1, true);
    if (cache_vecMsgInfos == null)
    {
      cache_vecMsgInfos = new ArrayList();
      SvcMsgInfo localSvcMsgInfo = new SvcMsgInfo();
      cache_vecMsgInfos.add(localSvcMsgInfo);
    }
    vecMsgInfos = ((ArrayList)paramJceInputStream.read(cache_vecMsgInfos, 2, true));
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(cMore, 0);
    paramJceOutputStream.write(iUnread, 1);
    paramJceOutputStream.write(vecMsgInfos, 2);
  }
}
