package com.tencent.mobileqq.msf.sdk;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import java.util.ArrayList;

public final class CommandCallbackerInfo
  extends JceStruct
{
  static ArrayList cache_cmds;
  public ArrayList cmds = null;
  public String uin = "";
  
  public CommandCallbackerInfo() {}
  
  public CommandCallbackerInfo(String paramString, ArrayList paramArrayList)
  {
    uin = paramString;
    cmds = paramArrayList;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    uin = paramJceInputStream.readString(1, true);
    if (cache_cmds == null)
    {
      cache_cmds = new ArrayList();
      cache_cmds.add("");
    }
    cmds = ((ArrayList)paramJceInputStream.read(cache_cmds, 2, true));
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(uin, 1);
    paramJceOutputStream.write(cmds, 2);
  }
}
