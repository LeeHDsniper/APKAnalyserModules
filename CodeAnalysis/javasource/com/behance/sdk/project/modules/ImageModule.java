package com.behance.sdk.project.modules;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.Matrix;
import android.media.ExifInterface;
import android.net.Uri;
import android.os.Environment;
import android.provider.MediaStore.Images.Thumbnails;
import android.view.View;
import android.widget.ImageView;
import com.behance.sdk.logger.ILogger;
import com.behance.sdk.logger.LoggerFactory;
import com.behance.sdk.util.BehanceSDKImageLoaderUtils;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.assist.FailReason;
import com.nostra13.universalimageloader.core.listener.ImageLoadingListener;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class ImageModule
  extends BaseModule
{
  private static final ILogger logger = LoggerFactory.getLogger(ImageModule.class);
  private static final long serialVersionUID = 5636447312019606595L;
  private String albumName;
  private transient Bitmap bitmap;
  private boolean defaultThumbnailRotationApplied = false;
  private File file;
  private int height;
  private long id = -1L;
  private int rotation = 0;
  private long sizeInBytes;
  private transient Bitmap thumbnail;
  private int width;
  
  public ImageModule(long paramLong, String paramString)
  {
    id = paramLong;
    setFile(new File(paramString));
    computeImageDimensions();
    getDefaultOrientation();
  }
  
  public ImageModule(File paramFile)
  {
    setFile(paramFile);
    computeImageDimensions();
    getDefaultOrientation();
  }
  
  private void computeImageDimensions()
  {
    if ((file != null) && (file.exists()) && (file.isFile()))
    {
      BitmapFactory.Options localOptions = new BitmapFactory.Options();
      inJustDecodeBounds = true;
      BitmapFactory.decodeFile(file.getAbsolutePath(), localOptions);
      setWidth(outWidth);
      setHeight(outHeight);
      setSizeInBytes(file.length());
    }
  }
  
  private boolean equalObject(Object paramObject1, Object paramObject2)
  {
    if (paramObject1 == paramObject2) {
      return true;
    }
    if (((paramObject1 != null) && (paramObject2 == null)) || ((paramObject1 == null) && (paramObject2 != null))) {
      return false;
    }
    return paramObject1.equals(paramObject2);
  }
  
  private void getDefaultOrientation()
  {
    if ((!defaultThumbnailRotationApplied) || (thumbnail == null)) {
      for (;;)
      {
        try
        {
          switch (new ExifInterface(file.getAbsolutePath()).getAttributeInt("Orientation", 1))
          {
          case 2: 
          case 4: 
          case 5: 
          case 7: 
            defaultThumbnailRotationApplied = true;
            return;
          }
        }
        catch (IOException localIOException)
        {
          logger.error("Exception while getting the default orientation", new Object[] { localIOException });
          return;
        }
        rotation = 0;
        continue;
        rotation = 1;
        continue;
        rotation = 2;
        continue;
        rotation = 3;
      }
    }
  }
  
  private String getFilePath()
  {
    return file.getAbsolutePath();
  }
  
  private String getImageUrl()
  {
    return Uri.decode(Uri.fromFile(file).toString());
  }
  
  private Bitmap getThumbNailFromFile()
  {
    BitmapFactory.Options localOptions = new BitmapFactory.Options();
    inJustDecodeBounds = true;
    String str = getFilePath();
    BitmapFactory.decodeFile(str, localOptions);
    int i = outWidth;
    int j = outHeight;
    i = Math.min(i / 400, j / 400);
    inJustDecodeBounds = false;
    inSampleSize = i;
    inPurgeable = true;
    return BitmapFactory.decodeFile(str, localOptions);
  }
  
  private File savebitmap(Bitmap paramBitmap, String paramString)
    throws IOException
  {
    paramString = new File(Environment.getExternalStorageDirectory().toString(), paramString + "_temp");
    if (paramString.exists()) {
      paramString.delete();
    }
    FileOutputStream localFileOutputStream = new FileOutputStream(paramString);
    paramBitmap.compress(Bitmap.CompressFormat.PNG, 100, localFileOutputStream);
    localFileOutputStream.flush();
    localFileOutputStream.close();
    return paramString;
  }
  
  private void setFile(File paramFile)
  {
    file = paramFile;
  }
  
  private void setHeight(int paramInt)
  {
    height = paramInt;
  }
  
  private void setImageViewLayerType(ImageView paramImageView, Bitmap paramBitmap)
  {
    if ((paramBitmap.getWidth() > 2048) || (paramBitmap.getHeight() > 2048))
    {
      paramImageView.setLayerType(1, null);
      return;
    }
    paramImageView.setLayerType(2, null);
  }
  
  private void setWidth(int paramInt)
  {
    width = paramInt;
  }
  
  private void updateThumbnailForDefaultRotation()
  {
    if (rotation > 0)
    {
      Object localObject = new Matrix();
      ((Matrix)localObject).postRotate(rotation * 90);
      localObject = Bitmap.createBitmap(thumbnail, 0, 0, thumbnail.getWidth(), thumbnail.getHeight(), (Matrix)localObject, true);
      thumbnail.recycle();
      thumbnail = ((Bitmap)localObject);
    }
  }
  
  private Bitmap updateThumbnailForRotation(Bitmap paramBitmap)
  {
    Matrix localMatrix = new Matrix();
    localMatrix.postRotate(90.0F);
    return Bitmap.createBitmap(paramBitmap, 0, 0, paramBitmap.getWidth(), paramBitmap.getHeight(), localMatrix, true);
  }
  
  public void clear()
  {
    clearRotation();
  }
  
  public void clearRotation()
  {
    rotation = 0;
    defaultThumbnailRotationApplied = false;
    getDefaultOrientation();
    recycleBitmaps();
  }
  
  public void displayImage(ImageView paramImageView, ImageLoadingListener paramImageLoadingListener)
  {
    displayImage(paramImageView, paramImageLoadingListener, BehanceSDKImageLoaderUtils.getDefaultImageLoaderOptions());
  }
  
  public void displayImage(final ImageView paramImageView, final ImageLoadingListener paramImageLoadingListener, DisplayImageOptions paramDisplayImageOptions)
  {
    String str = getImageUrl();
    if (bitmap == null) {
      BehanceSDKImageLoaderUtils.displayImageFromCacheOrLoadFromServer(str, paramImageView, new ImageLoadingListener()
      {
        public void onLoadingCancelled(String paramAnonymousString, View paramAnonymousView)
        {
          if (paramImageLoadingListener != null) {
            paramImageLoadingListener.onLoadingCancelled(paramAnonymousString, paramAnonymousView);
          }
        }
        
        public void onLoadingComplete(String paramAnonymousString, View paramAnonymousView, Bitmap paramAnonymousBitmap)
        {
          ImageModule.access$002(ImageModule.this, BehanceSDKImageLoaderUtils.updateBitmapForRotation(paramAnonymousBitmap, jdField_this));
          ImageModule.this.setImageViewLayerType(paramImageView, paramAnonymousBitmap);
          paramImageView.setImageBitmap(bitmap);
          if (paramImageLoadingListener != null) {
            paramImageLoadingListener.onLoadingComplete(paramAnonymousString, paramAnonymousView, bitmap);
          }
        }
        
        public void onLoadingFailed(String paramAnonymousString, View paramAnonymousView, FailReason paramAnonymousFailReason)
        {
          if (paramImageLoadingListener != null) {
            paramImageLoadingListener.onLoadingFailed(paramAnonymousString, paramAnonymousView, paramAnonymousFailReason);
          }
        }
        
        public void onLoadingStarted(String paramAnonymousString, View paramAnonymousView)
        {
          if (paramImageLoadingListener != null) {
            paramImageLoadingListener.onLoadingStarted(paramAnonymousString, paramAnonymousView);
          }
        }
      }, paramDisplayImageOptions);
    }
    do
    {
      return;
      setImageViewLayerType(paramImageView, bitmap);
      paramImageView.setImageBitmap(bitmap);
    } while (paramImageLoadingListener == null);
    paramImageLoadingListener.onLoadingComplete(str, paramImageView, bitmap);
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass())) {
        return false;
      }
      paramObject = (ImageModule)paramObject;
    } while ((id == id) && (equalObject(file, file)) && (equalObject(albumName, albumName)) && (rotation == rotation) && (width == width) && (height == height));
    return false;
  }
  
  public String getAlbumName()
  {
    return albumName;
  }
  
  public File getFile()
  {
    return file;
  }
  
  public File getFileForUpload()
    throws IOException
  {
    File localFile = file;
    if (rotation > 0)
    {
      Bitmap localBitmap1 = BehanceSDKImageLoaderUtils.getImageBitmap(getImageUrl());
      Bitmap localBitmap2 = BehanceSDKImageLoaderUtils.updateBitmapForRotation(localBitmap1, this);
      localFile = savebitmap(localBitmap2, file.getName());
      localBitmap1.recycle();
      localBitmap2.recycle();
    }
    return localFile;
  }
  
  public int getHeight()
  {
    return height;
  }
  
  public String getName()
  {
    return file.getName();
  }
  
  public int getRotation()
  {
    return rotation;
  }
  
  public long getSizeInBytes()
  {
    return sizeInBytes;
  }
  
  public Bitmap getThumbNail(Context paramContext)
  {
    Object localObject;
    if ((thumbnail == null) || (thumbnail.isRecycled()))
    {
      localObject = null;
      if (id == -1L) {
        break label58;
      }
      paramContext = MediaStore.Images.Thumbnails.getThumbnail(paramContext.getContentResolver(), id, 1, null);
    }
    for (;;)
    {
      thumbnail = paramContext;
      updateThumbnailForDefaultRotation();
      return thumbnail;
      label58:
      paramContext = localObject;
      if (file != null) {
        paramContext = getThumbNailFromFile();
      }
    }
  }
  
  public ProjectModuleTypes getType()
  {
    return ProjectModuleTypes.IMAGE;
  }
  
  public int getWidth()
  {
    return width;
  }
  
  public void recycleBitmaps()
  {
    recycleThumbnailBitmap();
    recycleImageBitmap();
  }
  
  public void recycleImageBitmap()
  {
    if ((bitmap != null) && (!bitmap.isRecycled()))
    {
      bitmap.recycle();
      bitmap = null;
    }
  }
  
  public void recycleThumbnailBitmap()
  {
    if ((thumbnail != null) && (!thumbnail.isRecycled()))
    {
      thumbnail.recycle();
      thumbnail = null;
    }
  }
  
  public void rotateImage()
  {
    if (rotation == 3) {}
    for (rotation = 0;; rotation += 1)
    {
      Bitmap localBitmap = updateThumbnailForRotation(thumbnail);
      recycleBitmaps();
      thumbnail = localBitmap;
      return;
    }
  }
  
  public void setAlbumName(String paramString)
  {
    albumName = paramString;
  }
  
  public void setSizeInBytes(long paramLong)
  {
    sizeInBytes = paramLong;
  }
}
