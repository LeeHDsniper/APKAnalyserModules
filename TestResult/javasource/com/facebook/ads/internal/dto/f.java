package com.facebook.ads.internal.dto;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build;
import android.os.Build.VERSION;
import android.telephony.TelephonyManager;

public class f
{
  public static final String a = Build.VERSION.RELEASE;
  public static String b = "";
  public static String c = "";
  public static String d = "";
  public static String e = "";
  public static String f = "";
  public static int g = 0;
  public static String h = "";
  public static int i = 0;
  public static String j = "";
  public static int k = 0;
  public static String l = "";
  public static String m = "";
  public static String n = "";
  public static boolean o = false;
  private static boolean p = false;
  
  public static void a(Context paramContext)
  {
    try
    {
      if (!p)
      {
        p = true;
        c(paramContext);
      }
      d(paramContext);
      return;
    }
    finally {}
  }
  
  /* Error */
  public static void b(Context paramContext)
  {
    // Byte code:
    //   0: getstatic 27	com/facebook/ads/internal/dto/f:p	Z
    //   3: ifne +4 -> 7
    //   6: return
    //   7: aload_0
    //   8: ldc 74
    //   10: iconst_0
    //   11: invokevirtual 80	android/content/Context:getSharedPreferences	(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    //   14: astore_3
    //   15: aload_3
    //   16: ldc 82
    //   18: invokeinterface 88 2 0
    //   23: ifeq +16 -> 39
    //   26: aload_3
    //   27: ldc 82
    //   29: ldc 36
    //   31: invokeinterface 92 3 0
    //   36: putstatic 60	com/facebook/ads/internal/dto/f:m	Ljava/lang/String;
    //   39: aload_3
    //   40: ldc 94
    //   42: invokeinterface 88 2 0
    //   47: ifeq +30 -> 77
    //   50: aload_3
    //   51: ldc 94
    //   53: ldc 36
    //   55: invokeinterface 92 3 0
    //   60: putstatic 62	com/facebook/ads/internal/dto/f:n	Ljava/lang/String;
    //   63: aload_3
    //   64: ldc 96
    //   66: getstatic 64	com/facebook/ads/internal/dto/f:o	Z
    //   69: invokeinterface 100 3 0
    //   74: putstatic 64	com/facebook/ads/internal/dto/f:o	Z
    //   77: aload_0
    //   78: invokevirtual 104	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   81: invokestatic 109	com/facebook/ads/internal/util/g:a	(Landroid/content/ContentResolver;)Lcom/facebook/ads/internal/util/g$a;
    //   84: astore_2
    //   85: aload_2
    //   86: ifnull +19 -> 105
    //   89: aload_2
    //   90: getfield 112	com/facebook/ads/internal/util/g$a:a	Ljava/lang/String;
    //   93: astore 4
    //   95: aload 4
    //   97: ifnull +8 -> 105
    //   100: aload 4
    //   102: putstatic 60	com/facebook/ads/internal/dto/f:m	Ljava/lang/String;
    //   105: aload_0
    //   106: aload_2
    //   107: invokestatic 117	com/facebook/ads/internal/f:a	(Landroid/content/Context;Lcom/facebook/ads/internal/util/g$a;)Lcom/facebook/ads/internal/f;
    //   110: astore_0
    //   111: aload_0
    //   112: ifnull +31 -> 143
    //   115: aload_0
    //   116: invokevirtual 120	com/facebook/ads/internal/f:a	()Ljava/lang/String;
    //   119: astore_2
    //   120: aload_0
    //   121: invokevirtual 123	com/facebook/ads/internal/f:b	()Z
    //   124: istore_1
    //   125: aload_2
    //   126: ifnull +17 -> 143
    //   129: aload_2
    //   130: putstatic 62	com/facebook/ads/internal/dto/f:n	Ljava/lang/String;
    //   133: iload_1
    //   134: invokestatic 129	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   137: invokevirtual 132	java/lang/Boolean:booleanValue	()Z
    //   140: putstatic 64	com/facebook/ads/internal/dto/f:o	Z
    //   143: aload_3
    //   144: invokeinterface 136 1 0
    //   149: astore_0
    //   150: aload_0
    //   151: ldc 82
    //   153: getstatic 60	com/facebook/ads/internal/dto/f:m	Ljava/lang/String;
    //   156: invokeinterface 142 3 0
    //   161: pop
    //   162: aload_0
    //   163: ldc 94
    //   165: getstatic 62	com/facebook/ads/internal/dto/f:n	Ljava/lang/String;
    //   168: invokeinterface 142 3 0
    //   173: pop
    //   174: aload_0
    //   175: ldc 96
    //   177: getstatic 64	com/facebook/ads/internal/dto/f:o	Z
    //   180: invokeinterface 146 3 0
    //   185: pop
    //   186: aload_0
    //   187: invokeinterface 149 1 0
    //   192: return
    //   193: astore_0
    //   194: aload_0
    //   195: invokevirtual 152	java/lang/Exception:printStackTrace	()V
    //   198: return
    //   199: astore_2
    //   200: aload_2
    //   201: ldc -102
    //   203: invokestatic 159	com/facebook/ads/internal/util/b:a	(Ljava/lang/Throwable;Ljava/lang/String;)Lcom/facebook/ads/internal/util/b;
    //   206: invokestatic 164	com/facebook/ads/internal/util/c:a	(Lcom/facebook/ads/internal/util/b;)V
    //   209: aconst_null
    //   210: astore_2
    //   211: goto -126 -> 85
    //   214: astore_0
    //   215: aload_0
    //   216: ldc -90
    //   218: invokestatic 159	com/facebook/ads/internal/util/b:a	(Ljava/lang/Throwable;Ljava/lang/String;)Lcom/facebook/ads/internal/util/b;
    //   221: invokestatic 164	com/facebook/ads/internal/util/c:a	(Lcom/facebook/ads/internal/util/b;)V
    //   224: aconst_null
    //   225: astore_0
    //   226: goto -115 -> 111
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	229	0	paramContext	Context
    //   124	10	1	bool	boolean
    //   84	46	2	localObject1	Object
    //   199	2	2	localException	Exception
    //   210	1	2	localObject2	Object
    //   14	130	3	localSharedPreferences	android.content.SharedPreferences
    //   93	8	4	str	String
    // Exception table:
    //   from	to	target	type
    //   7	39	193	java/lang/Exception
    //   39	77	193	java/lang/Exception
    //   89	95	193	java/lang/Exception
    //   100	105	193	java/lang/Exception
    //   115	125	193	java/lang/Exception
    //   129	143	193	java/lang/Exception
    //   143	192	193	java/lang/Exception
    //   200	209	193	java/lang/Exception
    //   215	224	193	java/lang/Exception
    //   77	85	199	java/lang/Exception
    //   105	111	214	java/lang/Exception
  }
  
