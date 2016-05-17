package oicq.wlogin_sdk.request;

import java.lang.reflect.Array;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Socket;
import oicq.wlogin_sdk.report.report_t1;
import oicq.wlogin_sdk.report.report_t3;
import oicq.wlogin_sdk.tlv_type.a;
import oicq.wlogin_sdk.tlv_type.aa;
import oicq.wlogin_sdk.tlv_type.ac;
import oicq.wlogin_sdk.tlv_type.ad;
import oicq.wlogin_sdk.tlv_type.ag;
import oicq.wlogin_sdk.tlv_type.ah;
import oicq.wlogin_sdk.tlv_type.ai;
import oicq.wlogin_sdk.tlv_type.aj;
import oicq.wlogin_sdk.tlv_type.am;
import oicq.wlogin_sdk.tlv_type.ao;
import oicq.wlogin_sdk.tlv_type.ap;
import oicq.wlogin_sdk.tlv_type.as;
import oicq.wlogin_sdk.tlv_type.at;
import oicq.wlogin_sdk.tlv_type.aw;
import oicq.wlogin_sdk.tlv_type.ax;
import oicq.wlogin_sdk.tlv_type.ay;
import oicq.wlogin_sdk.tlv_type.ba;
import oicq.wlogin_sdk.tlv_type.bb;
import oicq.wlogin_sdk.tlv_type.bc;
import oicq.wlogin_sdk.tlv_type.bd;
import oicq.wlogin_sdk.tlv_type.bf;
import oicq.wlogin_sdk.tlv_type.bg;
import oicq.wlogin_sdk.tlv_type.bh;
import oicq.wlogin_sdk.tlv_type.bi;
import oicq.wlogin_sdk.tlv_type.bk;
import oicq.wlogin_sdk.tlv_type.bl;
import oicq.wlogin_sdk.tlv_type.bp;
import oicq.wlogin_sdk.tlv_type.bq;
import oicq.wlogin_sdk.tlv_type.bs;
import oicq.wlogin_sdk.tlv_type.bt;
import oicq.wlogin_sdk.tlv_type.bw;
import oicq.wlogin_sdk.tlv_type.ca;
import oicq.wlogin_sdk.tlv_type.cd;
import oicq.wlogin_sdk.tlv_type.ce;
import oicq.wlogin_sdk.tlv_type.cg;
import oicq.wlogin_sdk.tlv_type.cj;
import oicq.wlogin_sdk.tlv_type.cm;
import oicq.wlogin_sdk.tlv_type.cn;
import oicq.wlogin_sdk.tlv_type.co;
import oicq.wlogin_sdk.tlv_type.e;
import oicq.wlogin_sdk.tlv_type.f;
import oicq.wlogin_sdk.tlv_type.g;
import oicq.wlogin_sdk.tlv_type.j;
import oicq.wlogin_sdk.tlv_type.l;
import oicq.wlogin_sdk.tlv_type.m;
import oicq.wlogin_sdk.tlv_type.n;
import oicq.wlogin_sdk.tlv_type.o;
import oicq.wlogin_sdk.tlv_type.p;
import oicq.wlogin_sdk.tlv_type.r;
import oicq.wlogin_sdk.tlv_type.s;
import oicq.wlogin_sdk.tlv_type.v;
import oicq.wlogin_sdk.tlv_type.w;
import oicq.wlogin_sdk.tlv_type.x;
import oicq.wlogin_sdk.tlv_type.y;
import oicq.wlogin_sdk.tlv_type.z;
import oicq.wlogin_sdk.tools.ErrMsg;
import oicq.wlogin_sdk.tools.InternationMsg;
import oicq.wlogin_sdk.tools.InternationMsg.MSG_TYPE;
import oicq.wlogin_sdk.tools.MD5;
import oicq.wlogin_sdk.tools.cryptor;
import oicq.wlogin_sdk.tools.util;

public class k
{
  static int A = 0;
  static String B = "";
  static String C = "";
  static String[] x = { "183.60.18.138", "112.90.85.191", "112.90.85.193", "183.60.18.150", "183.61.37.157", "120.204.200.34", "163.177.90.224" };
  static String[] y = { "112.90.141.48", "113.108.11.157", "113.108.11.159", "183.61.37.156" };
  int a = 4096;
  int b = 0;
  int c = 27;
  int d = 0;
  public int e = 15;
  protected int f = 0;
  protected byte[] g = new byte[a];
  protected int h = 8001;
  protected int i = 0;
  protected int j = 3;
  protected int k = 0;
  protected int l = 0;
  protected int m = 2;
  protected int n = 0;
  protected int o = 0;
  InetSocketAddress p = null;
  int q = 0;
  byte[] r = new byte['᠀'];
  protected int s = 0;
  protected int t = 0;
  protected String u = "";
  byte v;
  public u w;
  int z = 0;
  
  public k() {}
  
  private void a(int paramInt1, long paramLong, int paramInt2, int paramInt3, boolean paramBoolean1, boolean paramBoolean2)
  {
    report_t3 localReport_t3 = new report_t3();
    _cmd = s;
    _sub = t;
    _rst2 = paramInt1;
    _used = ((int)(System.currentTimeMillis() - paramLong));
    _try = paramInt3;
    _host = C;
    if (_host == null) {
      _host = "";
    }
    if (p == null)
    {
      _ip = "";
      _port = c(paramBoolean1);
      _conn = paramInt2;
      _net = u.B;
      _str = "";
      _slen = 0;
      _rlen = 0;
      if (!paramBoolean1) {
        break label185;
      }
      if (!paramBoolean2) {
        break label176;
      }
      _wap = 2;
    }
    for (;;)
    {
      u.ah.add_t3(localReport_t3);
      return;
      _ip = p.getAddress().getHostAddress();
      break;
      label176:
      _wap = 1;
      continue;
      label185:
      _wap = 0;
    }
  }
  
  public static void a(int paramInt, String paramString)
  {
    A = paramInt;
    B = paramString;
  }
  
  public static byte[] b(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2)
  {
    byte[] arrayOfByte = new byte[paramArrayOfByte1.length + paramArrayOfByte2.length];
    System.arraycopy(paramArrayOfByte1, 0, arrayOfByte, 0, paramArrayOfByte1.length);
    System.arraycopy(paramArrayOfByte2, 0, arrayOfByte, paramArrayOfByte1.length, paramArrayOfByte2.length);
    return arrayOfByte;
  }
  
