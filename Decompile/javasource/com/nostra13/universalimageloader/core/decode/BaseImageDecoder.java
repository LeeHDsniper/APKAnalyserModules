package com.nostra13.universalimageloader.core.decode;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.Matrix;
import android.media.ExifInterface;
import android.os.Build.VERSION;
import com.nostra13.universalimageloader.core.assist.ImageScaleType;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.nostra13.universalimageloader.core.assist.ViewScaleType;
import com.nostra13.universalimageloader.core.download.ImageDownloader;
import com.nostra13.universalimageloader.core.download.ImageDownloader.Scheme;
import com.nostra13.universalimageloader.utils.ImageSizeUtils;
import com.nostra13.universalimageloader.utils.IoUtils;
import com.nostra13.universalimageloader.utils.L;
import java.io.IOException;
import java.io.InputStream;

public class BaseImageDecoder
  implements ImageDecoder
{
  protected final boolean loggingEnabled;
  
  public BaseImageDecoder(boolean paramBoolean)
  {
    loggingEnabled = paramBoolean;
  }
  
  private boolean canDefineExifParams(String paramString1, String paramString2)
  {
    return (Build.VERSION.SDK_INT >= 5) && ("image/jpeg".equalsIgnoreCase(paramString2)) && (ImageDownloader.Scheme.ofUri(paramString1) == ImageDownloader.Scheme.FILE);
  }
  
  protected Bitmap considerExactScaleAndOrientatiton(Bitmap paramBitmap, ImageDecodingInfo paramImageDecodingInfo, int paramInt, boolean paramBoolean)
  {
    Matrix localMatrix = new Matrix();
    ImageScaleType localImageScaleType = paramImageDecodingInfo.getImageScaleType();
    ImageSize localImageSize1;
    ImageSize localImageSize2;
    ViewScaleType localViewScaleType;
    if ((localImageScaleType == ImageScaleType.EXACTLY) || (localImageScaleType == ImageScaleType.EXACTLY_STRETCHED))
    {
      localImageSize1 = new ImageSize(paramBitmap.getWidth(), paramBitmap.getHeight(), paramInt);
      localImageSize2 = paramImageDecodingInfo.getTargetSize();
      localViewScaleType = paramImageDecodingInfo.getViewScaleType();
      if (localImageScaleType != ImageScaleType.EXACTLY_STRETCHED) {
        break label257;
      }
    }
    label257:
    for (boolean bool = true;; bool = false)
    {
      float f = ImageSizeUtils.computeImageScale(localImageSize1, localImageSize2, localViewScaleType, bool);
      if (Float.compare(f, 1.0F) != 0)
      {
        localMatrix.setScale(f, f);
        if (loggingEnabled) {
          L.d("Scale subsampled image (%1$s) to %2$s (scale = %3$.5f) [%4$s]", new Object[] { localImageSize1, localImageSize1.scale(f), Float.valueOf(f), paramImageDecodingInfo.getImageKey() });
        }
      }
      if (paramBoolean)
      {
        localMatrix.postScale(-1.0F, 1.0F);
        if (loggingEnabled) {
          L.d("Flip image horizontally [%s]", new Object[] { paramImageDecodingInfo.getImageKey() });
        }
      }
      if (paramInt != 0)
      {
        localMatrix.postRotate(paramInt);
        if (loggingEnabled) {
          L.d("Rotate image on %1$d° [%2$s]", new Object[] { Integer.valueOf(paramInt), paramImageDecodingInfo.getImageKey() });
        }
      }
      paramImageDecodingInfo = Bitmap.createBitmap(paramBitmap, 0, 0, paramBitmap.getWidth(), paramBitmap.getHeight(), localMatrix, true);
      if (paramImageDecodingInfo != paramBitmap) {
        paramBitmap.recycle();
      }
      return paramImageDecodingInfo;
    }
  }
  
  public Bitmap decode(ImageDecodingInfo paramImageDecodingInfo)
    throws IOException
  {
    InputStream localInputStream2 = getImageStream(paramImageDecodingInfo);
    InputStream localInputStream1 = localInputStream2;
    ImageFileInfo localImageFileInfo;
    Bitmap localBitmap;
    try
    {
      localImageFileInfo = defineImageSizeAndRotation(localInputStream2, paramImageDecodingInfo);
      localInputStream1 = localInputStream2;
      localInputStream2 = resetStream(localInputStream2, paramImageDecodingInfo);
      localInputStream1 = localInputStream2;
      localBitmap = BitmapFactory.decodeStream(localInputStream2, null, prepareDecodingOptions(imageSize, paramImageDecodingInfo));
      IoUtils.closeSilently(localInputStream2);
      if (localBitmap == null)
      {
        L.e("Image can't be decoded [%s]", new Object[] { paramImageDecodingInfo.getImageKey() });
        return localBitmap;
      }
    }
    finally
    {
      IoUtils.closeSilently(localInputStream1);
    }
    return considerExactScaleAndOrientatiton(localBitmap, paramImageDecodingInfo, exif.rotation, exif.flipHorizontal);
  }
  
  protected ExifInfo defineExifOrientation(String paramString)
  {
    int i = 0;
    bool1 = false;
    boolean bool2 = false;
    boolean bool3 = false;
    boolean bool4 = false;
    bool5 = false;
    for (;;)
    {
      try
      {
        int j = new ExifInterface(ImageDownloader.Scheme.FILE.crop(paramString)).getAttributeInt("Orientation", 1);
        switch (j)
        {
        default: 
          bool1 = bool5;
        }
      }
      catch (IOException localIOException)
      {
        L.w("Can't read EXIF tags from file [%s]", new Object[] { paramString });
        bool1 = bool5;
        continue;
      }
      return new ExifInfo(i, bool1);
      bool1 = true;
      i = 0;
      continue;
      bool2 = true;
      i = 90;
      bool1 = bool2;
      continue;
      bool3 = true;
      i = 180;
      bool1 = bool3;
      continue;
      bool4 = true;
      i = 270;
      bool1 = bool4;
    }
  }
  
  protected ImageFileInfo defineImageSizeAndRotation(InputStream paramInputStream, ImageDecodingInfo paramImageDecodingInfo)
    throws IOException
  {
    BitmapFactory.Options localOptions = new BitmapFactory.Options();
    inJustDecodeBounds = true;
    BitmapFactory.decodeStream(paramInputStream, null, localOptions);
    paramInputStream = paramImageDecodingInfo.getImageUri();
    if ((paramImageDecodingInfo.shouldConsiderExifParams()) && (canDefineExifParams(paramInputStream, outMimeType))) {}
    for (paramInputStream = defineExifOrientation(paramInputStream);; paramInputStream = new ExifInfo()) {
      return new ImageFileInfo(new ImageSize(outWidth, outHeight, rotation), paramInputStream);
    }
  }
  
  protected InputStream getImageStream(ImageDecodingInfo paramImageDecodingInfo)
    throws IOException
  {
    return paramImageDecodingInfo.getDownloader().getStream(paramImageDecodingInfo.getImageUri(), paramImageDecodingInfo.getExtraForDownloader());
  }
  
  protected BitmapFactory.Options prepareDecodingOptions(ImageSize paramImageSize, ImageDecodingInfo paramImageDecodingInfo)
  {
    ImageScaleType localImageScaleType = paramImageDecodingInfo.getImageScaleType();
    int i;
    if (localImageScaleType == ImageScaleType.NONE)
    {
      i = ImageSizeUtils.computeMinImageSampleSize(paramImageSize);
      if ((i > 1) && (loggingEnabled)) {
        L.d("Subsample original image (%1$s) to %2$s (scale = %3$d) [%4$s]", new Object[] { paramImageSize, paramImageSize.scaleDown(i), Integer.valueOf(i), paramImageDecodingInfo.getImageKey() });
      }
      paramImageSize = paramImageDecodingInfo.getDecodingOptions();
      inSampleSize = i;
      return paramImageSize;
    }
    ImageSize localImageSize = paramImageDecodingInfo.getTargetSize();
    if (localImageScaleType == ImageScaleType.IN_SAMPLE_POWER_OF_2) {}
    for (boolean bool = true;; bool = false)
    {
      i = ImageSizeUtils.computeImageSampleSize(paramImageSize, localImageSize, paramImageDecodingInfo.getViewScaleType(), bool);
      break;
    }
  }
  
  protected InputStream resetStream(InputStream paramInputStream, ImageDecodingInfo paramImageDecodingInfo)
    throws IOException
  {
    try
    {
      paramInputStream.reset();
      return paramInputStream;
    }
    catch (IOException localIOException)
    {
      IoUtils.closeSilently(paramInputStream);
    }
    return getImageStream(paramImageDecodingInfo);
  }
  
  protected static class ExifInfo
  {
    public final boolean flipHorizontal;
    public final int rotation;
    
    protected ExifInfo()
    {
      rotation = 0;
      flipHorizontal = false;
    }
    
    protected ExifInfo(int paramInt, boolean paramBoolean)
    {
      rotation = paramInt;
      flipHorizontal = paramBoolean;
    }
  }
  
  protected static class ImageFileInfo
  {
    public final BaseImageDecoder.ExifInfo exif;
    public final ImageSize imageSize;
    
    protected ImageFileInfo(ImageSize paramImageSize, BaseImageDecoder.ExifInfo paramExifInfo)
    {
      imageSize = paramImageSize;
      exif = paramExifInfo;
    }
  }
}
