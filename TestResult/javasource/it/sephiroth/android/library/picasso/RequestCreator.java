package it.sephiroth.android.library.picasso;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.widget.ImageView;
import java.io.File;
import java.util.concurrent.atomic.AtomicInteger;

public class RequestCreator
{
  private static final AtomicInteger nextId = new AtomicInteger();
  private final Request.Builder data;
  private boolean deferred;
  private long delayMillis;
  private Drawable errorDrawable;
  private int errorResId;
  private long fadeTime = 200L;
  private int memoryPolicy;
  private int networkPolicy;
  private final Picasso picasso;
  private Drawable placeholderDrawable;
  private int placeholderResId;
  private boolean setPlaceholder = true;
  private Object tag;
  private boolean targetIsHidden;
  
  RequestCreator()
  {
    picasso = null;
    data = new Request.Builder(null, 0, null);
    data.setCache(null);
  }
  
  RequestCreator(Picasso paramPicasso, Uri paramUri, int paramInt)
  {
    if (shutdown) {
      throw new IllegalStateException("Picasso instance already shut down. Cannot submit new requests.");
    }
    Uri localUri = paramUri;
    if (paramUri != null)
    {
      localUri = paramUri;
      if (paramUri.getScheme() == null) {
        localUri = Uri.fromFile(new File(paramUri.getPath()));
      }
    }
    picasso = paramPicasso;
    data = new Request.Builder(localUri, paramInt, defaultBitmapConfig);
    data.setCache(paramPicasso.getCache());
  }
  
  private Request createRequest(long paramLong)
  {
    int i = nextId.getAndIncrement();
    Request localRequest1 = data.build();
    id = i;
    started = paramLong;
    boolean bool = picasso.loggingEnabled;
    if (bool) {
      Utils.log("Main", "created", localRequest1.plainId(), localRequest1.toString());
    }
    Request localRequest2 = picasso.transformRequest(localRequest1);
    if (localRequest2 != localRequest1)
    {
      id = i;
      started = paramLong;
      if (bool) {
        Utils.log("Main", "changed", localRequest2.logId(), "into " + localRequest2);
      }
    }
    return localRequest2;
  }
  
  private Drawable getPlaceholderDrawable()
  {
    if (placeholderResId != 0) {
      return picasso.context.getResources().getDrawable(placeholderResId);
    }
    return placeholderDrawable;
  }
  
  public RequestCreator centerCrop()
  {
    data.centerCrop();
    return this;
  }
  
  public RequestCreator config(Bitmap.Config paramConfig)
  {
    data.config(paramConfig);
    return this;
  }
  
  public RequestCreator fade(long paramLong)
  {
    fadeTime = paramLong;
    return this;
  }
  
  public RequestCreator fit()
  {
    return fit(false);
  }
  
  public RequestCreator fit(boolean paramBoolean)
  {
    deferred = true;
    targetIsHidden = paramBoolean;
    return this;
  }
  
  public void into(ImageView paramImageView)
  {
    into(paramImageView, null);
  }
  
  public void into(ImageView paramImageView, Callback paramCallback)
  {
    long l = System.nanoTime();
    Utils.checkMain();
    if (paramImageView == null) {
      throw new IllegalArgumentException("Target must not be null.");
    }
    if (!data.hasImage())
    {
      picasso.cancelRequest(paramImageView);
      if (setPlaceholder) {
        PicassoDrawable.setPlaceholder(paramImageView, getPlaceholderDrawable());
      }
    }
    Request localRequest;
    String str;
    do
    {
      return;
      if (deferred)
      {
        if (data.hasSize()) {
          throw new IllegalStateException("Fit cannot be used with resize.");
        }
        int j;
        if ((paramImageView.getVisibility() == 8) || (targetIsHidden)) {
          j = paramImageView.getMeasuredWidth();
        }
        for (int i = paramImageView.getMeasuredHeight(); (j <= 0) || (i <= 0); i = paramImageView.getHeight())
        {
          if (setPlaceholder) {
            PicassoDrawable.setPlaceholder(paramImageView, placeholderDrawable);
          }
          picasso.defer(paramImageView, new DeferredRequestCreator(this, paramImageView, paramCallback, targetIsHidden));
          return;
          j = paramImageView.getWidth();
        }
        data.resize(j, i);
      }
      localRequest = createRequest(l);
      str = Utils.createKey(localRequest);
      if (!MemoryPolicy.shouldReadFromMemoryCache(memoryPolicy)) {
        break;
      }
      Bitmap localBitmap = picasso.quickMemoryCacheCheck(data.getCache(), str);
      if (localBitmap == null) {
        break;
      }
      picasso.cancelRequest(paramImageView);
      PicassoDrawable.setBitmap(paramImageView, picasso.context, localBitmap, Picasso.LoadedFrom.MEMORY, fadeTime, picasso.indicatorsEnabled);
      if (picasso.loggingEnabled) {
        Utils.log("Main", "completed", localRequest.plainId(), "from " + Picasso.LoadedFrom.MEMORY);
      }
    } while (paramCallback == null);
    paramCallback.onSuccess();
    return;
    if (setPlaceholder) {
      PicassoDrawable.setPlaceholder(paramImageView, getPlaceholderDrawable());
    }
    paramImageView = new ImageViewAction(picasso, paramImageView, localRequest, memoryPolicy, networkPolicy, errorResId, errorDrawable, str, tag, paramCallback, fadeTime);
    picasso.enqueueAndSubmit(paramImageView, delayMillis);
  }
  
  public RequestCreator memoryPolicy(MemoryPolicy paramMemoryPolicy, MemoryPolicy... paramVarArgs)
  {
    if (paramMemoryPolicy == null) {
      throw new IllegalArgumentException("Memory policy cannot be null.");
    }
    memoryPolicy |= index;
    if (paramVarArgs == null) {
      throw new IllegalArgumentException("Memory policy cannot be null.");
    }
    if (paramVarArgs.length > 0)
    {
      int j = paramVarArgs.length;
      int i = 0;
      while (i < j)
      {
        paramMemoryPolicy = paramVarArgs[i];
        if (paramMemoryPolicy == null) {
          throw new IllegalArgumentException("Memory policy cannot be null.");
        }
        memoryPolicy |= index;
        i += 1;
      }
    }
    return this;
  }
  
  public RequestCreator noFade()
  {
    fadeTime = 0L;
    return this;
  }
  
  public RequestCreator onlyScaleDown()
  {
    data.onlyScaleDown();
    return this;
  }
  
  public RequestCreator resize(int paramInt1, int paramInt2)
  {
    data.resize(paramInt1, paramInt2);
    return this;
  }
  
  @Deprecated
  public RequestCreator skipMemoryCache()
  {
    return memoryPolicy(MemoryPolicy.NO_CACHE, new MemoryPolicy[] { MemoryPolicy.NO_STORE });
  }
  
  public RequestCreator transform(Transformation paramTransformation)
  {
    data.transform(paramTransformation);
    return this;
  }
  
  RequestCreator unfit()
  {
    deferred = false;
    return this;
  }
  
  public RequestCreator withCache(Cache paramCache)
  {
    data.setCache(paramCache);
    return this;
  }
}
