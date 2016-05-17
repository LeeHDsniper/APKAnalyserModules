package com.tencent.image;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import com.tencent.qphone.base.util.QLog;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Vector;

public abstract class AbstractVideoImage
{
  private static final int PENDING_ACTION_CAPACITY = 100;
  private static final String TAG = AbstractVideoImage.class.getSimpleName();
  public static boolean loopEnable = true;
  protected static Object sPauseLock;
  protected static volatile boolean sPaused = false;
  protected static final ArrayList<WeakReference<AbstractVideoImage>> sPendingActions = new ArrayList(105)
  {
    private void ensureCapacity()
    {
      int i = size();
      if (i > 100) {
        removeRange(0, i - 100 - 1);
      }
    }
    
    public boolean add(WeakReference<AbstractVideoImage> paramAnonymousWeakReference)
    {
      boolean bool = super.add(paramAnonymousWeakReference);
      ensureCapacity();
      return bool;
    }
  };
  public float mDefaultRoundCorner = 5.0F;
  private int mDensity = 160;
  private Vector<WeakReference<VideoDrawable>> mDrawableList = new Vector();
  protected boolean mIsInPendingAction = false;
  protected VideoDrawable.OnPlayRepeatListener mListener;
  protected VideoDrawable.OnAudioPlayOnceListener mPlayOnceListener;
  public boolean mSupportGlobalPause = true;
  
  static
  {
    sPauseLock = new Object();
  }
  
  public AbstractVideoImage() {}
  
  public static final void pauseAll()
  {
    if (!sPaused)
    {
      sPaused = true;
      if (QLog.isColorLevel()) {
        QLog.d(TAG, 2, " pauseAll ");
      }
    }
  }
  
  public static final void resumeAll()
  {
    if (sPaused)
    {
      if (QLog.isColorLevel()) {
        QLog.d(TAG, 2, " resumeAll ");
      }
      synchronized (sPauseLock)
      {
        sPaused = false;
        sPauseLock.notifyAll();
        int i = sPendingActions.size() - 1;
        if (i >= 0)
        {
          ??? = (AbstractVideoImage)((WeakReference)sPendingActions.get(i)).get();
          if (??? != null) {
            ((AbstractVideoImage)???).reDraw();
          }
          i -= 1;
        }
      }
      sPendingActions.clear();
    }
  }
  
  public static int scaleFromDensity(int paramInt1, int paramInt2, int paramInt3)
  {
    if ((paramInt2 == 0) || (paramInt2 == paramInt3)) {
      return paramInt1;
    }
    return (paramInt1 * paramInt3 + (paramInt2 >> 1)) / paramInt2;
  }
  
  protected abstract void applyNextFrame();
  
  public void attachDrawable(VideoDrawable paramVideoDrawable)
  {
    if (paramVideoDrawable != null) {
      synchronized (mDrawableList)
      {
        if (!mDrawableList.contains(paramVideoDrawable)) {
          mDrawableList.add(new WeakReference(paramVideoDrawable));
        }
        return;
      }
    }
  }
  
  public void detachDrawable(VideoDrawable paramVideoDrawable)
  {
    if (paramVideoDrawable != null)
    {
      localVector = mDrawableList;
      int i = 0;
      Object localObject;
      for (;;)
      {
        int j;
        try
        {
          if (i < mDrawableList.size())
          {
            localObject = (WeakReference)mDrawableList.get(i);
            if ((localObject == null) || (((WeakReference)localObject).get() == paramVideoDrawable))
            {
              localObject = mDrawableList;
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
      if (((WeakReference)localObject).get() == paramVideoDrawable)
      {
        paramVideoDrawable = mDrawableList;
        paramVideoDrawable.remove(i);
      }
    }
    else
    {
      return;
      return;
    }
  }
  
  protected void doApplyNextFrame(int paramInt)
  {
    applyNextFrame();
    if (mSupportGlobalPause)
    {
      if (!sPaused) {
        invalidateSelf();
      }
      while (mIsInPendingAction) {
        return;
      }
      sPendingActions.add(new WeakReference(this));
      mIsInPendingAction = true;
      return;
    }
    invalidateSelf();
  }
  
  protected abstract void draw(Canvas paramCanvas, Rect paramRect, Paint paramPaint, boolean paramBoolean);
  
  public abstract int getByteSize();
  
  public abstract int getHeight();
  
  public int getScaledHeight(int paramInt)
  {
    return scaleFromDensity(getHeight(), mDensity, paramInt);
  }
  
  public int getScaledWidth(int paramInt)
  {
    return scaleFromDensity(getWidth(), mDensity, paramInt);
  }
  
  public abstract int getWidth();
  
  protected void invalidateSelf()
  {
    Vector localVector = mDrawableList;
    int i = 0;
    for (;;)
    {
      Object localObject1;
      int j;
      try
      {
        if (i < mDrawableList.size())
        {
          localObject1 = (WeakReference)mDrawableList.get(i);
          if ((localObject1 == null) || (((WeakReference)localObject1).get() == null))
          {
            localObject1 = mDrawableList;
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
      ((VideoDrawable)((WeakReference)localObject1).get()).invalidateSelf();
    }
    return;
    throw localObject2;
  }
  
  public abstract boolean isAudioPlaying();
  
  protected void reDraw()
  {
    invalidateSelf();
    mIsInPendingAction = false;
  }
  
  public abstract void resetAndPlayAudioOnce();
  
  public void setOnAudioPlayOnceListener(VideoDrawable.OnAudioPlayOnceListener paramOnAudioPlayOnceListener)
  {
    mPlayOnceListener = paramOnAudioPlayOnceListener;
  }
  
  public void setOnPlayRepeatListener(VideoDrawable.OnPlayRepeatListener paramOnPlayRepeatListener)
  {
    mListener = paramOnPlayRepeatListener;
  }
  
  public abstract void stopPlayAudio();
}
