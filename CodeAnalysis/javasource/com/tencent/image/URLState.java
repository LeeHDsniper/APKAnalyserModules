package com.tencent.image;

import android.app.PendingIntent.CanceledException;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory.Options;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.ConstantState;
import android.media.ExifInterface;
import android.os.AsyncTask;
import android.os.AsyncTask.Status;
import android.os.Build.VERSION;
import android.os.Handler;
import android.os.Looper;
import android.support.v4.util.MQLruCache;
import android.util.Pair;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.net.URL;
import java.util.HashMap;
import java.util.Vector;
import java.util.concurrent.CancellationException;
import java.util.concurrent.RejectedExecutionException;
import org.apache.http.Header;
import org.apache.http.client.CookieStore;

final class URLState
  extends Drawable.ConstantState
{
  static final String CACHE_PREFIX = "Cache_";
  static final Object FILE_DOWNLOADED = new Object();
  private static final Handler UI_HANDLER = new Handler(Looper.getMainLooper());
  static HashMap<String, WeakReference<URLState>> sUnFinishImageCache = new HashMap();
  private Vector<WeakReference<Callback>> callbacks = new Vector();
  File mCacheFile;
  boolean mDecodeFile;
  private final Object mDecodeFileLock = new Object();
  boolean mDither = true;
  int mHeight = 0;
  boolean mIgnorePause = false;
  int mIsLoadingStarted = 0;
  int mOrientation = 0;
  DownloadParams mParams = new DownloadParams();
  int mProgress = 0;
  ProtocolDownloader mProtocolDownloader;
  int mStatus = 0;
  Drawable.ConstantState mSuccessed;
  PreDownloadAsyncTask mTask;
  URL mUrl;
  String mUrlStr;
  boolean mUseMemoryCache = true;
  boolean mUseThreadPool = true;
  int mWidth = 0;
  
  URLState(URL arg1, URLDrawable.URLDrawableOptions paramURLDrawableOptions)
  {
    mUrl = ???;
    mUrlStr = ???.toString();
    mUseMemoryCache = mUseMemoryCache;
    mUseThreadPool = mUseThreadPool;
    mProtocolDownloader = URLDrawable.sDefaultDrawableParms.getDownloader(???.getProtocol());
    if (mProtocolDownloader == null) {
      throw new NullPointerException("No comfortable downloader. url:" + ???);
    }
    synchronized (URLDrawable.sMemoryCache)
    {
      sUnFinishImageCache.put(mUrlStr, new WeakReference(this));
      return;
    }
  }
  
  private int calculateInSampleSize(BitmapFactory.Options paramOptions, int paramInt1, int paramInt2)
  {
    if ((paramInt1 == 0) || (paramInt2 == 0) || (paramInt1 == -1) || (paramInt2 == -1)) {
      m = 1;
    }
    int j;
    int k;
    int i;
    label39:
    do
    {
      do
      {
        return m;
        j = outHeight;
        k = outWidth;
        i = 1;
        m = i;
      } while (j <= paramInt2);
      m = i;
    } while (k <= paramInt1);
    int n = Math.round(j / paramInt2);
    int m = Math.round(k / paramInt1);
    if (n > m) {}
    for (;;)
    {
      m = i;
      if (n < 2) {
        break;
      }
      k >>= 1;
      j >>= 1;
      i <<= 1;
      break label39;
      n = m;
    }
  }
  
  private Object decodeFile(File paramFile, URLDrawableHandler paramURLDrawableHandler)
    throws Exception
  {
    if ((paramFile == null) || (!paramFile.exists())) {
      return null;
    }
    Object localObject = mProtocolDownloader;
    if (localObject != null)
    {
      paramURLDrawableHandler = ((ProtocolDownloader)localObject).decodeFile(paramFile, mParams, paramURLDrawableHandler);
      if (paramURLDrawableHandler != null)
      {
        mOrientation = mParams.outOrientation;
        mWidth = mParams.outWidth;
        mHeight = mParams.outHeight;
        return paramURLDrawableHandler;
      }
    }
    boolean bool = ((ProtocolDownloader)localObject).gifHasDifferentState();
    if (VideoDrawable.isVideo(paramFile)) {
      return new NativeVideoImage(paramFile, true, mParams.reqWidth, mParams.reqHeight, mParams.mExtraInfo);
    }
    if ((GifDrawable.isGifFile(paramFile)) && ((bool) || (mParams.useGifAnimation))) {
      return NativeGifFactory.getNativeGifObject(paramFile, bool, false, mParams.reqWidth, mParams.reqHeight, mParams.mGifRoundCorner);
    }
    if ((ApngImage.needDecodeAnimation(paramFile)) && ((bool) || (mParams.useGifAnimation))) {
      return new ApngImage(paramFile, bool);
    }
    localObject = paramFile.getAbsolutePath();
    BitmapFactory.Options localOptions = new BitmapFactory.Options();
    inJustDecodeBounds = true;
    inPreferredConfig = sDefaultDrawableParmsmConfig;
    inDensity = 160;
    inTargetDensity = 160;
    inScreenDensity = 160;
    SafeBitmapFactory.decodeFile((String)localObject, localOptions);
    inJustDecodeBounds = false;
    inSampleSize = calculateInSampleSize(localOptions, mParams.reqWidth, mParams.reqHeight);
    paramURLDrawableHandler = SafeBitmapFactory.decodeFile((String)localObject, localOptions);
    if (QLog.isDevelopLevel()) {
      QLog.d("URLDrawable_", 4, "decodeFile:sampleSize=" + inSampleSize + ", requestSize=" + mParams.reqWidth + "," + mParams.reqHeight);
    }
    if (paramURLDrawableHandler == null)
    {
      bool = paramFile.delete();
      if (QLog.isDevelopLevel()) {
        QLog.d("URLDrawable_", 4, "Delete error cache return " + bool);
      }
      throw new IOException("decode cache file failed: " + (String)localObject);
    }
    mOrientation = new ExifInterface((String)localObject).getAttributeInt("Orientation", 1);
    paramFile = paramURLDrawableHandler;
    if (mParams.mDecodeHandler != null) {
      paramFile = mParams.mDecodeHandler.run(mParams, paramURLDrawableHandler);
    }
    if ((Build.VERSION.SDK_INT >= 11) && (SliceBitmap.needSlice(paramFile)))
    {
      paramURLDrawableHandler = new SliceBitmap(paramFile);
      paramFile.recycle();
      return paramURLDrawableHandler;
    }
    return paramFile;
  }
  
  static URLState getConstants(String paramString)
  {
    synchronized (URLDrawable.sMemoryCache)
    {
      WeakReference localWeakReference = (WeakReference)sUnFinishImageCache.get(paramString);
      if ((localWeakReference != null) && (localWeakReference.get() != null))
      {
        paramString = (URLState)localWeakReference.get();
        return paramString;
      }
      paramString = (Pair)URLDrawable.sMemoryCache.get(paramString);
      if ((paramString != null) && ((first instanceof URLState))) {
        return (URLState)first;
      }
    }
    return null;
  }
  
  private static int getImageByteSize(Object paramObject)
  {
    if ((paramObject instanceof Bitmap)) {
      return Utils.getBitmapSize((Bitmap)paramObject);
    }
    if ((paramObject instanceof SliceBitmap)) {
      return ((SliceBitmap)paramObject).getByteCount();
    }
    if ((paramObject instanceof AbstractGifImage)) {
      return ((AbstractGifImage)paramObject).getByteSize();
    }
    if (NativeVideoImage.class.isInstance(paramObject)) {
      return ((NativeVideoImage)paramObject).getByteSize();
    }
    return 0;
  }
  
  private void pauseThread()
  {
    if ((mIgnorePause) || (Looper.myLooper() == Looper.getMainLooper())) {
      return;
    }
    synchronized (URLDrawable.sPauseLock)
    {
      for (;;)
      {
        boolean bool = URLDrawable.sPause;
        if (!bool) {
          break;
        }
        try
        {
          URLDrawable.sPauseLock.wait();
        }
        catch (InterruptedException localInterruptedException) {}
      }
      return;
    }
  }
  
  void addCallBack(Callback paramCallback)
  {
    if (paramCallback != null) {
      callbacks.add(new WeakReference(paramCallback));
    }
  }
  
  void downloadImediatly(Header[] paramArrayOfHeader, CookieStore paramCookieStore, Object paramObject, boolean paramBoolean1, boolean paramBoolean2, float paramFloat)
  {
    if ((mStatus == 1) || (mIsLoadingStarted > 0)) {
      return;
    }
    mIsLoadingStarted += 1;
    mDecodeFile = paramBoolean1;
    mParams.cookies = paramCookieStore;
    mParams.headers = paramArrayOfHeader;
    mParams.tag = paramObject;
    mParams.useGifAnimation = paramBoolean2;
    mParams.mGifRoundCorner = paramFloat;
    try
    {
      paramArrayOfHeader = loadImage(mUrl, new URLDrawableHandler.Adapter());
      if (Looper.myLooper() != Looper.getMainLooper()) {
        break label178;
      }
      paramCookieStore = paramArrayOfHeader;
    }
    catch (Throwable paramArrayOfHeader)
    {
      do
      {
        paramArrayOfHeader = paramArrayOfHeader;
        paramCookieStore = paramArrayOfHeader;
      } while (Looper.myLooper() == Looper.getMainLooper());
      paramObject = UI_HANDLER;
      paramCookieStore = new PostOnResult(paramArrayOfHeader);
      paramArrayOfHeader = paramObject;
      paramArrayOfHeader.post(paramCookieStore);
      return;
    }
    finally
    {
      for (;;)
      {
        paramArrayOfHeader = finally;
        if (Looper.myLooper() == Looper.getMainLooper()) {
          onResult(null);
        }
        for (;;)
        {
          throw paramArrayOfHeader;
          UI_HANDLER.post(new PostOnResult(null));
        }
        paramCookieStore = UI_HANDLER;
        paramObject = new PostOnResult(paramArrayOfHeader);
        paramArrayOfHeader = paramCookieStore;
        paramCookieStore = paramObject;
      }
    }
    onResult(paramCookieStore);
  }
  
  public int getChangingConfigurations()
  {
    return 0;
  }
  
  Object loadImage(URL arg1, URLDrawableHandler paramURLDrawableHandler)
    throws Throwable
  {
    pauseThread();
    ??? = mProtocolDownloader.loadImageFile(mParams, paramURLDrawableHandler);
    mCacheFile = ((File)???);
    for (;;)
    {
      Pair localPair;
      synchronized (mDecodeFileLock)
      {
        if (!mDecodeFile)
        {
          mStatus = 4;
          mIsLoadingStarted -= 1;
          paramURLDrawableHandler = FILE_DOWNLOADED;
          return paramURLDrawableHandler;
        }
        mStatus = 4;
        mStatus = 4;
        ??? = decodeFile((File)???, paramURLDrawableHandler);
        if (??? != null)
        {
          if (!(??? instanceof Bitmap)) {
            break label223;
          }
          ??? = mUrl.getPath();
          ??? = new RegionDrawable(null, (Bitmap)???, (String)???);
          ((RegionDrawable)???).setDither(mDither);
          mSuccessed = ((RegionDrawable)???).getConstantState();
          localPair = new Pair(this, Integer.valueOf(getImageByteSize(???)));
        }
      }
      synchronized (URLDrawable.sMemoryCache)
      {
        sUnFinishImageCache.remove(mUrlStr);
        if (mUseMemoryCache) {
          URLDrawable.sMemoryCache.put(mUrlStr, localPair);
        }
        mStatus = 1;
        pauseThread();
        paramURLDrawableHandler.publishProgress(10000);
        if (??? == null)
        {
          throw new NullPointerException("bitmap decode failed");
          paramURLDrawableHandler = finally;
          throw paramURLDrawableHandler;
          label223:
          if ((??? instanceof SliceBitmap))
          {
            ??? = new SliceBitmapDrawable.BitmapState((SliceBitmap)???);
            mPaint.setDither(mDither);
            mSuccessed = ((Drawable.ConstantState)???);
            continue;
          }
          if ((??? instanceof AbstractGifImage))
          {
            ??? = new GifDrawable.GifState((AbstractGifImage)???);
            mPaint.setDither(mDither);
            mSuccessed = ((Drawable.ConstantState)???);
            continue;
          }
          if ((??? instanceof ApngImage))
          {
            ??? = new ApngDrawable.ApngState((ApngImage)???);
            mPaint.setDither(mDither);
            mSuccessed = ((Drawable.ConstantState)???);
            continue;
          }
          if ((??? instanceof RoundRectBitmap))
          {
            ??? = new RoundRectDrawable.RoundRectDrawableState((RoundRectBitmap)???);
            mBorderPaint.setDither(mDither);
            mBitmapPaint.setDither(mDither);
            mSuccessed = ((Drawable.ConstantState)???);
            continue;
          }
          if ((??? instanceof AbstractVideoImage))
          {
            ??? = new VideoDrawable.VideoState((AbstractVideoImage)???);
            mPaint.setDither(mDither);
            mSuccessed = ((Drawable.ConstantState)???);
            continue;
          }
          throw new RuntimeException("Invalide image type " + ???.getClass().getSimpleName());
        }
      }
    }
    if (mSuccessed == null) {
      throw new NullPointerException("mSuccessed is null...");
    }
    return ???;
  }
  
  public Drawable newDrawable()
  {
    return new URLDrawable(this, null);
  }
  
  public Drawable newDrawable(Resources paramResources)
  {
    return new URLDrawable(this, paramResources);
  }
  
  void onFileDownloaded()
  {
    if (QLog.isDevelopLevel()) {
      QLog.d("URLDrawable_", 4, "download successed, URLState: " + this + " , url: " + mUrlStr + "\nnotify " + callbacks.size() + " callbacks");
    }
    Vector localVector = callbacks;
    int i = 0;
    for (;;)
    {
      Object localObject1;
      int j;
      try
      {
        if (i < callbacks.size())
        {
          localObject1 = (WeakReference)callbacks.get(i);
          if ((localObject1 == null) || (((WeakReference)localObject1).get() == null))
          {
            localObject1 = callbacks;
            j = i - 1;
          }
        }
      }
      finally {}
      try
      {
        ((Vector)localObject1).remove(i);
        i = j;
        i += 1;
      }
      finally
      {
        for (;;) {}
      }
      ((Callback)((WeakReference)localObject1).get()).onFileDownloaded(this);
    }
    return;
    throw localObject2;
  }
  
  void onLoadCancelled()
  {
    if (QLog.isColorLevel()) {
      QLog.i("URLDrawable_", 2, "[onLoadCancelled]");
    }
    mStatus = 3;
    mIsLoadingStarted -= 1;
    int i = 0;
    for (;;)
    {
      if (i < callbacks.size()) {}
      synchronized (callbacks)
      {
        Object localObject1 = (WeakReference)callbacks.get(i);
        if ((localObject1 == null) || (((WeakReference)localObject1).get() == null)) {
          localObject1 = callbacks;
        }
        for (;;)
        {
          try
          {
            ((Vector)localObject1).remove(i);
            i -= 1;
            i += 1;
          }
          finally
          {
            continue;
          }
          ((Callback)((WeakReference)localObject1).get()).onLoadCanceled(this);
        }
        throw ((Throwable)localObject1);
        return;
      }
    }
  }
  
  void onLoadFailed(Throwable paramThrowable)
  {
    if (QLog.isDevelopLevel()) {
      QLog.e("URLDrawable_", 4, wrapLog("URLState onLoadFailed():"), paramThrowable);
    }
    mStatus = 2;
    Vector localVector = callbacks;
    int i = 0;
    for (;;)
    {
      Object localObject;
      int j;
      try
      {
        if (i < callbacks.size())
        {
          localObject = (WeakReference)callbacks.get(i);
          if ((localObject == null) || (((WeakReference)localObject).get() == null))
          {
            localObject = callbacks;
            j = i - 1;
          }
        }
      }
      finally {}
      try
      {
        ((Vector)localObject).remove(i);
        i = j;
        i += 1;
      }
      finally
      {
        for (;;) {}
      }
      ((Callback)((WeakReference)localObject).get()).onLoadFailed(this, paramThrowable);
    }
    return;
    throw paramThrowable;
  }
  
  void onLoadStart()
  {
    Vector localVector = callbacks;
    int i = 0;
    for (;;)
    {
      Object localObject1;
      int j;
      try
      {
        if (i < callbacks.size())
        {
          localObject1 = (WeakReference)callbacks.get(i);
          if ((localObject1 == null) || (((WeakReference)localObject1).get() == null))
          {
            localObject1 = callbacks;
            j = i - 1;
          }
        }
      }
      finally {}
      try
      {
        ((Vector)localObject1).remove(i);
        i = j;
        i += 1;
      }
      finally
      {
        for (;;) {}
      }
      ((Callback)((WeakReference)localObject1).get()).onLoadStarted(this);
    }
    return;
    throw localObject2;
  }
  
  void onLoadSuccessed(Object paramObject)
  {
    if (mIsLoadingStarted == 0) {
      return;
    }
    Vector localVector = callbacks;
    int i = 0;
    for (;;)
    {
      int j;
      try
      {
        if (i < callbacks.size())
        {
          paramObject = (WeakReference)callbacks.get(i);
          if ((paramObject == null) || (paramObject.get() == null))
          {
            paramObject = callbacks;
            j = i - 1;
          }
        }
      }
      finally {}
      try
      {
        paramObject.remove(i);
        i = j;
        i += 1;
      }
      finally
      {
        for (;;) {}
      }
      ((Callback)paramObject.get()).onLoadSuccessed(this);
    }
    callbacks.clear();
    return;
    throw paramObject;
  }
  
  void onResult(Object paramObject)
  {
    if (paramObject == FILE_DOWNLOADED)
    {
      onFileDownloaded();
      return;
    }
    if ((paramObject instanceof PendingIntent.CanceledException))
    {
      onLoadCancelled();
      return;
    }
    if ((paramObject instanceof Throwable))
    {
      onLoadFailed((Throwable)paramObject);
      return;
    }
    onLoadSuccessed(paramObject);
  }
  
  boolean reStartDownload(Header[] paramArrayOfHeader, CookieStore paramCookieStore, Object paramObject1, boolean paramBoolean1, boolean paramBoolean2, float paramFloat, boolean paramBoolean3, Object paramObject2)
  {
    if ((mStatus != 2) && (mStatus != 3)) {
      return false;
    }
    mIsLoadingStarted = 0;
    mStatus = 0;
    startDownload(paramArrayOfHeader, paramCookieStore, paramObject1, paramBoolean1, paramBoolean2, paramFloat, paramBoolean3, paramObject2);
    return true;
  }
  
  void removeCallBack(Callback paramCallback)
  {
    localVector = callbacks;
    int i = 0;
    Object localObject;
    for (;;)
    {
      int j;
      try
      {
        if (i < callbacks.size())
        {
          localObject = (WeakReference)callbacks.get(i);
          if ((localObject == null) || (((WeakReference)localObject).get() == null))
          {
            localObject = callbacks;
            j = i - 1;
          }
        }
      }
      finally {}
      try
      {
        ((Vector)localObject).remove(i);
        i = j;
      }
      finally
      {
        continue;
        continue;
      }
      i += 1;
    }
    if (((WeakReference)localObject).get() == paramCallback)
    {
      paramCallback = callbacks;
      paramCallback.remove(i);
      return;
      return;
    }
  }
  
  public String saveTo(String paramString)
    throws IOException
  {
    if (mCacheFile == null) {
      throw new FileNotFoundException("File is not download complete, please check getStatus() == URLDrawable.SUCCESSED first. ");
    }
    File localFile = mCacheFile;
    String str = paramString;
    if (paramString.indexOf(".") == -1) {
      if (!(mSuccessed instanceof GifDrawable.GifState)) {
        break label87;
      }
    }
    label87:
    for (str = ".gif";; str = ".jpg")
    {
      str = paramString + str;
      Utils.copyFile(localFile, new File(str));
      if (localFile == null) {
        break;
      }
      return str;
    }
    return null;
  }
  
  void startDownload(Header[] paramArrayOfHeader, CookieStore paramCookieStore, Object paramObject1, boolean paramBoolean1, boolean paramBoolean2, float paramFloat, boolean paramBoolean3, Object paramObject2)
  {
    if (mIsLoadingStarted == 0)
    {
      mIsLoadingStarted += 1;
      mDecodeFile = paramBoolean1;
      mParams.cookies = paramCookieStore;
      mParams.headers = paramArrayOfHeader;
      mParams.tag = paramObject1;
      mParams.useGifAnimation = paramBoolean2;
      mParams.mGifRoundCorner = paramFloat;
      mParams.useExifOrientation = paramBoolean3;
      mParams.mExtraInfo = paramObject2;
    }
    do
    {
      do
      {
        try
        {
          paramArrayOfHeader = new PreDownloadAsyncTask(mUrl);
          Utils.executeAsyncTaskOnNewThreadPool(sDefaultDrawableParmsmURLDrawableSubExecutor, paramArrayOfHeader, new Void[] { (Void)null });
          mTask = paramArrayOfHeader;
          return;
        }
        catch (RejectedExecutionException paramArrayOfHeader)
        {
          if (QLog.isColorLevel()) {
            QLog.e("URLDrawable_", 2, "startDownload(): execute AsyncTask failed.", paramArrayOfHeader);
          }
          mIsLoadingStarted -= 1;
          onLoadFailed(paramArrayOfHeader);
          return;
        }
        if ((mDecodeFile) || (!paramBoolean1)) {
          break;
        }
        synchronized (mDecodeFileLock)
        {
          if (mStatus == 0)
          {
            mDecodeFile = true;
            return;
          }
        }
      } while (mIsLoadingStarted != 0);
      startDownload(paramArrayOfHeader, paramCookieStore, paramObject1, paramBoolean1, paramBoolean2, paramFloat, paramBoolean3, paramObject2);
      return;
    } while ((mIsLoadingStarted <= 1) || (!QLog.isColorLevel()));
    QLog.i("URLDrawable_", 2, "startDownload mIsLoadingStarted is " + mIsLoadingStarted);
  }
  
  String wrapLog(String paramString)
  {
    paramString = new StringBuilder(paramString);
    paramString.append('\n');
    paramString.append("  |- URLState:");
    paramString.append(this);
    paramString.append('\n');
    paramString.append("  |- url:");
    paramString.append(mUrlStr);
    paramString.append('\n');
    paramString.append("  |- callbacks:");
    paramString.append(callbacks.size());
    return paramString.toString();
  }
  
  public static abstract interface Callback
  {
    public abstract void onFileDownloadFailed(int paramInt);
    
    public abstract void onFileDownloadStarted();
    
    public abstract void onFileDownloadSucceed(long paramLong);
    
    public abstract void onFileDownloaded(URLState paramURLState);
    
    public abstract void onLoadCanceled(URLState paramURLState);
    
    public abstract void onLoadFailed(URLState paramURLState, Throwable paramThrowable);
    
    public abstract void onLoadStarted(URLState paramURLState);
    
    public abstract void onLoadSuccessed(URLState paramURLState);
    
    public abstract void onUpdateProgress(int paramInt);
  }
  
  class DownloadAsyncTask
    extends AsyncTask<URL, Integer, Object>
    implements URLDrawableHandler
  {
    DownloadAsyncTask() {}
    
    public void doCancel()
    {
      throw new CancellationException();
    }
    
    protected Object doInBackground(URL... paramVarArgs)
    {
      try
      {
        if (isCancelled()) {
          return null;
        }
        paramVarArgs = loadImage(paramVarArgs[0], this);
        return paramVarArgs;
      }
      catch (Throwable paramVarArgs) {}
      return paramVarArgs;
    }
    
    protected void onCancelled()
    {
      onLoadCancelled();
    }
    
    public void onFileDownloadFailed(int paramInt)
    {
      Vector localVector = callbacks;
      int i = 0;
      for (;;)
      {
        Object localObject1;
        int j;
        try
        {
          if (i < callbacks.size())
          {
            localObject1 = (WeakReference)callbacks.get(i);
            if ((localObject1 == null) || (((WeakReference)localObject1).get() == null))
            {
              localObject1 = callbacks;
              j = i - 1;
            }
          }
        }
        finally {}
        try
        {
          ((Vector)localObject1).remove(i);
          i = j;
          i += 1;
        }
        finally
        {
          for (;;) {}
        }
        ((URLState.Callback)((WeakReference)localObject1).get()).onFileDownloadFailed(paramInt);
      }
      return;
      throw localObject2;
    }
    
    public void onFileDownloadStarted()
    {
      Vector localVector = callbacks;
      int i = 0;
      for (;;)
      {
        Object localObject1;
        int j;
        try
        {
          if (i < callbacks.size())
          {
            localObject1 = (WeakReference)callbacks.get(i);
            if ((localObject1 == null) || (((WeakReference)localObject1).get() == null))
            {
              localObject1 = callbacks;
              j = i - 1;
            }
          }
        }
        finally {}
        try
        {
          ((Vector)localObject1).remove(i);
          i = j;
          i += 1;
        }
        finally
        {
          for (;;) {}
        }
        ((URLState.Callback)((WeakReference)localObject1).get()).onFileDownloadStarted();
      }
      return;
      throw localObject2;
    }
    
    public void onFileDownloadSucceed(long paramLong)
    {
      Vector localVector = callbacks;
      int i = 0;
      for (;;)
      {
        Object localObject1;
        int j;
        try
        {
          if (i < callbacks.size())
          {
            localObject1 = (WeakReference)callbacks.get(i);
            if ((localObject1 == null) || (((WeakReference)localObject1).get() == null))
            {
              localObject1 = callbacks;
              j = i - 1;
            }
          }
        }
        finally {}
        try
        {
          ((Vector)localObject1).remove(i);
          i = j;
          i += 1;
        }
        finally
        {
          for (;;) {}
        }
        ((URLState.Callback)((WeakReference)localObject1).get()).onFileDownloadSucceed(paramLong);
      }
      return;
      throw localObject2;
    }
    
    protected void onPostExecute(Object paramObject)
    {
      if (isCancelled())
      {
        onCancelled();
        return;
      }
      onResult(paramObject);
    }
    
    protected void onProgressUpdate(Integer... paramVarArgs)
    {
      int k = paramVarArgs[(paramVarArgs.length - 1)].intValue();
      if (k == mProgress) {}
      do
      {
        return;
        mProgress = k;
      } while ((URLDrawable.sPause) && (!mIgnorePause));
      Vector localVector = callbacks;
      int i = 0;
      for (;;)
      {
        int j;
        try
        {
          if (i < callbacks.size())
          {
            paramVarArgs = (WeakReference)callbacks.get(i);
            if ((paramVarArgs == null) || (paramVarArgs.get() == null))
            {
              paramVarArgs = callbacks;
              j = i - 1;
            }
          }
        }
        finally {}
        try
        {
          paramVarArgs.remove(i);
          i = j;
          i += 1;
        }
        finally
        {
          for (;;) {}
        }
        ((URLState.Callback)paramVarArgs.get()).onUpdateProgress(k);
      }
      return;
      throw paramVarArgs;
    }
    
    public void publishProgress(int paramInt)
    {
      publishProgress(new Integer[] { Integer.valueOf(paramInt) });
    }
  }
  
  private class PostOnResult
    implements Runnable
  {
    Object result;
    
    public PostOnResult(Object paramObject)
    {
      result = paramObject;
    }
    
    public void run()
    {
      onResult(result);
    }
  }
  
  class PreDownloadAsyncTask
    extends AsyncTask<Void, Void, Integer>
  {
    private static final int DOWNLOAD_THREAD_POOL = 1;
    private static final int LOCAL_THREAD_POOL = 0;
    URLState.DownloadAsyncTask mDownloadTask;
    private URL url;
    
    PreDownloadAsyncTask(URL paramURL)
    {
      url = paramURL;
      mDownloadTask = new URLState.DownloadAsyncTask(URLState.this);
    }
    
    protected Integer doInBackground(Void... paramVarArgs)
    {
      if (QLog.isDevelopLevel()) {
        QLog.i("URLDrawable_", 4, "PreDwonloadAsyncTask doInBackground.");
      }
      if ((Build.VERSION.SDK_INT >= 11) && (mProtocolDownloader.hasDiskFile(mParams))) {
        return Integer.valueOf(0);
      }
      return Integer.valueOf(1);
    }
    
    protected void onCancelled() {}
    
    protected void onPostExecute(Integer paramInteger)
    {
      if (mDownloadTask.getStatus() == AsyncTask.Status.FINISHED) {
        return;
      }
      for (;;)
      {
        try
        {
          if (paramInteger.intValue() == 0)
          {
            Utils.executeAsyncTaskOnNewThreadPool(sDefaultDrawableParmsmURLDrawableFileExecutor, mDownloadTask, new URL[] { url });
            onLoadStart();
            if (!QLog.isDevelopLevel()) {
              break;
            }
            QLog.i("URLDrawable_", 4, "PreDwonloadAsyncTask onLoadStart.");
            return;
          }
        }
        catch (RejectedExecutionException paramInteger)
        {
          if (QLog.isColorLevel()) {
            QLog.e("URLDrawable_", 2, "onPostExecute(): execute AsyncTask failed.", paramInteger);
          }
          URLState localURLState = URLState.this;
          mIsLoadingStarted -= 1;
          onLoadFailed(paramInteger);
          return;
        }
        if (mUseThreadPool) {
          Utils.executeAsyncTaskOnNewThreadPool(sDefaultDrawableParmsmURLDrawableExecutor, mDownloadTask, new URL[] { url });
        } else {
          Utils.executeAsyncTaskOnSerialExcuter(mDownloadTask, new URL[] { url });
        }
      }
    }
  }
}
