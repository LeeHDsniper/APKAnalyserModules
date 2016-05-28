package com.adobe.creativesdk.aviary.internal.utils;

import android.os.Looper;
import android.util.Log;
import java.util.HashMap;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public final class SystemUtils
{
  private static void parseLine(String paramString, HashMap<String, String> paramHashMap)
  {
    paramString = new StringTokenizer(paramString, ":");
    while (paramString.hasMoreTokens())
    {
      String str = paramString.nextToken().trim();
      if (paramString.hasMoreTokens()) {
        paramHashMap.put(str, paramString.nextToken().trim());
      }
    }
  }
  
  /* Error */
  private static void readValues(HashMap<String, String> paramHashMap, String paramString)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 4
    //   3: aconst_null
    //   4: astore_3
    //   5: aload 4
    //   7: astore_2
    //   8: ldc 51
    //   10: new 53	java/lang/StringBuilder
    //   13: dup
    //   14: invokespecial 56	java/lang/StringBuilder:<init>	()V
    //   17: ldc 58
    //   19: invokevirtual 62	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   22: aload_1
    //   23: invokevirtual 62	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   26: invokevirtual 65	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   29: invokestatic 71	android/util/Log:i	(Ljava/lang/String;Ljava/lang/String;)I
    //   32: pop
    //   33: aload 4
    //   35: astore_2
    //   36: new 73	java/io/BufferedReader
    //   39: dup
    //   40: new 75	java/io/FileReader
    //   43: dup
    //   44: new 77	java/io/File
    //   47: dup
    //   48: aload_1
    //   49: invokespecial 80	java/io/File:<init>	(Ljava/lang/String;)V
    //   52: invokespecial 83	java/io/FileReader:<init>	(Ljava/io/File;)V
    //   55: invokespecial 86	java/io/BufferedReader:<init>	(Ljava/io/Reader;)V
    //   58: astore_1
    //   59: aload_1
    //   60: invokevirtual 89	java/io/BufferedReader:readLine	()Ljava/lang/String;
    //   63: astore_2
    //   64: aload_2
    //   65: ifnull +27 -> 92
    //   68: aload_2
    //   69: aload_0
    //   70: invokestatic 91	com/adobe/creativesdk/aviary/internal/utils/SystemUtils:parseLine	(Ljava/lang/String;Ljava/util/HashMap;)V
    //   73: goto -14 -> 59
    //   76: astore_2
    //   77: aload_1
    //   78: astore_0
    //   79: aload_2
    //   80: astore_1
    //   81: aload_0
    //   82: astore_2
    //   83: aload_1
    //   84: invokevirtual 94	java/io/IOException:printStackTrace	()V
    //   87: aload_0
    //   88: invokestatic 100	com/adobe/creativesdk/aviary/internal/utils/IOUtils:closeSilently	(Ljava/io/Closeable;)V
    //   91: return
    //   92: aload_1
    //   93: invokestatic 100	com/adobe/creativesdk/aviary/internal/utils/IOUtils:closeSilently	(Ljava/io/Closeable;)V
    //   96: return
    //   97: astore_0
    //   98: aload_2
    //   99: invokestatic 100	com/adobe/creativesdk/aviary/internal/utils/IOUtils:closeSilently	(Ljava/io/Closeable;)V
    //   102: aload_0
    //   103: athrow
    //   104: astore_0
    //   105: aload_1
    //   106: astore_2
    //   107: goto -9 -> 98
    //   110: astore_1
    //   111: aload_3
    //   112: astore_0
    //   113: goto -32 -> 81
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	116	0	paramHashMap	HashMap<String, String>
    //   0	116	1	paramString	String
    //   7	62	2	localObject1	Object
    //   76	4	2	localIOException	java.io.IOException
    //   82	25	2	localObject2	Object
    //   4	108	3	localObject3	Object
    //   1	33	4	localObject4	Object
    // Exception table:
    //   from	to	target	type
    //   59	64	76	java/io/IOException
    //   68	73	76	java/io/IOException
    //   8	33	97	finally
    //   36	59	97	finally
    //   83	87	97	finally
    //   59	64	104	finally
    //   68	73	104	finally
    //   8	33	110	java/io/IOException
    //   36	59	110	java/io/IOException
  }
  
  public static void throwIfNonUiThread()
  {
    if (Looper.getMainLooper() != Looper.myLooper()) {
      throw new IllegalThreadStateException("Current thread is not the mainThread");
    }
  }
  
  public static void throwIfUiThread()
  {
    if (Looper.getMainLooper() == Looper.myLooper()) {
      throw new IllegalThreadStateException("Current thread is the mainThread");
    }
  }
  
  public static void trySleep(long paramLong)
  {
    try
    {
      Thread.sleep(paramLong);
      return;
    }
    catch (InterruptedException localInterruptedException) {}
  }
  
  public static class CpuInfo
  {
    private static int mCpuKiloHz = 0;
    
    /* Error */
    public static int getCpuFrequencyMax()
      throws Exception
    {
      // Byte code:
      //   0: getstatic 13	com/adobe/creativesdk/aviary/internal/utils/SystemUtils$CpuInfo:mCpuKiloHz	I
      //   3: ifne +35 -> 38
      //   6: aconst_null
      //   7: astore_3
      //   8: aconst_null
      //   9: astore_0
      //   10: aconst_null
      //   11: astore_2
      //   12: new 24	java/io/RandomAccessFile
      //   15: dup
      //   16: ldc 26
      //   18: ldc 28
      //   20: invokespecial 32	java/io/RandomAccessFile:<init>	(Ljava/lang/String;Ljava/lang/String;)V
      //   23: astore_1
      //   24: aload_1
      //   25: invokevirtual 36	java/io/RandomAccessFile:readLine	()Ljava/lang/String;
      //   28: invokestatic 42	java/lang/Integer:parseInt	(Ljava/lang/String;)I
      //   31: putstatic 13	com/adobe/creativesdk/aviary/internal/utils/SystemUtils$CpuInfo:mCpuKiloHz	I
      //   34: aload_1
      //   35: invokestatic 48	com/adobe/creativesdk/aviary/internal/utils/IOUtils:closeSilently	(Ljava/io/Closeable;)V
      //   38: getstatic 13	com/adobe/creativesdk/aviary/internal/utils/SystemUtils$CpuInfo:mCpuKiloHz	I
      //   41: ireturn
      //   42: astore_0
      //   43: aload_2
      //   44: astore_1
      //   45: aload_0
      //   46: astore_2
      //   47: aload_1
      //   48: astore_0
      //   49: aload_2
      //   50: invokevirtual 51	java/io/IOException:printStackTrace	()V
      //   53: aload_1
      //   54: invokestatic 48	com/adobe/creativesdk/aviary/internal/utils/IOUtils:closeSilently	(Ljava/io/Closeable;)V
      //   57: goto -19 -> 38
      //   60: astore_2
      //   61: aload_3
      //   62: astore_1
      //   63: aload_1
      //   64: astore_0
      //   65: aload_2
      //   66: invokevirtual 52	java/lang/NumberFormatException:printStackTrace	()V
      //   69: aload_1
      //   70: invokestatic 48	com/adobe/creativesdk/aviary/internal/utils/IOUtils:closeSilently	(Ljava/io/Closeable;)V
      //   73: goto -35 -> 38
      //   76: astore_1
      //   77: aload_0
      //   78: invokestatic 48	com/adobe/creativesdk/aviary/internal/utils/IOUtils:closeSilently	(Ljava/io/Closeable;)V
      //   81: aload_1
      //   82: athrow
      //   83: astore_2
      //   84: aload_1
      //   85: astore_0
      //   86: aload_2
      //   87: astore_1
      //   88: goto -11 -> 77
      //   91: astore_2
      //   92: goto -29 -> 63
      //   95: astore_2
      //   96: goto -49 -> 47
      // Local variable table:
      //   start	length	slot	name	signature
      //   9	1	0	localObject1	Object
      //   42	4	0	localIOException1	java.io.IOException
      //   48	38	0	localObject2	Object
      //   23	47	1	localObject3	Object
      //   76	9	1	localObject4	Object
      //   87	1	1	localObject5	Object
      //   11	39	2	localIOException2	java.io.IOException
      //   60	6	2	localNumberFormatException1	NumberFormatException
      //   83	4	2	localObject6	Object
      //   91	1	2	localNumberFormatException2	NumberFormatException
      //   95	1	2	localIOException3	java.io.IOException
      //   7	55	3	localObject7	Object
      // Exception table:
      //   from	to	target	type
      //   12	24	42	java/io/IOException
      //   12	24	60	java/lang/NumberFormatException
      //   12	24	76	finally
      //   49	53	76	finally
      //   65	69	76	finally
      //   24	34	83	finally
      //   24	34	91	java/lang/NumberFormatException
      //   24	34	95	java/io/IOException
    }
    
    public static int getCpuMhz()
    {
      int i = 0;
      try
      {
        int j = getCpuFrequencyMax();
        if (j > 0) {
          i = j / 1000;
        }
        return i;
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
      }
      return 0;
    }
  }
  
  public static final class MemoryInfo
  {
    private static final Pattern PROCFS_MEMFILE_FORMAT = Pattern.compile("^*([0-9]*)[ \t]kB");
    private static HashMap<String, String> mValues;
    private static double sRuntimeTotalMemory = -1.0D;
    private static double sSystemTotalMemory = -1.0D;
    
    private static double getMemoryValue(String paramString)
    {
      if (mValues == null) {
        init();
      }
      if (mValues.containsKey(paramString))
      {
        paramString = (String)mValues.get(paramString);
        paramString = PROCFS_MEMFILE_FORMAT.matcher(paramString);
        if (paramString.find()) {
          return Long.parseLong(paramString.group(1)) / 1024L;
        }
      }
      return -1.0D;
    }
    
    public static void getRuntimeMemory(double[] paramArrayOfDouble)
    {
      double d1 = Double.valueOf(Runtime.getRuntime().totalMemory()).doubleValue() / 1048576.0D;
      double d2 = Double.valueOf(Runtime.getRuntime().maxMemory()).doubleValue() / 1048576.0D;
      paramArrayOfDouble[0] = (d2 - d1);
      paramArrayOfDouble[1] = d1;
      paramArrayOfDouble[2] = d2;
    }
    
    public static double getRuntimeTotalMemory()
    {
      if (sRuntimeTotalMemory < 0.0D)
      {
        double[] arrayOfDouble = new double[3];
        getRuntimeMemory(arrayOfDouble);
        sRuntimeTotalMemory = arrayOfDouble[2];
      }
      Log.v("SystemUtils", "sRuntimeTotalMemory: " + sRuntimeTotalMemory);
      return sRuntimeTotalMemory;
    }
    
    public static double getSystemTotalMemory()
    {
      if (sSystemTotalMemory < 0.0D) {
        sSystemTotalMemory = getMemoryValue("MemTotal");
      }
      return sSystemTotalMemory;
    }
    
    private static void init()
    {
      mValues = new HashMap();
      SystemUtils.readValues(mValues, "/proc/meminfo");
    }
  }
}
