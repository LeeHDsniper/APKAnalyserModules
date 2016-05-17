package com.tencent.theme;

import android.annotation.TargetApi;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.AssetManager;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.Resources.NotFoundException;
import android.content.res.XmlResourceParser;
import android.graphics.Bitmap.Config;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.ConstantState;
import android.graphics.drawable.DrawableContainer;
import android.os.AsyncTask;
import android.os.Build.VERSION;
import android.os.Process;
import android.util.DisplayMetrics;
import android.util.Log;
import android.util.LongSparseArray;
import android.util.SparseArray;
import android.util.TypedValue;
import android.util.Xml;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.concurrent.RejectedExecutionException;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

public class SkinEngine
{
  public static final String ACTION_THEME_INVALIDATE = "com.tencent.qplus.THEME_INVALIDATE";
  public static final String ACTION_THEME_UPDATE = "com.tencent.qplus.THEME_UPDATE";
  public static final String ASSET_PATH = "/asset/";
  public static boolean DEBUG = false;
  public static boolean IS_PROBLEM_CM11 = false;
  public static boolean IS_PROBLEM_MIUI = false;
  public static final String KEY_PENDING_THEME = "pending_theme_root";
  public static final String KEY_PENDING_THEME_RESOURCES_IS_COMPLIED = "pending_theme_resources_complied";
  public static final String KEY_RESOURCES_IS_COMPLIED = "complied";
  public static final String KEY_THEME = "theme_root";
  public static final String PREFERENCE_NAME = "theme";
  public static boolean SWITCH_DEBUG = false;
  public static final String TAG = "SkinEngine";
  public static final String TAG_SWITCH = "SkinEngine.switch";
  public static final int TYPE_FILE = 16777215;
  public static final int TYPE_RESOURCES = 3;
  static boolean a;
  static final String[][] c;
  static final int[][] d;
  static int e;
  static int f;
  static int g;
  static int h;
  static int i;
  private static SkinEngine l;
  public static Field mComposedIconInfoOfCM;
  public static Integer mIconResourceID;
  public static Field mIconsOfCM;
  final TypedValue b = new TypedValue();
  public HashMap<Integer, BackupForOOMData> backupForOOMData;
  SkinEngineHandler j;
  BroadcastReceiver k = new BroadcastReceiver()
  {
    public void onReceive(Context paramAnonymousContext, Intent paramAnonymousIntent)
    {
      if (SkinEngine.SWITCH_DEBUG) {
        Log.d("SkinEngine.switch", "UpdateReceiver.onReceive ACTION_THEME_UPDATE");
      }
      try
      {
        new SkinEngine.a(SkinEngine.this, null).execute(new Context[] { paramAnonymousContext });
        return;
      }
      catch (RejectedExecutionException paramAnonymousContext) {}
    }
  };
  private boolean m = false;
  public Resources mResources;
  private boolean n = true;
  private final LongSparseArray<WeakReference<b>> o = new LongSparseArray();
  private final LongSparseArray<WeakReference<SkinnableColorStateList>> p = new LongSparseArray();
  private String q;
  private String r;
  private int s = g;
  private g t;
  private d u;
  private e v;
  private HashMap<String, Object> w;
  private HashMap<String, Object> x;
  
  static
  {
    if (("MNC".equals(Build.VERSION.CODENAME)) || (Build.VERSION.SDK_INT >= 23)) {}
    for (boolean bool = true;; bool = false)
    {
      a = bool;
      IS_PROBLEM_MIUI = false;
      mIconsOfCM = null;
      mComposedIconInfoOfCM = null;
      IS_PROBLEM_CM11 = false;
      mIconResourceID = null;
      String[] arrayOfString1 = { "drawable-xhdpi/", "drawable-hdpi/", "drawable-mdpi/", "drawable/" };
      String[] arrayOfString2 = { "drawable-mdpi/", "drawable/", "drawable-hdpi/", "drawable-xhdpi/" };
      String[] arrayOfString3 = { "drawable-ldpi/", "drawable-mdpi/", "drawable-hdpi/", "drawable-xhdpi/", "drawable/" };
      c = new String[][] { arrayOfString1, { "drawable-hdpi/", "drawable-xhdpi/", "drawable-mdpi/", "drawable/" }, arrayOfString2, arrayOfString3, { "drawable-xxhdpi", "drawable-xhdpi/", "drawable-hdpi/", "drawable-mdpi/", "drawable/" } };
      d = new int[][] { { 320, 240, 160, 160 }, { 240, 320, 160, 160 }, { 160, 160, 240, 320 }, { 120, 160, 240, 320, 160 }, { 480, 320, 240, 160, 160 } };
      e = 0;
      f = 1;
      g = 2;
      h = 3;
      i = 4;
      return;
    }
  }
  
  @TargetApi(16)
  private SkinEngine() {}
  
  private static int a(Resources paramResources)
  {
    switch (getDisplayMetricsdensityDpi)
    {
    default: 
      return g;
    case 320: 
      return e;
    case 240: 
      return f;
    case 120: 
      return h;
    }
    return i;
  }
  
  private XmlResourceParser a(int paramInt, TypedValue paramTypedValue)
    throws IOException
  {
    mResources.getValue(paramInt, paramTypedValue, true);
    if (type == 3) {
      return mResources.getAssets().openXmlResourceParser(assetCookie, string.toString());
    }
    throw new Resources.NotFoundException("Resource ID #0x" + Integer.toHexString(paramInt) + " type #0x" + Integer.toHexString(type) + " is not valid");
  }
  