  private static void c(Context paramContext)
  {
    Object localObject = paramContext.getPackageManager();
    try
    {
      PackageInfo localPackageInfo = ((PackageManager)localObject).getPackageInfo(paramContext.getPackageName(), 0);
      d = packageName;
      f = versionName;
      g = versionCode;
      try
      {
        localObject = ((PackageManager)localObject).getApplicationLabel(((PackageManager)localObject).getApplicationInfo(paramContext.getPackageName(), 0));
        if ((localObject != null) && (((CharSequence)localObject).length() > 0)) {
          e = ((CharSequence)localObject).toString();
        }
      }
      catch (PackageManager.NameNotFoundException localNameNotFoundException1)
      {
        for (;;) {}
      }
      paramContext = (TelephonyManager)paramContext.getSystemService("phone");
      if (paramContext != null)
      {
        paramContext = paramContext.getNetworkOperatorName();
        if ((paramContext != null) && (paramContext.length() > 0)) {
          h = paramContext;
        }
      }
      paramContext = Build.MANUFACTURER;
      if ((paramContext != null) && (paramContext.length() > 0)) {
        b = paramContext;
      }
      paramContext = Build.MODEL;
      if ((paramContext != null) && (paramContext.length() > 0)) {
        c = Build.MODEL;
      }
      return;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException2)
    {
      for (;;) {}
    }
  }
  
  private static void d(Context paramContext)
  {
    try
    {
      paramContext = ((ConnectivityManager)paramContext.getSystemService("connectivity")).getActiveNetworkInfo();
      if ((paramContext != null) && (paramContext.isConnectedOrConnecting()))
      {
        i = paramContext.getType();
        j = paramContext.getTypeName();
        k = paramContext.getSubtype();
        l = paramContext.getSubtypeName();
      }
      return;
    }
    catch (Exception paramContext) {}
  }
}
