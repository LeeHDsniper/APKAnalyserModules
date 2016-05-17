package com.tencent.mobileqq.msf.core.net.b;

import android.os.SystemClock;
import com.tencent.mobileqq.msf.core.MsfCore;
import com.tencent.mobileqq.msf.core.d;
import com.tencent.mobileqq.msf.core.n;
import com.tencent.mobileqq.msf.core.w;
import com.tencent.mobileqq.msf.sdk.MsfCommand;
import com.tencent.mobileqq.msf.sdk.k;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.CodecWarpper;
import com.tencent.qphone.base.util.QLog;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.nio.ByteBuffer;
import java.util.concurrent.atomic.AtomicBoolean;

public class f
  extends Thread
{
  private static final String f = "ReqAllFailSocket";
  private static final int g = 10000;
  protected boolean a = false;
  protected boolean b = false;
  protected boolean c = false;
  protected long d = 0L;
  protected long e = 0L;
  private Socket h;
  private OutputStream i;
  private InputStream j;
  private AtomicBoolean k = new AtomicBoolean(false);
  private AtomicBoolean l = new AtomicBoolean(false);
  private d m;
  private k n = new k(1000);
  private long o = 0L;
  private String p = "";
  private MsfCore q;
  private int r;
  
  public f(MsfCore paramMsfCore, d paramD, int paramInt)
  {
    q = paramMsfCore;
    m = paramD;
    r = paramInt;
  }
  
  private int a(String paramString, MsfCommand paramMsfCommand, byte[] paramArrayOfByte)
    throws IOException
  {
    if (paramMsfCommand == MsfCommand.openConn) {}
    for (;;)
    {
      return paramArrayOfByte.length;
      try
      {
        i.write(paramArrayOfByte);
        i.flush();
        QLog.d("ReqAllFailSocket", 1, r + " send " + paramString);
      }
      catch (Throwable paramString)
      {
        paramString.printStackTrace();
        d();
      }
    }
  }
  
  private boolean c()
  {
    InetSocketAddress localInetSocketAddress = new InetSocketAddress(m.c(), m.d());
    try
    {
      h = new Socket();
      h.setTcpNoDelay(true);
      h.setKeepAlive(true);
      h.connect(localInetSocketAddress, m.e());
      i = h.getOutputStream();
      j = h.getInputStream();
      k.set(true);
      c = true;
      o = SystemClock.elapsedRealtime();
      QLog.d("ReqAllFailSocket", 1, r + " conn " + m.c() + ":" + m.d() + " succ");
      return true;
    }
    catch (Throwable localThrowable)
    {
      localThrowable.printStackTrace();
      p = "connFail";
      QLog.d("ReqAllFailSocket", 1, r + " conn " + m.c() + ":" + m.d() + " fail");
    }
    return false;
  }
  
  private void d()
  {
    QLog.d("ReqAllFailSocket", 1, r + " closeConn");
    if (h != null) {}
    try
    {
      h.close();
      h = null;
      localAtomicBoolean1 = k;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        AtomicBoolean localAtomicBoolean1;
        localException.printStackTrace();
        h = null;
        AtomicBoolean localAtomicBoolean2 = k;
      }
    }
    finally
    {
      h = null;
      k.set(false);
    }
    localAtomicBoolean1.set(false);
  }
  
  private void e()
  {
    ToServiceMsg localToServiceMsg = new ToServiceMsg("", "0", "Heartbeat.Alive");
    localToServiceMsg.setMsfCommand(MsfCommand._msf_HeartbeatAlive);
    localToServiceMsg.setRequestSsoSeq(MsfCore.getNextSeq());
    localToServiceMsg.setAppId(q.getMsfAppid());
    localToServiceMsg.putWupBuffer(new byte[] { 0, 0, 0, 4 });
    a(localToServiceMsg);
  }
  
  private void f()
  {
    int i1 = "MSF".getBytes().length + 13 + 1 + 0 + 4;
    byte b1 = (byte)"MSF".getBytes().length;
    Object localObject = ByteBuffer.allocate(i1);
    ((ByteBuffer)localObject).putInt(i1).putInt(20140601).putInt(0).put(b1).put("MSF".getBytes()).put((byte)0).putInt(0);
    localObject = ((ByteBuffer)localObject).array();
    try
    {
      a("MSF", MsfCommand.msf_ssoping, (byte[])localObject);
      return;
    }
    catch (IOException localIOException)
    {
      localIOException.printStackTrace();
    }
  }
  
  public void a()
  {
    d();
    l.set(true);
  }
  
  public void a(ToServiceMsg paramToServiceMsg)
  {
    try
    {
      n.add(paramToServiceMsg);
      return;
    }
    catch (Exception paramToServiceMsg)
    {
      paramToServiceMsg.printStackTrace();
      QLog.d("ReqAllFailSocket", 1, "addSendQueu fail,", paramToServiceMsg);
    }
  }
  
  public String b()
  {
    return m.c() + "|" + m.d() + "|" + a + "|" + b + "|" + p + "|" + c + "|" + d + "|" + e;
  }
  
  public void run()
  {
    if (c())
    {
      new b(null).start();
      new a(null).start();
      f();
      e();
    }
  }
  
  private class a
    extends Thread
  {
    private a() {}
    
    public void run()
    {
      for (;;)
      {
        int j;
        try
        {
          DataInputStream localDataInputStream = new DataInputStream(f.e(f.this));
          i = 0;
          if ((f.c(f.this).get()) || (!f.a(f.this).get()))
          {
            if (i > 0) {
              break label215;
            }
            j = localDataInputStream.readInt() - 4;
            if (j <= 33)
            {
              a = true;
              d = (SystemClock.elapsedRealtime() - f.f(f.this));
              QLog.d("ReqAllFailSocket", 1, f.g(f.this) + " recv sso ping");
              i = j;
            }
          }
          else
          {
            return;
          }
        }
        catch (Throwable localThrowable)
        {
          localThrowable.printStackTrace();
          f.a(f.this, "readError");
          f.d(f.this);
        }
        int i = j;
        if (j == 62)
        {
          b = true;
          e = (SystemClock.elapsedRealtime() - f.f(f.this));
          QLog.d("ReqAllFailSocket", 1, f.g(f.this) + " recv heartbeat ping");
          i = j;
          continue;
          label215:
          localThrowable.readByte();
          i -= 1;
        }
      }
    }
  }
  
  private class b
    extends Thread
  {
    private b() {}
    
    public void run()
    {
      ToServiceMsg localToServiceMsg;
      String str;
      for (;;)
      {
        if (f.a(f.this).get()) {
          return;
        }
        try
        {
          localToServiceMsg = (ToServiceMsg)f.b(f.this).k();
          str = localToServiceMsg.getServiceCmd();
          localObject = null;
        }
        catch (Throwable localThrowable)
        {
          Object localObject;
          byte[] arrayOfByte2;
          label42:
          label89:
          localThrowable.printStackTrace();
          f.d(f.this);
        }
        try
        {
          arrayOfByte2 = w.f(localToServiceMsg);
          localObject = arrayOfByte2;
        }
        catch (Exception localException)
        {
          QLog.d("ReqAllFailSocket", 1, "", localException);
          break label42;
          byte[] arrayOfByte1 = CodecWarpper.encodeRequest(localToServiceMsg.getRequestSsoSeq(), n.d(), n.f(), n.g(), "", str, null, localToServiceMsg.getAppId(), 0, localToServiceMsg.getUin(), (byte)0, (byte)0, localThrowable, localToServiceMsg.getWupBuffer(), true);
          break label89;
        }
        if (591 != CodecWarpper.getSharedObjectVersion()) {
          break;
        }
        localObject = CodecWarpper.encodeRequest(localToServiceMsg.getRequestSsoSeq(), n.d(), n.f(), n.g(), "", str, null, localToServiceMsg.getAppId(), 0, localToServiceMsg.getUin(), (byte)0, (byte)0, localToServiceMsg.getWupBuffer(), true);
        if (f.c(f.this).get()) {
          f.a(f.this, localToServiceMsg.getServiceCmd(), localToServiceMsg.getMsfCommand(), (byte[])localObject);
        }
      }
    }
  }
}
