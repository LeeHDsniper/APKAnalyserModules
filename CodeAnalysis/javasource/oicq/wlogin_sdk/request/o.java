package oicq.wlogin_sdk.request;

import oicq.wlogin_sdk.tlv_type.cb;
import oicq.wlogin_sdk.tlv_type.cf;
import oicq.wlogin_sdk.tlv_type.cq;
import oicq.wlogin_sdk.tlv_type.f;
import oicq.wlogin_sdk.tlv_type.g;
import oicq.wlogin_sdk.tlv_type.t;
import oicq.wlogin_sdk.tools.util;

public class o
  extends k
{
  public static boolean D = false;
  
  public o(u paramU)
  {
    s = 2064;
    t = 2;
    u = "wtlogin.login";
    w = paramU;
    w.m = 0;
  }
  
  public int a(byte[] paramArrayOfByte, int paramInt1, int paramInt2, long[] paramArrayOfLong, WUserSigInfo paramWUserSigInfo)
  {
    int j = u.u;
    Object localObject = u.b(w.h);
    f localF = _t104;
    if (localF == null) {
      localF = new f();
    }
    for (;;)
    {
      localObject = _t105;
      if (localObject == null) {
        localObject = new g();
      }
      for (;;)
      {
        int i = 0;
        for (;;)
        {
          byte[] arrayOfByte = a(localF.b(), paramArrayOfByte, ((g)localObject).g(), paramInt1, paramInt2, paramArrayOfLong);
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
  
  public byte[] a(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2, byte[] paramArrayOfByte3, int paramInt1, int paramInt2, long[] paramArrayOfLong)
  {
    cf localCf = new cf();
    Object localObject1 = new cq();
    Object localObject2 = new f();
    t localT = new t();
    cb localCb = new cb();
    localObject1 = ((cq)localObject1).a(0, u.s, 0);
    localObject2 = ((f)localObject2).a(paramArrayOfByte1);
    paramArrayOfLong = localT.a(paramInt1, paramInt2, paramArrayOfLong);
    if (D) {}
    for (paramArrayOfByte1 = localCb.a(paramArrayOfByte2);; paramArrayOfByte1 = localCf.a(paramArrayOfByte2, paramArrayOfByte3))
    {
      paramArrayOfByte2 = new byte[paramArrayOfByte1.length + localObject1.length + localObject2.length + paramArrayOfLong.length];
      System.arraycopy(paramArrayOfByte1, 0, paramArrayOfByte2, 0, paramArrayOfByte1.length);
      paramInt1 = paramArrayOfByte1.length + 0;
      System.arraycopy(localObject1, 0, paramArrayOfByte2, paramInt1, localObject1.length);
      paramInt1 += localObject1.length;
      System.arraycopy(localObject2, 0, paramArrayOfByte2, paramInt1, localObject2.length);
      paramInt1 += localObject2.length;
      System.arraycopy(paramArrayOfLong, 0, paramArrayOfByte2, paramInt1, paramArrayOfLong.length);
      paramInt1 = paramArrayOfLong.length;
      return a(paramArrayOfByte2, t, 4);
    }
  }
}
