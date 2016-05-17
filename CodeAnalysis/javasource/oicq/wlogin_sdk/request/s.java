package oicq.wlogin_sdk.request;

import oicq.wlogin_sdk.tlv_type.a;
import oicq.wlogin_sdk.tlv_type.aw;
import oicq.wlogin_sdk.tlv_type.bi;
import oicq.wlogin_sdk.tlv_type.bm;
import oicq.wlogin_sdk.tlv_type.bn;
import oicq.wlogin_sdk.tlv_type.cq;
import oicq.wlogin_sdk.tlv_type.f;
import oicq.wlogin_sdk.tlv_type.t;
import oicq.wlogin_sdk.tools.ErrMsg;
import oicq.wlogin_sdk.tools.util;

public class s
  extends k
{
  static int D = 0;
  
  public s(u paramU)
  {
    s = 2064;
    t = 8;
    u = "wtlogin.login";
    w = paramU;
    w.m = 0;
  }
  
  public int a(long paramLong, int paramInt1, int paramInt2, long[] paramArrayOfLong, WUserSigInfo paramWUserSigInfo)
  {
    int j = u.u;
    Object localObject = u.b(w.h);
    f localF = _t104;
    if (localF == null) {
      localF = new f();
    }
    for (;;)
    {
      localObject = _t174;
      if (localObject == null) {
        localObject = new bi();
      }
      for (;;)
      {
        int i = 0;
        for (;;)
        {
          byte[] arrayOfByte = a(localF.b(), paramLong, ((bi)localObject).b(), paramInt1, paramInt2, paramArrayOfLong);
          a(h, s, this.i, w.f, l, m, j, o, arrayOfByte);
          int k = a(String.valueOf(w.f), false, paramWUserSigInfo);
          if (k != 0) {
            return k;
          }
          k = b();
          util.LOGI("retry num:" + i + " ret:" + k, "" + w.f);
          if (k != 180) {
            return k;
          }
          if (i >= 1) {
            return k;
          }
          i += 1;
        }
      }
    }
  }
  
  public byte[] a(byte[] paramArrayOfByte1, long paramLong, byte[] paramArrayOfByte2, int paramInt1, int paramInt2, long[] paramArrayOfLong)
  {
    Object localObject1 = new cq();
    f localF = new f();
    t localT = new t();
    Object localObject4 = new bi();
    Object localObject3 = new bm();
    Object localObject2 = new a(407);
    localObject1 = ((cq)localObject1).a(0, u.s, 0);
    paramArrayOfByte1 = localF.a(paramArrayOfByte1);
    paramArrayOfLong = localT.a(paramInt1, paramInt2, paramArrayOfLong);
    paramArrayOfByte2 = ((bi)localObject4).a(paramArrayOfByte2);
    localObject3 = ((bm)localObject3).a(paramLong);
    ((a)localObject2).a(new byte[] { (byte)D }, 1);
    localObject2 = ((a)localObject2).a();
    localObject4 = new byte[localObject1.length + paramArrayOfByte1.length + paramArrayOfLong.length + paramArrayOfByte2.length + localObject3.length + localObject2.length];
    System.arraycopy(localObject1, 0, localObject4, 0, localObject1.length);
    paramInt1 = localObject1.length + 0;
    System.arraycopy(paramArrayOfByte1, 0, localObject4, paramInt1, paramArrayOfByte1.length);
    paramInt1 += paramArrayOfByte1.length;
    System.arraycopy(paramArrayOfLong, 0, localObject4, paramInt1, paramArrayOfLong.length);
    paramInt1 += paramArrayOfLong.length;
    System.arraycopy(paramArrayOfByte2, 0, localObject4, paramInt1, paramArrayOfByte2.length);
    paramInt1 += paramArrayOfByte2.length;
    System.arraycopy(localObject3, 0, localObject4, paramInt1, localObject3.length);
    paramInt1 += localObject3.length;
    System.arraycopy(localObject2, 0, localObject4, paramInt1, localObject2.length);
    paramInt1 = localObject2.length;
    return a((byte[])localObject4, t, 6);
  }
  
  public int c(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    f localF = new f();
    bn localBn = new bn();
    aw localAw = new aw();
    async_context localAsync_context = u.b(w.h);
    paramInt2 = c(paramArrayOfByte, paramInt1 + 2);
    util.LOGD(getClass().getName(), "type=" + paramInt2);
    int j = paramInt1 + 5;
    switch (paramInt2)
    {
    default: 
      b(paramArrayOfByte, j, b - j - 1);
      paramInt1 = paramInt2;
    }
    int i;
    do
    {
      do
      {
        do
        {
          return paramInt1;
          i = localF.b(paramArrayOfByte, j, b - j);
          paramInt1 = i;
        } while (i < 0);
        _t104 = localF;
        i = localBn.b(paramArrayOfByte, j, b - j);
        paramInt1 = i;
      } while (i < 0);
      _t17b = localBn;
      a((ErrMsg)null);
      return paramInt2;
      i = localAw.b(paramArrayOfByte, j, b - j - 1);
      paramInt1 = i;
    } while (i < 0);
    a(localAw);
    b(paramArrayOfByte, j, b - j - 1);
    return paramInt2;
  }
}
