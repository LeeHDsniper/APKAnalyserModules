package com.tencent.mobileqq.activity.aio;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.ColorStateList;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ChatBackground
{
  public static final int a = -1;
  public static final String a;
  public static final int b = -10395552;
  public static final String c = "_is_c2c_set";
  public ColorStateList a;
  public Drawable a;
  public String b;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = ChatBackground.class.getSimpleName();
  }
  
  public ChatBackground() {}
  
  public static int a(Bitmap paramBitmap)
  {
    int i = 0;
    if (paramBitmap != null)
    {
      int j = paramBitmap.getWidth();
      int n = paramBitmap.getHeight();
      int[] arrayOfInt = new int[n];
      paramBitmap.getPixels(arrayOfInt, 0, 1, j / 2, 0, 1, n);
      j = 0;
      int k = 0;
      int m = 0;
      while (i < n)
      {
        int i1 = arrayOfInt[i];
        m += Color.red(i1);
        k += Color.green(i1);
        j += Color.blue(i1);
        i += 1;
      }
      if ((j + (m + k)) / n / 3 > 220) {
        return -10395552;
      }
      return -1;
    }
    return -10395552;
  }
  
  /* Error */
  private static void a(Context paramContext, ChatBackground paramChatBackground, String paramString)
  {
    // Byte code:
    //   0: getstatic 72	android/graphics/Shader$TileMode:REPEAT	Landroid/graphics/Shader$TileMode;
    //   3: astore_2
    //   4: aload_0
    //   5: invokevirtual 78	android/content/Context:getResources	()Landroid/content/res/Resources;
    //   8: ldc 79
    //   10: invokevirtual 85	android/content/res/Resources:getDrawable	(I)Landroid/graphics/drawable/Drawable;
    //   13: astore 5
    //   15: aload 5
    //   17: instanceof 87
    //   20: ifeq +136 -> 156
    //   23: aload 5
    //   25: checkcast 87	android/graphics/drawable/BitmapDrawable
    //   28: invokevirtual 91	android/graphics/drawable/BitmapDrawable:getBitmap	()Landroid/graphics/Bitmap;
    //   31: astore 4
    //   33: aload 5
    //   35: checkcast 87	android/graphics/drawable/BitmapDrawable
    //   38: invokevirtual 95	android/graphics/drawable/BitmapDrawable:getTileModeX	()Landroid/graphics/Shader$TileMode;
    //   41: astore_2
    //   42: aload 5
    //   44: checkcast 87	android/graphics/drawable/BitmapDrawable
    //   47: invokevirtual 98	android/graphics/drawable/BitmapDrawable:getGravity	()I
    //   50: istore_3
    //   51: aload 4
    //   53: ifnonnull +71 -> 124
    //   56: new 100	java/util/HashMap
    //   59: dup
    //   60: invokespecial 101	java/util/HashMap:<init>	()V
    //   63: astore 5
    //   65: aload 5
    //   67: ldc 103
    //   69: ldc 105
    //   71: invokevirtual 109	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   74: pop
    //   75: aload 5
    //   77: ldc 111
    //   79: getstatic 116	com/tencent/common/app/BaseApplicationImpl:jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl	Lcom/tencent/common/app/BaseApplicationImpl;
    //   82: invokevirtual 119	com/tencent/common/app/BaseApplicationImpl:a	()Lmqq/app/AppRuntime;
    //   85: checkcast 121	com/tencent/mobileqq/app/QQAppInterface
    //   88: invokestatic 127	com/tencent/mobileqq/theme/ThemeUtil:getUserCurrentThemeId	(Lmqq/app/AppRuntime;)Ljava/lang/String;
    //   91: invokevirtual 109	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   94: pop
    //   95: aload_0
    //   96: invokestatic 132	com/tencent/mobileqq/statistics/StatisticCollector:a	(Landroid/content/Context;)Lcom/tencent/mobileqq/statistics/StatisticCollector;
    //   99: getstatic 116	com/tencent/common/app/BaseApplicationImpl:jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl	Lcom/tencent/common/app/BaseApplicationImpl;
    //   102: invokevirtual 119	com/tencent/common/app/BaseApplicationImpl:a	()Lmqq/app/AppRuntime;
    //   105: checkcast 121	com/tencent/mobileqq/app/QQAppInterface
    //   108: invokevirtual 135	com/tencent/mobileqq/app/QQAppInterface:getAccount	()Ljava/lang/String;
    //   111: ldc -119
    //   113: iconst_0
    //   114: lconst_1
    //   115: lconst_0
    //   116: aload 5
    //   118: ldc -117
    //   120: iconst_0
    //   121: invokevirtual 142	com/tencent/mobileqq/statistics/StatisticCollector:a	(Ljava/lang/String;Ljava/lang/String;ZJJLjava/util/HashMap;Ljava/lang/String;Z)V
    //   124: aload 4
    //   126: ifnull +16 -> 142
    //   129: aload_2
    //   130: getstatic 72	android/graphics/Shader$TileMode:REPEAT	Landroid/graphics/Shader$TileMode;
    //   133: if_acmpeq +9 -> 142
    //   136: iload_3
    //   137: bipush 48
    //   139: if_icmpeq +56 -> 195
    //   142: aload_1
    //   143: aload_0
    //   144: invokevirtual 78	android/content/Context:getResources	()Landroid/content/res/Resources;
    //   147: ldc 79
    //   149: invokevirtual 85	android/content/res/Resources:getDrawable	(I)Landroid/graphics/drawable/Drawable;
    //   152: putfield 144	com/tencent/mobileqq/activity/aio/ChatBackground:jdField_a_of_type_AndroidGraphicsDrawableDrawable	Landroid/graphics/drawable/Drawable;
    //   155: return
    //   156: aload 5
    //   158: instanceof 146
    //   161: ifeq +258 -> 419
    //   164: aload 5
    //   166: checkcast 146	com/tencent/theme/SkinnableBitmapDrawable
    //   169: invokevirtual 147	com/tencent/theme/SkinnableBitmapDrawable:getBitmap	()Landroid/graphics/Bitmap;
    //   172: astore 4
    //   174: aload 5
    //   176: checkcast 146	com/tencent/theme/SkinnableBitmapDrawable
    //   179: invokevirtual 148	com/tencent/theme/SkinnableBitmapDrawable:getTileModeX	()Landroid/graphics/Shader$TileMode;
    //   182: astore_2
    //   183: aload 5
    //   185: checkcast 146	com/tencent/theme/SkinnableBitmapDrawable
    //   188: invokevirtual 149	com/tencent/theme/SkinnableBitmapDrawable:getGravity	()I
    //   191: istore_3
    //   192: goto -141 -> 51
    //   195: new 151	com/tencent/mobileqq/drawable/ChatBackgroundDrawable
    //   198: dup
    //   199: aload_0
    //   200: invokevirtual 78	android/content/Context:getResources	()Landroid/content/res/Resources;
    //   203: aload 4
    //   205: invokespecial 154	com/tencent/mobileqq/drawable/ChatBackgroundDrawable:<init>	(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    //   208: astore_2
    //   209: aload_2
    //   210: iload_3
    //   211: invokevirtual 158	com/tencent/mobileqq/drawable/ChatBackgroundDrawable:setGravity	(I)V
    //   214: aload_1
    //   215: aload_2
    //   216: putfield 144	com/tencent/mobileqq/activity/aio/ChatBackground:jdField_a_of_type_AndroidGraphicsDrawableDrawable	Landroid/graphics/drawable/Drawable;
    //   219: return
    //   220: astore_2
    //   221: invokestatic 164	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   224: ifeq +13 -> 237
    //   227: ldc -90
    //   229: iconst_2
    //   230: aload_2
    //   231: invokevirtual 169	java/lang/OutOfMemoryError:getMessage	()Ljava/lang/String;
    //   234: invokestatic 173	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   237: aload_1
    //   238: aload_0
    //   239: invokevirtual 78	android/content/Context:getResources	()Landroid/content/res/Resources;
    //   242: ldc -82
    //   244: invokevirtual 85	android/content/res/Resources:getDrawable	(I)Landroid/graphics/drawable/Drawable;
    //   247: putfield 144	com/tencent/mobileqq/activity/aio/ChatBackground:jdField_a_of_type_AndroidGraphicsDrawableDrawable	Landroid/graphics/drawable/Drawable;
    //   250: new 100	java/util/HashMap
    //   253: dup
    //   254: invokespecial 101	java/util/HashMap:<init>	()V
    //   257: astore_1
    //   258: aload_1
    //   259: ldc 103
    //   261: ldc -80
    //   263: invokevirtual 109	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   266: pop
    //   267: aload_1
    //   268: ldc 111
    //   270: getstatic 116	com/tencent/common/app/BaseApplicationImpl:jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl	Lcom/tencent/common/app/BaseApplicationImpl;
    //   273: invokevirtual 119	com/tencent/common/app/BaseApplicationImpl:a	()Lmqq/app/AppRuntime;
    //   276: checkcast 121	com/tencent/mobileqq/app/QQAppInterface
    //   279: invokestatic 127	com/tencent/mobileqq/theme/ThemeUtil:getUserCurrentThemeId	(Lmqq/app/AppRuntime;)Ljava/lang/String;
    //   282: invokevirtual 109	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   285: pop
    //   286: aload_0
    //   287: invokestatic 132	com/tencent/mobileqq/statistics/StatisticCollector:a	(Landroid/content/Context;)Lcom/tencent/mobileqq/statistics/StatisticCollector;
    //   290: getstatic 116	com/tencent/common/app/BaseApplicationImpl:jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl	Lcom/tencent/common/app/BaseApplicationImpl;
    //   293: invokevirtual 119	com/tencent/common/app/BaseApplicationImpl:a	()Lmqq/app/AppRuntime;
    //   296: checkcast 121	com/tencent/mobileqq/app/QQAppInterface
    //   299: invokevirtual 135	com/tencent/mobileqq/app/QQAppInterface:getAccount	()Ljava/lang/String;
    //   302: ldc -119
    //   304: iconst_0
    //   305: lconst_1
    //   306: lconst_0
    //   307: aload_1
    //   308: ldc -117
    //   310: iconst_0
    //   311: invokevirtual 142	com/tencent/mobileqq/statistics/StatisticCollector:a	(Ljava/lang/String;Ljava/lang/String;ZJJLjava/util/HashMap;Ljava/lang/String;Z)V
    //   314: return
    //   315: astore_0
    //   316: return
    //   317: astore_2
    //   318: invokestatic 164	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   321: ifeq +13 -> 334
    //   324: ldc -78
    //   326: iconst_2
    //   327: aload_2
    //   328: invokevirtual 179	java/lang/Exception:getMessage	()Ljava/lang/String;
    //   331: invokestatic 173	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   334: aload_1
    //   335: aload_0
    //   336: invokevirtual 78	android/content/Context:getResources	()Landroid/content/res/Resources;
    //   339: ldc -82
    //   341: invokevirtual 85	android/content/res/Resources:getDrawable	(I)Landroid/graphics/drawable/Drawable;
    //   344: putfield 144	com/tencent/mobileqq/activity/aio/ChatBackground:jdField_a_of_type_AndroidGraphicsDrawableDrawable	Landroid/graphics/drawable/Drawable;
    //   347: new 100	java/util/HashMap
    //   350: dup
    //   351: invokespecial 101	java/util/HashMap:<init>	()V
    //   354: astore_1
    //   355: aload_1
    //   356: ldc 103
    //   358: ldc -75
    //   360: invokevirtual 109	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   363: pop
    //   364: aload_1
    //   365: ldc 111
    //   367: getstatic 116	com/tencent/common/app/BaseApplicationImpl:jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl	Lcom/tencent/common/app/BaseApplicationImpl;
    //   370: invokevirtual 119	com/tencent/common/app/BaseApplicationImpl:a	()Lmqq/app/AppRuntime;
    //   373: checkcast 121	com/tencent/mobileqq/app/QQAppInterface
    //   376: invokestatic 127	com/tencent/mobileqq/theme/ThemeUtil:getUserCurrentThemeId	(Lmqq/app/AppRuntime;)Ljava/lang/String;
    //   379: invokevirtual 109	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   382: pop
    //   383: aload_0
    //   384: invokestatic 132	com/tencent/mobileqq/statistics/StatisticCollector:a	(Landroid/content/Context;)Lcom/tencent/mobileqq/statistics/StatisticCollector;
    //   387: getstatic 116	com/tencent/common/app/BaseApplicationImpl:jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl	Lcom/tencent/common/app/BaseApplicationImpl;
    //   390: invokevirtual 119	com/tencent/common/app/BaseApplicationImpl:a	()Lmqq/app/AppRuntime;
    //   393: checkcast 121	com/tencent/mobileqq/app/QQAppInterface
    //   396: invokevirtual 135	com/tencent/mobileqq/app/QQAppInterface:getAccount	()Ljava/lang/String;
    //   399: ldc -119
    //   401: iconst_0
    //   402: lconst_1
    //   403: lconst_0
    //   404: aload_1
    //   405: ldc -117
    //   407: iconst_0
    //   408: invokevirtual 142	com/tencent/mobileqq/statistics/StatisticCollector:a	(Ljava/lang/String;Ljava/lang/String;ZJJLjava/util/HashMap;Ljava/lang/String;Z)V
    //   411: return
    //   412: astore_0
    //   413: return
    //   414: astore 5
    //   416: goto -292 -> 124
    //   419: bipush 119
    //   421: istore_3
    //   422: aconst_null
    //   423: astore 4
    //   425: goto -374 -> 51
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	428	0	paramContext	Context
    //   0	428	1	paramChatBackground	ChatBackground
    //   0	428	2	paramString	String
    //   50	372	3	i	int
    //   31	393	4	localBitmap	Bitmap
    //   13	171	5	localObject	Object
    //   414	1	5	localException	Exception
    // Exception table:
    //   from	to	target	type
    //   0	51	220	java/lang/OutOfMemoryError
    //   56	124	220	java/lang/OutOfMemoryError
    //   129	136	220	java/lang/OutOfMemoryError
    //   142	155	220	java/lang/OutOfMemoryError
    //   156	192	220	java/lang/OutOfMemoryError
    //   195	219	220	java/lang/OutOfMemoryError
    //   250	314	315	java/lang/Exception
    //   0	51	317	java/lang/Exception
    //   129	136	317	java/lang/Exception
    //   142	155	317	java/lang/Exception
    //   156	192	317	java/lang/Exception
    //   195	219	317	java/lang/Exception
    //   347	411	412	java/lang/Exception
    //   56	124	414	java/lang/Exception
  }
  
  public static final void a(Context paramContext, String paramString)
  {
    paramContext.getSharedPreferences("chat_background_path_" + paramString, 0).edit().clear().commit();
  }
  
  public static final void a(Context paramContext, String paramString1, String paramString2, String paramString3)
  {
    paramContext = paramContext.getSharedPreferences("chat_background_path_" + paramString1, 0).edit();
    if (paramString2 == null) {
      paramContext.putString("chat_uniform_bg", paramString3);
    }
    for (;;)
    {
      paramContext.commit();
      return;
      paramContext.putString(paramString2, paramString3);
    }
  }
  
  /* Error */
  public static final boolean a(Context paramContext, String paramString1, String paramString2, boolean paramBoolean, ChatBackground paramChatBackground)
  {
    // Byte code:
    //   0: aload_0
    //   1: invokestatic 225	com/tencent/mobileqq/activity/aio/AIOUtils:a	()Ljava/lang/StringBuilder;
    //   4: ldc -69
    //   6: invokevirtual 191	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   9: aload_1
    //   10: invokevirtual 191	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   13: invokevirtual 194	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   16: iconst_0
    //   17: invokevirtual 198	android/content/Context:getSharedPreferences	(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    //   20: astore 10
    //   22: aload 10
    //   24: aload_2
    //   25: aconst_null
    //   26: invokeinterface 229 3 0
    //   31: astore_2
    //   32: aload_2
    //   33: astore_1
    //   34: aload_2
    //   35: ifnonnull +1152 -> 1187
    //   38: aload 10
    //   40: ldc -41
    //   42: aconst_null
    //   43: invokeinterface 229 3 0
    //   48: astore_2
    //   49: aload_2
    //   50: astore_1
    //   51: aload_2
    //   52: ifnonnull +1135 -> 1187
    //   55: ldc -25
    //   57: astore 8
    //   59: invokestatic 164	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   62: ifeq +29 -> 91
    //   65: ldc -23
    //   67: iconst_2
    //   68: new 184	java/lang/StringBuilder
    //   71: dup
    //   72: invokespecial 185	java/lang/StringBuilder:<init>	()V
    //   75: ldc -21
    //   77: invokevirtual 191	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   80: aload 8
    //   82: invokevirtual 191	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   85: invokevirtual 194	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   88: invokestatic 238	com/tencent/qphone/base/util/QLog:i	(Ljava/lang/String;ILjava/lang/String;)V
    //   91: aload 4
    //   93: getfield 240	com/tencent/mobileqq/activity/aio/ChatBackground:b	Ljava/lang/String;
    //   96: aload 8
    //   98: if_acmpeq +1045 -> 1143
    //   101: ldc -117
    //   103: aload 8
    //   105: invokevirtual 246	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   108: ifne +23 -> 131
    //   111: ldc -25
    //   113: aload 8
    //   115: invokevirtual 246	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   118: ifne +13 -> 131
    //   121: ldc -8
    //   123: aload 8
    //   125: invokevirtual 246	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   128: ifeq +35 -> 163
    //   131: aload 4
    //   133: ldc -25
    //   135: putfield 240	com/tencent/mobileqq/activity/aio/ChatBackground:b	Ljava/lang/String;
    //   138: aload 4
    //   140: aload_0
    //   141: invokevirtual 78	android/content/Context:getResources	()Landroid/content/res/Resources;
    //   144: ldc -7
    //   146: invokevirtual 253	android/content/res/Resources:getColorStateList	(I)Landroid/content/res/ColorStateList;
    //   149: putfield 255	com/tencent/mobileqq/activity/aio/ChatBackground:jdField_a_of_type_AndroidContentResColorStateList	Landroid/content/res/ColorStateList;
    //   152: aload_0
    //   153: aload 4
    //   155: aload 8
    //   157: invokestatic 257	com/tencent/mobileqq/activity/aio/ChatBackground:a	(Landroid/content/Context;Lcom/tencent/mobileqq/activity/aio/ChatBackground;Ljava/lang/String;)V
    //   160: goto +1033 -> 1193
    //   163: getstatic 260	com/tencent/common/app/BaseApplicationImpl:jdField_a_of_type_AndroidSupportV4UtilMQLruCache	Landroid/support/v4/util/MQLruCache;
    //   166: aload 8
    //   168: invokevirtual 266	android/support/v4/util/MQLruCache:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   171: ifnull +363 -> 534
    //   174: getstatic 260	com/tencent/common/app/BaseApplicationImpl:jdField_a_of_type_AndroidSupportV4UtilMQLruCache	Landroid/support/v4/util/MQLruCache;
    //   177: aload 8
    //   179: invokevirtual 266	android/support/v4/util/MQLruCache:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   182: checkcast 38	android/graphics/Bitmap
    //   185: astore_1
    //   186: aload_1
    //   187: astore_2
    //   188: aload_1
    //   189: ifnonnull +993 -> 1182
    //   192: new 268	java/io/File
    //   195: dup
    //   196: aload 8
    //   198: invokespecial 271	java/io/File:<init>	(Ljava/lang/String;)V
    //   201: astore_2
    //   202: aload_2
    //   203: ifnull +17 -> 220
    //   206: aload_2
    //   207: invokevirtual 274	java/io/File:exists	()Z
    //   210: ifeq +10 -> 220
    //   213: aload_2
    //   214: invokevirtual 277	java/io/File:isFile	()Z
    //   217: ifne +331 -> 548
    //   220: getstatic 31	com/tencent/mobileqq/activity/aio/ChatBackground:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   223: iconst_1
    //   224: new 184	java/lang/StringBuilder
    //   227: dup
    //   228: invokespecial 185	java/lang/StringBuilder:<init>	()V
    //   231: ldc_w 279
    //   234: invokevirtual 191	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   237: aload 8
    //   239: invokevirtual 191	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   242: invokevirtual 194	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   245: invokestatic 282	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   248: new 100	java/util/HashMap
    //   251: dup
    //   252: invokespecial 101	java/util/HashMap:<init>	()V
    //   255: astore_2
    //   256: aload_2
    //   257: ldc 103
    //   259: ldc_w 284
    //   262: invokevirtual 109	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   265: pop
    //   266: aload_2
    //   267: ldc 111
    //   269: getstatic 116	com/tencent/common/app/BaseApplicationImpl:jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl	Lcom/tencent/common/app/BaseApplicationImpl;
    //   272: invokevirtual 119	com/tencent/common/app/BaseApplicationImpl:a	()Lmqq/app/AppRuntime;
    //   275: checkcast 121	com/tencent/mobileqq/app/QQAppInterface
    //   278: invokestatic 127	com/tencent/mobileqq/theme/ThemeUtil:getUserCurrentThemeId	(Lmqq/app/AppRuntime;)Ljava/lang/String;
    //   281: invokevirtual 109	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   284: pop
    //   285: aload_0
    //   286: invokestatic 132	com/tencent/mobileqq/statistics/StatisticCollector:a	(Landroid/content/Context;)Lcom/tencent/mobileqq/statistics/StatisticCollector;
    //   289: astore 9
    //   291: getstatic 116	com/tencent/common/app/BaseApplicationImpl:jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl	Lcom/tencent/common/app/BaseApplicationImpl;
    //   294: invokevirtual 119	com/tencent/common/app/BaseApplicationImpl:a	()Lmqq/app/AppRuntime;
    //   297: checkcast 121	com/tencent/mobileqq/app/QQAppInterface
    //   300: invokevirtual 135	com/tencent/mobileqq/app/QQAppInterface:getAccount	()Ljava/lang/String;
    //   303: astore 11
    //   305: aload_1
    //   306: ifnull +233 -> 539
    //   309: iconst_1
    //   310: istore_3
    //   311: aload 9
    //   313: aload 11
    //   315: ldc -119
    //   317: iload_3
    //   318: lconst_1
    //   319: lconst_0
    //   320: aload_2
    //   321: ldc -117
    //   323: iconst_0
    //   324: invokevirtual 142	com/tencent/mobileqq/statistics/StatisticCollector:a	(Ljava/lang/String;Ljava/lang/String;ZJJLjava/util/HashMap;Ljava/lang/String;Z)V
    //   327: aload_1
    //   328: ifnull +750 -> 1078
    //   331: getstatic 260	com/tencent/common/app/BaseApplicationImpl:jdField_a_of_type_AndroidSupportV4UtilMQLruCache	Landroid/support/v4/util/MQLruCache;
    //   334: aload 8
    //   336: aload_1
    //   337: invokevirtual 285	android/support/v4/util/MQLruCache:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   340: pop
    //   341: aload 4
    //   343: aload 8
    //   345: putfield 240	com/tencent/mobileqq/activity/aio/ChatBackground:b	Ljava/lang/String;
    //   348: aload 4
    //   350: new 151	com/tencent/mobileqq/drawable/ChatBackgroundDrawable
    //   353: dup
    //   354: aload_0
    //   355: invokevirtual 78	android/content/Context:getResources	()Landroid/content/res/Resources;
    //   358: aload_1
    //   359: invokespecial 154	com/tencent/mobileqq/drawable/ChatBackgroundDrawable:<init>	(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    //   362: putfield 144	com/tencent/mobileqq/activity/aio/ChatBackground:jdField_a_of_type_AndroidGraphicsDrawableDrawable	Landroid/graphics/drawable/Drawable;
    //   365: new 184	java/lang/StringBuilder
    //   368: dup
    //   369: invokespecial 185	java/lang/StringBuilder:<init>	()V
    //   372: ldc_w 287
    //   375: invokevirtual 191	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   378: aload 8
    //   380: invokevirtual 191	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   383: invokevirtual 194	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   386: astore_2
    //   387: aload 10
    //   389: aload_2
    //   390: invokeinterface 291 2 0
    //   395: ifeq +643 -> 1038
    //   398: aload 4
    //   400: aload 10
    //   402: aload_2
    //   403: ldc 10
    //   405: invokeinterface 295 3 0
    //   410: invokestatic 300	android/content/res/ColorStateList:valueOf	(I)Landroid/content/res/ColorStateList;
    //   413: putfield 255	com/tencent/mobileqq/activity/aio/ChatBackground:jdField_a_of_type_AndroidContentResColorStateList	Landroid/content/res/ColorStateList;
    //   416: goto +777 -> 1193
    //   419: astore_1
    //   420: getstatic 31	com/tencent/mobileqq/activity/aio/ChatBackground:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   423: iconst_1
    //   424: new 184	java/lang/StringBuilder
    //   427: dup
    //   428: invokespecial 185	java/lang/StringBuilder:<init>	()V
    //   431: ldc_w 302
    //   434: invokevirtual 191	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   437: aload 8
    //   439: invokevirtual 191	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   442: invokevirtual 194	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   445: invokestatic 282	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   448: aload 4
    //   450: aload_0
    //   451: invokevirtual 78	android/content/Context:getResources	()Landroid/content/res/Resources;
    //   454: ldc -82
    //   456: invokevirtual 85	android/content/res/Resources:getDrawable	(I)Landroid/graphics/drawable/Drawable;
    //   459: putfield 144	com/tencent/mobileqq/activity/aio/ChatBackground:jdField_a_of_type_AndroidGraphicsDrawableDrawable	Landroid/graphics/drawable/Drawable;
    //   462: new 100	java/util/HashMap
    //   465: dup
    //   466: invokespecial 101	java/util/HashMap:<init>	()V
    //   469: astore_1
    //   470: aload_1
    //   471: ldc 103
    //   473: ldc_w 304
    //   476: invokevirtual 109	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   479: pop
    //   480: aload_1
    //   481: ldc 111
    //   483: getstatic 116	com/tencent/common/app/BaseApplicationImpl:jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl	Lcom/tencent/common/app/BaseApplicationImpl;
    //   486: invokevirtual 119	com/tencent/common/app/BaseApplicationImpl:a	()Lmqq/app/AppRuntime;
    //   489: checkcast 121	com/tencent/mobileqq/app/QQAppInterface
    //   492: invokestatic 127	com/tencent/mobileqq/theme/ThemeUtil:getUserCurrentThemeId	(Lmqq/app/AppRuntime;)Ljava/lang/String;
    //   495: invokevirtual 109	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   498: pop
    //   499: aload_0
    //   500: invokestatic 132	com/tencent/mobileqq/statistics/StatisticCollector:a	(Landroid/content/Context;)Lcom/tencent/mobileqq/statistics/StatisticCollector;
    //   503: getstatic 116	com/tencent/common/app/BaseApplicationImpl:jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl	Lcom/tencent/common/app/BaseApplicationImpl;
    //   506: invokevirtual 119	com/tencent/common/app/BaseApplicationImpl:a	()Lmqq/app/AppRuntime;
    //   509: checkcast 121	com/tencent/mobileqq/app/QQAppInterface
    //   512: invokevirtual 135	com/tencent/mobileqq/app/QQAppInterface:getAccount	()Ljava/lang/String;
    //   515: ldc -119
    //   517: iconst_0
    //   518: lconst_1
    //   519: lconst_0
    //   520: aload_1
    //   521: ldc -117
    //   523: iconst_0
    //   524: invokevirtual 142	com/tencent/mobileqq/statistics/StatisticCollector:a	(Ljava/lang/String;Ljava/lang/String;ZJJLjava/util/HashMap;Ljava/lang/String;Z)V
    //   527: goto +666 -> 1193
    //   530: astore_0
    //   531: goto +662 -> 1193
    //   534: aconst_null
    //   535: astore_1
    //   536: goto -350 -> 186
    //   539: iconst_0
    //   540: istore_3
    //   541: goto -230 -> 311
    //   544: astore_2
    //   545: goto -218 -> 327
    //   548: new 306	android/graphics/BitmapFactory$Options
    //   551: dup
    //   552: invokespecial 307	android/graphics/BitmapFactory$Options:<init>	()V
    //   555: astore 11
    //   557: aload 11
    //   559: getstatic 313	android/graphics/Bitmap$Config:RGB_565	Landroid/graphics/Bitmap$Config;
    //   562: putfield 316	android/graphics/BitmapFactory$Options:inPreferredConfig	Landroid/graphics/Bitmap$Config;
    //   565: aload 11
    //   567: iconst_1
    //   568: putfield 319	android/graphics/BitmapFactory$Options:inJustDecodeBounds	Z
    //   571: aload 8
    //   573: aload 11
    //   575: invokestatic 324	com/tencent/mobileqq/util/BitmapManager:a	(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    //   578: pop
    //   579: aload_0
    //   580: invokevirtual 78	android/content/Context:getResources	()Landroid/content/res/Resources;
    //   583: invokevirtual 328	android/content/res/Resources:getDisplayMetrics	()Landroid/util/DisplayMetrics;
    //   586: getfield 333	android/util/DisplayMetrics:heightPixels	I
    //   589: aload_0
    //   590: invokestatic 338	com/tencent/widget/immersive/ImmersiveUtils:a	(Landroid/content/Context;)I
    //   593: isub
    //   594: aload_0
    //   595: invokevirtual 78	android/content/Context:getResources	()Landroid/content/res/Resources;
    //   598: ldc_w 339
    //   601: invokevirtual 342	android/content/res/Resources:getDimensionPixelSize	(I)I
    //   604: isub
    //   605: aload_0
    //   606: ldc_w 343
    //   609: invokestatic 348	com/tencent/mobileqq/utils/DisplayUtils:a	(Landroid/content/Context;F)F
    //   612: f2i
    //   613: isub
    //   614: istore 6
    //   616: aload_0
    //   617: invokevirtual 78	android/content/Context:getResources	()Landroid/content/res/Resources;
    //   620: invokevirtual 328	android/content/res/Resources:getDisplayMetrics	()Landroid/util/DisplayMetrics;
    //   623: getfield 351	android/util/DisplayMetrics:widthPixels	I
    //   626: istore 7
    //   628: iload 6
    //   630: istore 5
    //   632: iload 6
    //   634: sipush 400
    //   637: if_icmpge +558 -> 1195
    //   640: sipush 400
    //   643: istore 5
    //   645: goto +550 -> 1195
    //   648: aload 11
    //   650: getfield 354	android/graphics/BitmapFactory$Options:outHeight	I
    //   653: iload 5
    //   655: idiv
    //   656: i2d
    //   657: invokestatic 360	java/lang/Math:ceil	(D)D
    //   660: d2i
    //   661: istore 5
    //   663: aload 11
    //   665: getfield 363	android/graphics/BitmapFactory$Options:outWidth	I
    //   668: iload 6
    //   670: idiv
    //   671: i2d
    //   672: invokestatic 360	java/lang/Math:ceil	(D)D
    //   675: d2i
    //   676: istore 6
    //   678: iload 5
    //   680: iconst_1
    //   681: if_icmpgt +9 -> 690
    //   684: iload 6
    //   686: iconst_1
    //   687: if_icmple +342 -> 1029
    //   690: iload 5
    //   692: iload 6
    //   694: if_icmple +325 -> 1019
    //   697: aload 11
    //   699: iload 5
    //   701: putfield 366	android/graphics/BitmapFactory$Options:inSampleSize	I
    //   704: aload 11
    //   706: iconst_0
    //   707: putfield 319	android/graphics/BitmapFactory$Options:inJustDecodeBounds	Z
    //   710: aload 8
    //   712: aload 11
    //   714: invokestatic 369	com/tencent/mobileqq/util/BitmapManager:a	(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Lcom/tencent/mobileqq/util/BitmapManager$BitmapDecodeResult;
    //   717: astore 9
    //   719: aload 9
    //   721: getfield 374	com/tencent/mobileqq/util/BitmapManager$BitmapDecodeResult:a	Landroid/graphics/Bitmap;
    //   724: astore_1
    //   725: new 100	java/util/HashMap
    //   728: dup
    //   729: invokespecial 101	java/util/HashMap:<init>	()V
    //   732: astore_2
    //   733: aload_2
    //   734: ldc 103
    //   736: new 184	java/lang/StringBuilder
    //   739: dup
    //   740: invokespecial 185	java/lang/StringBuilder:<init>	()V
    //   743: ldc_w 376
    //   746: invokevirtual 191	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   749: aload 9
    //   751: getfield 378	com/tencent/mobileqq/util/BitmapManager$BitmapDecodeResult:e	I
    //   754: invokevirtual 381	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   757: invokevirtual 194	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   760: invokevirtual 109	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   763: pop
    //   764: aload_2
    //   765: ldc 111
    //   767: getstatic 116	com/tencent/common/app/BaseApplicationImpl:jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl	Lcom/tencent/common/app/BaseApplicationImpl;
    //   770: invokevirtual 119	com/tencent/common/app/BaseApplicationImpl:a	()Lmqq/app/AppRuntime;
    //   773: checkcast 121	com/tencent/mobileqq/app/QQAppInterface
    //   776: invokestatic 127	com/tencent/mobileqq/theme/ThemeUtil:getUserCurrentThemeId	(Lmqq/app/AppRuntime;)Ljava/lang/String;
    //   779: invokevirtual 109	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   782: pop
    //   783: aload_0
    //   784: invokestatic 132	com/tencent/mobileqq/statistics/StatisticCollector:a	(Landroid/content/Context;)Lcom/tencent/mobileqq/statistics/StatisticCollector;
    //   787: astore 12
    //   789: getstatic 116	com/tencent/common/app/BaseApplicationImpl:jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl	Lcom/tencent/common/app/BaseApplicationImpl;
    //   792: invokevirtual 119	com/tencent/common/app/BaseApplicationImpl:a	()Lmqq/app/AppRuntime;
    //   795: checkcast 121	com/tencent/mobileqq/app/QQAppInterface
    //   798: invokevirtual 135	com/tencent/mobileqq/app/QQAppInterface:getAccount	()Ljava/lang/String;
    //   801: astore 13
    //   803: aload_1
    //   804: ifnull +411 -> 1215
    //   807: iconst_1
    //   808: istore_3
    //   809: aload 12
    //   811: aload 13
    //   813: ldc -119
    //   815: iload_3
    //   816: lconst_1
    //   817: lconst_0
    //   818: aload_2
    //   819: ldc -117
    //   821: iconst_0
    //   822: invokevirtual 142	com/tencent/mobileqq/statistics/StatisticCollector:a	(Ljava/lang/String;Ljava/lang/String;ZJJLjava/util/HashMap;Ljava/lang/String;Z)V
    //   825: aload_1
    //   826: astore_2
    //   827: aload 9
    //   829: getfield 378	com/tencent/mobileqq/util/BitmapManager$BitmapDecodeResult:e	I
    //   832: iconst_1
    //   833: if_icmpne +349 -> 1182
    //   836: getstatic 31	com/tencent/mobileqq/activity/aio/ChatBackground:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   839: iconst_1
    //   840: new 184	java/lang/StringBuilder
    //   843: dup
    //   844: invokespecial 185	java/lang/StringBuilder:<init>	()V
    //   847: ldc_w 383
    //   850: invokevirtual 191	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   853: aload 8
    //   855: invokevirtual 191	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   858: invokevirtual 194	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   861: invokestatic 282	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   864: aload 11
    //   866: getfield 366	android/graphics/BitmapFactory$Options:inSampleSize	I
    //   869: iconst_2
    //   870: imul
    //   871: istore 5
    //   873: aload 9
    //   875: astore_2
    //   876: iload 5
    //   878: bipush 32
    //   880: if_icmpgt +35 -> 915
    //   883: aload 11
    //   885: iload 5
    //   887: putfield 366	android/graphics/BitmapFactory$Options:inSampleSize	I
    //   890: aload 8
    //   892: aload 11
    //   894: invokestatic 369	com/tencent/mobileqq/util/BitmapManager:a	(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Lcom/tencent/mobileqq/util/BitmapManager$BitmapDecodeResult;
    //   897: astore_2
    //   898: aload_2
    //   899: getfield 374	com/tencent/mobileqq/util/BitmapManager$BitmapDecodeResult:a	Landroid/graphics/Bitmap;
    //   902: astore_1
    //   903: aload_2
    //   904: getfield 378	com/tencent/mobileqq/util/BitmapManager$BitmapDecodeResult:e	I
    //   907: istore 6
    //   909: iload 6
    //   911: iconst_1
    //   912: if_icmpeq +308 -> 1220
    //   915: new 100	java/util/HashMap
    //   918: dup
    //   919: invokespecial 101	java/util/HashMap:<init>	()V
    //   922: astore 9
    //   924: aload 9
    //   926: ldc 103
    //   928: new 184	java/lang/StringBuilder
    //   931: dup
    //   932: invokespecial 185	java/lang/StringBuilder:<init>	()V
    //   935: ldc_w 385
    //   938: invokevirtual 191	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   941: aload_2
    //   942: getfield 378	com/tencent/mobileqq/util/BitmapManager$BitmapDecodeResult:e	I
    //   945: invokevirtual 381	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   948: invokevirtual 194	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   951: invokevirtual 109	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   954: pop
    //   955: aload 9
    //   957: ldc 111
    //   959: getstatic 116	com/tencent/common/app/BaseApplicationImpl:jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl	Lcom/tencent/common/app/BaseApplicationImpl;
    //   962: invokevirtual 119	com/tencent/common/app/BaseApplicationImpl:a	()Lmqq/app/AppRuntime;
    //   965: checkcast 121	com/tencent/mobileqq/app/QQAppInterface
    //   968: invokestatic 127	com/tencent/mobileqq/theme/ThemeUtil:getUserCurrentThemeId	(Lmqq/app/AppRuntime;)Ljava/lang/String;
    //   971: invokevirtual 109	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   974: pop
    //   975: aload_0
    //   976: invokestatic 132	com/tencent/mobileqq/statistics/StatisticCollector:a	(Landroid/content/Context;)Lcom/tencent/mobileqq/statistics/StatisticCollector;
    //   979: astore_2
    //   980: getstatic 116	com/tencent/common/app/BaseApplicationImpl:jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl	Lcom/tencent/common/app/BaseApplicationImpl;
    //   983: invokevirtual 119	com/tencent/common/app/BaseApplicationImpl:a	()Lmqq/app/AppRuntime;
    //   986: checkcast 121	com/tencent/mobileqq/app/QQAppInterface
    //   989: invokevirtual 135	com/tencent/mobileqq/app/QQAppInterface:getAccount	()Ljava/lang/String;
    //   992: astore 11
    //   994: aload_1
    //   995: ifnull +234 -> 1229
    //   998: iconst_1
    //   999: istore_3
    //   1000: aload_2
    //   1001: aload 11
    //   1003: ldc -119
    //   1005: iload_3
    //   1006: lconst_1
    //   1007: lconst_0
    //   1008: aload 9
    //   1010: ldc -117
    //   1012: iconst_0
    //   1013: invokevirtual 142	com/tencent/mobileqq/statistics/StatisticCollector:a	(Ljava/lang/String;Ljava/lang/String;ZJJLjava/util/HashMap;Ljava/lang/String;Z)V
    //   1016: goto -689 -> 327
    //   1019: aload 11
    //   1021: iload 6
    //   1023: putfield 366	android/graphics/BitmapFactory$Options:inSampleSize	I
    //   1026: goto -322 -> 704
    //   1029: aload 11
    //   1031: iconst_1
    //   1032: putfield 366	android/graphics/BitmapFactory$Options:inSampleSize	I
    //   1035: goto -331 -> 704
    //   1038: aload_1
    //   1039: invokestatic 387	com/tencent/mobileqq/activity/aio/ChatBackground:a	(Landroid/graphics/Bitmap;)I
    //   1042: istore 5
    //   1044: aload 4
    //   1046: iload 5
    //   1048: invokestatic 300	android/content/res/ColorStateList:valueOf	(I)Landroid/content/res/ColorStateList;
    //   1051: putfield 255	com/tencent/mobileqq/activity/aio/ChatBackground:jdField_a_of_type_AndroidContentResColorStateList	Landroid/content/res/ColorStateList;
    //   1054: aload 10
    //   1056: invokeinterface 204 1 0
    //   1061: aload_2
    //   1062: iload 5
    //   1064: invokeinterface 391 3 0
    //   1069: invokeinterface 212 1 0
    //   1074: pop
    //   1075: goto +118 -> 1193
    //   1078: invokestatic 164	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1081: ifeq +30 -> 1111
    //   1084: ldc -23
    //   1086: iconst_2
    //   1087: new 184	java/lang/StringBuilder
    //   1090: dup
    //   1091: invokespecial 185	java/lang/StringBuilder:<init>	()V
    //   1094: ldc_w 393
    //   1097: invokevirtual 191	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1100: aload 8
    //   1102: invokevirtual 191	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1105: invokevirtual 194	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1108: invokestatic 173	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   1111: aload 4
    //   1113: ldc -25
    //   1115: putfield 240	com/tencent/mobileqq/activity/aio/ChatBackground:b	Ljava/lang/String;
    //   1118: aload 4
    //   1120: aload_0
    //   1121: invokevirtual 78	android/content/Context:getResources	()Landroid/content/res/Resources;
    //   1124: ldc -7
    //   1126: invokevirtual 253	android/content/res/Resources:getColorStateList	(I)Landroid/content/res/ColorStateList;
    //   1129: putfield 255	com/tencent/mobileqq/activity/aio/ChatBackground:jdField_a_of_type_AndroidContentResColorStateList	Landroid/content/res/ColorStateList;
    //   1132: aload_0
    //   1133: aload 4
    //   1135: aload 8
    //   1137: invokestatic 257	com/tencent/mobileqq/activity/aio/ChatBackground:a	(Landroid/content/Context;Lcom/tencent/mobileqq/activity/aio/ChatBackground;Ljava/lang/String;)V
    //   1140: goto +53 -> 1193
    //   1143: invokestatic 164	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1146: ifeq +30 -> 1176
    //   1149: ldc -23
    //   1151: iconst_2
    //   1152: new 184	java/lang/StringBuilder
    //   1155: dup
    //   1156: invokespecial 185	java/lang/StringBuilder:<init>	()V
    //   1159: ldc_w 395
    //   1162: invokevirtual 191	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1165: aload 8
    //   1167: invokevirtual 191	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1170: invokevirtual 194	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1173: invokestatic 173	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   1176: iconst_0
    //   1177: ireturn
    //   1178: astore_2
    //   1179: goto -354 -> 825
    //   1182: aload_2
    //   1183: astore_1
    //   1184: goto -857 -> 327
    //   1187: aload_1
    //   1188: astore 8
    //   1190: goto -1131 -> 59
    //   1193: iconst_1
    //   1194: ireturn
    //   1195: iload 7
    //   1197: istore 6
    //   1199: iload 7
    //   1201: sipush 300
    //   1204: if_icmpge -556 -> 648
    //   1207: sipush 300
    //   1210: istore 6
    //   1212: goto -564 -> 648
    //   1215: iconst_0
    //   1216: istore_3
    //   1217: goto -408 -> 809
    //   1220: iload 5
    //   1222: iconst_2
    //   1223: imul
    //   1224: istore 5
    //   1226: goto -350 -> 876
    //   1229: iconst_0
    //   1230: istore_3
    //   1231: goto -231 -> 1000
    //   1234: astore_2
    //   1235: goto -908 -> 327
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	1238	0	paramContext	Context
    //   0	1238	1	paramString1	String
    //   0	1238	2	paramString2	String
    //   0	1238	3	paramBoolean	boolean
    //   0	1238	4	paramChatBackground	ChatBackground
    //   630	595	5	i	int
    //   614	597	6	j	int
    //   626	579	7	k	int
    //   57	1132	8	str1	String
    //   289	720	9	localObject1	Object
    //   20	1035	10	localSharedPreferences	SharedPreferences
    //   303	727	11	localObject2	Object
    //   787	23	12	localStatisticCollector	com.tencent.mobileqq.statistics.StatisticCollector
    //   801	11	13	str2	String
    // Exception table:
    //   from	to	target	type
    //   101	131	419	java/lang/OutOfMemoryError
    //   131	160	419	java/lang/OutOfMemoryError
    //   163	186	419	java/lang/OutOfMemoryError
    //   192	202	419	java/lang/OutOfMemoryError
    //   206	220	419	java/lang/OutOfMemoryError
    //   220	248	419	java/lang/OutOfMemoryError
    //   248	305	419	java/lang/OutOfMemoryError
    //   311	327	419	java/lang/OutOfMemoryError
    //   331	416	419	java/lang/OutOfMemoryError
    //   548	628	419	java/lang/OutOfMemoryError
    //   648	678	419	java/lang/OutOfMemoryError
    //   697	704	419	java/lang/OutOfMemoryError
    //   704	725	419	java/lang/OutOfMemoryError
    //   725	803	419	java/lang/OutOfMemoryError
    //   809	825	419	java/lang/OutOfMemoryError
    //   827	873	419	java/lang/OutOfMemoryError
    //   883	909	419	java/lang/OutOfMemoryError
    //   915	994	419	java/lang/OutOfMemoryError
    //   1000	1016	419	java/lang/OutOfMemoryError
    //   1019	1026	419	java/lang/OutOfMemoryError
    //   1029	1035	419	java/lang/OutOfMemoryError
    //   1038	1075	419	java/lang/OutOfMemoryError
    //   1078	1111	419	java/lang/OutOfMemoryError
    //   1111	1140	419	java/lang/OutOfMemoryError
    //   462	527	530	java/lang/Exception
    //   248	305	544	java/lang/Exception
    //   311	327	544	java/lang/Exception
    //   725	803	1178	java/lang/Exception
    //   809	825	1178	java/lang/Exception
    //   915	994	1234	java/lang/Exception
    //   1000	1016	1234	java/lang/Exception
  }
  
  public static final void b(Context paramContext, String paramString1, String paramString2, String paramString3)
  {
    paramContext = paramContext.getSharedPreferences("chat_background_path_" + paramString1, 0);
    paramString1 = paramContext.edit();
    if (paramString2 == null)
    {
      paramString1.putString("chat_uniform_bg", paramString3);
      paramString2 = paramContext.getAll();
      if (paramString2 != null)
      {
        paramString2 = paramString2.keySet().iterator();
        while (paramString2.hasNext())
        {
          String str1 = (String)paramString2.next();
          if (Pattern.compile("[0-9]*").matcher(str1).matches())
          {
            String str2 = paramContext.getString(str1, "null");
            boolean bool = paramContext.getBoolean(str1 + "_is_c2c_set", false);
            if ((str2 == null) || (str2.trim().length() == 0) || (str2.equals("null")) || (str2.equals("none")) || (!bool)) {
              paramString1.putString(str1, paramString3);
            }
          }
        }
      }
    }
    else
    {
      paramString1.putString(paramString2, paramString3);
      if (!paramString3.equals("null")) {
        break label254;
      }
      paramString1.putBoolean(paramString2 + "_is_c2c_set", false);
    }
    for (;;)
    {
      paramString1.commit();
      return;
      label254:
      paramString1.putBoolean(paramString2 + "_is_c2c_set", true);
    }
  }
}
