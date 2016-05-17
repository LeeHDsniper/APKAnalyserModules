package com.tencent.image;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.Callback;
import android.graphics.drawable.Drawable.ConstantState;
import android.os.Build.VERSION;
import android.os.SystemClock;
import android.support.v4.util.LruCache;
import android.support.v4.util.MQLruCache;
import android.util.DisplayMetrics;
import android.util.Pair;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLStreamHandler;
import java.net.URLStreamHandlerFactory;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.Executor;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import org.apache.http.Header;
import org.apache.http.client.CookieStore;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.impl.cookie.BasicClientCookie;
import org.apache.http.message.BasicHeader;

public class URLDrawable
  extends Drawable
  implements Drawable.Callback, Runnable, URLState.Callback
{
  static final int ANIMATION_DURATION = 600;
  public static final int CANCLED = 3;
  private static final int CORE_POOL_SIZE = CPU_COUNT + 1;
  private static final int CPU_COUNT;
  public static boolean DEBUG = false;
  public static final int FAILED = 2;
  public static final int FILE_DOWNLOADED = 4;
  private static final int KEEP_ALIVE = 1;
  public static final int LOADING = 0;
  private static final int MAXIMUM_POOL_SIZE = CPU_COUNT * 2 + 1;
  private static final int PENDING_ACTION_CAPACITY = 100;
  public static final int SUCCESSED = 1;
  public static final String TAG = "URLDrawable_";
  static Context mApplicationContext;
  static DebuggableCallback sDebugCallback;
  static URLDrawableParams sDefaultDrawableParms;
  static MQLruCache<String, Object> sMemoryCache;
  static boolean sPause = false;
  static Object sPauseLock = new Object();
  private static final LruCache<URLDrawable, LruCache> sPendingActions = new LruCache(100);
  private static final BlockingQueue<Runnable> sPoolWorkQueue = new LinkedBlockingQueue(128);
  private static URLStreamHandlerFactory sStreamHandler = new URLStreamHandlerFactory()
  {
    URLStreamHandler handler = new URLStreamHandler()
    {
      protected URLConnection openConnection(URL paramAnonymous2URL)
        throws IOException
      {
        return null;
      }
    };
    
    public URLStreamHandler createURLStreamHandler(String paramAnonymousString)
    {
      if (("http".equalsIgnoreCase(paramAnonymousString)) || ("https".equalsIgnoreCase(paramAnonymousString)) || ("file".equalsIgnoreCase(paramAnonymousString))) {}
      while ("jar".equalsIgnoreCase(paramAnonymousString)) {
        return null;
      }
      return handler;
    }
  };
  private static final ThreadFactory sThreadFactory = new ThreadFactory()
  {
    private final AtomicInteger mCount = new AtomicInteger(1);
    
    public Thread newThread(Runnable paramAnonymousRunnable)
    {
      return new Thread(paramAnonymousRunnable, "URLDrawable #" + mCount.getAndIncrement());
    }
  };
  private int mAlpha = 255;
  private boolean mAlreadyChecked = false;
  private boolean mAutoDownload = true;
  private Exception mCallStack;
  private ColorFilter mColorFilter;
  private CookieStore mCookies;
  private Drawable mCurrDrawable;
  private DownloadListener mDownloadListener;
  protected URLState mDrawableContainerState;
  private Matrix mExifMatrix;
  private Object mExtraInfo;
  private long mFadeInAnimationStartTime = -1L;
  private boolean mFadeInAnimationStarted = false;
  boolean mFadeInImage;
  private Drawable mFailedDrawable;
  private float mGifRoundCorner;
  private Header[] mHeaders;
  private URLDrawableListener mListener;
  private int mProgress = 0;
  private Drawable mProgressDrawable;
  private Object mTag;
  private int mTargetDensity = 160;
  private boolean mUseExifOrientation = true;
  private boolean mUseGifAnimation;
  
  static
  {
    CPU_COUNT = Runtime.getRuntime().availableProcessors();
  }
  
  URLDrawable(URLState paramURLState, Resources paramResources)
  {
    mDrawableContainerState = paramURLState;
    if (mStatus == 1)
    {
      mCurrDrawable = mDrawableContainerState.mSuccessed.newDrawable(paramResources);
      mCurrDrawable.setCallback(this);
      return;
    }
    mDrawableContainerState.addCallBack(this);
  }
  
  private URLDrawable(URL paramURL, URLDrawableOptions paramURLDrawableOptions)
  {
    mDrawableContainerState = new URLState(paramURL, paramURLDrawableOptions);
    mFailedDrawable = mFailedDrawable;
    mCurrDrawable = mLoadingDrawable;
    if ((mCurrDrawable == null) && (sDefaultDrawableParms.getDefaultLoadingDrawable() != null)) {
      mCurrDrawable = sDefaultDrawableParms.getDefaultLoadingDrawable();
    }
    mDrawableContainerState.addCallBack(this);
  }
  
  private static URLDrawable autoScale(Resources paramResources, URLDrawable paramURLDrawable)
  {
    if (sDefaultDrawableParmsmAutoScaleByDensity)
    {
      if (paramResources != null) {
        paramURLDrawable.setTargetDensity(getDisplayMetricsdensityDpi);
      }
    }
    else {
      return paramURLDrawable;
    }
    paramURLDrawable.setTargetDensity(sDefaultDrawableParmsmDeviceDensity);
    return paramURLDrawable;
  }
  
  private void checkBitmapSize()
  {
    if ((sDebugCallback == null) || ((!DEBUG) && (!sDebugCallback.isNeedSample()))) {}
    int i;
    int j;
    int k;
    int m;
    do
    {
      do
      {
        do
        {
          return;
        } while ((mAlreadyChecked) || (!RegionDrawable.class.isInstance(mCurrDrawable)));
        mAlreadyChecked = true;
        localObject1 = getCallback();
      } while (!ImageView.class.isInstance(localObject1));
      localObject2 = (ImageView)localObject1;
      i = ((ImageView)localObject2).getMeasuredWidth();
      j = ((ImageView)localObject2).getMeasuredHeight();
      localObject1 = (RegionDrawable)mCurrDrawable;
      k = ((RegionDrawable)localObject1).getBitmap().getWidth();
      m = ((RegionDrawable)localObject1).getBitmap().getHeight();
    } while (!isBitmapOversize(k, m, i, j));
    String str2 = "(" + i + "," + j + ")";
    String str3 = "(" + k + "," + m + ")";
    String str1 = "";
    Object localObject1 = str1;
    if (((ImageView)localObject2).getContext() != null)
    {
      localObject1 = str1;
      if ((((ImageView)localObject2).getContext() instanceof Activity)) {
        localObject1 = ((ImageView)localObject2).getContext().getClass().getName();
      }
    }
    str1 = getURL().toString();
    Object localObject2 = mCallStack;
    sDebugCallback.onDebug(1, new Object[] { str2, str3, str1, localObject1, localObject2 });
  }
  
  private static void checkParams()
  {
    if (sDefaultDrawableParms == null) {
      throw new IllegalStateException("Default params is not seted, please call setURLDrawableParams first");
    }
  }
  
  public static void clearMemoryCache()
  {
    sMemoryCache.evictAll();
  }
  
  public static URLDrawable getDrawable(File paramFile, URLDrawableOptions paramURLDrawableOptions)
  {
    try
    {
      paramFile = paramFile.toURL();
      if (paramFile == null) {
        break label17;
      }
      return getDrawable(paramFile, paramURLDrawableOptions);
    }
    catch (MalformedURLException paramFile)
    {
      label17:
      do
      {
        paramFile = paramFile;
      } while (0 == 0);
      return getDrawable(null, paramURLDrawableOptions);
    }
    finally
    {
      do
      {
        paramFile = finally;
      } while (0 == 0);
    }
    throw paramFile;
    return null;
    return getDrawable(null, paramURLDrawableOptions);
  }
  
  @Deprecated
  public static URLDrawable getDrawable(String paramString)
    throws IllegalArgumentException
  {
    return getDrawable(paramString, null, null);
  }
  
  @Deprecated
  public static URLDrawable getDrawable(String paramString, int paramInt1, int paramInt2)
    throws IllegalArgumentException
  {
    return getDrawable(paramString, paramInt1, paramInt2, null, null);
  }
  
  @Deprecated
  public static URLDrawable getDrawable(String paramString, int paramInt1, int paramInt2, Drawable paramDrawable1, Drawable paramDrawable2)
    throws IllegalArgumentException
  {
    return getDrawable(paramString, paramInt1, paramInt2, paramDrawable1, paramDrawable2, false);
  }
  
  @Deprecated
  public static URLDrawable getDrawable(String paramString, int paramInt1, int paramInt2, Drawable paramDrawable1, Drawable paramDrawable2, boolean paramBoolean)
    throws IllegalArgumentException
  {
    try
    {
      paramDrawable1 = getDrawable(new URL(paramString), paramInt1, paramInt2, paramDrawable1, paramDrawable2, paramBoolean, 0.0F);
      return paramDrawable1;
    }
    catch (MalformedURLException paramDrawable1)
    {
      throw new IllegalArgumentException("illegal url format: " + paramString);
    }
  }
  
  @Deprecated
  public static URLDrawable getDrawable(String paramString, int paramInt1, int paramInt2, boolean paramBoolean)
    throws IllegalArgumentException
  {
    return getDrawable(paramString, paramInt1, paramInt2, null, null, paramBoolean);
  }
  
  @Deprecated
  public static URLDrawable getDrawable(String paramString, Drawable paramDrawable1, Drawable paramDrawable2)
    throws IllegalArgumentException
  {
    return getDrawable(paramString, 0, 0, paramDrawable1, paramDrawable2);
  }
  
  @Deprecated
  public static URLDrawable getDrawable(String paramString, Drawable paramDrawable1, Drawable paramDrawable2, boolean paramBoolean)
    throws IllegalArgumentException
  {
    return getDrawable(paramString, 0, 0, paramDrawable1, paramDrawable2, paramBoolean);
  }
  
  public static URLDrawable getDrawable(String paramString, URLDrawableOptions paramURLDrawableOptions)
  {
    try
    {
      paramURLDrawableOptions = getDrawable(new URL(paramString), paramURLDrawableOptions);
      return paramURLDrawableOptions;
    }
    catch (MalformedURLException paramURLDrawableOptions)
    {
      throw new IllegalArgumentException("illegal url format: " + paramString);
    }
  }
  
  @Deprecated
  public static URLDrawable getDrawable(String paramString, boolean paramBoolean)
    throws IllegalArgumentException
  {
    return getDrawable(paramString, null, null, paramBoolean);
  }
  
  @Deprecated
  public static URLDrawable getDrawable(URL paramURL)
  {
    return getDrawable(paramURL, null, null);
  }
  
  @Deprecated
  public static URLDrawable getDrawable(URL paramURL, int paramInt1, int paramInt2)
  {
    return getDrawable(paramURL, paramInt1, paramInt2, null, null);
  }
  
  @Deprecated
  public static URLDrawable getDrawable(URL paramURL, int paramInt1, int paramInt2, Drawable paramDrawable1, Drawable paramDrawable2)
  {
    return getDrawable(paramURL, paramInt1, paramInt2, paramDrawable1, paramDrawable2, false, 0.0F);
  }
  
  @Deprecated
  public static URLDrawable getDrawable(URL paramURL, int paramInt1, int paramInt2, Drawable paramDrawable1, Drawable paramDrawable2, boolean paramBoolean)
  {
    return getDrawable(paramURL, paramInt1, paramInt2, paramDrawable1, paramDrawable2, paramBoolean, 0.0F);
  }
  
  @Deprecated
  public static URLDrawable getDrawable(URL paramURL, int paramInt1, int paramInt2, Drawable paramDrawable1, Drawable paramDrawable2, boolean paramBoolean, float paramFloat)
  {
    URLDrawableOptions localURLDrawableOptions = URLDrawableOptions.obtain();
    mRequestWidth = paramInt1;
    mRequestHeight = paramInt2;
    mLoadingDrawable = paramDrawable1;
    mFailedDrawable = paramDrawable2;
    mPlayGifImage = paramBoolean;
    mGifRoundCorner = paramFloat;
    return getDrawable(paramURL, localURLDrawableOptions);
  }
  
  @Deprecated
  public static URLDrawable getDrawable(URL paramURL, int paramInt1, int paramInt2, boolean paramBoolean)
  {
    return getDrawable(paramURL, paramInt1, paramInt2, null, null, paramBoolean, 0.0F);
  }
  
  @Deprecated
  public static URLDrawable getDrawable(URL paramURL, Drawable paramDrawable1, Drawable paramDrawable2)
  {
    return getDrawable(paramURL, 0, 0, paramDrawable1, paramDrawable2);
  }
  
  @Deprecated
  public static URLDrawable getDrawable(URL paramURL, Drawable paramDrawable1, Drawable paramDrawable2, boolean paramBoolean)
  {
    return getDrawable(paramURL, 0, 0, paramDrawable1, paramDrawable2, paramBoolean, 0.0F);
  }
  
  public static URLDrawable getDrawable(URL paramURL, URLDrawableOptions paramURLDrawableOptions)
  {
    URLDrawableOptions localURLDrawableOptions;
    int i;
    for (;;)
    {
      try
      {
        checkParams();
        localURLDrawableOptions = paramURLDrawableOptions;
        if (paramURLDrawableOptions == null) {
          localURLDrawableOptions = URLDrawableOptions.obtain();
        }
        localObject = URLState.getConstants(paramURL.toString());
        if (localObject == null) {
          break label364;
        }
        paramURL = (URLDrawable)((URLState)localObject).newDrawable(null);
        if (mParams.mAutoScaleByDensity)
        {
          paramURL = autoScale(null, paramURL);
          mUseExifOrientation = mUseExifOrientation;
          mExtraInfo = mExtraInfo;
          i = paramURL.getStatus();
          if (i != 1) {
            break;
          }
          if ((mCurrDrawable instanceof GifDrawable))
          {
            mCurrDrawable).mUseAnimation = mPlayGifImage;
            mCallStack = new IllegalStateException("UrlDrawable getStack");
            localURLDrawableOptions.Recycle();
            return paramURL;
          }
        }
        else
        {
          continue;
        }
        if ((mCurrDrawable instanceof ApngDrawable))
        {
          mCurrDrawable).mUseAnimation = mPlayGifImage;
          continue;
        }
        if (!(mCurrDrawable instanceof VideoDrawable)) {
          continue;
        }
      }
      finally {}
      if ((mExtraInfo != null) && ((mExtraInfo instanceof VideoDrawable.VideoDrawableParams))) {
        mCurrDrawable).mPlayVideoFrame = mExtraInfo).mPlayVideoFrame;
      }
    }
    mUseGifAnimation = mPlayGifImage;
    mGifRoundCorner = mGifRoundCorner;
    mFadeInImage = sDefaultDrawableParmsmFadeInImage;
    if (i == 2)
    {
      paramURLDrawableOptions = sDefaultDrawableParms.getDefualtFailedDrawable();
      if ((mFailedDrawable == null) && (paramURLDrawableOptions != null)) {}
      for (;;)
      {
        mFailedDrawable = paramURLDrawableOptions;
        mCurrDrawable = mFailedDrawable;
        break;
        paramURLDrawableOptions = mFailedDrawable;
      }
    }
    mFailedDrawable = mFailedDrawable;
    paramURLDrawableOptions = sDefaultDrawableParms.getDefaultLoadingDrawable();
    if ((mLoadingDrawable == null) && (paramURLDrawableOptions != null)) {}
    for (;;)
    {
      mProgressDrawable = paramURLDrawableOptions;
      mCurrDrawable = mProgressDrawable;
      if (i != 4) {
        break;
      }
      paramURLDrawableOptions = mParams;
      if ((mRequestWidth == 0) || (mRequestHeight == 0)) {
        break;
      }
      break;
      paramURLDrawableOptions = mLoadingDrawable;
    }
    label364:
    paramURLDrawableOptions = new URLDrawable(paramURL, localURLDrawableOptions);
    mUseGifAnimation = mPlayGifImage;
    mGifRoundCorner = mGifRoundCorner;
    mFadeInImage = sDefaultDrawableParmsmFadeInImage;
    mUseExifOrientation = mUseExifOrientation;
    mExtraInfo = mExtraInfo;
    Object localObject = mDrawableContainerState.mParams;
    url = paramURL;
    urlStr = paramURL.toString();
    if (mUseAutoScaleParams) {
      mAutoScaleByDensity = sDefaultDrawableParmsmAutoScaleByDensity;
    }
    if ((mRequestWidth == 0) || (mRequestHeight == 0))
    {
      reqWidth = sDefaultDrawableParmsmReqWidth;
      reqHeight = sDefaultDrawableParmsmReqHeight;
      label494:
      mImgType = mImgType;
      if (!mUseAutoScaleParams) {
        break label558;
      }
    }
    label558:
    for (paramURL = autoScale(null, paramURLDrawableOptions);; paramURL = paramURLDrawableOptions)
    {
      mCallStack = new IllegalStateException("UrlDrawable getStack");
      localURLDrawableOptions.Recycle();
      break;
      reqWidth = mRequestWidth;
      reqHeight = mRequestHeight;
      break label494;
    }
  }
  
  @Deprecated
  public static URLDrawable getDrawable(URL paramURL, boolean paramBoolean)
  {
    return getDrawable(paramURL, null, null, paramBoolean);
  }
  
  public static int getPoolSize()
  {
    return URLDrawableOptions.sPoolSize;
  }
  
  public static void init(Context paramContext, URLDrawableParams paramURLDrawableParams)
  {
    URL.setURLStreamHandlerFactory(sStreamHandler);
    if (sDefaultDrawableParms != null) {
      throw new IllegalArgumentException("please don't call setURLDrawableParams twice");
    }
    if (mURLDrawableExecutor == null) {
      mURLDrawableExecutor = new ThreadPoolExecutor(CORE_POOL_SIZE, MAXIMUM_POOL_SIZE, 1L, TimeUnit.SECONDS, sPoolWorkQueue, sThreadFactory);
    }
    if (mURLDrawableFileExecutor == null) {
      mURLDrawableFileExecutor = new ThreadPoolExecutor(1, 1, 1L, TimeUnit.SECONDS, new LinkedBlockingQueue(128));
    }
    if (mURLDrawableSubExecutor == null) {
      mURLDrawableSubExecutor = new ThreadPoolExecutor(1, 1, 1L, TimeUnit.SECONDS, new LinkedBlockingQueue(128));
    }
    sDefaultDrawableParms = paramURLDrawableParams;
    if (mMemoryCache == null) {}
    for (sMemoryCache = new MQLruCache(mMemoryCacheSize)
        {
          protected int sizeOfObj(String paramAnonymousString, Object paramAnonymousObject)
          {
            if (paramAnonymousObject != null)
            {
              if ((paramAnonymousObject instanceof Pair)) {
                return ((Integer)second).intValue();
              }
              if ((paramAnonymousObject instanceof Bitmap))
              {
                paramAnonymousString = (Bitmap)paramAnonymousObject;
                return paramAnonymousString.getRowBytes() * paramAnonymousString.getHeight();
              }
            }
            return 12;
          }
        };; sMemoryCache = mMemoryCache)
    {
      mApplicationContext = paramContext;
      mURLDrawableSubExecutor.execute(new Runnable()
      {
        public void run() {}
      });
      return;
    }
  }
  
  private boolean isBitmapOversize(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if ((paramInt3 == 0) || (paramInt4 == 0) || (paramInt3 == -1) || (paramInt4 == -1)) {}
    for (;;)
    {
      return false;
      if ((paramInt2 > paramInt4) && (paramInt1 > paramInt3))
      {
        paramInt2 = Math.round(paramInt2 / paramInt4);
        paramInt1 = Math.round(paramInt1 / paramInt3);
        if (paramInt2 > paramInt1) {
          paramInt1 = paramInt2;
        }
        while (paramInt1 >= 2) {
          return true;
        }
      }
    }
  }
  
  public static void pause()
  {
    synchronized (sPauseLock)
    {
      sPause = true;
      return;
    }
  }
  
  public static void removeMemoryCacheByUrl(String paramString)
  {
    sMemoryCache.remove(paramString);
  }
  
  public static void resume()
  {
    synchronized (sPauseLock)
    {
      sPause = false;
      sPauseLock.notifyAll();
      Iterator localIterator = sPendingActions.snapshot().keySet().iterator();
      if (localIterator.hasNext())
      {
        URLDrawable localURLDrawable = (URLDrawable)localIterator.next();
        localURLDrawable.scheduleSelf(localURLDrawable, SystemClock.uptimeMillis() + 1L);
        sPendingActions.remove(localURLDrawable);
      }
    }
  }
  
  public static void setDebuggableCallback(DebuggableCallback paramDebuggableCallback)
  {
    if ((DEBUG) && (sDebugCallback != null)) {
      throw new IllegalArgumentException("please don't call setDebuggableCallback twice");
    }
    sDebugCallback = paramDebuggableCallback;
  }
  
  public void addCookies(String paramString1, String paramString2)
  {
    if (mCookies == null) {
      mCookies = new BasicCookieStore();
    }
    mCookies.addCookie(new BasicClientCookie(paramString1, paramString2));
  }
  
  public void addHeader(String paramString1, String paramString2)
  {
    if ((mHeaders == null) || (mHeaders.length == 0))
    {
      mHeaders = new Header[] { new BasicHeader(paramString1, paramString2) };
      return;
    }
    Header[] arrayOfHeader = new Header[mHeaders.length + 1];
    System.arraycopy(mHeaders, 0, arrayOfHeader, 0, mHeaders.length);
    arrayOfHeader[mHeaders.length] = new BasicHeader(paramString1, paramString2);
    mHeaders = arrayOfHeader;
  }
  
  public void cancelDownload()
  {
    cancelDownload(false);
  }
  
  public void cancelDownload(boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.i("URLDrawable_", 2, "[cancelDownload]");
    }
    if (mDrawableContainerState.mTask != null) {
      mDrawableContainerState.mTask.mDownloadTask.cancel(paramBoolean);
    }
    while (!QLog.isColorLevel()) {
      return;
    }
    QLog.i("URLDrawable_", 2, "[cancelDownload]task is null, cancel failed...");
  }
  
  public void downloadImediatly()
  {
    mDrawableContainerState.downloadImediatly(mHeaders, mCookies, mTag, true, mUseGifAnimation, mGifRoundCorner);
  }
  
  public void downloadImediatly(boolean paramBoolean)
  {
    mDrawableContainerState.downloadImediatly(mHeaders, mCookies, mTag, paramBoolean, mUseGifAnimation, mGifRoundCorner);
  }
  
  public void draw(Canvas paramCanvas)
  {
    int i;
    if (mCurrDrawable != null)
    {
      if (Build.VERSION.SDK_INT >= 11) {
        checkBitmapSize();
      }
      i = paramCanvas.save();
      if ((mFadeInImage) && (mFadeInAnimationStarted))
      {
        long l = AnimationUtils.currentAnimationTimeMillis();
        if (mFadeInAnimationStartTime == -1L) {
          mFadeInAnimationStartTime = l;
        }
        float f = (float)(l - mFadeInAnimationStartTime) / 600.0F;
        if ((f < 0.0F) || (f > 1.0F)) {
          break label239;
        }
        int j = Math.min((int)(255.0F * (1.0F - (1.0F - f) * (1.0F - f))), 255);
        Rect localRect = getBounds();
        paramCanvas.saveLayerAlpha(left, top, localRect.width(), localRect.height(), j, 20);
        invalidateSelf();
      }
    }
    for (;;)
    {
      if (mExifMatrix != null) {
        paramCanvas.concat(mExifMatrix);
      }
      mCurrDrawable.draw(paramCanvas);
      if ((getStatus() == 0) && (mProgressDrawable != null) && (mDrawableContainerState.mIsLoadingStarted == 1)) {
        mProgressDrawable.draw(paramCanvas);
      }
      paramCanvas.restoreToCount(i);
      if (mAutoDownload)
      {
        if ((sPause) && (!mDrawableContainerState.mIgnorePause)) {
          break;
        }
        startDownload();
      }
      return;
      label239:
      mFadeInAnimationStarted = false;
    }
    if (QLog.isDevelopLevel()) {
      QLog.d("URLDrawable_", 4, "addToPending:" + getURL());
    }
    sPendingActions.put(this, sPendingActions);
  }
  
  public Drawable.ConstantState getConstantState()
  {
    return mDrawableContainerState;
  }
  
  public Drawable getCurrDrawable()
  {
    return mCurrDrawable;
  }
  
  public int getExifOrientation()
  {
    if ((mDrawableContainerState.mStatus == 1) && (mCurrDrawable != null)) {
      return mDrawableContainerState.mOrientation;
    }
    return 0;
  }
  
  public Header getHeader(String paramString)
  {
    if (mHeaders != null)
    {
      Header[] arrayOfHeader = mHeaders;
      int j = arrayOfHeader.length;
      int i = 0;
      while (i < j)
      {
        Header localHeader = arrayOfHeader[i];
        if ((paramString != null) && (paramString.equals(localHeader.getName()))) {
          return localHeader;
        }
        i += 1;
      }
    }
    return null;
  }
  
  public Header[] getHeaders()
  {
    return mHeaders;
  }
  
  public int getIntrinsicHeight()
  {
    if ((mUseExifOrientation) && (mDrawableContainerState.mStatus == 1) && (mCurrDrawable != null))
    {
      switch (mDrawableContainerState.mOrientation)
      {
      default: 
        if (mDrawableContainerState.mHeight > 0) {
          return mDrawableContainerState.mHeight;
        }
        break;
      case 5: 
      case 6: 
      case 7: 
      case 8: 
        if (mDrawableContainerState.mWidth > 0) {
          return mDrawableContainerState.mWidth;
        }
        return mCurrDrawable.getIntrinsicWidth();
      }
      return mCurrDrawable.getIntrinsicHeight();
    }
    if (mDrawableContainerState.mHeight > 0) {
      return mDrawableContainerState.mHeight;
    }
    if (mCurrDrawable != null) {
      return mCurrDrawable.getIntrinsicHeight();
    }
    return -1;
  }
  
  public int getIntrinsicWidth()
  {
    if ((mUseExifOrientation) && (mDrawableContainerState.mStatus == 1) && (mCurrDrawable != null))
    {
      switch (mDrawableContainerState.mOrientation)
      {
      default: 
        if (mDrawableContainerState.mWidth > 0) {
          return mDrawableContainerState.mWidth;
        }
        break;
      case 5: 
      case 6: 
      case 7: 
      case 8: 
        if (mDrawableContainerState.mHeight > 0) {
          return mDrawableContainerState.mHeight;
        }
        return mCurrDrawable.getIntrinsicHeight();
      }
      return mCurrDrawable.getIntrinsicWidth();
    }
    if (mDrawableContainerState.mWidth > 0) {
      return mDrawableContainerState.mWidth;
    }
    if (mCurrDrawable != null) {
      return mCurrDrawable.getIntrinsicWidth();
    }
    return -1;
  }
  
  public int getOpacity()
  {
    return -2;
  }
  
  public boolean getPadding(Rect paramRect)
  {
    if (mCurrDrawable != null) {
      return mCurrDrawable.getPadding(paramRect);
    }
    return super.getPadding(paramRect);
  }
  
  public int getProgress()
  {
    return mProgress;
  }
  
  public int getStatus()
  {
    return mDrawableContainerState.mStatus;
  }
  
  public Object getTag()
  {
    return mTag;
  }
  
  public URL getURL()
  {
    return mDrawableContainerState.mUrl;
  }
  
  public void invalidateDrawable(Drawable paramDrawable)
  {
    invalidateSelf();
  }
  
  public boolean isAnim()
  {
    return ((mCurrDrawable instanceof GifDrawable)) || ((mCurrDrawable instanceof ApngDrawable));
  }
  
  public boolean isDownloadStarted()
  {
    return mDrawableContainerState.mIsLoadingStarted == 1;
  }
  
  public boolean isFakeSize()
  {
    return (mDrawableContainerState.mWidth != 0) && (mDrawableContainerState.mHeight != 0);
  }
  
  protected void onBoundsChange(Rect paramRect)
  {
    int j;
    float f1;
    int k;
    float f2;
    Rect localRect;
    Matrix localMatrix;
    if ((mUseExifOrientation) && (mDrawableContainerState.mStatus == 1) && (mCurrDrawable != null) && (mDrawableContainerState.mOrientation != 0) && (mDrawableContainerState.mOrientation != 1))
    {
      j = paramRect.width();
      f1 = j / 2.0F;
      k = paramRect.height();
      f2 = k / 2.0F;
      localRect = new Rect();
      localMatrix = new Matrix();
      switch (mDrawableContainerState.mOrientation)
      {
      default: 
        localMatrix = null;
        localRect = paramRect;
        mExifMatrix = localMatrix;
        mCurrDrawable.setBounds(localRect);
      }
    }
    for (;;)
    {
      if (mProgressDrawable != null) {
        mProgressDrawable.setBounds(paramRect);
      }
      return;
      localRect.set(0, 0, j, k);
      localMatrix.setTranslate(-f1, -f2);
      localMatrix.postScale(-1.0F, 1.0F);
      localMatrix.postTranslate(left + f1, top + f2);
      break;
      localRect.set(0, 0, j, k);
      localMatrix.setTranslate(-f1, -f2);
      localMatrix.postScale(1.0F, -1.0F);
      localMatrix.postTranslate(left + f1, top + f2);
      break;
      if (mDrawableContainerState.mOrientation == 5) {}
      for (int i = 90;; i = 270)
      {
        localRect.set(0, 0, j, k);
        localMatrix.setTranslate(-f1, -f2);
        localMatrix.postScale(1.0F, -1.0F);
        localMatrix.postRotate(i);
        localMatrix.postTranslate(left + f1, top + f2);
        break;
      }
      if (mDrawableContainerState.mOrientation == 6) {}
      for (i = 90;; i = 270)
      {
        localRect.set(0, 0, k, j);
        localMatrix.setTranslate(-f2, -f1);
        localMatrix.postRotate(i);
        localMatrix.postTranslate(left + f1, top + f2);
        break;
      }
      localRect.set(0, 0, j, k);
      localMatrix.setTranslate(-f1, -f2);
      localMatrix.postRotate(180.0F);
      localMatrix.postTranslate(left + f1, top + f2);
      break;
      if (mCurrDrawable != null) {
        mCurrDrawable.setBounds(paramRect);
      }
    }
  }
  
  public void onFileDownloadFailed(int paramInt)
  {
    if (mDownloadListener != null) {
      mDownloadListener.onFileDownloadFailed(paramInt);
    }
  }
  
  public void onFileDownloadStarted()
  {
    if (mDownloadListener != null) {
      mDownloadListener.onFileDownloadStarted();
    }
  }
  
  public void onFileDownloadSucceed(long paramLong)
  {
    if (mDownloadListener != null) {
      mDownloadListener.onFileDownloadSucceed(paramLong);
    }
  }
  
  public void onFileDownloaded(URLState paramURLState)
  {
    if ((getStatus() == 4) && (mListener != null) && ((mListener instanceof URLDrawableListener2))) {
      ((URLDrawableListener2)mListener).onFileDownloaded(this);
    }
  }
  
  protected boolean onLevelChange(int paramInt)
  {
    if (mCurrDrawable != null) {
      return mCurrDrawable.setLevel(paramInt);
    }
    return false;
  }
  
  public void onLoadCanceled(URLState paramURLState)
  {
    if (mListener != null) {
      mListener.onLoadCanceled(this);
    }
    invalidateSelf();
  }
  
  public void onLoadFailed(URLState paramURLState, Throwable paramThrowable)
  {
    paramURLState = mCurrDrawable;
    if (mFailedDrawable == null) {
      mFailedDrawable = sDefaultDrawableParms.getDefualtFailedDrawable();
    }
    mCurrDrawable = mFailedDrawable;
    if (mCurrDrawable != null)
    {
      mCurrDrawable.setAlpha(mAlpha);
      mCurrDrawable.setVisible(isVisible(), true);
      mCurrDrawable.setDither(mDrawableContainerState.mDither);
      mCurrDrawable.setColorFilter(mColorFilter);
      mCurrDrawable.setState(getState());
      mCurrDrawable.setLevel(getLevel());
      mCurrDrawable.setCallback(this);
      mCurrDrawable.setBounds(getBounds());
    }
    if (paramURLState != null) {
      paramURLState.setCallback(null);
    }
    mDrawableContainerState.mCacheFile = null;
    if (mListener != null) {
      mListener.onLoadFialed(this, paramThrowable);
    }
    if (mFadeInImage) {
      mFadeInAnimationStarted = true;
    }
    invalidateSelf();
  }
  
  public void onLoadStarted(URLState paramURLState)
  {
    invalidateSelf();
  }
  
  public void onLoadSuccessed(URLState paramURLState)
  {
    Drawable localDrawable = mCurrDrawable;
    paramURLState = mSuccessed.newDrawable();
    paramURLState.setAlpha(mAlpha);
    paramURLState.setVisible(isVisible(), true);
    paramURLState.setColorFilter(mColorFilter);
    paramURLState.setState(getState());
    paramURLState.setLevel(getLevel());
    paramURLState.setCallback(this);
    paramURLState.setBounds(getBounds());
    if (Build.VERSION.SDK_INT >= 23) {
      mCurrDrawable = paramURLState;
    }
    if ((paramURLState instanceof RegionDrawable)) {
      ((RegionDrawable)paramURLState).setTargetDensity(mTargetDensity);
    }
    for (;;)
    {
      mCurrDrawable = paramURLState;
      if (localDrawable != null) {
        localDrawable.setCallback(null);
      }
      if (mListener != null) {
        mListener.onLoadSuccessed(this);
      }
      if (mFadeInImage) {
        mFadeInAnimationStarted = true;
      }
      if (mProgressDrawable != null)
      {
        mProgressDrawable.setCallback(null);
        mProgressDrawable = null;
      }
      invalidateSelf();
      return;
      if ((paramURLState instanceof SliceBitmapDrawable))
      {
        ((SliceBitmapDrawable)paramURLState).setTargetDensity(mTargetDensity);
      }
      else if ((paramURLState instanceof GifDrawable))
      {
        ((GifDrawable)paramURLState).setTargetDensity(mTargetDensity);
        mUseAnimation = mUseGifAnimation;
      }
      else if ((paramURLState instanceof ApngDrawable))
      {
        ((ApngDrawable)paramURLState).setTargetDensity(mTargetDensity);
        mUseAnimation = mUseGifAnimation;
      }
      else if ((paramURLState instanceof RoundRectDrawable))
      {
        ((RoundRectDrawable)paramURLState).setTargetDensity(mTargetDensity);
      }
      else if ((paramURLState instanceof VideoDrawable))
      {
        VideoDrawable localVideoDrawable = (VideoDrawable)paramURLState;
        localVideoDrawable.setTargetDensity(mTargetDensity);
        if ((mExtraInfo != null) && ((mExtraInfo instanceof VideoDrawable.VideoDrawableParams))) {
          mPlayVideoFrame = mExtraInfo).mPlayVideoFrame;
        }
      }
    }
  }
  
  protected boolean onStateChange(int[] paramArrayOfInt)
  {
    if (mCurrDrawable != null) {
      mCurrDrawable.setState(paramArrayOfInt);
    }
    return true;
  }
  
  public void onUpdateProgress(int paramInt)
  {
    if (mProgressDrawable != null)
    {
      mProgressDrawable.setLevel(paramInt);
      invalidateSelf();
    }
    if (mListener != null) {
      mListener.onLoadProgressed(this, paramInt);
    }
  }
  
  public void restartDownload()
  {
    if (mDrawableContainerState.reStartDownload(mHeaders, mCookies, mTag, true, mUseGifAnimation, mGifRoundCorner, mUseExifOrientation, mExtraInfo)) {
      invalidateSelf();
    }
  }
  
  public void run()
  {
    startDownload();
  }
  
  public String saveTo(String paramString)
    throws IOException
  {
    return mDrawableContainerState.saveTo(paramString);
  }
  
  public void scheduleDrawable(Drawable paramDrawable, Runnable paramRunnable, long paramLong)
  {
    scheduleSelf(paramRunnable, paramLong);
  }
  
  public void setAlpha(int paramInt) {}
  
  public void setAutoDownload(boolean paramBoolean)
  {
    mAutoDownload = paramBoolean;
    if (paramBoolean) {
      invalidateSelf();
    }
  }
  
  public void setColorFilter(ColorFilter paramColorFilter)
  {
    if (mColorFilter != paramColorFilter)
    {
      mColorFilter = paramColorFilter;
      if (mCurrDrawable != null) {
        mCurrDrawable.setColorFilter(paramColorFilter);
      }
    }
  }
  
  public void setCookies(CookieStore paramCookieStore)
  {
    mCookies = paramCookieStore;
  }
  
  public void setDecodeHandler(DownloadParams.DecodeHandler paramDecodeHandler)
  {
    mDrawableContainerState.mParams.mDecodeHandler = paramDecodeHandler;
  }
  
  public void setDither(boolean paramBoolean)
  {
    if (mDrawableContainerState.mDither != paramBoolean)
    {
      mDrawableContainerState.mDither = paramBoolean;
      if (mCurrDrawable != null) {
        mCurrDrawable.setDither(mDrawableContainerState.mDither);
      }
    }
  }
  
  public void setDownloadListener(DownloadListener paramDownloadListener)
  {
    mDownloadListener = paramDownloadListener;
  }
  
  public void setFadeInImage(boolean paramBoolean)
  {
    mFadeInImage = paramBoolean;
  }
  
  public void setHeaders(Header... paramVarArgs)
  {
    mHeaders = paramVarArgs;
  }
  
  public void setIgnorePause(boolean paramBoolean)
  {
    mDrawableContainerState.mIgnorePause = paramBoolean;
  }
  
  public void setProgressDrawable(Drawable paramDrawable)
  {
    if (mProgressDrawable != paramDrawable)
    {
      if (mProgressDrawable != null) {
        mProgressDrawable.setCallback(null);
      }
      mProgressDrawable = paramDrawable;
      if (mProgressDrawable != null)
      {
        mProgressDrawable.setCallback(this);
        mProgressDrawable.setBounds(getBounds());
        mProgressDrawable.setLevel(mProgress);
      }
      onUpdateProgress(mDrawableContainerState.mProgress);
    }
  }
  
  public void setTag(Object paramObject)
  {
    mTag = paramObject;
  }
  
  public void setTargetDensity(int paramInt)
  {
    int i;
    if (paramInt != mTargetDensity)
    {
      if (paramInt != 0) {
        break label51;
      }
      i = 160;
      mTargetDensity = i;
      if (getStatus() == 1)
      {
        if (!(mCurrDrawable instanceof RegionDrawable)) {
          break label56;
        }
        ((RegionDrawable)mCurrDrawable).setTargetDensity(paramInt);
      }
    }
    label51:
    label56:
    do
    {
      return;
      i = paramInt;
      break;
      if ((mCurrDrawable instanceof SliceBitmapDrawable))
      {
        ((SliceBitmapDrawable)mCurrDrawable).setTargetDensity(mTargetDensity);
        return;
      }
      if ((mCurrDrawable instanceof GifDrawable))
      {
        ((GifDrawable)mCurrDrawable).setTargetDensity(paramInt);
        return;
      }
      if ((mCurrDrawable instanceof ApngDrawable))
      {
        ((ApngDrawable)mCurrDrawable).setTargetDensity(paramInt);
        return;
      }
      if ((mCurrDrawable instanceof RoundRectDrawable))
      {
        ((RoundRectDrawable)mCurrDrawable).setTargetDensity(paramInt);
        return;
      }
    } while (!(mCurrDrawable instanceof VideoDrawable));
    ((VideoDrawable)mCurrDrawable).setTargetDensity(paramInt);
  }
  
  public void setURLDrawableListener(URLDrawableListener paramURLDrawableListener)
  {
    mListener = paramURLDrawableListener;
  }
  
  public boolean setVisible(boolean paramBoolean1, boolean paramBoolean2)
  {
    boolean bool = super.setVisible(paramBoolean1, paramBoolean2);
    if (mCurrDrawable != null) {
      mCurrDrawable.setVisible(paramBoolean1, paramBoolean2);
    }
    return bool;
  }
  
  public void startDownload()
  {
    startDownload(true);
  }
  
  public void startDownload(boolean paramBoolean)
  {
    mDrawableContainerState.startDownload(mHeaders, mCookies, mTag, paramBoolean, mUseGifAnimation, mGifRoundCorner, mUseExifOrientation, mExtraInfo);
  }
  
  public void unscheduleDrawable(Drawable paramDrawable, Runnable paramRunnable)
  {
    unscheduleSelf(paramRunnable);
  }
  
  public void updateRegionBitmap(RegionDrawableData paramRegionDrawableData)
  {
    if (!RegionDrawable.class.isInstance(mCurrDrawable)) {
      return;
    }
    Matrix localMatrix1 = mExifMatrix;
    if ((localMatrix1 != null) && (!localMatrix1.isIdentity()))
    {
      RectF localRectF = new RectF(mShowArea);
      Matrix localMatrix2 = new Matrix();
      localMatrix1.invert(localMatrix2);
      localMatrix2.mapRect(localRectF);
      localRectF.round(mShowArea);
      localRectF.set(mImageArea);
      localMatrix2.mapRect(localRectF);
      localRectF.round(mImageArea);
    }
    ((RegionDrawable)mCurrDrawable).updateRegionRect(paramRegionDrawableData);
  }
  
  public static abstract interface DebuggableCallback
  {
    public static final int TYPE_CALLBACK_OVERSIZE = 1;
    
    public abstract boolean isNeedSample();
    
    public abstract void onDebug(int paramInt, Object paramObject);
  }
  
  public static abstract interface DownloadListener
  {
    public abstract void onFileDownloadFailed(int paramInt);
    
    public abstract void onFileDownloadStarted();
    
    public abstract void onFileDownloadSucceed(long paramLong);
  }
  
  public static abstract interface URLDrawableListener
  {
    public abstract void onLoadCanceled(URLDrawable paramURLDrawable);
    
    public abstract void onLoadFialed(URLDrawable paramURLDrawable, Throwable paramThrowable);
    
    public abstract void onLoadProgressed(URLDrawable paramURLDrawable, int paramInt);
    
    public abstract void onLoadSuccessed(URLDrawable paramURLDrawable);
  }
  
  public static abstract interface URLDrawableListener2
    extends URLDrawable.URLDrawableListener
  {
    public abstract void onFileDownloaded(URLDrawable paramURLDrawable);
  }
  
  public static class URLDrawableOptions
  {
    private static final int MAX_POOL_SIZE = 30;
    private static final String TAG = "URLDrawableOptions";
    private static URLDrawableOptions sPool;
    private static int sPoolSize = 0;
    private static final Object sPoolSync = new Object();
    public Object mExtraInfo;
    public Drawable mFailedDrawable = null;
    public float mGifRoundCorner = 0.0F;
    public int mImgType;
    public Drawable mLoadingDrawable = null;
    private URLDrawableOptions mNext;
    public boolean mPlayGifImage = false;
    private boolean mRecycled = false;
    public int mRequestHeight = 0;
    public int mRequestWidth = 0;
    public boolean mUseAutoScaleParams = true;
    public boolean mUseExifOrientation = true;
    public boolean mUseMemoryCache = true;
    public boolean mUseThreadPool = true;
    
    private URLDrawableOptions() {}
    
    private void clearForRecycle()
    {
      mRequestWidth = 0;
      mRequestHeight = 0;
      mLoadingDrawable = null;
      mFailedDrawable = null;
      mPlayGifImage = false;
      mGifRoundCorner = 0.0F;
      mUseAutoScaleParams = true;
      mUseExifOrientation = true;
      mUseMemoryCache = true;
      mUseThreadPool = true;
      mRecycled = true;
    }
    
    public static URLDrawableOptions obtain()
    {
      synchronized (sPoolSync)
      {
        if (sPool != null)
        {
          localURLDrawableOptions = sPool;
          sPool = mNext;
          mRecycled = false;
          mNext = null;
          sPoolSize -= 1;
          return localURLDrawableOptions;
        }
        URLDrawableOptions localURLDrawableOptions = new URLDrawableOptions();
        return localURLDrawableOptions;
      }
    }
    
    public void Recycle()
    {
      if (mRecycled) {
        return;
      }
      clearForRecycle();
      for (;;)
      {
        synchronized (sPoolSync)
        {
          if (sPoolSize < 30)
          {
            mNext = sPool;
            sPool = this;
            sPoolSize += 1;
            return;
          }
        }
        if (QLog.isColorLevel()) {
          QLog.i("URLDrawableOptions", 2, "URLDrawableOptions pool size is full");
        }
      }
    }
  }
}
