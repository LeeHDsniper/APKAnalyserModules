package com.tencent.mobileqq.activity.photo;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.transfile.bitmapcreator.BitmapDecoder;

public class RegionalThumbDecoder
  implements BitmapDecoder
{
  public RegionalThumbDecoder()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  /* Error */
  public android.graphics.Bitmap a(java.net.URL paramURL)
  {
    // Byte code:
    //   0: aload_1
    //   1: invokestatic 28	com/tencent/mobileqq/activity/photo/LocalMediaInfo:a	(Ljava/net/URL;)Lcom/tencent/mobileqq/activity/photo/LocalMediaInfo;
    //   4: astore 7
    //   6: aload 7
    //   8: ifnull +473 -> 481
    //   11: new 30	android/graphics/BitmapFactory$Options
    //   14: dup
    //   15: invokespecial 31	android/graphics/BitmapFactory$Options:<init>	()V
    //   18: astore_1
    //   19: aload_1
    //   20: iconst_1
    //   21: putfield 34	android/graphics/BitmapFactory$Options:inJustDecodeBounds	Z
    //   24: aload 7
    //   26: getfield 37	com/tencent/mobileqq/activity/photo/LocalMediaInfo:a	Ljava/lang/String;
    //   29: aload_1
    //   30: invokestatic 43	com/tencent/image/SafeBitmapFactory:decodeFile	(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    //   33: pop
    //   34: aload_1
    //   35: getfield 47	android/graphics/BitmapFactory$Options:outWidth	I
    //   38: aload_1
    //   39: getfield 50	android/graphics/BitmapFactory$Options:outHeight	I
    //   42: if_icmple +95 -> 137
    //   45: aload_1
    //   46: getfield 50	android/graphics/BitmapFactory$Options:outHeight	I
    //   49: istore_3
    //   50: aload_1
    //   51: getfield 47	android/graphics/BitmapFactory$Options:outWidth	I
    //   54: aload_1
    //   55: getfield 50	android/graphics/BitmapFactory$Options:outHeight	I
    //   58: idiv
    //   59: i2f
    //   60: fstore_2
    //   61: fload_2
    //   62: ldc 51
    //   64: fcmpg
    //   65: ifgt +91 -> 156
    //   68: aload_1
    //   69: aload_1
    //   70: getfield 47	android/graphics/BitmapFactory$Options:outWidth	I
    //   73: aload_1
    //   74: getfield 50	android/graphics/BitmapFactory$Options:outHeight	I
    //   77: aload 7
    //   79: getfield 54	com/tencent/mobileqq/activity/photo/LocalMediaInfo:f	I
    //   82: invokestatic 59	com/tencent/mobileqq/activity/photo/ThumbDecoder:a	(III)I
    //   85: putfield 62	android/graphics/BitmapFactory$Options:inSampleSize	I
    //   88: aload_1
    //   89: iconst_0
    //   90: putfield 34	android/graphics/BitmapFactory$Options:inJustDecodeBounds	Z
    //   93: aload_1
    //   94: getstatic 68	android/graphics/Bitmap$Config:RGB_565	Landroid/graphics/Bitmap$Config;
    //   97: putfield 71	android/graphics/BitmapFactory$Options:inPreferredConfig	Landroid/graphics/Bitmap$Config;
    //   100: aload 7
    //   102: getfield 37	com/tencent/mobileqq/activity/photo/LocalMediaInfo:a	Ljava/lang/String;
    //   105: aload_1
    //   106: invokestatic 74	android/graphics/BitmapFactory:decodeFile	(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    //   109: astore_1
    //   110: aload_1
    //   111: ifnonnull +112 -> 223
    //   114: aload_1
    //   115: astore 6
    //   117: invokestatic 80	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   120: ifeq +14 -> 134
    //   123: ldc 82
    //   125: iconst_2
    //   126: ldc 84
    //   128: invokestatic 88	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   131: aload_1
    //   132: astore 6
    //   134: aload 6
    //   136: areturn
    //   137: aload_1
    //   138: getfield 47	android/graphics/BitmapFactory$Options:outWidth	I
    //   141: istore_3
    //   142: aload_1
    //   143: getfield 50	android/graphics/BitmapFactory$Options:outHeight	I
    //   146: aload_1
    //   147: getfield 47	android/graphics/BitmapFactory$Options:outWidth	I
    //   150: idiv
    //   151: i2f
    //   152: fstore_2
    //   153: goto -92 -> 61
    //   156: new 90	android/graphics/Rect
    //   159: dup
    //   160: iconst_0
    //   161: iconst_0
    //   162: iload_3
    //   163: iload_3
    //   164: invokespecial 93	android/graphics/Rect:<init>	(IIII)V
    //   167: astore 8
    //   169: aload_1
    //   170: iload_3
    //   171: iload_3
    //   172: aload 7
    //   174: getfield 54	com/tencent/mobileqq/activity/photo/LocalMediaInfo:f	I
    //   177: invokestatic 59	com/tencent/mobileqq/activity/photo/ThumbDecoder:a	(III)I
    //   180: putfield 62	android/graphics/BitmapFactory$Options:inSampleSize	I
    //   183: aload_1
    //   184: iconst_0
    //   185: putfield 34	android/graphics/BitmapFactory$Options:inJustDecodeBounds	Z
    //   188: aload_1
    //   189: getstatic 68	android/graphics/Bitmap$Config:RGB_565	Landroid/graphics/Bitmap$Config;
    //   192: putfield 71	android/graphics/BitmapFactory$Options:inPreferredConfig	Landroid/graphics/Bitmap$Config;
    //   195: aload 7
    //   197: getfield 37	com/tencent/mobileqq/activity/photo/LocalMediaInfo:a	Ljava/lang/String;
    //   200: iconst_1
    //   201: invokestatic 99	android/graphics/BitmapRegionDecoder:newInstance	(Ljava/lang/String;Z)Landroid/graphics/BitmapRegionDecoder;
    //   204: astore 6
    //   206: aload 6
    //   208: aload 8
    //   210: aload_1
    //   211: invokevirtual 103	android/graphics/BitmapRegionDecoder:decodeRegion	(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    //   214: astore_1
    //   215: aload 6
    //   217: invokevirtual 106	android/graphics/BitmapRegionDecoder:recycle	()V
    //   220: goto -110 -> 110
    //   223: aload 7
    //   225: getfield 37	com/tencent/mobileqq/activity/photo/LocalMediaInfo:a	Ljava/lang/String;
    //   228: invokestatic 109	com/tencent/mobileqq/activity/photo/ThumbDecoder:a	(Ljava/lang/String;)I
    //   231: istore_3
    //   232: iload_3
    //   233: ifne +30 -> 263
    //   236: aload_1
    //   237: invokevirtual 115	android/graphics/Bitmap:getWidth	()I
    //   240: aload 7
    //   242: getfield 54	com/tencent/mobileqq/activity/photo/LocalMediaInfo:f	I
    //   245: if_icmpne +18 -> 263
    //   248: aload_1
    //   249: astore 6
    //   251: aload_1
    //   252: invokevirtual 118	android/graphics/Bitmap:getHeight	()I
    //   255: aload 7
    //   257: getfield 54	com/tencent/mobileqq/activity/photo/LocalMediaInfo:f	I
    //   260: if_icmpeq -126 -> 134
    //   263: aload_1
    //   264: invokevirtual 115	android/graphics/Bitmap:getWidth	()I
    //   267: istore 4
    //   269: aload_1
    //   270: invokevirtual 118	android/graphics/Bitmap:getHeight	()I
    //   273: istore 5
    //   275: new 90	android/graphics/Rect
    //   278: dup
    //   279: invokespecial 119	android/graphics/Rect:<init>	()V
    //   282: astore 6
    //   284: new 121	android/graphics/RectF
    //   287: dup
    //   288: fconst_0
    //   289: fconst_0
    //   290: aload 7
    //   292: getfield 54	com/tencent/mobileqq/activity/photo/LocalMediaInfo:f	I
    //   295: i2f
    //   296: aload 7
    //   298: getfield 54	com/tencent/mobileqq/activity/photo/LocalMediaInfo:f	I
    //   301: i2f
    //   302: invokespecial 124	android/graphics/RectF:<init>	(FFFF)V
    //   305: astore 8
    //   307: iload 4
    //   309: iload 5
    //   311: if_icmple +116 -> 427
    //   314: iload 4
    //   316: iload 5
    //   318: isub
    //   319: iconst_2
    //   320: idiv
    //   321: istore 4
    //   323: aload 6
    //   325: iload 4
    //   327: iconst_0
    //   328: iload 4
    //   330: iload 5
    //   332: iadd
    //   333: iload 5
    //   335: iconst_0
    //   336: iadd
    //   337: invokevirtual 127	android/graphics/Rect:set	(IIII)V
    //   340: aload 7
    //   342: getfield 54	com/tencent/mobileqq/activity/photo/LocalMediaInfo:f	I
    //   345: aload 7
    //   347: getfield 54	com/tencent/mobileqq/activity/photo/LocalMediaInfo:f	I
    //   350: getstatic 68	android/graphics/Bitmap$Config:RGB_565	Landroid/graphics/Bitmap$Config;
    //   353: invokestatic 131	android/graphics/Bitmap:createBitmap	(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    //   356: astore 9
    //   358: new 133	android/graphics/Canvas
    //   361: dup
    //   362: aload 9
    //   364: invokespecial 136	android/graphics/Canvas:<init>	(Landroid/graphics/Bitmap;)V
    //   367: astore 10
    //   369: iload_3
    //   370: ifeq +26 -> 396
    //   373: aload 10
    //   375: iload_3
    //   376: i2f
    //   377: aload 7
    //   379: getfield 54	com/tencent/mobileqq/activity/photo/LocalMediaInfo:f	I
    //   382: i2f
    //   383: fconst_2
    //   384: fdiv
    //   385: aload 7
    //   387: getfield 54	com/tencent/mobileqq/activity/photo/LocalMediaInfo:f	I
    //   390: i2f
    //   391: fconst_2
    //   392: fdiv
    //   393: invokevirtual 140	android/graphics/Canvas:rotate	(FFF)V
    //   396: aload 10
    //   398: aload_1
    //   399: aload 6
    //   401: aload 8
    //   403: new 142	android/graphics/Paint
    //   406: dup
    //   407: bipush 6
    //   409: invokespecial 145	android/graphics/Paint:<init>	(I)V
    //   412: invokevirtual 149	android/graphics/Canvas:drawBitmap	(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
    //   415: aload 9
    //   417: ifnull +64 -> 481
    //   420: aload_1
    //   421: invokevirtual 150	android/graphics/Bitmap:recycle	()V
    //   424: aload 9
    //   426: areturn
    //   427: iload 5
    //   429: iload 4
    //   431: isub
    //   432: iconst_2
    //   433: idiv
    //   434: istore 5
    //   436: aload 6
    //   438: iconst_0
    //   439: iload 5
    //   441: iconst_0
    //   442: iload 4
    //   444: iadd
    //   445: iload 4
    //   447: iload 5
    //   449: iadd
    //   450: invokevirtual 127	android/graphics/Rect:set	(IIII)V
    //   453: goto -113 -> 340
    //   456: astore 6
    //   458: invokestatic 80	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   461: ifeq +13 -> 474
    //   464: ldc 82
    //   466: iconst_2
    //   467: ldc -104
    //   469: aload 6
    //   471: invokestatic 155	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   474: aload_1
    //   475: astore 6
    //   477: aload_1
    //   478: ifnonnull -344 -> 134
    //   481: aconst_null
    //   482: areturn
    //   483: astore 6
    //   485: aconst_null
    //   486: astore_1
    //   487: invokestatic 80	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   490: ifeq +13 -> 503
    //   493: ldc 82
    //   495: iconst_2
    //   496: ldc -99
    //   498: aload 6
    //   500: invokestatic 155	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   503: aload_1
    //   504: ifnull -23 -> 481
    //   507: aload_1
    //   508: areturn
    //   509: astore 6
    //   511: goto -24 -> 487
    //   514: astore 6
    //   516: goto -29 -> 487
    //   519: astore 6
    //   521: aconst_null
    //   522: astore_1
    //   523: goto -65 -> 458
    //   526: astore 6
    //   528: goto -70 -> 458
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	531	0	this	RegionalThumbDecoder
    //   0	531	1	paramURL	java.net.URL
    //   60	93	2	f	float
    //   49	327	3	i	int
    //   267	183	4	j	int
    //   273	177	5	k	int
    //   115	322	6	localObject1	Object
    //   456	14	6	localOutOfMemoryError1	OutOfMemoryError
    //   475	1	6	localURL	java.net.URL
    //   483	16	6	localException1	Exception
    //   509	1	6	localException2	Exception
    //   514	1	6	localException3	Exception
    //   519	1	6	localOutOfMemoryError2	OutOfMemoryError
    //   526	1	6	localOutOfMemoryError3	OutOfMemoryError
    //   4	382	7	localLocalMediaInfo	LocalMediaInfo
    //   167	235	8	localObject2	Object
    //   356	69	9	localBitmap	android.graphics.Bitmap
    //   367	30	10	localCanvas	android.graphics.Canvas
    // Exception table:
    //   from	to	target	type
    //   117	131	456	java/lang/OutOfMemoryError
    //   223	232	456	java/lang/OutOfMemoryError
    //   236	248	456	java/lang/OutOfMemoryError
    //   251	263	456	java/lang/OutOfMemoryError
    //   263	307	456	java/lang/OutOfMemoryError
    //   314	340	456	java/lang/OutOfMemoryError
    //   340	369	456	java/lang/OutOfMemoryError
    //   373	396	456	java/lang/OutOfMemoryError
    //   396	415	456	java/lang/OutOfMemoryError
    //   420	424	456	java/lang/OutOfMemoryError
    //   427	453	456	java/lang/OutOfMemoryError
    //   11	61	483	java/lang/Exception
    //   68	110	483	java/lang/Exception
    //   137	153	483	java/lang/Exception
    //   156	215	483	java/lang/Exception
    //   215	220	509	java/lang/Exception
    //   117	131	514	java/lang/Exception
    //   223	232	514	java/lang/Exception
    //   236	248	514	java/lang/Exception
    //   251	263	514	java/lang/Exception
    //   263	307	514	java/lang/Exception
    //   314	340	514	java/lang/Exception
    //   340	369	514	java/lang/Exception
    //   373	396	514	java/lang/Exception
    //   396	415	514	java/lang/Exception
    //   420	424	514	java/lang/Exception
    //   427	453	514	java/lang/Exception
    //   11	61	519	java/lang/OutOfMemoryError
    //   68	110	519	java/lang/OutOfMemoryError
    //   137	153	519	java/lang/OutOfMemoryError
    //   156	215	519	java/lang/OutOfMemoryError
    //   215	220	526	java/lang/OutOfMemoryError
  }
}
