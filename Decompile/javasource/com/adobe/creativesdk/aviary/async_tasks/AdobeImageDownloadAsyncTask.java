package com.adobe.creativesdk.aviary.async_tasks;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.net.Uri;
import android.support.v7.graphics.Palette;
import android.support.v7.graphics.Palette.Builder;
import android.util.DisplayMetrics;
import android.util.Log;
import com.adobe.creativesdk.aviary.internal.os.AdobeImageAsyncTask;
import com.adobe.creativesdk.aviary.internal.utils.DecodeUtils;
import com.adobe.creativesdk.aviary.internal.utils.ImageInfo;
import com.adobe.creativesdk.aviary.internal.utils.ScreenUtils;
import com.adobe.creativesdk.aviary.internal.utils.SystemUtils.MemoryInfo;
import com.adobe.creativesdk.aviary.utils.EventBusUtils;
import de.greenrobot.event.EventBus;

public class AdobeImageDownloadAsyncTask
  extends AdobeImageAsyncTask<Context, Void, Bitmap>
{
  private String error;
  private boolean mEnabled;
  private final long mId;
  private ImageInfo mImageOutputInfo;
  private int mMaxSize;
  private Uri mUri;
  
  public AdobeImageDownloadAsyncTask(long paramLong, Uri paramUri, int paramInt)
  {
    mUri = paramUri;
    mMaxSize = paramInt;
    mImageOutputInfo = new ImageInfo();
    mEnabled = true;
    mId = paramLong;
  }
  
  public static int getManagedMaxImageSize(Context paramContext)
  {
    if (ScreenUtils.isTablet(paramContext)) {}
    int i;
    for (double d = 0.75D;; d = 1.0D)
    {
      paramContext = paramContext.getResources().getDisplayMetrics();
      Log.v("AdbDownloadAsyncTask", "screen size: " + widthPixels + "x" + heightPixels);
      i = (int)(Math.max(widthPixels, heightPixels) * d);
      d = SystemUtils.MemoryInfo.getRuntimeTotalMemory();
      if (d < 500.0D) {
        break;
      }
      return Math.min(i, 2048);
    }
    if (d >= 127.0D) {
      return Math.min(i, 1440);
    }
    if (d >= 48.0D) {
      return Math.min(i, 960);
    }
    return Math.min(i, 720);
  }
  
  protected Bitmap doInBackground(Context... paramVarArgs)
  {
    Log.i("AdbDownloadAsyncTask", "doInBackground: current thread #" + Thread.currentThread().getId());
    paramVarArgs = paramVarArgs[0];
    int i = -1;
    if (mMaxSize > 0) {
      i = mMaxSize;
    }
    int j = i;
    if (i <= 0) {
      j = getManagedMaxImageSize(paramVarArgs);
    }
    try
    {
      paramVarArgs = DecodeUtils.decode(paramVarArgs, mUri, j, j, mImageOutputInfo);
      if (paramVarArgs != null)
      {
        Palette localPalette = Palette.from(paramVarArgs).resizeBitmapSize(j / 2).generate();
        mImageOutputInfo.setPalette(localPalette);
      }
      return paramVarArgs;
    }
    catch (Exception paramVarArgs)
    {
      Log.e("AdbDownloadAsyncTask", "decode error", paramVarArgs);
      error = paramVarArgs.getMessage();
    }
    return null;
  }
  
  protected void doPostExecute(Bitmap paramBitmap)
  {
    Log.i("AdbDownloadAsyncTask", "doPostExecute: current thread #" + Thread.currentThread().getId());
    if (mEnabled)
    {
      if (paramBitmap == null) {
        break label74;
      }
      EventBusUtils.getInstance().post(new DownloadCompleteEvent(mId, paramBitmap, mImageOutputInfo));
    }
    for (;;)
    {
      mUri = null;
      error = null;
      return;
      label74:
      EventBusUtils.getInstance().post(new DownloadErrorEvent(mId, error));
    }
  }
  
  protected void doPreExecute()
  {
    Log.i("AdbDownloadAsyncTask", "doPreExecute: current thread #" + Thread.currentThread().getId());
    if (mEnabled) {
      EventBusUtils.getInstance().post(new DownloadStartEvent(mId));
    }
  }
  
  public void setEnabled(boolean paramBoolean)
  {
    mEnabled = paramBoolean;
  }
  
  public static final class DownloadCompleteEvent
    extends AdobeImageDownloadAsyncTask.DownloadEvent
  {
    public final Bitmap bitmap;
    public final ImageInfo imageInfo;
    
    protected DownloadCompleteEvent(long paramLong, Bitmap paramBitmap, ImageInfo paramImageInfo)
    {
      super();
      bitmap = paramBitmap;
      imageInfo = paramImageInfo;
    }
  }
  
  public static final class DownloadErrorEvent
    extends AdobeImageDownloadAsyncTask.DownloadEvent
  {
    public final String error;
    
    protected DownloadErrorEvent(long paramLong, String paramString)
    {
      super();
      error = paramString;
    }
  }
  
  static abstract class DownloadEvent
  {
    final long id;
    
    protected DownloadEvent(long paramLong)
    {
      id = paramLong;
    }
    
    public long getId()
    {
      return id;
    }
  }
  
  public static final class DownloadStartEvent
    extends AdobeImageDownloadAsyncTask.DownloadEvent
  {
    protected DownloadStartEvent(long paramLong)
    {
      super();
    }
  }
}
