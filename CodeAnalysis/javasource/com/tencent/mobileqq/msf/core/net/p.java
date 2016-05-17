package com.tencent.mobileqq.msf.core.net;

import com.tencent.mobileqq.msf.core.MsfCore;
import com.tencent.mobileqq.msf.core.d;
import com.tencent.mobileqq.msf.core.w;
import com.tencent.qphone.base.util.MsfSocketInputBuffer;

public class p
  implements c
{
  MsfCore a;
  
  public p(MsfCore paramMsfCore)
  {
    a = paramMsfCore;
  }
  
  public void a(MsfSocketInputBuffer paramMsfSocketInputBuffer)
    throws Exception
  {
    byte[] arrayOfByte = new byte[paramMsfSocketInputBuffer.getBufferlen()];
    System.arraycopy(paramMsfSocketInputBuffer.getBuffer(), 0, arrayOfByte, 0, arrayOfByte.length);
    a.sender.c(arrayOfByte);
  }
  
  public byte[] a(d paramD, String paramString1, String paramString2, byte[] paramArrayOfByte)
  {
    return paramArrayOfByte;
  }
}
