package com.adobe.creativesdk.aviary.graphics;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import com.adobe.creativesdk.aviary.internal.utils.BitmapUtils;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.log.LoggerFactory.LoggerType;
import it.sephiroth.android.library.picasso.Transformation;
import java.util.concurrent.Callable;

public class CdsPreviewTransformer
  implements Transformation, Callable<Bitmap>
{
  static LoggerFactory.Logger logger = LoggerFactory.getLogger(CdsPreviewTransformer.class.getSimpleName(), LoggerFactory.LoggerType.ConsoleLoggerType);
  final String mDisplayName;
  int mInputDensity;
  int mMaxH = -1;
  int mMaxW = -1;
  final String mPath;
  int mTargetDensity;
  final String mType;
  
  public CdsPreviewTransformer(String paramString1, String paramString2, String paramString3)
  {
    mDisplayName = paramString2;
    mType = paramString3;
    mPath = paramString1;
  }
  
  private Bitmap decode()
  {
    BitmapFactory.Options localOptions = new BitmapFactory.Options();
    inPreferredConfig = Bitmap.Config.ARGB_8888;
    inInputShareable = true;
    inPurgeable = true;
    inTargetDensity = mTargetDensity;
    inDensity = mInputDensity;
    Bitmap localBitmap = BitmapFactory.decodeFile(mPath, localOptions);
    logger.log("input.density: %d, target.density: %d", new Object[] { Integer.valueOf(mInputDensity), Integer.valueOf(mTargetDensity) });
    logger.log("options.size: %dx%d", new Object[] { Integer.valueOf(outWidth), Integer.valueOf(outHeight) });
    return localBitmap;
  }
  
  public Bitmap call()
    throws Exception
  {
    return transform(decode());
  }
  
  public String key()
  {
    return mPath;
  }
  
  public Bitmap transform(Bitmap paramBitmap)
  {
    Object localObject = paramBitmap;
    Bitmap localBitmap;
    if (paramBitmap != null)
    {
      localObject = paramBitmap;
      if (mMaxW > 0)
      {
        localObject = paramBitmap;
        if (mMaxH > 0)
        {
          logger.log("need to resize to: %dx%d", new Object[] { Integer.valueOf(mMaxW), Integer.valueOf(mMaxH) });
          localBitmap = BitmapUtils.resizeBitmap(paramBitmap, mMaxW, mMaxH);
          localObject = paramBitmap;
          if (!localBitmap.equals(paramBitmap))
          {
            paramBitmap.recycle();
            localObject = localBitmap;
          }
        }
      }
    }
    paramBitmap = (Bitmap)localObject;
    if ("effect".equals(mType))
    {
      paramBitmap = (Bitmap)localObject;
      if (localObject != null)
      {
        int i = (int)(((Bitmap)localObject).getHeight() * 0.865F);
        localBitmap = Bitmap.createBitmap((Bitmap)localObject, 0, 0, ((Bitmap)localObject).getWidth(), i);
        paramBitmap = (Bitmap)localObject;
        if (localBitmap != localObject)
        {
          ((Bitmap)localObject).recycle();
          paramBitmap = localBitmap;
        }
      }
    }
    logger.log("final bitmap.size: %dx%d", new Object[] { Integer.valueOf(paramBitmap.getWidth()), Integer.valueOf(paramBitmap.getHeight()) });
    return paramBitmap;
  }
}
