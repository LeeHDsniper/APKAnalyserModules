package com.tencent.mobileqq.msf.core.push;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import com.tencent.mobileqq.msf.core.c;
import com.tencent.mobileqq.msf.sdk.CommandCallbackerInfo;
import com.tencent.mobileqq.msf.sdk.NotifyRegisterInfo;
import com.tencent.mobileqq.msf.sdk.PushRegisterInfo;
import com.tencent.qphone.base.util.BaseApplication;

public final class a
  extends JceStruct
{
  static PushRegisterInfo o;
  static NotifyRegisterInfo p;
  static CommandCallbackerInfo q;
  public int a = 0;
  public String b = "";
  public long c = 0L;
  public long d = 0L;
  public long e = 0L;
  public long f = 0L;
  public long g = 0L;
  public long h = 0L;
  public String i = "";
  public String j = "";
  public PushRegisterInfo k = null;
  public NotifyRegisterInfo l = null;
  public CommandCallbackerInfo m = null;
  public String n = "";
  
  public a() {}
  
  public a(int paramInt, String paramString1, long paramLong1, long paramLong2, long paramLong3, long paramLong4, long paramLong5, long paramLong6, String paramString2, String paramString3, PushRegisterInfo paramPushRegisterInfo, NotifyRegisterInfo paramNotifyRegisterInfo, CommandCallbackerInfo paramCommandCallbackerInfo, String paramString4)
  {
    a = paramInt;
    b = paramString1;
    c = paramLong1;
    d = paramLong2;
    e = paramLong3;
    f = paramLong4;
    g = paramLong5;
    h = paramLong6;
    i = paramString2;
    j = paramString3;
    k = paramPushRegisterInfo;
    l = paramNotifyRegisterInfo;
    m = paramCommandCallbackerInfo;
    n = paramString4;
  }
  
  public a(String paramString)
  {
    b = paramString;
    n = ("" + c.e(BaseApplication.getContext()));
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 1, true);
    b = paramJceInputStream.readString(2, true);
    c = paramJceInputStream.read(c, 3, true);
    d = paramJceInputStream.read(d, 4, true);
    e = paramJceInputStream.read(e, 5, false);
    f = paramJceInputStream.read(f, 6, false);
    g = paramJceInputStream.read(g, 7, false);
    h = paramJceInputStream.read(h, 8, false);
    i = paramJceInputStream.readString(9, false);
    j = paramJceInputStream.readString(10, false);
    if (o == null) {
      o = new PushRegisterInfo();
    }
    k = ((PushRegisterInfo)paramJceInputStream.read(o, 11, false));
    if (p == null) {
      p = new NotifyRegisterInfo();
    }
    l = ((NotifyRegisterInfo)paramJceInputStream.read(p, 12, false));
    if (q == null) {
      q = new CommandCallbackerInfo();
    }
    m = ((CommandCallbackerInfo)paramJceInputStream.read(q, 13, false));
    n = paramJceInputStream.readString(14, false);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 1);
    paramJceOutputStream.write(b, 2);
    paramJceOutputStream.write(c, 3);
    paramJceOutputStream.write(d, 4);
    paramJceOutputStream.write(e, 5);
    paramJceOutputStream.write(f, 6);
    paramJceOutputStream.write(g, 7);
    paramJceOutputStream.write(h, 8);
    if (i != null) {
      paramJceOutputStream.write(i, 9);
    }
    if (j != null) {
      paramJceOutputStream.write(j, 10);
    }
    if (k != null) {
      paramJceOutputStream.write(k, 11);
    }
    if (l != null) {
      paramJceOutputStream.write(l, 12);
    }
    if (m != null) {
      paramJceOutputStream.write(m, 13);
    }
    if (n != null) {
      paramJceOutputStream.write(n, 14);
    }
  }
}
