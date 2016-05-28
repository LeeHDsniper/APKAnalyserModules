package com.adobe.creativesdk.aviary.internal.headless.filters;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.RectF;
import android.util.Log;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaAction;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionList;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaPointParameter;

public class NativeVignetteToolFilter
  extends NativeFilter
{
  private final Object lock = new Object();
  private Bitmap mBitmap;
  private final MoaAction mFirstAction = mActions.get(0);
  private int mScale = 1;
  private long n_ptr = 0L;
  
  public NativeVignetteToolFilter()
  {
    super("vignette");
  }
  
  private void clearBitmapAlreadyLocked()
  {
    nativeSetBitmap(n_ptr, null);
    if ((mBitmap != null) && (!mBitmap.isRecycled())) {
      mBitmap.recycle();
    }
    mBitmap = null;
  }
  
  public void clearBitmap()
  {
    synchronized (lock)
    {
      clearBitmapAlreadyLocked();
      return;
    }
  }
  
  public void createBitmap(int paramInt1, int paramInt2, int paramInt3)
  {
    synchronized (lock)
    {
      clearBitmapAlreadyLocked();
      mBitmap = Bitmap.createBitmap(paramInt1 / paramInt3, paramInt2 / paramInt3, Bitmap.Config.ARGB_8888);
      mScale = paramInt3;
      mFirstAction.setValue("bitmapscale", paramInt3);
      mFirstAction.setValue("previewsize", new MoaPointParameter(paramInt1, paramInt2));
      if (!nativeSetBitmap(n_ptr, mBitmap)) {
        Log.e("VignetteToolFilter", "nativeSetBitmap returned false!");
      }
      return;
    }
  }
  
  public void dispose()
  {
    synchronized (lock)
    {
      if (n_ptr != 0L)
      {
        clearBitmap();
        nativeDispose(n_ptr);
      }
      n_ptr = 0L;
      return;
    }
  }
  
  public Bitmap getBitmap()
  {
    synchronized (lock)
    {
      Bitmap localBitmap = mBitmap;
      return localBitmap;
    }
  }
  
  native long nativeCtor();
  
  native void nativeDispose(long paramLong);
  
  native boolean nativeRenderPreview(long paramLong, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, int paramInt, float paramFloat5);
  
  native boolean nativeSetBitmap(long paramLong, Bitmap paramBitmap);
  
  public boolean renderPreview(RectF paramRectF, int paramInt, float paramFloat)
  {
    if (n_ptr != 0L) {
      synchronized (lock)
      {
        if ((mBitmap != null) && (!mBitmap.isRecycled()))
        {
          mFirstAction.setValue("left", left);
          mFirstAction.setValue("top", top);
          mFirstAction.setValue("right", right);
          mFirstAction.setValue("bottom", bottom);
          mFirstAction.setValue("intensity", paramInt);
          mFirstAction.setValue("feather", paramFloat);
          boolean bool = nativeRenderPreview(n_ptr, left, top, right, bottom, paramInt, paramFloat);
          return bool;
        }
      }
    }
    return false;
  }
}
