package com.tencent.mobileqq.utils;

import android.content.ContentProviderOperation;
import android.content.ContentProviderOperation.Builder;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.OperationApplicationException;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ProviderInfo;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.net.Uri;
import android.os.RemoteException;
import android.text.TextUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.qphone.base.util.QLog;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import sod;
import soe;

public class QQShortCutUtils
{
  public static final int a = -100;
  public static final String a = "empty";
  private static final String[] a;
  public static final int b = -101;
  private static final String jdField_b_of_type_JavaLangString = "Q.shortcut";
  private static final String[] jdField_b_of_type_ArrayOfJavaLangString;
  private static final int jdField_c_of_type_Int = 4;
  private static String jdField_c_of_type_JavaLangString = null;
  private static final String[] jdField_c_of_type_ArrayOfJavaLangString;
  private static final int jdField_d_of_type_Int = 3;
  private static final String[] jdField_d_of_type_ArrayOfJavaLangString;
  private static final int jdField_e_of_type_Int = 2;
  private static final String[] jdField_e_of_type_ArrayOfJavaLangString;
  private static final int jdField_f_of_type_Int = 1;
  private static final String[] jdField_f_of_type_ArrayOfJavaLangString;
  private static final int g = 0;
  private static int h;
  private static int i;
  private static int j;
  private static int k;
  private static int l;
  private static int m;
  private static int n;
  private static int o;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = new String[] { "com.android.launcher.permission.READ_SETTINGS", "com.android.launcher3.permission.READ_SETTINGS", "com.google.android.launcher.permission.READ_SETTINGS", "com.huawei.android.launcher.permission.READ_SETTINGS", "com.bbk.launcher2.permission.READ_SETTINGS", "com.huaqin.launcherEx.permission.READ_SETTINGS", "com.htc.launcher.permission.READ_SETTINGS", "com.htc.launcher.settings", "com.huawei.launcher3.permission.READ_SETTINGS" };
    b = new String[] { "照相机", "相机" };
    jdField_c_of_type_ArrayOfJavaLangString = new String[] { "相册", "图册", "图库", "圖庫" };
    d = new String[] { "微信" };
    e = new String[] { "微博" };
    h = -1;
    i = -1;
    j = 100;
    k = -1;
    l = 100;
    m = -1;
    n = 0;
    o = 6;
    f = new String[] { "vivo" };
  }
  
  public QQShortCutUtils() {}
  
  public static String a(Context paramContext)
  {
    if (jdField_c_of_type_JavaLangString == null)
    {
      jdField_c_of_type_JavaLangString = a(paramContext, a);
      if (jdField_c_of_type_JavaLangString == null) {
        break label88;
      }
    }
    label88:
    for (jdField_c_of_type_JavaLangString = "content://" + jdField_c_of_type_JavaLangString + "/favorites?notify=true";; jdField_c_of_type_JavaLangString = "empty")
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.shortcut", 2, "getShortcutUri.shortcutUri=" + jdField_c_of_type_JavaLangString);
      }
      return jdField_c_of_type_JavaLangString;
    }
  }
  
  private static String a(Context paramContext, String[] paramArrayOfString)
  {
    try
    {
      paramContext = paramContext.getPackageManager().getInstalledPackages(10);
      if (paramContext != null)
      {
        paramContext = paramContext.iterator();
        while (paramContext.hasNext())
        {
          ProviderInfo[] arrayOfProviderInfo = nextproviders;
          if (arrayOfProviderInfo != null)
          {
            int i3 = arrayOfProviderInfo.length;
            int i1 = 0;
            while (i1 < i3)
            {
              ProviderInfo localProviderInfo = arrayOfProviderInfo[i1];
              if (localProviderInfo != null)
              {
                int i4 = paramArrayOfString.length;
                int i2 = 0;
                while (i2 < i4)
                {
                  if (paramArrayOfString[i2].equals(readPermission))
                  {
                    paramContext = authority;
                    return paramContext;
                  }
                  i2 += 1;
                }
              }
              i1 += 1;
            }
          }
        }
      }
      return null;
    }
    catch (RuntimeException paramContext)
    {
      paramContext.printStackTrace();
    }
  }
  
  /* Error */
  private static ArrayList a(Context paramContext, String paramString, String[] paramArrayOfString)
  {
    // Byte code:
    //   0: new 198	java/util/ArrayList
    //   3: dup
    //   4: invokespecial 199	java/util/ArrayList:<init>	()V
    //   7: astore_3
    //   8: aload_0
    //   9: invokestatic 201	com/tencent/mobileqq/utils/QQShortCutUtils:a	(Landroid/content/Context;)Ljava/lang/String;
    //   12: astore 4
    //   14: ldc 10
    //   16: aload 4
    //   18: invokevirtual 187	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   21: ifeq +5 -> 26
    //   24: aload_3
    //   25: areturn
    //   26: aload_0
    //   27: invokevirtual 205	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   30: aload 4
    //   32: invokestatic 211	android/net/Uri:parse	(Ljava/lang/String;)Landroid/net/Uri;
    //   35: bipush 9
    //   37: anewarray 43	java/lang/String
    //   40: dup
    //   41: iconst_0
    //   42: ldc -43
    //   44: aastore
    //   45: dup
    //   46: iconst_1
    //   47: ldc -41
    //   49: aastore
    //   50: dup
    //   51: iconst_2
    //   52: ldc -39
    //   54: aastore
    //   55: dup
    //   56: iconst_3
    //   57: ldc -37
    //   59: aastore
    //   60: dup
    //   61: iconst_4
    //   62: ldc -35
    //   64: aastore
    //   65: dup
    //   66: iconst_5
    //   67: ldc -33
    //   69: aastore
    //   70: dup
    //   71: bipush 6
    //   73: ldc -31
    //   75: aastore
    //   76: dup
    //   77: bipush 7
    //   79: ldc -29
    //   81: aastore
    //   82: dup
    //   83: bipush 8
    //   85: ldc -27
    //   87: aastore
    //   88: aload_1
    //   89: aload_2
    //   90: aconst_null
    //   91: invokevirtual 235	android/content/ContentResolver:query	(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   94: astore_1
    //   95: aload_1
    //   96: ifnull +262 -> 358
    //   99: aload_1
    //   100: astore_0
    //   101: aload_1
    //   102: invokeinterface 240 1 0
    //   107: ifeq +251 -> 358
    //   110: aload_1
    //   111: astore_0
    //   112: new 242	soe
    //   115: dup
    //   116: invokespecial 243	soe:<init>	()V
    //   119: astore_2
    //   120: aload_1
    //   121: astore_0
    //   122: aload_2
    //   123: aload_1
    //   124: iconst_0
    //   125: invokeinterface 247 2 0
    //   130: putfield 249	soe:jdField_a_of_type_Int	I
    //   133: aload_1
    //   134: astore_0
    //   135: aload_2
    //   136: aload_1
    //   137: iconst_1
    //   138: invokeinterface 253 2 0
    //   143: putfield 255	soe:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   146: aload_1
    //   147: astore_0
    //   148: aload_2
    //   149: aload_1
    //   150: iconst_2
    //   151: invokeinterface 247 2 0
    //   156: putfield 257	soe:b	I
    //   159: aload_1
    //   160: astore_0
    //   161: aload_2
    //   162: aload_1
    //   163: iconst_3
    //   164: invokeinterface 247 2 0
    //   169: putfield 259	soe:d	I
    //   172: aload_1
    //   173: astore_0
    //   174: aload_2
    //   175: aload_1
    //   176: iconst_4
    //   177: invokeinterface 247 2 0
    //   182: putfield 261	soe:e	I
    //   185: aload_1
    //   186: astore_0
    //   187: aload_2
    //   188: aload_1
    //   189: iconst_5
    //   190: invokeinterface 247 2 0
    //   195: putfield 263	soe:f	I
    //   198: aload_1
    //   199: astore_0
    //   200: aload_2
    //   201: aload_1
    //   202: bipush 6
    //   204: invokeinterface 247 2 0
    //   209: putfield 265	soe:g	I
    //   212: aload_1
    //   213: astore_0
    //   214: aload_2
    //   215: aload_1
    //   216: bipush 7
    //   218: invokeinterface 247 2 0
    //   223: putfield 267	soe:c	I
    //   226: aload_1
    //   227: astore_0
    //   228: aload_1
    //   229: bipush 8
    //   231: invokeinterface 253 2 0
    //   236: astore 4
    //   238: aload_1
    //   239: astore_0
    //   240: aload 4
    //   242: invokestatic 273	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   245: ifne +86 -> 331
    //   248: aload_1
    //   249: astore_0
    //   250: aload 4
    //   252: ldc_w 275
    //   255: invokevirtual 278	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   258: ifeq +73 -> 331
    //   261: aload_1
    //   262: astore_0
    //   263: aload_2
    //   264: iconst_0
    //   265: putfield 279	soe:h	I
    //   268: aload_1
    //   269: astore_0
    //   270: aload_3
    //   271: aload_2
    //   272: invokevirtual 282	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   275: pop
    //   276: goto -177 -> 99
    //   279: astore_2
    //   280: aload_1
    //   281: astore_0
    //   282: invokestatic 138	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   285: ifeq +34 -> 319
    //   288: aload_1
    //   289: astore_0
    //   290: ldc 15
    //   292: iconst_2
    //   293: new 119	java/lang/StringBuilder
    //   296: dup
    //   297: invokespecial 120	java/lang/StringBuilder:<init>	()V
    //   300: ldc_w 284
    //   303: invokevirtual 126	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   306: aload_2
    //   307: invokevirtual 285	java/lang/Exception:toString	()Ljava/lang/String;
    //   310: invokevirtual 126	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   313: invokevirtual 132	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   316: invokestatic 143	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   319: aload_1
    //   320: ifnull +9 -> 329
    //   323: aload_1
    //   324: invokeinterface 288 1 0
    //   329: aload_3
    //   330: areturn
    //   331: aload_1
    //   332: astore_0
    //   333: aload_2
    //   334: iconst_1
    //   335: putfield 279	soe:h	I
    //   338: goto -70 -> 268
    //   341: astore_2
    //   342: aload_0
    //   343: astore_1
    //   344: aload_2
    //   345: astore_0
    //   346: aload_1
    //   347: ifnull +9 -> 356
    //   350: aload_1
    //   351: invokeinterface 288 1 0
    //   356: aload_0
    //   357: athrow
    //   358: aload_1
    //   359: ifnull -30 -> 329
    //   362: aload_1
    //   363: invokeinterface 288 1 0
    //   368: goto -39 -> 329
    //   371: astore_0
    //   372: aconst_null
    //   373: astore_1
    //   374: goto -28 -> 346
    //   377: astore_2
    //   378: aconst_null
    //   379: astore_1
    //   380: goto -100 -> 280
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	383	0	paramContext	Context
    //   0	383	1	paramString	String
    //   0	383	2	paramArrayOfString	String[]
    //   7	323	3	localArrayList	ArrayList
    //   12	239	4	str	String
    // Exception table:
    //   from	to	target	type
    //   101	110	279	java/lang/Exception
    //   112	120	279	java/lang/Exception
    //   122	133	279	java/lang/Exception
    //   135	146	279	java/lang/Exception
    //   148	159	279	java/lang/Exception
    //   161	172	279	java/lang/Exception
    //   174	185	279	java/lang/Exception
    //   187	198	279	java/lang/Exception
    //   200	212	279	java/lang/Exception
    //   214	226	279	java/lang/Exception
    //   228	238	279	java/lang/Exception
    //   240	248	279	java/lang/Exception
    //   250	261	279	java/lang/Exception
    //   263	268	279	java/lang/Exception
    //   270	276	279	java/lang/Exception
    //   333	338	279	java/lang/Exception
    //   101	110	341	finally
    //   112	120	341	finally
    //   122	133	341	finally
    //   135	146	341	finally
    //   148	159	341	finally
    //   161	172	341	finally
    //   174	185	341	finally
    //   187	198	341	finally
    //   200	212	341	finally
    //   214	226	341	finally
    //   228	238	341	finally
    //   240	248	341	finally
    //   250	261	341	finally
    //   263	268	341	finally
    //   270	276	341	finally
    //   282	288	341	finally
    //   290	319	341	finally
    //   333	338	341	finally
    //   26	95	371	finally
    //   26	95	377	java/lang/Exception
  }
  
  public static ArrayList a(Context paramContext, List paramList, String paramString)
  {
    if (paramList == null)
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.shortcut", 2, "getMoveShortCut.shortcuts=null");
      }
      paramContext = null;
      return paramContext;
    }
    Object localObject1 = null;
    Object localObject4 = null;
    paramContext = null;
    int i2 = 0;
    int[] arrayOfInt = new int[n + 1];
    int i1 = 0;
    while (i1 < arrayOfInt.length)
    {
      arrayOfInt[i1] = 0;
      i1 += 1;
    }
    int i4 = 0;
    int i3 = 0;
    i1 = i2;
    i2 = i4;
    label77:
    Object localObject2;
    if (i3 < paramList.size())
    {
      localObject2 = (soe)paramList.get(i3);
      if ((localObject2 == null) || (TextUtils.isEmpty(jdField_a_of_type_JavaLangString))) {
        break label2167;
      }
      if ((c >= 0) && (c <= n))
      {
        i4 = c;
        arrayOfInt[i4] += 1;
      }
      if ((paramContext != null) || (!jdField_a_of_type_JavaLangString.equals(paramString)) || (h != 0)) {
        break label2164;
      }
      paramContext = (Context)localObject2;
      label182:
      if (i1 >= 4)
      {
        i4 = i2;
        i2 = i1;
        i1 = i4;
      }
    }
    for (;;)
    {
      label197:
      i4 = i3 + 1;
      i3 = i2;
      i2 = i1;
      i1 = i3;
      i3 = i4;
      break label77;
      i4 = 0;
      label223:
      int i5;
      if (i4 < b.length) {
        if ((jdField_a_of_type_JavaLangString.equals(b[i4])) && ((d != k) || (e != m)))
        {
          i2 = 4;
          i5 = i3;
        }
      }
      for (Object localObject3 = localObject2;; localObject3 = localObject1)
      {
        if (i2 >= 3)
        {
          i1 = i5;
          localObject1 = localObject3;
          break label197;
          i4 += 1;
          break label223;
        }
        int i6 = 0;
        for (;;)
        {
          i4 = i5;
          i1 = i2;
          localObject1 = localObject3;
          if (i6 < jdField_c_of_type_ArrayOfJavaLangString.length)
          {
            if ((jdField_a_of_type_JavaLangString.equals(jdField_c_of_type_ArrayOfJavaLangString[i6])) && ((d != k) || (e != m)))
            {
              i1 = 3;
              i4 = i3;
              localObject1 = localObject2;
            }
          }
          else
          {
            if (i1 < 2) {
              break label402;
            }
            i2 = i1;
            i1 = i4;
            break;
          }
          i6 += 1;
        }
        label402:
        i6 = 0;
        for (;;)
        {
          i5 = i4;
          i2 = i1;
          localObject3 = localObject1;
          if (i6 < d.length)
          {
            if ((jdField_a_of_type_JavaLangString.equals(d[i6])) && ((d != k) || (e != m)))
            {
              i2 = 2;
              i5 = i3;
              localObject3 = localObject2;
            }
          }
          else
          {
            if (i2 < 1) {
              break label500;
            }
            i1 = i5;
            localObject1 = localObject3;
            break;
          }
          i6 += 1;
        }
        label500:
        i1 = 0;
        for (;;)
        {
          if (i1 >= e.length) {
            break label2180;
          }
          if ((jdField_a_of_type_JavaLangString.equals(e[i1])) && ((d != k) || (e != m)))
          {
            i2 = 1;
            localObject1 = localObject2;
            i1 = i3;
            break;
          }
          i1 += 1;
        }
        if (paramContext == null)
        {
          if (QLog.isColorLevel()) {
            QLog.d("Q.shortcut", 2, "getMoveShortCut.qqShortcuts=null");
          }
          return null;
        }
        if (localObject1 != null)
        {
          if (QLog.isColorLevel()) {
            QLog.d("Q.shortcut", 2, "getMoveShortCut.baseShortcuts!=null");
          }
          a((soe)localObject1, paramContext);
          if (QLog.isColorLevel()) {
            QLog.d("Q.shortcut", 2, "getMoveShortCut.qqShortcuts.screen=" + c + ",y=" + e + ",x=" + d);
          }
          i2 += 1;
          i4 = i2;
          paramString = localObject4;
          if (i2 < paramList.size())
          {
            localObject1 = (soe)paramList.get(i2);
            if ((jdField_a_of_type_Int == jdField_a_of_type_Int) && (jdField_a_of_type_JavaLangString != null) && (jdField_a_of_type_JavaLangString.equals(jdField_a_of_type_JavaLangString)))
            {
              if (QLog.isColorLevel()) {
                QLog.d("Q.shortcut", 2, "getMoveShortCut.qq is right here,no need to move.");
              }
              return null;
            }
            if ((c != c) || (d != d) || (e != e)) {
              break label2145;
            }
            paramString = (String)localObject1;
            if (QLog.isColorLevel()) {
              QLog.d("Q.shortcut", 2, "getMoveShortCut.toReplaceShortcuts.screen=" + c + ",y=" + e + ",x=" + d);
            }
          }
        }
        label875:
        label955:
        label1106:
        label1180:
        label1382:
        label1692:
        label2094:
        label2139:
        label2142:
        label2145:
        for (paramString = (String)localObject1;; paramString = null)
        {
          i4 = i2;
          if ((i4 < paramList.size()) && (paramString != null))
          {
            if (QLog.isColorLevel()) {
              QLog.d("Q.shortcut", 2, "getMoveShortCut.need to move replaceshortcut.");
            }
            i2 = paramList.size();
            localObject1 = (soe)paramList.get(i2 - 1);
            if ((localObject1 == null) || (paramContext == null) || (jdField_a_of_type_Int != jdField_a_of_type_Int)) {
              break label2139;
            }
            i2 -= 1;
            localObject2 = paramList.subList(i4, i2);
            paramList = (soe)((List)localObject2).get(0);
            localObject1 = (soe)((List)localObject2).get(((List)localObject2).size() - 1);
            i2 = c;
            i3 = c;
            i4 = h;
            i5 = e;
            i6 = e;
            int i7 = i;
            int i8 = d;
            int i9 = d;
            int i10 = f;
            i4 = (i2 - i3) * i4 + (i5 - i6) * i7 + (i8 - i9) + g * i10;
            localObject1 = new soe[i4];
            localObject2 = ((List)localObject2).iterator();
            if (((Iterator)localObject2).hasNext())
            {
              localObject3 = (soe)((Iterator)localObject2).next();
              i5 = c;
              i6 = c;
              i7 = h;
              i8 = e;
              i9 = e;
              i10 = i;
              int i11 = d;
              int i12 = d;
              i2 = 1;
              if (i2 <= f)
              {
                i3 = 1;
                for (;;)
                {
                  if (i3 <= g)
                  {
                    int i13 = (i3 - 1) * i + ((i5 - i6) * i7 + (i8 - i9) * i10 + i11 - i12) + i2 - 1;
                    if (i13 < i4) {
                      localObject1[i13] = localObject3;
                    }
                    i3 += 1;
                    continue;
                    if (QLog.isColorLevel()) {
                      QLog.d("Q.shortcut", 2, "getMoveShortCut.baseShortcuts==null");
                    }
                    i3 = 0;
                    i4 = 0;
                    i2 = 0;
                    while (i2 < arrayOfInt.length)
                    {
                      i5 = i4;
                      if (arrayOfInt[i2] > i4)
                      {
                        i5 = arrayOfInt[i2];
                        i3 = i2;
                      }
                      i2 += 1;
                      i4 = i5;
                    }
                    if (QLog.isColorLevel()) {
                      QLog.d("Q.shortcut", 2, "getMoveShortCut.mostscreen=" + i3 + ",num=" + i4);
                    }
                    i2 = 0;
                    if (i2 >= paramList.size()) {
                      break label2142;
                    }
                    paramString = (soe)paramList.get(i2);
                    if ((paramString != null) && (c == i3) && (f <= 1))
                    {
                      localObject1 = paramString;
                      if (QLog.isColorLevel())
                      {
                        QLog.d("Q.shortcut", 2, "getMoveShortCut.baseShortcuts.screen=" + c + ",y=" + e + ",x=" + d);
                        localObject1 = paramString;
                      }
                    }
                  }
                }
              }
            }
          }
          for (;;)
          {
            i4 = i2;
            paramString = localObject4;
            if (localObject1 == null) {
              break label875;
            }
            if ((jdField_a_of_type_Int == jdField_a_of_type_Int) && (jdField_a_of_type_JavaLangString != null) && (jdField_a_of_type_JavaLangString.equals(jdField_a_of_type_JavaLangString)))
            {
              if (QLog.isColorLevel()) {
                QLog.d("Q.shortcut", 2, "getMoveShortCut.the first icon is qq,no need move.");
              }
              return null;
              i2 += 1;
              break label1382;
            }
            c = i3;
            d = j;
            e = e;
            i4 = i2;
            paramString = localObject4;
            if (d != j) {
              break label875;
            }
            if (QLog.isColorLevel()) {
              QLog.d("Q.shortcut", 2, "getMoveShortCut.toReplaceShortcuts.screen=" + c + ",y=" + e + ",x=" + d);
            }
            paramString = (String)localObject1;
            i4 = i2;
            break label875;
            i2 += 1;
            break label1180;
            break label1106;
            i2 = 0;
            if (i2 < i4)
            {
              if (localObject1[i2] != null) {
                break label2094;
              }
              i3 = c * h + e * i + d + i2;
              c = (i3 / h);
              e = (i3 % h / i);
              d = (i3 % h % i);
              if (QLog.isColorLevel()) {
                QLog.d("Q.shortcut", 2, "getMoveShortCut.change replace.toReplaceShortcuts.screen=" + c + ",y=" + e + ",x=" + d + ",i=" + i2 + ",lastposition=" + i3);
              }
            }
            if (i2 == i4)
            {
              i3 = c;
              i4 = h;
              i5 = e;
              i6 = i;
              i3 = d + (i3 * i4 + i5 * i6) + i2;
              c = (i3 / h);
              e = (i3 % h / i);
              d = (i3 % h % i);
              if (QLog.isColorLevel()) {
                QLog.d("Q.shortcut", 2, "getMoveShortCut.change replace.lastone.screen=" + c + ",y=" + e + ",x=" + d + ",i=" + i2 + ",lastposition=" + i3);
              }
            }
            paramList = new ArrayList();
            if (paramContext != null)
            {
              paramList.add(paramContext);
              switch (i1)
              {
              default: 
                o = 5;
              }
            }
            for (;;)
            {
              paramContext = paramList;
              if (paramString == null) {
                break;
              }
              paramList.add(paramString);
              return paramList;
              i2 += 1;
              break label1692;
              o = 1;
              continue;
              o = 2;
              continue;
              o = 3;
              continue;
              o = 4;
              continue;
              o = 6;
            }
            break label955;
          }
        }
        i5 = i2;
        i2 = i1;
      }
      label2164:
      break label182;
      label2167:
      i4 = i1;
      i1 = i2;
      i2 = i4;
      continue;
      label2180:
      i1 = i5;
      localObject1 = localObject3;
    }
  }
  
  public static void a(Context paramContext)
  {
    String str = DeviceInfoUtil.i();
    if (QLog.isColorLevel()) {
      QLog.d("Q.shortcut", 2, "moveShortCut begin.model=" + str);
    }
    int i1 = 0;
    if (i1 < f.length) {
      if ((str != null) && (str.contains(f[i1]))) {
        if (QLog.isColorLevel()) {
          QLog.d("Q.shortcut", 2, "moveShortCut.phone is blacklist.");
        }
      }
    }
    label108:
    ArrayList localArrayList;
    label153:
    do
    {
      do
      {
        do
        {
          return;
          i1 += 1;
          break;
          if (a(paramContext)) {
            break label108;
          }
        } while (!QLog.isColorLevel());
        QLog.d("Q.shortcut", 2, "moveShortCut.update exception.end");
        return;
        str = paramContext.getString(2131366985);
        localArrayList = a(paramContext, null, null);
        if ((localArrayList != null) && (localArrayList.size() >= 2)) {
          break label153;
        }
      } while (!QLog.isColorLevel());
      QLog.d("Q.shortcut", 2, "moveShortCut no shortcuts.");
      return;
      Iterator localIterator = localArrayList.iterator();
      while (localIterator.hasNext()) {
        if (nextb != -100) {
          localIterator.remove();
        }
      }
      localIterator = localArrayList.iterator();
      while (localIterator.hasNext())
      {
        soe localSoe = (soe)localIterator.next();
        if (b == -100)
        {
          j = Math.min(j, d);
          k = Math.max(k, d);
          l = Math.min(l, e);
          m = Math.max(m, e);
          n = Math.max(n, c);
        }
      }
      i = k - j + 1;
      h = i * (m - l + 1);
      if (QLog.isColorLevel()) {
        QLog.d("Q.shortcut", 2, "moveShortCut MAX_X=" + k + ",max_y=" + m + ",per_x=" + i + ",per_screen=" + h);
      }
      Collections.sort(localArrayList, new sod());
    } while (!a(paramContext, a(paramContext, localArrayList, str)));
    a(paramContext);
  }
  
  private static void a(soe paramSoe1, soe paramSoe2)
  {
    if ((paramSoe1 != null) && (paramSoe2 != null))
    {
      if ((d == k) && (e == m))
      {
        d = j;
        e = l;
        c += 1;
      }
    }
    else {
      return;
    }
    if (d == k)
    {
      d = j;
      e += 1;
      c = c;
      return;
    }
    d += 1;
    e = e;
    c = c;
  }
  
  private static boolean a(Context paramContext)
  {
    try
    {
      paramContext = getResourcesgetConfigurationlocale;
      Locale localLocale = new Locale("en");
      Object localObject1 = Class.forName("android.app.ActivityManagerNative");
      localObject1 = ((Class)localObject1).getMethod("getDefault", new Class[0]).invoke(localObject1, new Object[0]);
      Object localObject2 = localObject1.getClass().getMethod("getConfiguration", new Class[0]).invoke(localObject1, new Object[0]);
      localObject2.getClass().getDeclaredField("locale").set(localObject2, localLocale);
      localObject2.getClass().getDeclaredField("userSetLocale").setBoolean(localObject2, true);
      localObject1.getClass().getMethod("updateConfiguration", new Class[] { Configuration.class }).invoke(localObject1, new Object[] { localObject2 });
      localObject2.getClass().getDeclaredField("locale").set(localObject2, paramContext);
      localObject2.getClass().getDeclaredField("userSetLocale").setBoolean(localObject2, true);
      localObject1.getClass().getMethod("updateConfiguration", new Class[] { Configuration.class }).invoke(localObject1, new Object[] { localObject2 });
      if (QLog.isColorLevel()) {
        QLog.d("Q.shortcut", 2, "update.finished.");
      }
      return true;
    }
    catch (Exception paramContext)
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.shortcut", 2, "update.Exception:" + paramContext.toString());
      }
    }
    return false;
  }
  
  private static boolean a(Context paramContext, List paramList)
  {
    if (paramList == null)
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.shortcut", 2, "update move.shortcuts=null,no need to move.");
      }
      return false;
    }
    ArrayList localArrayList = new ArrayList(paramList.size());
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      soe localSoe = (soe)paramList.next();
      ContentValues localContentValues = new ContentValues();
      localContentValues.put("cellX", Integer.valueOf(d));
      localContentValues.put("cellY", Integer.valueOf(e));
      localContentValues.put("spanX", Integer.valueOf(f));
      localContentValues.put("spanY", Integer.valueOf(g));
      localContentValues.put("screen", Integer.valueOf(c));
      localArrayList.add(ContentProviderOperation.newUpdate(Uri.parse(a(paramContext))).withSelection("_id=?", new String[] { jdField_a_of_type_Int + "" }).withValues(localContentValues).build());
    }
    try
    {
      paramContext.getContentResolver().applyBatch(a(paramContext, a), localArrayList);
      i1 = 0;
    }
    catch (OperationApplicationException paramContext)
    {
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.d("Q.shortcut", 2, "update move.OperationApplicationException:" + paramContext.toString());
        }
        i1 = 1;
      }
    }
    catch (RemoteException paramContext)
    {
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.d("Q.shortcut", 2, "update move.RemoteException:" + paramContext.toString());
        }
        i1 = 1;
      }
    }
    catch (Exception paramContext)
    {
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.d("Q.shortcut", 2, "update move.Exception:" + paramContext.toString());
        }
        int i1 = 1;
      }
    }
    ReportController.b(null, "CliOper", "", "", "Shortcut", "Shortcut_order", 0, i1, String.valueOf(o), "", DeviceInfoUtil.i(), "");
    if (QLog.isColorLevel()) {
      QLog.d("Q.shortcut", 2, "update move.finish.position=" + o + ",ret=" + i1 + ",deviceModel=" + DeviceInfoUtil.i());
    }
    return true;
  }
}
