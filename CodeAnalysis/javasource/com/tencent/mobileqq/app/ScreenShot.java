package com.tencent.mobileqq.app;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Looper;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.view.WindowManager.LayoutParams;
import android.widget.Button;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.kapalaiadapter.KapalaiAdapterUtil;
import com.tencent.mobileqq.utils.kapalaiadapter.MobileIssueSettings;
import com.tencent.qphone.base.util.QLog;
import mqq.util.NativeUtil;
import nez;

public class ScreenShot
  implements Handler.Callback, View.OnClickListener
{
  static final int jdField_a_of_type_Int = -16847;
  public static final String a;
  static final int jdField_b_of_type_Int = 100001;
  static final int c = 100002;
  static final int d = 100003;
  static final int e = 100004;
  static final int f = 100005;
  private static final int g = 1;
  private static final int h = 2;
  private static final int i = 3;
  public final Context a;
  public Bitmap a;
  public Drawable a;
  private final Handler jdField_a_of_type_AndroidOsHandler;
  private ViewGroup jdField_a_of_type_AndroidViewViewGroup;
  public Window a;
  public Button a;
  final nez jdField_a_of_type_Nez;
  public Bitmap b;
  public Drawable b;
  private final Handler jdField_b_of_type_AndroidOsHandler;
  public Button b;
  public Bitmap c;
  public Button c;
  public Button d;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = AppConstants.bb + "/QQ_Screenshot/";
  }
  
  public ScreenShot(Context paramContext, Window paramWindow)
  {
    jdField_a_of_type_AndroidContentContext = paramContext;
    if ((jdField_a_of_type_AndroidContentContext instanceof Activity)) {
      for (paramWindow = (Activity)jdField_a_of_type_AndroidContentContext; paramWindow.getParent() != null; paramWindow = paramWindow.getParent()) {}
    }
    for (jdField_a_of_type_AndroidViewWindow = paramWindow.getWindow();; jdField_a_of_type_AndroidViewWindow = paramWindow)
    {
      jdField_a_of_type_AndroidGraphicsDrawableDrawable = paramContext.getResources().getDrawable(2130842377);
      jdField_b_of_type_AndroidGraphicsDrawableDrawable = paramContext.getResources().getDrawable(2130842376);
      jdField_a_of_type_AndroidViewViewGroup = ((ViewGroup)((LayoutInflater)jdField_a_of_type_AndroidContentContext.getSystemService("layout_inflater")).inflate(2130904749, null));
      jdField_a_of_type_Nez = new nez(this, jdField_a_of_type_AndroidContentContext);
      jdField_a_of_type_AndroidViewViewGroup.addView(jdField_a_of_type_Nez, 0);
      jdField_c_of_type_AndroidWidgetButton = ((Button)jdField_a_of_type_AndroidViewViewGroup.findViewById(2131303939));
      jdField_a_of_type_AndroidWidgetButton = ((Button)jdField_a_of_type_AndroidViewViewGroup.findViewById(2131303940));
      d = ((Button)jdField_a_of_type_AndroidViewViewGroup.findViewById(2131297762));
      jdField_b_of_type_AndroidWidgetButton = ((Button)jdField_a_of_type_AndroidViewViewGroup.findViewById(2131303938));
      d.setOnClickListener(this);
      jdField_c_of_type_AndroidWidgetButton.setOnClickListener(this);
      jdField_a_of_type_AndroidWidgetButton.setOnClickListener(this);
      jdField_b_of_type_AndroidWidgetButton.setOnClickListener(this);
      jdField_a_of_type_AndroidOsHandler = new Handler(Looper.getMainLooper(), this);
      jdField_b_of_type_AndroidOsHandler = new Handler(ThreadManager.a(), this);
      return;
    }
  }
  
  private void a(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      jdField_a_of_type_AndroidWidgetButton.setVisibility(8);
      jdField_b_of_type_AndroidWidgetButton.setVisibility(8);
      jdField_c_of_type_AndroidWidgetButton.setVisibility(0);
      d.setVisibility(0);
      return;
    }
    jdField_a_of_type_AndroidWidgetButton.setVisibility(0);
    jdField_b_of_type_AndroidWidgetButton.setVisibility(0);
    jdField_c_of_type_AndroidWidgetButton.setVisibility(8);
    d.setVisibility(8);
  }
  
  private boolean a(Bitmap paramBitmap)
  {
    int m = paramBitmap.getWidth();
    int k = paramBitmap.getHeight();
    Object localObject = jdField_a_of_type_AndroidContentContext.getResources().getDisplayMetrics();
    int j = widthPixels;
    int n = heightPixels;
    if (((m == j) && (k == n)) || ((m == n) && (k == j)))
    {
      localObject = new int[m];
      paramBitmap.getPixels((int[])localObject, 0, m, 0, k / 2, m, 1);
      j = 0;
      while (j < m)
      {
        if (localObject[j] != -16777216) {
          return true;
        }
        j += 1;
      }
      localObject = new int[k];
      paramBitmap.getPixels((int[])localObject, 0, 1, m / 2, 0, 1, k);
      j = 0;
      for (;;)
      {
        if (j >= k) {
          break label151;
        }
        if (localObject[j] != -16777216) {
          break;
        }
        j += 1;
      }
    }
    label151:
    return false;
  }
  
  private void b()
  {
    WindowManager localWindowManager;
    WindowManager.LayoutParams localLayoutParams;
    if (!a())
    {
      localWindowManager = (WindowManager)jdField_a_of_type_AndroidContentContext.getSystemService("window");
      localLayoutParams = new WindowManager.LayoutParams();
      type = 2003;
      format = 1;
      flags |= 0x100;
    }
    try
    {
      localWindowManager.addView(jdField_a_of_type_AndroidViewViewGroup, localLayoutParams);
      return;
    }
    catch (Throwable localThrowable)
    {
      while (!QLog.isColorLevel()) {}
      QLog.e("qqBaseActivity", 2, "", localThrowable);
    }
  }
  
  private void c()
  {
    if (a()) {
      ((WindowManager)jdField_a_of_type_AndroidContentContext.getSystemService("window")).removeView(jdField_a_of_type_AndroidViewViewGroup);
    }
    jdField_c_of_type_AndroidGraphicsBitmap = null;
    jdField_a_of_type_AndroidGraphicsBitmap = null;
    jdField_b_of_type_AndroidGraphicsBitmap = null;
  }
  
  private boolean c()
  {
    return (!Build.MODEL.contains("Galaxy Nexus")) && (!Build.MODEL.contains("HTC S720")) && (!Build.MODEL.contains("SM-N9006")) && ((!Build.MODEL.contains("ZTE U930")) || (Build.VERSION.SDK_INT != 16)) && ((!Build.MODEL.contains("HTC One X")) || (Build.VERSION.SDK_INT != 16)) && ((!Build.MODEL.contains("GT-I9260")) || (Build.VERSION.SDK_INT != 16)) && (!Build.MODEL.contains("vivo Y18L")) && (!Build.MODEL.contains("HM 1SW")) && (!Build.MODEL.contains("DOOV S2y")) && (!Build.MODEL.contains("H30-T10")) && (!Build.MODEL.contains("vivo Y17T")) && (!d());
  }
  
  private boolean d()
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (Build.MANUFACTURER.contains("Meizu")) {
      if ((!Build.MODEL.contains("M351")) && (!Build.MODEL.contains("M353")) && (!Build.MODEL.contains("M355")) && (!Build.MODEL.contains("M356")) && (!Build.MODEL.contains("MX4")))
      {
        bool1 = bool2;
        if (!Build.MODEL.contains("MX4 Pro")) {}
      }
      else
      {
        bool1 = true;
      }
    }
    return bool1;
  }
  
  public static native int snapScreen(int paramInt1, int paramInt2);
  
  public void a()
  {
    c();
    ReportController.b(null, "CliOper", "", "", "0X8005008", "0X8005008", 0, 0, "0", "", "", "");
  }
  
  public boolean a()
  {
    return jdField_a_of_type_AndroidViewViewGroup.getParent() != null;
  }
  
  public boolean b()
  {
    jdField_a_of_type_Nez.f = 0;
    jdField_a_of_type_Nez.jdField_a_of_type_AndroidGraphicsRect.setEmpty();
    jdField_b_of_type_AndroidGraphicsBitmap = null;
    a(false);
    if (c()) {}
    try
    {
      Bitmap localBitmap = NativeUtil.screenshot(jdField_a_of_type_AndroidContentContext);
      jdField_a_of_type_AndroidGraphicsBitmap = localBitmap;
      jdField_c_of_type_AndroidGraphicsBitmap = localBitmap;
      if ((jdField_a_of_type_AndroidGraphicsBitmap != null) && (!a(jdField_a_of_type_AndroidGraphicsBitmap)))
      {
        jdField_a_of_type_AndroidGraphicsBitmap = null;
        jdField_c_of_type_AndroidGraphicsBitmap = null;
      }
      bool = jdField_a_of_type_AndroidContentContext instanceof Activity;
      if ((!bool) && (jdField_a_of_type_AndroidGraphicsBitmap == null)) {
        return false;
      }
    }
    catch (Throwable localThrowable)
    {
      boolean bool;
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.d("mqq", 2, "", localThrowable);
        }
      }
      jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(3);
      if (!bool) {}
    }
    for (String str = "1";; str = "0")
    {
      ReportController.b(null, "CliOper", "", "", "0X8005006", "0X8005006", 0, 0, str, "", "", "");
      return true;
    }
  }
  
  /* Error */
  public boolean handleMessage(android.os.Message paramMessage)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 4
    //   3: aload_1
    //   4: getfield 373	android/os/Message:what	I
    //   7: tableswitch	default:+25->32, 1:+33->40, 2:+139->146, 3:+27->34
    //   32: iconst_1
    //   33: ireturn
    //   34: aload_0
    //   35: invokespecial 375	com/tencent/mobileqq/app/ScreenShot:b	()V
    //   38: iconst_1
    //   39: ireturn
    //   40: aload_1
    //   41: getfield 378	android/os/Message:arg1	I
    //   44: iconst_1
    //   45: if_icmpne +82 -> 127
    //   48: aload_1
    //   49: getfield 382	android/os/Message:obj	Ljava/lang/Object;
    //   52: checkcast 120	nez
    //   55: astore_1
    //   56: aload_1
    //   57: ldc 14
    //   59: putfield 330	nez:f	I
    //   62: aload_0
    //   63: iconst_0
    //   64: invokespecial 178	com/tencent/mobileqq/app/ScreenShot:a	(Z)V
    //   67: aload_1
    //   68: invokevirtual 385	nez:invalidate	()V
    //   71: aload_1
    //   72: aconst_null
    //   73: new 387	ney
    //   76: dup
    //   77: aload_0
    //   78: aload_1
    //   79: invokespecial 390	ney:<init>	(Lcom/tencent/mobileqq/app/ScreenShot;Lnez;)V
    //   82: invokestatic 396	android/os/SystemClock:uptimeMillis	()J
    //   85: ldc2_w 397
    //   88: ladd
    //   89: invokevirtual 402	nez:scheduleDrawable	(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V
    //   92: aload_0
    //   93: getfield 71	com/tencent/mobileqq/app/ScreenShot:jdField_a_of_type_AndroidContentContext	Landroid/content/Context;
    //   96: invokevirtual 406	android/content/Context:getApplicationContext	()Landroid/content/Context;
    //   99: aload_0
    //   100: getfield 71	com/tencent/mobileqq/app/ScreenShot:jdField_a_of_type_AndroidContentContext	Landroid/content/Context;
    //   103: ldc_w 407
    //   106: invokevirtual 411	android/content/Context:getString	(I)Ljava/lang/String;
    //   109: ldc_w 413
    //   112: getstatic 66	com/tencent/mobileqq/app/ScreenShot:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   115: invokevirtual 417	java/lang/String:replace	(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    //   118: iconst_1
    //   119: invokestatic 423	android/widget/Toast:makeText	(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    //   122: invokevirtual 426	android/widget/Toast:show	()V
    //   125: iconst_1
    //   126: ireturn
    //   127: aload_0
    //   128: getfield 71	com/tencent/mobileqq/app/ScreenShot:jdField_a_of_type_AndroidContentContext	Landroid/content/Context;
    //   131: invokevirtual 406	android/content/Context:getApplicationContext	()Landroid/content/Context;
    //   134: ldc_w 427
    //   137: iconst_1
    //   138: invokestatic 430	android/widget/Toast:makeText	(Landroid/content/Context;II)Landroid/widget/Toast;
    //   141: invokevirtual 426	android/widget/Toast:show	()V
    //   144: iconst_1
    //   145: ireturn
    //   146: aload_1
    //   147: getfield 382	android/os/Message:obj	Ljava/lang/Object;
    //   150: checkcast 120	nez
    //   153: astore 6
    //   155: new 432	java/io/File
    //   158: dup
    //   159: getstatic 66	com/tencent/mobileqq/app/ScreenShot:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   162: invokespecial 435	java/io/File:<init>	(Ljava/lang/String;)V
    //   165: astore_1
    //   166: aload_1
    //   167: invokevirtual 438	java/io/File:exists	()Z
    //   170: ifne +8 -> 178
    //   173: aload_1
    //   174: invokevirtual 441	java/io/File:mkdirs	()Z
    //   177: pop
    //   178: new 432	java/io/File
    //   181: dup
    //   182: new 46	java/lang/StringBuilder
    //   185: dup
    //   186: invokespecial 49	java/lang/StringBuilder:<init>	()V
    //   189: getstatic 66	com/tencent/mobileqq/app/ScreenShot:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   192: invokevirtual 58	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   195: invokestatic 446	java/lang/System:currentTimeMillis	()J
    //   198: invokevirtual 449	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   201: ldc_w 451
    //   204: invokevirtual 58	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   207: invokevirtual 64	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   210: invokespecial 435	java/io/File:<init>	(Ljava/lang/String;)V
    //   213: astore 5
    //   215: aload 5
    //   217: ifnull +197 -> 414
    //   220: new 453	java/io/FileOutputStream
    //   223: dup
    //   224: aload 5
    //   226: invokespecial 456	java/io/FileOutputStream:<init>	(Ljava/io/File;)V
    //   229: astore_1
    //   230: aload 6
    //   232: getfield 457	nez:jdField_a_of_type_AndroidGraphicsBitmap	Landroid/graphics/Bitmap;
    //   235: getstatic 463	android/graphics/Bitmap$CompressFormat:PNG	Landroid/graphics/Bitmap$CompressFormat;
    //   238: bipush 80
    //   240: aload_1
    //   241: invokevirtual 467	android/graphics/Bitmap:compress	(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    //   244: istore_3
    //   245: aload 6
    //   247: aconst_null
    //   248: putfield 457	nez:jdField_a_of_type_AndroidGraphicsBitmap	Landroid/graphics/Bitmap;
    //   251: aload_1
    //   252: ifnull +167 -> 419
    //   255: aload_1
    //   256: invokevirtual 470	java/io/FileOutputStream:close	()V
    //   259: aload_0
    //   260: getfield 71	com/tencent/mobileqq/app/ScreenShot:jdField_a_of_type_AndroidContentContext	Landroid/content/Context;
    //   263: invokestatic 476	android/preference/PreferenceManager:getDefaultSharedPreferences	(Landroid/content/Context;)Landroid/content/SharedPreferences;
    //   266: invokeinterface 482 1 0
    //   271: astore_1
    //   272: aload_1
    //   273: ldc_w 484
    //   276: aload 5
    //   278: invokestatic 490	android/net/Uri:fromFile	(Ljava/io/File;)Landroid/net/Uri;
    //   281: invokevirtual 491	android/net/Uri:toString	()Ljava/lang/String;
    //   284: invokeinterface 497 3 0
    //   289: pop
    //   290: aload_1
    //   291: invokeinterface 500 1 0
    //   296: pop
    //   297: aload_0
    //   298: getfield 71	com/tencent/mobileqq/app/ScreenShot:jdField_a_of_type_AndroidContentContext	Landroid/content/Context;
    //   301: new 502	android/content/Intent
    //   304: dup
    //   305: ldc_w 504
    //   308: aload 5
    //   310: invokestatic 490	android/net/Uri:fromFile	(Ljava/io/File;)Landroid/net/Uri;
    //   313: invokespecial 507	android/content/Intent:<init>	(Ljava/lang/String;Landroid/net/Uri;)V
    //   316: invokevirtual 511	android/content/Context:sendBroadcast	(Landroid/content/Intent;)V
    //   319: aload_0
    //   320: getfield 164	com/tencent/mobileqq/app/ScreenShot:jdField_a_of_type_AndroidOsHandler	Landroid/os/Handler;
    //   323: astore_1
    //   324: iload_3
    //   325: ifeq +63 -> 388
    //   328: iconst_1
    //   329: istore_2
    //   330: aload_1
    //   331: iconst_1
    //   332: iload_2
    //   333: iconst_0
    //   334: aload 6
    //   336: invokevirtual 515	android/os/Handler:obtainMessage	(IIILjava/lang/Object;)Landroid/os/Message;
    //   339: invokevirtual 518	android/os/Message:sendToTarget	()V
    //   342: iconst_1
    //   343: ireturn
    //   344: aload 6
    //   346: aconst_null
    //   347: putfield 457	nez:jdField_a_of_type_AndroidGraphicsBitmap	Landroid/graphics/Bitmap;
    //   350: aload_1
    //   351: ifnull +63 -> 414
    //   354: aload_1
    //   355: invokevirtual 470	java/io/FileOutputStream:close	()V
    //   358: iconst_0
    //   359: istore_3
    //   360: goto -101 -> 259
    //   363: astore_1
    //   364: iconst_0
    //   365: istore_3
    //   366: goto -107 -> 259
    //   369: astore_1
    //   370: aload 6
    //   372: aconst_null
    //   373: putfield 457	nez:jdField_a_of_type_AndroidGraphicsBitmap	Landroid/graphics/Bitmap;
    //   376: aload 4
    //   378: ifnull +8 -> 386
    //   381: aload 4
    //   383: invokevirtual 470	java/io/FileOutputStream:close	()V
    //   386: aload_1
    //   387: athrow
    //   388: iconst_0
    //   389: istore_2
    //   390: goto -60 -> 330
    //   393: astore 4
    //   395: goto -9 -> 386
    //   398: astore 5
    //   400: aload_1
    //   401: astore 4
    //   403: aload 5
    //   405: astore_1
    //   406: goto -36 -> 370
    //   409: astore 4
    //   411: goto -67 -> 344
    //   414: iconst_0
    //   415: istore_3
    //   416: goto -157 -> 259
    //   419: goto -160 -> 259
    //   422: astore_1
    //   423: iconst_1
    //   424: ireturn
    //   425: astore_1
    //   426: goto -167 -> 259
    //   429: astore_1
    //   430: aconst_null
    //   431: astore_1
    //   432: goto -88 -> 344
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	435	0	this	ScreenShot
    //   0	435	1	paramMessage	android.os.Message
    //   329	61	2	j	int
    //   244	172	3	bool	boolean
    //   1	381	4	localObject1	Object
    //   393	1	4	localIOException	java.io.IOException
    //   401	1	4	localMessage	android.os.Message
    //   409	1	4	localFileNotFoundException	java.io.FileNotFoundException
    //   213	96	5	localFile	java.io.File
    //   398	6	5	localObject2	Object
    //   153	218	6	localNez	nez
    // Exception table:
    //   from	to	target	type
    //   354	358	363	java/io/IOException
    //   220	230	369	finally
    //   381	386	393	java/io/IOException
    //   230	245	398	finally
    //   230	245	409	java/io/FileNotFoundException
    //   146	178	422	java/lang/Exception
    //   178	215	422	java/lang/Exception
    //   245	251	422	java/lang/Exception
    //   255	259	422	java/lang/Exception
    //   259	324	422	java/lang/Exception
    //   330	342	422	java/lang/Exception
    //   344	350	422	java/lang/Exception
    //   354	358	422	java/lang/Exception
    //   370	376	422	java/lang/Exception
    //   381	386	422	java/lang/Exception
    //   386	388	422	java/lang/Exception
    //   255	259	425	java/io/IOException
    //   220	230	429	java/io/FileNotFoundException
  }
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    }
    do
    {
      do
      {
        do
        {
          do
          {
            return;
            jdField_a_of_type_Nez.a(true);
          } while ((MobileIssueSettings.g) || (Build.VERSION.SDK_INT >= 11));
          KapalaiAdapterUtil.a().b(jdField_a_of_type_AndroidViewWindow);
          return;
          jdField_a_of_type_Nez.a(false);
        } while ((MobileIssueSettings.g) || (Build.VERSION.SDK_INT >= 11));
        KapalaiAdapterUtil.a().b(jdField_a_of_type_AndroidViewWindow);
        return;
        c();
        ReportController.b(null, "CliOper", "", "", "0X8005008", "0X8005008", 0, 0, "1", "", "", "");
      } while ((MobileIssueSettings.g) || (Build.VERSION.SDK_INT >= 11));
      KapalaiAdapterUtil.a().b(jdField_a_of_type_AndroidViewWindow);
      return;
      c();
      ReportController.b(null, "CliOper", "", "", "0X8005008", "0X8005008", 0, 0, "2", "", "", "");
    } while ((MobileIssueSettings.g) || (Build.VERSION.SDK_INT >= 11));
    KapalaiAdapterUtil.a().b(jdField_a_of_type_AndroidViewWindow);
  }
}
