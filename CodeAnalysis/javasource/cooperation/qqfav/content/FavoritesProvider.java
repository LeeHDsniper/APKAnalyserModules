package cooperation.qqfav.content;

import android.content.ContentValues;
import android.content.UriMatcher;
import android.database.Cursor;
import android.net.Uri;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import cooperation.qqfav.QfavHelper;
import java.util.HashMap;
import java.util.Map;
import mqq.app.AppContentProvider;

public class FavoritesProvider
  extends AppContentProvider
  implements Favorites
{
  private static final int jdField_a_of_type_Int = 100;
  private static final int b = 200;
  private static final String e = "qqfav|FavoritesProvider";
  private static final String f = "com.qqfav.data.BizRelatedData$Proxy";
  private static final String g = "com.qqfav.data.BizRelatedData$GlobalSearchProxy";
  private UriMatcher jdField_a_of_type_AndroidContentUriMatcher;
  private Map jdField_a_of_type_JavaUtilMap;
  private String h;
  
  public FavoritesProvider()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    h = null;
  }
  
  /* Error */
  private Favorites.IProxy a(Uri paramUri)
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 46	cooperation/qqfav/content/FavoritesProvider:jdField_a_of_type_AndroidContentUriMatcher	Landroid/content/UriMatcher;
    //   4: aload_1
    //   5: invokevirtual 52	android/content/UriMatcher:match	(Landroid/net/Uri;)I
    //   8: istore_2
    //   9: iload_2
    //   10: iconst_m1
    //   11: if_icmpne +39 -> 50
    //   14: invokestatic 58	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   17: ifeq +31 -> 48
    //   20: ldc 15
    //   22: iconst_2
    //   23: new 60	java/lang/StringBuilder
    //   26: dup
    //   27: invokespecial 61	java/lang/StringBuilder:<init>	()V
    //   30: ldc 63
    //   32: invokevirtual 67	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   35: aload_1
    //   36: invokevirtual 73	android/net/Uri:toString	()Ljava/lang/String;
    //   39: invokevirtual 67	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   42: invokevirtual 74	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   45: invokestatic 77	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   48: aconst_null
    //   49: areturn
    //   50: aload_1
    //   51: invokevirtual 80	android/net/Uri:getLastPathSegment	()Ljava/lang/String;
    //   54: astore_3
    //   55: aload_0
    //   56: aload_3
    //   57: invokevirtual 84	cooperation/qqfav/content/FavoritesProvider:getRuntime	(Ljava/lang/String;)Lmqq/app/AppRuntime;
    //   60: astore_1
    //   61: aload_1
    //   62: ifnonnull +126 -> 188
    //   65: invokestatic 58	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   68: ifeq -20 -> 48
    //   71: ldc 15
    //   73: iconst_2
    //   74: new 60	java/lang/StringBuilder
    //   77: dup
    //   78: invokespecial 61	java/lang/StringBuilder:<init>	()V
    //   81: ldc 86
    //   83: invokevirtual 67	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   86: aload_3
    //   87: invokevirtual 67	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   90: invokevirtual 74	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   93: invokestatic 77	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   96: aconst_null
    //   97: areturn
    //   98: astore_1
    //   99: new 88	java/util/concurrent/atomic/AtomicBoolean
    //   102: dup
    //   103: invokespecial 89	java/util/concurrent/atomic/AtomicBoolean:<init>	()V
    //   106: astore 4
    //   108: aload_0
    //   109: invokevirtual 93	cooperation/qqfav/content/FavoritesProvider:getContext	()Landroid/content/Context;
    //   112: new 95	unc
    //   115: dup
    //   116: aload_0
    //   117: aconst_null
    //   118: aload 4
    //   120: invokespecial 98	unc:<init>	(Lcooperation/qqfav/content/FavoritesProvider;Landroid/os/Bundle;Ljava/util/concurrent/atomic/AtomicBoolean;)V
    //   123: invokestatic 103	cooperation/qqfav/QfavHelper:a	(Landroid/content/Context;Lcom/tencent/mobileqq/pluginsdk/OnPluginInstallListener;)V
    //   126: aload 4
    //   128: monitorenter
    //   129: aload 4
    //   131: ldc2_w 104
    //   134: invokevirtual 111	java/lang/Object:wait	(J)V
    //   137: aload 4
    //   139: invokevirtual 114	java/util/concurrent/atomic/AtomicBoolean:get	()Z
    //   142: ifne +25 -> 167
    //   145: invokestatic 117	com/tencent/qphone/base/util/QLog:isDevelopLevel	()Z
    //   148: ifeq +355 -> 503
    //   151: ldc 119
    //   153: iconst_4
    //   154: ldc 121
    //   156: invokestatic 124	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   159: aconst_null
    //   160: astore_1
    //   161: aload 4
    //   163: monitorexit
    //   164: goto -103 -> 61
    //   167: aload_0
    //   168: aload_3
    //   169: invokevirtual 84	cooperation/qqfav/content/FavoritesProvider:getRuntime	(Ljava/lang/String;)Lmqq/app/AppRuntime;
    //   172: astore_1
    //   173: goto -12 -> 161
    //   176: astore_1
    //   177: aload 4
    //   179: monitorexit
    //   180: aload_1
    //   181: athrow
    //   182: astore_1
    //   183: aconst_null
    //   184: astore_1
    //   185: goto -124 -> 61
    //   188: aload_0
    //   189: getfield 36	cooperation/qqfav/content/FavoritesProvider:h	Ljava/lang/String;
    //   192: aload_3
    //   193: invokevirtual 130	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   196: ifeq +210 -> 406
    //   199: aload_0
    //   200: getfield 132	cooperation/qqfav/content/FavoritesProvider:jdField_a_of_type_JavaUtilMap	Ljava/util/Map;
    //   203: iload_2
    //   204: invokestatic 138	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   207: invokeinterface 143 2 0
    //   212: checkcast 145	cooperation/qqfav/content/Favorites$IProxy
    //   215: astore 4
    //   217: aload 4
    //   219: ifnull +144 -> 363
    //   222: iload_2
    //   223: lookupswitch	default:+25->248, 100:+102->325, 200:+121->344
    //   248: iload_2
    //   249: lookupswitch	default:+27->276, 100:+29->278, 200:+214->463
    //   276: aconst_null
    //   277: areturn
    //   278: ldc 18
    //   280: iconst_1
    //   281: anewarray 147	java/lang/Class
    //   284: dup
    //   285: iconst_0
    //   286: ldc -107
    //   288: aastore
    //   289: iconst_1
    //   290: anewarray 107	java/lang/Object
    //   293: dup
    //   294: iconst_0
    //   295: aload_1
    //   296: aastore
    //   297: invokestatic 152	cooperation/qqfav/QfavHelper:a	(Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    //   300: checkcast 145	cooperation/qqfav/content/Favorites$IProxy
    //   303: astore_1
    //   304: aload_1
    //   305: ifnull +178 -> 483
    //   308: aload_0
    //   309: getfield 132	cooperation/qqfav/content/FavoritesProvider:jdField_a_of_type_JavaUtilMap	Ljava/util/Map;
    //   312: iload_2
    //   313: invokestatic 138	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   316: aload_1
    //   317: invokeinterface 156 3 0
    //   322: pop
    //   323: aload_1
    //   324: areturn
    //   325: aload 4
    //   327: invokevirtual 160	java/lang/Object:getClass	()Ljava/lang/Class;
    //   330: invokevirtual 163	java/lang/Class:getSimpleName	()Ljava/lang/String;
    //   333: ldc 18
    //   335: invokevirtual 130	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   338: ifeq -90 -> 248
    //   341: aload 4
    //   343: areturn
    //   344: aload 4
    //   346: invokevirtual 160	java/lang/Object:getClass	()Ljava/lang/Class;
    //   349: invokevirtual 163	java/lang/Class:getSimpleName	()Ljava/lang/String;
    //   352: ldc 21
    //   354: invokevirtual 130	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   357: ifeq -109 -> 248
    //   360: aload 4
    //   362: areturn
    //   363: invokestatic 58	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   366: ifeq -118 -> 248
    //   369: ldc 15
    //   371: iconst_2
    //   372: new 60	java/lang/StringBuilder
    //   375: dup
    //   376: invokespecial 61	java/lang/StringBuilder:<init>	()V
    //   379: ldc -91
    //   381: invokevirtual 67	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   384: iload_2
    //   385: invokevirtual 168	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   388: ldc -86
    //   390: invokevirtual 67	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   393: aload_3
    //   394: invokevirtual 67	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   397: invokevirtual 74	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   400: invokestatic 77	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   403: goto -155 -> 248
    //   406: aload_0
    //   407: getfield 132	cooperation/qqfav/content/FavoritesProvider:jdField_a_of_type_JavaUtilMap	Ljava/util/Map;
    //   410: invokeinterface 173 1 0
    //   415: aload_0
    //   416: aload_3
    //   417: putfield 36	cooperation/qqfav/content/FavoritesProvider:h	Ljava/lang/String;
    //   420: invokestatic 117	com/tencent/qphone/base/util/QLog:isDevelopLevel	()Z
    //   423: ifeq -175 -> 248
    //   426: ldc 15
    //   428: iconst_4
    //   429: new 60	java/lang/StringBuilder
    //   432: dup
    //   433: invokespecial 61	java/lang/StringBuilder:<init>	()V
    //   436: ldc -81
    //   438: invokevirtual 67	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   441: iload_2
    //   442: invokevirtual 168	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   445: ldc -86
    //   447: invokevirtual 67	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   450: aload_3
    //   451: invokevirtual 67	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   454: invokevirtual 74	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   457: invokestatic 77	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   460: goto -212 -> 248
    //   463: ldc 21
    //   465: aconst_null
    //   466: checkcast 177	[Ljava/lang/Class;
    //   469: aconst_null
    //   470: checkcast 179	[Ljava/lang/Object;
    //   473: invokestatic 152	cooperation/qqfav/QfavHelper:a	(Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    //   476: checkcast 145	cooperation/qqfav/content/Favorites$IProxy
    //   479: astore_1
    //   480: goto -176 -> 304
    //   483: invokestatic 58	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   486: ifeq -438 -> 48
    //   489: ldc 15
    //   491: iconst_2
    //   492: ldc -75
    //   494: invokestatic 77	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   497: aconst_null
    //   498: areturn
    //   499: astore_1
    //   500: goto -363 -> 137
    //   503: aconst_null
    //   504: astore_1
    //   505: goto -344 -> 161
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	508	0	this	FavoritesProvider
    //   0	508	1	paramUri	Uri
    //   8	434	2	i	int
    //   54	397	3	str	String
    //   106	255	4	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   55	61	98	java/lang/NullPointerException
    //   129	137	176	finally
    //   137	159	176	finally
    //   161	164	176	finally
    //   167	173	176	finally
    //   177	180	176	finally
    //   55	61	182	java/lang/Exception
    //   129	137	499	java/lang/InterruptedException
  }
  
  public int delete(Uri paramUri, String paramString, String[] paramArrayOfString)
  {
    Favorites.IProxy localIProxy = a(paramUri);
    if (localIProxy != null) {
      return localIProxy.a(paramUri, paramString, paramArrayOfString);
    }
    return 0;
  }
  
  public String getType(Uri paramUri)
  {
    return null;
  }
  
  public Uri insert(Uri paramUri, ContentValues paramContentValues)
  {
    Favorites.IProxy localIProxy = a(paramUri);
    if (localIProxy != null) {
      return localIProxy.a(paramUri, paramContentValues);
    }
    return null;
  }
  
  public boolean onCreate()
  {
    super.onCreate();
    QfavHelper.a(getContext(), null);
    jdField_a_of_type_AndroidContentUriMatcher = new UriMatcher(-1);
    jdField_a_of_type_AndroidContentUriMatcher.addURI("qq.favorites", "biz_related/#", 100);
    jdField_a_of_type_AndroidContentUriMatcher.addURI("qq.favorites", "global_search/#", 200);
    jdField_a_of_type_JavaUtilMap = new HashMap();
    h = "";
    return true;
  }
  
  public Cursor query(Uri paramUri, String[] paramArrayOfString1, String paramString1, String[] paramArrayOfString2, String paramString2)
  {
    Favorites.IProxy localIProxy = a(paramUri);
    if (QLog.isDevelopLevel()) {
      QLog.d("qqfav|FavoritesProvider", 4, "query|" + localIProxy + ",uri=" + paramUri + ",proj=" + paramArrayOfString1 + ",selection=" + paramString1 + ",args=" + paramArrayOfString2);
    }
    if (localIProxy != null) {
      return localIProxy.a(paramUri, paramArrayOfString1, paramString1, paramArrayOfString2, paramString2);
    }
    return null;
  }
  
  public int update(Uri paramUri, ContentValues paramContentValues, String paramString, String[] paramArrayOfString)
  {
    Favorites.IProxy localIProxy = a(paramUri);
    if (localIProxy != null) {
      return localIProxy.a(paramUri, paramContentValues, paramString, paramArrayOfString);
    }
    return 0;
  }
}
