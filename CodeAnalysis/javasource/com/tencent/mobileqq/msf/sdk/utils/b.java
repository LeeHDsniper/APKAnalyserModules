package com.tencent.mobileqq.msf.sdk.utils;

import android.content.Context;
import com.tencent.mobileqq.msf.sdk.k;
import com.tencent.qphone.base.util.QLog;
import java.io.FileDescriptor;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.InetAddress;
import java.net.Socket;
import java.net.SocketAddress;
import java.net.SocketException;
import java.net.SocketImpl;
import java.net.SocketTimeoutException;
import java.util.concurrent.ConcurrentHashMap;

public class b
  extends SocketImpl
{
  public static String h = "notfound";
  public String a = "";
  public int b;
  public String c = "";
  public String d = "";
  MonitorSocketInputStream e;
  MonitorSocketOutputStream f;
  String g;
  ConcurrentHashMap i = new ConcurrentHashMap();
  ConcurrentHashMap j = new ConcurrentHashMap();
  public Context k;
  private SocketImpl l;
  private Class m;
  
  public b(Class paramClass, Context paramContext)
  {
    try
    {
      Constructor localConstructor = paramClass.getDeclaredConstructor(new Class[0]);
      localConstructor.setAccessible(true);
      l = ((SocketImpl)localConstructor.newInstance(new Object[0]));
      k = paramContext;
      m = paramClass;
      a();
    }
    catch (Exception paramContext)
    {
      for (;;)
      {
        try
        {
          a(paramClass, "wait", new Class[0]);
          return;
        }
        catch (Exception paramClass)
        {
          paramClass.printStackTrace();
        }
        paramContext = paramContext;
        paramContext.printStackTrace();
      }
    }
  }
  
  public static Method a(Class paramClass, String paramString, Class... paramVarArgs)
  {
    localObject = null;
    new StringBuilder();
    try
    {
      Method localMethod = paramClass.getDeclaredMethod(paramString, paramVarArgs);
      paramClass = localMethod;
    }
    catch (Exception localException)
    {
      Class localClass;
      do
      {
        localClass = paramClass.getSuperclass();
        paramClass = localObject;
      } while (localClass == null);
      return a(localClass, paramString, paramVarArgs);
    }
    return paramClass;
  }
  
  private void a()
  {
    try
    {
      Method localMethod = Socket.class.getClassLoader().loadClass("java.net.SocketImpl").getDeclaredMethod("getFileDescriptor", new Class[0]);
      localMethod.setAccessible(true);
      fd = ((FileDescriptor)localMethod.invoke(l, new Object[0]));
      c = (a + ":" + b + "_" + fd.hashCode() + " ");
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  private void b()
  {
    StringWriter localStringWriter = new StringWriter();
    PrintWriter localPrintWriter = new PrintWriter(localStringWriter);
    new Throwable("MonitorSocketDump").printStackTrace(localPrintWriter);
    d = (localStringWriter.toString() + "_");
    int i1 = d.lastIndexOf("com.tencent");
    int n = i1;
    if (i1 <= 0) {
      n = d.lastIndexOf("qq");
    }
    i1 = n;
    if (n <= 0) {
      i1 = d.lastIndexOf("qzone");
    }
    if (i1 > 0)
    {
      n = d.indexOf(")", i1);
      if ((n <= 0) || (n <= i1)) {
        break label218;
      }
    }
    label218:
    for (d = (d.substring(i1, n + 1) + "_"); fd != null; d = (d.substring(i1) + "_"))
    {
      c = (a + ":" + b + "_" + fd.hashCode() + " ");
      return;
    }
    c = (a + ":" + b + "_ ");
  }
  
  protected void accept(SocketImpl paramSocketImpl)
    throws IOException
  {}
  
  protected int available()
    throws IOException
  {
    try
    {
      Method localMethod = a(m, "available", new Class[0]);
      localMethod.setAccessible(true);
      int n = ((Integer)localMethod.invoke(l, new Object[0])).intValue();
      return n;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return 0;
  }
  
  protected void bind(InetAddress paramInetAddress, int paramInt)
    throws IOException
  {
    try
    {
      Method localMethod = a(m, "bind", new Class[] { InetAddress.class, Integer.TYPE });
      localMethod.setAccessible(true);
      localMethod.invoke(l, new Object[] { paramInetAddress, Integer.valueOf(paramInt) });
      return;
    }
    catch (Exception paramInetAddress)
    {
      paramInetAddress.printStackTrace();
    }
  }
  
  protected void close()
    throws IOException
  {
    try
    {
      if (!i.isEmpty())
      {
        localObject = (a)i.get(Integer.valueOf(c.hashCode()));
        h = d.substring(0, d.indexOf("_"));
        MonitorSocketStat.dataFlow.add(localObject);
        i.clear();
      }
      if (!j.isEmpty())
      {
        localObject = (a)j.get(Integer.valueOf(c.hashCode()));
        h = d.substring(0, d.indexOf("_"));
        MonitorSocketStat.dataFlow.add(localObject);
        j.clear();
      }
      Object localObject = a(m, "close", new Class[0]);
      ((Method)localObject).setAccessible(true);
      ((Method)localObject).invoke(l, new Object[0]);
      if (QLog.isColorLevel()) {
        QLog.d("MSF.D.MonitorSocket", 2, c + " close MonitorSocket succ.");
      }
      return;
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.D.MonitorSocket", 2, c + "close MonitorSocket failed.", localException);
      }
      throw new IOException(localException.toString());
    }
  }
  
  protected void connect(String paramString, int paramInt)
    throws IOException
  {
    a = paramString;
    b = paramInt;
    try
    {
      Method localMethod = a(m, "connect", new Class[] { String.class, Integer.TYPE });
      localMethod.setAccessible(true);
      localMethod.invoke(l, new Object[] { paramString, Integer.valueOf(paramInt) });
      a();
      b();
      if (QLog.isColorLevel()) {
        QLog.d("MSF.D.MonitorSocket", 2, c + "connect to host 1 " + paramString + " succ.");
      }
      return;
    }
    catch (Exception paramString)
    {
      if ((paramString instanceof InvocationTargetException)) {
        throw new IOException(((InvocationTargetException)paramString).getTargetException().toString());
      }
      throw new IOException(paramString.toString());
    }
  }
  
  protected void connect(InetAddress paramInetAddress, int paramInt)
    throws IOException
  {
    try
    {
      b = paramInt;
      Method localMethod = a(m, "connect", new Class[] { InetAddress.class, Integer.TYPE });
      localMethod.setAccessible(true);
      localMethod.invoke(l, new Object[] { paramInetAddress, Integer.valueOf(paramInt) });
      a();
      b();
      if (QLog.isColorLevel()) {
        QLog.d("MSF.D.MonitorSocket", 2, c + "connect to host 2 " + a + " succ.");
      }
      return;
    }
    catch (Exception paramInetAddress)
    {
      if ((paramInetAddress instanceof InvocationTargetException)) {
        throw new IOException(((InvocationTargetException)paramInetAddress).getTargetException().toString());
      }
      throw new IOException(paramInetAddress.toString());
    }
  }
  
  public void connect(SocketAddress paramSocketAddress, int paramInt)
    throws IOException
  {
    long l2 = 0L;
    long l1 = l2;
    try
    {
      Method localMethod = a(m, "connect", new Class[] { SocketAddress.class, Integer.TYPE });
      l1 = l2;
      localMethod.setAccessible(true);
      l1 = l2;
      l2 = System.currentTimeMillis();
      l1 = l2;
      localMethod.invoke(l, new Object[] { paramSocketAddress, Integer.valueOf(paramInt) });
      l1 = l2;
      a();
      l1 = l2;
      b();
      l1 = l2;
      if (QLog.isColorLevel())
      {
        l1 = l2;
        QLog.d("MSF.D.MonitorSocket", 1, c + "connect to host 3 " + a + " succ.");
      }
      return;
    }
    catch (Exception paramSocketAddress)
    {
      if (System.currentTimeMillis() - l1 >= paramInt) {
        throw new SocketTimeoutException("timeoutexception " + paramSocketAddress.toString());
      }
      if ((paramSocketAddress instanceof InvocationTargetException)) {
        throw new IOException(((InvocationTargetException)paramSocketAddress).getTargetException().toString());
      }
      throw new IOException(paramSocketAddress.toString());
    }
  }
  
  protected void create(boolean paramBoolean)
    throws IOException
  {
    try
    {
      Method localMethod = a(m, "create", new Class[] { Boolean.TYPE });
      localMethod.setAccessible(true);
      localMethod.invoke(l, new Object[] { Boolean.valueOf(paramBoolean) });
      return;
    }
    catch (Exception localException)
    {
      throw new IOException(localException.toString());
    }
  }
  
  protected InetAddress getInetAddress()
  {
    try
    {
      Object localObject = a(m, "getInetAddress", new Class[0]);
      ((Method)localObject).setAccessible(true);
      localObject = (InetAddress)((Method)localObject).invoke(l, new Object[0]);
      return localObject;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return null;
  }
  
  protected InputStream getInputStream()
    throws IOException
  {
    try
    {
      Object localObject = a(m, "getInputStream", new Class[0]);
      ((Method)localObject).setAccessible(true);
      localObject = new MonitorSocketInputStream((InputStream)((Method)localObject).invoke(l, new Object[0]), this, k);
      return localObject;
    }
    catch (Exception localException)
    {
      throw new IOException(localException.toString());
    }
  }
  
  public Object getOption(int paramInt)
    throws SocketException
  {
    return l.getOption(paramInt);
  }
  
  protected OutputStream getOutputStream()
    throws IOException
  {
    try
    {
      Object localObject = a(m, "getOutputStream", new Class[0]);
      ((Method)localObject).setAccessible(true);
      localObject = new MonitorSocketOutputStream((OutputStream)((Method)localObject).invoke(l, new Object[0]), this, k);
      f = ((MonitorSocketOutputStream)localObject);
      return localObject;
    }
    catch (Exception localException)
    {
      throw new IOException(localException.toString());
    }
  }
  
  protected int getPort()
  {
    try
    {
      Method localMethod = a(m, "getPort", new Class[0]);
      localMethod.setAccessible(true);
      int n = ((Integer)localMethod.invoke(l, new Object[0])).intValue();
      return n;
    }
    catch (Exception localException) {}
    return 0;
  }
  
  protected void listen(int paramInt)
    throws IOException
  {}
  
  protected void sendUrgentData(int paramInt)
    throws IOException
  {
    try
    {
      Method localMethod = a(m, "sendUrgentData", new Class[] { Integer.TYPE });
      localMethod.setAccessible(true);
      localMethod.invoke(l, new Object[] { Integer.valueOf(paramInt) });
      return;
    }
    catch (Exception localException)
    {
      throw new IOException(localException.toString());
    }
  }
  
  public void setOption(int paramInt, Object paramObject)
    throws SocketException
  {
    if (l != null) {
      l.setOption(paramInt, paramObject);
    }
  }
}
