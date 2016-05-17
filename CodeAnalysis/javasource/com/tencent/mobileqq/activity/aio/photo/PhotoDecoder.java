package com.tencent.mobileqq.activity.aio.photo;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory.Options;
import android.media.ThumbnailUtils;
import android.os.Build.VERSION;
import android.os.SystemClock;
import android.util.DisplayMetrics;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.image.DownloadParams;
import com.tencent.image.LocaleFileDownloader;
import com.tencent.image.RoundRectBitmap;
import com.tencent.image.SafeBitmapFactory;
import com.tencent.image.SliceBitmap;
import com.tencent.image.URLDrawableHandler;
import com.tencent.image.VideoDrawable;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pic.JpegDecompressor;
import com.tencent.mobileqq.pic.JpegOptions;
import com.tencent.mobileqq.pic.compress.Utils;
import com.tencent.mobileqq.utils.ImageUtil;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.JpegOrientationReader;
import com.tencent.widget.Gallery;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

public class PhotoDecoder
  extends LocaleFileDownloader
{
  private static final float jdField_a_of_type_Float = 1.5F;
  public static final int a = 0;
  public static final int b = 1;
  public static final int c = 2;
  public static final int d = 3;
  private static final int e = 5242880;
  private BaseApplicationImpl jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl;
  private float b;
  
  public PhotoDecoder(BaseApplicationImpl paramBaseApplicationImpl)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = paramBaseApplicationImpl;
    b = getResourcesgetDisplayMetricsdensity;
  }
  
  private int a(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6)
  {
    if ((paramInt6 == 2) || (paramInt3 == Integer.MAX_VALUE) || (paramInt4 == Integer.MAX_VALUE))
    {
      paramInt2 = 1;
      return paramInt2;
    }
    float f;
    if (paramInt6 == 1) {
      switch (paramInt5)
      {
      default: 
        paramInt5 = paramInt2;
        paramInt2 = paramInt1;
        paramInt1 = paramInt5;
        paramInt6 = paramInt1;
        paramInt5 = paramInt2;
        if (paramInt2 > paramInt3 * 2)
        {
          paramInt6 = paramInt1;
          paramInt5 = paramInt2;
          if (paramInt1 > paramInt4)
          {
            paramInt5 = (int)(paramInt2 * b + 0.5D);
            paramInt6 = (int)(paramInt1 * b + 0.5D);
          }
        }
        paramInt1 = paramInt6 * paramInt3 / paramInt5;
        if (paramInt5 >= paramInt3) {
          if (paramInt4 >= paramInt1) {
            f = paramInt3 / paramInt5;
          }
        }
        break;
      }
    }
    for (;;)
    {
      label151:
      if (b > 2.0F) {}
      for (paramInt1 = (int)(1.0F / f * 3.0F / 4.0F);; paramInt1 = (int)(1.0F / f))
      {
        if (paramInt1 > 1) {
          break label319;
        }
        return 1;
        break;
        if (paramInt4 * 1.5F >= paramInt1)
        {
          f = paramInt4 / paramInt6;
          break label151;
        }
        f = paramInt3 / paramInt5;
        break label151;
        if (paramInt6 < paramInt4)
        {
          if (paramInt4 >= paramInt1)
          {
            if (paramInt5 * 1.5F < paramInt3) {
              break label481;
            }
            f = paramInt3 / paramInt5;
            break label151;
          }
          if (paramInt6 * 1.5F < paramInt4) {
            break label481;
          }
          f = paramInt4 / paramInt6;
          break label151;
        }
        if ((paramInt6 <= paramInt4) || (paramInt6 >= paramInt4 * 1.5F)) {
          break label481;
        }
        f = paramInt4 / paramInt6;
        break label151;
      }
      label319:
      if (paramInt1 > 64)
      {
        if (QLog.isColorLevel()) {
          QLog.d("PEAK", 2, "the pic it fxxking large.....");
        }
        return 64;
      }
      paramInt3 = 64;
      for (;;)
      {
        if (paramInt3 == 0) {
          break label369;
        }
        paramInt4 = paramInt1 & paramInt3;
        paramInt2 = paramInt4;
        if (paramInt4 != 0) {
          break;
        }
        paramInt3 >>= 1;
      }
      label369:
      return 1;
      if ((paramInt3 == 0) || (paramInt4 == 0) || (paramInt3 == -1) || (paramInt4 == -1)) {
        return 1;
      }
      int i = 1;
      paramInt5 = paramInt2;
      paramInt6 = paramInt1;
      paramInt1 = i;
      label405:
      if (paramInt5 <= paramInt4)
      {
        paramInt2 = paramInt1;
        if (paramInt6 <= paramInt3) {
          break;
        }
      }
      i = Math.round(paramInt5 / paramInt4);
      paramInt2 = Math.round(paramInt6 / paramInt3);
      if (i > paramInt2) {}
      for (;;)
      {
        paramInt2 = paramInt1;
        if (i < 2) {
          break;
        }
        paramInt6 /= 2;
        paramInt5 /= 2;
        paramInt1 *= 2;
        break label405;
        i = paramInt2;
      }
      label481:
      f = 1.0F;
    }
  }
  
  private RoundRectBitmap a(Bitmap paramBitmap, int paramInt)
  {
    try
    {
      RoundRectBitmap localRoundRectBitmap = new RoundRectBitmap(paramBitmap, paramInt);
      return localRoundRectBitmap;
    }
    catch (OutOfMemoryError localOutOfMemoryError) {}
    return new RoundRectBitmap(paramBitmap, 12.0F);
  }
  
  private Object a(File paramFile, DownloadParams paramDownloadParams, URLDrawableHandler paramURLDrawableHandler)
  {
    int i = 0;
    if (tag != null) {
      i = ((Integer)tag).intValue();
    }
    if (i == 3)
    {
      paramURLDrawableHandler = ThumbnailUtils.createVideoThumbnail(paramFile.getAbsolutePath(), 1);
      int j = paramURLDrawableHandler.getWidth();
      i = paramURLDrawableHandler.getHeight();
      float f = Gallery.a(j, i, reqWidth, reqHeight);
      j = (int)(j * f);
      i = (int)(i * f);
      return ThumbnailUtils.createVideoThumbnail(paramFile.getAbsolutePath(), 1);
    }
    return null;
  }
  
  private Object a(File paramFile, DownloadParams paramDownloadParams, URLDrawableHandler paramURLDrawableHandler, int paramInt)
  {
    FileInputStream localFileInputStream = new FileInputStream(paramFile);
    j = 0;
    try
    {
      l1 = SystemClock.uptimeMillis();
      localObject = new byte[2];
      localFileInputStream.read((byte[])localObject);
      int m = localObject[0];
      int n = localObject[1];
      paramURLDrawableHandler = Bitmap.Config.ARGB_8888;
      i = 0;
      k = 0;
      switch (m << 8 & 0xFF00 | n & 0xFF)
      {
      }
    }
    finally
    {
      for (;;)
      {
        long l1;
        Object localObject;
        int k;
        byte[] arrayOfByte;
        paramInt = j;
        continue;
        continue;
        paramURLDrawableHandler = null;
        continue;
        int i = k;
      }
    }
    arrayOfByte = new byte[(int)paramFile.length()];
    System.arraycopy(localObject, 0, arrayOfByte, 0, localObject.length);
    localFileInputStream.read(arrayOfByte, localObject.length, localFileInputStream.available());
    localFileInputStream.close();
    for (;;)
    {
      try
      {
        long l2;
        if (QLog.isColorLevel())
        {
          l2 = SystemClock.uptimeMillis();
          QLog.d("PEAK", 2, "read file to memory cost: " + (l2 - l1));
        }
        l1 = SystemClock.uptimeMillis();
        localOptions = new BitmapFactory.Options();
        inJustDecodeBounds = true;
        inPreferredConfig = paramURLDrawableHandler;
        inDensity = 160;
        inTargetDensity = 160;
        inScreenDensity = 160;
        inPurgeable = true;
        inInputShareable = true;
        SafeBitmapFactory.decodeByteArray(arrayOfByte, 0, arrayOfByte.length, localOptions);
        j = outWidth;
        k = outHeight;
        if (i != 0) {
          outOrientation = JpegOrientationReader.a(paramFile.getAbsolutePath());
        }
        if (QLog.isColorLevel())
        {
          l2 = SystemClock.uptimeMillis();
          QLog.d("PEAK", 2, "read size & exif cost: " + (l2 - l1));
        }
        inJustDecodeBounds = false;
        paramInt = a(j, k, reqWidth, reqHeight, outOrientation, paramInt);
        try
        {
          inSampleSize = paramInt;
          localObject = SafeBitmapFactory.decodeByteArray(arrayOfByte, 0, arrayOfByte.length, localOptions);
          ((Bitmap)localObject).setDensity(160);
          if (Build.VERSION.SDK_INT < 11) {
            continue;
          }
          boolean bool = SliceBitmap.needSlice((Bitmap)localObject);
          if (!bool) {
            continue;
          }
          try
          {
            paramURLDrawableHandler = new SliceBitmap((Bitmap)localObject);
            ((Bitmap)localObject).recycle();
            if (inSampleSize > 1)
            {
              if (!mAutoScaleByDensity) {
                break label805;
              }
              outWidth = ((int)Math.ceil(j * b));
              outHeight = ((int)Math.ceil(k * b));
            }
            if (QLog.isColorLevel()) {
              QLog.d("PEAK", 2, "image file size:" + paramFile.length() + " , bound:" + j + "x" + k + " , sampleSize: " + inSampleSize);
            }
            return paramURLDrawableHandler;
          }
          catch (Exception paramURLDrawableHandler)
          {
            if (localObject == null) {
              continue;
            }
            ((Bitmap)localObject).recycle();
            throw new OutOfMemoryError("slice failed.");
          }
          i = 1;
          paramURLDrawableHandler = Bitmap.Config.RGB_565;
        }
        catch (OutOfMemoryError paramURLDrawableHandler)
        {
          if (!QLog.isColorLevel()) {
            continue;
          }
          QLog.d("PEAK", 2, "DecodeFile ERROR,oom retryCount=" + 1 + ",options.inSampleSize=" + inSampleSize + ",url=" + urlStr + ",oom.msg:" + paramURLDrawableHandler.getMessage());
          paramInt *= 2;
          System.gc();
          Thread.yield();
          System.gc();
          if (paramInt > 8) {
            break label842;
          }
        }
        localFileInputStream.close();
        return null;
      }
      finally
      {
        BitmapFactory.Options localOptions;
        RoundRectBitmap localRoundRectBitmap;
        paramInt = 1;
        if (paramInt != 0) {
          continue;
        }
        localFileInputStream.close();
      }
      paramURLDrawableHandler = null;
      continue;
      if ((mExtraInfo != null) && (PhotoDecoder.DownloadParamsExtraInfo.class.isInstance(mExtraInfo)))
      {
        paramURLDrawableHandler = (PhotoDecoder.DownloadParamsExtraInfo)mExtraInfo;
        if (a <= 0) {
          break label845;
        }
        localRoundRectBitmap = a((Bitmap)localObject, a);
        paramURLDrawableHandler = localRoundRectBitmap;
        if (!mBitmap.equals(localObject))
        {
          ((Bitmap)localObject).recycle();
          paramURLDrawableHandler = localRoundRectBitmap;
        }
      }
      else
      {
        paramURLDrawableHandler = (URLDrawableHandler)localObject;
        continue;
        label805:
        double d1 = j;
        outWidth = ((int)Math.ceil(d1));
        outHeight = ((int)Math.ceil(k));
      }
    }
  }
  
  private Object b(File paramFile, DownloadParams paramDownloadParams, URLDrawableHandler paramURLDrawableHandler, int paramInt)
  {
    paramURLDrawableHandler = new FileInputStream(paramFile);
    try
    {
      localObject = new byte[2];
      paramURLDrawableHandler.read((byte[])localObject);
      k = localObject[0];
      m = localObject[1];
      paramURLDrawableHandler.close();
      localObject = new FileInputStream(paramFile);
    }
    finally
    {
      for (;;)
      {
        int k;
        int m;
        label132:
        BitmapFactory.Options localOptions;
        paramDownloadParams = paramURLDrawableHandler;
        paramInt = 0;
      }
    }
    try
    {
      paramURLDrawableHandler = Bitmap.Config.ARGB_8888;
      i = 0;
      j = 0;
      switch (k << 8 & 0xFF00 | m & 0xFF)
      {
      }
    }
    finally
    {
      paramInt = 0;
      paramDownloadParams = (DownloadParams)localObject;
      break label668;
      paramURLDrawableHandler = null;
      break label321;
      paramURLDrawableHandler = null;
      break label321;
      i = j;
      break label132;
    }
    localOptions = new BitmapFactory.Options();
    inJustDecodeBounds = true;
    inPreferredConfig = paramURLDrawableHandler;
    inDensity = 160;
    inTargetDensity = 160;
    inScreenDensity = 160;
    SafeBitmapFactory.decodeStream((InputStream)localObject, null, localOptions);
    j = outWidth;
    k = outHeight;
    ((InputStream)localObject).close();
    if (i != 0) {}
    for (;;)
    {
      Bitmap localBitmap;
      try
      {
        outOrientation = JpegOrientationReader.a(paramFile.getAbsolutePath());
        inJustDecodeBounds = false;
        paramInt = a(j, k, reqWidth, reqHeight, outOrientation, paramInt);
        i = 1;
        if (i > 3) {
          break label738;
        }
        try
        {
          inSampleSize = paramInt;
          localBitmap = SafeBitmapFactory.decodeFile(paramFile.getAbsolutePath(), localOptions);
          localBitmap.setDensity(160);
          if (Build.VERSION.SDK_INT < 11) {
            continue;
          }
          boolean bool = SliceBitmap.needSlice(localBitmap);
          if (!bool) {
            continue;
          }
          try
          {
            paramURLDrawableHandler = new SliceBitmap(localBitmap);
            localBitmap.recycle();
            label321:
            if (inSampleSize > 1)
            {
              if (!mAutoScaleByDensity) {
                break label685;
              }
              outWidth = ((int)Math.ceil(j * b));
              outHeight = ((int)Math.ceil(k * b));
            }
            if (QLog.isColorLevel()) {
              QLog.d("PEAK", 2, "image file size:" + paramFile.length() + " , bound:" + outWidth + "x" + outHeight + " , sampleSize: " + inSampleSize);
            }
            return paramURLDrawableHandler;
          }
          catch (Exception paramURLDrawableHandler)
          {
            if (localBitmap == null) {
              continue;
            }
            localBitmap.recycle();
            throw new OutOfMemoryError("slice failed.");
          }
          i = 1;
          paramURLDrawableHandler = Bitmap.Config.RGB_565;
        }
        catch (OutOfMemoryError paramURLDrawableHandler)
        {
          if (!QLog.isColorLevel()) {
            continue;
          }
          QLog.d("PEAK", 2, "DecodeFile ERROR,oom retryCount=" + i + ",options.inSampleSize=" + inSampleSize + ",url=" + urlStr + ",oom.msg:" + paramURLDrawableHandler.getMessage());
          System.gc();
          Thread.yield();
          System.gc();
          i += 1;
          paramInt *= 2;
        }
        ((InputStream)localObject).close();
        return null;
      }
      finally
      {
        RoundRectBitmap localRoundRectBitmap;
        paramInt = 1;
        paramDownloadParams = (DownloadParams)localObject;
        label668:
        if (paramInt != 0) {
          continue;
        }
        paramDownloadParams.close();
      }
      continue;
      if ((mExtraInfo != null) && (PhotoDecoder.DownloadParamsExtraInfo.class.isInstance(mExtraInfo)))
      {
        paramURLDrawableHandler = (PhotoDecoder.DownloadParamsExtraInfo)mExtraInfo;
        if (a <= 0) {
          break label733;
        }
        localRoundRectBitmap = a(localBitmap, a);
        paramURLDrawableHandler = localRoundRectBitmap;
        if (!mBitmap.equals(localBitmap))
        {
          localBitmap.recycle();
          paramURLDrawableHandler = localRoundRectBitmap;
        }
      }
      else
      {
        paramURLDrawableHandler = localBitmap;
        continue;
        label685:
        double d1 = j;
        outWidth = ((int)Math.ceil(d1));
        outHeight = ((int)Math.ceil(k));
      }
    }
  }
  
  /* Error */
  private Object c(File paramFile, DownloadParams paramDownloadParams, URLDrawableHandler paramURLDrawableHandler, int paramInt)
  {
    // Byte code:
    //   0: new 134	java/io/FileInputStream
    //   3: dup
    //   4: aload_1
    //   5: invokespecial 137	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   8: astore 21
    //   10: iconst_0
    //   11: istore 10
    //   13: iconst_0
    //   14: istore 9
    //   16: iload 10
    //   18: istore 7
    //   20: invokestatic 143	android/os/SystemClock:uptimeMillis	()J
    //   23: lstore 13
    //   25: iload 10
    //   27: istore 7
    //   29: iconst_2
    //   30: newarray byte
    //   32: astore 19
    //   34: iload 10
    //   36: istore 7
    //   38: aload 21
    //   40: aload 19
    //   42: invokevirtual 147	java/io/FileInputStream:read	([B)I
    //   45: pop
    //   46: aload 19
    //   48: iconst_0
    //   49: baload
    //   50: istore 11
    //   52: aload 19
    //   54: iconst_1
    //   55: baload
    //   56: istore 12
    //   58: iload 10
    //   60: istore 7
    //   62: getstatic 153	android/graphics/Bitmap$Config:ARGB_8888	Landroid/graphics/Bitmap$Config;
    //   65: astore 18
    //   67: iconst_0
    //   68: istore 8
    //   70: iconst_0
    //   71: istore 7
    //   73: iload 11
    //   75: bipush 8
    //   77: ishl
    //   78: ldc -102
    //   80: iand
    //   81: iload 12
    //   83: sipush 255
    //   86: iand
    //   87: ior
    //   88: lookupswitch	default:+858->946, 8273:+323->411, 16973:+323->411, 18249:+335->423, 18761:+320->408, 19789:+320->408, 65496:+320->408
    //   148: iload 10
    //   150: istore 7
    //   152: aload_1
    //   153: invokevirtual 157	java/io/File:length	()J
    //   156: l2i
    //   157: newarray byte
    //   159: astore 23
    //   161: iload 10
    //   163: istore 7
    //   165: aload 19
    //   167: iconst_0
    //   168: aload 23
    //   170: iconst_0
    //   171: aload 19
    //   173: arraylength
    //   174: invokestatic 163	java/lang/System:arraycopy	(Ljava/lang/Object;ILjava/lang/Object;II)V
    //   177: iload 10
    //   179: istore 7
    //   181: aload 21
    //   183: aload 23
    //   185: aload 19
    //   187: arraylength
    //   188: aload 21
    //   190: invokevirtual 166	java/io/FileInputStream:available	()I
    //   193: invokevirtual 169	java/io/FileInputStream:read	([BII)I
    //   196: pop
    //   197: iload 10
    //   199: istore 7
    //   201: aload 21
    //   203: invokevirtual 172	java/io/FileInputStream:close	()V
    //   206: iconst_1
    //   207: istore 9
    //   209: invokestatic 63	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   212: ifeq +37 -> 249
    //   215: invokestatic 143	android/os/SystemClock:uptimeMillis	()J
    //   218: lstore 15
    //   220: ldc 65
    //   222: iconst_2
    //   223: new 174	java/lang/StringBuilder
    //   226: dup
    //   227: invokespecial 175	java/lang/StringBuilder:<init>	()V
    //   230: ldc -79
    //   232: invokevirtual 181	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   235: lload 15
    //   237: lload 13
    //   239: lsub
    //   240: invokevirtual 184	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   243: invokevirtual 187	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   246: invokestatic 70	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   249: invokestatic 143	android/os/SystemClock:uptimeMillis	()J
    //   252: lstore 13
    //   254: new 350	com/tencent/mobileqq/pic/JpegOptions
    //   257: dup
    //   258: invokespecial 351	com/tencent/mobileqq/pic/JpegOptions:<init>	()V
    //   261: astore 22
    //   263: aload 22
    //   265: iconst_1
    //   266: putfield 352	com/tencent/mobileqq/pic/JpegOptions:inJustDecodeBounds	Z
    //   269: aload 22
    //   271: aload 18
    //   273: putfield 353	com/tencent/mobileqq/pic/JpegOptions:inPreferredConfig	Landroid/graphics/Bitmap$Config;
    //   276: aload 23
    //   278: aload 22
    //   280: invokestatic 358	com/tencent/mobileqq/pic/JpegDecompressor:decodeByteArray	([BLcom/tencent/mobileqq/pic/JpegOptions;)Landroid/graphics/Bitmap;
    //   283: pop
    //   284: aload 22
    //   286: getfield 359	com/tencent/mobileqq/pic/JpegOptions:outWidth	I
    //   289: istore 10
    //   291: aload 22
    //   293: getfield 360	com/tencent/mobileqq/pic/JpegOptions:outHeight	I
    //   296: istore 11
    //   298: iload 8
    //   300: ifeq +14 -> 314
    //   303: aload_2
    //   304: aload_1
    //   305: invokevirtual 104	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   308: invokestatic 228	com/tencent/util/JpegOrientationReader:a	(Ljava/lang/String;)I
    //   311: putfield 231	com/tencent/image/DownloadParams:outOrientation	I
    //   314: invokestatic 63	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   317: ifeq +37 -> 354
    //   320: invokestatic 143	android/os/SystemClock:uptimeMillis	()J
    //   323: lstore 15
    //   325: ldc 65
    //   327: iconst_2
    //   328: new 174	java/lang/StringBuilder
    //   331: dup
    //   332: invokespecial 175	java/lang/StringBuilder:<init>	()V
    //   335: ldc -23
    //   337: invokevirtual 181	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   340: lload 15
    //   342: lload 13
    //   344: lsub
    //   345: invokevirtual 184	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   348: invokevirtual 187	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   351: invokestatic 70	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   354: aload 22
    //   356: iconst_0
    //   357: putfield 352	com/tencent/mobileqq/pic/JpegOptions:inJustDecodeBounds	Z
    //   360: aload_0
    //   361: iload 10
    //   363: iload 11
    //   365: aload_2
    //   366: getfield 121	com/tencent/image/DownloadParams:reqWidth	I
    //   369: aload_2
    //   370: getfield 124	com/tencent/image/DownloadParams:reqHeight	I
    //   373: aload_2
    //   374: getfield 231	com/tencent/image/DownloadParams:outOrientation	I
    //   377: iload 4
    //   379: invokespecial 235	com/tencent/mobileqq/activity/aio/photo/PhotoDecoder:a	(IIIIII)I
    //   382: istore 7
    //   384: aload 22
    //   386: iload 7
    //   388: putfield 361	com/tencent/mobileqq/pic/JpegOptions:inSampleSize	I
    //   391: aload 23
    //   393: aload 22
    //   395: invokestatic 358	com/tencent/mobileqq/pic/JpegDecompressor:decodeByteArray	([BLcom/tencent/mobileqq/pic/JpegOptions;)Landroid/graphics/Bitmap;
    //   398: astore 19
    //   400: aload 19
    //   402: ifnonnull +28 -> 430
    //   405: aload 19
    //   407: areturn
    //   408: iconst_1
    //   409: istore 8
    //   411: iload 10
    //   413: istore 7
    //   415: getstatic 282	android/graphics/Bitmap$Config:RGB_565	Landroid/graphics/Bitmap$Config;
    //   418: astore 18
    //   420: goto -272 -> 148
    //   423: aload 21
    //   425: invokevirtual 172	java/io/FileInputStream:close	()V
    //   428: aconst_null
    //   429: areturn
    //   430: aload 19
    //   432: sipush 160
    //   435: invokevirtual 242	android/graphics/Bitmap:setDensity	(I)V
    //   438: getstatic 247	android/os/Build$VERSION:SDK_INT	I
    //   441: bipush 11
    //   443: if_icmplt +345 -> 788
    //   446: aload 19
    //   448: invokestatic 253	com/tencent/image/SliceBitmap:needSlice	(Landroid/graphics/Bitmap;)Z
    //   451: istore 17
    //   453: iload 17
    //   455: ifeq +333 -> 788
    //   458: new 249	com/tencent/image/SliceBitmap
    //   461: dup
    //   462: aload 19
    //   464: invokespecial 256	com/tencent/image/SliceBitmap:<init>	(Landroid/graphics/Bitmap;)V
    //   467: astore 18
    //   469: aload 19
    //   471: invokevirtual 259	android/graphics/Bitmap:recycle	()V
    //   474: aload 22
    //   476: getfield 361	com/tencent/mobileqq/pic/JpegOptions:inSampleSize	I
    //   479: iconst_1
    //   480: if_icmple +44 -> 524
    //   483: aload_2
    //   484: getfield 262	com/tencent/image/DownloadParams:mAutoScaleByDensity	Z
    //   487: ifeq +404 -> 891
    //   490: aload_2
    //   491: iload 10
    //   493: i2f
    //   494: aload_0
    //   495: getfield 50	com/tencent/mobileqq/activity/aio/photo/PhotoDecoder:b	F
    //   498: fmul
    //   499: f2d
    //   500: invokestatic 266	java/lang/Math:ceil	(D)D
    //   503: d2i
    //   504: putfield 267	com/tencent/image/DownloadParams:outWidth	I
    //   507: aload_2
    //   508: iload 11
    //   510: i2f
    //   511: aload_0
    //   512: getfield 50	com/tencent/mobileqq/activity/aio/photo/PhotoDecoder:b	F
    //   515: fmul
    //   516: f2d
    //   517: invokestatic 266	java/lang/Math:ceil	(D)D
    //   520: d2i
    //   521: putfield 268	com/tencent/image/DownloadParams:outHeight	I
    //   524: aload 18
    //   526: astore 19
    //   528: invokestatic 63	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   531: ifeq -126 -> 405
    //   534: ldc 65
    //   536: iconst_2
    //   537: new 174	java/lang/StringBuilder
    //   540: dup
    //   541: invokespecial 175	java/lang/StringBuilder:<init>	()V
    //   544: ldc_w 270
    //   547: invokevirtual 181	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   550: aload_1
    //   551: invokevirtual 157	java/io/File:length	()J
    //   554: invokevirtual 184	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   557: ldc_w 272
    //   560: invokevirtual 181	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   563: iload 10
    //   565: invokevirtual 275	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   568: ldc_w 277
    //   571: invokevirtual 181	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   574: iload 11
    //   576: invokevirtual 275	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   579: ldc_w 279
    //   582: invokevirtual 181	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   585: aload 22
    //   587: getfield 361	com/tencent/mobileqq/pic/JpegOptions:inSampleSize	I
    //   590: invokevirtual 275	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   593: invokevirtual 187	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   596: invokestatic 70	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   599: aload 18
    //   601: areturn
    //   602: astore 18
    //   604: iconst_1
    //   605: istore 8
    //   607: iload 8
    //   609: istore 7
    //   611: invokestatic 63	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   614: ifeq +19 -> 633
    //   617: iload 8
    //   619: istore 7
    //   621: ldc_w 363
    //   624: iconst_2
    //   625: ldc_w 365
    //   628: aload 18
    //   630: invokestatic 369	com/tencent/qphone/base/util/QLog:i	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   633: iload 8
    //   635: istore 7
    //   637: aload_0
    //   638: aload_1
    //   639: aload_2
    //   640: aload_3
    //   641: iload 4
    //   643: invokespecial 371	com/tencent/mobileqq/activity/aio/photo/PhotoDecoder:a	(Ljava/io/File;Lcom/tencent/image/DownloadParams;Lcom/tencent/image/URLDrawableHandler;I)Ljava/lang/Object;
    //   646: astore_1
    //   647: aload_1
    //   648: astore 19
    //   650: iload 8
    //   652: ifne -247 -> 405
    //   655: aload 21
    //   657: invokevirtual 172	java/io/FileInputStream:close	()V
    //   660: aload_1
    //   661: areturn
    //   662: astore 18
    //   664: aload 19
    //   666: ifnull +8 -> 674
    //   669: aload 19
    //   671: invokevirtual 259	android/graphics/Bitmap:recycle	()V
    //   674: new 79	java/lang/OutOfMemoryError
    //   677: dup
    //   678: ldc_w 284
    //   681: invokespecial 287	java/lang/OutOfMemoryError:<init>	(Ljava/lang/String;)V
    //   684: athrow
    //   685: astore 18
    //   687: invokestatic 63	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   690: ifeq +70 -> 760
    //   693: ldc 65
    //   695: iconst_2
    //   696: new 174	java/lang/StringBuilder
    //   699: dup
    //   700: invokespecial 175	java/lang/StringBuilder:<init>	()V
    //   703: ldc_w 289
    //   706: invokevirtual 181	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   709: iconst_1
    //   710: invokevirtual 275	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   713: ldc_w 291
    //   716: invokevirtual 181	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   719: aload 22
    //   721: getfield 361	com/tencent/mobileqq/pic/JpegOptions:inSampleSize	I
    //   724: invokevirtual 275	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   727: ldc_w 293
    //   730: invokevirtual 181	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   733: aload_2
    //   734: getfield 297	com/tencent/image/DownloadParams:urlStr	Ljava/lang/String;
    //   737: invokevirtual 181	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   740: ldc_w 299
    //   743: invokevirtual 181	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   746: aload 18
    //   748: invokevirtual 302	java/lang/OutOfMemoryError:getMessage	()Ljava/lang/String;
    //   751: invokevirtual 181	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   754: invokevirtual 187	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   757: invokestatic 70	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   760: iload 7
    //   762: iconst_2
    //   763: imul
    //   764: istore 7
    //   766: invokestatic 305	java/lang/System:gc	()V
    //   769: invokestatic 310	java/lang/Thread:yield	()V
    //   772: invokestatic 305	java/lang/System:gc	()V
    //   775: iload 7
    //   777: bipush 8
    //   779: if_icmpgt +158 -> 937
    //   782: aconst_null
    //   783: astore 18
    //   785: goto -311 -> 474
    //   788: aload_2
    //   789: getfield 313	com/tencent/image/DownloadParams:mExtraInfo	Ljava/lang/Object;
    //   792: ifnull +92 -> 884
    //   795: ldc_w 315
    //   798: aload_2
    //   799: getfield 313	com/tencent/image/DownloadParams:mExtraInfo	Ljava/lang/Object;
    //   802: invokevirtual 321	java/lang/Class:isInstance	(Ljava/lang/Object;)Z
    //   805: ifeq +79 -> 884
    //   808: aload_2
    //   809: getfield 313	com/tencent/image/DownloadParams:mExtraInfo	Ljava/lang/Object;
    //   812: checkcast 315	com/tencent/mobileqq/activity/aio/photo/PhotoDecoder$DownloadParamsExtraInfo
    //   815: astore 18
    //   817: aload 18
    //   819: getfield 323	com/tencent/mobileqq/activity/aio/photo/PhotoDecoder$DownloadParamsExtraInfo:a	I
    //   822: ifle +118 -> 940
    //   825: aload_0
    //   826: aload 19
    //   828: aload 18
    //   830: getfield 323	com/tencent/mobileqq/activity/aio/photo/PhotoDecoder$DownloadParamsExtraInfo:a	I
    //   833: invokespecial 325	com/tencent/mobileqq/activity/aio/photo/PhotoDecoder:a	(Landroid/graphics/Bitmap;I)Lcom/tencent/image/RoundRectBitmap;
    //   836: astore 20
    //   838: aload 20
    //   840: astore 18
    //   842: aload 20
    //   844: getfield 329	com/tencent/image/RoundRectBitmap:mBitmap	Landroid/graphics/Bitmap;
    //   847: aload 19
    //   849: invokevirtual 334	java/lang/Object:equals	(Ljava/lang/Object;)Z
    //   852: ifne -378 -> 474
    //   855: aload 19
    //   857: invokevirtual 259	android/graphics/Bitmap:recycle	()V
    //   860: aload 20
    //   862: astore 18
    //   864: goto -390 -> 474
    //   867: astore_1
    //   868: iload 9
    //   870: istore 4
    //   872: iload 4
    //   874: ifne +8 -> 882
    //   877: aload 21
    //   879: invokevirtual 172	java/io/FileInputStream:close	()V
    //   882: aload_1
    //   883: athrow
    //   884: aload 19
    //   886: astore 18
    //   888: goto -414 -> 474
    //   891: iload 10
    //   893: i2d
    //   894: dstore 5
    //   896: aload_2
    //   897: dload 5
    //   899: invokestatic 266	java/lang/Math:ceil	(D)D
    //   902: d2i
    //   903: putfield 267	com/tencent/image/DownloadParams:outWidth	I
    //   906: aload_2
    //   907: iload 11
    //   909: i2d
    //   910: invokestatic 266	java/lang/Math:ceil	(D)D
    //   913: d2i
    //   914: putfield 268	com/tencent/image/DownloadParams:outHeight	I
    //   917: goto -393 -> 524
    //   920: astore_1
    //   921: iload 7
    //   923: istore 4
    //   925: goto -53 -> 872
    //   928: astore 18
    //   930: iload 9
    //   932: istore 8
    //   934: goto -327 -> 607
    //   937: goto -553 -> 384
    //   940: aconst_null
    //   941: astore 18
    //   943: goto -469 -> 474
    //   946: iload 7
    //   948: istore 8
    //   950: goto -802 -> 148
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	953	0	this	PhotoDecoder
    //   0	953	1	paramFile	File
    //   0	953	2	paramDownloadParams	DownloadParams
    //   0	953	3	paramURLDrawableHandler	URLDrawableHandler
    //   0	953	4	paramInt	int
    //   894	4	5	d1	double
    //   18	929	7	i	int
    //   68	881	8	j	int
    //   14	917	9	k	int
    //   11	881	10	m	int
    //   50	858	11	n	int
    //   56	31	12	i1	int
    //   23	320	13	l1	long
    //   218	123	15	l2	long
    //   451	3	17	bool	boolean
    //   65	535	18	localObject1	Object
    //   602	27	18	localRuntimeException1	RuntimeException
    //   662	1	18	localException	Exception
    //   685	62	18	localOutOfMemoryError	OutOfMemoryError
    //   783	104	18	localObject2	Object
    //   928	1	18	localRuntimeException2	RuntimeException
    //   941	1	18	localObject3	Object
    //   32	853	19	localObject4	Object
    //   836	25	20	localRoundRectBitmap	RoundRectBitmap
    //   8	870	21	localFileInputStream	FileInputStream
    //   261	459	22	localJpegOptions	JpegOptions
    //   159	233	23	arrayOfByte	byte[]
    // Exception table:
    //   from	to	target	type
    //   209	249	602	java/lang/RuntimeException
    //   249	298	602	java/lang/RuntimeException
    //   303	314	602	java/lang/RuntimeException
    //   314	354	602	java/lang/RuntimeException
    //   354	384	602	java/lang/RuntimeException
    //   384	400	602	java/lang/RuntimeException
    //   430	453	602	java/lang/RuntimeException
    //   458	474	602	java/lang/RuntimeException
    //   474	524	602	java/lang/RuntimeException
    //   528	599	602	java/lang/RuntimeException
    //   669	674	602	java/lang/RuntimeException
    //   674	685	602	java/lang/RuntimeException
    //   687	760	602	java/lang/RuntimeException
    //   766	775	602	java/lang/RuntimeException
    //   788	838	602	java/lang/RuntimeException
    //   842	860	602	java/lang/RuntimeException
    //   896	917	602	java/lang/RuntimeException
    //   458	474	662	java/lang/Exception
    //   384	400	685	java/lang/OutOfMemoryError
    //   430	453	685	java/lang/OutOfMemoryError
    //   458	474	685	java/lang/OutOfMemoryError
    //   669	674	685	java/lang/OutOfMemoryError
    //   674	685	685	java/lang/OutOfMemoryError
    //   788	838	685	java/lang/OutOfMemoryError
    //   842	860	685	java/lang/OutOfMemoryError
    //   209	249	867	finally
    //   249	298	867	finally
    //   303	314	867	finally
    //   314	354	867	finally
    //   354	384	867	finally
    //   384	400	867	finally
    //   430	453	867	finally
    //   458	474	867	finally
    //   474	524	867	finally
    //   528	599	867	finally
    //   669	674	867	finally
    //   674	685	867	finally
    //   687	760	867	finally
    //   766	775	867	finally
    //   788	838	867	finally
    //   842	860	867	finally
    //   896	917	867	finally
    //   20	25	920	finally
    //   29	34	920	finally
    //   38	46	920	finally
    //   62	67	920	finally
    //   152	161	920	finally
    //   165	177	920	finally
    //   181	197	920	finally
    //   201	206	920	finally
    //   415	420	920	finally
    //   611	617	920	finally
    //   621	633	920	finally
    //   637	647	920	finally
    //   20	25	928	java/lang/RuntimeException
    //   29	34	928	java/lang/RuntimeException
    //   38	46	928	java/lang/RuntimeException
    //   62	67	928	java/lang/RuntimeException
    //   152	161	928	java/lang/RuntimeException
    //   165	177	928	java/lang/RuntimeException
    //   181	197	928	java/lang/RuntimeException
    //   201	206	928	java/lang/RuntimeException
    //   415	420	928	java/lang/RuntimeException
  }
  
  private Object d(File paramFile, DownloadParams paramDownloadParams, URLDrawableHandler paramURLDrawableHandler, int paramInt)
  {
    Object localObject1 = new FileInputStream(paramFile);
    for (;;)
    {
      Object localObject3;
      try
      {
        localObject3 = new byte[2];
        ((InputStream)localObject1).read((byte[])localObject3);
        k = localObject3[0];
        m = localObject3[1];
        ((InputStream)localObject1).close();
        localObject1 = Bitmap.Config.ARGB_8888;
        i = 0;
        j = 0;
        switch (k << 8 & 0xFF00 | m & 0xFF)
        {
        }
      }
      catch (RuntimeException localRuntimeException)
      {
        try
        {
          inSampleSize = i;
          localObject3 = JpegDecompressor.decodeFile(paramFile.getAbsolutePath(), localJpegOptions);
          if (localObject3 == null)
          {
            localObject3 = null;
            return localObject3;
            i = 1;
            localObject1 = Bitmap.Config.RGB_565;
            continue;
            return null;
          }
          ((Bitmap)localObject3).setDensity(160);
          if (Build.VERSION.SDK_INT < 11) {
            continue;
          }
          boolean bool = SliceBitmap.needSlice((Bitmap)localObject3);
          if (!bool) {
            continue;
          }
          try
          {
            localObject1 = new SliceBitmap((Bitmap)localObject3);
            ((Bitmap)localObject3).recycle();
            if (inSampleSize > 1)
            {
              if (!mAutoScaleByDensity) {
                break label689;
              }
              outWidth = ((int)Math.ceil(k * b));
              outHeight = ((int)Math.ceil(m * b));
            }
            localObject3 = localObject1;
            if (!QLog.isColorLevel()) {
              continue;
            }
            QLog.d("PEAK", 2, "image file size:" + paramFile.length() + " , bound:" + outWidth + "x" + outHeight + " , sampleSize: " + inSampleSize);
            return localObject1;
          }
          catch (Exception localException)
          {
            if (localObject3 == null) {
              continue;
            }
            ((Bitmap)localObject3).recycle();
            throw new OutOfMemoryError("slice failed.");
          }
          localRuntimeException = localRuntimeException;
          if (QLog.isColorLevel()) {
            QLog.i("peak_pgjpeg", 2, "PhotoDecoder.decodeFileNormalWithTrubo() error", localRuntimeException);
          }
          paramFile = b(paramFile, paramDownloadParams, paramURLDrawableHandler, paramInt);
          return paramFile;
        }
        catch (OutOfMemoryError localOutOfMemoryError)
        {
          JpegOptions localJpegOptions;
          if (QLog.isColorLevel()) {
            QLog.d("PEAK", 2, "DecodeFile ERROR,oom retryCount=" + j + ",options.inSampleSize=" + inSampleSize + ",url=" + urlStr + ",oom.msg:" + localOutOfMemoryError.getMessage());
          }
          System.gc();
          Thread.yield();
          System.gc();
          j += 1;
          i *= 2;
        }
        continue;
        if ((mExtraInfo == null) || (!PhotoDecoder.DownloadParamsExtraInfo.class.isInstance(mExtraInfo))) {
          break label682;
        }
        localObject2 = (PhotoDecoder.DownloadParamsExtraInfo)mExtraInfo;
        if (a <= 0) {
          break label718;
        }
        RoundRectBitmap localRoundRectBitmap = a((Bitmap)localObject3, a);
        localObject2 = localRoundRectBitmap;
        if (mBitmap.equals(localObject3)) {
          continue;
        }
        ((Bitmap)localObject3).recycle();
        localObject2 = localRoundRectBitmap;
        continue;
      }
      finally {}
      localJpegOptions = new JpegOptions();
      inJustDecodeBounds = true;
      inPreferredConfig = ((Bitmap.Config)localObject1);
      JpegDecompressor.decodeFile(paramFile.getAbsolutePath(), localJpegOptions);
      int k = outWidth;
      int m = outHeight;
      if (i != 0) {
        outOrientation = JpegOrientationReader.a(paramFile.getAbsolutePath());
      }
      inJustDecodeBounds = false;
      int i = a(k, m, reqWidth, reqHeight, outOrientation, paramInt);
      int j = 1;
      if (j <= 3)
      {
        label682:
        localObject2 = localObject3;
        continue;
        label689:
        double d1 = k;
        outWidth = ((int)Math.ceil(d1));
        outHeight = ((int)Math.ceil(m));
        continue;
        label718:
        localObject2 = null;
        continue;
      }
      Object localObject2 = null;
      continue;
      i = j;
    }
  }
  
  public Object decodeFile(File paramFile, DownloadParams paramDownloadParams, URLDrawableHandler paramURLDrawableHandler)
  {
    long l1 = SystemClock.uptimeMillis();
    try
    {
      if (VideoDrawable.isVideo(paramFile))
      {
        paramURLDrawableHandler = a(paramFile, paramDownloadParams, paramURLDrawableHandler);
        paramDownloadParams = paramURLDrawableHandler;
        if (QLog.isColorLevel())
        {
          l2 = SystemClock.uptimeMillis();
          QLog.d("PEAK", 2, "decode file:" + paramFile.getAbsolutePath() + " cost: " + (l2 - l1));
          paramDownloadParams = paramURLDrawableHandler;
        }
        return paramDownloadParams;
      }
      l2 = paramFile.length();
      int i = 0;
      if (tag != null) {
        i = ((Integer)tag).intValue();
      }
      if ((Utils.b()) && (ImageUtil.b(paramFile.getAbsolutePath())))
      {
        if (l2 < 5242880L)
        {
          paramURLDrawableHandler = c(paramFile, paramDownloadParams, paramURLDrawableHandler, i);
          paramDownloadParams = paramURLDrawableHandler;
          return paramURLDrawableHandler;
        }
        paramURLDrawableHandler = d(paramFile, paramDownloadParams, paramURLDrawableHandler, i);
        paramDownloadParams = paramURLDrawableHandler;
        return paramURLDrawableHandler;
      }
      if (l2 < 5242880L)
      {
        paramURLDrawableHandler = a(paramFile, paramDownloadParams, paramURLDrawableHandler, i);
        paramDownloadParams = paramURLDrawableHandler;
        return paramURLDrawableHandler;
      }
      paramURLDrawableHandler = b(paramFile, paramDownloadParams, paramURLDrawableHandler, i);
      paramDownloadParams = paramURLDrawableHandler;
      return paramURLDrawableHandler;
    }
    finally
    {
      long l2;
      if (QLog.isColorLevel())
      {
        l2 = SystemClock.uptimeMillis();
        QLog.d("PEAK", 2, "decode file:" + paramFile.getAbsolutePath() + " cost: " + (l2 - l1));
      }
    }
  }
}
