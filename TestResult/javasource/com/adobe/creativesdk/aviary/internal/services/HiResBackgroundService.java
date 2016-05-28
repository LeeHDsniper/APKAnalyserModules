package com.adobe.creativesdk.aviary.internal.services;

import android.content.Context;
import android.graphics.Bitmap.CompressFormat;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import com.adobe.creativesdk.aviary.internal.AdobeImageEditorController;
import com.adobe.creativesdk.aviary.internal.cds.Cds.Permission;
import com.adobe.creativesdk.aviary.internal.cds.CdsUtils;
import com.adobe.creativesdk.aviary.internal.headless.AdobeImageExecutionException;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaAction;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionFactory;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionList;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaHD;
import com.adobe.creativesdk.aviary.internal.headless.utils.CameraUtils;
import com.adobe.creativesdk.aviary.internal.headless.utils.MegaPixels;
import com.adobe.creativesdk.aviary.internal.utils.ImageInfo;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.log.LoggerFactory.LoggerType;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONException;

public final class HiResBackgroundService
  extends BaseContextService
{
  private final LoggerFactory.Logger logger = LoggerFactory.getLogger("HiResBackgroundService", LoggerFactory.LoggerType.ConsoleLoggerType);
  private final ProgressCounter mCounter = new ProgressCounter();
  private OnHiresListener mListener;
  private InternalHandler mServiceHandler;
  private volatile Looper mServiceLooper;
  private MoaHD moa;
  private boolean running;
  private final HandlerThread thread = new HandlerThread("hires-looper", 10);
  
  public HiResBackgroundService(AdobeImageEditorController paramAdobeImageEditorController)
  {
    super(paramAdobeImageEditorController);
    thread.start();
  }
  
  private void dispatchError(AdobeImageExecutionException paramAdobeImageExecutionException)
  {
    logger.error("dispatchError: %d", new Object[] { Integer.valueOf(paramAdobeImageExecutionException.getCode()) });
    paramAdobeImageExecutionException.printStackTrace();
    if (mListener != null)
    {
      mListener.onHiresError(paramAdobeImageExecutionException);
      return;
    }
    logger.warn("no listeners attached");
  }
  
  private void dispatchProgress(int paramInt1, int paramInt2)
  {
    logger.log("dispatchProgress: " + paramInt1 + "/" + paramInt2);
    if (mListener != null) {
      mListener.onHiresProgress(paramInt1, paramInt2);
    }
  }
  
  private void dispatchSaveComplete()
  {
    if (mListener != null) {
      mListener.onHiresComplete();
    }
  }
  
  private Context getActivityContext()
  {
    AdobeImageEditorController localAdobeImageEditorController = getContext();
    if (localAdobeImageEditorController == null) {
      return null;
    }
    return localAdobeImageEditorController.getBaseContext();
  }
  
  private void internalLoad(Uri paramUri, int paramInt, ImageInfo paramImageInfo)
  {
    logger.verbose("internalLoad, size: " + paramInt, new Object[0]);
    if (mServiceHandler != null)
    {
      removeAllMessages();
      mCounter.reset();
      int i = mCounter.index;
      Object localObject = mCounter;
      int j = total + 1;
      total = j;
      dispatchProgress(i, j);
      paramInt = Math.min(paramInt, MegaPixels.Mp30.ordinal());
      localObject = new Bundle();
      mCounter.toBundle((Bundle)localObject);
      Message localMessage = mServiceHandler.obtainMessage(1000);
      obj = paramUri;
      arg1 = paramInt;
      arg2 = paramImageInfo.getOrientation();
      localMessage.setData((Bundle)localObject);
      mServiceHandler.sendMessage(localMessage);
    }
  }
  
  private void quit()
  {
    logger.info("quit");
    running = false;
    if ((moa == null) || (moa.isLoaded())) {}
    try
    {
      moa.unload();
      moa.dispose();
      moa = null;
      mServiceLooper.quit();
      return;
    }
    catch (AdobeImageExecutionException localAdobeImageExecutionException)
    {
      for (;;) {}
    }
  }
  
  public void apply(MoaActionList paramMoaActionList)
  {
    logger.info("apply");
    if (mServiceHandler != null)
    {
      int i = mCounter.index;
      Object localObject = mCounter;
      int j = total + 1;
      total = j;
      dispatchProgress(i, j);
      localObject = new Bundle();
      mCounter.toBundle((Bundle)localObject);
      Message localMessage = mServiceHandler.obtainMessage(1001);
      obj = paramMoaActionList;
      localMessage.setData((Bundle)localObject);
      mServiceHandler.sendMessage(localMessage);
    }
  }
  
  public void apply(String paramString)
  {
    logger.info("apply(s)");
    if (mServiceHandler != null)
    {
      int i = mCounter.index;
      Object localObject = mCounter;
      int j = total + 1;
      total = j;
      dispatchProgress(i, j);
      localObject = new Bundle();
      mCounter.toBundle((Bundle)localObject);
      Message localMessage = mServiceHandler.obtainMessage(1001);
      obj = paramString;
      localMessage.setData((Bundle)localObject);
      mServiceHandler.sendMessage(localMessage);
    }
  }
  
  public void dispose()
  {
    logger.info("dispose");
    stop();
  }
  
  public boolean getHiresEnabled()
  {
    if (mServiceHandler != null) {
      return mServiceHandler.getHiresEnabled();
    }
    return false;
  }
  
  public boolean isRunning()
  {
    return running;
  }
  
  public void load(Uri paramUri, int paramInt, ImageInfo paramImageInfo)
  {
    logger.info("load: %s, maxSize: %d", new Object[] { paramUri, Integer.valueOf(paramInt) });
    internalLoad(paramUri, paramInt, paramImageInfo);
  }
  
  protected void removeAllMessages()
  {
    if (mServiceHandler != null)
    {
      mServiceHandler.removeMessages(1000);
      mServiceHandler.removeMessages(1003);
      mServiceHandler.removeMessages(1001);
    }
  }
  
  public void revert(Uri paramUri, int paramInt1, int paramInt2)
  {
    logger.info("revert: %s, maxSize: %d, orientation: %d", new Object[] { paramUri, Integer.valueOf(paramInt1), Integer.valueOf(paramInt2) });
    if (mServiceHandler != null)
    {
      removeAllMessages();
      mCounter.reset();
      int i = mCounter.index;
      Object localObject = mCounter;
      int j = total + 1;
      total = j;
      dispatchProgress(i, j);
      paramInt1 = Math.min(paramInt1, MegaPixels.Mp30.ordinal());
      localObject = new Bundle();
      mCounter.toBundle((Bundle)localObject);
      Message localMessage = mServiceHandler.obtainMessage(1003);
      obj = paramUri;
      arg1 = paramInt1;
      arg2 = paramInt2;
      localMessage.setData((Bundle)localObject);
      mServiceHandler.sendMessage(localMessage);
    }
  }
  
  public void save(String paramString, Bitmap.CompressFormat paramCompressFormat, int paramInt)
  {
    logger.info("save");
    if (mServiceHandler != null)
    {
      int i = mCounter.index;
      Object localObject = mCounter;
      int j = total + 1;
      total = j;
      dispatchProgress(i, j);
      localObject = new Bundle();
      mCounter.toBundle((Bundle)localObject);
      Message localMessage = mServiceHandler.obtainMessage(1002);
      obj = paramString;
      arg1 = paramCompressFormat.ordinal();
      arg2 = paramInt;
      localMessage.setData((Bundle)localObject);
      mServiceHandler.sendMessage(localMessage);
    }
  }
  
  public void setOnHiresListener(OnHiresListener paramOnHiresListener)
  {
    mListener = paramOnHiresListener;
  }
  
  public void start()
  {
    logger.info("start");
    if (!running)
    {
      mServiceLooper = thread.getLooper();
      mServiceHandler = new InternalHandler(mServiceLooper);
      running = true;
    }
  }
  
  public void stop()
  {
    logger.info("stop");
    removeAllMessages();
    if (mServiceHandler != null) {
      mServiceHandler.sendEmptyMessage(1999);
    }
  }
  
  private final class InternalHandler
    extends Handler
  {
    private AtomicBoolean mHiResEnabled = new AtomicBoolean(true);
    
    public InternalHandler(Looper paramLooper)
    {
      super();
    }
    
    private void handleActions(MoaActionList paramMoaActionList)
    {
      logger.verbose("InternalHandler::handleActions", new Object[0]);
      if (mHiResEnabled.get())
      {
        if ((moa != null) && (moa.isLoaded()) && (paramMoaActionList != null)) {
          try
          {
            moa.applyActions(paramMoaActionList);
            return;
          }
          catch (JSONException paramMoaActionList)
          {
            logger.error(paramMoaActionList.getMessage());
            paramMoaActionList.printStackTrace();
            return;
          }
          catch (NullPointerException paramMoaActionList)
          {
            logger.error(paramMoaActionList.getMessage());
            paramMoaActionList.printStackTrace();
            return;
          }
        }
        logger.warn("moa is not loaded..");
        return;
      }
      logger.warn("hires is not enabled, skipping actions..");
    }
    
    private void handleActions(String paramString)
    {
      logger.verbose("InternalHandler::handleActions(s)", new Object[0]);
      if (mHiResEnabled.get())
      {
        if ((moa != null) && (moa.isLoaded()) && (paramString != null)) {
          try
          {
            moa.applyActions(paramString);
            return;
          }
          catch (NullPointerException paramString)
          {
            logger.error(paramString.getMessage());
            paramString.printStackTrace();
            return;
          }
        }
        logger.warn("moa is not loaded..");
        return;
      }
      logger.warn("hires is not enabled, skipping actions..");
    }
    
    private void handleFile(Uri paramUri, int paramInt1, int paramInt2)
    {
      logger.verbose("InternalHandler::handleFile: %s, maxSize: %d, orientation: %d", new Object[] { paramUri, Integer.valueOf(paramInt1), Integer.valueOf(paramInt2) });
      paramUri = HiResBackgroundService.this.getActivityContext();
      if (paramUri == null)
      {
        logger.warn("Context is gone");
        return;
      }
      logger.verbose("orientation: " + paramInt2, new Object[0]);
      if (paramInt2 != 0)
      {
        logger.verbose("need to rotate the image", new Object[0]);
        handleRotate90(paramInt2);
      }
      paramInt2 = paramInt1;
      if (paramUri != null)
      {
        paramInt2 = paramInt1;
        if (!CdsUtils.getPermissions(paramUri).contains(Cds.Permission.hires.name())) {
          if (paramInt1 > 0)
          {
            paramInt2 = paramInt1;
            if (paramInt1 <= CameraUtils.getNormalMegaPixels().ordinal()) {}
          }
          else
          {
            logger.warn("overriding maxSize due to permissions constrains");
            paramInt2 = CameraUtils.getNormalMegaPixels().ordinal();
          }
        }
      }
      MegaPixels localMegaPixels = MegaPixels.Mp3;
      paramUri = localMegaPixels;
      if (paramInt2 >= 0)
      {
        paramUri = localMegaPixels;
        if (paramInt2 < MegaPixels.values().length) {
          paramUri = MegaPixels.values()[paramInt2];
        }
      }
      handleResize(paramUri.ordinal());
    }
    
    private void handleResize(int paramInt)
    {
      logger.verbose("InternalHandler::handleResize: " + paramInt, new Object[0]);
      if (mHiResEnabled.get())
      {
        if ((moa != null) && (moa.isLoaded()) && (paramInt > 0))
        {
          logger.verbose("need to resize to " + paramInt, new Object[0]);
          MoaActionList localMoaActionList = MoaActionFactory.actionList(new String[] { "resize" });
          MoaAction localMoaAction = localMoaActionList.get(0);
          localMoaAction.setValue("size", paramInt);
          localMoaAction.setValue("sizeInMegaPixels", true);
          handleActions(localMoaActionList);
        }
        return;
      }
      logger.warn("hires is not enabled, skipping resize");
    }
    
    private void handleRotate90(int paramInt)
    {
      logger.verbose("InternalHandler::handleRotate: " + paramInt, new Object[0]);
      if (mHiResEnabled.get())
      {
        if ((moa != null) && (moa.isLoaded()))
        {
          MoaActionList localMoaActionList = MoaActionFactory.actionList();
          if (paramInt != 0)
          {
            MoaAction localMoaAction = MoaActionFactory.action("rotate90");
            localMoaAction.setValue("angle", paramInt);
            localMoaActionList.add(localMoaAction);
          }
          if (localMoaActionList.size() > 0) {
            handleActions(localMoaActionList);
          }
        }
        return;
      }
      logger.warn("hires is not enabled, skipping rotate90");
    }
    
    /* Error */
    private void loadImage(Uri paramUri, int paramInt1, int paramInt2)
      throws AdobeImageExecutionException
    {
      // Byte code:
      //   0: iconst_0
      //   1: istore 4
      //   3: aload_0
      //   4: getfield 15	com/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler:this$0	Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;
      //   7: invokestatic 36	com/adobe/creativesdk/aviary/internal/services/HiResBackgroundService:access$000	(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
      //   10: ldc -21
      //   12: iconst_3
      //   13: anewarray 40	java/lang/Object
      //   16: dup
      //   17: iconst_0
      //   18: aload_1
      //   19: aastore
      //   20: dup
      //   21: iconst_1
      //   22: iload_2
      //   23: invokestatic 97	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
      //   26: aastore
      //   27: dup
      //   28: iconst_2
      //   29: iload_3
      //   30: invokestatic 97	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
      //   33: aastore
      //   34: invokeinterface 46 3 0
      //   39: iload_2
      //   40: ifle +6 -> 46
      //   43: iconst_1
      //   44: istore 4
      //   46: aload_0
      //   47: getfield 25	com/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler:mHiResEnabled	Ljava/util/concurrent/atomic/AtomicBoolean;
      //   50: iload 4
      //   52: invokevirtual 238	java/util/concurrent/atomic/AtomicBoolean:set	(Z)V
      //   55: aload_0
      //   56: getfield 15	com/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler:this$0	Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;
      //   59: invokestatic 54	com/adobe/creativesdk/aviary/internal/services/HiResBackgroundService:access$400	(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
      //   62: ifnonnull +31 -> 93
      //   65: aload_0
      //   66: getfield 15	com/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler:this$0	Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;
      //   69: new 56	com/adobe/creativesdk/aviary/internal/headless/moa/MoaHD
      //   72: dup
      //   73: invokespecial 239	com/adobe/creativesdk/aviary/internal/headless/moa/MoaHD:<init>	()V
      //   76: invokestatic 243	com/adobe/creativesdk/aviary/internal/services/HiResBackgroundService:access$402	(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
      //   79: pop
      //   80: aload_0
      //   81: getfield 15	com/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler:this$0	Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;
      //   84: invokestatic 54	com/adobe/creativesdk/aviary/internal/services/HiResBackgroundService:access$400	(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
      //   87: invokestatic 248	com/adobe/creativesdk/aviary/internal/utils/ApiHelper:isHiResOriginalAvailable	()Z
      //   90: invokevirtual 251	com/adobe/creativesdk/aviary/internal/headless/moa/MoaHD:setOriginalEnabled	(Z)V
      //   93: aload_0
      //   94: getfield 15	com/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler:this$0	Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;
      //   97: invokestatic 54	com/adobe/creativesdk/aviary/internal/services/HiResBackgroundService:access$400	(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
      //   100: invokevirtual 59	com/adobe/creativesdk/aviary/internal/headless/moa/MoaHD:isLoaded	()Z
      //   103: ifeq +13 -> 116
      //   106: aload_0
      //   107: getfield 15	com/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler:this$0	Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;
      //   110: invokestatic 54	com/adobe/creativesdk/aviary/internal/services/HiResBackgroundService:access$400	(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
      //   113: invokevirtual 254	com/adobe/creativesdk/aviary/internal/headless/moa/MoaHD:unload	()V
      //   116: aload_0
      //   117: getfield 15	com/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler:this$0	Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;
      //   120: invokestatic 101	com/adobe/creativesdk/aviary/internal/services/HiResBackgroundService:access$700	(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Landroid/content/Context;
      //   123: astore 5
      //   125: aload 5
      //   127: ifnonnull +18 -> 145
      //   130: aload_0
      //   131: getfield 15	com/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler:this$0	Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;
      //   134: invokestatic 36	com/adobe/creativesdk/aviary/internal/services/HiResBackgroundService:access$000	(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
      //   137: ldc 103
      //   139: invokeinterface 81 2 0
      //   144: return
      //   145: iload 4
      //   147: ifeq -3 -> 144
      //   150: aload 5
      //   152: aload_1
      //   153: invokestatic 260	com/adobe/creativesdk/aviary/internal/utils/IOUtils:getRealFilePath	(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;
      //   156: astore 6
      //   158: aload 6
      //   160: ifnull +36 -> 196
      //   163: aload_0
      //   164: getfield 15	com/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler:this$0	Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;
      //   167: invokestatic 54	com/adobe/creativesdk/aviary/internal/services/HiResBackgroundService:access$400	(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
      //   170: aload 6
      //   172: invokevirtual 263	com/adobe/creativesdk/aviary/internal/headless/moa/MoaHD:load	(Ljava/lang/String;)V
      //   175: aload_0
      //   176: getfield 15	com/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler:this$0	Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;
      //   179: invokestatic 54	com/adobe/creativesdk/aviary/internal/services/HiResBackgroundService:access$400	(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
      //   182: invokevirtual 59	com/adobe/creativesdk/aviary/internal/headless/moa/MoaHD:isLoaded	()Z
      //   185: ifeq -41 -> 144
      //   188: aload_0
      //   189: aload_1
      //   190: iload_2
      //   191: iload_3
      //   192: invokespecial 265	com/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler:handleFile	(Landroid/net/Uri;II)V
      //   195: return
      //   196: aload 5
      //   198: invokevirtual 271	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
      //   201: aload_1
      //   202: ldc_w 273
      //   205: invokevirtual 279	android/content/ContentResolver:openFileDescriptor	(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;
      //   208: astore 5
      //   210: aload 5
      //   212: ifnull -37 -> 175
      //   215: aload_0
      //   216: getfield 15	com/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler:this$0	Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;
      //   219: invokestatic 54	com/adobe/creativesdk/aviary/internal/services/HiResBackgroundService:access$400	(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
      //   222: aload 5
      //   224: invokevirtual 285	android/os/ParcelFileDescriptor:getFileDescriptor	()Ljava/io/FileDescriptor;
      //   227: invokevirtual 288	com/adobe/creativesdk/aviary/internal/headless/moa/MoaHD:load	(Ljava/io/FileDescriptor;)V
      //   230: aload 5
      //   232: invokestatic 292	com/adobe/creativesdk/aviary/internal/utils/IOUtils:closeSilently	(Landroid/os/ParcelFileDescriptor;)V
      //   235: goto -60 -> 175
      //   238: astore_1
      //   239: iconst_1
      //   240: invokestatic 296	com/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException:fromInt	(I)Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;
      //   243: athrow
      //   244: astore_1
      //   245: aload_1
      //   246: athrow
      //   247: astore_1
      //   248: bipush 8
      //   250: invokestatic 296	com/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException:fromInt	(I)Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;
      //   253: athrow
      //   254: astore 5
      //   256: goto -140 -> 116
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	259	0	this	InternalHandler
      //   0	259	1	paramUri	Uri
      //   0	259	2	paramInt1	int
      //   0	259	3	paramInt2	int
      //   1	145	4	bool	boolean
      //   123	108	5	localObject	Object
      //   254	1	5	localAdobeImageExecutionException	AdobeImageExecutionException
      //   156	15	6	str	String
      // Exception table:
      //   from	to	target	type
      //   196	210	238	java/lang/Exception
      //   215	230	244	com/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException
      //   215	230	247	java/lang/Exception
      //   106	116	254	com/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException
    }
    
    private void saveImage(String paramString, int paramInt1, int paramInt2)
      throws AdobeImageExecutionException
    {
      logger.verbose("InternalHandler::saveImage: %s, format: %d, quality: %d ", new Object[] { paramString, Integer.valueOf(paramInt1), Integer.valueOf(paramInt2) });
      if (mHiResEnabled.get())
      {
        if (!moa.isLoaded()) {
          throw AdobeImageExecutionException.fromInt(3);
        }
        Bitmap.CompressFormat localCompressFormat2 = Bitmap.CompressFormat.JPEG;
        Bitmap.CompressFormat localCompressFormat1 = localCompressFormat2;
        if (paramInt1 >= 0)
        {
          localCompressFormat1 = localCompressFormat2;
          if (paramInt1 < Bitmap.CompressFormat.values().length) {
            localCompressFormat1 = Bitmap.CompressFormat.values()[paramInt1];
          }
        }
        moa.save(paramString, paramInt2, localCompressFormat1);
        return;
      }
      logger.warn("hires is not enabled, skipping save");
    }
    
    public boolean getHiresEnabled()
    {
      return mHiResEnabled.get();
    }
    
    public void handleMessage(Message paramMessage)
    {
      super.handleMessage(paramMessage);
      logger.log("handleMessage: " + what);
      Object localObject = paramMessage.getData();
      int i;
      if ((localObject != null) && (((Bundle)localObject).getLong("counter_id", 0L) == mCounter.getId()))
      {
        localObject = HiResBackgroundService.this;
        HiResBackgroundService.ProgressCounter localProgressCounter = mCounter;
        i = index + 1;
        index = i;
        ((HiResBackgroundService)localObject).dispatchProgress(i, mCounter.total);
      }
      int j;
      switch (what)
      {
      default: 
      case 1000: 
      case 1003: 
        do
        {
          do
          {
            return;
            localObject = (Uri)obj;
            try
            {
              loadImage((Uri)localObject, arg1, arg2);
              return;
            }
            catch (AdobeImageExecutionException paramMessage)
            {
              HiResBackgroundService.this.dispatchError(paramMessage);
              return;
            }
          } while (!moa.isLoaded());
          j = 0;
          i = j;
          if (moa.getOriginalEnabled()) {}
          try
          {
            moa.revert();
            if (arg2 != 0) {
              handleRotate90(arg2);
            }
            handleResize(arg1);
            i = 1;
          }
          catch (AdobeImageExecutionException localAdobeImageExecutionException)
          {
            for (;;)
            {
              localAdobeImageExecutionException.printStackTrace();
              i = j;
            }
          }
        } while (i != 0);
        localObject = (Uri)obj;
        try
        {
          loadImage((Uri)localObject, arg1, arg2);
          return;
        }
        catch (AdobeImageExecutionException paramMessage)
        {
          HiResBackgroundService.this.dispatchError(paramMessage);
          return;
        }
      case 1001: 
        if ((obj instanceof String))
        {
          handleActions((String)obj);
          return;
        }
        handleActions((MoaActionList)obj);
        return;
      case 1999: 
        HiResBackgroundService.this.quit();
        return;
      }
      try
      {
        i = arg1;
        j = arg2;
        saveImage((String)obj, i, j);
        HiResBackgroundService.this.dispatchSaveComplete();
        return;
      }
      catch (AdobeImageExecutionException paramMessage)
      {
        logger.error("handled save error: %s", new Object[] { paramMessage });
        HiResBackgroundService.this.dispatchError(paramMessage);
      }
    }
  }
  
  public static abstract interface OnHiresListener
  {
    public abstract void onHiresComplete();
    
    public abstract void onHiresError(AdobeImageExecutionException paramAdobeImageExecutionException);
    
    public abstract void onHiresProgress(int paramInt1, int paramInt2);
  }
  
  private static class ProgressCounter
  {
    private long id = 0L;
    int index = 0;
    int total = 0;
    
    public ProgressCounter() {}
    
    public long getId()
    {
      try
      {
        long l = id;
        return l;
      }
      finally {}
    }
    
    public void reset()
    {
      try
      {
        id += 1L;
        index = 0;
        total = 0;
        return;
      }
      finally {}
    }
    
    void toBundle(Bundle paramBundle)
    {
      paramBundle.putLong("counter_id", id);
      paramBundle.putInt("counter_index", index);
      paramBundle.putInt("counter_total", total);
    }
  }
}
