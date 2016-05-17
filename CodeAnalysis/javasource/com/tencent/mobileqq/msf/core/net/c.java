package com.tencent.mobileqq.msf.core.net;

import com.tencent.mobileqq.msf.core.d;
import com.tencent.qphone.base.util.MsfSocketInputBuffer;

public abstract interface c
{
  public abstract void a(MsfSocketInputBuffer paramMsfSocketInputBuffer)
    throws Exception;
  
  public abstract byte[] a(d paramD, String paramString1, String paramString2, byte[] paramArrayOfByte);
}
