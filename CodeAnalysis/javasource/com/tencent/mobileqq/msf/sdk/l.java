package com.tencent.mobileqq.msf.sdk;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class l
  extends JceStruct
{
  static NotifyRegisterInfo f;
  static CommandCallbackerInfo g;
  public int a = 0;
  public String b = "";
  public String c = "";
  public NotifyRegisterInfo d = null;
  public CommandCallbackerInfo e = null;
  
  public l() {}
  
  public l(int paramInt, String paramString1, String paramString2, NotifyRegisterInfo paramNotifyRegisterInfo, CommandCallbackerInfo paramCommandCallbackerInfo)
  {
    a = paramInt;
    b = paramString1;
    c = paramString2;
    d = paramNotifyRegisterInfo;
    e = paramCommandCallbackerInfo;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 1, true);
    b = paramJceInputStream.readString(2, true);
    c = paramJceInputStream.readString(3, true);
    if (f == null) {
      f = new NotifyRegisterInfo();
    }
    d = ((NotifyRegisterInfo)paramJceInputStream.read(f, 4, true));
    if (g == null) {
      g = new CommandCallbackerInfo();
    }
    e = ((CommandCallbackerInfo)paramJceInputStream.read(g, 5, true));
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 1);
    paramJceOutputStream.write(b, 2);
    paramJceOutputStream.write(c, 3);
    paramJceOutputStream.write(d, 4);
    paramJceOutputStream.write(e, 5);
  }
}
