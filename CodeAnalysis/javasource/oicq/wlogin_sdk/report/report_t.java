package oicq.wlogin_sdk.report;

import android.content.Context;
import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

public class report_t
  implements Serializable
{
  public static String FILE_NAME = "report_data";
  private static final long serialVersionUID = 1L;
  
  public report_t() {}
  
  public static void delete_file(Context paramContext)
  {
    try
    {
      paramContext.deleteFile(FILE_NAME);
      return;
    }
    finally
    {
      paramContext = finally;
      throw paramContext;
    }
  }
  
  /* Error */
  public static report_t1 read_fromfile(Context paramContext)
  {
    // Byte code:
    //   0: ldc 2
    //   2: monitorenter
    //   3: aload_0
    //   4: getstatic 18	oicq/wlogin_sdk/report/report_t:FILE_NAME	Ljava/lang/String;
    //   7: invokevirtual 38	android/content/Context:openFileInput	(Ljava/lang/String;)Ljava/io/FileInputStream;
    //   10: astore_1
    //   11: new 40	java/io/ObjectInputStream
    //   14: dup
    //   15: aload_1
    //   16: invokespecial 43	java/io/ObjectInputStream:<init>	(Ljava/io/InputStream;)V
    //   19: astore_2
    //   20: aload_2
    //   21: invokevirtual 47	java/io/ObjectInputStream:readObject	()Ljava/lang/Object;
    //   24: checkcast 49	oicq/wlogin_sdk/report/report_t1
    //   27: astore_0
    //   28: aload_2
    //   29: invokevirtual 52	java/io/ObjectInputStream:close	()V
    //   32: aload_1
    //   33: invokevirtual 55	java/io/FileInputStream:close	()V
    //   36: ldc 2
    //   38: monitorexit
    //   39: aload_0
    //   40: areturn
    //   41: astore_0
    //   42: ldc 2
    //   44: monitorexit
    //   45: aload_0
    //   46: athrow
    //   47: astore_0
    //   48: aconst_null
    //   49: astore_0
    //   50: goto -14 -> 36
    //   53: astore_1
    //   54: goto -18 -> 36
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	57	0	paramContext	Context
    //   10	23	1	localFileInputStream	java.io.FileInputStream
    //   53	1	1	localException	Exception
    //   19	10	2	localObjectInputStream	java.io.ObjectInputStream
    // Exception table:
    //   from	to	target	type
    //   3	28	41	finally
    //   28	36	41	finally
    //   3	28	47	java/lang/Exception
    //   28	36	53	java/lang/Exception
  }
  
  public static int write_tofile(report_t1 paramReport_t1, Context paramContext)
  {
    int i = 0;
    try
    {
      paramContext = paramContext.openFileOutput(FILE_NAME, 0);
      ObjectOutputStream localObjectOutputStream = new ObjectOutputStream(paramContext);
      localObjectOutputStream.writeObject(paramReport_t1);
      localObjectOutputStream.flush();
      localObjectOutputStream.close();
      paramContext.close();
      return i;
    }
    catch (Exception paramReport_t1)
    {
      for (;;)
      {
        paramReport_t1 = paramReport_t1;
        i = -1;
      }
    }
    finally
    {
      paramReport_t1 = finally;
      throw paramReport_t1;
    }
  }
}
