package com.squareup.okhttp.internal;

import com.squareup.okhttp.Protocol;
import java.io.IOException;
import java.io.PrintStream;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.net.ssl.SSLSocket;
import okio.Buffer;

public class Platform
{
  private static final Platform PLATFORM = ;
  
  public Platform() {}
  
  static byte[] concatLengthPrefixed(List<Protocol> paramList)
  {
    Buffer localBuffer = new Buffer();
    int i = 0;
    int j = paramList.size();
    if (i < j)
    {
      Protocol localProtocol = (Protocol)paramList.get(i);
      if (localProtocol == Protocol.HTTP_1_0) {}
      for (;;)
      {
        i += 1;
        break;
        localBuffer.writeByte(localProtocol.toString().length());
        localBuffer.writeUtf8(localProtocol.toString());
      }
    }
    return localBuffer.readByteArray();
  }
  
  private static Platform findPlatform()
  {
    try
    {
      localClass2 = Class.forName("com.android.org.conscrypt.OpenSSLSocketImpl");
      try
      {
        localMethod1 = localClass2.getMethod("setUseSessionTickets", new Class[] { Boolean.TYPE });
        localMethod2 = localClass2.getMethod("setHostname", new Class[] { String.class });
        localObject7 = null;
        localObject5 = null;
        localObject6 = null;
        localObject1 = localObject5;
        localObject4 = localObject7;
      }
      catch (ClassNotFoundException localClassNotFoundException4)
      {
        Method localMethod1;
        Method localMethod2;
        Object localObject7;
        Object localObject5;
        Object localObject6;
        Object localObject1;
        Object localObject4;
        Object localObject8;
        label111:
        for (;;) {}
      }
      try
      {
        localObject8 = Class.forName("android.net.TrafficStats");
        localObject1 = localObject5;
        localObject4 = localObject7;
        localObject5 = ((Class)localObject8).getMethod("tagSocket", new Class[] { Socket.class });
        localObject1 = localObject5;
        localObject4 = localObject5;
        localObject7 = ((Class)localObject8).getMethod("untagSocket", new Class[] { Socket.class });
        localObject6 = localObject7;
        localObject1 = localObject5;
      }
      catch (NoSuchMethodException localNoSuchMethodException3)
      {
        break label111;
      }
      catch (ClassNotFoundException localClassNotFoundException5)
      {
        Object localObject3 = localNoSuchMethodException3;
        break label111;
      }
      localObject4 = null;
      localObject7 = null;
      try
      {
        localObject5 = localClass2.getMethod("setNpnProtocols", new Class[] { [B.class });
        localObject4 = localObject5;
        localObject8 = localClass2.getMethod("getNpnSelectedProtocol", new Class[0]);
        localObject7 = localObject8;
        localObject4 = localObject5;
      }
      catch (NoSuchMethodException localNoSuchMethodException4)
      {
        Object localObject2;
        Class localClass1;
        for (;;) {}
      }
      return new Android(localClass2, localMethod1, localMethod2, localObject1, localObject6, (Method)localObject4, (Method)localObject7, null);
    }
    catch (ClassNotFoundException localClassNotFoundException1)
    {
      for (;;)
      {
        localClass2 = Class.forName("org.apache.harmony.xnet.provider.jsse.OpenSSLSocketImpl");
      }
    }
    catch (NoSuchMethodException localNoSuchMethodException1)
    {
      Class localClass2;
      localObject4 = "org.eclipse.jetty.alpn.ALPN";
      try
      {
        localObject2 = Class.forName("org.eclipse.jetty.alpn.ALPN");
        try
        {
          localObject5 = Class.forName((String)localObject4 + "$Provider");
          localClass2 = Class.forName((String)localObject4 + "$ClientProvider");
          localObject4 = Class.forName((String)localObject4 + "$ServerProvider");
          localObject2 = new JdkWithJettyBootPlatform(((Class)localObject2).getMethod("put", new Class[] { SSLSocket.class, localObject5 }), ((Class)localObject2).getMethod("get", new Class[] { SSLSocket.class }), localClass2, (Class)localObject4);
          return localObject2;
        }
        catch (ClassNotFoundException localClassNotFoundException2)
        {
          return new Platform();
        }
      }
      catch (ClassNotFoundException localClassNotFoundException3)
      {
        for (;;)
        {
          localObject4 = "org.eclipse.jetty.npn.NextProtoNego";
          localClass1 = Class.forName("org.eclipse.jetty.npn.NextProtoNego");
        }
      }
      catch (NoSuchMethodException localNoSuchMethodException2)
      {
        for (;;) {}
      }
    }
  }
  
  public static Platform get()
  {
    return PLATFORM;
  }
  
  public void configureTlsExtensions(SSLSocket paramSSLSocket, String paramString, List<Protocol> paramList) {}
  
  public void connectSocket(Socket paramSocket, InetSocketAddress paramInetSocketAddress, int paramInt)
    throws IOException
  {
    paramSocket.connect(paramInetSocketAddress, paramInt);
  }
  
  public String getPrefix()
  {
    return "OkHttp";
  }
  
  public String getSelectedProtocol(SSLSocket paramSSLSocket)
  {
    return null;
  }
  
  public void logW(String paramString)
  {
    System.out.println(paramString);
  }
  
  public void tagSocket(Socket paramSocket)
    throws SocketException
  {}
  
  public URI toUriLenient(URL paramURL)
    throws URISyntaxException
  {
    return paramURL.toURI();
  }
  
  public void untagSocket(Socket paramSocket)
    throws SocketException
  {}
  
  private static class Android
    extends Platform
  {
    private final Method getNpnSelectedProtocol;
    protected final Class<?> openSslSocketClass;
    private final Method setHostname;
    private final Method setNpnProtocols;
    private final Method setUseSessionTickets;
    private final Method trafficStatsTagSocket;
    private final Method trafficStatsUntagSocket;
    
    private Android(Class<?> paramClass, Method paramMethod1, Method paramMethod2, Method paramMethod3, Method paramMethod4, Method paramMethod5, Method paramMethod6)
    {
      openSslSocketClass = paramClass;
      setUseSessionTickets = paramMethod1;
      setHostname = paramMethod2;
      trafficStatsTagSocket = paramMethod3;
      trafficStatsUntagSocket = paramMethod4;
      setNpnProtocols = paramMethod5;
      getNpnSelectedProtocol = paramMethod6;
    }
    
    /* Error */
    public void configureTlsExtensions(SSLSocket paramSSLSocket, String paramString, List<Protocol> paramList)
    {
      // Byte code:
      //   0: aload_0
      //   1: getfield 22	com/squareup/okhttp/internal/Platform$Android:openSslSocketClass	Ljava/lang/Class;
      //   4: aload_1
      //   5: invokevirtual 52	java/lang/Class:isInstance	(Ljava/lang/Object;)Z
      //   8: ifne +4 -> 12
      //   11: return
      //   12: aload_2
      //   13: ifnull +40 -> 53
      //   16: aload_0
      //   17: getfield 24	com/squareup/okhttp/internal/Platform$Android:setUseSessionTickets	Ljava/lang/reflect/Method;
      //   20: aload_1
      //   21: iconst_1
      //   22: anewarray 54	java/lang/Object
      //   25: dup
      //   26: iconst_0
      //   27: iconst_1
      //   28: invokestatic 60	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
      //   31: aastore
      //   32: invokevirtual 66	java/lang/reflect/Method:invoke	(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
      //   35: pop
      //   36: aload_0
      //   37: getfield 26	com/squareup/okhttp/internal/Platform$Android:setHostname	Ljava/lang/reflect/Method;
      //   40: aload_1
      //   41: iconst_1
      //   42: anewarray 54	java/lang/Object
      //   45: dup
      //   46: iconst_0
      //   47: aload_2
      //   48: aastore
      //   49: invokevirtual 66	java/lang/reflect/Method:invoke	(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
      //   52: pop
      //   53: aload_0
      //   54: getfield 32	com/squareup/okhttp/internal/Platform$Android:setNpnProtocols	Ljava/lang/reflect/Method;
      //   57: ifnull -46 -> 11
      //   60: aload_3
      //   61: invokestatic 70	com/squareup/okhttp/internal/Platform$Android:concatLengthPrefixed	(Ljava/util/List;)[B
      //   64: astore_2
      //   65: aload_0
      //   66: getfield 32	com/squareup/okhttp/internal/Platform$Android:setNpnProtocols	Ljava/lang/reflect/Method;
      //   69: aload_1
      //   70: iconst_1
      //   71: anewarray 54	java/lang/Object
      //   74: dup
      //   75: iconst_0
      //   76: aload_2
      //   77: aastore
      //   78: invokevirtual 66	java/lang/reflect/Method:invoke	(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
      //   81: pop
      //   82: return
      //   83: astore_1
      //   84: new 72	java/lang/AssertionError
      //   87: dup
      //   88: aload_1
      //   89: invokespecial 75	java/lang/AssertionError:<init>	(Ljava/lang/Object;)V
      //   92: athrow
      //   93: astore_1
      //   94: new 77	java/lang/RuntimeException
      //   97: dup
      //   98: aload_1
      //   99: invokevirtual 81	java/lang/reflect/InvocationTargetException:getCause	()Ljava/lang/Throwable;
      //   102: invokespecial 84	java/lang/RuntimeException:<init>	(Ljava/lang/Throwable;)V
      //   105: athrow
      //   106: astore_1
      //   107: new 72	java/lang/AssertionError
      //   110: dup
      //   111: aload_1
      //   112: invokespecial 75	java/lang/AssertionError:<init>	(Ljava/lang/Object;)V
      //   115: athrow
      //   116: astore_1
      //   117: new 77	java/lang/RuntimeException
      //   120: dup
      //   121: aload_1
      //   122: invokevirtual 81	java/lang/reflect/InvocationTargetException:getCause	()Ljava/lang/Throwable;
      //   125: invokespecial 84	java/lang/RuntimeException:<init>	(Ljava/lang/Throwable;)V
      //   128: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	129	0	this	Android
      //   0	129	1	paramSSLSocket	SSLSocket
      //   0	129	2	paramString	String
      //   0	129	3	paramList	List<Protocol>
      // Exception table:
      //   from	to	target	type
      //   60	82	83	java/lang/IllegalAccessException
      //   16	53	93	java/lang/reflect/InvocationTargetException
      //   16	53	106	java/lang/IllegalAccessException
      //   60	82	116	java/lang/reflect/InvocationTargetException
    }
    
    public void connectSocket(Socket paramSocket, InetSocketAddress paramInetSocketAddress, int paramInt)
      throws IOException
    {
      try
      {
        paramSocket.connect(paramInetSocketAddress, paramInt);
        return;
      }
      catch (SecurityException paramSocket)
      {
        paramInetSocketAddress = new IOException("Exception in connect");
        paramInetSocketAddress.initCause(paramSocket);
        throw paramInetSocketAddress;
      }
    }
    
    public String getSelectedProtocol(SSLSocket paramSSLSocket)
    {
      if (getNpnSelectedProtocol == null) {
        return null;
      }
      if (!openSslSocketClass.isInstance(paramSSLSocket)) {
        return null;
      }
      try
      {
        paramSSLSocket = (byte[])getNpnSelectedProtocol.invoke(paramSSLSocket, new Object[0]);
        if (paramSSLSocket == null) {
          return null;
        }
        paramSSLSocket = new String(paramSSLSocket, Util.UTF_8);
        return paramSSLSocket;
      }
      catch (InvocationTargetException paramSSLSocket)
      {
        throw new RuntimeException(paramSSLSocket.getCause());
      }
      catch (IllegalAccessException paramSSLSocket)
      {
        throw new AssertionError(paramSSLSocket);
      }
    }
    
    public void tagSocket(Socket paramSocket)
      throws SocketException
    {
      if (trafficStatsTagSocket == null) {
        return;
      }
      try
      {
        trafficStatsTagSocket.invoke(null, new Object[] { paramSocket });
        return;
      }
      catch (IllegalAccessException paramSocket)
      {
        throw new RuntimeException(paramSocket);
      }
      catch (InvocationTargetException paramSocket)
      {
        throw new RuntimeException(paramSocket.getCause());
      }
    }
    
    public void untagSocket(Socket paramSocket)
      throws SocketException
    {
      if (trafficStatsUntagSocket == null) {
        return;
      }
      try
      {
        trafficStatsUntagSocket.invoke(null, new Object[] { paramSocket });
        return;
      }
      catch (IllegalAccessException paramSocket)
      {
        throw new RuntimeException(paramSocket);
      }
      catch (InvocationTargetException paramSocket)
      {
        throw new RuntimeException(paramSocket.getCause());
      }
    }
  }
  
  private static class JdkWithJettyBootPlatform
    extends Platform
  {
    private final Class<?> clientProviderClass;
    private final Method getMethod;
    private final Method putMethod;
    private final Class<?> serverProviderClass;
    
    public JdkWithJettyBootPlatform(Method paramMethod1, Method paramMethod2, Class<?> paramClass1, Class<?> paramClass2)
    {
      putMethod = paramMethod1;
      getMethod = paramMethod2;
      clientProviderClass = paramClass1;
      serverProviderClass = paramClass2;
    }
    
    public void configureTlsExtensions(SSLSocket paramSSLSocket, String paramString, List<Protocol> paramList)
    {
      paramString = new ArrayList(paramList.size());
      int i = 0;
      int j = paramList.size();
      Object localObject;
      if (i < j)
      {
        localObject = (Protocol)paramList.get(i);
        if (localObject == Protocol.HTTP_1_0) {}
        for (;;)
        {
          i += 1;
          break;
          paramString.add(((Protocol)localObject).toString());
        }
      }
      try
      {
        paramList = Platform.class.getClassLoader();
        localObject = clientProviderClass;
        Class localClass = serverProviderClass;
        paramString = new Platform.JettyNegoProvider(paramString);
        paramString = Proxy.newProxyInstance(paramList, new Class[] { localObject, localClass }, paramString);
        putMethod.invoke(null, new Object[] { paramSSLSocket, paramString });
        return;
      }
      catch (InvocationTargetException paramSSLSocket)
      {
        throw new AssertionError(paramSSLSocket);
      }
      catch (IllegalAccessException paramSSLSocket)
      {
        throw new AssertionError(paramSSLSocket);
      }
    }
    
    public String getSelectedProtocol(SSLSocket paramSSLSocket)
    {
      try
      {
        paramSSLSocket = (Platform.JettyNegoProvider)Proxy.getInvocationHandler(getMethod.invoke(null, new Object[] { paramSSLSocket }));
        if ((!Platform.JettyNegoProvider.access$100(paramSSLSocket)) && (Platform.JettyNegoProvider.access$200(paramSSLSocket) == null))
        {
          Internal.logger.log(Level.INFO, "NPN/ALPN callback dropped: SPDY and HTTP/2 are disabled. Is npn-boot or alpn-boot on the boot class path?");
          return null;
        }
        if (!Platform.JettyNegoProvider.access$100(paramSSLSocket))
        {
          paramSSLSocket = Platform.JettyNegoProvider.access$200(paramSSLSocket);
          return paramSSLSocket;
        }
      }
      catch (InvocationTargetException paramSSLSocket)
      {
        throw new AssertionError();
      }
      catch (IllegalAccessException paramSSLSocket)
      {
        throw new AssertionError();
      }
      return null;
    }
  }
  
  private static class JettyNegoProvider
    implements InvocationHandler
  {
    private final List<String> protocols;
    private String selected;
    private boolean unsupported;
    
    public JettyNegoProvider(List<String> paramList)
    {
      protocols = paramList;
    }
    
    public Object invoke(Object paramObject, Method paramMethod, Object[] paramArrayOfObject)
      throws Throwable
    {
      String str = paramMethod.getName();
      Class localClass = paramMethod.getReturnType();
      paramObject = paramArrayOfObject;
      if (paramArrayOfObject == null) {
        paramObject = Util.EMPTY_STRING_ARRAY;
      }
      if ((str.equals("supports")) && (Boolean.TYPE == localClass)) {
        return Boolean.valueOf(true);
      }
      if ((str.equals("unsupported")) && (Void.TYPE == localClass))
      {
        unsupported = true;
        return null;
      }
      if ((str.equals("protocols")) && (paramObject.length == 0)) {
        return protocols;
      }
      if (((str.equals("selectProtocol")) || (str.equals("select"))) && (String.class == localClass) && (paramObject.length == 1) && ((paramObject[0] instanceof List)))
      {
        paramObject = (List)paramObject[0];
        int i = 0;
        int j = paramObject.size();
        while (i < j)
        {
          if (protocols.contains(paramObject.get(i)))
          {
            paramObject = (String)paramObject.get(i);
            selected = paramObject;
            return paramObject;
          }
          i += 1;
        }
        paramObject = (String)protocols.get(0);
        selected = paramObject;
        return paramObject;
      }
      if (((str.equals("protocolSelected")) || (str.equals("selected"))) && (paramObject.length == 1))
      {
        selected = ((String)paramObject[0]);
        return null;
      }
      return paramMethod.invoke(this, paramObject);
    }
  }
}
