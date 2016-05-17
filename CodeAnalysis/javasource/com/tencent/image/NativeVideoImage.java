package com.tencent.image;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.media.AudioTrack;
import android.os.AsyncTask;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.SystemClock;
import android.widget.Toast;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.video.decode.AVAudioParam;
import com.tencent.video.decode.AVDecodeFactory;
import com.tencent.video.decode.AVDecodeOption;
import com.tencent.video.decode.AVVideoParam;
import com.tencent.video.decode.AVideoException;
import com.tencent.video.decode.AbstractAVDecode;
import com.tencent.video.decode.ShortVideoSoLoad;
import java.io.File;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.atomic.AtomicInteger;

public class NativeVideoImage
  extends AbstractVideoImage
{
  static final int DEFAULT_AUDIO_FORMAT = 65281;
  public static final Bitmap.Config DEFAULT_CONFIG;
  public static String TAG = "URLDrawable_" + NativeVideoImage.class.getSimpleName() + "_";
  static final String TAG_AUDIO = TAG + "_Audio";
  private static int TIME_BASE;
  static boolean sLibLoaded = false;
  static Handler sReleaseHandler;
  protected static Handler sUIHandler;
  static boolean sVideoEngineAvaliable = true;
  static HandlerThread sWorkThread = new HandlerThread("Video-Release-Task");
  private int ID = -1;
  public boolean debug = true;
  private long drawTime = -1L;
  protected volatile AbstractAVDecode mAVDecode;
  protected DoAccumulativeRunnable mAccumulativeRunnable;
  private int mAudioFrameDuration = -1;
  private Object mAudioLock = new Object();
  private volatile boolean mAudioThreadFinish = true;
  AudioTrack mAudioTrack;
  private AtomicInteger mCount = new AtomicInteger(0);
  protected Bitmap mCurFrameBitmap;
  protected Bitmap mCurFrameBitmapBuffer;
  protected Bitmap.Config mCurrentConfig = DEFAULT_CONFIG;
  private DataReport mDataReport;
  protected volatile boolean mDecodeNextFrameEnd = true;
  public float mDefaultRoundCorner = 0.0F;
  private boolean mEnableAntiAlias = false;
  private boolean mEnableFilter = false;
  protected Bitmap mFirstFrameBitmap;
  private Object mLock = new Object();
  AVDecodeOption mOption;
  volatile boolean mPlayAudioFrame = false;
  volatile boolean mPlayAudioOnceFinished = true;
  PlayAudioThread mPlayAudioThread;
  int mPlayRepeatCount = 0;
  int mReqHeight = 0;
  int mReqWidth = 0;
  private int mRotation;
  protected final String mSrcVideoFile;
  private volatile boolean mVideoDecodeFinish = false;
  private int mVideoFrameDuration = -1;
  VideoDrawable.VideoDrawableParams mVideoParams;
  int mlastVideoFrameIndex = 0;
  private long refreshTime = -1L;
  int sImageIndex = 0;
  
  static
  {
    sWorkThread.start();
    sReleaseHandler = new Handler(sWorkThread.getLooper());
    DEFAULT_CONFIG = Bitmap.Config.ARGB_8888;
    TIME_BASE = 12;
    sUIHandler = new Handler(Looper.getMainLooper());
  }
  
  public NativeVideoImage(File paramFile, boolean paramBoolean)
  {
    this(paramFile, paramBoolean, 0, 0, null);
  }
  
  public NativeVideoImage(File paramFile, boolean paramBoolean, int paramInt1, int paramInt2, Object paramObject)
  {
    mSrcVideoFile = paramFile.getAbsolutePath();
    ID = mSrcVideoFile.hashCode();
    if ((QLog.isColorLevel()) && (paramObject != null)) {
      QLog.d(TAG + ID, 2, "NativeVideoImage(): cacheFirstFrame=" + paramBoolean + ", maxWidth= " + paramInt1 + ", maxHeight= " + paramInt2 + ", videoParams= " + paramObject.toString());
    }
    boolean bool;
    label386:
    int n;
    int i1;
    int i2;
    int m;
    int k;
    int j;
    int i;
    float f1;
    float f2;
    if ((paramObject != null) && (VideoDrawable.VideoDrawableParams.class.isInstance(paramObject)))
    {
      mVideoParams = ((VideoDrawable.VideoDrawableParams)paramObject);
      bool = mVideoParams.mPlayAudioFrame;
      mPlayAudioFrame = bool;
      debug = bool;
      mDefaultRoundCorner = mVideoParams.mVideoRoundCorner;
      mEnableAntiAlias = mVideoParams.mEnableAntiAlias;
      mEnableFilter = mVideoParams.mEnableFilter;
      mOption = new AVDecodeOption();
      bool = loopEnable;
      if (mPlayAudioFrame) {
        bool = false;
      }
      mOption.cycle = bool;
      paramObject = mOption;
      if (mPlayAudioFrame) {
        break label1010;
      }
      bool = true;
      ignore_audio = bool;
      mOption.only_keyframe = false;
      mOption.filename = mSrcVideoFile;
      mOption.audioFormat = 65281;
      mOption.wantedFps = mVideoParams.mRequestedFPS;
      mOption.mDecodeType = mVideoParams.mDecodeType;
      mOption.mVfPath = mVideoParams.mVfPath;
      mOption.mAfPath = mVideoParams.mAfPath;
      mOption.mTotalTime = mVideoParams.mTotalTime;
      mOption.mVideoFrames = mVideoParams.mVideoFrames;
      mAVDecode = AVDecodeFactory.newDecode(mOption);
      mRotation = mAVDecode.videoParam.rotation;
      n = mAVDecode.videoParam.fps_den;
      i1 = mAVDecode.videoParam.fps_num;
      i2 = i1 / n;
      if (mAVDecode.audioParam.errcode == -106)
      {
        mPlayAudioFrame = false;
        if (QLog.isColorLevel()) {
          QLog.e(TAG + ID, 2, "NativeVideoImage() => VIDEO_NO_MEDIA_DATA_ERR, 不存在音频数据, mSrcVideoFile=" + mSrcVideoFile);
        }
      }
      paramFile = getFrameSize(paramFile);
      m = paramFile.width();
      k = paramFile.height();
      j = k;
      i = m;
      if (paramInt1 > 0)
      {
        j = k;
        i = m;
        if (paramInt2 > 0)
        {
          f1 = paramInt1 / m;
          f2 = paramInt2 / k;
          if (f1 >= f2) {
            break label1016;
          }
        }
      }
    }
    for (;;)
    {
      j = k;
      i = m;
      if (f1 < 1.0F)
      {
        i = (int)(m * f1);
        j = (int)(k * f1);
      }
      mReqWidth = i;
      mReqHeight = j;
      if (QLog.isColorLevel())
      {
        paramFile = new StringBuilder();
        paramFile.append("videoParams[ frame_count:").append(mAVDecode.videoParam.frame_count);
        paramFile.append("\n mSrcVideoFile:").append(mSrcVideoFile);
        paramFile.append("\n duration:").append(mAVDecode.videoParam.duration);
        paramFile.append("\n fps_den:").append(n);
        paramFile.append("\n fps_num:").append(i1);
        paramFile.append("\n fps:").append(i2);
        paramFile.append("\n mReqWidth:").append(mReqWidth);
        paramFile.append("\n mReqHeight:").append(mReqHeight);
        paramFile.append("\n mRotation:").append(mRotation);
        QLog.d(TAG + ID, 2, " NativeVideoImage(): " + paramFile.toString());
      }
      init(paramBoolean);
      mDataReport = new DataReport();
      return;
      if (paramObject == null) {
        break;
      }
      throw new RuntimeException(" NativeVideoImage(): videoParams is illegal, not VideoDrawableParams, " + paramObject.toString());
      label1010:
      bool = false;
      break label386;
      label1016:
      f1 = f2;
    }
  }
  
  static void loadLibrary(Context paramContext)
  {
    if (!sLibLoaded) {}
    for (;;)
    {
      try
      {
        int i = ShortVideoSoLoad.LoadExtractedShortVideoSo("AVCodec", paramContext);
        if (i != 0) {
          continue;
        }
        sVideoEngineAvaliable = true;
        if (QLog.isColorLevel()) {
          QLog.d(TAG, 2, "loadLibrary(): status=" + i);
        }
      }
      catch (Throwable paramContext)
      {
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.e(TAG, 2, "System.loadLibrary(AVCodec) failed");
        paramContext.printStackTrace();
        continue;
      }
      sLibLoaded = true;
      return;
      if (QLog.isColorLevel()) {
        QLog.e(TAG, 2, "loadLibrary() failure....");
      }
    }
  }
  
  /* Error */
  protected void applyNextFrame()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: invokestatic 466	java/lang/System:currentTimeMillis	()J
    //   5: lstore_1
    //   6: new 468	android/graphics/Canvas
    //   9: dup
    //   10: aload_0
    //   11: getfield 470	com/tencent/image/NativeVideoImage:mCurFrameBitmap	Landroid/graphics/Bitmap;
    //   14: invokespecial 473	android/graphics/Canvas:<init>	(Landroid/graphics/Bitmap;)V
    //   17: astore 5
    //   19: aload_0
    //   20: getfield 470	com/tencent/image/NativeVideoImage:mCurFrameBitmap	Landroid/graphics/Bitmap;
    //   23: iconst_0
    //   24: invokevirtual 478	android/graphics/Bitmap:eraseColor	(I)V
    //   27: new 480	android/graphics/Paint
    //   30: dup
    //   31: invokespecial 481	android/graphics/Paint:<init>	()V
    //   34: astore 6
    //   36: aload_0
    //   37: getfield 183	com/tencent/image/NativeVideoImage:mDefaultRoundCorner	F
    //   40: fconst_0
    //   41: fcmpl
    //   42: ifle +65 -> 107
    //   45: aload 6
    //   47: iconst_1
    //   48: invokevirtual 484	android/graphics/Paint:setAntiAlias	(Z)V
    //   51: aload 5
    //   53: new 486	android/graphics/RectF
    //   56: dup
    //   57: fconst_0
    //   58: fconst_0
    //   59: aload_0
    //   60: getfield 470	com/tencent/image/NativeVideoImage:mCurFrameBitmap	Landroid/graphics/Bitmap;
    //   63: invokevirtual 489	android/graphics/Bitmap:getWidth	()I
    //   66: i2f
    //   67: aload_0
    //   68: getfield 470	com/tencent/image/NativeVideoImage:mCurFrameBitmap	Landroid/graphics/Bitmap;
    //   71: invokevirtual 492	android/graphics/Bitmap:getHeight	()I
    //   74: i2f
    //   75: invokespecial 495	android/graphics/RectF:<init>	(FFFF)V
    //   78: aload_0
    //   79: getfield 183	com/tencent/image/NativeVideoImage:mDefaultRoundCorner	F
    //   82: aload_0
    //   83: getfield 183	com/tencent/image/NativeVideoImage:mDefaultRoundCorner	F
    //   86: aload 6
    //   88: invokevirtual 499	android/graphics/Canvas:drawRoundRect	(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V
    //   91: aload 6
    //   93: new 501	android/graphics/PorterDuffXfermode
    //   96: dup
    //   97: getstatic 507	android/graphics/PorterDuff$Mode:SRC_IN	Landroid/graphics/PorterDuff$Mode;
    //   100: invokespecial 510	android/graphics/PorterDuffXfermode:<init>	(Landroid/graphics/PorterDuff$Mode;)V
    //   103: invokevirtual 514	android/graphics/Paint:setXfermode	(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;
    //   106: pop
    //   107: aload_0
    //   108: getfield 349	com/tencent/image/NativeVideoImage:mRotation	I
    //   111: ifeq +173 -> 284
    //   114: new 516	android/graphics/Matrix
    //   117: dup
    //   118: invokespecial 517	android/graphics/Matrix:<init>	()V
    //   121: astore 7
    //   123: aload 7
    //   125: aload_0
    //   126: getfield 349	com/tencent/image/NativeVideoImage:mRotation	I
    //   129: i2f
    //   130: aload_0
    //   131: getfield 519	com/tencent/image/NativeVideoImage:mCurFrameBitmapBuffer	Landroid/graphics/Bitmap;
    //   134: invokevirtual 489	android/graphics/Bitmap:getWidth	()I
    //   137: iconst_2
    //   138: idiv
    //   139: i2f
    //   140: aload_0
    //   141: getfield 519	com/tencent/image/NativeVideoImage:mCurFrameBitmapBuffer	Landroid/graphics/Bitmap;
    //   144: invokevirtual 492	android/graphics/Bitmap:getHeight	()I
    //   147: iconst_2
    //   148: idiv
    //   149: i2f
    //   150: invokevirtual 523	android/graphics/Matrix:postRotate	(FFF)Z
    //   153: pop
    //   154: aload 7
    //   156: aload_0
    //   157: getfield 470	com/tencent/image/NativeVideoImage:mCurFrameBitmap	Landroid/graphics/Bitmap;
    //   160: invokevirtual 489	android/graphics/Bitmap:getWidth	()I
    //   163: aload_0
    //   164: getfield 519	com/tencent/image/NativeVideoImage:mCurFrameBitmapBuffer	Landroid/graphics/Bitmap;
    //   167: invokevirtual 489	android/graphics/Bitmap:getWidth	()I
    //   170: isub
    //   171: i2f
    //   172: fconst_2
    //   173: fdiv
    //   174: aload_0
    //   175: getfield 470	com/tencent/image/NativeVideoImage:mCurFrameBitmap	Landroid/graphics/Bitmap;
    //   178: invokevirtual 492	android/graphics/Bitmap:getHeight	()I
    //   181: aload_0
    //   182: getfield 519	com/tencent/image/NativeVideoImage:mCurFrameBitmapBuffer	Landroid/graphics/Bitmap;
    //   185: invokevirtual 492	android/graphics/Bitmap:getHeight	()I
    //   188: isub
    //   189: i2f
    //   190: fconst_2
    //   191: fdiv
    //   192: invokevirtual 527	android/graphics/Matrix:postTranslate	(FF)Z
    //   195: pop
    //   196: aload 5
    //   198: aload_0
    //   199: getfield 519	com/tencent/image/NativeVideoImage:mCurFrameBitmapBuffer	Landroid/graphics/Bitmap;
    //   202: aload 7
    //   204: aload 6
    //   206: invokevirtual 531	android/graphics/Canvas:drawBitmap	(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V
    //   209: invokestatic 246	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   212: ifeq +69 -> 281
    //   215: aload_0
    //   216: getfield 173	com/tencent/image/NativeVideoImage:debug	Z
    //   219: ifeq +62 -> 281
    //   222: invokestatic 466	java/lang/System:currentTimeMillis	()J
    //   225: lstore_3
    //   226: new 96	java/lang/StringBuilder
    //   229: dup
    //   230: invokespecial 99	java/lang/StringBuilder:<init>	()V
    //   233: getstatic 118	com/tencent/image/NativeVideoImage:TAG	Ljava/lang/String;
    //   236: invokevirtual 105	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   239: aload_0
    //   240: getfield 195	com/tencent/image/NativeVideoImage:ID	I
    //   243: invokevirtual 249	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   246: invokevirtual 116	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   249: iconst_2
    //   250: new 96	java/lang/StringBuilder
    //   253: dup
    //   254: invokespecial 99	java/lang/StringBuilder:<init>	()V
    //   257: ldc_w 533
    //   260: invokevirtual 105	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   263: lload_3
    //   264: lload_1
    //   265: lsub
    //   266: invokevirtual 536	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   269: ldc_w 538
    //   272: invokevirtual 105	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   275: invokevirtual 116	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   278: invokestatic 265	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   281: aload_0
    //   282: monitorexit
    //   283: return
    //   284: aload 5
    //   286: aload_0
    //   287: getfield 519	com/tencent/image/NativeVideoImage:mCurFrameBitmapBuffer	Landroid/graphics/Bitmap;
    //   290: fconst_0
    //   291: fconst_0
    //   292: aload 6
    //   294: invokevirtual 541	android/graphics/Canvas:drawBitmap	(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
    //   297: goto -88 -> 209
    //   300: astore 5
    //   302: aload_0
    //   303: monitorexit
    //   304: aload 5
    //   306: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	307	0	this	NativeVideoImage
    //   5	260	1	l1	long
    //   225	39	3	l2	long
    //   17	268	5	localCanvas	Canvas
    //   300	5	5	localObject	Object
    //   34	259	6	localPaint	Paint
    //   121	82	7	localMatrix	android.graphics.Matrix
    // Exception table:
    //   from	to	target	type
    //   2	107	300	finally
    //   107	209	300	finally
    //   209	281	300	finally
    //   284	297	300	finally
  }
  
  protected void doApplyNextFrame(int paramInt)
  {
    mDecodeNextFrameEnd = true;
    super.doApplyNextFrame(paramInt);
    if ((QLog.isColorLevel()) && (debug)) {
      QLog.d(TAG + ID, 2, "doApplyNextFrame: invalidateSelf, index:" + paramInt);
    }
    refreshTime = SystemClock.uptimeMillis();
  }
  
  protected void draw(Canvas paramCanvas, Rect paramRect, Paint paramPaint, boolean paramBoolean)
  {
    long l2 = System.currentTimeMillis();
    if (sUIHandler == null) {
      sUIHandler = new Handler();
    }
    if (mAccumulativeRunnable == null) {
      mAccumulativeRunnable = new DoAccumulativeRunnable();
    }
    if ((QLog.isColorLevel()) && (debug)) {
      QLog.d(TAG + ID, 2, "======>draw():start");
    }
    drawTime = SystemClock.uptimeMillis();
    if (paramPaint != null)
    {
      paramPaint.setAntiAlias(mEnableAntiAlias);
      paramPaint.setFilterBitmap(mEnableFilter);
    }
    if (mCurFrameBitmap != null) {
      paramCanvas.drawBitmap(mCurFrameBitmap, null, paramRect, paramPaint);
    }
    long l1 = SystemClock.uptimeMillis() - drawTime;
    if (!paramBoolean)
    {
      if (QLog.isColorLevel()) {
        QLog.d(TAG + ID, 2, "draw(): No animation");
      }
      return;
    }
    if (mSupportGlobalPause) {
      if (!sPaused)
      {
        executeNewTask(l1);
        if ((mPlayAudioFrame) && (mOption != null) && (!mOption.ignore_audio)) {
          startPlayAudio();
        }
      }
    }
    for (;;)
    {
      l2 = System.currentTimeMillis() - l2;
      if ((!QLog.isColorLevel()) || ((!debug) && (l2 <= TIME_BASE))) {
        break;
      }
      QLog.d(TAG + ID, 2, "<======draw() end, cost: " + l2 + " ms, drawCost:" + l1);
      return;
      if (!mIsInPendingAction)
      {
        sPendingActions.add(new WeakReference(this));
        mIsInPendingAction = true;
        continue;
        executeNewTask(l1);
        if ((mPlayAudioFrame) && (mOption != null) && (!mOption.ignore_audio)) {
          startPlayAudio();
        }
      }
    }
  }
  
  protected void executeNewTask(long paramLong)
  {
    if (mDecodeNextFrameEnd)
    {
      mDecodeNextFrameEnd = false;
      mVideoDecodeFinish = false;
      l2 = 0L;
      l1 = l2;
      if (drawTime > refreshTime)
      {
        l1 = l2;
        if (refreshTime != -1L) {
          l1 = drawTime - refreshTime;
        }
      }
      if (mVideoFrameDuration < 0)
      {
        k = mAVDecode.videoParam.fps_den;
        m = mAVDecode.videoParam.fps_num;
        j = 0;
        if (m > 0)
        {
          i = k * 1000 / m;
          f = m / k;
          if (QLog.isColorLevel()) {
            QLog.d(TAG + ID, 1, "executeNewTask(), fps_den = " + k + ",fps_num = " + m + ",fpsDuration = " + i + ",fps = " + f);
          }
          j = i;
          if (mOption.wantedFps != 0.0F)
          {
            j = i;
            if (mOption.wantedFps >= f / 2.0F)
            {
              j = i;
              if (mOption.wantedFps <= f)
              {
                i = (int)(1000.0F / mOption.wantedFps);
                j = i;
                if (QLog.isColorLevel())
                {
                  QLog.d(TAG + ID, 1, "executeNewTask(), mOption.wantedFps = " + mOption.wantedFps + ",fpsDuration = " + i + ",fps = " + f + ",mVideoParams.mRequestedFPS = " + mVideoParams.mRequestedFPS);
                  j = i;
                }
              }
            }
          }
          if (j <= 0) {
            break label777;
          }
          mVideoFrameDuration = j;
          if (QLog.isColorLevel()) {
            QLog.e(TAG + ID, 1, "executeNewTask(),1 mVideoFrameDuration = " + mVideoFrameDuration);
          }
          if (1 == 0) {
            break label982;
          }
          l2 = l1;
          if (l1 > 100L) {
            l2 = 100L;
          }
          l3 = paramLong + l2;
          l1 = l3;
          if (l3 >= mVideoFrameDuration)
          {
            if ((QLog.isColorLevel()) && (debug)) {
              QLog.e(TAG + ID, 1, "executeNewTask(), overhead:" + l3 + ", >= frameDuration");
            }
            l1 = mVideoFrameDuration;
          }
          l3 = SystemClock.uptimeMillis() + mVideoFrameDuration - l1;
          l1 = l2;
          l2 = l3;
        }
      }
    }
    label777:
    label982:
    while (!QLog.isColorLevel()) {
      try
      {
        for (;;)
        {
          long l2;
          long l1;
          int k;
          int m;
          int j;
          float f;
          long l3;
          Utils.executeAsyncTaskOnSerialExcuter(new NativeDecodeFrameTask(l2), (Void[])null);
          if ((QLog.isColorLevel()) && (debug)) {
            QLog.d(TAG + ID, 2, "executeNewTask(), duration: " + mVideoFrameDuration + ", drawCost: " + paramLong + ",refreshCost:" + l1 + ",sync:" + true);
          }
          return;
          int i = j;
          if (QLog.isColorLevel())
          {
            QLog.e(TAG + ID, 1, "executeNewTask(), error!!  mAVDecode.videoParam.fps_num = " + mAVDecode.videoParam.fps_num + ", srcFilePath = " + mSrcVideoFile);
            i = j;
            continue;
            if (mAVDecode.videoParam.duration > 0)
            {
              mVideoFrameDuration = mAVDecode.videoParam.duration;
              if (QLog.isColorLevel()) {
                QLog.e(TAG + ID, 1, "executeNewTask(),2 mVideoFrameDuration = " + mVideoFrameDuration);
              }
            }
            else
            {
              mVideoFrameDuration = 50;
              QLog.e(TAG, 1, "executeNewTask(), error... mVideoFrameDuration: " + mVideoFrameDuration + ", mAVDecode.videoParam.duration " + mAVDecode.videoParam.duration + ", fpsDuration: " + j);
              continue;
              if ((mAVDecode != null) && (mAVDecode.videoParam != null) && (mAVDecode.videoParam.duration > 0) && (mVideoFrameDuration != mAVDecode.videoParam.duration))
              {
                continue;
                l2 = SystemClock.uptimeMillis() + mVideoFrameDuration;
              }
            }
          }
        }
      }
      catch (RejectedExecutionException localRejectedExecutionException)
      {
        for (;;)
        {
          QLog.e(TAG + ID, 1, "executeNewTask()", localRejectedExecutionException);
        }
      }
    }
    QLog.e(TAG + ID, 1, "executeNewTask(): mDecodeNextFrameEnd false");
  }
  
  protected void finalize()
    throws Throwable
  {
    if (sReleaseHandler != null) {
      sReleaseHandler.post(new ReleaseTask(mAVDecode));
    }
  }
  
  @TargetApi(12)
  public int getByteSize()
  {
    return (int)(0L + Utils.getBitmapSize(mCurFrameBitmap) + Utils.getBitmapSize(mCurFrameBitmapBuffer) + Utils.getBitmapSize(mFirstFrameBitmap));
  }
  
  Rect getFrameSize(File paramFile)
  {
    paramFile = new Rect();
    if (mAVDecode != null)
    {
      paramFile.set(0, 0, mAVDecode.videoParam.width, mAVDecode.videoParam.height);
      return paramFile;
    }
    paramFile.set(0, 0, 200, 200);
    return paramFile;
  }
  
  public int getHeight()
  {
    if (mCurFrameBitmap != null) {
      return mCurFrameBitmap.getHeight();
    }
    return 0;
  }
  
  protected boolean getNextFrame()
  {
    for (;;)
    {
      try
      {
        long l = System.currentTimeMillis();
        try
        {
          localAbstractAVDecode = mAVDecode;
          i = videoParam.width;
          j = videoParam.height;
        }
        catch (OutOfMemoryError localOutOfMemoryError)
        {
          synchronized (mAudioLock)
          {
            AbstractAVDecode localAbstractAVDecode;
            int i;
            int j;
            Bitmap localBitmap;
            mVideoDecodeFinish = true;
            mAudioLock.notifyAll();
            sImageIndex += 1;
            bool = true;
            continue;
            localObject3 = finally;
            throw localObject3;
            localOutOfMemoryError = localOutOfMemoryError;
            if (!QLog.isColorLevel()) {
              continue;
            }
            showOOM("mFirstFrameBitmap");
            QLog.e(TAG + ID, 1, "getNextFrame()", localOutOfMemoryError);
            bool = false;
          }
        }
        try
        {
          if ((i == mReqWidth) && (j == mReqHeight))
          {
            localAbstractAVDecode.seekToNextFrame(mCurFrameBitmapBuffer);
            i = videoParam.frame_index;
            if ((i == 1) && (mlastVideoFrameIndex > i))
            {
              mPlayRepeatCount += 1;
              if (mListener != null) {
                mListener.onPlayRepeat(mPlayRepeatCount);
              }
            }
            mlastVideoFrameIndex = i;
            sImageIndex += 1;
            bool = true;
            mCount.addAndGet(1);
            l = System.currentTimeMillis() - l;
            if ((QLog.isColorLevel()) && ((debug) || (l > TIME_BASE) || (!bool))) {
              QLog.d(TAG + ID, 2, "getNextFrame(): cost=" + l + "ms, index=" + mCount.get() + ", ret=" + bool);
            }
            return bool;
          }
          localBitmap = Bitmap.createBitmap(i, j, Bitmap.Config.ARGB_8888);
          localAbstractAVDecode.seekToNextFrame(localBitmap);
          mCurFrameBitmapBuffer = Bitmap.createScaledBitmap(localBitmap, mReqWidth, mReqHeight, true);
          continue;
          mVideoDecodeFinish = true;
        }
        catch (AVideoException localAVideoException)
        {
          if (QLog.isColorLevel()) {
            QLog.d(TAG + ID, 2, "seekToNextFrame, exception:" + localAVideoException);
          }
          if (mErrCode != -110) {
            break label662;
          }
        }
        if (QLog.isColorLevel()) {
          QLog.d(TAG + ID, 2, "seekToNextFrame, VideoDecode End....");
        }
        if (!mPlayAudioOnceFinished)
        {
          mPlayAudioOnceFinished = true;
          ??? = mVideoParams;
          mPlayAudioFrame = false;
          mPlayAudioFrame = false;
          mOption.ignore_audio = true;
          sUIHandler.post(new Runnable()
          {
            public void run()
            {
              if (mPlayOnceListener != null)
              {
                mPlayOnceListener.onFinish();
                mPlayOnceListener = null;
                if (QLog.isColorLevel()) {
                  QLog.e(NativeVideoImage.TAG, 2, "getNextFrame(), mPlayOnceListener.onFinish()");
                }
              }
            }
          });
        }
        if (mVideoParams.mPlayAudioFrame) {
          synchronized (mLock)
          {
            if (sReleaseHandler != null) {
              sReleaseHandler.post(new ReleaseTask(mAVDecode));
            }
            mAVDecode = AVDecodeFactory.newDecode(mOption);
          }
        }
        if (sReleaseHandler == null) {
          break label640;
        }
      }
      finally {}
      sReleaseHandler.post(new ReleaseTask(mAVDecode));
      label640:
      mOption.cycle = true;
      mAVDecode = AVDecodeFactory.newDecode(mOption);
      continue;
      label662:
      boolean bool = false;
    }
  }
  
  public int getWidth()
  {
    if (mCurFrameBitmap != null) {
      return mCurFrameBitmap.getWidth();
    }
    return 0;
  }
  
  void init(boolean paramBoolean)
  {
    boolean bool = false;
    if (sVideoEngineAvaliable) {}
    try
    {
      mCurFrameBitmapBuffer = Bitmap.createBitmap(mReqWidth, mReqHeight, mCurrentConfig);
    }
    catch (OutOfMemoryError localOutOfMemoryError3)
    {
      try
      {
        if (mRotation != 0)
        {
          mCurFrameBitmap = Bitmap.createBitmap(mReqHeight, mReqWidth, mCurrentConfig);
          if (QLog.isColorLevel())
          {
            String str = TAG + ID;
            StringBuilder localStringBuilder = new StringBuilder().append("use mCurFrameBitmapBuffer: ");
            if (mCurFrameBitmapBuffer != null) {
              bool = true;
            }
            QLog.d(str, 2, bool);
          }
          getNextFrame();
          applyNextFrame();
          if (!paramBoolean) {}
        }
      }
      catch (OutOfMemoryError localOutOfMemoryError3)
      {
        try
        {
          do
          {
            for (;;)
            {
              mFirstFrameBitmap = mCurFrameBitmap.copy(mCurFrameBitmap.getConfig(), false);
              return;
              localOutOfMemoryError1 = localOutOfMemoryError1;
              if (QLog.isColorLevel()) {
                showOOM("create mCurFrameBitmapBuffer");
              }
              if (mCurrentConfig == Bitmap.Config.ARGB_8888)
              {
                try
                {
                  mCurrentConfig = Bitmap.Config.RGB_565;
                  mCurFrameBitmapBuffer = Bitmap.createBitmap(mReqWidth, mReqHeight, mCurrentConfig);
                }
                catch (OutOfMemoryError localOutOfMemoryError2)
                {
                  if (QLog.isColorLevel()) {
                    showOOM("create mCurFrameBitmapBuffer");
                  }
                  URLDrawable.clearMemoryCache();
                  mCurFrameBitmapBuffer = Bitmap.createBitmap(mReqWidth, mReqHeight, mCurrentConfig);
                }
              }
              else
              {
                URLDrawable.clearMemoryCache();
                mCurFrameBitmapBuffer = Bitmap.createBitmap(mReqWidth, mReqHeight, mCurrentConfig);
                continue;
                mCurFrameBitmap = Bitmap.createBitmap(mReqWidth, mReqHeight, mCurrentConfig);
              }
            }
            localOutOfMemoryError3 = localOutOfMemoryError3;
          } while (!QLog.isColorLevel());
          showOOM("create mCurFrameBitmap");
        }
        catch (OutOfMemoryError localOutOfMemoryError4)
        {
          while (!QLog.isColorLevel()) {}
          showOOM("create mFirstFrameBitmap");
        }
      }
    }
  }
  
  void initAudioTrack()
  {
    if (mAVDecode.audioParam.channels <= 1) {}
    int m;
    for (int j = 2;; j = 3)
    {
      m = mAVDecode.audioParam.sample_rate;
      if (m > 0) {
        break;
      }
      if (QLog.isColorLevel()) {
        QLog.e(TAG + ID, 2, "initAudioTrack(), sampleRateInHz=" + m + ", <= 0, return...");
      }
      return;
    }
    int k = AudioTrack.getMinBufferSize(m, j, 2);
    int i = k;
    if (k < 1024)
    {
      if (QLog.isColorLevel()) {
        QLog.d(TAG + ID, 2, "initAudioTrack(), minBufSize=" + k + " < 1024, so mutiply 2");
      }
      k *= 2;
      i = k;
      if (k < 1024) {
        i = 1024;
      }
    }
    k = i * 2;
    if (QLog.isColorLevel()) {
      QLog.d(TAG + ID, 2, "initAudioTrack(): cost=channelConfig: " + j + ", sampleRateInHz: " + m + ", minBufSize: " + i + ", primePlaySize: " + k);
    }
    mAudioTrack = new AudioTrack(3, m, j, 2, k, 1);
  }
  
  public boolean isAudioPlaying()
  {
    return mPlayAudioFrame;
  }
  
  public void resetAndPlayAudioOnce()
  {
    if (QLog.isColorLevel()) {
      QLog.d(TAG, 2, "resetAndPlayAudioOnce >>>");
    }
    mPlayAudioOnceFinished = false;
    Object localObject = mVideoParams;
    mPlayAudioFrame = true;
    mPlayAudioFrame = true;
    localObject = mOption;
    boolean bool;
    if (!mPlayAudioFrame) {
      bool = true;
    }
    for (;;)
    {
      ignore_audio = bool;
      mOption.cycle = false;
      try
      {
        mAVDecode.resetVideoPlayer(mOption);
        reDraw();
        return;
        bool = false;
      }
      catch (AVideoException localAVideoException)
      {
        for (;;)
        {
          QLog.e(TAG, 1, "AVideoException happens resetAndPlayAudioOnce...", localAVideoException);
        }
      }
    }
  }
  
  public void showOOM(final String paramString)
  {
    sUIHandler.post(new Runnable()
    {
      public void run()
      {
        Toast.makeText(BaseApplication.getContext(), "[NativeVideoImage]OOM:" + paramString, 0).show();
      }
    });
  }
  
  void startPlayAudio()
  {
    if ((mPlayAudioThread == null) || (mAudioThreadFinish))
    {
      mPlayAudioThread = new PlayAudioThread("AudioPlayThread");
      mPlayAudioThread.start();
      AudioUtils.requesetAudioFoucus();
    }
  }
  
  public void stopPlayAudio()
  {
    if (QLog.isColorLevel()) {
      QLog.d(TAG + ID, 2, "stopPlayAudio()");
    }
    mPlayAudioFrame = false;
  }
  
  public static class DoAccumulativeRunnable
    extends ArgumentsRunnable<WeakReference<NativeVideoImage.WrappedRefreshImg>>
  {
    public int delay = 0;
    long lastRefreshTime = 0L;
    
    public DoAccumulativeRunnable() {}
    
    protected void run(List<WeakReference<NativeVideoImage.WrappedRefreshImg>> paramList)
    {
      paramList = paramList.iterator();
      while (paramList.hasNext())
      {
        Object localObject = (WeakReference)paramList.next();
        if (localObject != null)
        {
          localObject = (NativeVideoImage.WrappedRefreshImg)((WeakReference)localObject).get();
          if (localObject != null) {
            img.doApplyNextFrame(refeshId);
          }
        }
      }
      lastRefreshTime = SystemClock.uptimeMillis();
    }
    
    protected void submit()
    {
      long l1 = SystemClock.uptimeMillis();
      if ((lastRefreshTime == 0L) || (l1 - lastRefreshTime >= delay))
      {
        run();
        lastRefreshTime = l1;
        return;
      }
      long l2 = delay;
      long l3 = lastRefreshTime;
      NativeVideoImage.sUIHandler.postDelayed(this, l2 - (l1 - l3));
    }
  }
  
  class NativeDecodeFrameTask
    extends AsyncTask<Void, Void, Void>
  {
    final long mNextFrameTime;
    
    public NativeDecodeFrameTask(long paramLong)
    {
      mNextFrameTime = paramLong;
    }
    
    protected Void doInBackground(Void... paramVarArgs)
    {
      long l;
      if (getNextFrame())
      {
        l = SystemClock.uptimeMillis();
        paramVarArgs = new NativeVideoImage.RefreshJob(NativeVideoImage.this, mCount.get());
        if (l < mNextFrameTime)
        {
          NativeVideoImage.sUIHandler.postDelayed(paramVarArgs, mNextFrameTime - l);
          mDataReport.onVideoFrameDroped(false, -1);
          if ((QLog.isColorLevel()) && (debug)) {
            QLog.d(NativeVideoImage.TAG + ID, 2, "after getFrame, now < mNextFrameTime, delay:" + (mNextFrameTime - l) + "ms, index=" + mCount.get());
          }
        }
      }
      for (;;)
      {
        return null;
        NativeVideoImage.sUIHandler.post(paramVarArgs);
        mDataReport.onVideoFrameDroped(true, (int)(l - mNextFrameTime));
        if (QLog.isColorLevel())
        {
          QLog.w(NativeVideoImage.TAG + ID, 2, "after getFrame, now > mNextFrameTime, delayedTime=" + (l - mNextFrameTime) + "ms, index=" + mCount.get());
          continue;
          mDecodeNextFrameEnd = true;
          QLog.e(NativeVideoImage.TAG + ID, 1, "after getFrame, return false ");
        }
      }
    }
  }
  
  class PlayAudioThread
    extends Thread
  {
    public PlayAudioThread(String paramString)
    {
      setName(paramString + "-" + getId());
    }
    
    public void run()
    {
      try
      {
        NativeVideoImage.access$302(NativeVideoImage.this, false);
        if (mAudioTrack == null) {
          initAudioTrack();
        }
        if (mAudioTrack == null)
        {
          if (QLog.isColorLevel()) {
            QLog.e(NativeVideoImage.TAG_AUDIO, 2, "PlayAudioThread id=" + getId() + "mAudioTrack == null, return.. ");
          }
          if (mAudioTrack == null) {}
        }
      }
      catch (Exception localException1) {}finally
      {
        for (;;)
        {
          label112:
          label437:
          label587:
          if (mAudioTrack != null) {}
          try
          {
            mAudioTrack.stop();
            mAudioTrack.release();
            localObject3 = NativeVideoImage.this;
          }
          catch (IllegalStateException localIllegalStateException1)
          {
            for (;;)
            {
              QLog.e(NativeVideoImage.TAG_AUDIO, 1, "PlayAudioThread run ", localIllegalStateException1);
              mAudioTrack.release();
              localNativeVideoImage1 = NativeVideoImage.this;
            }
          }
          finally
          {
            mAudioTrack.release();
            mAudioTrack = null;
          }
          mAudioTrack = null;
          AudioUtils.abandonAudioFoucus();
          NativeVideoImage.access$302(NativeVideoImage.this, true);
          if (QLog.isColorLevel()) {
            QLog.d(NativeVideoImage.TAG_AUDIO, 2, "PlayAudioThread run over");
          }
          throw localObject12;
          i = 0;
          continue;
          NativeVideoImage.access$602(NativeVideoImage.this, i);
          continue;
          l1 = i;
          try
          {
            Thread.sleep(l1);
          }
          catch (InterruptedException localInterruptedException)
          {
            localInterruptedException.printStackTrace();
          }
          continue;
          label995:
          synchronized (mAudioLock)
          {
            while (!mVideoDecodeFinish)
            {
              if (QLog.isColorLevel()) {
                QLog.e(NativeVideoImage.TAG_AUDIO, 2, "AudioDecode begin to wait....");
              }
              mAudioLock.wait();
              if (QLog.isColorLevel()) {
                QLog.e(NativeVideoImage.TAG_AUDIO, 2, "AudioDecode finish wait....");
              }
            }
          }
        }
      }
      try
      {
        mAudioTrack.stop();
        mAudioTrack.release();
        ??? = NativeVideoImage.this;
      }
      catch (IllegalStateException localIllegalStateException3)
      {
        QLog.e(NativeVideoImage.TAG_AUDIO, 1, "PlayAudioThread run ", localIllegalStateException3);
        mAudioTrack.release();
        localNativeVideoImage3 = NativeVideoImage.this;
        break label112;
      }
      finally
      {
        mAudioTrack.release();
        mAudioTrack = null;
      }
      mAudioTrack = null;
      AudioUtils.abandonAudioFoucus();
      NativeVideoImage.access$302(NativeVideoImage.this, true);
      if (QLog.isColorLevel()) {}
      for (??? = NativeVideoImage.TAG_AUDIO;; ??? = NativeVideoImage.TAG_AUDIO)
      {
        QLog.d((String)???, 2, "PlayAudioThread run over");
        do
        {
          return;
          mAudioTrack.play();
          do
          {
            try
            {
              synchronized (AbstractVideoImage.sPauseLock)
              {
                while (AbstractVideoImage.sPaused)
                {
                  boolean bool = mSupportGlobalPause;
                  if (!bool) {
                    break;
                  }
                  try
                  {
                    if (QLog.isColorLevel()) {
                      QLog.d(NativeVideoImage.TAG_AUDIO, 2, "PlayAudioThread id=" + getId() + "begin wait ===> ");
                    }
                    AudioUtils.abandonAudioFoucus();
                    AbstractVideoImage.sPauseLock.wait();
                    if (QLog.isColorLevel()) {
                      QLog.d(NativeVideoImage.TAG_AUDIO, 2, "PlayAudioThread id=" + getId() + " wait end <=== ");
                    }
                    AudioUtils.requesetAudioFoucus();
                  }
                  catch (Exception localException2) {}
                }
                if (mPlayAudioFrame) {
                  break label587;
                }
                if (QLog.isColorLevel()) {
                  QLog.i(NativeVideoImage.TAG_AUDIO, 2, "mPlayAudioFrame is false, so quit audio decode... ");
                }
                if (mAudioTrack != null) {}
                try
                {
                  mAudioTrack.stop();
                  mAudioTrack.release();
                  ??? = NativeVideoImage.this;
                }
                catch (IllegalStateException localIllegalStateException5)
                {
                  for (;;)
                  {
                    int i;
                    long l1;
                    AbstractAVDecode localAbstractAVDecode;
                    long l2;
                    long l3;
                    Object localObject3;
                    NativeVideoImage localNativeVideoImage1;
                    NativeVideoImage localNativeVideoImage2;
                    NativeVideoImage localNativeVideoImage3;
                    NativeVideoImage localNativeVideoImage4;
                    QLog.e(NativeVideoImage.TAG_AUDIO, 1, "PlayAudioThread run ", localIllegalStateException5);
                    mAudioTrack.release();
                    NativeVideoImage localNativeVideoImage5 = NativeVideoImage.this;
                  }
                }
                finally
                {
                  mAudioTrack.release();
                  mAudioTrack = null;
                }
                mAudioTrack = null;
                AudioUtils.abandonAudioFoucus();
                NativeVideoImage.access$302(NativeVideoImage.this, true);
                if (!QLog.isColorLevel()) {
                  break;
                }
                ??? = NativeVideoImage.TAG_AUDIO;
              }
              if (i == -116) {
                break label437;
              }
            }
            catch (AVideoException localAVideoException)
            {
              if ((QLog.isColorLevel()) && (debug)) {
                QLog.i(NativeVideoImage.TAG_AUDIO, 2, "seekToNextAudioFrame ", localAVideoException);
              }
              i = mErrCode;
            }
          } while (i != -110);
          if (QLog.isColorLevel()) {
            QLog.d(NativeVideoImage.TAG_AUDIO, 2, "seekToNextAudioFrame, AudioDecode end...");
          }
          if (mPlayAudioOnceFinished) {
            break label995;
          }
          mPlayAudioOnceFinished = true;
          ??? = mVideoParams;
          mPlayAudioFrame = false;
          mPlayAudioFrame = false;
          mOption.ignore_audio = true;
          NativeVideoImage.sUIHandler.post(new Runnable()
          {
            public void run()
            {
              if (mPlayOnceListener != null)
              {
                mPlayOnceListener.onFinish();
                mPlayOnceListener = null;
                if (QLog.isColorLevel()) {
                  QLog.e(NativeVideoImage.TAG_AUDIO, 2, "seekToNextAudioFrame, mPlayOnceListener.onFinish()");
                }
              }
            }
          });
          if (mAudioTrack != null) {}
          try
          {
            mAudioTrack.stop();
            mAudioTrack.release();
            ??? = NativeVideoImage.this;
          }
          catch (IllegalStateException localIllegalStateException4)
          {
            for (;;)
            {
              QLog.e(NativeVideoImage.TAG_AUDIO, 1, "PlayAudioThread run ", localIllegalStateException4);
              mAudioTrack.release();
              localNativeVideoImage4 = NativeVideoImage.this;
            }
          }
          finally
          {
            mAudioTrack.release();
            mAudioTrack = null;
          }
          mAudioTrack = null;
          AudioUtils.abandonAudioFoucus();
          NativeVideoImage.access$302(NativeVideoImage.this, true);
        } while (!QLog.isColorLevel());
      }
      if (QLog.isColorLevel()) {
        QLog.i(NativeVideoImage.TAG_AUDIO, 2, "seekToNextAudioFrame: before <<<=== ");
      }
      l1 = System.currentTimeMillis();
    }
  }
  
  class RefreshJob
    implements Runnable
  {
    int refreshId;
    
    public RefreshJob(int paramInt)
    {
      refreshId = paramInt;
    }
    
    public void run()
    {
      if ((QLog.isColorLevel()) && (debug)) {
        QLog.d(NativeVideoImage.TAG + ID, 2, "RefreshJob.run(): refreshId:" + refreshId);
      }
      NativeVideoImage.WrappedRefreshImg localWrappedRefreshImg = new NativeVideoImage.WrappedRefreshImg();
      img = NativeVideoImage.this;
      refeshId = refreshId;
      mAccumulativeRunnable.add(new WeakReference[] { new WeakReference(localWrappedRefreshImg) });
    }
  }
  
  static class ReleaseTask
    implements Runnable
  {
    AbstractAVDecode mDecoder;
    
    public ReleaseTask(AbstractAVDecode paramAbstractAVDecode)
    {
      mDecoder = paramAbstractAVDecode;
    }
    
    public void run()
    {
      if (mDecoder != null) {}
      try
      {
        mDecoder.close();
        mDecoder = null;
        if (QLog.isColorLevel()) {
          QLog.d(NativeVideoImage.TAG, 2, "..ReleaseTask close AVDecode..");
        }
        return;
      }
      catch (Throwable localThrowable) {}
    }
  }
  
  public static class WrappedRefreshImg
  {
    public AbstractVideoImage img;
    public int refeshId;
    
    public WrappedRefreshImg() {}
  }
}
