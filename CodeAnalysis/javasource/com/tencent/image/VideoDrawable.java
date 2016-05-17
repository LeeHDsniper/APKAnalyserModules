package com.tencent.image;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.ConstantState;
import android.util.DisplayMetrics;
import android.view.Gravity;
import java.io.File;

public class VideoDrawable
  extends Drawable
{
  private static final String TAG = VideoDrawable.class.getSimpleName();
  private boolean mApplyGravity;
  private final Rect mDstRect = new Rect();
  private OnPlayerOneFrameListener mFrameDrawListener = null;
  public boolean mPlayVideoFrame = true;
  private int mTargetDensity = 160;
  private int mVideoHeight;
  private VideoState mVideoState;
  private int mVideoWidth;
  
  public VideoDrawable(AbstractVideoImage paramAbstractVideoImage, Resources paramResources)
  {
    this(new VideoState(paramAbstractVideoImage), paramResources);
    mVideoState.mTargetDensity = mTargetDensity;
  }
  
  public VideoDrawable(VideoState paramVideoState, Resources paramResources)
  {
    mVideoState = paramVideoState;
    mVideoState.mVideo.attachDrawable(this);
    if (paramResources != null) {}
    for (mTargetDensity = getDisplayMetricsdensityDpi;; mTargetDensity = mTargetDensity)
    {
      computeImageSize();
      return;
    }
  }
  
  public VideoDrawable(File paramFile, Resources paramResources, boolean paramBoolean)
  {
    this(new NativeVideoImage(paramFile, paramBoolean), paramResources);
  }
  
  private void computeImageSize()
  {
    mVideoWidth = mVideoState.mVideo.getScaledWidth(mTargetDensity);
    mVideoHeight = mVideoState.mVideo.getScaledHeight(mTargetDensity);
  }
  
  public static boolean isVideo(File paramFile)
  {
    paramFile = paramFile.getAbsolutePath();
    int i = paramFile.lastIndexOf('.');
    paramFile = paramFile.substring(i + 1);
    return (i > 0) && ((paramFile.equals("mp4")) || (paramFile.equals("vf")));
  }
  
  public void disableGlobalPause()
  {
    if ((mVideoState.mVideo != null) && ((mVideoState.mVideo instanceof NativeVideoImage))) {
      mVideoState.mVideo).mSupportGlobalPause = false;
    }
  }
  
  public void draw(Canvas paramCanvas)
  {
    if (mApplyGravity)
    {
      Gravity.apply(mVideoState.mGravity, mVideoWidth, mVideoHeight, getBounds(), mDstRect);
      mApplyGravity = false;
    }
    if (mFrameDrawListener != null) {
      mFrameDrawListener.oneFrameDrawed();
    }
    copyBounds(mDstRect);
    mVideoState.mVideo.draw(paramCanvas, mDstRect, mVideoState.mPaint, mPlayVideoFrame);
  }
  
  public void enableGlobalPause()
  {
    if ((mVideoState.mVideo != null) && ((mVideoState.mVideo instanceof NativeVideoImage))) {
      mVideoState.mVideo).mSupportGlobalPause = true;
    }
  }
  
  public Drawable.ConstantState getConstantState()
  {
    return mVideoState;
  }
  
  public Bitmap getCurrentBitmap()
  {
    if ((mVideoState.mVideo != null) && ((mVideoState.mVideo instanceof NativeVideoImage))) {
      return mVideoState.mVideo).mCurFrameBitmap;
    }
    return null;
  }
  
  public int getIntrinsicHeight()
  {
    return mVideoHeight;
  }
  
  public int getIntrinsicWidth()
  {
    return mVideoWidth;
  }
  
  public int getOpacity()
  {
    return -2;
  }
  
  public boolean isAudioPlaying()
  {
    return mVideoState.mVideo.isAudioPlaying();
  }
  
  protected void onBoundsChange(Rect paramRect)
  {
    super.onBoundsChange(paramRect);
    mApplyGravity = true;
  }
  
  public void resetAndPlayAudioOnce()
  {
    mVideoState.mVideo.resetAndPlayAudioOnce();
  }
  
  public void setAlpha(int paramInt)
  {
    mVideoState.mPaint.setAlpha(paramInt);
  }
  
  public void setColorFilter(ColorFilter paramColorFilter)
  {
    mVideoState.mPaint.setColorFilter(paramColorFilter);
  }
  
  public void setDither(boolean paramBoolean)
  {
    mVideoState.mPaint.setDither(paramBoolean);
  }
  
  public void setFilterBitmap(boolean paramBoolean)
  {
    mVideoState.mPaint.setFilterBitmap(paramBoolean);
  }
  
  public void setGravity(int paramInt)
  {
    mVideoState.mGravity = paramInt;
    mApplyGravity = true;
  }
  
  public void setOnAudioPlayOnceListener(OnAudioPlayOnceListener paramOnAudioPlayOnceListener)
  {
    if ((mVideoState != null) && (mVideoState.mVideo != null)) {
      mVideoState.mVideo.setOnAudioPlayOnceListener(paramOnAudioPlayOnceListener);
    }
  }
  
  public void setOnPlayRepeatListener(OnPlayRepeatListener paramOnPlayRepeatListener)
  {
    if ((mVideoState != null) && (mVideoState.mVideo != null)) {
      mVideoState.mVideo.setOnPlayRepeatListener(paramOnPlayRepeatListener);
    }
  }
  
  public void setOnPlayerOneFrameListener(OnPlayerOneFrameListener paramOnPlayerOneFrameListener)
  {
    mFrameDrawListener = paramOnPlayerOneFrameListener;
  }
  
  public void setTargetDensity(int paramInt)
  {
    if (paramInt != mTargetDensity)
    {
      int i = paramInt;
      if (paramInt == 0) {
        i = 160;
      }
      mTargetDensity = i;
      computeImageSize();
      invalidateSelf();
    }
  }
  
  public void stopAudio()
  {
    mVideoState.mVideo.stopPlayAudio();
  }
  
  public static abstract interface OnAudioPlayOnceListener
  {
    public abstract void onFinish();
  }
  
  public static abstract interface OnPlayRepeatListener
  {
    public abstract void onPlayRepeat(int paramInt);
  }
  
  public static abstract interface OnPlayerOneFrameListener
  {
    public abstract void oneFrameDrawed();
  }
  
  public static class VideoDrawableParams
  {
    public String mAfPath;
    public int mDecodeType = 0;
    public boolean mEnableAntiAlias = false;
    public boolean mEnableFilter = false;
    public boolean mPlayAudioFrame = false;
    public boolean mPlayVideoFrame = true;
    public int mRequestedFPS = -1;
    public int mTotalTime;
    public String mVfPath;
    public int mVideoFrames;
    public int mVideoRoundCorner;
    
    public VideoDrawableParams() {}
    
    public String toString()
    {
      StringBuilder localStringBuilder = new StringBuilder();
      localStringBuilder.append("[");
      localStringBuilder.append(" mVideoRoundCorner: " + mVideoRoundCorner);
      localStringBuilder.append(" mPlayVideoFrame: " + mPlayVideoFrame);
      localStringBuilder.append(" mPlayAudioFrame: " + mPlayAudioFrame);
      localStringBuilder.append(" mEnableAntiAlias: " + mEnableAntiAlias);
      localStringBuilder.append(" mEnableFilter: " + mEnableFilter);
      localStringBuilder.append(" mRequestedFPS: " + mRequestedFPS);
      localStringBuilder.append(" mDecodeType: " + mDecodeType);
      localStringBuilder.append(" mVfPath: " + mVfPath);
      localStringBuilder.append(" mAfPath: " + mAfPath);
      localStringBuilder.append(" mTotalTime: " + mTotalTime);
      localStringBuilder.append(" mVideoFrames: " + mVideoFrames);
      localStringBuilder.append("] ");
      return localStringBuilder.toString();
    }
  }
  
  static class VideoState
    extends Drawable.ConstantState
  {
    int mChangingConfigurations;
    int mGravity = 119;
    Paint mPaint = new Paint();
    int mTargetDensity = 160;
    AbstractVideoImage mVideo;
    
    public VideoState(AbstractVideoImage paramAbstractVideoImage)
    {
      mVideo = paramAbstractVideoImage;
    }
    
    public int getChangingConfigurations()
    {
      return mChangingConfigurations;
    }
    
    public Drawable newDrawable()
    {
      return new VideoDrawable(this, null);
    }
    
    public Drawable newDrawable(Resources paramResources)
    {
      return new VideoDrawable(this, paramResources);
    }
  }
}
