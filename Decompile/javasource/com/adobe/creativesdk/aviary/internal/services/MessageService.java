package com.adobe.creativesdk.aviary.internal.services;

import android.content.ContentResolver;
import android.content.Context;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import com.adobe.creativesdk.aviary.internal.AdobeImageEditorController;
import com.adobe.creativesdk.aviary.internal.cds.Cds.ContentType;
import com.adobe.creativesdk.aviary.internal.cds.Cds.MessageType;
import com.adobe.creativesdk.aviary.internal.cds.CdsDownloaderFactory;
import com.adobe.creativesdk.aviary.internal.cds.CdsDownloaderFactory.Downloader;
import com.adobe.creativesdk.aviary.internal.cds.MessageContentColumn.MessageContentCursorWrapper;
import com.adobe.creativesdk.aviary.internal.events.MessageReceivedEvent;
import com.adobe.creativesdk.aviary.internal.threading.Future;
import com.adobe.creativesdk.aviary.internal.threading.FutureListener;
import com.adobe.creativesdk.aviary.internal.threading.ThreadPool.Job;
import com.adobe.creativesdk.aviary.internal.threading.ThreadPool.Worker;
import com.adobe.creativesdk.aviary.internal.utils.IOUtils;
import com.adobe.creativesdk.aviary.internal.utils.PackageManagerUtils;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.utils.EventBusUtils;
import com.adobe.creativesdk.aviary.utils.SharedPreferencesUtils;
import de.greenrobot.event.EventBus;
import java.io.File;
import java.util.Locale;

