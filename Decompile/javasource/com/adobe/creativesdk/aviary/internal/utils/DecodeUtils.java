package com.adobe.creativesdk.aviary.internal.utils;

import android.annotation.TargetApi;
import android.content.ContentResolver;
import android.content.Context;
import android.content.res.AssetManager;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.net.Uri;
import android.os.ParcelFileDescriptor.AutoCloseInputStream;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.log.LoggerFactory.LoggerType;
import it.sephiroth.android.library.exif2.ExifInterface;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import junit.framework.Assert;

public final class DecodeUtils
{
  static LoggerFactory.Logger logger = LoggerFactory.getLogger("DecodeUtils", LoggerFactory.LoggerType.ConsoleLoggerType);
  
  public static int computeSampleSize(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, ImageInfo paramImageInfo)
  {
    double d2;
    if ((paramInt5 == 0) || (paramInt5 == 180)) {
      d2 = paramInt1;
    }
    for (double d1 = paramInt2;; d1 = paramInt1)
    {
      if (paramImageInfo != null) {
        paramImageInfo.setOriginalSize((int)d2, (int)d1);
      }
      return (int)Math.ceil(Math.max(d2 / paramInt3, d1 / paramInt4));
      d2 = paramInt2;
    }
  }
  
  public static Bitmap decode(Context paramContext, Uri paramUri, int paramInt1, int paramInt2, ImageInfo paramImageInfo)
  {
    logger.info("decode: " + paramUri);
    Assert.assertNotNull(paramImageInfo);
    Object localObject = null;
    int[] arrayOfInt1 = new int[2];
    paramImageInfo.setUri(paramUri);
    InputStream localInputStream = openInputStream(paramContext, paramUri);
    if (localInputStream == null) {
      return null;
    }
    logger.log("reading exif");
    ExifInterface localExifInterface = new ExifInterface();
    try
    {
      localExifInterface.readExif(localInputStream, 63);
      int[] arrayOfInt2 = localExifInterface.getImageSize();
      logger.log("(exif) image size: %dx%d", new Object[] { Integer.valueOf(arrayOfInt2[0]), Integer.valueOf(arrayOfInt2[1]) });
      paramImageInfo.setExifTagList(localExifInterface.getAllTags());
      int k = ExifUtils.getOrientation(localExifInterface);
      paramImageInfo.setOrientation(k);
      logger.log("orientation: %d", new Object[] { Integer.valueOf(k) });
      IOUtils.closeSilently(localInputStream);
      localInputStream = openInputStream(paramContext, paramUri);
      boolean bool = decodeImageBounds(localInputStream, arrayOfInt1);
      IOUtils.closeSilently(localInputStream);
      if (bool)
      {
        int j = computeSampleSize(arrayOfInt1[0], arrayOfInt1[1], (int)(paramInt1 * 1.2D), (int)(paramInt2 * 1.2D), k, paramImageInfo);
        localObject = getDefaultOptions();
        float f1 = paramInt1;
        float f2 = paramInt2;
        int i = j;
        if (arrayOfInt1[1] < 100.0F + f1 * 1.5F)
        {
          i = j;
          if (arrayOfInt1[1] < f2 * 1.5F)
          {
            logger.info("try to use sample size = 1");
            i = 1;
          }
        }
        inSampleSize = i;
        paramContext = decodeBitmap(paramContext, paramUri, (BitmapFactory.Options)localObject, paramInt1, paramInt2, k, 0);
        localObject = paramContext;
        if (paramContext != null)
        {
          localObject = paramContext;
          if (paramImageInfo != null)
          {
            paramImageInfo.setDecodedSize(paramContext.getWidth(), paramContext.getHeight());
            paramImageInfo.setOrientation(k);
            localObject = paramContext;
          }
        }
      }
      logger.log("returning bitmap");
      return localObject;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        localException.printStackTrace();
      }
    }
  }
  
  static Bitmap decodeBitmap(Context paramContext, Uri paramUri, BitmapFactory.Options paramOptions, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    localObject = null;
    logger.info("decodeBitmap: " + inSampleSize + ", maxSize: " + paramInt1 + "x" + paramInt2 + ", pass: " + paramInt4);
    if (paramInt4 > 10) {
      return null;
    }
    localInputStream = openInputStream(paramContext, paramUri);
    if (localInputStream == null) {
      return null;
    }
    logger.warn("opened input stream");
    try
    {
      Bitmap localBitmap1 = BitmapFactory.decodeStream(localInputStream, null, paramOptions);
      localObject = localBitmap1;
      IOUtils.closeSilently(localInputStream);
      localObject = localBitmap1;
      if (localBitmap1 != null)
      {
        localObject = localBitmap1;
        logger.log("loaded bitmap: " + localBitmap1.getWidth() + "x" + localBitmap1.getHeight());
        localObject = localBitmap1;
        Bitmap localBitmap2 = BitmapUtils.resizeBitmap(localBitmap1, paramInt1, paramInt2, paramInt3);
        localObject = localBitmap1;
        logger.log("resized: " + localBitmap2.getWidth() + "x" + localBitmap2.getHeight());
        if (localBitmap1 != localBitmap2)
        {
          localObject = localBitmap1;
          localBitmap1.recycle();
        }
        localObject = localBitmap2;
      }
    }
    catch (OutOfMemoryError localOutOfMemoryError)
    {
      for (;;)
      {
        logger.error(localOutOfMemoryError.getMessage());
        IOUtils.closeSilently(localInputStream);
        if (localObject != null) {
          ((Bitmap)localObject).recycle();
        }
        inSampleSize += 1;
        localObject = decodeBitmap(paramContext, paramUri, paramOptions, paramInt1, paramInt2, paramInt3, paramInt4 + 1);
      }
    }
    return localObject;
  }
  
  public static boolean decodeImageBounds(InputStream paramInputStream, int[] paramArrayOfInt)
  {
    logger.info("decodeImageBounds");
    BitmapFactory.Options localOptions = new BitmapFactory.Options();
    inJustDecodeBounds = true;
    BitmapFactory.decodeStream(paramInputStream, null, localOptions);
    if ((outHeight > 0) && (outWidth > 0))
    {
      paramArrayOfInt[0] = outWidth;
      paramArrayOfInt[1] = outHeight;
      return true;
    }
    return false;
  }
  
  static BitmapFactory.Options getDefaultOptions()
  {
    BitmapFactory.Options localOptions = new BitmapFactory.Options();
    inScaled = false;
    inPreferredConfig = Bitmap.Config.ARGB_8888;
    inDither = false;
    inJustDecodeBounds = false;
    inPurgeable = false;
    inInputShareable = false;
    inTempStorage = new byte['䀀'];
    return localOptions;
  }
  
  static InputStream openContentInputStream(Context paramContext, Uri paramUri)
  {
    logger.info("openContentInputStream: %s", new Object[] { paramUri });
    if (ApiHelper.AT_LEAST_19) {
      try
      {
        InputStream localInputStream1 = openParcelFileDescriptor(paramContext, paramUri);
        if (localInputStream1 != null) {
          return localInputStream1;
        }
      }
      catch (FileNotFoundException localFileNotFoundException1)
      {
        localFileNotFoundException1.printStackTrace();
      }
    }
    try
    {
      InputStream localInputStream2 = paramContext.getContentResolver().openInputStream(paramUri);
      return localInputStream2;
    }
    catch (FileNotFoundException localFileNotFoundException2)
    {
      localFileNotFoundException2.printStackTrace();
      paramContext = IOUtils.getRealFilePath(paramContext, paramUri);
      if (paramContext != null) {
        return openFileInputStream(paramContext);
      }
    }
    return null;
  }
  
  static InputStream openFileInputStream(String paramString)
  {
    logger.info("openFileInputStream: %s", new Object[] { paramString });
    try
    {
      paramString = new FileInputStream(paramString);
      return paramString;
    }
    catch (FileNotFoundException paramString)
    {
      paramString.printStackTrace();
    }
    return null;
  }
  
  public static InputStream openInputStream(Context paramContext, Uri paramUri)
  {
    if (paramUri == null) {}
    String str;
    do
    {
      return null;
      str = paramUri.getScheme();
      if ((str == null) || ("file".equals(str)))
      {
        if (("file".equals(str)) && (paramUri.getPath().startsWith("/android_asset/"))) {
          try
          {
            paramContext = paramContext.getAssets().open(paramUri.getPath().substring("/android_asset/".length()));
            return paramContext;
          }
          catch (IOException paramContext)
          {
            paramContext.printStackTrace();
            return null;
          }
        }
        return openFileInputStream(paramUri.getPath());
      }
      if ("content".equals(str)) {
        return openContentInputStream(paramContext, paramUri);
      }
    } while ((!"http".equals(str)) && (!"https".equals(str)));
    return openRemoteInputStream(paramUri);
  }
  
  @TargetApi(12)
  static InputStream openParcelFileDescriptor(Context paramContext, Uri paramUri)
    throws FileNotFoundException
  {
    logger.log("openParcelFileDescriptor: %s", new Object[] { paramUri });
    paramContext = paramContext.getContentResolver().openFileDescriptor(paramUri, "r");
    logger.log("parcelFileDescriptor: %s", new Object[] { paramContext });
    return new ParcelFileDescriptor.AutoCloseInputStream(paramContext);
  }
  
  static InputStream openRemoteInputStream(Uri paramUri)
  {
    try
    {
      paramUri = new URL(paramUri.toString());
      try
      {
        HttpURLConnection localHttpURLConnection;
        int i;
        paramUri = (InputStream)paramUri.getContent();
        return paramUri;
      }
      catch (IOException paramUri)
      {
        paramUri.printStackTrace();
      }
    }
    catch (MalformedURLException paramUri)
    {
      for (;;)
      {
        try
        {
          localHttpURLConnection = (HttpURLConnection)paramUri.openConnection();
          localHttpURLConnection.setInstanceFollowRedirects(false);
        }
        catch (IOException paramUri)
        {
          paramUri.printStackTrace();
          return null;
        }
        try
        {
          i = localHttpURLConnection.getResponseCode();
          if ((i != 301) && (i != 302) && (i != 303)) {
            break;
          }
          return openRemoteInputStream(Uri.parse(localHttpURLConnection.getHeaderField("Location")));
        }
        catch (IOException paramUri)
        {
          paramUri.printStackTrace();
          return null;
        }
      }
      paramUri = paramUri;
      paramUri.printStackTrace();
      return null;
    }
    return null;
  }
}
