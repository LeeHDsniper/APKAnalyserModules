package com.tencent.msf.service.protocol.a;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class a
  extends JceStruct
{
  public boolean a = true;
  public boolean b = true;
  public boolean c = true;
  
  public a() {}
  
  public a(boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    a = paramBoolean1;
    b = paramBoolean2;
    c = paramBoolean3;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 0, false);
    b = paramJceInputStream.read(b, 1, false);
    c = paramJceInputStream.read(c, 2, false);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 0);
    paramJceOutputStream.write(b, 1);
    paramJceOutputStream.write(c, 2);
  }
}
