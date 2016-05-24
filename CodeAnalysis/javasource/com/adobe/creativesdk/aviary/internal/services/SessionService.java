package com.adobe.creativesdk.aviary.internal.services;

import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import com.adobe.creativesdk.aviary.internal.AdobeImageEditorController;
import com.adobe.creativesdk.aviary.internal.content.SessionDatabaseHelper;
import com.adobe.creativesdk.aviary.internal.content.SessionDatabaseHelper.ActionWrapper;
import com.adobe.creativesdk.aviary.internal.content.SessionDatabaseHelper.SessionWrapper;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionList;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaJavaUndo;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaJavaUndo.MoaUndoBitmap;
import com.adobe.creativesdk.aviary.internal.utils.ApiHelper;
import com.adobe.creativesdk.aviary.internal.utils.ImageInfo;
import com.adobe.creativesdk.aviary.internal.vo.EditToolResultVO;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;

public class SessionService
  extends BaseContextService
{
  SessionDatabaseHelper mDatabase;
  private SessionServiceHandler mInternalHandler;
  private Looper mLooper;
  private HandlerThread mThread;
  private boolean mUndoEnabled = ApiHelper.isUndoRedoAvailable();
  MoaJavaUndo moaJavaUndo;
  private boolean running;
  
  public SessionService(AdobeImageEditorController paramAdobeImageEditorController)
  {
    super(paramAdobeImageEditorController);
    logger.verbose("undoEnabled: %b", new Object[] { Boolean.valueOf(mUndoEnabled) });
    mThread = new HandlerThread("session-service-thread", 10);
    mThread.start();
    moaJavaUndo = new MoaJavaUndo(mUndoEnabled);
    mDatabase = new SessionDatabaseHelper(paramAdobeImageEditorController.getBaseContext());
  }
  
  private void removeAllMessages()
  {
    logger.info("removeAllMessages");
    mInternalHandler.removeCallbacksAndMessages(null);
  }
  
  private void removeMessages(int... paramVarArgs)
  {
    int j = paramVarArgs.length;
    int i = 0;
    while (i < j)
    {
      int k = paramVarArgs[i];
      logger.verbose("removeMessage: %d", new Object[] { Integer.valueOf(k) });
      mInternalHandler.removeMessages(k);
      i += 1;
    }
  }
  
  private void stop()
  {
    moaJavaUndo.dispose();
    removeAllMessages();
    mInternalHandler.sendEmptyMessage(1);
    running = false;
  }
  
  public boolean canRedo()
  {
    return (getEnabled()) && (moaJavaUndo.canRedo());
  }
  
  public boolean canUndo()
  {
    return (getEnabled()) && (moaJavaUndo.canUndo());
  }
  
  public void dispose()
  {
    stop();
  }
  
  public boolean getEnabled()
  {
    return mUndoEnabled;
  }
  
  public boolean isRunning()
  {
    return running;
  }
  
  public void load(Bitmap paramBitmap, int paramInt, ImageInfo paramImageInfo)
  {
    logger.info("load");
    if (!running) {
      return;
    }
    long l1 = 0L;
    if (getEnabled())
    {
      long l2 = moaJavaUndo.load(paramBitmap);
      l1 = l2;
      if (l2 <= 0L)
      {
        logger.error("failed to load bitmap, we have to disable session.service");
        setEnabled(false);
        l1 = l2;
      }
    }
    logger.verbose("result: %d", new Object[] { Long.valueOf(l1) });
    if (getEnabled())
    {
      removeAllMessages();
      paramBitmap = Message.obtain(mInternalHandler, 2);
      Bundle localBundle = new Bundle();
      localBundle.putLong("ptr", l1);
      localBundle.putInt("bundle-megapixels", paramInt);
      localBundle.putParcelable("bundle-image-info", paramImageInfo);
      paramBitmap.setData(localBundle);
      paramBitmap.sendToTarget();
      return;
    }
    mInternalHandler.hiResLoad(paramImageInfo, paramInt);
  }
  
  public void push(Bitmap paramBitmap, EditToolResultVO paramEditToolResultVO)
  {
    logger.info("push: %s", new Object[] { paramEditToolResultVO.getActionList() });
    if (!running) {}
    long l;
    do
    {
      return;
      if (!getEnabled()) {
        break;
      }
      l = moaJavaUndo.push(paramBitmap);
      logger.verbose("result: 0x%x", new Object[] { Long.valueOf(l) });
    } while (l <= 0L);
    paramBitmap = new Bundle();
    paramBitmap.putLong("ptr", l);
    paramBitmap.putSerializable("bundle-actions", paramEditToolResultVO.getActionList());
    paramEditToolResultVO = Message.obtain(mInternalHandler, 3);
    paramEditToolResultVO.setData(paramBitmap);
    paramEditToolResultVO.sendToTarget();
    return;
    mInternalHandler.hiresApplyActions(paramEditToolResultVO.getActionList());
  }
  
  public Bitmap redo()
  {
    if (!running) {}
    MoaJavaUndo.MoaUndoBitmap localMoaUndoBitmap;
    do
    {
      do
      {
        return null;
      } while (!getEnabled());
      localMoaUndoBitmap = moaJavaUndo.redo();
      logger.info("redo result: %s", new Object[] { localMoaUndoBitmap });
    } while (localMoaUndoBitmap == null);
    Bundle localBundle = new Bundle();
    localBundle.putLong("ptr", ptr);
    Message localMessage = Message.obtain(mInternalHandler, 6);
    localMessage.setData(localBundle);
    localMessage.sendToTarget();
    return bitmap;
  }
  
  public void save(String paramString, Bitmap.CompressFormat paramCompressFormat, int paramInt)
  {
    logger.info("save");
    if (!running) {
      return;
    }
    if (getEnabled())
    {
      mInternalHandler.removeMessages(9);
      Bundle localBundle = new Bundle();
      localBundle.putString("path", paramString);
      localBundle.putSerializable("compress-format", paramCompressFormat);
      localBundle.putInt("quality", paramInt);
      paramString = Message.obtain(mInternalHandler, 9);
      paramString.setData(localBundle);
      paramString.sendToTarget();
      return;
    }
    mInternalHandler.hiresSave(paramString, paramCompressFormat, paramInt);
  }
  
  void setEnabled(boolean paramBoolean)
  {
    mUndoEnabled = paramBoolean;
  }
  
  public void start()
  {
    if (!running)
    {
      running = true;
      mLooper = mThread.getLooper();
      mInternalHandler = new SessionServiceHandler(mLooper);
      HiResBackgroundService localHiResBackgroundService = (HiResBackgroundService)getService(HiResBackgroundService.class);
      if ((localHiResBackgroundService != null) && (!localHiResBackgroundService.isRunning())) {
        localHiResBackgroundService.start();
      }
    }
  }
  
  public Bitmap undo()
  {
    if (!running) {}
    MoaJavaUndo.MoaUndoBitmap localMoaUndoBitmap;
    do
    {
      do
      {
        return null;
      } while (!getEnabled());
      localMoaUndoBitmap = moaJavaUndo.undo();
      logger.info("undo result: %s", new Object[] { localMoaUndoBitmap });
    } while (localMoaUndoBitmap == null);
    removeMessages(new int[] { 5, 7 });
    Bundle localBundle = new Bundle();
    localBundle.putLong("ptr", ptr);
    Message localMessage = Message.obtain(mInternalHandler, 5);
    localMessage.setData(localBundle);
    localMessage.sendToTarget();
    return bitmap;
  }
  
  private final class SessionServiceHandler
    extends Handler
  {
    final LoggerFactory.Logger logger = LoggerFactory.getLogger("SessionService-Handler");
    private long mCurrentActionId = -1L;
    private long mLastActionId = -1L;
    private long mSessionId = -1L;
    
    public SessionServiceHandler(Looper paramLooper)
    {
      super();
    }
    
    private void handleLoad(Message paramMessage)
    {
      logger.info("handleLoad");
      if (mSessionId > -1L)
      {
        mDatabase.deleteSession(mSessionId);
        mSessionId = -1L;
        mLastActionId = -1L;
        mCurrentActionId = -1L;
      }
      paramMessage = paramMessage.getData();
      if (paramMessage != null)
      {
        long l = paramMessage.getLong("ptr");
        int i = paramMessage.getInt("bundle-megapixels");
        paramMessage = (ImageInfo)paramMessage.getParcelable("bundle-image-info");
        mSessionId = mDatabase.load(paramMessage.getUri().toString(), i, paramMessage.getOrientation());
        mLastActionId = -1L;
        mCurrentActionId = -1L;
        if (mSessionId > -1L)
        {
          mLastActionId = mDatabase.push(mSessionId, l, null);
          mCurrentActionId = mLastActionId;
        }
        hiResLoad(paramMessage, i);
        invokeReplayActions(mSessionId);
      }
    }
    
    private void handlePush(Message paramMessage)
    {
      boolean bool = false;
      logger.info("handlePush");
      paramMessage = paramMessage.getData();
      if ((mSessionId > -1L) && (paramMessage != null))
      {
        if (mLastActionId != -1L) {
          mDatabase.deleteActionsFrom(mSessionId, mLastActionId);
        }
        l = paramMessage.getLong("ptr");
        paramMessage = (MoaActionList)paramMessage.getSerializable("bundle-actions");
        mLastActionId = mDatabase.push(mSessionId, l, paramMessage);
        invokeReplayActions(mSessionId);
        return;
      }
      LoggerFactory.Logger localLogger = logger;
      long l = mSessionId;
      if (paramMessage == null) {
        bool = true;
      }
      localLogger.error("handlePush failed. mSessionId: %d, data is null? %b", new Object[] { Long.valueOf(l), Boolean.valueOf(bool) });
    }
    
    private void handleRedo(Message paramMessage)
    {
      logger.info("handleRedo");
      paramMessage = paramMessage.getData();
      if ((mSessionId > -1L) && (paramMessage != null))
      {
        long l = paramMessage.getLong("ptr", -1L);
        mLastActionId = mDatabase.findActionByBitmap(mSessionId, l);
        logger.verbose("action: %d", new Object[] { Long.valueOf(mLastActionId) });
        invokeReplayActions(mSessionId);
      }
    }
    
    private void handleReplayActions(Message paramMessage)
    {
      logger.info("handleReplayActions");
      paramMessage = paramMessage.getData();
      long l;
      if ((paramMessage != null) && (mSessionId > -1L))
      {
        l = paramMessage.getLong("session-id", -1L);
        if (l == mSessionId)
        {
          logger.verbose("mCurrentAction: %d, mLastAction: %d", new Object[] { Long.valueOf(mCurrentActionId), Long.valueOf(mLastActionId) });
          if (mCurrentActionId != -1L) {
            break label108;
          }
          logger.warn("mCurrentActionId = -1. stop");
        }
      }
      return;
      label108:
      if (mLastActionId == -1L)
      {
        logger.warn("mLastActionId = -1. stop");
        return;
      }
      if (mCurrentActionId >= mLastActionId)
      {
        logger.warn("mCurrentActionId >= mLastActionId");
        return;
      }
      paramMessage = mDatabase.findActionGreaterThan(l, mCurrentActionId);
      logger.verbose("action: %s", new Object[] { paramMessage });
      if (paramMessage != null)
      {
        HiResBackgroundService localHiResBackgroundService = (HiResBackgroundService)getService(HiResBackgroundService.class);
        if ((localHiResBackgroundService != null) && (localHiResBackgroundService.isRunning())) {
          localHiResBackgroundService.apply(actions);
        }
      }
      mCurrentActionId = id;
      invokeReplayActions(l);
    }
    
    private void handleRevert(Message paramMessage)
    {
      logger.info("handleRevert");
      paramMessage = paramMessage.getData();
      long l;
      if ((mSessionId > -1L) && (paramMessage != null))
      {
        l = paramMessage.getLong("ptr", -1L);
        if (l > -1L)
        {
          mDatabase.deleteActions(mSessionId);
          mLastActionId = mDatabase.push(mSessionId, l, null);
          mCurrentActionId = mLastActionId;
          logger.verbose("mCurrentActionId: %d", new Object[] { Long.valueOf(mCurrentActionId) });
        }
        paramMessage = mDatabase.findSession(mSessionId);
        if (paramMessage == null) {
          break label169;
        }
        hiresRevert(data, megapixels, orientation);
      }
      for (;;)
      {
        if (l > -1L) {
          invokeReplayActions(mSessionId);
        }
        return;
        label169:
        logger.error("failed to revert. Session is null");
      }
    }
    
    private void handleSave(Message paramMessage)
    {
      logger.info("handleSave");
      Object localObject = paramMessage.getData();
      if ((mSessionId > -1L) && (localObject != null))
      {
        if (hasPendingMessages())
        {
          logger.warn("Other messages pending... append the message at the end of the queue...");
          localObject = Message.obtain(mInternalHandler);
          ((Message)localObject).copyFrom(paramMessage);
          ((Message)localObject).sendToTarget();
        }
      }
      else {
        return;
      }
      hiresSave(((Bundle)localObject).getString("path"), (Bitmap.CompressFormat)((Bundle)localObject).getSerializable("compress-format"), ((Bundle)localObject).getInt("quality"));
    }
    
    private void handleStop(Message paramMessage)
    {
      logger.info("handleStop");
    }
    
    private void handleUndo(Message paramMessage)
    {
      logger.info("handleUndo");
      paramMessage = paramMessage.getData();
      if ((mSessionId > -1L) && (paramMessage != null))
      {
        long l = paramMessage.getLong("ptr", -1L);
        mCurrentActionId = -1L;
        mLastActionId = mDatabase.findActionByBitmap(mSessionId, l);
        if (mLastActionId > -1L)
        {
          paramMessage = mDatabase.findActionGreaterThan(mSessionId, -1L);
          if (paramMessage != null) {
            mCurrentActionId = id;
          }
          paramMessage = Message.obtain(this, 8);
          paramMessage.setData(new Bundle());
          paramMessage.sendToTarget();
          invokeReplayActions(mSessionId);
        }
        logger.verbose("mCurrentActionId: %d, mLastActionId: %d", new Object[] { Long.valueOf(mCurrentActionId), Long.valueOf(mLastActionId) });
      }
    }
    
    private boolean hasPendingMessages()
    {
      if (hasMessages(1)) {}
      while ((hasMessages(2)) || (hasMessages(3)) || (hasMessages(4)) || (hasMessages(5)) || (hasMessages(6)) || (hasMessages(7)) || (hasMessages(8)) || (hasMessages(9))) {
        return true;
      }
      return false;
    }
    
    private void invokeReplayActions(long paramLong)
    {
      Message localMessage = Message.obtain(this, 7);
      Bundle localBundle = new Bundle();
      localBundle.putLong("session-id", paramLong);
      localMessage.setData(localBundle);
      localMessage.sendToTarget();
    }
    
    public void handleMessage(Message paramMessage)
    {
      switch (what)
      {
      default: 
      case 2: 
      case 8: 
      case 3: 
      case 9: 
      case 7: 
      case 4: 
        do
        {
          return;
          handleLoad(paramMessage);
          return;
          handleRevert(paramMessage);
          return;
          handlePush(paramMessage);
          return;
          handleSave(paramMessage);
          return;
          handleReplayActions(paramMessage);
          return;
        } while (mSessionId <= -1L);
        mDatabase.deleteActions(mSessionId);
        return;
      case 5: 
        handleUndo(paramMessage);
        return;
      case 6: 
        handleRedo(paramMessage);
        return;
      }
      handleStop(paramMessage);
    }
    
    void hiResLoad(ImageInfo paramImageInfo, int paramInt)
    {
      logger.info("hiresLoad");
      HiResBackgroundService localHiResBackgroundService = (HiResBackgroundService)getService(HiResBackgroundService.class);
      if ((localHiResBackgroundService != null) && (localHiResBackgroundService.isRunning())) {
        localHiResBackgroundService.load(paramImageInfo.getUri(), paramInt, paramImageInfo);
      }
    }
    
    void hiresApplyActions(MoaActionList paramMoaActionList)
    {
      logger.info("hiresApplyActions");
      if (paramMoaActionList != null)
      {
        HiResBackgroundService localHiResBackgroundService = (HiResBackgroundService)getService(HiResBackgroundService.class);
        if ((localHiResBackgroundService != null) && (localHiResBackgroundService.isRunning())) {
          localHiResBackgroundService.apply(paramMoaActionList);
        }
      }
    }
    
    void hiresRevert(Uri paramUri, int paramInt1, int paramInt2)
    {
      logger.info("hiresRevert");
      HiResBackgroundService localHiResBackgroundService = (HiResBackgroundService)getService(HiResBackgroundService.class);
      if ((localHiResBackgroundService != null) && (localHiResBackgroundService.isRunning())) {
        localHiResBackgroundService.revert(paramUri, paramInt1, paramInt2);
      }
    }
    
    void hiresSave(String paramString, Bitmap.CompressFormat paramCompressFormat, int paramInt)
    {
      logger.info("hiresSave");
      HiResBackgroundService localHiResBackgroundService = (HiResBackgroundService)getService(HiResBackgroundService.class);
      if ((localHiResBackgroundService != null) && (localHiResBackgroundService.isRunning())) {
        localHiResBackgroundService.save(paramString, paramCompressFormat, paramInt);
      }
    }
  }
}