  /* Error */
  private b a(int paramInt, Resources paramResources, k paramK)
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 176	com/tencent/theme/SkinEngine:b	Landroid/util/TypedValue;
    //   4: astore 12
    //   6: aload 12
    //   8: monitorenter
    //   9: new 275	android/graphics/Rect
    //   12: dup
    //   13: invokespecial 276	android/graphics/Rect:<init>	()V
    //   16: astore 14
    //   18: aload_3
    //   19: getfield 280	com/tencent/theme/k:b	Ljava/lang/String;
    //   22: astore 13
    //   24: aload 13
    //   26: ifnull +497 -> 523
    //   29: aload 13
    //   31: ldc_w 282
    //   34: invokevirtual 286	java/lang/String:endsWith	(Ljava/lang/String;)Z
    //   37: istore 6
    //   39: iload 6
    //   41: ifne +482 -> 523
    //   44: aload_0
    //   45: aload_2
    //   46: aload 13
    //   48: invokespecial 289	com/tencent/theme/SkinEngine:b	(Landroid/content/res/Resources;Ljava/lang/String;)Ljava/io/InputStream;
    //   51: astore 9
    //   53: new 291	android/graphics/BitmapFactory$Options
    //   56: dup
    //   57: invokespecial 292	android/graphics/BitmapFactory$Options:<init>	()V
    //   60: astore 15
    //   62: aload 15
    //   64: aload_3
    //   65: getfield 294	com/tencent/theme/k:c	I
    //   68: putfield 297	android/graphics/BitmapFactory$Options:inDensity	I
    //   71: aload_2
    //   72: aconst_null
    //   73: aload 9
    //   75: aload_3
    //   76: getfield 299	com/tencent/theme/k:d	Ljava/lang/String;
    //   79: aload 15
    //   81: aload 14
    //   83: aload_0
    //   84: getfield 180	com/tencent/theme/SkinEngine:n	Z
    //   87: invokestatic 304	com/tencent/theme/i:a	(Landroid/content/res/Resources;Landroid/util/TypedValue;Ljava/io/InputStream;Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;Landroid/graphics/Rect;Z)Lcom/tencent/theme/b;
    //   90: astore 7
    //   92: aload 9
    //   94: invokevirtual 309	java/io/InputStream:close	()V
    //   97: aload 7
    //   99: ifnull +424 -> 523
    //   102: aload 12
    //   104: monitorexit
    //   105: aload 7
    //   107: areturn
    //   108: astore 8
    //   110: ldc 46
    //   112: iconst_1
    //   113: new 246	java/lang/StringBuilder
    //   116: dup
    //   117: invokespecial 247	java/lang/StringBuilder:<init>	()V
    //   120: ldc_w 311
    //   123: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   126: aload 13
    //   128: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   131: invokevirtual 264	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   134: aload 8
    //   136: invokestatic 316	com/tencent/theme/j:a	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   139: aload_0
    //   140: getfield 318	com/tencent/theme/SkinEngine:j	Lcom/tencent/theme/SkinEngineHandler;
    //   143: ifnull +1208 -> 1351
    //   146: aload_0
    //   147: getfield 318	com/tencent/theme/SkinEngine:j	Lcom/tencent/theme/SkinEngineHandler;
    //   150: aload 8
    //   152: aload_3
    //   153: getfield 299	com/tencent/theme/k:d	Ljava/lang/String;
    //   156: iconst_1
    //   157: invokeinterface 324 4 0
    //   162: ifeq +1189 -> 1351
    //   165: aload 9
    //   167: invokevirtual 309	java/io/InputStream:close	()V
    //   170: aload_0
    //   171: aload_2
    //   172: aload 13
    //   174: invokespecial 289	com/tencent/theme/SkinEngine:b	(Landroid/content/res/Resources;Ljava/lang/String;)Ljava/io/InputStream;
    //   177: astore 9
    //   179: aload_2
    //   180: aconst_null
    //   181: aload 9
    //   183: aload_3
    //   184: getfield 299	com/tencent/theme/k:d	Ljava/lang/String;
    //   187: aload 15
    //   189: aload 14
    //   191: aload_0
    //   192: getfield 180	com/tencent/theme/SkinEngine:n	Z
    //   195: invokestatic 304	com/tencent/theme/i:a	(Landroid/content/res/Resources;Landroid/util/TypedValue;Ljava/io/InputStream;Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;Landroid/graphics/Rect;Z)Lcom/tencent/theme/b;
    //   198: astore 7
    //   200: goto -108 -> 92
    //   203: astore 7
    //   205: ldc 46
    //   207: iconst_1
    //   208: new 246	java/lang/StringBuilder
    //   211: dup
    //   212: invokespecial 247	java/lang/StringBuilder:<init>	()V
    //   215: ldc_w 326
    //   218: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   221: aload 13
    //   223: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   226: invokevirtual 264	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   229: aload 8
    //   231: invokestatic 316	com/tencent/theme/j:a	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   234: aload_0
    //   235: getfield 318	com/tencent/theme/SkinEngine:j	Lcom/tencent/theme/SkinEngineHandler;
    //   238: aload 7
    //   240: aload_3
    //   241: getfield 299	com/tencent/theme/k:d	Ljava/lang/String;
    //   244: iconst_1
    //   245: invokeinterface 329 4 0
    //   250: ifeq +200 -> 450
    //   253: aload 15
    //   255: iconst_1
    //   256: putfield 332	android/graphics/BitmapFactory$Options:inJustDecodeBounds	Z
    //   259: aload 9
    //   261: invokevirtual 309	java/io/InputStream:close	()V
    //   264: aload_0
    //   265: aload_2
    //   266: aload 13
    //   268: invokespecial 289	com/tencent/theme/SkinEngine:b	(Landroid/content/res/Resources;Ljava/lang/String;)Ljava/io/InputStream;
    //   271: astore 10
    //   273: aload_2
    //   274: aconst_null
    //   275: aload 10
    //   277: aload_3
    //   278: getfield 299	com/tencent/theme/k:d	Ljava/lang/String;
    //   281: aload 15
    //   283: aload 14
    //   285: aload_0
    //   286: getfield 180	com/tencent/theme/SkinEngine:n	Z
    //   289: invokestatic 304	com/tencent/theme/i:a	(Landroid/content/res/Resources;Landroid/util/TypedValue;Ljava/io/InputStream;Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;Landroid/graphics/Rect;Z)Lcom/tencent/theme/b;
    //   292: astore 11
    //   294: aload_0
    //   295: getfield 334	com/tencent/theme/SkinEngine:backupForOOMData	Ljava/util/HashMap;
    //   298: ifnull +1083 -> 1381
    //   301: aload_0
    //   302: getfield 334	com/tencent/theme/SkinEngine:backupForOOMData	Ljava/util/HashMap;
    //   305: iload_1
    //   306: invokestatic 338	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   309: invokevirtual 343	java/util/HashMap:containsKey	(Ljava/lang/Object;)Z
    //   312: ifeq +1069 -> 1381
    //   315: aload_0
    //   316: getfield 334	com/tencent/theme/SkinEngine:backupForOOMData	Ljava/util/HashMap;
    //   319: iload_1
    //   320: invokestatic 338	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   323: invokevirtual 347	java/util/HashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   326: ifnull +1055 -> 1381
    //   329: iconst_1
    //   330: istore 4
    //   332: iload 4
    //   334: ifeq +1036 -> 1370
    //   337: aconst_null
    //   338: astore 7
    //   340: aload_0
    //   341: getfield 334	com/tencent/theme/SkinEngine:backupForOOMData	Ljava/util/HashMap;
    //   344: iload_1
    //   345: invokestatic 338	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   348: invokevirtual 347	java/util/HashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   351: checkcast 8	com/tencent/theme/SkinEngine$BackupForOOMData
    //   354: astore 9
    //   356: aload 15
    //   358: getfield 350	android/graphics/BitmapFactory$Options:outWidth	I
    //   361: bipush 8
    //   363: idiv
    //   364: aload 15
    //   366: getfield 353	android/graphics/BitmapFactory$Options:outHeight	I
    //   369: bipush 8
    //   371: idiv
    //   372: invokestatic 359	java/lang/Math:min	(II)I
    //   375: bipush 8
    //   377: invokestatic 362	java/lang/Math:max	(II)I
    //   380: istore 5
    //   382: iconst_2
    //   383: istore 4
    //   385: iload 4
    //   387: iload 5
    //   389: if_icmpgt +29 -> 418
    //   392: aload_0
    //   393: aload_2
    //   394: aload_3
    //   395: aload 15
    //   397: aload 14
    //   399: aload_0
    //   400: getfield 180	com/tencent/theme/SkinEngine:n	Z
    //   403: aload 9
    //   405: iload 4
    //   407: iconst_0
    //   408: invokevirtual 365	com/tencent/theme/SkinEngine:a	(Landroid/content/res/Resources;Lcom/tencent/theme/k;Landroid/graphics/BitmapFactory$Options;Landroid/graphics/Rect;ZLcom/tencent/theme/SkinEngine$BackupForOOMData;IZ)Lcom/tencent/theme/b;
    //   411: astore 7
    //   413: aload 7
    //   415: ifnull +972 -> 1387
    //   418: aload 7
    //   420: astore 8
    //   422: aload 7
    //   424: ifnonnull +933 -> 1357
    //   427: aload_0
    //   428: aload_2
    //   429: aload_3
    //   430: aload 15
    //   432: aload 14
    //   434: aload_0
    //   435: getfield 180	com/tencent/theme/SkinEngine:n	Z
    //   438: aload 9
    //   440: iconst_1
    //   441: iconst_1
    //   442: invokevirtual 365	com/tencent/theme/SkinEngine:a	(Landroid/content/res/Resources;Lcom/tencent/theme/k;Landroid/graphics/BitmapFactory$Options;Landroid/graphics/Rect;ZLcom/tencent/theme/SkinEngine$BackupForOOMData;IZ)Lcom/tencent/theme/b;
    //   445: astore 8
    //   447: goto +910 -> 1357
    //   450: aload 7
    //   452: athrow
    //   453: astore 7
    //   455: getstatic 104	com/tencent/theme/SkinEngine:DEBUG	Z
    //   458: ifeq +36 -> 494
    //   461: ldc 46
    //   463: new 246	java/lang/StringBuilder
    //   466: dup
    //   467: invokespecial 247	java/lang/StringBuilder:<init>	()V
    //   470: ldc_w 367
    //   473: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   476: aload 13
    //   478: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   481: ldc_w 369
    //   484: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   487: invokevirtual 264	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   490: invokestatic 374	android/util/Log:w	(Ljava/lang/String;Ljava/lang/String;)I
    //   493: pop
    //   494: ldc 46
    //   496: iconst_1
    //   497: new 246	java/lang/StringBuilder
    //   500: dup
    //   501: invokespecial 247	java/lang/StringBuilder:<init>	()V
    //   504: ldc_w 376
    //   507: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   510: aload 13
    //   512: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   515: invokevirtual 264	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   518: aload 7
    //   520: invokestatic 316	com/tencent/theme/j:a	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   523: aload_3
    //   524: getfield 299	com/tencent/theme/k:d	Ljava/lang/String;
    //   527: ldc_w 282
    //   530: invokevirtual 286	java/lang/String:endsWith	(Ljava/lang/String;)Z
    //   533: istore 6
    //   535: iload 6
    //   537: ifeq +218 -> 755
    //   540: aload_0
    //   541: iload_1
    //   542: aload_0
    //   543: getfield 176	com/tencent/theme/SkinEngine:b	Landroid/util/TypedValue;
    //   546: invokespecial 378	com/tencent/theme/SkinEngine:a	(ILandroid/util/TypedValue;)Landroid/content/res/XmlResourceParser;
    //   549: astore 8
    //   551: aload 13
    //   553: ifnull +86 -> 639
    //   556: aload_0
    //   557: getfield 180	com/tencent/theme/SkinEngine:n	Z
    //   560: ifeq +71 -> 631
    //   563: new 380	com/tencent/theme/a
    //   566: dup
    //   567: invokespecial 381	com/tencent/theme/a:<init>	()V
    //   570: astore 7
    //   572: new 383	java/io/FileInputStream
    //   575: dup
    //   576: aload 13
    //   578: invokespecial 384	java/io/FileInputStream:<init>	(Ljava/lang/String;)V
    //   581: astore 9
    //   583: aload 7
    //   585: aload 9
    //   587: ldc_w 386
    //   590: invokeinterface 392 3 0
    //   595: aload_2
    //   596: aload 8
    //   598: aload 7
    //   600: aload_0
    //   601: getfield 180	com/tencent/theme/SkinEngine:n	Z
    //   604: invokestatic 395	com/tencent/theme/i:a	(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Lorg/xmlpull/v1/XmlPullParser;Z)Lcom/tencent/theme/b;
    //   607: astore_2
    //   608: aload 9
    //   610: invokevirtual 396	java/io/FileInputStream:close	()V
    //   613: aload 8
    //   615: invokeinterface 399 1 0
    //   620: aload 12
    //   622: monitorexit
    //   623: aload_2
    //   624: areturn
    //   625: astore_2
    //   626: aload 12
    //   628: monitorexit
    //   629: aload_2
    //   630: athrow
    //   631: invokestatic 405	android/util/Xml:newPullParser	()Lorg/xmlpull/v1/XmlPullParser;
    //   634: astore 7
    //   636: goto -64 -> 572
    //   639: aload_2
    //   640: aload 8
    //   642: aconst_null
    //   643: aload_0
    //   644: getfield 180	com/tencent/theme/SkinEngine:n	Z
    //   647: invokestatic 395	com/tencent/theme/i:a	(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Lorg/xmlpull/v1/XmlPullParser;Z)Lcom/tencent/theme/b;
    //   650: astore_2
    //   651: aload 8
    //   653: invokeinterface 399 1 0
    //   658: aload 12
    //   660: monitorexit
    //   661: aload_2
    //   662: areturn
    //   663: astore_2
    //   664: ldc 46
    //   666: iconst_1
    //   667: new 246	java/lang/StringBuilder
    //   670: dup
    //   671: invokespecial 247	java/lang/StringBuilder:<init>	()V
    //   674: ldc_w 407
    //   677: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   680: aload 13
    //   682: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   685: invokevirtual 264	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   688: aload_2
    //   689: invokestatic 316	com/tencent/theme/j:a	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   692: getstatic 104	com/tencent/theme/SkinEngine:DEBUG	Z
    //   695: ifeq +55 -> 750
    //   698: new 244	android/content/res/Resources$NotFoundException
    //   701: dup
    //   702: new 246	java/lang/StringBuilder
    //   705: dup
    //   706: invokespecial 247	java/lang/StringBuilder:<init>	()V
    //   709: ldc_w 409
    //   712: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   715: aload_3
    //   716: getfield 299	com/tencent/theme/k:d	Ljava/lang/String;
    //   719: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   722: ldc_w 411
    //   725: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   728: iload_1
    //   729: invokestatic 259	java/lang/Integer:toHexString	(I)Ljava/lang/String;
    //   732: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   735: invokevirtual 264	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   738: invokespecial 267	android/content/res/Resources$NotFoundException:<init>	(Ljava/lang/String;)V
    //   741: astore_3
    //   742: aload_3
    //   743: aload_2
    //   744: invokevirtual 415	android/content/res/Resources$NotFoundException:initCause	(Ljava/lang/Throwable;)Ljava/lang/Throwable;
    //   747: pop
    //   748: aload_3
    //   749: athrow
    //   750: aload 12
    //   752: monitorexit
    //   753: aconst_null
    //   754: areturn
    //   755: getstatic 132	com/tencent/theme/SkinEngine:IS_PROBLEM_CM11	Z
    //   758: istore 6
    //   760: iload 6
    //   762: ifeq +100 -> 862
    //   765: getstatic 128	com/tencent/theme/SkinEngine:mIconsOfCM	Ljava/lang/reflect/Field;
    //   768: iconst_1
    //   769: invokevirtual 421	java/lang/reflect/Field:setAccessible	(Z)V
    //   772: getstatic 128	com/tencent/theme/SkinEngine:mIconsOfCM	Ljava/lang/reflect/Field;
    //   775: aload_0
    //   776: getfield 212	com/tencent/theme/SkinEngine:mResources	Landroid/content/res/Resources;
    //   779: aconst_null
    //   780: invokevirtual 425	java/lang/reflect/Field:set	(Ljava/lang/Object;Ljava/lang/Object;)V
    //   783: getstatic 130	com/tencent/theme/SkinEngine:mComposedIconInfoOfCM	Ljava/lang/reflect/Field;
    //   786: iconst_1
    //   787: invokevirtual 421	java/lang/reflect/Field:setAccessible	(Z)V
    //   790: getstatic 130	com/tencent/theme/SkinEngine:mComposedIconInfoOfCM	Ljava/lang/reflect/Field;
    //   793: aload_0
    //   794: getfield 212	com/tencent/theme/SkinEngine:mResources	Landroid/content/res/Resources;
    //   797: aconst_null
    //   798: invokevirtual 425	java/lang/reflect/Field:set	(Ljava/lang/Object;Ljava/lang/Object;)V
    //   801: getstatic 128	com/tencent/theme/SkinEngine:mIconsOfCM	Ljava/lang/reflect/Field;
    //   804: iconst_1
    //   805: invokevirtual 421	java/lang/reflect/Field:setAccessible	(Z)V
    //   808: getstatic 130	com/tencent/theme/SkinEngine:mComposedIconInfoOfCM	Ljava/lang/reflect/Field;
    //   811: iconst_1
    //   812: invokevirtual 421	java/lang/reflect/Field:setAccessible	(Z)V
    //   815: getstatic 128	com/tencent/theme/SkinEngine:mIconsOfCM	Ljava/lang/reflect/Field;
    //   818: aload_0
    //   819: getfield 212	com/tencent/theme/SkinEngine:mResources	Landroid/content/res/Resources;
    //   822: invokevirtual 426	java/lang/reflect/Field:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   825: ifnull +37 -> 862
    //   828: getstatic 130	com/tencent/theme/SkinEngine:mComposedIconInfoOfCM	Ljava/lang/reflect/Field;
    //   831: aload_0
    //   832: getfield 212	com/tencent/theme/SkinEngine:mResources	Landroid/content/res/Resources;
    //   835: invokevirtual 426	java/lang/reflect/Field:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   838: astore 7
    //   840: aload 7
    //   842: ifnull +20 -> 862
    //   845: aload 12
    //   847: monitorexit
    //   848: aconst_null
    //   849: areturn
    //   850: astore_2
    //   851: aload 12
    //   853: monitorexit
    //   854: aconst_null
    //   855: areturn
    //   856: astore_2
    //   857: aload 12
    //   859: monitorexit
    //   860: aconst_null
    //   861: areturn
    //   862: aload_0
    //   863: getfield 176	com/tencent/theme/SkinEngine:b	Landroid/util/TypedValue;
    //   866: astore 10
    //   868: aload_2
    //   869: iload_1
    //   870: aload 10
    //   872: invokevirtual 430	android/content/res/Resources:openRawResource	(ILandroid/util/TypedValue;)Ljava/io/InputStream;
    //   875: astore 8
    //   877: aload 10
    //   879: getfield 230	android/util/TypedValue:string	Ljava/lang/CharSequence;
    //   882: invokeinterface 236 1 0
    //   887: astore 11
    //   889: aload 8
    //   891: astore 7
    //   893: new 291	android/graphics/BitmapFactory$Options
    //   896: dup
    //   897: invokespecial 292	android/graphics/BitmapFactory$Options:<init>	()V
    //   900: astore 15
    //   902: aload 8
    //   904: astore 7
    //   906: aload_2
    //   907: aload 10
    //   909: aload 8
    //   911: aload 11
    //   913: aload 15
    //   915: aload 14
    //   917: iconst_1
    //   918: invokestatic 304	com/tencent/theme/i:a	(Landroid/content/res/Resources;Landroid/util/TypedValue;Ljava/io/InputStream;Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;Landroid/graphics/Rect;Z)Lcom/tencent/theme/b;
    //   921: astore 9
    //   923: aload 9
    //   925: astore_2
    //   926: aload 8
    //   928: astore 7
    //   930: aload 8
    //   932: invokevirtual 309	java/io/InputStream:close	()V
    //   935: aload_2
    //   936: ifnonnull +33 -> 969
    //   939: aload 8
    //   941: astore 7
    //   943: aload_0
    //   944: getfield 318	com/tencent/theme/SkinEngine:j	Lcom/tencent/theme/SkinEngineHandler;
    //   947: ifnull +22 -> 969
    //   950: aload 8
    //   952: astore 7
    //   954: aload_0
    //   955: getfield 318	com/tencent/theme/SkinEngine:j	Lcom/tencent/theme/SkinEngineHandler;
    //   958: aload_3
    //   959: getfield 299	com/tencent/theme/k:d	Ljava/lang/String;
    //   962: iconst_0
    //   963: invokeinterface 434 3 0
    //   968: pop
    //   969: aload 12
    //   971: monitorexit
    //   972: aload_2
    //   973: areturn
    //   974: astore_2
    //   975: ldc 46
    //   977: iconst_1
    //   978: new 246	java/lang/StringBuilder
    //   981: dup
    //   982: invokespecial 247	java/lang/StringBuilder:<init>	()V
    //   985: ldc_w 436
    //   988: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   991: aload 13
    //   993: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   996: invokevirtual 264	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   999: aload_2
    //   1000: invokestatic 316	com/tencent/theme/j:a	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   1003: aload 12
    //   1005: monitorexit
    //   1006: aconst_null
    //   1007: areturn
    //   1008: astore 16
    //   1010: aload 8
    //   1012: astore 7
    //   1014: ldc 46
    //   1016: iconst_1
    //   1017: new 246	java/lang/StringBuilder
    //   1020: dup
    //   1021: invokespecial 247	java/lang/StringBuilder:<init>	()V
    //   1024: ldc_w 438
    //   1027: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1030: aload 13
    //   1032: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1035: invokevirtual 264	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1038: aload 16
    //   1040: invokestatic 316	com/tencent/theme/j:a	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   1043: aload 8
    //   1045: astore 7
    //   1047: aload_0
    //   1048: getfield 318	com/tencent/theme/SkinEngine:j	Lcom/tencent/theme/SkinEngineHandler;
    //   1051: ifnull +295 -> 1346
    //   1054: aload 8
    //   1056: astore 7
    //   1058: aload_0
    //   1059: getfield 318	com/tencent/theme/SkinEngine:j	Lcom/tencent/theme/SkinEngineHandler;
    //   1062: aload 16
    //   1064: aload_3
    //   1065: getfield 299	com/tencent/theme/k:d	Ljava/lang/String;
    //   1068: iconst_0
    //   1069: invokeinterface 324 4 0
    //   1074: ifeq +272 -> 1346
    //   1077: aload 8
    //   1079: astore 7
    //   1081: aload 8
    //   1083: invokevirtual 309	java/io/InputStream:close	()V
    //   1086: aload 8
    //   1088: astore 7
    //   1090: aload_2
    //   1091: iload_1
    //   1092: aload 10
    //   1094: invokevirtual 430	android/content/res/Resources:openRawResource	(ILandroid/util/TypedValue;)Ljava/io/InputStream;
    //   1097: astore 8
    //   1099: aload 8
    //   1101: astore 7
    //   1103: aload_2
    //   1104: aload 10
    //   1106: aload 8
    //   1108: aload 11
    //   1110: aload 15
    //   1112: aload 14
    //   1114: iconst_1
    //   1115: invokestatic 304	com/tencent/theme/i:a	(Landroid/content/res/Resources;Landroid/util/TypedValue;Ljava/io/InputStream;Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;Landroid/graphics/Rect;Z)Lcom/tencent/theme/b;
    //   1118: astore 9
    //   1120: aload 9
    //   1122: astore_2
    //   1123: goto -197 -> 926
    //   1126: astore 9
    //   1128: aload 8
    //   1130: astore 7
    //   1132: ldc 46
    //   1134: iconst_1
    //   1135: new 246	java/lang/StringBuilder
    //   1138: dup
    //   1139: invokespecial 247	java/lang/StringBuilder:<init>	()V
    //   1142: ldc_w 438
    //   1145: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1148: aload 13
    //   1150: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1153: invokevirtual 264	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1156: aload 16
    //   1158: invokestatic 316	com/tencent/theme/j:a	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   1161: aload 8
    //   1163: astore 7
    //   1165: aload_0
    //   1166: getfield 318	com/tencent/theme/SkinEngine:j	Lcom/tencent/theme/SkinEngineHandler;
    //   1169: aload 9
    //   1171: aload_3
    //   1172: getfield 299	com/tencent/theme/k:d	Ljava/lang/String;
    //   1175: iconst_0
    //   1176: invokeinterface 329 4 0
    //   1181: ifeq +49 -> 1230
    //   1184: aload 8
    //   1186: astore 7
    //   1188: aload 15
    //   1190: iconst_1
    //   1191: putfield 332	android/graphics/BitmapFactory$Options:inJustDecodeBounds	Z
    //   1194: aload 8
    //   1196: astore 7
    //   1198: aload_2
    //   1199: iload_1
    //   1200: aload 10
    //   1202: invokevirtual 430	android/content/res/Resources:openRawResource	(ILandroid/util/TypedValue;)Ljava/io/InputStream;
    //   1205: astore 8
    //   1207: aload 8
    //   1209: astore 7
    //   1211: aload_2
    //   1212: aload 10
    //   1214: aload 8
    //   1216: aload 11
    //   1218: aload 15
    //   1220: aload 14
    //   1222: iconst_1
    //   1223: invokestatic 304	com/tencent/theme/i:a	(Landroid/content/res/Resources;Landroid/util/TypedValue;Ljava/io/InputStream;Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;Landroid/graphics/Rect;Z)Lcom/tencent/theme/b;
    //   1226: astore_2
    //   1227: goto -301 -> 926
    //   1230: aload 8
    //   1232: astore 7
    //   1234: aload 9
    //   1236: athrow
    //   1237: astore_2
    //   1238: ldc 46
    //   1240: iconst_1
    //   1241: new 246	java/lang/StringBuilder
    //   1244: dup
    //   1245: invokespecial 247	java/lang/StringBuilder:<init>	()V
    //   1248: ldc_w 440
    //   1251: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1254: aload 13
    //   1256: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1259: invokevirtual 264	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1262: aload_2
    //   1263: invokestatic 316	com/tencent/theme/j:a	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   1266: getstatic 104	com/tencent/theme/SkinEngine:DEBUG	Z
    //   1269: ifeq +72 -> 1341
    //   1272: new 244	android/content/res/Resources$NotFoundException
    //   1275: dup
    //   1276: new 246	java/lang/StringBuilder
    //   1279: dup
    //   1280: invokespecial 247	java/lang/StringBuilder:<init>	()V
    //   1283: ldc_w 409
    //   1286: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1289: aload_3
    //   1290: getfield 299	com/tencent/theme/k:d	Ljava/lang/String;
    //   1293: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1296: ldc_w 411
    //   1299: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1302: iload_1
    //   1303: invokestatic 259	java/lang/Integer:toHexString	(I)Ljava/lang/String;
    //   1306: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1309: ldc_w 442
    //   1312: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1315: aload 7
    //   1317: invokevirtual 446	java/lang/Object:getClass	()Ljava/lang/Class;
    //   1320: invokevirtual 451	java/lang/Class:getName	()Ljava/lang/String;
    //   1323: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1326: invokevirtual 264	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1329: invokespecial 267	android/content/res/Resources$NotFoundException:<init>	(Ljava/lang/String;)V
    //   1332: astore_3
    //   1333: aload_3
    //   1334: aload_2
    //   1335: invokevirtual 415	android/content/res/Resources$NotFoundException:initCause	(Ljava/lang/Throwable;)Ljava/lang/Throwable;
    //   1338: pop
    //   1339: aload_3
    //   1340: athrow
    //   1341: aload 12
    //   1343: monitorexit
    //   1344: aconst_null
    //   1345: areturn
    //   1346: aconst_null
    //   1347: astore_2
    //   1348: goto -422 -> 926
    //   1351: aconst_null
    //   1352: astore 7
    //   1354: goto -1262 -> 92
    //   1357: aload 8
    //   1359: astore 7
    //   1361: aload 10
    //   1363: astore 9
    //   1365: aload 8
    //   1367: ifnonnull -1275 -> 92
    //   1370: aload 11
    //   1372: astore 7
    //   1374: aload 10
    //   1376: astore 9
    //   1378: goto -1286 -> 92
    //   1381: iconst_0
    //   1382: istore 4
    //   1384: goto -1052 -> 332
    //   1387: iload 4
    //   1389: iconst_2
    //   1390: imul
    //   1391: istore 4
    //   1393: goto -1008 -> 385
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	1396	0	this	SkinEngine
    //   0	1396	1	paramInt	int
    //   0	1396	2	paramResources	Resources
    //   0	1396	3	paramK	k
    //   330	1062	4	i1	int
    //   380	10	5	i2	int
    //   37	724	6	bool	boolean
    //   90	109	7	localB1	b
    //   203	36	7	localOutOfMemoryError1	OutOfMemoryError
    //   338	113	7	localB2	b
    //   453	66	7	localIOException	IOException
    //   570	803	7	localObject1	Object
    //   108	122	8	localOutOfMemoryError2	OutOfMemoryError
    //   420	946	8	localObject2	Object
    //   51	1070	9	localObject3	Object
    //   1126	109	9	localOutOfMemoryError3	OutOfMemoryError
    //   1363	14	9	localObject4	Object
    //   271	1104	10	localObject5	Object
    //   292	1079	11	localObject6	Object
    //   4	1338	12	localTypedValue	TypedValue
    //   22	1233	13	str	String
    //   16	1205	14	localRect	Rect
    //   60	1159	15	localOptions	android.graphics.BitmapFactory.Options
    //   1008	149	16	localOutOfMemoryError4	OutOfMemoryError
    // Exception table:
    //   from	to	target	type
    //   71	92	108	java/lang/OutOfMemoryError
    //   179	200	203	java/lang/OutOfMemoryError
    //   44	71	453	java/io/IOException
    //   71	92	453	java/io/IOException
    //   92	97	453	java/io/IOException
    //   110	179	453	java/io/IOException
    //   179	200	453	java/io/IOException
    //   205	329	453	java/io/IOException
    //   340	382	453	java/io/IOException
    //   392	413	453	java/io/IOException
    //   427	447	453	java/io/IOException
    //   450	453	453	java/io/IOException
    //   9	24	625	finally
    //   29	39	625	finally
    //   44	71	625	finally
    //   71	92	625	finally
    //   92	97	625	finally
    //   102	105	625	finally
    //   110	179	625	finally
    //   179	200	625	finally
    //   205	329	625	finally
    //   340	382	625	finally
    //   392	413	625	finally
    //   427	447	625	finally
    //   450	453	625	finally
    //   455	494	625	finally
    //   494	523	625	finally
    //   523	535	625	finally
    //   540	551	625	finally
    //   556	572	625	finally
    //   572	620	625	finally
    //   620	623	625	finally
    //   626	629	625	finally
    //   631	636	625	finally
    //   639	658	625	finally
    //   658	661	625	finally
    //   664	750	625	finally
    //   750	753	625	finally
    //   755	760	625	finally
    //   765	801	625	finally
    //   801	840	625	finally
    //   845	848	625	finally
    //   851	854	625	finally
    //   857	860	625	finally
    //   862	868	625	finally
    //   868	877	625	finally
    //   877	889	625	finally
    //   893	902	625	finally
    //   906	923	625	finally
    //   930	935	625	finally
    //   943	950	625	finally
    //   954	969	625	finally
    //   969	972	625	finally
    //   975	1006	625	finally
    //   1014	1043	625	finally
    //   1047	1054	625	finally
    //   1058	1077	625	finally
    //   1081	1086	625	finally
    //   1090	1099	625	finally
    //   1103	1120	625	finally
    //   1132	1161	625	finally
    //   1165	1184	625	finally
    //   1188	1194	625	finally
    //   1198	1207	625	finally
    //   1211	1227	625	finally
    //   1234	1237	625	finally
    //   1238	1341	625	finally
    //   1341	1344	625	finally
    //   540	551	663	java/lang/Exception
    //   556	572	663	java/lang/Exception
    //   572	620	663	java/lang/Exception
    //   631	636	663	java/lang/Exception
    //   639	658	663	java/lang/Exception
    //   765	801	850	java/lang/Exception
    //   801	840	856	java/lang/Exception
    //   868	877	974	java/lang/Exception
    //   906	923	1008	java/lang/OutOfMemoryError
    //   1103	1120	1126	java/lang/OutOfMemoryError
    //   893	902	1237	java/io/IOException
    //   906	923	1237	java/io/IOException
    //   930	935	1237	java/io/IOException
    //   943	950	1237	java/io/IOException
    //   954	969	1237	java/io/IOException
    //   1014	1043	1237	java/io/IOException
    //   1047	1054	1237	java/io/IOException
    //   1058	1077	1237	java/io/IOException
    //   1081	1086	1237	java/io/IOException
    //   1090	1099	1237	java/io/IOException
    //   1103	1120	1237	java/io/IOException
    //   1132	1161	1237	java/io/IOException
    //   1165	1184	1237	java/io/IOException
    //   1188	1194	1237	java/io/IOException
    //   1198	1207	1237	java/io/IOException
    //   1211	1227	1237	java/io/IOException
    //   1234	1237	1237	java/io/IOException
  }
  
  private String a(Resources paramResources, String paramString)
  {
    paramString = q + "color/" + paramString;
    try
    {
      if (paramString.startsWith("/asset/"))
      {
        paramResources.getAssets().open(paramString.substring("/asset/".length())).close();
        return paramString;
      }
      boolean bool = new File(paramString).exists();
      if (bool) {
        return paramString;
      }
    }
    catch (IOException paramResources)
    {
      for (;;)
      {
        if (DEBUG) {
          Log.w("SkinEngine", paramResources);
        }
      }
    }
    return null;
    return paramString;
  }
  
  private HashMap<String, Object> a(XmlPullParser paramXmlPullParser)
    throws XmlPullParserException, IOException
  {
    int i1;
    do
    {
      i1 = paramXmlPullParser.next();
    } while ((i1 != 2) && (i1 != 1));
    if (i1 != 2) {
      throw new XmlPullParserException("No start tag found");
    }
    String str1 = paramXmlPullParser.getName();
    HashMap localHashMap = new HashMap();
    if (str1.equals("resources"))
    {
      i1 = paramXmlPullParser.getDepth();
      for (;;)
      {
        int i2 = paramXmlPullParser.next();
        if ((i2 == 1) || ((paramXmlPullParser.getDepth() < i1 + 1) && (i2 == 3))) {
          break;
        }
        if (i2 == 2)
        {
          String str2 = paramXmlPullParser.getName();
          str1 = paramXmlPullParser.getAttributeValue(null, "name");
          if ("color".equals(str2))
          {
            localHashMap.put(str1, Integer.valueOf(Color.parseColor(paramXmlPullParser.nextText())));
          }
          else if ("dimen".equals(str2))
          {
            str2 = paramXmlPullParser.nextText();
            if (str2.endsWith("dp")) {
              localHashMap.put(str1, Float.valueOf(TypedValue.applyDimension(1, Integer.parseInt(str2.substring(0, str2.length() - 2)), mResources.getDisplayMetrics())));
            } else if (str2.endsWith("dip")) {
              localHashMap.put(str1, Float.valueOf(TypedValue.applyDimension(1, Integer.parseInt(str2.substring(0, str2.length() - 3)), mResources.getDisplayMetrics())));
            } else if (str2.endsWith("sp")) {
              localHashMap.put(str1, Float.valueOf(TypedValue.applyDimension(2, Integer.parseInt(str2.substring(0, str2.length() - 2)), mResources.getDisplayMetrics())));
            } else if (str2.endsWith("px")) {
              localHashMap.put(str1, Float.valueOf(TypedValue.applyDimension(0, Integer.parseInt(str2.substring(0, str2.length() - 2)), mResources.getDisplayMetrics())));
            }
          }
          else if ("bool".equals(str2))
          {
            localHashMap.put(str1, Boolean.valueOf("true".equalsIgnoreCase(paramXmlPullParser.nextText())));
          }
          else if ("integer".equals(str2))
          {
            localHashMap.put(str1, Integer.valueOf(Integer.parseInt(paramXmlPullParser.nextText())));
          }
        }
      }
    }
    return localHashMap;
  }
  
  private void a(Resources paramResources, TypedValue paramTypedValue, String paramString, String[] paramArrayOfString, int[] paramArrayOfInt)
  {
    int i1 = 0;
    while (i1 < paramArrayOfInt.length) {
      try
      {
        String str = q + paramArrayOfString[i1] + paramString;
        if (str.startsWith("/asset/"))
        {
          paramResources.getAssets().open(str.substring("/asset/".length())).close();
          string = str;
          density = paramArrayOfInt[i1];
          return;
        }
        if (new File(str).exists())
        {
          string = str;
          density = paramArrayOfInt[i1];
          return;
        }
      }
      catch (IOException localIOException)
      {
        if (DEBUG) {
          Log.w("SkinEngine", localIOException);
        }
        i1 += 1;
      }
    }
    string = null;
    density = 0;
  }
  
  /* Error */
  private void a(Resources paramResources, Class paramClass1, int[] paramArrayOfInt, int paramInt1, Class paramClass2, int paramInt2, File paramFile)
    throws UnSupportPlatformException
  {
    // Byte code:
    //   0: aload_3
    //   1: ifnonnull +12 -> 13
    //   4: aload_2
    //   5: ifnull +90 -> 95
    //   8: iload 4
    //   10: ifeq +85 -> 95
    //   13: ldc -58
    //   15: ldc_w 578
    //   18: invokevirtual 582	java/lang/Class:getDeclaredField	(Ljava/lang/String;)Ljava/lang/reflect/Field;
    //   21: astore 9
    //   23: aload 9
    //   25: iconst_1
    //   26: invokevirtual 421	java/lang/reflect/Field:setAccessible	(Z)V
    //   29: aload 9
    //   31: aload_1
    //   32: invokevirtual 426	java/lang/reflect/Field:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   35: astore 10
    //   37: aload 10
    //   39: instanceof 189
    //   42: ifeq +393 -> 435
    //   45: aload_3
    //   46: ifnull +346 -> 392
    //   49: aload_0
    //   50: new 584	com/tencent/theme/g
    //   53: dup
    //   54: aload_0
    //   55: aload_1
    //   56: aload_3
    //   57: aload 7
    //   59: iconst_1
    //   60: anewarray 189	android/util/LongSparseArray
    //   63: dup
    //   64: iconst_0
    //   65: aload 10
    //   67: checkcast 189	android/util/LongSparseArray
    //   70: aastore
    //   71: invokespecial 587	com/tencent/theme/g:<init>	(Lcom/tencent/theme/SkinEngine;Landroid/content/res/Resources;[ILjava/io/File;[Landroid/util/LongSparseArray;)V
    //   74: putfield 589	com/tencent/theme/SkinEngine:t	Lcom/tencent/theme/g;
    //   77: aload 9
    //   79: aload_1
    //   80: new 591	com/tencent/theme/h
    //   83: dup
    //   84: iconst_0
    //   85: aload_0
    //   86: getfield 589	com/tencent/theme/SkinEngine:t	Lcom/tencent/theme/g;
    //   89: invokespecial 594	com/tencent/theme/h:<init>	(ILcom/tencent/theme/g;)V
    //   92: invokevirtual 425	java/lang/reflect/Field:set	(Ljava/lang/Object;Ljava/lang/Object;)V
    //   95: getstatic 122	android/os/Build$VERSION:SDK_INT	I
    //   98: bipush 23
    //   100: if_icmplt +76 -> 176
    //   103: ldc_w 596
    //   106: getstatic 601	android/os/Build:BRAND	Ljava/lang/String;
    //   109: invokevirtual 552	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   112: istore 8
    //   114: iload 8
    //   116: ifeq +60 -> 176
    //   119: ldc -58
    //   121: ldc_w 603
    //   124: invokevirtual 582	java/lang/Class:getDeclaredField	(Ljava/lang/String;)Ljava/lang/reflect/Field;
    //   127: astore_2
    //   128: aload_2
    //   129: ifnull +471 -> 600
    //   132: aload_2
    //   133: iconst_1
    //   134: invokevirtual 421	java/lang/reflect/Field:setAccessible	(Z)V
    //   137: aload_2
    //   138: aload_0
    //   139: getfield 212	com/tencent/theme/SkinEngine:mResources	Landroid/content/res/Resources;
    //   142: invokevirtual 426	java/lang/reflect/Field:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   145: astore_2
    //   146: aload_2
    //   147: ifnull +399 -> 546
    //   150: aload_2
    //   151: instanceof 605
    //   154: ifeq +392 -> 546
    //   157: aload_2
    //   158: checkcast 605	java/util/Map
    //   161: invokeinterface 608 1 0
    //   166: ldc 46
    //   168: iconst_2
    //   169: ldc_w 610
    //   172: aconst_null
    //   173: invokestatic 612	com/tencent/theme/j:c	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   176: ldc 46
    //   178: iconst_2
    //   179: ldc_w 614
    //   182: aconst_null
    //   183: invokestatic 612	com/tencent/theme/j:c	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   186: aload 5
    //   188: ifnull +64 -> 252
    //   191: iload 6
    //   193: ifeq +59 -> 252
    //   196: ldc -58
    //   198: ldc_w 616
    //   201: invokevirtual 582	java/lang/Class:getDeclaredField	(Ljava/lang/String;)Ljava/lang/reflect/Field;
    //   204: astore_2
    //   205: aload_2
    //   206: iconst_1
    //   207: invokevirtual 421	java/lang/reflect/Field:setAccessible	(Z)V
    //   210: aload_2
    //   211: aload_1
    //   212: invokevirtual 426	java/lang/reflect/Field:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   215: checkcast 189	android/util/LongSparseArray
    //   218: astore_3
    //   219: getstatic 124	com/tencent/theme/SkinEngine:a	Z
    //   222: ifeq +391 -> 613
    //   225: aload_0
    //   226: new 618	com/tencent/theme/f
    //   229: dup
    //   230: aload_0
    //   231: aload_1
    //   232: aload_3
    //   233: aload 5
    //   235: iload 6
    //   237: invokespecial 621	com/tencent/theme/f:<init>	(Lcom/tencent/theme/SkinEngine;Landroid/content/res/Resources;Landroid/util/LongSparseArray;Ljava/lang/Class;I)V
    //   240: putfield 623	com/tencent/theme/SkinEngine:u	Lcom/tencent/theme/d;
    //   243: aload_2
    //   244: aload_1
    //   245: aload_0
    //   246: getfield 623	com/tencent/theme/SkinEngine:u	Lcom/tencent/theme/d;
    //   249: invokevirtual 425	java/lang/reflect/Field:set	(Ljava/lang/Object;Ljava/lang/Object;)V
    //   252: ldc 46
    //   254: iconst_2
    //   255: ldc_w 625
    //   258: aconst_null
    //   259: invokestatic 612	com/tencent/theme/j:c	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   262: aload_1
    //   263: invokevirtual 446	java/lang/Object:getClass	()Ljava/lang/Class;
    //   266: astore_2
    //   267: aload_2
    //   268: invokevirtual 451	java/lang/Class:getName	()Ljava/lang/String;
    //   271: ldc_w 627
    //   274: invokevirtual 119	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   277: ifeq +40 -> 317
    //   280: aload_2
    //   281: ldc_w 629
    //   284: invokevirtual 582	java/lang/Class:getDeclaredField	(Ljava/lang/String;)Ljava/lang/reflect/Field;
    //   287: astore_2
    //   288: aload_2
    //   289: iconst_1
    //   290: invokevirtual 421	java/lang/reflect/Field:setAccessible	(Z)V
    //   293: aload_2
    //   294: aload_1
    //   295: invokevirtual 426	java/lang/reflect/Field:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   298: ifnonnull +19 -> 317
    //   301: aload_2
    //   302: aload_1
    //   303: new 631	android/util/SparseArray
    //   306: dup
    //   307: invokespecial 632	android/util/SparseArray:<init>	()V
    //   310: invokevirtual 425	java/lang/reflect/Field:set	(Ljava/lang/Object;Ljava/lang/Object;)V
    //   313: iconst_1
    //   314: putstatic 126	com/tencent/theme/SkinEngine:IS_PROBLEM_MIUI	Z
    //   317: aload_1
    //   318: invokevirtual 446	java/lang/Object:getClass	()Ljava/lang/Class;
    //   321: ldc_w 634
    //   324: invokevirtual 582	java/lang/Class:getDeclaredField	(Ljava/lang/String;)Ljava/lang/reflect/Field;
    //   327: putstatic 128	com/tencent/theme/SkinEngine:mIconsOfCM	Ljava/lang/reflect/Field;
    //   330: getstatic 128	com/tencent/theme/SkinEngine:mIconsOfCM	Ljava/lang/reflect/Field;
    //   333: iconst_1
    //   334: invokevirtual 421	java/lang/reflect/Field:setAccessible	(Z)V
    //   337: getstatic 128	com/tencent/theme/SkinEngine:mIconsOfCM	Ljava/lang/reflect/Field;
    //   340: aload_1
    //   341: aconst_null
    //   342: invokevirtual 425	java/lang/reflect/Field:set	(Ljava/lang/Object;Ljava/lang/Object;)V
    //   345: getstatic 128	com/tencent/theme/SkinEngine:mIconsOfCM	Ljava/lang/reflect/Field;
    //   348: iconst_0
    //   349: invokevirtual 421	java/lang/reflect/Field:setAccessible	(Z)V
    //   352: aload_1
    //   353: invokevirtual 446	java/lang/Object:getClass	()Ljava/lang/Class;
    //   356: ldc_w 636
    //   359: invokevirtual 582	java/lang/Class:getDeclaredField	(Ljava/lang/String;)Ljava/lang/reflect/Field;
    //   362: putstatic 130	com/tencent/theme/SkinEngine:mComposedIconInfoOfCM	Ljava/lang/reflect/Field;
    //   365: getstatic 130	com/tencent/theme/SkinEngine:mComposedIconInfoOfCM	Ljava/lang/reflect/Field;
    //   368: iconst_1
    //   369: invokevirtual 421	java/lang/reflect/Field:setAccessible	(Z)V
    //   372: getstatic 130	com/tencent/theme/SkinEngine:mComposedIconInfoOfCM	Ljava/lang/reflect/Field;
    //   375: aload_1
    //   376: aconst_null
    //   377: invokevirtual 425	java/lang/reflect/Field:set	(Ljava/lang/Object;Ljava/lang/Object;)V
    //   380: getstatic 130	com/tencent/theme/SkinEngine:mComposedIconInfoOfCM	Ljava/lang/reflect/Field;
    //   383: iconst_0
    //   384: invokevirtual 421	java/lang/reflect/Field:setAccessible	(Z)V
    //   387: iconst_1
    //   388: putstatic 132	com/tencent/theme/SkinEngine:IS_PROBLEM_CM11	Z
    //   391: return
    //   392: aload_0
    //   393: new 584	com/tencent/theme/g
    //   396: dup
    //   397: aload_0
    //   398: aload_1
    //   399: aload_2
    //   400: iload 4
    //   402: aload 7
    //   404: iconst_1
    //   405: anewarray 189	android/util/LongSparseArray
    //   408: dup
    //   409: iconst_0
    //   410: aload 10
    //   412: checkcast 189	android/util/LongSparseArray
    //   415: aastore
    //   416: invokespecial 639	com/tencent/theme/g:<init>	(Lcom/tencent/theme/SkinEngine;Landroid/content/res/Resources;Ljava/lang/Class;ILjava/io/File;[Landroid/util/LongSparseArray;)V
    //   419: putfield 589	com/tencent/theme/SkinEngine:t	Lcom/tencent/theme/g;
    //   422: goto -345 -> 77
    //   425: astore_1
    //   426: new 568	com/tencent/theme/UnSupportPlatformException
    //   429: dup
    //   430: aload_1
    //   431: invokespecial 642	com/tencent/theme/UnSupportPlatformException:<init>	(Ljava/lang/Throwable;)V
    //   434: athrow
    //   435: aload 10
    //   437: instanceof 644
    //   440: ifeq -345 -> 95
    //   443: aload 10
    //   445: checkcast 644	[Landroid/util/LongSparseArray;
    //   448: checkcast 644	[Landroid/util/LongSparseArray;
    //   451: astore 9
    //   453: aload_3
    //   454: ifnull +59 -> 513
    //   457: aload_0
    //   458: new 584	com/tencent/theme/g
    //   461: dup
    //   462: aload_0
    //   463: aload_1
    //   464: aload_3
    //   465: aload 7
    //   467: aload 9
    //   469: invokespecial 587	com/tencent/theme/g:<init>	(Lcom/tencent/theme/SkinEngine;Landroid/content/res/Resources;[ILjava/io/File;[Landroid/util/LongSparseArray;)V
    //   472: putfield 589	com/tencent/theme/SkinEngine:t	Lcom/tencent/theme/g;
    //   475: goto +308 -> 783
    //   478: iload 4
    //   480: aload 9
    //   482: arraylength
    //   483: if_icmpge -388 -> 95
    //   486: aload 9
    //   488: iload 4
    //   490: new 591	com/tencent/theme/h
    //   493: dup
    //   494: iload 4
    //   496: aload_0
    //   497: getfield 589	com/tencent/theme/SkinEngine:t	Lcom/tencent/theme/g;
    //   500: invokespecial 594	com/tencent/theme/h:<init>	(ILcom/tencent/theme/g;)V
    //   503: aastore
    //   504: iload 4
    //   506: iconst_1
    //   507: iadd
    //   508: istore 4
    //   510: goto -32 -> 478
    //   513: aload_0
    //   514: new 584	com/tencent/theme/g
    //   517: dup
    //   518: aload_0
    //   519: aload_1
    //   520: aload_2
    //   521: iload 4
    //   523: aload 7
    //   525: aload 9
    //   527: invokespecial 639	com/tencent/theme/g:<init>	(Lcom/tencent/theme/SkinEngine;Landroid/content/res/Resources;Ljava/lang/Class;ILjava/io/File;[Landroid/util/LongSparseArray;)V
    //   530: putfield 589	com/tencent/theme/SkinEngine:t	Lcom/tencent/theme/g;
    //   533: goto +250 -> 783
    //   536: astore_1
    //   537: new 568	com/tencent/theme/UnSupportPlatformException
    //   540: dup
    //   541: aload_1
    //   542: invokespecial 642	com/tencent/theme/UnSupportPlatformException:<init>	(Ljava/lang/Throwable;)V
    //   545: athrow
    //   546: ldc 46
    //   548: iconst_1
    //   549: new 246	java/lang/StringBuilder
    //   552: dup
    //   553: invokespecial 247	java/lang/StringBuilder:<init>	()V
    //   556: ldc_w 646
    //   559: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   562: aload_2
    //   563: invokevirtual 649	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   566: invokevirtual 264	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   569: aconst_null
    //   570: invokestatic 612	com/tencent/theme/j:c	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   573: goto -397 -> 176
    //   576: astore_2
    //   577: ldc 46
    //   579: iconst_1
    //   580: ldc_w 651
    //   583: aload_2
    //   584: invokestatic 316	com/tencent/theme/j:a	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   587: goto -411 -> 176
    //   590: astore_1
    //   591: new 568	com/tencent/theme/UnSupportPlatformException
    //   594: dup
    //   595: aload_1
    //   596: invokespecial 642	com/tencent/theme/UnSupportPlatformException:<init>	(Ljava/lang/Throwable;)V
    //   599: athrow
    //   600: ldc 46
    //   602: iconst_1
    //   603: ldc_w 653
    //   606: aconst_null
    //   607: invokestatic 612	com/tencent/theme/j:c	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   610: goto -434 -> 176
    //   613: aload_0
    //   614: new 655	com/tencent/theme/d
    //   617: dup
    //   618: aload_0
    //   619: aload_1
    //   620: aload_3
    //   621: aload 5
    //   623: iload 6
    //   625: invokespecial 656	com/tencent/theme/d:<init>	(Lcom/tencent/theme/SkinEngine;Landroid/content/res/Resources;Landroid/util/LongSparseArray;Ljava/lang/Class;I)V
    //   628: putfield 623	com/tencent/theme/SkinEngine:u	Lcom/tencent/theme/d;
    //   631: goto -388 -> 243
    //   634: astore_2
    //   635: ldc -58
    //   637: ldc_w 658
    //   640: invokevirtual 582	java/lang/Class:getDeclaredField	(Ljava/lang/String;)Ljava/lang/reflect/Field;
    //   643: astore_3
    //   644: aload_3
    //   645: iconst_1
    //   646: invokevirtual 421	java/lang/reflect/Field:setAccessible	(Z)V
    //   649: aload_3
    //   650: aload_1
    //   651: invokevirtual 426	java/lang/reflect/Field:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   654: astore 7
    //   656: aload 7
    //   658: instanceof 631
    //   661: ifeq +37 -> 698
    //   664: aload_0
    //   665: new 660	com/tencent/theme/e
    //   668: dup
    //   669: aload_0
    //   670: aload_1
    //   671: aload 7
    //   673: checkcast 631	android/util/SparseArray
    //   676: aload 5
    //   678: iload 6
    //   680: invokespecial 663	com/tencent/theme/e:<init>	(Lcom/tencent/theme/SkinEngine;Landroid/content/res/Resources;Landroid/util/SparseArray;Ljava/lang/Class;I)V
    //   683: putfield 665	com/tencent/theme/SkinEngine:v	Lcom/tencent/theme/e;
    //   686: aload_3
    //   687: aload_1
    //   688: aload_0
    //   689: getfield 665	com/tencent/theme/SkinEngine:v	Lcom/tencent/theme/e;
    //   692: invokevirtual 425	java/lang/reflect/Field:set	(Ljava/lang/Object;Ljava/lang/Object;)V
    //   695: goto -443 -> 252
    //   698: aload 7
    //   700: instanceof 189
    //   703: ifeq +37 -> 740
    //   706: aload_0
    //   707: new 655	com/tencent/theme/d
    //   710: dup
    //   711: aload_0
    //   712: aload_1
    //   713: aload 7
    //   715: checkcast 189	android/util/LongSparseArray
    //   718: aload 5
    //   720: iload 6
    //   722: invokespecial 656	com/tencent/theme/d:<init>	(Lcom/tencent/theme/SkinEngine;Landroid/content/res/Resources;Landroid/util/LongSparseArray;Ljava/lang/Class;I)V
    //   725: putfield 623	com/tencent/theme/SkinEngine:u	Lcom/tencent/theme/d;
    //   728: aload_3
    //   729: aload_1
    //   730: aload_0
    //   731: getfield 623	com/tencent/theme/SkinEngine:u	Lcom/tencent/theme/d;
    //   734: invokevirtual 425	java/lang/reflect/Field:set	(Ljava/lang/Object;Ljava/lang/Object;)V
    //   737: goto -485 -> 252
    //   740: new 568	com/tencent/theme/UnSupportPlatformException
    //   743: dup
    //   744: aload_2
    //   745: invokespecial 642	com/tencent/theme/UnSupportPlatformException:<init>	(Ljava/lang/Throwable;)V
    //   748: athrow
    //   749: astore_2
    //   750: getstatic 104	com/tencent/theme/SkinEngine:DEBUG	Z
    //   753: ifeq +13 -> 766
    //   756: ldc 46
    //   758: ldc_w 667
    //   761: aload_2
    //   762: invokestatic 670	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   765: pop
    //   766: iconst_0
    //   767: putstatic 126	com/tencent/theme/SkinEngine:IS_PROBLEM_MIUI	Z
    //   770: goto -453 -> 317
    //   773: astore_1
    //   774: aconst_null
    //   775: putstatic 128	com/tencent/theme/SkinEngine:mIconsOfCM	Ljava/lang/reflect/Field;
    //   778: aconst_null
    //   779: putstatic 130	com/tencent/theme/SkinEngine:mComposedIconInfoOfCM	Ljava/lang/reflect/Field;
    //   782: return
    //   783: iconst_0
    //   784: istore 4
    //   786: goto -308 -> 478
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	789	0	this	SkinEngine
    //   0	789	1	paramResources	Resources
    //   0	789	2	paramClass1	Class
    //   0	789	3	paramArrayOfInt	int[]
    //   0	789	4	paramInt1	int
    //   0	789	5	paramClass2	Class
    //   0	789	6	paramInt2	int
    //   0	789	7	paramFile	File
    //   112	3	8	bool	boolean
    //   21	505	9	localObject1	Object
    //   35	409	10	localObject2	Object
    // Exception table:
    //   from	to	target	type
    //   13	45	425	java/lang/IllegalArgumentException
    //   49	77	425	java/lang/IllegalArgumentException
    //   77	95	425	java/lang/IllegalArgumentException
    //   95	114	425	java/lang/IllegalArgumentException
    //   119	128	425	java/lang/IllegalArgumentException
    //   132	146	425	java/lang/IllegalArgumentException
    //   150	176	425	java/lang/IllegalArgumentException
    //   176	186	425	java/lang/IllegalArgumentException
    //   196	243	425	java/lang/IllegalArgumentException
    //   243	252	425	java/lang/IllegalArgumentException
    //   252	262	425	java/lang/IllegalArgumentException
    //   392	422	425	java/lang/IllegalArgumentException
    //   435	453	425	java/lang/IllegalArgumentException
    //   457	475	425	java/lang/IllegalArgumentException
    //   478	504	425	java/lang/IllegalArgumentException
    //   513	533	425	java/lang/IllegalArgumentException
    //   546	573	425	java/lang/IllegalArgumentException
    //   577	587	425	java/lang/IllegalArgumentException
    //   600	610	425	java/lang/IllegalArgumentException
    //   613	631	425	java/lang/IllegalArgumentException
    //   635	695	425	java/lang/IllegalArgumentException
    //   698	737	425	java/lang/IllegalArgumentException
    //   740	749	425	java/lang/IllegalArgumentException
    //   13	45	536	java/lang/NoSuchFieldException
    //   49	77	536	java/lang/NoSuchFieldException
    //   77	95	536	java/lang/NoSuchFieldException
    //   95	114	536	java/lang/NoSuchFieldException
    //   119	128	536	java/lang/NoSuchFieldException
    //   132	146	536	java/lang/NoSuchFieldException
    //   150	176	536	java/lang/NoSuchFieldException
    //   176	186	536	java/lang/NoSuchFieldException
    //   196	243	536	java/lang/NoSuchFieldException
    //   243	252	536	java/lang/NoSuchFieldException
    //   252	262	536	java/lang/NoSuchFieldException
    //   392	422	536	java/lang/NoSuchFieldException
    //   435	453	536	java/lang/NoSuchFieldException
    //   457	475	536	java/lang/NoSuchFieldException
    //   478	504	536	java/lang/NoSuchFieldException
    //   513	533	536	java/lang/NoSuchFieldException
    //   546	573	536	java/lang/NoSuchFieldException
    //   577	587	536	java/lang/NoSuchFieldException
    //   600	610	536	java/lang/NoSuchFieldException
    //   613	631	536	java/lang/NoSuchFieldException
    //   635	695	536	java/lang/NoSuchFieldException
    //   698	737	536	java/lang/NoSuchFieldException
    //   740	749	536	java/lang/NoSuchFieldException
    //   119	128	576	java/lang/Throwable
    //   132	146	576	java/lang/Throwable
    //   150	176	576	java/lang/Throwable
    //   546	573	576	java/lang/Throwable
    //   600	610	576	java/lang/Throwable
    //   13	45	590	java/lang/IllegalAccessException
    //   49	77	590	java/lang/IllegalAccessException
    //   77	95	590	java/lang/IllegalAccessException
    //   95	114	590	java/lang/IllegalAccessException
    //   119	128	590	java/lang/IllegalAccessException
    //   132	146	590	java/lang/IllegalAccessException
    //   150	176	590	java/lang/IllegalAccessException
    //   176	186	590	java/lang/IllegalAccessException
    //   196	243	590	java/lang/IllegalAccessException
    //   243	252	590	java/lang/IllegalAccessException
    //   252	262	590	java/lang/IllegalAccessException
    //   392	422	590	java/lang/IllegalAccessException
    //   435	453	590	java/lang/IllegalAccessException
    //   457	475	590	java/lang/IllegalAccessException
    //   478	504	590	java/lang/IllegalAccessException
    //   513	533	590	java/lang/IllegalAccessException
    //   546	573	590	java/lang/IllegalAccessException
    //   577	587	590	java/lang/IllegalAccessException
    //   600	610	590	java/lang/IllegalAccessException
    //   613	631	590	java/lang/IllegalAccessException
    //   635	695	590	java/lang/IllegalAccessException
    //   698	737	590	java/lang/IllegalAccessException
    //   740	749	590	java/lang/IllegalAccessException
    //   196	243	634	java/lang/Exception
    //   243	252	634	java/lang/Exception
    //   613	631	634	java/lang/Exception
    //   262	317	749	java/lang/Exception
    //   317	391	773	java/lang/Exception
  }
  
  private void a(b paramB)
  {
    Object localObject1 = i;
    Object localObject2 = b;
    if (q != null)
    {
      a(mResources, b, d, c[s], d[s]);
      if (b.string != null)
      {
        b = b.string.toString();
        c = b.density;
        if ((localObject2 != null) || (b != null) || (d.endsWith(".xml"))) {
          break label127;
        }
      }
    }
    label127:
    label207:
    label353:
    do
    {
      do
      {
        do
        {
          do
          {
            return;
            b = null;
            break;
            b = null;
            break;
            if (!(paramB instanceof SkinnableBitmapDrawable.a)) {
              break label353;
            }
            paramB = (SkinnableBitmapDrawable.a)paramB;
            localObject2 = a(a, mResources, (k)localObject1);
            if (localObject2 != null) {
              break label207;
            }
          } while (!DEBUG);
          throw new NullPointerException("loadImage failed, file path: " + b + " , resource name:" + d);
          if ((DEBUG) && ((localObject2 instanceof SkinnableNinePatchDrawable.a))) {
            throw new IllegalArgumentException("error image, the resource Image is Bitmap, but the skin Image is 9-path, file path: " + b + " , resource name:" + d);
          }
          localObject1 = (SkinnableBitmapDrawable.a)localObject2;
          l = l;
          e = e;
          j = j;
          k = k;
        } while ((!s) && (!s));
        n = n;
        o = o;
        p = p;
        q = q;
        s = true;
        return;
      } while (!(paramB instanceof SkinnableNinePatchDrawable.a));
      paramB = (SkinnableNinePatchDrawable.a)paramB;
      localObject2 = a(a, mResources, (k)localObject1);
      if (localObject2 != null) {
        break label433;
      }
    } while (!DEBUG);
    throw new NullPointerException("loadImage failed, file path: " + b + " , resource name:" + d);
    label433:
    if ((DEBUG) && ((localObject2 instanceof SkinnableBitmapDrawable.a))) {
      throw new IllegalArgumentException("error image, the resource Image is 9-path, but the skin Image is Bitmap, did you compiled the 9-pathflie to apk and un-zip it? file path: " + b + " , resource name:" + d);
    }
    localObject1 = (SkinnableNinePatchDrawable.a)localObject2;
    k = k;
    l = l;
    n = m;
    m = m;
    r = r;
    j = j;
  }
  
  private void a(boolean paramBoolean)
  {
    if (w == null) {}
    try
    {
      XmlResourceParser localXmlResourceParser = mResources.getAssets().openXmlResourceParser("res/xml/theme_config.xml");
      w = a(localXmlResourceParser);
      localXmlResourceParser.close();
      if (x == null)
      {
        if (q == null) {
          x = new HashMap();
        }
      }
      else {
        return;
      }
    }
    catch (XmlPullParserException localXmlPullParserException1)
    {
      localObject = new Resources.NotFoundException("wrong xml config file: res/xml/theme_config.xml");
      ((Resources.NotFoundException)localObject).initCause(localXmlPullParserException1);
      throw ((Throwable)localObject);
    }
    catch (IOException localIOException1)
    {
      Object localObject;
      for (;;)
      {
        w = new HashMap();
      }
      if (paramBoolean) {}
      try
      {
        a localA = new a();
        localObject = new FileInputStream(new File(q, "xml/theme_config.xml"));
        localA.setInput((InputStream)localObject, "UTF-8");
        x = a(localA);
        ((FileInputStream)localObject).close();
        return;
      }
      catch (XmlPullParserException localXmlPullParserException2)
      {
        for (;;)
        {
          localObject = new Resources.NotFoundException("wrong theme xml config file: xml/theme_config.xml");
          ((Resources.NotFoundException)localObject).initCause(localXmlPullParserException2);
          throw ((Throwable)localObject);
          XmlPullParser localXmlPullParser = Xml.newPullParser();
        }
      }
      catch (IOException localIOException2)
      {
        x = new HashMap();
      }
    }
  }
  
  private SkinnableColorStateList b(int paramInt, Resources paramResources, k paramK)
  {
    Object localObject;
    synchronized (b)
    {
      localObject = b;
      if (localObject != null)
      {
        bool = ((String)localObject).endsWith(".xml");
        if (bool)
        {
          try
          {
            SkinnableColorStateList localSkinnableColorStateList = i.a(this, paramResources, new File((String)localObject), n);
            return localSkinnableColorStateList;
          }
          catch (Exception localException)
          {
            if (!DEBUG) {
              break label126;
            }
          }
          paramResources = new Resources.NotFoundException("File " + (String)localObject + " from Skin ColorState resource ID #0x" + Integer.toHexString(paramInt));
          paramResources.initCause(localException);
          throw paramResources;
        }
      }
    }
    label126:
    paramK = d;
    boolean bool = paramK.endsWith(".xml");
    if (bool) {
      try
      {
        localObject = a(paramInt, b);
        paramResources = SkinnableColorStateList.createFromXml(this, paramResources, (XmlPullParser)localObject, true);
        ((XmlResourceParser)localObject).close();
        return paramResources;
      }
      catch (Exception paramResources)
      {
        paramK = new Resources.NotFoundException("File " + paramK + " from Skin ColorList list resource ID #0x" + Integer.toHexString(paramInt));
        paramK.initCause(paramResources);
        throw paramK;
      }
    }
    throw new Resources.NotFoundException("File " + paramK + " from Skin ColorList resource ID #0x" + Integer.toHexString(paramInt) + ": .xml extension required");
  }
  
  private InputStream b(Resources paramResources, String paramString)
    throws IOException, FileNotFoundException
  {
    if (paramString.startsWith("/asset/"))
    {
      paramString = paramString.substring("/asset/".length());
      return paramResources.getAssets().open(paramString);
    }
    return new FileInputStream(new File(paramString));
  }
  
  @TargetApi(16)
  private void b(Context paramContext)
  {
    paramContext = b;
    int i1 = 0;
    for (;;)
    {
      k localK;
      try
      {
        if (i1 >= p.size()) {
          break label150;
        }
        SkinnableColorStateList localSkinnableColorStateList = (SkinnableColorStateList)((WeakReference)p.valueAt(i1)).get();
        if (localSkinnableColorStateList == null) {
          break label153;
        }
        localK = skinData;
        String str1 = b;
        if (q != null)
        {
          String str2 = a(mResources, d);
          if (str2 != null)
          {
            b = str2;
            if ((str1 != null) || (b != null)) {
              break label128;
            }
            break label153;
          }
          b = null;
          continue;
        }
        b = null;
      }
      finally {}
      continue;
      label128:
      localObject.a(b(a, mResources, localK));
      break label153;
      label150:
      return;
      label153:
      i1 += 1;
    }
  }
  
  @TargetApi(16)
  private void c(Context arg1)
  {
    for (;;)
    {
      int i1;
      synchronized (b)
      {
        ArrayList localArrayList = new ArrayList();
        i1 = 0;
        if (i1 < o.size())
        {
          b localB = (b)((WeakReference)o.valueAt(i1)).get();
          if (localB == null) {
            break label126;
          }
          if (i.d.endsWith(".xml")) {
            localArrayList.add(localB);
          } else {
            a(localB);
          }
        }
      }
      Iterator localIterator = localObject.iterator();
      while (localIterator.hasNext()) {
        a((b)localIterator.next());
      }
      return;
      label126:
      i1 += 1;
    }
  }
  
  public static SkinEngine getInstances()
  {
    try
    {
      if (l == null) {
        l = new SkinEngine();
      }
      SkinEngine localSkinEngine = l;
      return localSkinEngine;
    }
    finally {}
  }
  
  public static void init(Context paramContext, Class paramClass1, int paramInt1, Class paramClass2, int paramInt2, File paramFile)
    throws UnSupportPlatformException
  {
    Object localObject = new StringBuilder().append("init cacheFile:");
    if (paramFile == null) {}
    for (boolean bool = true;; bool = false)
    {
      j.c("SkinEngine", 2, bool, null);
      localObject = getInstances();
      Resources localResources = paramContext.getResources();
      mResources = localResources;
      isSupportPlatform(paramContext, localResources);
      s = a(mResources);
      paramContext.getApplicationContext().registerReceiver(k, new IntentFilter("com.tencent.qplus.THEME_UPDATE"), "com.tencent.msg.permission.pushnotify", null);
      ((SkinEngine)localObject).a(localResources, paramClass1, null, paramInt1, paramClass2, paramInt2, paramFile);
      paramContext = paramContext.getSharedPreferences("theme", 4);
      q = paramContext.getString("theme_root", null);
      n = paramContext.getBoolean("complied", true);
      return;
    }
  }
  
  public static void init(Context paramContext, int[] paramArrayOfInt, Class paramClass, int paramInt, File paramFile)
    throws UnSupportPlatformException
  {
    SkinEngine localSkinEngine = getInstances();
    Resources localResources = paramContext.getResources();
    mResources = localResources;
    isSupportPlatform(paramContext, localResources);
    s = a(mResources);
    paramContext.getApplicationContext().registerReceiver(k, new IntentFilter("com.tencent.qplus.THEME_UPDATE"), "com.tencent.msg.permission.pushnotify", null);
    localSkinEngine.a(localResources, null, paramArrayOfInt, 0, paramClass, paramInt, paramFile);
    paramContext = paramContext.getSharedPreferences("theme", 4);
    q = paramContext.getString("theme_root", null);
    n = paramContext.getBoolean("complied", true);
  }
  
  public static void invalidateAll(View paramView)
  {
    if (paramView == null) {
      return;
    }
    int i2;
    int i1;
    if ((paramView instanceof ViewGroup))
    {
      localObject = (ViewGroup)paramView;
      i2 = ((ViewGroup)localObject).getChildCount();
      i1 = 0;
      while (i1 < i2)
      {
        invalidateAll(((ViewGroup)localObject).getChildAt(i1));
        i1 += 1;
      }
    }
    Object localObject = paramView.getBackground();
    Rect localRect;
    if (localObject != null)
    {
      if (!(localObject instanceof DrawableContainer)) {
        break label270;
      }
      localRect = new Rect();
      ((Drawable)localObject).getPadding(localRect);
      if ((left == paramView.getPaddingLeft()) && (right == paramView.getPaddingRight()) && (top == paramView.getPaddingTop()) && (bottom == paramView.getPaddingBottom()))
      {
        SkinnableActivityProcesser.a((Drawable)localObject);
        paramView.setBackgroundDrawable(null);
        paramView.setBackgroundDrawable((Drawable)localObject);
      }
    }
    else
    {
      if ((paramView instanceof SkinnableView)) {
        ((SkinnableView)paramView).onThemeChanged();
      }
      if (!(paramView instanceof ImageView)) {
        break label428;
      }
      localObject = ((ImageView)paramView).getDrawable();
      SkinnableActivityProcesser.a((Drawable)localObject);
      ((ImageView)paramView).setImageDrawable(null);
      ((ImageView)paramView).setImageDrawable((Drawable)localObject);
    }
    for (;;)
    {
      paramView.destroyDrawingCache();
      paramView.refreshDrawableState();
      paramView.invalidate();
      paramView.requestLayout();
      return;
      i1 = paramView.getPaddingTop();
      i2 = paramView.getPaddingBottom();
      int i3 = paramView.getPaddingLeft();
      int i4 = paramView.getPaddingRight();
      SkinnableActivityProcesser.a((Drawable)localObject);
      paramView.setBackgroundDrawable(null);
      paramView.setBackgroundDrawable((Drawable)localObject);
      paramView.setPadding(i3, i1, i4, i2);
      break;
      label270:
      if ((localObject instanceof SkinnableNinePatchDrawable))
      {
        localRect = new Rect();
        if ((((SkinnableNinePatchDrawable)localObject).a(localRect)) && (left == paramView.getPaddingLeft()) && (right == paramView.getPaddingRight()) && (top == paramView.getPaddingTop()) && (bottom == paramView.getPaddingBottom()))
        {
          paramView.setBackgroundDrawable(null);
          paramView.setBackgroundDrawable((Drawable)localObject);
          break;
        }
        i1 = paramView.getPaddingTop();
        i2 = paramView.getPaddingBottom();
        i3 = paramView.getPaddingLeft();
        i4 = paramView.getPaddingRight();
        paramView.setBackgroundDrawable(null);
        paramView.setBackgroundDrawable((Drawable)localObject);
        paramView.setPadding(i3, i1, i4, i2);
        break;
      }
      if (!(localObject instanceof SkinnableBitmapDrawable)) {
        break;
      }
      paramView.setBackgroundDrawable(null);
      paramView.setBackgroundDrawable((Drawable)localObject);
      break;
      label428:
      if ((paramView instanceof TextView))
      {
        localObject = ((TextView)paramView).getCompoundDrawables();
        if ((localObject[0] != null) || (localObject[1] != null) || (localObject[2] != null) || (localObject[3] != null))
        {
          ((TextView)paramView).setCompoundDrawables(null, null, null, null);
          ((TextView)paramView).setCompoundDrawablesWithIntrinsicBounds(localObject[0], localObject[1], localObject[2], localObject[3]);
        }
      }
    }
  }
  
  public static void isSupportPlatform(Context paramContext, Resources paramResources)
    throws UnSupportPlatformException
  {
    try
    {
      localObject = Resources.class.getDeclaredField("sPreloadedDrawables");
      ((Field)localObject).setAccessible(true);
      localObject = ((Field)localObject).get(paramResources);
      if ((!(localObject instanceof LongSparseArray)) && (!(localObject instanceof LongSparseArray[]))) {
        throw new UnSupportPlatformException("sPreloadedDrawables is not LongSparseArray");
      }
    }
    catch (IllegalArgumentException paramContext)
    {
      Object localObject;
      throw new UnSupportPlatformException(paramContext);
      try
      {
        localObject = Resources.class.getDeclaredField("sPreloadedColorStateLists");
        ((Field)localObject).setAccessible(true);
        if (!(((Field)localObject).get(paramResources) instanceof LongSparseArray)) {
          throw new UnSupportPlatformException("sPreloadedColorStateLists is not LongSparseArray");
        }
      }
      catch (Exception localException)
      {
        Field localField = Resources.class.getDeclaredField("mPreloadedColorStateLists");
        localField.setAccessible(true);
        paramResources = localField.get(paramResources);
        boolean bool = paramResources instanceof SparseArray;
        if (bool) {}
        while (m.a(paramContext, "ro.lewa.version").equalsIgnoreCase("LeWa_OS6.0_14.10.22"))
        {
          throw new UnSupportPlatformException("lewa is not supported");
          if (!(paramResources instanceof LongSparseArray)) {
            throw new UnSupportPlatformException(localException);
          }
        }
      }
    }
    catch (NoSuchFieldException paramContext)
    {
      throw new UnSupportPlatformException(paramContext);
    }
    catch (IllegalAccessException paramContext)
    {
      throw new UnSupportPlatformException(paramContext);
    }
  }
  
  public static void setSKLog(ISkinEngineLog paramISkinEngineLog)
  {
    j.a = paramISkinEngineLog;
    j.c("SkinEngine", 2, "set ISkinEngineLog ok", null);
  }
  
  @TargetApi(16)
  Drawable.ConstantState a(int paramInt)
  {
    synchronized (b)
    {
      Object localObject1 = (WeakReference)o.get(paramInt);
      if (localObject1 != null)
      {
        localObject1 = (Drawable.ConstantState)((WeakReference)localObject1).get();
        if (localObject1 != null) {
          return localObject1;
        }
        o.delete(paramInt);
      }
      boolean bool = IS_PROBLEM_CM11;
      if (bool) {
        try
        {
          mIconsOfCM.setAccessible(true);
          mIconsOfCM.set(mResources, null);
          mComposedIconInfoOfCM.setAccessible(true);
          mComposedIconInfoOfCM.set(mResources, null);
          mResources.getValue(paramInt, b, true);
        }
        catch (Exception localException1)
        {
          try
          {
            mIconsOfCM.setAccessible(true);
            mComposedIconInfoOfCM.setAccessible(true);
            if (mIconsOfCM.get(mResources) == null) {
              break label159;
            }
            localObject1 = mComposedIconInfoOfCM.get(mResources);
            if (localObject1 == null) {
              break label159;
            }
            return null;
          }
          catch (Exception localException2)
          {
            return null;
          }
          localException1 = localException1;
          return null;
        }
      }
      label159:
      Object localObject3 = b.string.toString();
      k localK = new k();
      a = paramInt;
      d = ((String)localObject3).substring(((String)localObject3).lastIndexOf("/") + 1);
      if (q != null)
      {
        a(mResources, b, d, c[s], d[s]);
        if (b.string != null)
        {
          b = b.string.toString();
          c = b.density;
        }
      }
      localObject3 = a(paramInt, mResources, localK);
      if (localObject3 != null)
      {
        i = localK;
        o.put(paramInt, new WeakReference(localObject3));
      }
      return localObject3;
    }
  }
  
  /* Error */
  b a(Resources paramResources, k paramK, android.graphics.BitmapFactory.Options paramOptions, Rect paramRect, boolean paramBoolean1, BackupForOOMData paramBackupForOOMData, int paramInt, boolean paramBoolean2)
  {
    // Byte code:
    //   0: iload 8
    //   2: ifeq +411 -> 413
    //   5: aload 6
    //   7: ifnull +406 -> 413
    //   10: new 173	android/util/TypedValue
    //   13: dup
    //   14: invokespecial 174	android/util/TypedValue:<init>	()V
    //   17: astore_2
    //   18: aload_0
    //   19: getfield 212	com/tencent/theme/SkinEngine:mResources	Landroid/content/res/Resources;
    //   22: aload 6
    //   24: getfield 1027	com/tencent/theme/SkinEngine$BackupForOOMData:backFileResId	I
    //   27: aload_2
    //   28: iconst_1
    //   29: invokevirtual 216	android/content/res/Resources:getValue	(ILandroid/util/TypedValue;Z)V
    //   32: aload_2
    //   33: getfield 230	android/util/TypedValue:string	Ljava/lang/CharSequence;
    //   36: invokeinterface 236 1 0
    //   41: astore 9
    //   43: new 278	com/tencent/theme/k
    //   46: dup
    //   47: invokespecial 1013	com/tencent/theme/k:<init>	()V
    //   50: astore_3
    //   51: aload_3
    //   52: aload 6
    //   54: getfield 1027	com/tencent/theme/SkinEngine$BackupForOOMData:backFileResId	I
    //   57: putfield 685	com/tencent/theme/k:a	I
    //   60: aload_3
    //   61: aload 9
    //   63: aload 9
    //   65: ldc_w 1015
    //   68: invokevirtual 1018	java/lang/String:lastIndexOf	(Ljava/lang/String;)I
    //   71: iconst_1
    //   72: iadd
    //   73: invokevirtual 466	java/lang/String:substring	(I)Ljava/lang/String;
    //   76: putfield 299	com/tencent/theme/k:d	Ljava/lang/String;
    //   79: aload_0
    //   80: getfield 454	com/tencent/theme/SkinEngine:q	Ljava/lang/String;
    //   83: ifnull +60 -> 143
    //   86: aload_0
    //   87: aload_0
    //   88: getfield 212	com/tencent/theme/SkinEngine:mResources	Landroid/content/res/Resources;
    //   91: aload_2
    //   92: aload_3
    //   93: getfield 299	com/tencent/theme/k:d	Ljava/lang/String;
    //   96: getstatic 150	com/tencent/theme/SkinEngine:c	[[Ljava/lang/String;
    //   99: aload_0
    //   100: getfield 182	com/tencent/theme/SkinEngine:s	I
    //   103: aaload
    //   104: getstatic 154	com/tencent/theme/SkinEngine:d	[[I
    //   107: aload_0
    //   108: getfield 182	com/tencent/theme/SkinEngine:s	I
    //   111: aaload
    //   112: invokespecial 681	com/tencent/theme/SkinEngine:a	(Landroid/content/res/Resources;Landroid/util/TypedValue;Ljava/lang/String;[Ljava/lang/String;[I)V
    //   115: aload_2
    //   116: getfield 230	android/util/TypedValue:string	Ljava/lang/CharSequence;
    //   119: ifnull +24 -> 143
    //   122: aload_3
    //   123: aload_2
    //   124: getfield 230	android/util/TypedValue:string	Ljava/lang/CharSequence;
    //   127: invokeinterface 236 1 0
    //   132: putfield 280	com/tencent/theme/k:b	Ljava/lang/String;
    //   135: aload_3
    //   136: aload_2
    //   137: getfield 565	android/util/TypedValue:density	I
    //   140: putfield 294	com/tencent/theme/k:c	I
    //   143: aload_3
    //   144: getfield 280	com/tencent/theme/k:b	Ljava/lang/String;
    //   147: ifnull +114 -> 261
    //   150: new 275	android/graphics/Rect
    //   153: dup
    //   154: invokespecial 276	android/graphics/Rect:<init>	()V
    //   157: astore_2
    //   158: new 291	android/graphics/BitmapFactory$Options
    //   161: dup
    //   162: invokespecial 292	android/graphics/BitmapFactory$Options:<init>	()V
    //   165: astore 9
    //   167: aload 9
    //   169: aload_3
    //   170: getfield 294	com/tencent/theme/k:c	I
    //   173: putfield 297	android/graphics/BitmapFactory$Options:inDensity	I
    //   176: aload 9
    //   178: aload 6
    //   180: getfield 1031	com/tencent/theme/SkinEngine$BackupForOOMData:inPreferredConfig	Landroid/graphics/Bitmap$Config;
    //   183: putfield 1032	android/graphics/BitmapFactory$Options:inPreferredConfig	Landroid/graphics/Bitmap$Config;
    //   186: aload_0
    //   187: aload_1
    //   188: aload_3
    //   189: getfield 280	com/tencent/theme/k:b	Ljava/lang/String;
    //   192: invokespecial 289	com/tencent/theme/SkinEngine:b	(Landroid/content/res/Resources;Ljava/lang/String;)Ljava/io/InputStream;
    //   195: astore 4
    //   197: aload_1
    //   198: aconst_null
    //   199: aload 4
    //   201: aload_3
    //   202: getfield 299	com/tencent/theme/k:d	Ljava/lang/String;
    //   205: aload 9
    //   207: aload_2
    //   208: aload_0
    //   209: getfield 180	com/tencent/theme/SkinEngine:n	Z
    //   212: invokestatic 304	com/tencent/theme/i:a	(Landroid/content/res/Resources;Landroid/util/TypedValue;Ljava/io/InputStream;Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;Landroid/graphics/Rect;Z)Lcom/tencent/theme/b;
    //   215: astore_2
    //   216: aload_2
    //   217: astore_1
    //   218: aload 4
    //   220: invokevirtual 309	java/io/InputStream:close	()V
    //   223: aload_2
    //   224: areturn
    //   225: astore_1
    //   226: ldc 46
    //   228: iconst_1
    //   229: new 246	java/lang/StringBuilder
    //   232: dup
    //   233: invokespecial 247	java/lang/StringBuilder:<init>	()V
    //   236: ldc_w 1034
    //   239: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   242: aload_3
    //   243: getfield 280	com/tencent/theme/k:b	Ljava/lang/String;
    //   246: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   249: invokevirtual 264	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   252: aload_1
    //   253: invokestatic 316	com/tencent/theme/j:a	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   256: aconst_null
    //   257: astore_2
    //   258: goto -42 -> 216
    //   261: aload_1
    //   262: aload 6
    //   264: getfield 1027	com/tencent/theme/SkinEngine$BackupForOOMData:backFileResId	I
    //   267: aload_2
    //   268: invokevirtual 430	android/content/res/Resources:openRawResource	(ILandroid/util/TypedValue;)Ljava/io/InputStream;
    //   271: astore_3
    //   272: aload_2
    //   273: getfield 230	android/util/TypedValue:string	Ljava/lang/CharSequence;
    //   276: invokeinterface 236 1 0
    //   281: astore 9
    //   283: new 291	android/graphics/BitmapFactory$Options
    //   286: dup
    //   287: invokespecial 292	android/graphics/BitmapFactory$Options:<init>	()V
    //   290: astore 10
    //   292: aload_1
    //   293: aload_2
    //   294: aload_3
    //   295: aload 9
    //   297: aload 10
    //   299: aload 4
    //   301: iconst_1
    //   302: invokestatic 304	com/tencent/theme/i:a	(Landroid/content/res/Resources;Landroid/util/TypedValue;Ljava/io/InputStream;Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;Landroid/graphics/Rect;Z)Lcom/tencent/theme/b;
    //   305: astore_2
    //   306: aload_2
    //   307: astore_1
    //   308: aload_3
    //   309: invokevirtual 309	java/io/InputStream:close	()V
    //   312: aload_2
    //   313: areturn
    //   314: astore_3
    //   315: aload_2
    //   316: astore_1
    //   317: ldc 46
    //   319: iconst_1
    //   320: ldc_w 1036
    //   323: aload_3
    //   324: invokestatic 316	com/tencent/theme/j:a	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   327: aload_2
    //   328: areturn
    //   329: astore_2
    //   330: ldc 46
    //   332: iconst_1
    //   333: ldc_w 1038
    //   336: aload_2
    //   337: invokestatic 316	com/tencent/theme/j:a	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   340: aload_1
    //   341: areturn
    //   342: astore_1
    //   343: ldc 46
    //   345: iconst_1
    //   346: new 246	java/lang/StringBuilder
    //   349: dup
    //   350: invokespecial 247	java/lang/StringBuilder:<init>	()V
    //   353: ldc_w 1040
    //   356: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   359: aload 6
    //   361: getfield 1027	com/tencent/theme/SkinEngine$BackupForOOMData:backFileResId	I
    //   364: invokevirtual 1043	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   367: invokevirtual 264	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   370: aload_1
    //   371: invokestatic 316	com/tencent/theme/j:a	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   374: aconst_null
    //   375: areturn
    //   376: astore_1
    //   377: ldc 46
    //   379: iconst_1
    //   380: new 246	java/lang/StringBuilder
    //   383: dup
    //   384: invokespecial 247	java/lang/StringBuilder:<init>	()V
    //   387: ldc_w 1045
    //   390: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   393: aload 6
    //   395: getfield 1027	com/tencent/theme/SkinEngine$BackupForOOMData:backFileResId	I
    //   398: invokevirtual 1043	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   401: invokevirtual 264	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   404: aload_1
    //   405: invokestatic 316	com/tencent/theme/j:a	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   408: aconst_null
    //   409: astore_2
    //   410: goto -104 -> 306
    //   413: aload_0
    //   414: aload_1
    //   415: aload_2
    //   416: getfield 280	com/tencent/theme/k:b	Ljava/lang/String;
    //   419: invokespecial 289	com/tencent/theme/SkinEngine:b	(Landroid/content/res/Resources;Ljava/lang/String;)Ljava/io/InputStream;
    //   422: astore 9
    //   424: aload_3
    //   425: iconst_0
    //   426: putfield 332	android/graphics/BitmapFactory$Options:inJustDecodeBounds	Z
    //   429: aload_3
    //   430: aload 6
    //   432: getfield 1031	com/tencent/theme/SkinEngine$BackupForOOMData:inPreferredConfig	Landroid/graphics/Bitmap$Config;
    //   435: putfield 1032	android/graphics/BitmapFactory$Options:inPreferredConfig	Landroid/graphics/Bitmap$Config;
    //   438: aload_3
    //   439: iload 7
    //   441: putfield 1048	android/graphics/BitmapFactory$Options:inSampleSize	I
    //   444: aload_1
    //   445: aconst_null
    //   446: aload 9
    //   448: aload_2
    //   449: getfield 299	com/tencent/theme/k:d	Ljava/lang/String;
    //   452: aload_3
    //   453: aload 4
    //   455: aload_0
    //   456: getfield 180	com/tencent/theme/SkinEngine:n	Z
    //   459: invokestatic 304	com/tencent/theme/i:a	(Landroid/content/res/Resources;Landroid/util/TypedValue;Ljava/io/InputStream;Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;Landroid/graphics/Rect;Z)Lcom/tencent/theme/b;
    //   462: astore_1
    //   463: aload_1
    //   464: astore_2
    //   465: aload_2
    //   466: astore_1
    //   467: aload 9
    //   469: invokevirtual 309	java/io/InputStream:close	()V
    //   472: aload_2
    //   473: areturn
    //   474: astore_1
    //   475: getstatic 104	com/tencent/theme/SkinEngine:DEBUG	Z
    //   478: ifeq +38 -> 516
    //   481: ldc 46
    //   483: new 246	java/lang/StringBuilder
    //   486: dup
    //   487: invokespecial 247	java/lang/StringBuilder:<init>	()V
    //   490: ldc_w 1050
    //   493: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   496: aload_2
    //   497: getfield 280	com/tencent/theme/k:b	Ljava/lang/String;
    //   500: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   503: ldc_w 1052
    //   506: invokevirtual 253	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   509: invokevirtual 264	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   512: invokestatic 374	android/util/Log:w	(Ljava/lang/String;Ljava/lang/String;)I
    //   515: pop
    //   516: aconst_null
    //   517: astore_2
    //   518: goto -53 -> 465
    //   521: astore_2
    //   522: aconst_null
    //   523: astore_1
    //   524: goto -194 -> 330
    //   527: astore_3
    //   528: aconst_null
    //   529: astore_2
    //   530: goto -215 -> 315
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	533	0	this	SkinEngine
    //   0	533	1	paramResources	Resources
    //   0	533	2	paramK	k
    //   0	533	3	paramOptions	android.graphics.BitmapFactory.Options
    //   0	533	4	paramRect	Rect
    //   0	533	5	paramBoolean1	boolean
    //   0	533	6	paramBackupForOOMData	BackupForOOMData
    //   0	533	7	paramInt	int
    //   0	533	8	paramBoolean2	boolean
    //   41	427	9	localObject	Object
    //   290	8	10	localOptions	android.graphics.BitmapFactory.Options
    // Exception table:
    //   from	to	target	type
    //   197	216	225	java/lang/OutOfMemoryError
    //   308	312	314	java/io/IOException
    //   218	223	329	java/lang/Throwable
    //   308	312	329	java/lang/Throwable
    //   317	327	329	java/lang/Throwable
    //   467	472	329	java/lang/Throwable
    //   261	272	342	java/lang/Exception
    //   292	306	376	java/lang/OutOfMemoryError
    //   444	463	474	java/lang/OutOfMemoryError
    //   10	143	521	java/lang/Throwable
    //   143	197	521	java/lang/Throwable
    //   197	216	521	java/lang/Throwable
    //   226	256	521	java/lang/Throwable
    //   261	272	521	java/lang/Throwable
    //   272	283	521	java/lang/Throwable
    //   283	292	521	java/lang/Throwable
    //   292	306	521	java/lang/Throwable
    //   343	374	521	java/lang/Throwable
    //   377	408	521	java/lang/Throwable
    //   413	444	521	java/lang/Throwable
    //   444	463	521	java/lang/Throwable
    //   475	516	521	java/lang/Throwable
    //   283	292	527	java/io/IOException
    //   292	306	527	java/io/IOException
    //   377	408	527	java/io/IOException
  }
  
  void a(Context paramContext)
  {
    boolean bool = true;
    if (SWITCH_DEBUG) {
      Log.d("SkinEngine.switch", "update start");
    }
    j.d("SkinEngine.switch", 2, "skinEngine update start", null);
    m = true;
    SharedPreferences localSharedPreferences = paramContext.getSharedPreferences("theme", 4);
    String str = localSharedPreferences.getString("pending_theme_root", null);
    if (str != null) {
      bool = localSharedPreferences.getBoolean("pending_theme_resources_complied", true);
    }
    synchronized (b)
    {
      r = q;
      q = str;
      n = bool;
      c(paramContext);
      b(paramContext);
      localSharedPreferences.edit().putString("theme_root", str).putBoolean("complied", n).commit();
      m = false;
      r = null;
      if (SWITCH_DEBUG) {
        Log.d("SkinEngine.switch", "update done");
      }
      j.d("SkinEngine.switch", 2, "skinEngine update done", null);
      return;
    }
  }
  
  public void addBackupForOOMData(Integer paramInteger, BackupForOOMData paramBackupForOOMData)
  {
    if (backupForOOMData == null) {
      backupForOOMData = new HashMap();
    }
    backupForOOMData.put(paramInteger, paramBackupForOOMData);
  }
  
  public final void addDrawableResource(int paramInt)
  {
    t.a(mResources, paramInt);
  }
  
  @TargetApi(16)
  SkinnableColorStateList b(int paramInt)
  {
    synchronized (b)
    {
      Object localObject1 = (WeakReference)p.get(paramInt);
      if (localObject1 != null)
      {
        localObject1 = (SkinnableColorStateList)((WeakReference)localObject1).get();
        if (localObject1 != null) {
          return localObject1;
        }
        p.delete(paramInt);
      }
      mResources.getValue(paramInt, b, true);
      Object localObject3 = b.string.toString();
      if (((String)localObject3).endsWith(".xml"))
      {
        localObject1 = new k();
        a = paramInt;
        d = ((String)localObject3).substring(((String)localObject3).lastIndexOf("/") + 1);
        if (q != null) {
          b = a(mResources, d);
        }
        localObject3 = b(paramInt, mResources, (k)localObject1);
        skinData = ((k)localObject1);
        p.put(paramInt, new WeakReference(localObject3));
        return localObject3;
      }
    }
    return null;
  }
  
  public int getColor(int paramInt)
  {
    synchronized (b)
    {
      TypedValue localTypedValue2 = b;
      mResources.getValue(paramInt, localTypedValue2, true);
      if ((type >= 16) && (type <= 31))
      {
        paramInt = data;
        return paramInt;
      }
      if (type == 3)
      {
        paramInt = b(paramInt).getDefaultColor();
        return paramInt;
      }
    }
    throw new Resources.NotFoundException("Resource ID #0x" + Integer.toHexString(paramInt) + " type #0x" + Integer.toHexString(type) + " is not valid");
  }
  
  public String getSkinRootPath()
  {
    if (m) {
      return r;
    }
    return q;
  }
  
  public Object getThemeConfig(String paramString, Object paramObject)
  {
    for (;;)
    {
      Object localObject1;
      synchronized (b)
      {
        a(n);
        Object localObject2 = x.get(paramString);
        localObject1 = localObject2;
        if (localObject2 == null)
        {
          localObject1 = w.get(paramString);
          break label63;
          return paramObject;
        }
      }
      label63:
      while (localObject1 != null)
      {
        paramObject = localObject1;
        break;
      }
    }
  }
  
  @TargetApi(16)
  public void getValue(int paramInt, TypedValue paramTypedValue)
  {
    mResources.getValue(paramInt, paramTypedValue, true);
    Object localObject;
    if (q != null)
    {
      localObject = (WeakReference)o.get(paramInt);
      if (localObject == null) {
        break label83;
      }
      localObject = (b)((WeakReference)localObject).get();
      if (localObject == null) {
        break label74;
      }
      if (i.b == null) {
        break label83;
      }
      type = 16777215;
      string = i.b;
    }
    label74:
    label83:
    TypedValue localTypedValue;
    do
    {
      return;
      o.delete(paramInt);
      localObject = string.toString();
      localObject = ((String)localObject).substring(((String)localObject).lastIndexOf("/") + 1);
      localTypedValue = new TypedValue();
      a(mResources, localTypedValue, (String)localObject, c[s], d[s]);
    } while (string == null);
    type = 16777215;
    string = string;
  }
  
  public void setSkinEngineHandler(SkinEngineHandler paramSkinEngineHandler)
  {
    j = paramSkinEngineHandler;
  }
  
  public boolean setSkinRootPath(Context paramContext, String paramString)
  {
    return setSkinRootPath(paramContext, paramString, true);
  }
  
  public boolean setSkinRootPath(Context paramContext, String paramString, boolean paramBoolean)
  {
    if (m)
    {
      if (SWITCH_DEBUG) {
        Log.d("SkinEngine.switch", "[setSkinRootPath] mSkinUpdating is true");
      }
      return false;
    }
    if (SWITCH_DEBUG) {
      Log.d("SkinEngine.switch", "[setSkinRootPath] start");
    }
    SharedPreferences localSharedPreferences = paramContext.getSharedPreferences("theme", 4);
    if (paramString == null) {
      localSharedPreferences.edit().remove("pending_theme_root").remove("pending_theme_resources_complied").commit();
    }
    for (;;)
    {
      paramContext.sendBroadcast(new Intent("com.tencent.qplus.THEME_UPDATE"), "com.tencent.msg.permission.pushnotify");
      if (SWITCH_DEBUG)
      {
        Log.d("SkinEngine.switch", "[setSkinRootPath] sendBroadcast(ACTION_THEME_UPDATE)");
        Log.d("SkinEngine.switch", "[setSkinRootPath] done");
      }
      return true;
      String str = paramString;
      if (!paramString.endsWith("/")) {
        str = paramString + "/";
      }
      if (str.startsWith("/asset/"))
      {
        localSharedPreferences.edit().putString("pending_theme_root", str).putBoolean("pending_theme_resources_complied", paramBoolean).commit();
      }
      else
      {
        paramString = new File(str);
        if ((paramString.exists()) && (paramString.isDirectory()))
        {
          localSharedPreferences.edit().putString("pending_theme_root", str).putBoolean("pending_theme_resources_complied", paramBoolean).commit();
        }
        else
        {
          if (DEBUG) {
            Log.w("SkinEngine", "[setSkinRootPath] wrong skinPath: " + str);
          }
          localSharedPreferences.edit().remove("pending_theme_root").putBoolean("pending_theme_resources_complied", paramBoolean).commit();
        }
      }
    }
  }
  
  /* Error */
  public void unInit()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 589	com/tencent/theme/SkinEngine:t	Lcom/tencent/theme/g;
    //   4: ifnull +39 -> 43
    //   7: ldc -58
    //   9: ldc_w 578
    //   12: invokevirtual 582	java/lang/Class:getDeclaredField	(Ljava/lang/String;)Ljava/lang/reflect/Field;
    //   15: astore_1
    //   16: aload_1
    //   17: iconst_1
    //   18: invokevirtual 421	java/lang/reflect/Field:setAccessible	(Z)V
    //   21: aload_1
    //   22: invokevirtual 1146	java/lang/reflect/Field:getDeclaringClass	()Ljava/lang/Class;
    //   25: invokevirtual 1149	java/lang/Class:isArray	()Z
    //   28: ifeq +54 -> 82
    //   31: aload_1
    //   32: aconst_null
    //   33: aload_0
    //   34: getfield 589	com/tencent/theme/SkinEngine:t	Lcom/tencent/theme/g;
    //   37: getfield 1151	com/tencent/theme/g:b	[Landroid/util/LongSparseArray;
    //   40: invokevirtual 425	java/lang/reflect/Field:set	(Ljava/lang/Object;Ljava/lang/Object;)V
    //   43: ldc -58
    //   45: ldc_w 616
    //   48: invokevirtual 582	java/lang/Class:getDeclaredField	(Ljava/lang/String;)Ljava/lang/reflect/Field;
    //   51: astore_1
    //   52: aload_1
    //   53: iconst_1
    //   54: invokevirtual 421	java/lang/reflect/Field:setAccessible	(Z)V
    //   57: aload_1
    //   58: aload_0
    //   59: getfield 212	com/tencent/theme/SkinEngine:mResources	Landroid/content/res/Resources;
    //   62: invokevirtual 426	java/lang/reflect/Field:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   65: checkcast 189	android/util/LongSparseArray
    //   68: astore_2
    //   69: aload_1
    //   70: aconst_null
    //   71: aload_0
    //   72: getfield 623	com/tencent/theme/SkinEngine:u	Lcom/tencent/theme/d;
    //   75: getfield 1153	com/tencent/theme/d:b	Landroid/util/LongSparseArray;
    //   78: invokevirtual 425	java/lang/reflect/Field:set	(Ljava/lang/Object;Ljava/lang/Object;)V
    //   81: return
    //   82: aload_1
    //   83: aconst_null
    //   84: aload_0
    //   85: getfield 589	com/tencent/theme/SkinEngine:t	Lcom/tencent/theme/g;
    //   88: getfield 1151	com/tencent/theme/g:b	[Landroid/util/LongSparseArray;
    //   91: iconst_0
    //   92: aaload
    //   93: invokevirtual 425	java/lang/reflect/Field:set	(Ljava/lang/Object;Ljava/lang/Object;)V
    //   96: goto -53 -> 43
    //   99: astore_1
    //   100: getstatic 104	com/tencent/theme/SkinEngine:DEBUG	Z
    //   103: ifeq -22 -> 81
    //   106: ldc 46
    //   108: ldc_w 1155
    //   111: aload_1
    //   112: invokestatic 670	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   115: pop
    //   116: return
    //   117: astore_1
    //   118: ldc -58
    //   120: ldc_w 658
    //   123: invokevirtual 582	java/lang/Class:getDeclaredField	(Ljava/lang/String;)Ljava/lang/reflect/Field;
    //   126: astore_1
    //   127: aload_1
    //   128: iconst_1
    //   129: invokevirtual 421	java/lang/reflect/Field:setAccessible	(Z)V
    //   132: aload_1
    //   133: aload_0
    //   134: getfield 212	com/tencent/theme/SkinEngine:mResources	Landroid/content/res/Resources;
    //   137: invokevirtual 426	java/lang/reflect/Field:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   140: astore_2
    //   141: aload_2
    //   142: instanceof 631
    //   145: ifeq +16 -> 161
    //   148: aload_1
    //   149: aconst_null
    //   150: aload_0
    //   151: getfield 665	com/tencent/theme/SkinEngine:v	Lcom/tencent/theme/e;
    //   154: getfield 1158	com/tencent/theme/e:b	Landroid/util/SparseArray;
    //   157: invokevirtual 425	java/lang/reflect/Field:set	(Ljava/lang/Object;Ljava/lang/Object;)V
    //   160: return
    //   161: aload_2
    //   162: instanceof 189
    //   165: ifeq -84 -> 81
    //   168: aload_1
    //   169: aconst_null
    //   170: aload_0
    //   171: getfield 623	com/tencent/theme/SkinEngine:u	Lcom/tencent/theme/d;
    //   174: getfield 1153	com/tencent/theme/d:b	Landroid/util/LongSparseArray;
    //   177: invokevirtual 425	java/lang/reflect/Field:set	(Ljava/lang/Object;Ljava/lang/Object;)V
    //   180: return
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	181	0	this	SkinEngine
    //   15	68	1	localField1	Field
    //   99	13	1	localException1	Exception
    //   117	1	1	localException2	Exception
    //   126	43	1	localField2	Field
    //   68	94	2	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   0	43	99	java/lang/Exception
    //   82	96	99	java/lang/Exception
    //   118	160	99	java/lang/Exception
    //   161	180	99	java/lang/Exception
    //   43	81	117	java/lang/Exception
  }
  
  public void writeCacheFile(File paramFile)
    throws IOException
  {
    t.a(paramFile);
  }
  
  public static class BackupForOOMData
  {
    public int backFileResId;
    public Bitmap.Config inPreferredConfig;
    public int orgkFileResId;
    
    public BackupForOOMData(int paramInt1, int paramInt2, Bitmap.Config paramConfig)
    {
      orgkFileResId = paramInt1;
      backFileResId = paramInt2;
      inPreferredConfig = paramConfig;
    }
  }
  
  private class a
    extends AsyncTask<Context, Void, Context>
  {
    private a() {}
    
    protected Context a(Context... paramVarArgs)
    {
      if (SkinEngine.SWITCH_DEBUG) {
        Log.d("SkinEngine.switch", "UpdateTask.doInBackground start");
      }
      SkinEngine.this.a(paramVarArgs[0]);
      System.gc();
      Thread.yield();
      System.gc();
      if (SkinEngine.SWITCH_DEBUG) {
        Log.d("SkinEngine.switch", "UpdateTask.doInBackground done");
      }
      return paramVarArgs[0];
    }
    
    protected void a(Context paramContext)
    {
      if (SkinEngine.SWITCH_DEBUG) {
        Log.d("SkinEngine.switch", "UpdateTask.onPostExecute start");
      }
      SkinEngine.a(SkinEngine.this, null);
      SkinEngine.a(SkinEngine.this, SkinEngine.a(SkinEngine.this));
      Intent localIntent = new Intent("com.tencent.qplus.THEME_INVALIDATE");
      localIntent.putExtra("pid", Process.myPid());
      paramContext.sendBroadcast(localIntent, "com.tencent.msg.permission.pushnotify");
      if (SkinEngine.SWITCH_DEBUG)
      {
        Log.d("SkinEngine.switch", "UpdateTask.onPostExecute sendBroadcast(ACTION_THEME_INVALIDATE)");
        Log.d("SkinEngine.switch", "UpdateTask.onPostExecute done");
      }
    }
  }
}