  public int a(int paramInt)
  {
    bw.h)._last_flowid = paramInt;
    return paramInt;
  }
  
  public int a(String paramString, boolean paramBoolean, WUserSigInfo paramWUserSigInfo)
  {
    if (w.e()) {}
    for (int i1 = b(paramString, paramBoolean, paramWUserSigInfo);; i1 = e())
    {
      if (i1 == 64536)
      {
        paramString = new ErrMsg();
        paramString.setMessage(InternationMsg.a(InternationMsg.MSG_TYPE.MSG_4));
        a(paramString);
      }
      return i1;
    }
  }
  
  public int a(aw paramAw)
  {
    bh localBh = new bh();
    bg localBg = new bg();
    paramAw = paramAw.b();
    int i1 = paramAw.length;
    if (localBh.b(paramAw, 2, i1) > 0) {
      a(localBh);
    }
    if (localBg.b(paramAw, 2, i1) > 0)
    {
      w.m = 1;
      w.p = localBg.b();
      util.LOGI("get rollback sig", "");
    }
    return 0;
  }
  
  public int a(bh paramBh)
  {
    paramBh = paramBh.b();
    int i3;
    int i2;
    int i1;
    if ((paramBh != null) && (paramBh.length > 2))
    {
      i3 = util.buf_to_int8(paramBh, 1);
      i2 = 2;
      i1 = 0;
    }
    for (;;)
    {
      if ((i1 >= i3) || (paramBh.length < i2 + 1)) {}
      int i4;
      byte[] arrayOfByte;
      do
      {
        do
        {
          do
          {
            return 0;
            i4 = util.buf_to_int8(paramBh, i2);
            i5 = i2 + 1;
          } while (paramBh.length < i5 + 2);
          i2 = util.buf_to_int16(paramBh, i5);
          i5 += 2;
        } while (paramBh.length < i5 + i2);
        arrayOfByte = new byte[i2];
        System.arraycopy(paramBh, i5, arrayOfByte, 0, i2);
        i2 = i5 + i2;
      } while (paramBh.length < i2 + 2);
      int i5 = util.buf_to_int16(paramBh, i2);
      i2 += 2;
      a(i4, arrayOfByte, i5);
      i1 += 1;
    }
  }
  
  public int a(byte[] paramArrayOfByte1, int paramInt1, int paramInt2, byte[] paramArrayOfByte2)
  {
    paramArrayOfByte1 = cryptor.decrypt(paramArrayOfByte1, paramInt1, paramInt2, paramArrayOfByte2);
    if (paramArrayOfByte1 == null) {
      return 64534;
    }
    f = paramArrayOfByte1.length;
    if (paramArrayOfByte1.length + e + 2 > a)
    {
      a = (paramArrayOfByte1.length + e + 2);
      paramArrayOfByte2 = new byte[a];
      System.arraycopy(g, 0, paramArrayOfByte2, 0, b);
      g = paramArrayOfByte2;
    }
    b = 0;
    System.arraycopy(paramArrayOfByte1, 0, g, paramInt1, paramArrayOfByte1.length);
    paramInt1 = b;
    paramInt2 = e;
    b = (paramArrayOfByte1.length + (paramInt2 + 2) + paramInt1);
    return 0;
  }
  
  public String a(int paramInt, boolean paramBoolean)
  {
    String str1 = "";
    paramInt /= 2;
    String str2;
    if ((A != 0) && (B != null) && (B.length() > 0)) {
      str2 = B;
    }
    for (;;)
    {
      C = str2;
      return str2;
      if (paramInt < 1)
      {
        if (paramBoolean) {
          if (u.B == 1) {
            str1 = new String(util.get_wap_server_host1(u.r));
          }
        }
        for (;;)
        {
          str2 = str1;
          if (str1.length() > 0) {
            break;
          }
          str2 = b(paramBoolean);
          break;
          if (u.B == 2)
          {
            str1 = new String(util.get_wap_server_host2(u.r));
            continue;
            if (u.B == 1) {
              str1 = new String(util.get_server_host1(u.r));
            } else if (u.B == 2) {
              str1 = new String(util.get_server_host2(u.r));
            }
          }
        }
      }
      if (paramInt < 2) {
        str2 = b(paramBoolean);
      } else {
        str2 = a(paramBoolean);
      }
    }
  }
  
  public String a(boolean paramBoolean)
  {
    if (!paramBoolean) {
      return x[((int)(Math.random() * 2.147483647E9D) % x.length)];
    }
    return y[((int)(Math.random() * 2.147483647E9D) % y.length)];
  }
  
  public void a()
  {
    util.int8_to_buf(g, b, 3);
    b += 1;
  }
  
  public void a(int paramInt1, int paramInt2, int paramInt3, long paramLong, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8)
  {
    paramInt3 = i + 1;
    i = paramInt3;
    b = 0;
    util.int8_to_buf(g, b, 2);
    b += 1;
    util.int16_to_buf(g, b, c + 2 + paramInt8);
    b += 2;
    util.int16_to_buf(g, b, paramInt1);
    b += 2;
    util.int16_to_buf(g, b, paramInt2);
    b += 2;
    util.int16_to_buf(g, b, paramInt3);
    b += 2;
    util.int32_to_buf(g, b, (int)paramLong);
    b += 4;
    util.int8_to_buf(g, b, 3);
    b += 1;
    util.int8_to_buf(g, b, 7);
    b += 1;
    util.int8_to_buf(g, b, paramInt4);
    b += 1;
    util.int32_to_buf(g, b, paramInt5);
    b += 4;
    util.int32_to_buf(g, b, paramInt6);
    b += 4;
    util.int32_to_buf(g, b, paramInt7);
    b += 4;
  }
  
  public void a(int paramInt1, int paramInt2, int paramInt3, long paramLong, int paramInt4, int paramInt5, int paramInt6, int paramInt7, byte[] paramArrayOfByte)
  {
    a(paramInt1, paramInt2, paramInt3, paramLong, paramInt4, paramInt5, paramInt6, paramInt7, paramArrayOfByte, paramArrayOfByte.length);
  }
  
  public void a(int paramInt1, int paramInt2, int paramInt3, long paramLong, int paramInt4, int paramInt5, int paramInt6, int paramInt7, byte[] paramArrayOfByte, int paramInt8)
  {
    a(paramInt1, paramInt2, paramInt3, paramLong, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8);
    a(paramArrayOfByte, paramInt8);
    a();
  }
  
  void a(int paramInt1, byte[] paramArrayOfByte, int paramInt2)
  {
    if ((paramArrayOfByte == null) || (paramArrayOfByte.length <= 0)) {
      return;
    }
    if (paramInt1 == 1) {
      if (u.B == 1) {
        util.set_server_host1(u.r, paramArrayOfByte);
      }
    }
    for (;;)
    {
      util.LOGI("net type:" + u.B + " type:" + paramInt1 + " host:" + new String(paramArrayOfByte) + " port:" + paramInt2, "" + w.f);
      return;
      if (u.B == 2)
      {
        util.set_server_host2(u.r, paramArrayOfByte);
        continue;
        if (paramInt1 == 2) {
          if (u.B == 1) {
            util.set_wap_server_host1(u.r, paramArrayOfByte);
          } else if (u.B == 2) {
            util.set_wap_server_host2(u.r, paramArrayOfByte);
          }
        }
      }
    }
  }
  
  public void a(Socket paramSocket)
  {
    w.ad = paramSocket;
  }
  
  public void a(as paramAs)
  {
    try
    {
      ErrMsg localErrMsg = new ErrMsg();
      if (paramAs != null)
      {
        localErrMsg.setType(paramAs.f());
        localErrMsg.setTitle(new String(paramAs.g()));
        localErrMsg.setMessage(new String(paramAs.h()));
        localErrMsg.setOtherinfo(new String(paramAs.i()));
        new d(u.r, localErrMsg).start();
      }
      return;
    }
    catch (Exception paramAs) {}
  }
  
  public void a(ErrMsg paramErrMsg)
  {
    async_context localAsync_context = u.b(w.h);
    _last_err_msg = new ErrMsg(0, "", "", "");
    if (paramErrMsg != null) {}
    try
    {
      _last_err_msg = ((ErrMsg)paramErrMsg.clone());
      return;
    }
    catch (CloneNotSupportedException paramErrMsg)
    {
      _last_err_msg = new ErrMsg(0, "", "", "");
    }
  }
  
  public void a(byte[] paramArrayOfByte, int paramInt)
  {
    if (b + paramInt + 1 > a)
    {
      a = (b + paramInt + 1 + 128);
      byte[] arrayOfByte = new byte[a];
      System.arraycopy(g, 0, arrayOfByte, 0, b);
      g = arrayOfByte;
    }
    System.arraycopy(paramArrayOfByte, 0, g, b, paramInt);
    b += paramInt;
  }
  
  public byte[] a(bb paramBb)
  {
    Object localObject4 = new oicq.wlogin_sdk.tlv_type.h();
    Object localObject3 = new n();
    Object localObject2 = new bc();
    Object localObject1 = new ao();
    paramBb = paramBb.b();
    int i1 = paramBb.length;
    if (((oicq.wlogin_sdk.tlv_type.h)localObject4).b(paramBb, 2, i1) < 0) {}
    while ((((n)localObject3).b(paramBb, 2, i1) < 0) || (((bc)localObject2).b(paramBb, 2, i1) < 0)) {
      return null;
    }
    paramBb = ((oicq.wlogin_sdk.tlv_type.h)localObject4).a();
    localObject3 = ((n)localObject3).a();
    localObject2 = ((bc)localObject2).a();
    localObject1 = ((ao)localObject1).a(u.y);
    localObject4 = new byte[paramBb.length + 3 + localObject3.length + localObject2.length + localObject1.length];
    localObject4[0] = 64;
    util.int16_to_buf((byte[])localObject4, 1, 4);
    System.arraycopy(paramBb, 0, localObject4, 3, paramBb.length);
    i1 = paramBb.length + 3;
    System.arraycopy(localObject3, 0, localObject4, i1, localObject3.length);
    i1 += localObject3.length;
    System.arraycopy(localObject2, 0, localObject4, i1, localObject2.length);
    i1 += localObject2.length;
    System.arraycopy(localObject1, 0, localObject4, i1, localObject1.length);
    i1 = localObject1.length;
    return localObject4;
  }
  
  protected byte[] a(byte[] paramArrayOfByte)
  {
    if (w.m == 0) {
      return a(paramArrayOfByte, w.c, w.n, w.o);
    }
    return a(paramArrayOfByte, w.c);
  }
  
  byte[] a(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    byte[] arrayOfByte = new byte[paramArrayOfByte.length + 4];
    util.int16_to_buf(arrayOfByte, 0, paramInt1);
    util.int16_to_buf(arrayOfByte, 2, paramInt2);
    System.arraycopy(paramArrayOfByte, 0, arrayOfByte, 4, paramArrayOfByte.length);
    if (w.m == 0) {
      return a(arrayOfByte, w.c, w.n, w.o);
    }
    return a(arrayOfByte, w.c);
  }
  
  byte[] a(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2)
  {
    if ((paramArrayOfByte1 == null) || (paramArrayOfByte2 == null)) {
      return new byte[0];
    }
    if (w.m == 2) {}
    for (int i1 = 3;; i1 = 2)
    {
      paramArrayOfByte1 = cryptor.encrypt(paramArrayOfByte1, 0, paramArrayOfByte1.length, paramArrayOfByte2);
      byte[] arrayOfByte = new byte[paramArrayOfByte2.length + 2 + 2 + 2 + paramArrayOfByte1.length];
      util.int8_to_buf(arrayOfByte, 0, 1);
      util.int8_to_buf(arrayOfByte, 1, i1);
      System.arraycopy(paramArrayOfByte2, 0, arrayOfByte, 2, paramArrayOfByte2.length);
      i1 = paramArrayOfByte2.length + 2;
      util.int16_to_buf(arrayOfByte, i1, 258);
      i1 += 2;
      util.int16_to_buf(arrayOfByte, i1, 0);
      i1 += 2;
      System.arraycopy(paramArrayOfByte1, 0, arrayOfByte, i1, paramArrayOfByte1.length);
      i1 = paramArrayOfByte1.length;
      return arrayOfByte;
    }
  }
  
  public byte[] a(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2, byte[] paramArrayOfByte3)
  {
    if ((paramArrayOfByte1 == null) || (paramArrayOfByte2 == null) || (paramArrayOfByte3 == null)) {
      return new byte[16];
    }
    byte[] arrayOfByte = new byte[paramArrayOfByte1.length + paramArrayOfByte2.length + paramArrayOfByte3.length];
    System.arraycopy(paramArrayOfByte1, 0, arrayOfByte, 0, paramArrayOfByte1.length);
    int i1 = paramArrayOfByte1.length + 0;
    System.arraycopy(paramArrayOfByte2, 0, arrayOfByte, i1, paramArrayOfByte2.length);
    i1 += paramArrayOfByte2.length;
    System.arraycopy(paramArrayOfByte3, 0, arrayOfByte, i1, paramArrayOfByte3.length);
    i1 = paramArrayOfByte3.length;
    return MD5.toMD5Byte(arrayOfByte);
  }
  
  byte[] a(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2, byte[] paramArrayOfByte3, byte[] paramArrayOfByte4)
  {
    if ((paramArrayOfByte1 == null) || (paramArrayOfByte2 == null) || (paramArrayOfByte3 == null) || (paramArrayOfByte4 == null)) {
      return new byte[0];
    }
    paramArrayOfByte1 = cryptor.encrypt(paramArrayOfByte1, 0, paramArrayOfByte1.length, paramArrayOfByte4);
    paramArrayOfByte4 = new byte[paramArrayOfByte2.length + 2 + 2 + 2 + paramArrayOfByte3.length + paramArrayOfByte1.length];
    util.int8_to_buf(paramArrayOfByte4, 0, 1);
    util.int8_to_buf(paramArrayOfByte4, 1, 1);
    System.arraycopy(paramArrayOfByte2, 0, paramArrayOfByte4, 2, paramArrayOfByte2.length);
    int i1 = paramArrayOfByte2.length + 2;
    util.int16_to_buf(paramArrayOfByte4, i1, 258);
    i1 += 2;
    util.int16_to_buf(paramArrayOfByte4, i1, paramArrayOfByte3.length);
    i1 += 2;
    System.arraycopy(paramArrayOfByte3, 0, paramArrayOfByte4, i1, paramArrayOfByte3.length);
    i1 += paramArrayOfByte3.length;
    System.arraycopy(paramArrayOfByte1, 0, paramArrayOfByte4, i1, paramArrayOfByte1.length);
    i1 = paramArrayOfByte1.length;
    return paramArrayOfByte4;
  }
  
  public int b()
  {
    int i1 = b;
    int i2;
    if (i1 <= e + 2)
    {
      i2 = 64527;
      return i2;
    }
    f = (i1 - e - 2);
    if (w.m == 0)
    {
      i2 = a(g, e + 1, f, w.o);
      i1 = i2;
      if (i2 < 0)
      {
        util.LOGI("use ecdh decrypt_body failed", "");
        i2 = a(g, e + 1, f, w.c);
        i1 = i2;
        if (i2 < 0)
        {
          util.LOGI("use kc decrypt_body failed", "");
          i1 = i2;
        }
      }
    }
    for (;;)
    {
      i2 = i1;
      if (i1 < 0) {
        break;
      }
      return c(g, e + 1, f);
      i2 = a(g, e + 1, f, w.c);
      i1 = i2;
      if (i2 < 0)
      {
        util.LOGI("use kc decrypt_body failed", "");
        i1 = i2;
      }
    }
  }
  
  /* Error */
  public int b(String paramString, boolean paramBoolean, WUserSigInfo paramWUserSigInfo)
  {
    // Byte code:
    //   0: new 369	java/lang/StringBuilder
    //   3: dup
    //   4: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   7: aload_0
    //   8: invokevirtual 512	java/lang/Object:getClass	()Ljava/lang/Class;
    //   11: invokevirtual 517	java/lang/Class:getName	()Ljava/lang/String;
    //   14: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   17: ldc_w 519
    //   20: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   23: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   26: new 369	java/lang/StringBuilder
    //   29: dup
    //   30: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   33: ldc 73
    //   35: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   38: aload_0
    //   39: getfield 215	oicq/wlogin_sdk/request/k:w	Loicq/wlogin_sdk/request/u;
    //   42: getfield 390	oicq/wlogin_sdk/request/u:f	J
    //   45: invokevirtual 393	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   48: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   51: invokestatic 287	oicq/wlogin_sdk/tools/util:LOGI	(Ljava/lang/String;Ljava/lang/String;)V
    //   54: aload_0
    //   55: getfield 215	oicq/wlogin_sdk/request/k:w	Loicq/wlogin_sdk/request/u;
    //   58: getfield 520	oicq/wlogin_sdk/request/u:l	I
    //   61: istore 4
    //   63: aload_0
    //   64: invokevirtual 522	oicq/wlogin_sdk/request/k:c	()[B
    //   67: astore 7
    //   69: invokestatic 144	java/lang/System:currentTimeMillis	()J
    //   72: lstore 5
    //   74: new 369	java/lang/StringBuilder
    //   77: dup
    //   78: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   81: ldc_w 524
    //   84: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   87: aload_1
    //   88: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   91: ldc_w 526
    //   94: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   97: aload_0
    //   98: getfield 123	oicq/wlogin_sdk/request/k:u	Ljava/lang/String;
    //   101: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   104: ldc_w 528
    //   107: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   110: iload 4
    //   112: invokevirtual 379	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   115: ldc_w 530
    //   118: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   121: iload_2
    //   122: invokevirtual 533	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   125: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   128: new 369	java/lang/StringBuilder
    //   131: dup
    //   132: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   135: ldc 73
    //   137: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   140: aload_0
    //   141: getfield 215	oicq/wlogin_sdk/request/k:w	Loicq/wlogin_sdk/request/u;
    //   144: getfield 390	oicq/wlogin_sdk/request/u:f	J
    //   147: invokevirtual 393	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   150: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   153: invokestatic 287	oicq/wlogin_sdk/tools/util:LOGI	(Ljava/lang/String;Ljava/lang/String;)V
    //   156: new 535	oicq/wlogin_sdk/request/WtloginMsfListener
    //   159: dup
    //   160: aload_1
    //   161: aload_0
    //   162: getfield 123	oicq/wlogin_sdk/request/k:u	Ljava/lang/String;
    //   165: aload 7
    //   167: iload 4
    //   169: iload_2
    //   170: aload_3
    //   171: invokespecial 538	oicq/wlogin_sdk/request/WtloginMsfListener:<init>	(Ljava/lang/String;Ljava/lang/String;[BIZLoicq/wlogin_sdk/request/WUserSigInfo;)V
    //   174: astore_3
    //   175: new 540	java/lang/Thread
    //   178: dup
    //   179: aload_3
    //   180: invokespecial 543	java/lang/Thread:<init>	(Ljava/lang/Runnable;)V
    //   183: astore_1
    //   184: aload_1
    //   185: invokevirtual 544	java/lang/Thread:start	()V
    //   188: aload_1
    //   189: iload 4
    //   191: i2l
    //   192: invokevirtual 548	java/lang/Thread:join	(J)V
    //   195: aload_3
    //   196: invokevirtual 551	oicq/wlogin_sdk/request/WtloginMsfListener:getRetData	()[B
    //   199: astore_1
    //   200: aload_1
    //   201: ifnonnull +240 -> 441
    //   204: new 369	java/lang/StringBuilder
    //   207: dup
    //   208: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   211: ldc_w 553
    //   214: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   217: aload_3
    //   218: invokevirtual 556	oicq/wlogin_sdk/request/WtloginMsfListener:getRet	()I
    //   221: invokevirtual 379	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   224: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   227: new 369	java/lang/StringBuilder
    //   230: dup
    //   231: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   234: ldc 73
    //   236: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   239: aload_0
    //   240: getfield 215	oicq/wlogin_sdk/request/k:w	Loicq/wlogin_sdk/request/u;
    //   243: getfield 390	oicq/wlogin_sdk/request/u:f	J
    //   246: invokevirtual 393	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   249: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   252: invokestatic 287	oicq/wlogin_sdk/tools/util:LOGI	(Ljava/lang/String;Ljava/lang/String;)V
    //   255: sipush 64536
    //   258: istore 4
    //   260: aload_0
    //   261: getfield 119	oicq/wlogin_sdk/request/k:s	I
    //   264: sipush 2066
    //   267: if_icmpeq +112 -> 379
    //   270: new 128	oicq/wlogin_sdk/report/report_t3
    //   273: dup
    //   274: invokespecial 129	oicq/wlogin_sdk/report/report_t3:<init>	()V
    //   277: astore_3
    //   278: aload_3
    //   279: aload_0
    //   280: getfield 119	oicq/wlogin_sdk/request/k:s	I
    //   283: putfield 132	oicq/wlogin_sdk/report/report_t3:_cmd	I
    //   286: aload_3
    //   287: aload_0
    //   288: getfield 121	oicq/wlogin_sdk/request/k:t	I
    //   291: putfield 135	oicq/wlogin_sdk/report/report_t3:_sub	I
    //   294: aload_3
    //   295: iload 4
    //   297: putfield 138	oicq/wlogin_sdk/report/report_t3:_rst2	I
    //   300: aload_3
    //   301: invokestatic 144	java/lang/System:currentTimeMillis	()J
    //   304: lload 5
    //   306: lsub
    //   307: l2i
    //   308: putfield 147	oicq/wlogin_sdk/report/report_t3:_used	I
    //   311: aload_3
    //   312: iconst_0
    //   313: putfield 150	oicq/wlogin_sdk/report/report_t3:_try	I
    //   316: aload_3
    //   317: ldc 73
    //   319: putfield 153	oicq/wlogin_sdk/report/report_t3:_host	Ljava/lang/String;
    //   322: aload_3
    //   323: ldc 73
    //   325: putfield 156	oicq/wlogin_sdk/report/report_t3:_ip	Ljava/lang/String;
    //   328: aload_3
    //   329: iconst_0
    //   330: putfield 162	oicq/wlogin_sdk/report/report_t3:_port	I
    //   333: aload_3
    //   334: iconst_0
    //   335: putfield 165	oicq/wlogin_sdk/report/report_t3:_conn	I
    //   338: aload_3
    //   339: iconst_0
    //   340: putfield 172	oicq/wlogin_sdk/report/report_t3:_net	I
    //   343: aload_3
    //   344: ldc 73
    //   346: putfield 175	oicq/wlogin_sdk/report/report_t3:_str	Ljava/lang/String;
    //   349: iload 4
    //   351: ifne +143 -> 494
    //   354: aload_3
    //   355: aload 7
    //   357: arraylength
    //   358: putfield 178	oicq/wlogin_sdk/report/report_t3:_slen	I
    //   361: aload_3
    //   362: aload_1
    //   363: arraylength
    //   364: putfield 181	oicq/wlogin_sdk/report/report_t3:_rlen	I
    //   367: aload_3
    //   368: iconst_3
    //   369: putfield 184	oicq/wlogin_sdk/report/report_t3:_wap	I
    //   372: getstatic 188	oicq/wlogin_sdk/request/u:ah	Loicq/wlogin_sdk/report/report_t1;
    //   375: aload_3
    //   376: invokevirtual 194	oicq/wlogin_sdk/report/report_t1:add_t3	(Loicq/wlogin_sdk/report/report_t3;)V
    //   379: new 369	java/lang/StringBuilder
    //   382: dup
    //   383: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   386: aload_0
    //   387: invokevirtual 512	java/lang/Object:getClass	()Ljava/lang/Class;
    //   390: invokevirtual 517	java/lang/Class:getName	()Ljava/lang/String;
    //   393: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   396: ldc_w 558
    //   399: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   402: iload 4
    //   404: invokevirtual 379	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   407: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   410: new 369	java/lang/StringBuilder
    //   413: dup
    //   414: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   417: ldc 73
    //   419: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   422: aload_0
    //   423: getfield 215	oicq/wlogin_sdk/request/k:w	Loicq/wlogin_sdk/request/u;
    //   426: getfield 390	oicq/wlogin_sdk/request/u:f	J
    //   429: invokevirtual 393	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   432: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   435: invokestatic 287	oicq/wlogin_sdk/tools/util:LOGI	(Ljava/lang/String;Ljava/lang/String;)V
    //   438: iload 4
    //   440: ireturn
    //   441: aload_0
    //   442: aload_1
    //   443: aload_1
    //   444: arraylength
    //   445: invokevirtual 560	oicq/wlogin_sdk/request/k:b	([BI)V
    //   448: iconst_0
    //   449: istore 4
    //   451: goto -191 -> 260
    //   454: astore_3
    //   455: aconst_null
    //   456: astore_1
    //   457: aload_3
    //   458: new 369	java/lang/StringBuilder
    //   461: dup
    //   462: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   465: ldc 73
    //   467: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   470: aload_0
    //   471: getfield 215	oicq/wlogin_sdk/request/k:w	Loicq/wlogin_sdk/request/u;
    //   474: getfield 390	oicq/wlogin_sdk/request/u:f	J
    //   477: invokevirtual 393	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   480: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   483: invokestatic 564	oicq/wlogin_sdk/tools/util:printException	(Ljava/lang/Exception;Ljava/lang/String;)V
    //   486: sipush 64536
    //   489: istore 4
    //   491: goto -231 -> 260
    //   494: aload_3
    //   495: iconst_0
    //   496: putfield 178	oicq/wlogin_sdk/report/report_t3:_slen	I
    //   499: aload_3
    //   500: iconst_0
    //   501: putfield 181	oicq/wlogin_sdk/report/report_t3:_rlen	I
    //   504: goto -137 -> 367
    //   507: astore_3
    //   508: goto -51 -> 457
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	511	0	this	k
    //   0	511	1	paramString	String
    //   0	511	2	paramBoolean	boolean
    //   0	511	3	paramWUserSigInfo	WUserSigInfo
    //   61	429	4	i1	int
    //   72	233	5	l1	long
    //   67	289	7	arrayOfByte	byte[]
    // Exception table:
    //   from	to	target	type
    //   74	200	454	java/lang/Exception
    //   204	255	507	java/lang/Exception
    //   441	448	507	java/lang/Exception
  }
  
  public int b(byte[] paramArrayOfByte)
  {
    return util.buf_to_int16(paramArrayOfByte, 1);
  }
  
  public String b(boolean paramBoolean)
  {
    String[] arrayOfString = new String[2];
    if (paramBoolean)
    {
      arrayOfString[0] = "wlogin.qq.com";
      arrayOfString[1] = "wlogin1.qq.com";
    }
    for (;;)
    {
      return arrayOfString[Math.abs(new java.util.Random().nextInt() % arrayOfString.length)];
      arrayOfString[0] = "wtlogin.qq.com";
      arrayOfString[1] = "wtlogin1.qq.com";
    }
  }
  
  public void b(byte[] paramArrayOfByte, int paramInt)
  {
    if (paramInt > a)
    {
      a = (paramInt + 128);
      g = new byte[a];
    }
    b = paramInt;
    System.arraycopy(paramArrayOfByte, 0, g, 0, paramInt);
  }
  
  public void b(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    ap localAp = new ap();
    paramInt1 = localAp.b(paramArrayOfByte, paramInt1, paramInt2);
    paramArrayOfByte = u.b(w.h);
    if (paramInt1 >= 0)
    {
      _last_err_msg.setTitle(new String(localAp.f()));
      _last_err_msg.setMessage(new String(localAp.g()));
      _last_err_msg.setType(localAp.h());
      _last_err_msg.setOtherinfo(new String(localAp.i()));
    }
  }
  
  public int c(boolean paramBoolean)
  {
    if (paramBoolean) {}
    return 443;
  }
  
  public int c(byte[] paramArrayOfByte, int paramInt)
  {
    v = paramArrayOfByte[paramInt];
    return paramArrayOfByte[paramInt] & 0xFF;
  }
  
  public int c(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    int i1;
    if (paramInt2 < 5)
    {
      i1 = 64527;
      return i1;
    }
    long l2 = 4294967295L;
    f localF = new f();
    Object localObject9 = new g();
    r localR = new r();
    oicq.wlogin_sdk.tlv_type.u localU = new oicq.wlogin_sdk.tlv_type.u();
    o localO = new o();
    p localP = new p();
    l localL = new l();
    s localS = new s();
    e localE = new e();
    v localV = new v();
    oicq.wlogin_sdk.tlv_type.d localD = new oicq.wlogin_sdk.tlv_type.d();
    m localM = new m();
    w localW = new w();
    x localX = new x();
    z localZ = new z();
    Object localObject4 = new aa();
    ag localAg = new ag();
    j localJ = new j();
    oicq.wlogin_sdk.tlv_type.h localH = new oicq.wlogin_sdk.tlv_type.h();
    Object localObject8 = new n();
    Object localObject3 = new ac();
    Object localObject5 = new y();
    aj localAj = new aj();
    ah localAh = new ah();
    as localAs = new as();
    at localAt = new at();
    Object localObject6 = new am();
    cj localCj = new cj();
    ax localAx = new ax();
    ay localAy = new ay();
    ba localBa = new ba();
    bc localBc = new bc();
    bb localBb = new bb();
    aw localAw = new aw();
    bf localBf = new bf();
    a localA = new a(1298);
    bd localBd = new bd();
    bi localBi = new bi();
    bk localBk = new bk();
    bl localBl = new bl();
    bp localBp = new bp();
    bq localBq = new bq();
    ad localAd = new ad();
    bs localBs = new bs();
    bt localBt = new bt();
    bw localBw = new bw();
    cm localCm = new cm();
    Object localObject7 = new cn();
    byte[] arrayOfByte1 = null;
    byte[] arrayOfByte2 = null;
    byte[] arrayOfByte3 = null;
    byte[] arrayOfByte4 = null;
    byte[] arrayOfByte5 = null;
    Object localObject2 = null;
    Object localObject1 = null;
    byte[] arrayOfByte6 = null;
    ai localAi = new ai();
    async_context localAsync_context = u.b(w.h);
    long l3 = _sappid;
    long l4 = _appid;
    if (s == 2064) {
      switch (t)
      {
      case 3: 
      case 5: 
      case 6: 
      case 8: 
      case 12: 
      case 14: 
      case 16: 
      default: 
        return 64524;
      case 9: 
        paramInt2 = 0;
      }
    }
    for (;;)
    {
      label622:
      i1 = c(paramArrayOfByte, paramInt1 + 2);
      int i4 = paramInt1 + 5;
      w.d = null;
      label826:
      label876:
      int i2;
      label1139:
      int i5;
      int i3;
      switch (i1)
      {
      default: 
        b(paramArrayOfByte, i4, b - i4 - 1);
        paramInt1 = i1;
      case 0: 
        do
        {
          do
          {
            localObject2 = new StringBuilder().append("type:").append(i1).append(" ret:");
            if (paramInt1 <= 0) {
              break label5461;
            }
            localObject1 = "0x" + Integer.toHexString(paramInt1);
            util.LOGI(localObject1, "" + w.f);
            if (paramInt1 != 0) {
              break label5470;
            }
            a(null);
            i1 = paramInt1;
            if ((i1 != 10) && (i1 != 161) && (i1 != 162) && (i1 != 164) && (i1 != 165) && (i1 != 166) && (i1 != 154))
            {
              paramInt1 = i1;
              if (i1 >= 128)
              {
                paramInt1 = i1;
                if (i1 > 143) {}
              }
            }
            else
            {
              paramInt1 = 64536;
            }
            i1 = paramInt1;
            if (paramInt2 == 2) {
              break;
            }
            i1 = paramInt1;
            if (paramInt2 == 6) {
              break;
            }
            i1 = paramInt1;
            if (paramInt2 == 7) {
              break;
            }
            a(paramInt2);
            return paramInt1;
            paramInt2 = 1;
            break label622;
            paramInt2 = 2;
            break label622;
            paramInt2 = 3;
            break label622;
            paramInt2 = 4;
            break label622;
            paramInt2 = 5;
            break label622;
            paramInt2 = 6;
            break label622;
            paramInt2 = 7;
            break label622;
            paramInt2 = 0;
            break label622;
            paramInt2 = 0;
            break label622;
            if (paramInt2 != 1) {
              break label2048;
            }
            if (w.b == null) {
              return 64530;
            }
            if (localAt.b(paramArrayOfByte, i4, b - i4 - 1) >= 0) {
              w.d = localAt;
            }
            if (localAw.b(paramArrayOfByte, i4, b - i4 - 1) >= 0) {
              a(localAw);
            }
            i2 = localU.a(paramArrayOfByte, i4, b - i4 - 1, w.b);
            paramInt1 = i2;
          } while (i2 < 0);
          localObject9 = localU.b();
          i2 = 2;
          i5 = localObject9.length;
          if (localAs.b((byte[])localObject9, 2, i5) > 0) {
            a(localAs);
          }
          if (localAg.b((byte[])localObject9, 2, i5) > 0) {
            w.a(localAg.f(), localAg.g());
          }
          if (localR.b((byte[])localObject9, 2, i5) >= 0)
          {
            w.f = localR.f();
            w.a(w.g, Long.valueOf(w.f));
          }
          localO.b((byte[])localObject9, 2, i5);
          localP.b((byte[])localObject9, 2, i5);
          localL.b((byte[])localObject9, 2, i5);
          localS.b((byte[])localObject9, 2, i5);
          i3 = localV.b((byte[])localObject9, 2, i5);
          paramInt1 = i3;
        } while (i3 < 0);
        if (localE.b((byte[])localObject9, 2, i5) >= 0) {
          localObject2 = localE.b();
        }
        if (localJ.b((byte[])localObject9, 2, i5) >= 0) {
          util.set_ksid(u.r, localJ.b());
        }
        if (localD.b((byte[])localObject9, 2, i5) >= 0) {
          arrayOfByte1 = localD.b();
        }
        if (localM.b((byte[])localObject9, 2, i5) >= 0) {
          arrayOfByte2 = localM.b();
        }
        if (localW.b((byte[])localObject9, 2, i5) >= 0) {
          arrayOfByte3 = localW.b();
        }
        if (localZ.b((byte[])localObject9, 2, i5) >= 0) {
          arrayOfByte4 = localZ.b();
        }
        if (((aa)localObject4).b((byte[])localObject9, 2, i5) >= 0) {
          arrayOfByte5 = ((aa)localObject4).b();
        }
        if (((ac)localObject3).b((byte[])localObject9, 2, i5) >= 0)
        {
          localObject1 = ((ac)localObject3).f();
          arrayOfByte6 = ((ac)localObject3).g();
        }
        if (localBw.b((byte[])localObject9, 2, i5) >= 0)
        {
          localObject3 = w.g;
          if (util.check_uin_account((String)localObject3).booleanValue())
          {
            localObject4 = w.e(w.f);
            localObject3 = localObject4;
            if (localObject4 != null)
            {
              localObject3 = localObject4;
              if (((String)localObject4).length() > 0)
              {
                w.a((String)localObject4, Long.valueOf(w.f), localBw.f());
                localObject3 = localObject4;
              }
            }
            label1593:
            util.LOGI("put t186: name: " + (String)localObject3 + " uin: " + w.f + " pwd=" + localBw.f(), "");
          }
        }
        else
        {
          util.LOGI("tgt len:" + util.buf_len(localL.b()) + " tgt_key len:" + util.buf_len(localO.b()) + " st len:" + util.buf_len(localS.b()) + " st_key len:" + util.buf_len(localP.b()) + " stwx_web len:" + util.buf_len((byte[])localObject2) + " a8 len:" + util.buf_len(arrayOfByte1) + " a5 len:" + util.buf_len(arrayOfByte2) + " lskey len:" + util.buf_len(arrayOfByte3) + " skey len:" + util.buf_len(arrayOfByte4) + " sig64 len:" + util.buf_len(arrayOfByte5) + " openid len:" + util.buf_len((byte[])localObject1) + " openkey len:" + util.buf_len(arrayOfByte6) + " pwdflag: " + localBw.c() + " " + localBw.f(), "" + w.f);
          if (localBb.b((byte[])localObject9, 2, i5) >= 0)
          {
            localObject3 = a(localBb);
            if ((localObject3 == null) || (localObject3.length <= 0)) {
              break label2504;
            }
          }
        }
        label2048:
        label2504:
        for (w.j = new WFastLoginInfo((byte[])localObject3);; w.j = new WFastLoginInfo())
        {
          localObject3 = (byte[][])Array.newInstance(Byte.TYPE, new int[] { 3, 0 });
          if (localBa.b((byte[])localObject9, 2, i5) >= 0)
          {
            localObject3[0] = localBa.f();
            localObject3[1] = localBa.g();
            localObject3[2] = localBa.h();
          }
          localObject4 = (byte[][])Array.newInstance(Byte.TYPE, new int[] { 5, 0 });
          paramInt1 = 0;
          while (paramInt1 < 5)
          {
            localObject4[paramInt1] = new byte[0];
            paramInt1 += 1;
          }
          if (paramInt2 == 2)
          {
            if (localBt.b(paramArrayOfByte, i4, b - i4) >= 0) {
              _msalt = localBt.f();
            }
            if (f() == 3)
            {
              if (localR.b(paramArrayOfByte, i4, b - i4 - 1) >= 0)
              {
                w.f = localR.f();
                w.a(w.g, Long.valueOf(w.f));
              }
              if (localF.b(paramArrayOfByte, i4, b - i4 - 1) >= 0) {
                _t104 = localF;
              }
              paramInt1 = 0;
              break;
            }
            if (localAt.b(paramArrayOfByte, i4, b - i4 - 1) >= 0) {
              w.d = localAt;
            }
            if (localAw.b(paramArrayOfByte, i4, b - i4 - 1) >= 0) {
              a(localAw);
            }
            i2 = localU.a(paramArrayOfByte, i4, b - i4 - 1, _tgtgt_key);
            break label1139;
          }
          if ((paramInt2 == 3) || (paramInt2 == 7))
          {
            if (localBt.b(paramArrayOfByte, i4, b - i4) >= 0) {
              _msalt = localBt.f();
            }
            if (localR.b(paramArrayOfByte, i4, b - i4) >= 0)
            {
              w.f = localR.f();
              w.a(w.g, Long.valueOf(w.f));
            }
            i2 = localF.b(paramArrayOfByte, i4, b - i4);
            paramInt1 = i2;
            if (i2 < 0) {
              break;
            }
            _t104 = localF;
            paramInt1 = 0;
            break;
          }
          if (localAt.b(paramArrayOfByte, i4, b - i4 - 1) >= 0) {
            w.d = localAt;
          }
          if (localAw.b(paramArrayOfByte, i4, b - i4 - 1) >= 0) {
            a(localAw);
          }
          i2 = localU.a(paramArrayOfByte, i4, b - i4 - 1, _tgtgt_key);
          s.D = 0;
          break label1139;
          w.a((String)localObject3, Long.valueOf(w.f), localBw.f());
          break label1593;
        }
        paramInt1 = ((n)localObject8).b((byte[])localObject9, 2, i5);
        if ((localH.b((byte[])localObject9, 2, i5) >= 0) && (paramInt1 >= 0))
        {
          localObject8 = ((n)localObject8).b();
          localObject4[0] = ((byte[])b(localH.b(), (byte[])localObject8).clone());
        }
        if (localBc.b((byte[])localObject9, 2, i5) >= 0) {
          localObject4[1] = localBc.b();
        }
        if (((cn)localObject7).b((byte[])localObject9, 2, i5) >= 0) {
          localObject4[4] = ((cn)localObject7).b();
        }
        if (_sec_guid_flag)
        {
          localObject4[2] = _G;
          localObject4[3] = _dpwd;
          localObject4[4] = _t403.b();
          _sec_guid_flag = false;
        }
        localObject7 = (byte[][])Array.newInstance(Byte.TYPE, new int[] { 13, 0 });
        paramInt1 = 0;
        while (paramInt1 < 13)
        {
          localObject7[paramInt1] = new byte[0];
          paramInt1 += 1;
        }
        if (localAi.b((byte[])localObject9, 2, i5) >= 0) {
          localObject7[0] = localAi.b();
        }
        if (localAh.b((byte[])localObject9, 2, i5) >= 0)
        {
          localObject7[1] = localAh.f();
          localObject1 = localAh.g();
        }
        if (((am)localObject6).b((byte[])localObject9, 2, i5) >= 0) {
          localObject7[2] = ((am)localObject6).b();
        }
        if (localCj.b((byte[])localObject9, 2, i5) >= 0) {
          localObject7[3] = localCj.b();
        }
        if (localAx.b((byte[])localObject9, 2, i5) >= 0) {
          localObject7[4] = localAx.b();
        }
        if (localBf.b((byte[])localObject9, 2, i5) >= 0) {
          localObject7[5] = localBf.b();
        }
        if (localA.b((byte[])localObject9, 2, i5) >= 0) {
          localObject7[6] = localA.b();
        }
        if (localBd.b((byte[])localObject9, 2, i5) >= 0) {
          localObject7[7] = localBd.b();
        }
        localObject6 = new ce();
        if (((ce)localObject6).b((byte[])localObject9, 2, i5) >= 0)
        {
          localObject7[8] = ((ce)localObject6).g();
          localObject1 = ((ce)localObject6).f();
        }
        break;
      }
      for (;;)
      {
        localObject6 = new cg();
        if (((cg)localObject6).b((byte[])localObject9, 2, i5) >= 0)
        {
          localObject7[9] = ((cg)localObject6).f();
          localObject7[10] = ((cg)localObject6).g();
        }
        localObject6 = new a(515);
        if (((a)localObject6).b((byte[])localObject9, 2, i5) >= 0) {
          localObject7[11] = ((a)localObject6).b();
        }
        localObject6 = new a(791);
        long l1;
        if (((a)localObject6).b((byte[])localObject9, 2, i5) >= 0)
        {
          oicq.wlogin_sdk.sharemem.WloginSigInfo._QRPUSHSig = ((a)localObject6).b();
          util.LOGI("encrypt_a1 len:" + util.buf_len(localObject4[0]) + " no_pic_sig len:" + util.buf_len(localObject4[1]) + " G len:" + util.buf_len(localObject4[2]) + " dpwd len:" + util.buf_len(localObject4[3]) + " randseed len:" + util.buf_len(localObject4[4]) + " vkey len:" + util.buf_len(localObject7[0]) + " openid len:" + util.buf_len((byte[])localObject1) + " access_token len:" + util.buf_len(localObject7[1]) + " d2 len:" + util.buf_len(localObject7[2]) + " d2_key len:" + util.buf_len(localObject7[3]) + " sid len:" + util.buf_len(localObject7[4]) + " aq_sig len:" + util.buf_len(localObject7[5]) + " pskey len:" + util.buf_len(localObject7[6]) + " super_key len:" + util.buf_len(localObject7[7]) + " paytoken len:" + util.buf_len(localObject7[8]) + " pf len:" + util.buf_len(localObject7[9]) + " pfkey len:" + util.buf_len(localObject7[10]) + " da2 len:" + util.buf_len(localObject7[11]), "" + w.f);
          if (((y)localObject5).b((byte[])localObject9, 2, i5) >= 0) {
            l2 = 0xFFFFFFFF & ((y)localObject5).f();
          }
          localObject5 = new long[7];
          paramInt1 = 2;
          l1 = 2160000L;
          label3411:
          paramInt1 = localAj.b((byte[])localObject9, paramInt1, i5);
          if (paramInt1 < 0) {
            break label3652;
          }
          if (localAj.f() == 0) {
            break label5559;
          }
          l1 = localAj.f();
        }
        label3460:
        label3478:
        label3496:
        label3514:
        label3532:
        label3591:
        label3601:
        label3611:
        label3621:
        label3631:
        label3641:
        label3652:
        label4953:
        label5017:
        label5461:
        label5470:
        label5559:
        for (;;)
        {
          if (localAj.g() != 0)
          {
            localObject5[0] = localAj.g();
            if (localAj.h() == 0) {
              break label3591;
            }
            localObject5[1] = localAj.h();
            if (localAj.i() == 0) {
              break label3601;
            }
            localObject5[2] = localAj.i();
            if (localAj.j() == 0) {
              break label3611;
            }
            localObject5[3] = localAj.j();
            if (localAj.k() == 0) {
              break label3621;
            }
            localObject5[4] = localAj.k();
            if (localAj.l() == 0) {
              break label3631;
            }
            localObject5[5] = localAj.l();
          }
          for (;;)
          {
            if (localAj.m() == 0) {
              break label3641;
            }
            localObject5[6] = localAj.m();
            break label3411;
            oicq.wlogin_sdk.sharemem.WloginSigInfo._QRPUSHSig = new byte[0];
            break;
            localObject5[0] = 1641600L;
            break label3460;
            localObject5[1] = 86400L;
            break label3478;
            localObject5[2] = 1728000L;
            break label3496;
            localObject5[3] = 72000L;
            break label3514;
            localObject5[4] = 6000L;
            break label3532;
            localObject5[5] = 1728000L;
          }
          localObject5[6] = 1728000L;
          break label3411;
          util.LOGI("sappid:" + l3 + " appid:" + l4 + " app_pri:" + l2 + " login_bitmap:" + _login_bitmap + " tk_valid:" + 0L + " a2_valid:" + l1 + " lskey_valid:" + localObject5[0] + " skey_valid:" + localObject5[1] + " vkey_valid:" + localObject5[2] + " a8_valid:" + localObject5[3] + " stweb_valid:" + localObject5[4] + " d2_valid:" + localObject5[5] + " sid_valid:" + localObject5[6], "" + w.f);
          i3 = w.a(w.f, l3, (byte[][])localObject4, l4, l2, u.f(), u.f() + 0L, l1 + u.f(), localV.f(), localV.g(), localV.h(), localV.i(), (byte[][])localObject3, localL.b(), localO.b(), localS.b(), localP.b(), (byte[])localObject2, arrayOfByte2, arrayOfByte1, arrayOfByte3, arrayOfByte4, arrayOfByte5, (byte[])localObject1, arrayOfByte6, (byte[][])localObject7, (long[])localObject5, _login_bitmap);
          paramInt1 = i2;
          if (i3 != 0)
          {
            localObject1 = new ErrMsg();
            ((ErrMsg)localObject1).setMessage(InternationMsg.a(InternationMsg.MSG_TYPE.MSG_2));
            a((ErrMsg)localObject1);
            util.LOGI("put_siginfo fail,ret=" + i3, "" + w.f);
            paramInt1 = i3;
            break;
          }
          for (;;)
          {
            paramInt1 = localX.b((byte[])localObject9, paramInt1, i5);
            if (paramInt1 < 0) {
              break;
            }
            w.a(w.f, localX.f(), u.f(), u.f() + 0L, localX.h(), localX.g());
          }
          paramInt1 = 0;
          break;
          w.d(w.f, l3);
          b(paramArrayOfByte, i4, b - i4 - 1);
          paramInt1 = i1;
          break;
          i2 = localF.b(paramArrayOfByte, i4, b - i4 - 1);
          paramInt1 = i2;
          if (i2 < 0) {
            break;
          }
          _t104 = localF;
          localObject1 = new ca();
          if (((ca)localObject1).b(paramArrayOfByte, i4, b - i4 - 1) >= 0)
          {
            a(new ErrMsg(i1, "", "", ((ca)localObject1).f()));
            paramInt1 = i1;
            break;
          }
          i2 = ((g)localObject9).b(paramArrayOfByte, i4, b - i4 - 1);
          paramInt1 = i2;
          if (i2 < 0) {
            break;
          }
          _t105 = ((g)localObject9);
          if (localAy.b(paramArrayOfByte, i4, b - i4 - 1) >= 0) {}
          for (_t165 = localAy;; _t165 = new ay())
          {
            a(null);
            break;
          }
          w.d(w.f, l3);
          i2 = localAg.b(paramArrayOfByte, i4, b - i4 - 1);
          paramInt1 = i2;
          if (i2 < 0) {
            break;
          }
          w.a(localAg.f(), localAg.g());
          b(paramArrayOfByte, i4, b - i4 - 1);
          paramInt1 = i1;
          break;
          localObject1 = new a(405);
          i2 = ((a)localObject1).b(paramArrayOfByte, i4, b - i4 - 1);
          paramInt1 = i2;
          if (i2 < 0) {
            break;
          }
          oicq.wlogin_sdk.sharemem.WloginSigInfo._LHSig = ((a)localObject1).b();
          b(paramArrayOfByte, i4, b - i4 - 1);
          paramInt1 = i1;
          break;
          if (localR.b(paramArrayOfByte, i4, b - i4 - 1) >= 0)
          {
            w.f = localR.f();
            w.a(w.g, Long.valueOf(w.f));
          }
          i2 = localF.b(paramArrayOfByte, i4, b - i4 - 1);
          paramInt1 = i2;
          if (i2 < 0) {
            break;
          }
          _t104 = localF;
          i2 = localBi.b(paramArrayOfByte, i4, b - i4 - 1);
          paramInt1 = i2;
          if (i2 < 0) {
            break;
          }
          _t174 = localBi;
          if (localBk.b(paramArrayOfByte, i4, b - i4 - 1) >= 0)
          {
            _devlock_info.CountryCode = new String(localBk.f());
            _devlock_info.Mobile = new String(localBk.g());
            _devlock_info.MbItemSmsCodeStatus = localBk.h();
            _devlock_info.AvailableMsgCount = localBk.i();
            _devlock_info.TimeLimit = localBk.j();
          }
          localObject1 = new cd();
          if (((cd)localObject1).b(paramArrayOfByte, i4, b - i4 - 1) >= 0)
          {
            _devlock_info.BakCountryCode = ((cd)localObject1).g();
            _devlock_info.BakMobile = ((cd)localObject1).h();
            _devlock_info.BakMobileState = ((cd)localObject1).f();
          }
          if (localBl.b(paramArrayOfByte, i4, b - i4 - 1) >= 0) {
            _devlock_info.UnionVerifyUrl = new String(localBl.f());
          }
          if (localBp.b(paramArrayOfByte, i4, b - i4 - 1) >= 0)
          {
            _devlock_info.MbGuideType = localBp.f();
            _devlock_info.MbGuideMsg = new String(localBp.g());
            _devlock_info.MbGuideInfoType = localBp.h();
            _devlock_info.MbGuideInfo = new String(localBp.i());
          }
          if (localBq.b(paramArrayOfByte, i4, b - i4 - 1) >= 0) {
            _devlock_info.VerifyReason = new String(localBq.b());
          }
          if (localCm.b(paramArrayOfByte, i4, b - i4 - 1) >= 0)
          {
            _t402 = localCm;
            if (((cn)localObject7).b(paramArrayOfByte, i4, b - i4 - 1) < 0) {
              break label5017;
            }
          }
          for (_t403 = ((cn)localObject7);; _t403 = new cn())
          {
            b(paramArrayOfByte, i4, b - i4 - 1);
            paramInt1 = i1;
            break;
            _t402 = new cm();
            break label4953;
          }
          b(paramArrayOfByte, i4, b - i4 - 1);
          w.a(w.g);
          paramInt1 = i1;
          break;
          i2 = localAw.b(paramArrayOfByte, i4, b - i4 - 1);
          paramInt1 = i2;
          if (i2 < 0) {
            break;
          }
          a(localAw);
          b(paramArrayOfByte, i4, b - i4 - 1);
          paramInt1 = i1;
          break;
          if (localR.b(paramArrayOfByte, i4, b - i4 - 1) >= 0)
          {
            w.f = localR.f();
            w.a(w.g, Long.valueOf(w.f));
          }
          i2 = localF.b(paramArrayOfByte, i4, b - i4 - 1);
          paramInt1 = i2;
          if (i2 < 0) {
            break;
          }
          _t104 = localF;
          i2 = localCm.b(paramArrayOfByte, i4, b - i4 - 1);
          paramInt1 = i2;
          if (i2 < 0) {
            break;
          }
          _t402 = localCm;
          i2 = ((cn)localObject7).b(paramArrayOfByte, i4, b - i4 - 1);
          paramInt1 = i2;
          if (i2 < 0) {
            break;
          }
          _t403 = ((cn)localObject7);
          b(paramArrayOfByte, i4, b - i4 - 1);
          paramInt1 = i1;
          break;
          i2 = localF.b(paramArrayOfByte, i4, b - i4 - 1);
          paramInt1 = i2;
          if (i2 < 0) {
            break;
          }
          _t104 = localF;
          i2 = localAd.b(paramArrayOfByte, i4, b - i4 - 1);
          paramInt1 = i2;
          if (i2 < 0) {
            break;
          }
          _t126 = localAd;
          i2 = localBs.b(paramArrayOfByte, i4, b - i4 - 1);
          paramInt1 = i2;
          if (i2 < 0) {
            break;
          }
          _smslogin_msgcnt = localBs.f();
          _smslogin_timelimit = localBs.g();
          i2 = localBt.b(paramArrayOfByte, i4, b - i4 - 1);
          paramInt1 = i2;
          if (i2 < 0) {
            break;
          }
          _msalt = localBt.f();
          paramInt1 = 0;
          break;
          localObject1 = Integer.valueOf(paramInt1);
          break label826;
          new co().b(paramArrayOfByte, i4, b - i4 - 1);
          i1 = paramInt1;
          if (!co.h) {
            break label876;
          }
          paramArrayOfByte = new ErrMsg();
          i2 = new h(w, s, t, paramArrayOfByte).b(paramInt1);
          i1 = paramInt1;
          if (i2 == 64536) {
            break label876;
          }
          a(paramArrayOfByte);
          i1 = i2;
          break label876;
        }
      }
      paramInt2 = 0;
    }
  }
  
  public byte[] c()
  {
    byte[] arrayOfByte = new byte[b];
    System.arraycopy(g, 0, arrayOfByte, 0, b);
    return arrayOfByte;
  }
  
  public byte[] c(byte[] paramArrayOfByte)
  {
    Object localObject;
    if ((u.z == null) || (u.z.length <= 0))
    {
      localObject = cryptor.decrypt(paramArrayOfByte, 0, paramArrayOfByte.length, "%4;7t>;28<fc.5*6".getBytes());
      if (localObject != null) {
        break label210;
      }
    }
    label210:
    for (paramArrayOfByte = (byte[])paramArrayOfByte.clone();; paramArrayOfByte = (byte[])localObject)
    {
      if ((paramArrayOfByte == null) || (paramArrayOfByte.length < 16))
      {
        return (byte[])null;
        localObject = new byte[16];
        if (u.z.length > localObject.length) {
          System.arraycopy(u.z, 0, localObject, 0, localObject.length);
        }
        for (;;)
        {
          arrayOfByte = cryptor.decrypt(paramArrayOfByte, 0, paramArrayOfByte.length, (byte[])localObject);
          if (arrayOfByte != null)
          {
            localObject = arrayOfByte;
            if (arrayOfByte.length > 0) {
              break;
            }
          }
          localObject = cryptor.decrypt(paramArrayOfByte, 0, paramArrayOfByte.length, "%4;7t>;28<fc.5*6".getBytes());
          break;
          System.arraycopy(u.z, 0, localObject, 0, u.z.length);
          i1 = u.z.length;
          while (i1 < localObject.length)
          {
            localObject[i1] = ((byte)(i1 + 1));
            i1 += 1;
          }
        }
      }
      int i1 = paramArrayOfByte.length - 16;
      localObject = new byte[i1];
      System.arraycopy(paramArrayOfByte, 0, localObject, 0, i1);
      byte[] arrayOfByte = new byte[16];
      System.arraycopy(paramArrayOfByte, i1, arrayOfByte, 0, 16);
      bw.h)._tgtgt_key = arrayOfByte;
      return localObject;
    }
  }
  
  public Socket d()
  {
    return w.ad;
  }
  
  /* Error */
  public int e()
  {
    // Byte code:
    //   0: new 369	java/lang/StringBuilder
    //   3: dup
    //   4: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   7: aload_0
    //   8: invokevirtual 512	java/lang/Object:getClass	()Ljava/lang/Class;
    //   11: invokevirtual 517	java/lang/Class:getName	()Ljava/lang/String;
    //   14: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   17: ldc_w 1241
    //   20: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   23: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   26: new 369	java/lang/StringBuilder
    //   29: dup
    //   30: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   33: ldc 73
    //   35: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   38: aload_0
    //   39: getfield 215	oicq/wlogin_sdk/request/k:w	Loicq/wlogin_sdk/request/u;
    //   42: getfield 390	oicq/wlogin_sdk/request/u:f	J
    //   45: invokevirtual 393	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   48: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   51: invokestatic 287	oicq/wlogin_sdk/tools/util:LOGI	(Ljava/lang/String;Ljava/lang/String;)V
    //   54: aload_0
    //   55: invokevirtual 522	oicq/wlogin_sdk/request/k:c	()[B
    //   58: astore 24
    //   60: iconst_0
    //   61: istore_3
    //   62: iconst_0
    //   63: istore_2
    //   64: iconst_0
    //   65: istore_1
    //   66: lconst_0
    //   67: lstore 9
    //   69: aload_0
    //   70: invokevirtual 1243	oicq/wlogin_sdk/request/k:d	()Ljava/net/Socket;
    //   73: astore 18
    //   75: iconst_0
    //   76: istore 14
    //   78: iconst_0
    //   79: istore 13
    //   81: iconst_0
    //   82: istore 4
    //   84: ldc 73
    //   86: astore 19
    //   88: ldc 73
    //   90: astore 17
    //   92: iload_1
    //   93: bipush 6
    //   95: if_icmpge +2235 -> 2330
    //   98: iload_1
    //   99: ifeq +9 -> 108
    //   102: getstatic 312	oicq/wlogin_sdk/request/u:r	Landroid/content/Context;
    //   105: invokestatic 1247	oicq/wlogin_sdk/tools/util:chg_retry_type	(Landroid/content/Context;)V
    //   108: getstatic 312	oicq/wlogin_sdk/request/u:r	Landroid/content/Context;
    //   111: invokestatic 1251	oicq/wlogin_sdk/tools/util:is_wap_retry	(Landroid/content/Context;)Z
    //   114: istore 15
    //   116: aload_0
    //   117: aconst_null
    //   118: putfield 113	oicq/wlogin_sdk/request/k:p	Ljava/net/InetSocketAddress;
    //   121: iload_1
    //   122: ifeq +27 -> 149
    //   125: aload_0
    //   126: getfield 119	oicq/wlogin_sdk/request/k:s	I
    //   129: sipush 2066
    //   132: if_icmpeq +17 -> 149
    //   135: aload_0
    //   136: iload_2
    //   137: lload 9
    //   139: iload 4
    //   141: iload_1
    //   142: iload 15
    //   144: iload 13
    //   146: invokespecial 1253	oicq/wlogin_sdk/request/k:a	(IJIIZZ)V
    //   149: invokestatic 144	java/lang/System:currentTimeMillis	()J
    //   152: lstore 9
    //   154: iload 15
    //   156: ifeq +1035 -> 1191
    //   159: new 369	java/lang/StringBuilder
    //   162: dup
    //   163: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   166: ldc_w 1255
    //   169: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   172: iload_1
    //   173: invokevirtual 379	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   176: ldc_w 1257
    //   179: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   182: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   185: new 369	java/lang/StringBuilder
    //   188: dup
    //   189: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   192: ldc 73
    //   194: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   197: aload_0
    //   198: getfield 215	oicq/wlogin_sdk/request/k:w	Loicq/wlogin_sdk/request/u;
    //   201: getfield 390	oicq/wlogin_sdk/request/u:f	J
    //   204: invokevirtual 393	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   207: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   210: invokestatic 287	oicq/wlogin_sdk/tools/util:LOGI	(Ljava/lang/String;Ljava/lang/String;)V
    //   213: aload_0
    //   214: iload_1
    //   215: iload 15
    //   217: invokevirtual 1259	oicq/wlogin_sdk/request/k:a	(IZ)Ljava/lang/String;
    //   220: astore 23
    //   222: iload 13
    //   224: istore 14
    //   226: getstatic 312	oicq/wlogin_sdk/request/u:r	Landroid/content/Context;
    //   229: invokestatic 1262	oicq/wlogin_sdk/tools/util:is_wap_proxy_retry	(Landroid/content/Context;)Z
    //   232: istore 13
    //   234: iload 13
    //   236: ifeq +2448 -> 2684
    //   239: iload 13
    //   241: istore 14
    //   243: invokestatic 1265	oicq/wlogin_sdk/tools/util:get_proxy_ip	()Ljava/lang/String;
    //   246: astore 20
    //   248: iload 13
    //   250: istore 14
    //   252: invokestatic 1268	oicq/wlogin_sdk/tools/util:get_proxy_port	()I
    //   255: istore_2
    //   256: aload 20
    //   258: ifnull +20 -> 278
    //   261: iload 13
    //   263: istore 14
    //   265: aload 20
    //   267: invokevirtual 309	java/lang/String:length	()I
    //   270: ifle +8 -> 278
    //   273: iload_2
    //   274: iconst_m1
    //   275: if_icmpne +2417 -> 2692
    //   278: iconst_0
    //   279: istore 13
    //   281: iconst_0
    //   282: istore 14
    //   284: new 369	java/lang/StringBuilder
    //   287: dup
    //   288: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   291: ldc_w 1270
    //   294: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   297: aload 20
    //   299: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   302: ldc_w 1272
    //   305: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   308: iload_2
    //   309: invokevirtual 379	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   312: ldc_w 1274
    //   315: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   318: iconst_0
    //   319: invokevirtual 533	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   322: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   325: new 369	java/lang/StringBuilder
    //   328: dup
    //   329: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   332: ldc 73
    //   334: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   337: aload_0
    //   338: getfield 215	oicq/wlogin_sdk/request/k:w	Loicq/wlogin_sdk/request/u;
    //   341: getfield 390	oicq/wlogin_sdk/request/u:f	J
    //   344: invokevirtual 393	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   347: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   350: invokestatic 287	oicq/wlogin_sdk/tools/util:LOGI	(Ljava/lang/String;Ljava/lang/String;)V
    //   353: goto +2339 -> 2692
    //   356: iload 13
    //   358: ifeq +322 -> 680
    //   361: iload 13
    //   363: istore 14
    //   365: new 1276	java/net/URL
    //   368: dup
    //   369: new 369	java/lang/StringBuilder
    //   372: dup
    //   373: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   376: ldc_w 1278
    //   379: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   382: aload 20
    //   384: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   387: ldc_w 1280
    //   390: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   393: iload_2
    //   394: invokevirtual 379	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   397: ldc_w 1282
    //   400: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   403: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   406: invokespecial 1284	java/net/URL:<init>	(Ljava/lang/String;)V
    //   409: astore 20
    //   411: new 369	java/lang/StringBuilder
    //   414: dup
    //   415: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   418: ldc_w 1286
    //   421: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   424: iload 13
    //   426: invokevirtual 533	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   429: ldc_w 1288
    //   432: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   435: aload 20
    //   437: invokevirtual 757	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   440: ldc_w 1290
    //   443: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   446: aload 23
    //   448: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   451: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   454: new 369	java/lang/StringBuilder
    //   457: dup
    //   458: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   461: ldc 73
    //   463: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   466: aload_0
    //   467: getfield 215	oicq/wlogin_sdk/request/k:w	Loicq/wlogin_sdk/request/u;
    //   470: getfield 390	oicq/wlogin_sdk/request/u:f	J
    //   473: invokevirtual 393	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   476: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   479: invokestatic 287	oicq/wlogin_sdk/tools/util:LOGI	(Ljava/lang/String;Ljava/lang/String;)V
    //   482: aload 20
    //   484: invokevirtual 1294	java/net/URL:openConnection	()Ljava/net/URLConnection;
    //   487: checkcast 1296	java/net/HttpURLConnection
    //   490: astore 20
    //   492: aload 20
    //   494: ldc_w 1298
    //   497: invokevirtual 1301	java/net/HttpURLConnection:setRequestMethod	(Ljava/lang/String;)V
    //   500: iload 13
    //   502: ifeq +13 -> 515
    //   505: aload 20
    //   507: ldc_w 1303
    //   510: aload 23
    //   512: invokevirtual 1306	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   515: aload 20
    //   517: ldc_w 1308
    //   520: ldc_w 1310
    //   523: invokevirtual 1306	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   526: aload 20
    //   528: ldc_w 1312
    //   531: ldc_w 1314
    //   534: invokevirtual 1306	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   537: aload 20
    //   539: ldc_w 1316
    //   542: aload 24
    //   544: arraylength
    //   545: invokestatic 1318	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   548: invokevirtual 1306	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   551: aload 20
    //   553: aload_0
    //   554: getfield 215	oicq/wlogin_sdk/request/k:w	Loicq/wlogin_sdk/request/u;
    //   557: getfield 520	oicq/wlogin_sdk/request/u:l	I
    //   560: invokevirtual 1321	java/net/HttpURLConnection:setConnectTimeout	(I)V
    //   563: aload 20
    //   565: aload_0
    //   566: getfield 215	oicq/wlogin_sdk/request/k:w	Loicq/wlogin_sdk/request/u;
    //   569: getfield 520	oicq/wlogin_sdk/request/u:l	I
    //   572: invokevirtual 1324	java/net/HttpURLConnection:setReadTimeout	(I)V
    //   575: aload 20
    //   577: iconst_1
    //   578: invokevirtual 1328	java/net/HttpURLConnection:setDoOutput	(Z)V
    //   581: aload 20
    //   583: iconst_1
    //   584: invokevirtual 1331	java/net/HttpURLConnection:setDoInput	(Z)V
    //   587: ldc_w 1333
    //   590: new 369	java/lang/StringBuilder
    //   593: dup
    //   594: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   597: ldc 73
    //   599: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   602: aload_0
    //   603: getfield 215	oicq/wlogin_sdk/request/k:w	Loicq/wlogin_sdk/request/u;
    //   606: getfield 390	oicq/wlogin_sdk/request/u:f	J
    //   609: invokevirtual 393	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   612: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   615: invokestatic 287	oicq/wlogin_sdk/tools/util:LOGI	(Ljava/lang/String;Ljava/lang/String;)V
    //   618: aload 20
    //   620: aload_0
    //   621: getfield 215	oicq/wlogin_sdk/request/k:w	Loicq/wlogin_sdk/request/u;
    //   624: getfield 520	oicq/wlogin_sdk/request/u:l	I
    //   627: i2l
    //   628: invokestatic 1338	oicq/wlogin_sdk/request/i:a	(Ljava/net/HttpURLConnection;J)Z
    //   631: ifne +230 -> 861
    //   634: ldc_w 1340
    //   637: new 369	java/lang/StringBuilder
    //   640: dup
    //   641: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   644: ldc 73
    //   646: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   649: aload_0
    //   650: getfield 215	oicq/wlogin_sdk/request/k:w	Loicq/wlogin_sdk/request/u;
    //   653: getfield 390	oicq/wlogin_sdk/request/u:f	J
    //   656: invokevirtual 393	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   659: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   662: invokestatic 287	oicq/wlogin_sdk/tools/util:LOGI	(Ljava/lang/String;Ljava/lang/String;)V
    //   665: iload_1
    //   666: iconst_1
    //   667: iadd
    //   668: istore_1
    //   669: sipush 64536
    //   672: istore_2
    //   673: iload 15
    //   675: istore 14
    //   677: goto -585 -> 92
    //   680: iload 13
    //   682: istore 14
    //   684: aload_0
    //   685: aload 23
    //   687: iconst_0
    //   688: aload_0
    //   689: getfield 215	oicq/wlogin_sdk/request/k:w	Loicq/wlogin_sdk/request/u;
    //   692: getfield 520	oicq/wlogin_sdk/request/u:l	I
    //   695: i2l
    //   696: invokestatic 1345	oicq/wlogin_sdk/request/a:a	(Ljava/lang/String;IJ)Ljava/net/InetSocketAddress;
    //   699: putfield 113	oicq/wlogin_sdk/request/k:p	Ljava/net/InetSocketAddress;
    //   702: iload 13
    //   704: istore 14
    //   706: aload_0
    //   707: getfield 113	oicq/wlogin_sdk/request/k:p	Ljava/net/InetSocketAddress;
    //   710: ifnull +1967 -> 2677
    //   713: iload 13
    //   715: istore 14
    //   717: aload_0
    //   718: getfield 113	oicq/wlogin_sdk/request/k:p	Ljava/net/InetSocketAddress;
    //   721: invokevirtual 200	java/net/InetSocketAddress:getAddress	()Ljava/net/InetAddress;
    //   724: invokevirtual 206	java/net/InetAddress:getHostAddress	()Ljava/lang/String;
    //   727: astore 21
    //   729: iload 13
    //   731: istore 14
    //   733: aload 17
    //   735: aload 21
    //   737: invokevirtual 1349	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   740: ifeq +57 -> 797
    //   743: iload 13
    //   745: istore 14
    //   747: new 410	java/lang/Exception
    //   750: dup
    //   751: new 369	java/lang/StringBuilder
    //   754: dup
    //   755: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   758: ldc_w 1351
    //   761: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   764: aload 17
    //   766: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   769: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   772: invokespecial 1352	java/lang/Exception:<init>	(Ljava/lang/String;)V
    //   775: athrow
    //   776: astore 20
    //   778: iload 14
    //   780: istore 13
    //   782: sipush 64536
    //   785: istore_2
    //   786: iload_1
    //   787: iconst_1
    //   788: iadd
    //   789: istore_1
    //   790: iload 15
    //   792: istore 14
    //   794: goto -702 -> 92
    //   797: aload 21
    //   799: astore 20
    //   801: aload_0
    //   802: aconst_null
    //   803: putfield 113	oicq/wlogin_sdk/request/k:p	Ljava/net/InetSocketAddress;
    //   806: aload 21
    //   808: astore 22
    //   810: aload 21
    //   812: astore 17
    //   814: aload 17
    //   816: astore 20
    //   818: new 1276	java/net/URL
    //   821: dup
    //   822: new 369	java/lang/StringBuilder
    //   825: dup
    //   826: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   829: ldc_w 1278
    //   832: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   835: aload 22
    //   837: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   840: ldc_w 1282
    //   843: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   846: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   849: invokespecial 1284	java/net/URL:<init>	(Ljava/lang/String;)V
    //   852: astore 21
    //   854: aload 21
    //   856: astore 20
    //   858: goto -447 -> 411
    //   861: ldc_w 1354
    //   864: new 369	java/lang/StringBuilder
    //   867: dup
    //   868: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   871: ldc 73
    //   873: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   876: aload_0
    //   877: getfield 215	oicq/wlogin_sdk/request/k:w	Loicq/wlogin_sdk/request/u;
    //   880: getfield 390	oicq/wlogin_sdk/request/u:f	J
    //   883: invokevirtual 393	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   886: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   889: invokestatic 287	oicq/wlogin_sdk/tools/util:LOGI	(Ljava/lang/String;Ljava/lang/String;)V
    //   892: aload 20
    //   894: invokevirtual 1358	java/net/HttpURLConnection:getOutputStream	()Ljava/io/OutputStream;
    //   897: astore 21
    //   899: aload 21
    //   901: aload 24
    //   903: iconst_0
    //   904: aload 24
    //   906: arraylength
    //   907: invokevirtual 1363	java/io/OutputStream:write	([BII)V
    //   910: aload 21
    //   912: invokevirtual 1366	java/io/OutputStream:flush	()V
    //   915: aload 20
    //   917: invokevirtual 1369	java/net/HttpURLConnection:getResponseCode	()I
    //   920: istore_2
    //   921: new 369	java/lang/StringBuilder
    //   924: dup
    //   925: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   928: ldc_w 1371
    //   931: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   934: iload_2
    //   935: invokevirtual 379	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   938: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   941: new 369	java/lang/StringBuilder
    //   944: dup
    //   945: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   948: ldc 73
    //   950: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   953: aload_0
    //   954: getfield 215	oicq/wlogin_sdk/request/k:w	Loicq/wlogin_sdk/request/u;
    //   957: getfield 390	oicq/wlogin_sdk/request/u:f	J
    //   960: invokevirtual 393	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   963: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   966: invokestatic 287	oicq/wlogin_sdk/tools/util:LOGI	(Ljava/lang/String;Ljava/lang/String;)V
    //   969: sipush 200
    //   972: iload_2
    //   973: if_icmpeq +18 -> 991
    //   976: iload_1
    //   977: iconst_1
    //   978: iadd
    //   979: istore_1
    //   980: sipush 64536
    //   983: istore_2
    //   984: iload 15
    //   986: istore 14
    //   988: goto -896 -> 92
    //   991: aload 20
    //   993: invokevirtual 1375	java/net/HttpURLConnection:getInputStream	()Ljava/io/InputStream;
    //   996: astore 21
    //   998: aload 18
    //   1000: astore 20
    //   1002: aload 19
    //   1004: astore 18
    //   1006: aload 17
    //   1008: astore 19
    //   1010: aload 20
    //   1012: astore 17
    //   1014: aload 17
    //   1016: astore 20
    //   1018: iload_1
    //   1019: istore_2
    //   1020: ldc_w 1377
    //   1023: new 369	java/lang/StringBuilder
    //   1026: dup
    //   1027: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   1030: ldc 73
    //   1032: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1035: aload_0
    //   1036: getfield 215	oicq/wlogin_sdk/request/k:w	Loicq/wlogin_sdk/request/u;
    //   1039: getfield 390	oicq/wlogin_sdk/request/u:f	J
    //   1042: invokevirtual 393	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   1045: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1048: invokestatic 287	oicq/wlogin_sdk/tools/util:LOGI	(Ljava/lang/String;Ljava/lang/String;)V
    //   1051: iconst_0
    //   1052: istore 5
    //   1054: iconst_0
    //   1055: istore 6
    //   1057: aload 17
    //   1059: astore 20
    //   1061: iload_1
    //   1062: istore_2
    //   1063: iload 6
    //   1065: aload_0
    //   1066: getfield 91	oicq/wlogin_sdk/request/k:e	I
    //   1069: iconst_1
    //   1070: iadd
    //   1071: if_icmpge +36 -> 1107
    //   1074: aload 17
    //   1076: astore 20
    //   1078: iload_1
    //   1079: istore_2
    //   1080: aload 21
    //   1082: aload_0
    //   1083: getfield 117	oicq/wlogin_sdk/request/k:r	[B
    //   1086: iload 6
    //   1088: aload_0
    //   1089: getfield 91	oicq/wlogin_sdk/request/k:e	I
    //   1092: iconst_1
    //   1093: iadd
    //   1094: iload 6
    //   1096: isub
    //   1097: invokevirtual 1382	java/io/InputStream:read	([BII)I
    //   1100: istore 5
    //   1102: iload 5
    //   1104: ifge +804 -> 1908
    //   1107: iload 5
    //   1109: ifge +809 -> 1918
    //   1112: sipush 64536
    //   1115: istore 5
    //   1117: iload_1
    //   1118: iconst_1
    //   1119: iadd
    //   1120: istore_1
    //   1121: aload 17
    //   1123: astore 20
    //   1125: iload 15
    //   1127: ifne +42 -> 1169
    //   1130: aload 17
    //   1132: astore 20
    //   1134: iload_1
    //   1135: istore_2
    //   1136: aload 17
    //   1138: invokevirtual 1387	java/net/Socket:close	()V
    //   1141: aload 17
    //   1143: astore 20
    //   1145: iload_1
    //   1146: istore_2
    //   1147: aload_0
    //   1148: aconst_null
    //   1149: putfield 113	oicq/wlogin_sdk/request/k:p	Ljava/net/InetSocketAddress;
    //   1152: aconst_null
    //   1153: astore 20
    //   1155: aconst_null
    //   1156: astore 17
    //   1158: iload_1
    //   1159: istore_2
    //   1160: aload_0
    //   1161: aconst_null
    //   1162: invokevirtual 1389	oicq/wlogin_sdk/request/k:a	(Ljava/net/Socket;)V
    //   1165: aload 17
    //   1167: astore 20
    //   1169: aload 19
    //   1171: astore 17
    //   1173: aload 18
    //   1175: astore 19
    //   1177: iload 5
    //   1179: istore_2
    //   1180: iload 15
    //   1182: istore 14
    //   1184: aload 20
    //   1186: astore 18
    //   1188: goto -1096 -> 92
    //   1191: new 369	java/lang/StringBuilder
    //   1194: dup
    //   1195: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   1198: ldc_w 1391
    //   1201: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1204: iload_1
    //   1205: invokevirtual 379	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1208: ldc_w 1257
    //   1211: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1214: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1217: new 369	java/lang/StringBuilder
    //   1220: dup
    //   1221: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   1224: ldc 73
    //   1226: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1229: aload_0
    //   1230: getfield 215	oicq/wlogin_sdk/request/k:w	Loicq/wlogin_sdk/request/u;
    //   1233: getfield 390	oicq/wlogin_sdk/request/u:f	J
    //   1236: invokevirtual 393	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   1239: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1242: invokestatic 287	oicq/wlogin_sdk/tools/util:LOGI	(Ljava/lang/String;Ljava/lang/String;)V
    //   1245: aload 18
    //   1247: ifnonnull +1427 -> 2674
    //   1250: ldc 73
    //   1252: astore 20
    //   1254: iconst_1
    //   1255: istore_2
    //   1256: iconst_1
    //   1257: istore 4
    //   1259: aload_0
    //   1260: getfield 113	oicq/wlogin_sdk/request/k:p	Ljava/net/InetSocketAddress;
    //   1263: ifnonnull +98 -> 1361
    //   1266: aload_0
    //   1267: iload_1
    //   1268: iload 15
    //   1270: invokevirtual 1259	oicq/wlogin_sdk/request/k:a	(IZ)Ljava/lang/String;
    //   1273: astore 20
    //   1275: new 369	java/lang/StringBuilder
    //   1278: dup
    //   1279: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   1282: ldc_w 1393
    //   1285: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1288: aload 20
    //   1290: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1293: ldc_w 1395
    //   1296: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1299: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1302: new 369	java/lang/StringBuilder
    //   1305: dup
    //   1306: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   1309: ldc 73
    //   1311: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1314: aload_0
    //   1315: getfield 215	oicq/wlogin_sdk/request/k:w	Loicq/wlogin_sdk/request/u;
    //   1318: getfield 390	oicq/wlogin_sdk/request/u:f	J
    //   1321: invokevirtual 393	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   1324: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1327: invokestatic 287	oicq/wlogin_sdk/tools/util:LOGI	(Ljava/lang/String;Ljava/lang/String;)V
    //   1330: aload_0
    //   1331: aload_0
    //   1332: iload 15
    //   1334: invokevirtual 159	oicq/wlogin_sdk/request/k:c	(Z)I
    //   1337: putfield 115	oicq/wlogin_sdk/request/k:q	I
    //   1340: aload_0
    //   1341: aload 20
    //   1343: aload_0
    //   1344: getfield 115	oicq/wlogin_sdk/request/k:q	I
    //   1347: aload_0
    //   1348: getfield 215	oicq/wlogin_sdk/request/k:w	Loicq/wlogin_sdk/request/u;
    //   1351: getfield 520	oicq/wlogin_sdk/request/u:l	I
    //   1354: i2l
    //   1355: invokestatic 1345	oicq/wlogin_sdk/request/a:a	(Ljava/lang/String;IJ)Ljava/net/InetSocketAddress;
    //   1358: putfield 113	oicq/wlogin_sdk/request/k:p	Ljava/net/InetSocketAddress;
    //   1361: aload_0
    //   1362: getfield 113	oicq/wlogin_sdk/request/k:p	Ljava/net/InetSocketAddress;
    //   1365: ifnull +21 -> 1386
    //   1368: aload 19
    //   1370: aload_0
    //   1371: getfield 113	oicq/wlogin_sdk/request/k:p	Ljava/net/InetSocketAddress;
    //   1374: invokevirtual 200	java/net/InetSocketAddress:getAddress	()Ljava/net/InetAddress;
    //   1377: invokevirtual 206	java/net/InetAddress:getHostAddress	()Ljava/lang/String;
    //   1380: invokevirtual 1349	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   1383: ifeq +149 -> 1532
    //   1386: aload_0
    //   1387: getfield 113	oicq/wlogin_sdk/request/k:p	Ljava/net/InetSocketAddress;
    //   1390: ifnonnull +86 -> 1476
    //   1393: new 369	java/lang/StringBuilder
    //   1396: dup
    //   1397: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   1400: ldc_w 1393
    //   1403: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1406: aload 20
    //   1408: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1411: ldc_w 1397
    //   1414: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1417: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1420: new 369	java/lang/StringBuilder
    //   1423: dup
    //   1424: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   1427: ldc 73
    //   1429: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1432: aload_0
    //   1433: getfield 215	oicq/wlogin_sdk/request/k:w	Loicq/wlogin_sdk/request/u;
    //   1436: getfield 390	oicq/wlogin_sdk/request/u:f	J
    //   1439: invokevirtual 393	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   1442: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1445: invokestatic 287	oicq/wlogin_sdk/tools/util:LOGI	(Ljava/lang/String;Ljava/lang/String;)V
    //   1448: sipush 64529
    //   1451: istore_2
    //   1452: iload_1
    //   1453: iconst_1
    //   1454: iadd
    //   1455: istore_1
    //   1456: aload_0
    //   1457: aconst_null
    //   1458: putfield 113	oicq/wlogin_sdk/request/k:p	Ljava/net/InetSocketAddress;
    //   1461: aconst_null
    //   1462: astore 18
    //   1464: aload_0
    //   1465: aconst_null
    //   1466: invokevirtual 1389	oicq/wlogin_sdk/request/k:a	(Ljava/net/Socket;)V
    //   1469: iload 15
    //   1471: istore 14
    //   1473: goto -1381 -> 92
    //   1476: new 369	java/lang/StringBuilder
    //   1479: dup
    //   1480: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   1483: ldc_w 1399
    //   1486: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1489: aload 19
    //   1491: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1494: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1497: new 369	java/lang/StringBuilder
    //   1500: dup
    //   1501: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   1504: ldc 73
    //   1506: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1509: aload_0
    //   1510: getfield 215	oicq/wlogin_sdk/request/k:w	Loicq/wlogin_sdk/request/u;
    //   1513: getfield 390	oicq/wlogin_sdk/request/u:f	J
    //   1516: invokevirtual 393	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   1519: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1522: invokestatic 287	oicq/wlogin_sdk/tools/util:LOGI	(Ljava/lang/String;Ljava/lang/String;)V
    //   1525: sipush 64536
    //   1528: istore_2
    //   1529: goto -77 -> 1452
    //   1532: aload_0
    //   1533: getfield 113	oicq/wlogin_sdk/request/k:p	Ljava/net/InetSocketAddress;
    //   1536: invokevirtual 200	java/net/InetSocketAddress:getAddress	()Ljava/net/InetAddress;
    //   1539: invokevirtual 206	java/net/InetAddress:getHostAddress	()Ljava/lang/String;
    //   1542: astore 19
    //   1544: new 369	java/lang/StringBuilder
    //   1547: dup
    //   1548: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   1551: ldc_w 1393
    //   1554: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1557: aload 20
    //   1559: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1562: ldc_w 1401
    //   1565: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1568: aload_0
    //   1569: getfield 113	oicq/wlogin_sdk/request/k:p	Ljava/net/InetSocketAddress;
    //   1572: invokevirtual 1402	java/net/InetSocketAddress:toString	()Ljava/lang/String;
    //   1575: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1578: ldc_w 1404
    //   1581: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1584: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1587: new 369	java/lang/StringBuilder
    //   1590: dup
    //   1591: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   1594: ldc 73
    //   1596: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1599: aload_0
    //   1600: getfield 215	oicq/wlogin_sdk/request/k:w	Loicq/wlogin_sdk/request/u;
    //   1603: getfield 390	oicq/wlogin_sdk/request/u:f	J
    //   1606: invokevirtual 393	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   1609: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1612: invokestatic 287	oicq/wlogin_sdk/tools/util:LOGI	(Ljava/lang/String;Ljava/lang/String;)V
    //   1615: iload_2
    //   1616: istore 4
    //   1618: aload 18
    //   1620: ifnonnull +1051 -> 2671
    //   1623: new 369	java/lang/StringBuilder
    //   1626: dup
    //   1627: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   1630: ldc_w 1406
    //   1633: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1636: aload_0
    //   1637: getfield 113	oicq/wlogin_sdk/request/k:p	Ljava/net/InetSocketAddress;
    //   1640: invokevirtual 757	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   1643: ldc_w 1395
    //   1646: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1649: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1652: new 369	java/lang/StringBuilder
    //   1655: dup
    //   1656: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   1659: ldc 73
    //   1661: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1664: aload_0
    //   1665: getfield 215	oicq/wlogin_sdk/request/k:w	Loicq/wlogin_sdk/request/u;
    //   1668: getfield 390	oicq/wlogin_sdk/request/u:f	J
    //   1671: invokevirtual 393	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   1674: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1677: invokestatic 287	oicq/wlogin_sdk/tools/util:LOGI	(Ljava/lang/String;Ljava/lang/String;)V
    //   1680: new 1384	java/net/Socket
    //   1683: dup
    //   1684: invokespecial 1407	java/net/Socket:<init>	()V
    //   1687: astore 18
    //   1689: aload_0
    //   1690: aload 18
    //   1692: invokevirtual 1389	oicq/wlogin_sdk/request/k:a	(Ljava/net/Socket;)V
    //   1695: aload 18
    //   1697: aload_0
    //   1698: getfield 113	oicq/wlogin_sdk/request/k:p	Ljava/net/InetSocketAddress;
    //   1701: aload_0
    //   1702: getfield 215	oicq/wlogin_sdk/request/k:w	Loicq/wlogin_sdk/request/u;
    //   1705: getfield 520	oicq/wlogin_sdk/request/u:l	I
    //   1708: invokevirtual 1411	java/net/Socket:connect	(Ljava/net/SocketAddress;I)V
    //   1711: aload 18
    //   1713: aload_0
    //   1714: getfield 215	oicq/wlogin_sdk/request/k:w	Loicq/wlogin_sdk/request/u;
    //   1717: getfield 520	oicq/wlogin_sdk/request/u:l	I
    //   1720: invokevirtual 1414	java/net/Socket:setSoTimeout	(I)V
    //   1723: aload 18
    //   1725: aload_0
    //   1726: getfield 117	oicq/wlogin_sdk/request/k:r	[B
    //   1729: arraylength
    //   1730: invokevirtual 1417	java/net/Socket:setReceiveBufferSize	(I)V
    //   1733: new 369	java/lang/StringBuilder
    //   1736: dup
    //   1737: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   1740: ldc_w 1406
    //   1743: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1746: aload_0
    //   1747: getfield 113	oicq/wlogin_sdk/request/k:p	Ljava/net/InetSocketAddress;
    //   1750: invokevirtual 757	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   1753: ldc_w 1419
    //   1756: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1759: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1762: new 369	java/lang/StringBuilder
    //   1765: dup
    //   1766: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   1769: ldc 73
    //   1771: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1774: aload_0
    //   1775: getfield 215	oicq/wlogin_sdk/request/k:w	Loicq/wlogin_sdk/request/u;
    //   1778: getfield 390	oicq/wlogin_sdk/request/u:f	J
    //   1781: invokevirtual 393	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   1784: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1787: invokestatic 287	oicq/wlogin_sdk/tools/util:LOGI	(Ljava/lang/String;Ljava/lang/String;)V
    //   1790: ldc_w 1421
    //   1793: new 369	java/lang/StringBuilder
    //   1796: dup
    //   1797: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   1800: ldc 73
    //   1802: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1805: aload_0
    //   1806: getfield 215	oicq/wlogin_sdk/request/k:w	Loicq/wlogin_sdk/request/u;
    //   1809: getfield 390	oicq/wlogin_sdk/request/u:f	J
    //   1812: invokevirtual 393	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   1815: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1818: invokestatic 287	oicq/wlogin_sdk/tools/util:LOGI	(Ljava/lang/String;Ljava/lang/String;)V
    //   1821: aload 18
    //   1823: invokevirtual 1422	java/net/Socket:getOutputStream	()Ljava/io/OutputStream;
    //   1826: astore 20
    //   1828: aload 20
    //   1830: aload 24
    //   1832: iconst_0
    //   1833: aload 24
    //   1835: arraylength
    //   1836: invokevirtual 1363	java/io/OutputStream:write	([BII)V
    //   1839: aload 20
    //   1841: invokevirtual 1366	java/io/OutputStream:flush	()V
    //   1844: aload 18
    //   1846: invokevirtual 1423	java/net/Socket:getInputStream	()Ljava/io/InputStream;
    //   1849: astore 22
    //   1851: aload 17
    //   1853: astore 20
    //   1855: aload 19
    //   1857: astore 21
    //   1859: aload 18
    //   1861: astore 17
    //   1863: aload 20
    //   1865: astore 19
    //   1867: aload 21
    //   1869: astore 18
    //   1871: aload 22
    //   1873: astore 21
    //   1875: goto -861 -> 1014
    //   1878: astore 18
    //   1880: iload_1
    //   1881: iconst_1
    //   1882: iadd
    //   1883: istore_1
    //   1884: aload_0
    //   1885: aconst_null
    //   1886: putfield 113	oicq/wlogin_sdk/request/k:p	Ljava/net/InetSocketAddress;
    //   1889: aload_0
    //   1890: aconst_null
    //   1891: invokevirtual 1389	oicq/wlogin_sdk/request/k:a	(Ljava/net/Socket;)V
    //   1894: sipush 64536
    //   1897: istore_2
    //   1898: aconst_null
    //   1899: astore 18
    //   1901: iload 15
    //   1903: istore 14
    //   1905: goto -1813 -> 92
    //   1908: iload 6
    //   1910: iload 5
    //   1912: iadd
    //   1913: istore 6
    //   1915: goto -858 -> 1057
    //   1918: aload 17
    //   1920: astore 20
    //   1922: iload_1
    //   1923: istore_2
    //   1924: aload_0
    //   1925: aload_0
    //   1926: getfield 117	oicq/wlogin_sdk/request/k:r	[B
    //   1929: invokevirtual 1425	oicq/wlogin_sdk/request/k:b	([B)I
    //   1932: istore 6
    //   1934: iload 6
    //   1936: istore_2
    //   1937: aload 17
    //   1939: astore 20
    //   1941: iload_1
    //   1942: istore_3
    //   1943: iload_2
    //   1944: aload_0
    //   1945: getfield 91	oicq/wlogin_sdk/request/k:e	I
    //   1948: iconst_1
    //   1949: iadd
    //   1950: if_icmpgt +58 -> 2008
    //   1953: iload_1
    //   1954: iconst_1
    //   1955: iadd
    //   1956: istore_1
    //   1957: aload 17
    //   1959: astore 20
    //   1961: iload 15
    //   1963: ifne +732 -> 2695
    //   1966: aload 17
    //   1968: astore 20
    //   1970: iload_1
    //   1971: istore_3
    //   1972: aload 17
    //   1974: invokevirtual 1387	java/net/Socket:close	()V
    //   1977: aload 17
    //   1979: astore 20
    //   1981: iload_1
    //   1982: istore_3
    //   1983: aload_0
    //   1984: aconst_null
    //   1985: putfield 113	oicq/wlogin_sdk/request/k:p	Ljava/net/InetSocketAddress;
    //   1988: aconst_null
    //   1989: astore 17
    //   1991: aconst_null
    //   1992: astore 20
    //   1994: iload_1
    //   1995: istore_3
    //   1996: aload_0
    //   1997: aconst_null
    //   1998: invokevirtual 1389	oicq/wlogin_sdk/request/k:a	(Ljava/net/Socket;)V
    //   2001: aload 17
    //   2003: astore 20
    //   2005: goto +690 -> 2695
    //   2008: aload 17
    //   2010: astore 20
    //   2012: iload_1
    //   2013: istore_3
    //   2014: iload_2
    //   2015: aload_0
    //   2016: getfield 117	oicq/wlogin_sdk/request/k:r	[B
    //   2019: arraylength
    //   2020: if_icmplt +58 -> 2078
    //   2023: iload_1
    //   2024: iconst_1
    //   2025: iadd
    //   2026: istore_1
    //   2027: aload 17
    //   2029: astore 20
    //   2031: iload 15
    //   2033: ifne +687 -> 2720
    //   2036: aload 17
    //   2038: astore 20
    //   2040: iload_1
    //   2041: istore_3
    //   2042: aload 17
    //   2044: invokevirtual 1387	java/net/Socket:close	()V
    //   2047: aload 17
    //   2049: astore 20
    //   2051: iload_1
    //   2052: istore_3
    //   2053: aload_0
    //   2054: aconst_null
    //   2055: putfield 113	oicq/wlogin_sdk/request/k:p	Ljava/net/InetSocketAddress;
    //   2058: aconst_null
    //   2059: astore 17
    //   2061: aconst_null
    //   2062: astore 20
    //   2064: iload_1
    //   2065: istore_3
    //   2066: aload_0
    //   2067: aconst_null
    //   2068: invokevirtual 1389	oicq/wlogin_sdk/request/k:a	(Ljava/net/Socket;)V
    //   2071: aload 17
    //   2073: astore 20
    //   2075: goto +645 -> 2720
    //   2078: aload 17
    //   2080: astore 20
    //   2082: iload_1
    //   2083: istore_3
    //   2084: aload_0
    //   2085: getfield 91	oicq/wlogin_sdk/request/k:e	I
    //   2088: iconst_1
    //   2089: iadd
    //   2090: istore 7
    //   2092: iload_2
    //   2093: iload 7
    //   2095: isub
    //   2096: istore 6
    //   2098: iload 5
    //   2100: istore 8
    //   2102: iload 6
    //   2104: ifle +34 -> 2138
    //   2107: aload 17
    //   2109: astore 20
    //   2111: iload_1
    //   2112: istore_3
    //   2113: aload 21
    //   2115: aload_0
    //   2116: getfield 117	oicq/wlogin_sdk/request/k:r	[B
    //   2119: iload 7
    //   2121: iload 6
    //   2123: invokevirtual 1382	java/io/InputStream:read	([BII)I
    //   2126: istore 5
    //   2128: iload 5
    //   2130: iconst_m1
    //   2131: if_icmpne +108 -> 2239
    //   2134: iload 5
    //   2136: istore 8
    //   2138: iload_2
    //   2139: istore 5
    //   2141: lload 9
    //   2143: lstore 11
    //   2145: iload 4
    //   2147: istore_3
    //   2148: iload 15
    //   2150: istore 14
    //   2152: iload 13
    //   2154: istore 16
    //   2156: iload 8
    //   2158: iconst_m1
    //   2159: if_icmpne +185 -> 2344
    //   2162: iload_1
    //   2163: iconst_1
    //   2164: iadd
    //   2165: istore_1
    //   2166: aload 17
    //   2168: astore 20
    //   2170: iload 15
    //   2172: ifne +42 -> 2214
    //   2175: aload 17
    //   2177: astore 20
    //   2179: iload_1
    //   2180: istore_3
    //   2181: aload 17
    //   2183: invokevirtual 1387	java/net/Socket:close	()V
    //   2186: aload 17
    //   2188: astore 20
    //   2190: iload_1
    //   2191: istore_3
    //   2192: aload_0
    //   2193: aconst_null
    //   2194: putfield 113	oicq/wlogin_sdk/request/k:p	Ljava/net/InetSocketAddress;
    //   2197: aconst_null
    //   2198: astore 20
    //   2200: aconst_null
    //   2201: astore 17
    //   2203: iload_1
    //   2204: istore_3
    //   2205: aload_0
    //   2206: aconst_null
    //   2207: invokevirtual 1389	oicq/wlogin_sdk/request/k:a	(Ljava/net/Socket;)V
    //   2210: aload 17
    //   2212: astore 20
    //   2214: iload_2
    //   2215: istore_3
    //   2216: sipush 64536
    //   2219: istore_2
    //   2220: aload 19
    //   2222: astore 17
    //   2224: aload 18
    //   2226: astore 19
    //   2228: iload 15
    //   2230: istore 14
    //   2232: aload 20
    //   2234: astore 18
    //   2236: goto -2144 -> 92
    //   2239: iload 7
    //   2241: iload 5
    //   2243: iadd
    //   2244: istore 7
    //   2246: iload 6
    //   2248: iload 5
    //   2250: isub
    //   2251: istore 6
    //   2253: goto -155 -> 2098
    //   2256: astore 17
    //   2258: iload_2
    //   2259: istore_1
    //   2260: iload_3
    //   2261: istore_2
    //   2262: iload_1
    //   2263: iconst_1
    //   2264: iadd
    //   2265: istore_1
    //   2266: aload 20
    //   2268: astore 17
    //   2270: iload 15
    //   2272: ifne +29 -> 2301
    //   2275: aload 20
    //   2277: invokevirtual 1428	java/net/Socket:isConnected	()Z
    //   2280: ifeq +8 -> 2288
    //   2283: aload 20
    //   2285: invokevirtual 1387	java/net/Socket:close	()V
    //   2288: aload_0
    //   2289: aconst_null
    //   2290: putfield 113	oicq/wlogin_sdk/request/k:p	Ljava/net/InetSocketAddress;
    //   2293: aconst_null
    //   2294: astore 17
    //   2296: aload_0
    //   2297: aconst_null
    //   2298: invokevirtual 1389	oicq/wlogin_sdk/request/k:a	(Ljava/net/Socket;)V
    //   2301: aload 17
    //   2303: astore 20
    //   2305: iload_2
    //   2306: istore_3
    //   2307: sipush 64536
    //   2310: istore_2
    //   2311: aload 19
    //   2313: astore 17
    //   2315: aload 18
    //   2317: astore 19
    //   2319: iload 15
    //   2321: istore 14
    //   2323: aload 20
    //   2325: astore 18
    //   2327: goto -2235 -> 92
    //   2330: iload_3
    //   2331: istore 5
    //   2333: iload 13
    //   2335: istore 16
    //   2337: iload 4
    //   2339: istore_3
    //   2340: lload 9
    //   2342: lstore 11
    //   2344: iload_1
    //   2345: bipush 6
    //   2347: if_icmplt +252 -> 2599
    //   2350: sipush 64536
    //   2353: istore_2
    //   2354: iload_2
    //   2355: ifne +13 -> 2368
    //   2358: aload_0
    //   2359: aload_0
    //   2360: getfield 117	oicq/wlogin_sdk/request/k:r	[B
    //   2363: iload 5
    //   2365: invokevirtual 560	oicq/wlogin_sdk/request/k:b	([BI)V
    //   2368: iload_2
    //   2369: ifne +170 -> 2539
    //   2372: aload_0
    //   2373: getfield 119	oicq/wlogin_sdk/request/k:s	I
    //   2376: sipush 2066
    //   2379: if_icmpeq +160 -> 2539
    //   2382: new 128	oicq/wlogin_sdk/report/report_t3
    //   2385: dup
    //   2386: invokespecial 129	oicq/wlogin_sdk/report/report_t3:<init>	()V
    //   2389: astore 17
    //   2391: aload 17
    //   2393: aload_0
    //   2394: getfield 119	oicq/wlogin_sdk/request/k:s	I
    //   2397: putfield 132	oicq/wlogin_sdk/report/report_t3:_cmd	I
    //   2400: aload 17
    //   2402: aload_0
    //   2403: getfield 121	oicq/wlogin_sdk/request/k:t	I
    //   2406: putfield 135	oicq/wlogin_sdk/report/report_t3:_sub	I
    //   2409: aload 17
    //   2411: iload_2
    //   2412: putfield 138	oicq/wlogin_sdk/report/report_t3:_rst2	I
    //   2415: aload 17
    //   2417: invokestatic 144	java/lang/System:currentTimeMillis	()J
    //   2420: lload 11
    //   2422: lsub
    //   2423: l2i
    //   2424: putfield 147	oicq/wlogin_sdk/report/report_t3:_used	I
    //   2427: aload 17
    //   2429: iload_1
    //   2430: putfield 150	oicq/wlogin_sdk/report/report_t3:_try	I
    //   2433: aload 17
    //   2435: getstatic 77	oicq/wlogin_sdk/request/k:C	Ljava/lang/String;
    //   2438: putfield 153	oicq/wlogin_sdk/report/report_t3:_host	Ljava/lang/String;
    //   2441: aload 17
    //   2443: getfield 153	oicq/wlogin_sdk/report/report_t3:_host	Ljava/lang/String;
    //   2446: ifnonnull +10 -> 2456
    //   2449: aload 17
    //   2451: ldc 73
    //   2453: putfield 153	oicq/wlogin_sdk/report/report_t3:_host	Ljava/lang/String;
    //   2456: aload_0
    //   2457: getfield 113	oicq/wlogin_sdk/request/k:p	Ljava/net/InetSocketAddress;
    //   2460: ifnonnull +144 -> 2604
    //   2463: aload 17
    //   2465: ldc 73
    //   2467: putfield 156	oicq/wlogin_sdk/report/report_t3:_ip	Ljava/lang/String;
    //   2470: aload 17
    //   2472: aload_0
    //   2473: getfield 115	oicq/wlogin_sdk/request/k:q	I
    //   2476: putfield 162	oicq/wlogin_sdk/report/report_t3:_port	I
    //   2479: aload 17
    //   2481: iload_3
    //   2482: putfield 165	oicq/wlogin_sdk/report/report_t3:_conn	I
    //   2485: aload 17
    //   2487: getstatic 169	oicq/wlogin_sdk/request/u:B	I
    //   2490: putfield 172	oicq/wlogin_sdk/report/report_t3:_net	I
    //   2493: aload 17
    //   2495: ldc 73
    //   2497: putfield 175	oicq/wlogin_sdk/report/report_t3:_str	Ljava/lang/String;
    //   2500: aload 17
    //   2502: aload 24
    //   2504: arraylength
    //   2505: putfield 178	oicq/wlogin_sdk/report/report_t3:_slen	I
    //   2508: aload 17
    //   2510: iload 5
    //   2512: putfield 181	oicq/wlogin_sdk/report/report_t3:_rlen	I
    //   2515: iload 14
    //   2517: ifeq +114 -> 2631
    //   2520: iload 16
    //   2522: ifeq +100 -> 2622
    //   2525: aload 17
    //   2527: iconst_2
    //   2528: putfield 184	oicq/wlogin_sdk/report/report_t3:_wap	I
    //   2531: getstatic 188	oicq/wlogin_sdk/request/u:ah	Loicq/wlogin_sdk/report/report_t1;
    //   2534: aload 17
    //   2536: invokevirtual 194	oicq/wlogin_sdk/report/report_t1:add_t3	(Loicq/wlogin_sdk/report/report_t3;)V
    //   2539: new 369	java/lang/StringBuilder
    //   2542: dup
    //   2543: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   2546: aload_0
    //   2547: invokevirtual 512	java/lang/Object:getClass	()Ljava/lang/Class;
    //   2550: invokevirtual 517	java/lang/Class:getName	()Ljava/lang/String;
    //   2553: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2556: ldc_w 1430
    //   2559: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2562: iload_2
    //   2563: invokevirtual 379	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   2566: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2569: new 369	java/lang/StringBuilder
    //   2572: dup
    //   2573: invokespecial 370	java/lang/StringBuilder:<init>	()V
    //   2576: ldc 73
    //   2578: invokevirtual 376	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2581: aload_0
    //   2582: getfield 215	oicq/wlogin_sdk/request/k:w	Loicq/wlogin_sdk/request/u;
    //   2585: getfield 390	oicq/wlogin_sdk/request/u:f	J
    //   2588: invokevirtual 393	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   2591: invokevirtual 388	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2594: invokestatic 287	oicq/wlogin_sdk/tools/util:LOGI	(Ljava/lang/String;Ljava/lang/String;)V
    //   2597: iload_2
    //   2598: ireturn
    //   2599: iconst_0
    //   2600: istore_2
    //   2601: goto -247 -> 2354
    //   2604: aload 17
    //   2606: aload_0
    //   2607: getfield 113	oicq/wlogin_sdk/request/k:p	Ljava/net/InetSocketAddress;
    //   2610: invokevirtual 200	java/net/InetSocketAddress:getAddress	()Ljava/net/InetAddress;
    //   2613: invokevirtual 206	java/net/InetAddress:getHostAddress	()Ljava/lang/String;
    //   2616: putfield 156	oicq/wlogin_sdk/report/report_t3:_ip	Ljava/lang/String;
    //   2619: goto -149 -> 2470
    //   2622: aload 17
    //   2624: iconst_1
    //   2625: putfield 184	oicq/wlogin_sdk/report/report_t3:_wap	I
    //   2628: goto -97 -> 2531
    //   2631: aload 17
    //   2633: iconst_0
    //   2634: putfield 184	oicq/wlogin_sdk/report/report_t3:_wap	I
    //   2637: goto -106 -> 2531
    //   2640: astore 17
    //   2642: goto -354 -> 2288
    //   2645: astore 17
    //   2647: iload_3
    //   2648: istore_1
    //   2649: goto -387 -> 2262
    //   2652: astore 21
    //   2654: goto -1293 -> 1361
    //   2657: astore 17
    //   2659: aload 20
    //   2661: astore 17
    //   2663: goto -1881 -> 782
    //   2666: astore 20
    //   2668: goto -1886 -> 782
    //   2671: goto -881 -> 1790
    //   2674: goto -1056 -> 1618
    //   2677: aload 23
    //   2679: astore 22
    //   2681: goto -1867 -> 814
    //   2684: aconst_null
    //   2685: astore 20
    //   2687: iconst_m1
    //   2688: istore_2
    //   2689: goto -2333 -> 356
    //   2692: goto -2336 -> 356
    //   2695: iload_2
    //   2696: istore_3
    //   2697: sipush 64536
    //   2700: istore_2
    //   2701: aload 19
    //   2703: astore 17
    //   2705: aload 18
    //   2707: astore 19
    //   2709: iload 15
    //   2711: istore 14
    //   2713: aload 20
    //   2715: astore 18
    //   2717: goto -2625 -> 92
    //   2720: iload_2
    //   2721: istore_3
    //   2722: sipush 64536
    //   2725: istore_2
    //   2726: aload 19
    //   2728: astore 17
    //   2730: aload 18
    //   2732: astore 19
    //   2734: iload 15
    //   2736: istore 14
    //   2738: aload 20
    //   2740: astore 18
    //   2742: goto -2650 -> 92
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	2745	0	this	k
    //   65	2584	1	i1	int
    //   63	2663	2	i2	int
    //   61	2661	3	i3	int
    //   82	2256	4	i4	int
    //   1052	1459	5	i5	int
    //   1055	1197	6	i6	int
    //   2090	155	7	i7	int
    //   2100	60	8	i8	int
    //   67	2274	9	l1	long
    //   2143	278	11	l2	long
    //   79	2255	13	bool1	boolean
    //   76	2661	14	bool2	boolean
    //   114	2621	15	bool3	boolean
    //   2154	367	16	bool4	boolean
    //   90	2133	17	localObject1	Object
    //   2256	1	17	localThrowable1	Throwable
    //   2268	364	17	localObject2	Object
    //   2640	1	17	localException1	Exception
    //   2645	1	17	localThrowable2	Throwable
    //   2657	1	17	localException2	Exception
    //   2661	68	17	localObject3	Object
    //   73	1797	18	localObject4	Object
    //   1878	1	18	localThrowable3	Throwable
    //   1899	842	18	localObject5	Object
    //   86	2647	19	localObject6	Object
    //   246	373	20	localObject7	Object
    //   776	1	20	localException3	Exception
    //   799	1861	20	localObject8	Object
    //   2666	1	20	localException4	Exception
    //   2685	54	20	localObject9	Object
    //   727	1387	21	localObject10	Object
    //   2652	1	21	localException5	Exception
    //   808	1872	22	localObject11	Object
    //   220	2458	23	str	String
    //   58	2445	24	arrayOfByte	byte[]
    // Exception table:
    //   from	to	target	type
    //   226	234	776	java/lang/Exception
    //   243	248	776	java/lang/Exception
    //   252	256	776	java/lang/Exception
    //   265	273	776	java/lang/Exception
    //   284	353	776	java/lang/Exception
    //   365	411	776	java/lang/Exception
    //   684	702	776	java/lang/Exception
    //   706	713	776	java/lang/Exception
    //   717	729	776	java/lang/Exception
    //   733	743	776	java/lang/Exception
    //   747	776	776	java/lang/Exception
    //   1623	1790	1878	java/lang/Throwable
    //   1790	1851	1878	java/lang/Throwable
    //   1020	1051	2256	java/lang/Throwable
    //   1063	1074	2256	java/lang/Throwable
    //   1080	1102	2256	java/lang/Throwable
    //   1136	1141	2256	java/lang/Throwable
    //   1147	1152	2256	java/lang/Throwable
    //   1160	1165	2256	java/lang/Throwable
    //   1924	1934	2256	java/lang/Throwable
    //   2275	2288	2640	java/lang/Exception
    //   1943	1953	2645	java/lang/Throwable
    //   1972	1977	2645	java/lang/Throwable
    //   1983	1988	2645	java/lang/Throwable
    //   1996	2001	2645	java/lang/Throwable
    //   2014	2023	2645	java/lang/Throwable
    //   2042	2047	2645	java/lang/Throwable
    //   2053	2058	2645	java/lang/Throwable
    //   2066	2071	2645	java/lang/Throwable
    //   2084	2092	2645	java/lang/Throwable
    //   2113	2128	2645	java/lang/Throwable
    //   2181	2186	2645	java/lang/Throwable
    //   2192	2197	2645	java/lang/Throwable
    //   2205	2210	2645	java/lang/Throwable
    //   1330	1361	2652	java/lang/Exception
    //   801	806	2657	java/lang/Exception
    //   818	854	2657	java/lang/Exception
    //   411	500	2666	java/lang/Exception
    //   505	515	2666	java/lang/Exception
    //   515	665	2666	java/lang/Exception
    //   861	969	2666	java/lang/Exception
    //   991	998	2666	java/lang/Exception
  }
  
  public int f()
  {
    return bw.h)._last_flowid;
  }
}
