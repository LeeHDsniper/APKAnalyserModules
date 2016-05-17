package com.tencent.mobileqq.pluginsdk;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public class PluginProxyBroadcastReceiver
  extends BroadcastReceiver
{
  private int a;
  
  public PluginProxyBroadcastReceiver() {}
  
  /* Error */
  private IPluginBroadcastReceiver a(Context paramContext, Intent paramIntent)
  {
    // Byte code:
    //   0: aload_2
    //   1: ifnull +13 -> 14
    //   4: aload_2
    //   5: invokevirtual 22	android/content/Intent:getExtras	()Landroid/os/Bundle;
    //   8: invokestatic 27	com/tencent/mobileqq/pluginsdk/PluginStatic:a	(Landroid/os/Bundle;)Z
    //   11: ifne +5 -> 16
    //   14: aconst_null
    //   15: areturn
    //   16: aload_2
    //   17: ldc 29
    //   19: invokevirtual 33	android/content/Intent:getStringExtra	(Ljava/lang/String;)Ljava/lang/String;
    //   22: astore 4
    //   24: aload_2
    //   25: ldc 35
    //   27: invokevirtual 33	android/content/Intent:getStringExtra	(Ljava/lang/String;)Ljava/lang/String;
    //   30: astore 5
    //   32: aload_0
    //   33: aload_2
    //   34: ldc 37
    //   36: iconst_0
    //   37: invokevirtual 41	android/content/Intent:getIntExtra	(Ljava/lang/String;I)I
    //   40: putfield 43	com/tencent/mobileqq/pluginsdk/PluginProxyBroadcastReceiver:a	I
    //   43: aload_2
    //   44: ldc 45
    //   46: invokevirtual 33	android/content/Intent:getStringExtra	(Ljava/lang/String;)Ljava/lang/String;
    //   49: astore_3
    //   50: aload_3
    //   51: astore_2
    //   52: aload_3
    //   53: invokestatic 51	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   56: ifeq +13 -> 69
    //   59: aload_1
    //   60: aload 4
    //   62: invokestatic 57	com/tencent/mobileqq/pluginsdk/PluginUtils:getInstalledPluginPath	(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;
    //   65: invokevirtual 63	java/io/File:getCanonicalPath	()Ljava/lang/String;
    //   68: astore_2
    //   69: getstatic 69	com/tencent/mobileqq/pluginsdk/DebugHelper:sDebug	Z
    //   72: ifeq +38 -> 110
    //   75: ldc 71
    //   77: new 73	java/lang/StringBuilder
    //   80: dup
    //   81: invokespecial 74	java/lang/StringBuilder:<init>	()V
    //   84: ldc 76
    //   86: invokevirtual 80	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   89: aload 4
    //   91: invokevirtual 80	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   94: ldc 82
    //   96: invokevirtual 80	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   99: aload 5
    //   101: invokevirtual 80	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   104: invokevirtual 85	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   107: invokestatic 89	com/tencent/mobileqq/pluginsdk/DebugHelper:log	(Ljava/lang/String;Ljava/lang/String;)V
    //   110: aload 4
    //   112: ifnull +130 -> 242
    //   115: aload 4
    //   117: invokevirtual 95	java/lang/String:length	()I
    //   120: ifle +122 -> 242
    //   123: aload 4
    //   125: invokestatic 100	com/tencent/mobileqq/pluginsdk/PluginRecoverReceiver:a	(Ljava/lang/String;)V
    //   128: new 59	java/io/File
    //   131: dup
    //   132: aload_2
    //   133: invokespecial 102	java/io/File:<init>	(Ljava/lang/String;)V
    //   136: astore_3
    //   137: aload_3
    //   138: invokevirtual 106	java/io/File:exists	()Z
    //   141: ifeq +101 -> 242
    //   144: aload_3
    //   145: invokevirtual 109	java/io/File:isFile	()Z
    //   148: ifeq +94 -> 242
    //   151: getstatic 113	com/tencent/mobileqq/pluginsdk/PluginStatic:d	Ljava/util/concurrent/ConcurrentHashMap;
    //   154: aload_2
    //   155: invokevirtual 119	java/util/concurrent/ConcurrentHashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   158: checkcast 121	android/content/pm/PackageInfo
    //   161: astore_3
    //   162: aload_3
    //   163: ifnonnull +76 -> 239
    //   166: aload_1
    //   167: aload_2
    //   168: sipush 129
    //   171: invokestatic 127	com/tencent/mobileqq/pluginsdk/ApkFileParser:getPackageInfo	(Landroid/content/Context;Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    //   174: astore_3
    //   175: getstatic 113	com/tencent/mobileqq/pluginsdk/PluginStatic:d	Ljava/util/concurrent/ConcurrentHashMap;
    //   178: aload_2
    //   179: aload_3
    //   180: invokevirtual 131	java/util/concurrent/ConcurrentHashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   183: pop
    //   184: aload_1
    //   185: aload 4
    //   187: aload_2
    //   188: invokestatic 134	com/tencent/mobileqq/pluginsdk/PluginStatic:a	(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/ClassLoader;
    //   191: astore_1
    //   192: aload_1
    //   193: aload 5
    //   195: invokevirtual 140	java/lang/ClassLoader:loadClass	(Ljava/lang/String;)Ljava/lang/Class;
    //   198: invokevirtual 146	java/lang/Class:newInstance	()Ljava/lang/Object;
    //   201: checkcast 148	com/tencent/mobileqq/pluginsdk/IPluginBroadcastReceiver
    //   204: astore 5
    //   206: aload 5
    //   208: aload 4
    //   210: aload_2
    //   211: aload_0
    //   212: aload_1
    //   213: aload_3
    //   214: aload_0
    //   215: getfield 43	com/tencent/mobileqq/pluginsdk/PluginProxyBroadcastReceiver:a	I
    //   218: invokeinterface 152 7 0
    //   223: aload 5
    //   225: areturn
    //   226: astore_1
    //   227: aload 5
    //   229: areturn
    //   230: astore_1
    //   231: aconst_null
    //   232: areturn
    //   233: astore_2
    //   234: aload_3
    //   235: astore_2
    //   236: goto -167 -> 69
    //   239: goto -55 -> 184
    //   242: aconst_null
    //   243: areturn
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	244	0	this	PluginProxyBroadcastReceiver
    //   0	244	1	paramContext	Context
    //   0	244	2	paramIntent	Intent
    //   49	186	3	localObject1	Object
    //   22	187	4	str	String
    //   30	198	5	localObject2	Object
    // Exception table:
    //   from	to	target	type
    //   206	223	226	java/lang/Exception
    //   184	206	230	java/lang/Exception
    //   59	69	233	java/io/IOException
  }
  
  public static void sendBroadcastReceiver(Context paramContext, String paramString1, String paramString2, String paramString3, String paramString4, Intent paramIntent)
  {
    paramIntent.putExtra("pluginsdk_pluginName", paramString1);
    paramIntent.putExtra("pluginsdk_pluginLocation", paramString2);
    paramIntent.putExtra("pluginsdk_launchReceiver", paramString4);
    paramIntent.putExtra("pluginsdk_pluginpath", paramString3);
    try
    {
      paramContext.sendBroadcast(paramIntent);
      return;
    }
    catch (Throwable paramContext) {}
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    if (DebugHelper.sDebug) {
      DebugHelper.log("plugin_tag", "PluginProxyBroadcastReceiver.onReceive: " + paramIntent);
    }
    a.a();
    IPluginBroadcastReceiver localIPluginBroadcastReceiver = a(paramContext, paramIntent);
    if (DebugHelper.sDebug) {
      DebugHelper.log("plugin_tag", "PluginProxyBroadcastReceiver.startPluginIfNeccessary: " + localIPluginBroadcastReceiver);
    }
    if (localIPluginBroadcastReceiver != null) {
      localIPluginBroadcastReceiver.IOnReceive(paramContext, paramIntent);
    }
  }
}
