package com.tencent.mobileqq.startup.step;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Build.VERSION;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.DeviceProfileManager;
import com.tencent.mobileqq.statistics.StatisticCollector;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import rdr;

public class InitHook
  extends Step
{
  private static final int jdField_a_of_type_Int = 90001;
  private static boolean jdField_a_of_type_Boolean = false;
  private static final int b = 90002;
  private static final int c = 90003;
  
  static
  {
    a = false;
  }
  
  public InitHook() {}
  
  private static void a(boolean paramBoolean, Throwable paramThrowable, int paramInt)
  {
    Object localObject1 = BaseApplicationImpl.a.getSharedPreferences("mobileQQ", 0);
    Object localObject2 = ((SharedPreferences)localObject1).getString("reportJavaHook", "");
    Object localObject3 = new Date();
    localObject3 = new SimpleDateFormat("yyyyMMdd").format((Date)localObject3);
    if (((String)localObject3).equals(localObject2)) {
      return;
    }
    localObject1 = ((SharedPreferences)localObject1).edit();
    ((SharedPreferences.Editor)localObject1).putString("reportJavaHook", (String)localObject3);
    if (Build.VERSION.SDK_INT > 8) {
      ((SharedPreferences.Editor)localObject1).apply();
    }
    while (paramBoolean)
    {
      StatisticCollector.a(BaseApplicationImpl.a()).a(null, "JavaHookSdkLoadSo", paramBoolean, 0L, 0L, null, "", true);
      return;
      ((SharedPreferences.Editor)localObject1).commit();
    }
    localObject1 = new HashMap();
    if (paramThrowable != null)
    {
      localObject2 = new StringWriter();
      paramThrowable.printStackTrace(new PrintWriter((Writer)localObject2));
      ((HashMap)localObject1).put("detail", localObject2.toString());
    }
    ((HashMap)localObject1).put("param_FailCode", Integer.toString(paramInt));
    StatisticCollector.a(BaseApplicationImpl.a()).a(null, "JavaHookSdkLoadSo", paramBoolean, 0L, 0L, (HashMap)localObject1, "", true);
  }
  
  /* Error */
  private static void b()
  {
    // Byte code:
    //   0: ldc 2
    //   2: monitorenter
    //   3: getstatic 17	com/tencent/mobileqq/startup/step/InitHook:a	Z
    //   6: istore_0
    //   7: iload_0
    //   8: ifeq +7 -> 15
    //   11: ldc 2
    //   13: monitorexit
    //   14: return
    //   15: iconst_1
    //   16: putstatic 17	com/tencent/mobileqq/startup/step/InitHook:a	Z
    //   19: ldc -114
    //   21: invokestatic 147	com/tencent/mobileqq/app/DeviceProfileManager:b	()Lcom/tencent/mobileqq/app/DeviceProfileManager;
    //   24: getstatic 153	com/tencent/mobileqq/app/DeviceProfileManager$DpcNames:hook_switch	Lcom/tencent/mobileqq/app/DeviceProfileManager$DpcNames;
    //   27: invokevirtual 156	com/tencent/mobileqq/app/DeviceProfileManager$DpcNames:name	()Ljava/lang/String;
    //   30: ldc -98
    //   32: invokevirtual 160	com/tencent/mobileqq/app/DeviceProfileManager:a	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   35: invokevirtual 65	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   38: ifne +30 -> 68
    //   41: iconst_0
    //   42: aconst_null
    //   43: ldc 11
    //   45: invokestatic 162	com/tencent/mobileqq/startup/step/InitHook:a	(ZLjava/lang/Throwable;I)V
    //   48: goto -37 -> 11
    //   51: astore_1
    //   52: iconst_0
    //   53: aload_1
    //   54: ldc 7
    //   56: invokestatic 162	com/tencent/mobileqq/startup/step/InitHook:a	(ZLjava/lang/Throwable;I)V
    //   59: goto -48 -> 11
    //   62: astore_1
    //   63: ldc 2
    //   65: monitorexit
    //   66: aload_1
    //   67: athrow
    //   68: invokestatic 167	com/tencent/mobileqq/javahooksdk/JavaHookBridge:isSdkAvailable	()Z
    //   71: ifne +24 -> 95
    //   74: iconst_0
    //   75: aconst_null
    //   76: ldc 13
    //   78: invokestatic 162	com/tencent/mobileqq/startup/step/InitHook:a	(ZLjava/lang/Throwable;I)V
    //   81: goto -70 -> 11
    //   84: astore_1
    //   85: iconst_0
    //   86: aload_1
    //   87: ldc 7
    //   89: invokestatic 162	com/tencent/mobileqq/startup/step/InitHook:a	(ZLjava/lang/Throwable;I)V
    //   92: goto -81 -> 11
    //   95: invokestatic 171	com/tencent/mobileqq/javahook/BitmapOOMHooker:a	()V
    //   98: invokestatic 174	com/tencent/mobileqq/javahook/BadTokenHooker:a	()V
    //   101: getstatic 177	com/tencent/common/app/BaseApplicationImpl:i	I
    //   104: iconst_1
    //   105: if_icmpne +3 -> 108
    //   108: iconst_1
    //   109: aconst_null
    //   110: iconst_0
    //   111: invokestatic 162	com/tencent/mobileqq/startup/step/InitHook:a	(ZLjava/lang/Throwable;I)V
    //   114: goto -103 -> 11
    // Local variable table:
    //   start	length	slot	name	signature
    //   6	2	0	bool	boolean
    //   51	3	1	localException	Exception
    //   62	5	1	localObject	Object
    //   84	3	1	localError	Error
    // Exception table:
    //   from	to	target	type
    //   19	48	51	java/lang/Exception
    //   68	81	51	java/lang/Exception
    //   95	108	51	java/lang/Exception
    //   108	114	51	java/lang/Exception
    //   3	7	62	finally
    //   15	19	62	finally
    //   19	48	62	finally
    //   52	59	62	finally
    //   68	81	62	finally
    //   85	92	62	finally
    //   95	108	62	finally
    //   108	114	62	finally
    //   19	48	84	java/lang/Error
    //   68	81	84	java/lang/Error
    //   95	108	84	java/lang/Error
    //   108	114	84	java/lang/Error
  }
  
  protected boolean a()
  {
    if (DeviceProfileManager.b().a() == 4) {
      b();
    }
    for (;;)
    {
      StatisticCollector.a(BaseApplicationImpl.a()).a(null, "InitHook", true, 0L, 0L, null, "", true);
      return true;
      DeviceProfileManager.a(new rdr(null));
    }
  }
}