public class MessageService
  extends BaseContextService
{
  private boolean mDownloadInProgress;
  private boolean mEnabled;
  private final FutureListener<String> mFutureListener = new FutureListener()
  {
    public void onFutureDone(Future<String> paramAnonymousFuture)
    {
      logger.info("onFutureDone");
      try
      {
        MessageService.this.handleActiveMessage();
        return;
      }
      catch (Throwable paramAnonymousFuture)
      {
        paramAnonymousFuture.printStackTrace();
      }
    }
  };
  
  public MessageService(AdobeImageEditorController paramAdobeImageEditorController)
  {
    super(paramAdobeImageEditorController);
  }
  
  private void downloadNextMessage()
  {
    logger.info("downloadNextMessage");
    if (getContext() == null) {}
    ThreadPoolService localThreadPoolService;
    do
    {
      return;
      localThreadPoolService = (ThreadPoolService)getContext().getService(ThreadPoolService.class);
    } while (localThreadPoolService == null);
    localThreadPoolService.submit(new ThreadPool.Job()
    {
      public String run(ThreadPool.Worker<Context, String> paramAnonymousWorker, Context... paramAnonymousVarArgs)
        throws Exception
      {
        Context localContext = paramAnonymousVarArgs[0];
        if (localContext == null) {
          return null;
        }
        Cursor localCursor = localContext.getContentResolver().query(PackageManagerUtils.getCDSProviderContentUri(localContext, "message/future/" + Cds.MessageType.LAUNCH.toString().toLowerCase(Locale.US)), null, null, null, null);
        paramAnonymousWorker = null;
        paramAnonymousVarArgs = null;
        if (localCursor != null) {
          paramAnonymousWorker = paramAnonymousVarArgs;
        }
        for (;;)
        {
          try
          {
            if (localCursor.moveToNext())
            {
              paramAnonymousWorker = MessageContentColumn.MessageContentCursorWrapper.create(localCursor);
              if (paramAnonymousWorker == null) {
                break;
              }
              str = paramAnonymousWorker.getContentPath();
              bool = TextUtils.isEmpty(str);
              if (!bool) {
                continue;
              }
            }
            IOUtils.closeSilently(localCursor);
            if (paramAnonymousWorker == null) {
              break label199;
            }
            paramAnonymousVarArgs = CdsDownloaderFactory.create(Cds.ContentType.MESSAGE);
            if (paramAnonymousVarArgs == null) {
              break label199;
            }
          }
          finally
          {
            String str;
            boolean bool;
            IOUtils.closeSilently(localCursor);
          }
          try
          {
            logger.log("downloading message... %s", new Object[] { paramAnonymousWorker.getContentIdentifier() });
            paramAnonymousWorker = paramAnonymousVarArgs.download(localContext, paramAnonymousWorker.getMessageId());
            return paramAnonymousWorker;
          }
          catch (Throwable paramAnonymousWorker)
          {
            paramAnonymousWorker.printStackTrace();
          }
          bool = new File(str).exists();
          if (bool) {
            break;
          }
        }
        label199:
        return null;
      }
    }, mFutureListener, new Context[] { getBaseContext() });
  }
  
  private Context getBaseContext()
  {
    if (getContext() != null) {
      return getContext().getBaseContext();
    }
    return null;
  }
  
  private boolean handleActiveMessage()
  {
    logger.info("handleActiveMessage");
    Object localObject4 = getBaseContext();
    if (localObject4 == null)
    {
      logger.error("context is null");
      return false;
    }
    if ((!mEnabled) || (!isActive()))
    {
      logger.warn("enabled: %b, active: %b", new Object[] { Boolean.valueOf(mEnabled), Boolean.valueOf(isActive()) });
      return false;
    }
    Object localObject1 = null;
    Object localObject3 = null;
    localObject4 = ((Context)localObject4).getContentResolver().query(PackageManagerUtils.getCDSProviderContentUri((Context)localObject4, "message/future/" + Cds.MessageType.LAUNCH.toString().toLowerCase(Locale.US)), null, null, null, null);
    if (localObject4 != null) {
      localObject1 = localObject3;
    }
    try
    {
      if (((Cursor)localObject4).moveToFirst()) {
        localObject1 = MessageContentColumn.MessageContentCursorWrapper.create((Cursor)localObject4);
      }
      IOUtils.closeSilently((Cursor)localObject4);
      if (localObject1 == null) {
        break label380;
      }
      logger.log("found active message: %s", new Object[] { ((MessageContentColumn.MessageContentCursorWrapper)localObject1).getContentIdentifier() });
      localObject3 = ((MessageContentColumn.MessageContentCursorWrapper)localObject1).getContentPath();
      logger.log("content path: %s", new Object[] { localObject3 });
      if (localObject3 == null) {
        break label378;
      }
      localObject3 = new File((String)localObject3);
      logger.verbose("file exists: %b", new Object[] { Boolean.valueOf(((File)localObject3).exists()) });
      if (getBaseContext() == null) {
        break label378;
      }
      int i = getBaseContextgetResourcesgetDisplayMetricsdensityDpi;
      localObject4 = new BitmapFactory.Options();
      inScaled = true;
      inTargetDensity = i;
      inDensity = 240;
      inJustDecodeBounds = true;
      BitmapFactory.decodeFile(((File)localObject3).getAbsolutePath(), (BitmapFactory.Options)localObject4);
      i = outWidth;
      int j = outHeight;
      if (((File)localObject3).exists())
      {
        showMessage((MessageContentColumn.MessageContentCursorWrapper)localObject1, i, j);
        return true;
      }
    }
    finally
    {
      IOUtils.closeSilently((Cursor)localObject4);
    }
    logger.warn("file doesn't exist!");
    for (;;)
    {
      label378:
      return false;
      label380:
      logger.warn("no active messages");
    }
  }
  
  private void showMessage(MessageContentColumn.MessageContentCursorWrapper paramMessageContentCursorWrapper, int paramInt1, int paramInt2)
  {
    logger.info("showMessage: " + paramMessageContentCursorWrapper.getContentIdentifier());
    logger.verbose("bitmap size: %dx%d", new Object[] { Integer.valueOf(paramInt1), Integer.valueOf(paramInt2) });
    Bundle localBundle = new Bundle();
    localBundle.putString("android.intent.extra.TITLE", paramMessageContentCursorWrapper.getTitle());
    localBundle.putString("android.intent.extra.TEXT", paramMessageContentCursorWrapper.getParagraph());
    localBundle.putString("uri", paramMessageContentCursorWrapper.getContentIdentifier());
    localBundle.putString("header_file", paramMessageContentCursorWrapper.getContentPath());
    localBundle.putString("action_button", paramMessageContentCursorWrapper.getActionButtonText());
    localBundle.putString("dismiss_button", paramMessageContentCursorWrapper.getDismissButtonText());
    localBundle.putString("layout_style", paramMessageContentCursorWrapper.getLayoutStyle());
    localBundle.putBoolean("show_new_banner", paramMessageContentCursorWrapper.isShowNewBanner());
    localBundle.putLong("message_id", paramMessageContentCursorWrapper.getMessageId());
    localBundle.putLong("message_content_id", paramMessageContentCursorWrapper.getId());
    localBundle.putInt("message_bitmap_width", paramInt1);
    localBundle.putInt("message_bitmap_height", paramInt2);
    logger.error("need to dispatch the message!!!!");
    if ((mEnabled) && (getContext() != null) && (isActive())) {
      EventBusUtils.getInstance().post(new MessageReceivedEvent(localBundle));
    }
  }
  
  private void showNextMessage()
  {
    logger.info("showNextMessage");
    Context localContext = getBaseContext();
    if ((localContext == null) || (!isActive())) {
      logger.error("context is null or not active");
    }
    do
    {
      return;
      if (!SharedPreferencesUtils.getInstance(localContext).getBoolean("aviary.messages.enabled", true))
      {
        logger.log("messages disabled by user, skipping");
        return;
      }
      if (handleActiveMessage())
      {
        logger.log("handleActiveMessage is handling the message. stopping");
        return;
      }
    } while (mDownloadInProgress);
    mDownloadInProgress = true;
    downloadNextMessage();
  }
  
  public void dispose()
  {
    logger.info("dispose");
    mEnabled = false;
  }
  
  public void processMessages()
  {
    logger.info("processMessages");
    mEnabled = true;
    showNextMessage();
  }
}
