package com.adobe.creativesdk.aviary.internal.headless.moa;

import android.graphics.Bitmap;
import android.util.Log;

public class MoaJavaUndo
{
  private long ptr = 0L;
  
  public MoaJavaUndo(boolean paramBoolean)
  {
    Log.i("MoaJavaUndo", "enabled: " + paramBoolean);
    if (paramBoolean) {
      ptr = nativeCtor();
    }
  }
  
  static native long nativeBytesCount(long paramLong);
  
  static native boolean nativeCanRedo(long paramLong);
  
  static native boolean nativeCanUndo(long paramLong);
  
  static native void nativeClear(long paramLong);
  
  static native long nativeCtor();
  
  static native void nativeDispose(long paramLong);
  
  static native long nativePush(long paramLong, Bitmap paramBitmap);
  
  static native boolean nativeRedo(long paramLong, MoaUndoBitmap paramMoaUndoBitmap);
  
  static native int nativeSize(long paramLong);
  
  static native boolean nativeUndo(long paramLong, MoaUndoBitmap paramMoaUndoBitmap);
  
  public boolean canRedo()
  {
    if (ptr > 0L) {
      return nativeCanRedo(ptr);
    }
    return false;
  }
  
  public boolean canUndo()
  {
    if (ptr > 0L) {
      return nativeCanUndo(ptr);
    }
    return false;
  }
  
  public void dispose()
  {
    if (ptr > 0L)
    {
      nativeDispose(ptr);
      ptr = 0L;
    }
  }
  
  public long load(Bitmap paramBitmap)
  {
    long l = 0L;
    if (ptr > 0L)
    {
      nativeClear(ptr);
      l = push(paramBitmap);
    }
    return l;
  }
  
  public long push(Bitmap paramBitmap)
  {
    long l = 0L;
    if (ptr > 0L) {
      l = nativePush(ptr, paramBitmap);
    }
    return l;
  }
  
  public MoaUndoBitmap redo()
  {
    if ((ptr > 0L) && (canRedo()))
    {
      MoaUndoBitmap localMoaUndoBitmap = new MoaUndoBitmap();
      boolean bool = nativeRedo(ptr, localMoaUndoBitmap);
      Log.d("MoaJavaUndo", "redo result: " + bool + ", output: " + localMoaUndoBitmap);
      if ((bool) && (!localMoaUndoBitmap.isEmpty())) {
        return localMoaUndoBitmap;
      }
    }
    return null;
  }
  
  public MoaUndoBitmap undo()
  {
    if ((ptr > 0L) && (canUndo()))
    {
      MoaUndoBitmap localMoaUndoBitmap = new MoaUndoBitmap();
      boolean bool = nativeUndo(ptr, localMoaUndoBitmap);
      Log.d("MoaJavaUndo", "undo result: " + bool + ", output: " + localMoaUndoBitmap);
      if ((bool) && (!localMoaUndoBitmap.isEmpty())) {
        return localMoaUndoBitmap;
      }
    }
    return null;
  }
  
  public static class MoaUndoBitmap
  {
    private static final String TAG = "MoaUndoBitmap";
    public Bitmap bitmap;
    public long ptr;
    
    public MoaUndoBitmap() {}
    
    public boolean isEmpty()
    {
      Log.d("MoaUndoBitmap", String.format("ptr: 0x%x, bitmap: %s", new Object[] { Long.valueOf(ptr), bitmap }));
      return bitmap == null;
    }
    
    public String toString()
    {
      return String.format("MoaUndoBitmap{ptr:0x%x, bitmap:%s}", new Object[] { Long.valueOf(ptr), bitmap });
    }
  }
}
