package org.apache.http.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class VersionInfo
{
  public static final String PROPERTY_MODULE = "info.module";
  public static final String PROPERTY_RELEASE = "info.release";
  public static final String PROPERTY_TIMESTAMP = "info.timestamp";
  public static final String UNAVAILABLE = "UNAVAILABLE";
  public static final String VERSION_PROPERTY_FILE = "version.properties";
  private final String infoClassloader;
  private final String infoModule;
  private final String infoPackage;
  private final String infoRelease;
  private final String infoTimestamp;
  
  protected VersionInfo(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5)
  {
    Args.notNull(paramString1, "Package identifier");
    infoPackage = paramString1;
    if (paramString2 != null)
    {
      infoModule = paramString2;
      if (paramString3 == null) {
        break label63;
      }
      label29:
      infoRelease = paramString3;
      if (paramString4 == null) {
        break label69;
      }
      label39:
      infoTimestamp = paramString4;
      if (paramString5 == null) {
        break label76;
      }
    }
    for (;;)
    {
      infoClassloader = paramString5;
      return;
      paramString2 = "UNAVAILABLE";
      break;
      label63:
      paramString3 = "UNAVAILABLE";
      break label29;
      label69:
      paramString4 = "UNAVAILABLE";
      break label39;
      label76:
      paramString5 = "UNAVAILABLE";
    }
  }
  
  protected static VersionInfo fromMap(String paramString, Map<?, ?> paramMap, ClassLoader paramClassLoader)
  {
    Args.notNull(paramString, "Package identifier");
    Object localObject4 = null;
    Object localObject5 = null;
    Object localObject2 = null;
    if (paramMap != null)
    {
      localObject2 = (String)paramMap.get("info.module");
      Object localObject1 = localObject2;
      if (localObject2 != null)
      {
        localObject1 = localObject2;
        if (((String)localObject2).length() < 1) {
          localObject1 = null;
        }
      }
      localObject2 = (String)paramMap.get("info.release");
      Object localObject3 = localObject2;
      if (localObject2 != null) {
        if (((String)localObject2).length() >= 1)
        {
          localObject3 = localObject2;
          if (!((String)localObject2).equals("${pom.version}")) {}
        }
        else
        {
          localObject3 = null;
        }
      }
      paramMap = (String)paramMap.get("info.timestamp");
      localObject4 = localObject1;
      localObject5 = localObject3;
      localObject2 = paramMap;
      if (paramMap != null) {
        if (paramMap.length() >= 1)
        {
          localObject4 = localObject1;
          localObject5 = localObject3;
          localObject2 = paramMap;
          if (!paramMap.equals("${mvn.timestamp}")) {}
        }
        else
        {
          localObject2 = null;
          localObject5 = localObject3;
          localObject4 = localObject1;
        }
      }
    }
    paramMap = null;
    if (paramClassLoader != null) {
      paramMap = paramClassLoader.toString();
    }
    return new VersionInfo(paramString, localObject4, localObject5, (String)localObject2, paramMap);
  }
  
  public static String getUserAgent(String paramString1, String paramString2, Class<?> paramClass)
  {
    paramString2 = loadVersionInfo(paramString2, paramClass.getClassLoader());
    if (paramString2 != null) {}
    for (paramString2 = paramString2.getRelease();; paramString2 = "UNAVAILABLE")
    {
      paramClass = System.getProperty("java.version");
      return paramString1 + "/" + paramString2 + " (Java 1.5 minimum; Java/" + paramClass + ")";
    }
  }
  
  /* Error */
  public static VersionInfo loadVersionInfo(String paramString, ClassLoader paramClassLoader)
  {
    // Byte code:
    //   0: aload_0
    //   1: ldc 31
    //   3: invokestatic 37	org/apache/http/util/Args:notNull	(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    //   6: pop
    //   7: aload_1
    //   8: ifnull +97 -> 105
    //   11: aload_1
    //   12: astore_3
    //   13: aconst_null
    //   14: astore_2
    //   15: aconst_null
    //   16: astore 4
    //   18: aload_2
    //   19: astore_1
    //   20: aload_3
    //   21: new 103	java/lang/StringBuilder
    //   24: dup
    //   25: invokespecial 104	java/lang/StringBuilder:<init>	()V
    //   28: aload_0
    //   29: bipush 46
    //   31: bipush 47
    //   33: invokevirtual 122	java/lang/String:replace	(CC)Ljava/lang/String;
    //   36: invokevirtual 108	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   39: ldc 110
    //   41: invokevirtual 108	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   44: ldc 19
    //   46: invokevirtual 108	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   49: invokevirtual 115	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   52: invokevirtual 128	java/lang/ClassLoader:getResourceAsStream	(Ljava/lang/String;)Ljava/io/InputStream;
    //   55: astore 5
    //   57: aload 4
    //   59: astore_1
    //   60: aload 5
    //   62: ifnull +28 -> 90
    //   65: new 130	java/util/Properties
    //   68: dup
    //   69: invokespecial 131	java/util/Properties:<init>	()V
    //   72: astore_1
    //   73: aload_1
    //   74: aload 5
    //   76: invokevirtual 135	java/util/Properties:load	(Ljava/io/InputStream;)V
    //   79: aload_1
    //   80: astore_2
    //   81: aload_2
    //   82: astore_1
    //   83: aload 5
    //   85: invokevirtual 140	java/io/InputStream:close	()V
    //   88: aload_2
    //   89: astore_1
    //   90: aconst_null
    //   91: astore_2
    //   92: aload_1
    //   93: ifnull +10 -> 103
    //   96: aload_0
    //   97: aload_1
    //   98: aload_3
    //   99: invokestatic 142	org/apache/http/util/VersionInfo:fromMap	(Ljava/lang/String;Ljava/util/Map;Ljava/lang/ClassLoader;)Lorg/apache/http/util/VersionInfo;
    //   102: astore_2
    //   103: aload_2
    //   104: areturn
    //   105: invokestatic 148	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   108: invokevirtual 151	java/lang/Thread:getContextClassLoader	()Ljava/lang/ClassLoader;
    //   111: astore_3
    //   112: goto -99 -> 13
    //   115: astore 4
    //   117: aload_2
    //   118: astore_1
    //   119: aload 5
    //   121: invokevirtual 140	java/io/InputStream:close	()V
    //   124: aload_2
    //   125: astore_1
    //   126: aload 4
    //   128: athrow
    //   129: astore_2
    //   130: goto -40 -> 90
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	133	0	paramString	String
    //   0	133	1	paramClassLoader	ClassLoader
    //   14	111	2	localObject1	Object
    //   129	1	2	localIOException	java.io.IOException
    //   12	100	3	localClassLoader	ClassLoader
    //   16	42	4	localObject2	Object
    //   115	12	4	localObject3	Object
    //   55	65	5	localInputStream	java.io.InputStream
    // Exception table:
    //   from	to	target	type
    //   65	79	115	finally
    //   20	57	129	java/io/IOException
    //   83	88	129	java/io/IOException
    //   119	124	129	java/io/IOException
    //   126	129	129	java/io/IOException
  }
  
  public static VersionInfo[] loadVersionInfo(String[] paramArrayOfString, ClassLoader paramClassLoader)
  {
    Args.notNull(paramArrayOfString, "Package identifier array");
    ArrayList localArrayList = new ArrayList(paramArrayOfString.length);
    int j = paramArrayOfString.length;
    int i = 0;
    while (i < j)
    {
      VersionInfo localVersionInfo = loadVersionInfo(paramArrayOfString[i], paramClassLoader);
      if (localVersionInfo != null) {
        localArrayList.add(localVersionInfo);
      }
      i += 1;
    }
    return (VersionInfo[])localArrayList.toArray(new VersionInfo[localArrayList.size()]);
  }
  
  public final String getClassloader()
  {
    return infoClassloader;
  }
  
  public final String getModule()
  {
    return infoModule;
  }
  
  public final String getPackage()
  {
    return infoPackage;
  }
  
  public final String getRelease()
  {
    return infoRelease;
  }
  
  public final String getTimestamp()
  {
    return infoTimestamp;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder(infoPackage.length() + 20 + infoModule.length() + infoRelease.length() + infoTimestamp.length() + infoClassloader.length());
    localStringBuilder.append("VersionInfo(").append(infoPackage).append(':').append(infoModule);
    if (!"UNAVAILABLE".equals(infoRelease)) {
      localStringBuilder.append(':').append(infoRelease);
    }
    if (!"UNAVAILABLE".equals(infoTimestamp)) {
      localStringBuilder.append(':').append(infoTimestamp);
    }
    localStringBuilder.append(')');
    if (!"UNAVAILABLE".equals(infoClassloader)) {
      localStringBuilder.append('@').append(infoClassloader);
    }
    return localStringBuilder.toString();
  }
}
