package com.adobe.creativesdk.aviary.internal.cds;

import android.content.ContentProviderOperation;
import android.content.ContentProviderOperation.Builder;
import android.content.ContentProviderResult;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.OperationApplicationException;
import android.net.Uri;
import android.os.Bundle;
import android.os.RemoteException;
import android.text.TextUtils;
import com.adobe.creativesdk.aviary.internal.cds.json.CdsManifestParser;
import com.adobe.creativesdk.aviary.internal.cds.json.CdsManifestParser.ManifestPackItem;
import com.adobe.creativesdk.aviary.internal.cds.json.CdsMessageContentParser;
import com.adobe.creativesdk.aviary.internal.threading.ThreadPool;
import com.adobe.creativesdk.aviary.internal.threading.ThreadPool.Job;
import com.adobe.creativesdk.aviary.internal.threading.ThreadPool.Worker;
import com.adobe.creativesdk.aviary.internal.utils.DateTimeUtils;
import com.adobe.creativesdk.aviary.internal.utils.PackageManagerUtils;
import com.adobe.creativesdk.aviary.internal.utils.SystemUtils;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;
import junit.framework.Assert;
import org.json.JSONException;

public final class CdsManifestMessagesConsumer
{
  static LoggerFactory.Logger logger = LoggerFactory.getLogger("CdsManifestMessagesConsumer");
  private final Context mContext;
  private final boolean mDebug;
  private final List<Throwable> mExceptions;
  private final AtomicInteger mLocks;
  private final CdsManifestParser mManifestParser;
  private final String mServerRoot;
  private final ThreadPool mThreadPool;
  private final boolean mWifiOnly;
  
  private CdsManifestMessagesConsumer(Context paramContext, boolean paramBoolean, ThreadPool paramThreadPool, CdsManifestParser paramCdsManifestParser)
  {
    mWifiOnly = paramBoolean;
    mContext = paramContext;
    mThreadPool = paramThreadPool;
    mLocks = new AtomicInteger(0);
    mServerRoot = CdsServiceParamsUtils.getInstance().getServerUrl(mContext);
    mDebug = CdsServiceParamsUtils.getInstance().isDebug(mContext);
    mManifestParser = paramCdsManifestParser;
    mExceptions = new ArrayList();
  }
  
  private void consumeMessage(CdsManifestParser.ManifestPackItem paramManifestPackItem, String paramString)
  {
    logger.log("checking message: %s", new Object[] { paramManifestPackItem.getIdentifier() });
    ??? = CdsUtils.getMessageByIdentifier(mContext, paramManifestPackItem.getIdentifier(), new String[] { "msg_id", "msg_identifier", "msg_versionKey" });
    if (??? == null) {
      paramString = consumeNewMessage(paramManifestPackItem, paramString);
    }
    while (paramString != null) {
      synchronized (mLocks)
      {
        mLocks.incrementAndGet();
        mThreadPool.submit(paramString, null, new String[] { paramManifestPackItem.getVersionKey() });
        return;
        paramString = consumeOldMessage(paramManifestPackItem, (MessageColumns.MessageCursorWrapper)???, paramString);
      }
    }
    logger.warn("job is null");
  }
  
  private ThreadPool.Job<String, Object> consumeNewMessage(CdsManifestParser.ManifestPackItem paramManifestPackItem, final String paramString)
  {
    new ThreadPool.Job()
    {
      public Object run(ThreadPool.Worker arg1, String[] paramAnonymousArrayOfString)
        throws Exception
      {
        try
        {
          ??? = (CdsMessageContentParser)new CdsManifestMessageContentDownloader(mServerRoot, mDebug).download(mContext, paramAnonymousArrayOfString[0], mWifiOnly);
          CdsManifestMessagesConsumer.this.insertNewMessageFromJson(???, paramString);
          synchronized (mLocks)
          {
            mLocks.decrementAndGet();
            mLocks.notifyAll();
          }
          return null;
        }
        catch (Throwable ???)
        {
          mExceptions.add(???);
          ???.printStackTrace();
          CdsManifestMessagesConsumer.logger.error(???.getMessage());
          synchronized (mLocks)
          {
            mLocks.decrementAndGet();
            mLocks.notifyAll();
          }
        }
        finally
        {
          synchronized (mLocks)
          {
            mLocks.decrementAndGet();
            mLocks.notifyAll();
            throw paramAnonymousArrayOfString;
          }
        }
      }
    };
  }
  
  private ThreadPool.Job<String, Object> consumeOldMessage(CdsManifestParser.ManifestPackItem paramManifestPackItem, final MessageColumns.MessageCursorWrapper paramMessageCursorWrapper, final String paramString)
  {
    if ((paramManifestPackItem == null) || (paramMessageCursorWrapper == null)) {}
    while ((TextUtils.isEmpty(paramMessageCursorWrapper.getVersionKey())) || (paramMessageCursorWrapper.getVersionKey().equals(paramManifestPackItem.getVersionKey()))) {
      return null;
    }
    logger.log("need to update the message: %s", new Object[] { paramMessageCursorWrapper.getIdentifier() });
    new ThreadPool.Job()
    {
      public Object run(ThreadPool.Worker<String, Object> arg1, String... paramAnonymousVarArgs)
        throws Exception
      {
        try
        {
          ??? = (CdsMessageContentParser)new CdsManifestMessageContentDownloader(mServerRoot, mDebug).download(mContext, paramAnonymousVarArgs[0], mWifiOnly);
          CdsManifestMessagesConsumer.this.updateMessageFromJson(???, paramMessageCursorWrapper, paramString);
          synchronized (mLocks)
          {
            mLocks.decrementAndGet();
            mLocks.notifyAll();
          }
          return null;
        }
        catch (Throwable ???)
        {
          mExceptions.add(???);
          ???.printStackTrace();
          CdsManifestMessagesConsumer.logger.error(???.getMessage());
          synchronized (mLocks)
          {
            mLocks.decrementAndGet();
            mLocks.notifyAll();
          }
        }
        finally
        {
          synchronized (mLocks)
          {
            mLocks.decrementAndGet();
            mLocks.notifyAll();
            throw paramAnonymousVarArgs;
          }
        }
      }
    };
  }
  
  private void insertNewMessageFromJson(CdsMessageContentParser paramCdsMessageContentParser, String paramString)
    throws JSONException, IOException, AssertionError
  {
    SystemUtils.throwIfUiThread();
    Assert.assertNotNull("Invalid message type", paramString);
    Assert.assertNotNull("CdsMessageContentParser is null", paramCdsMessageContentParser);
    long l1 = paramCdsMessageContentParser.getBeginDate();
    long l2 = paramCdsMessageContentParser.getEndDate();
    if (l2 < System.currentTimeMillis())
    {
      logger.warn("message already expired. Skipping..");
      logger.verbose("beginDate: %d, endDate: %d", new Object[] { Long.valueOf(l1), Long.valueOf(l2) });
    }
    while (CdsUtils.getMessageByIdentifier(mContext, paramCdsMessageContentParser.getIdentifier(), new String[] { "msg_id" }) != null) {
      return;
    }
    ContentValues localContentValues1 = new ContentValues();
    localContentValues1.put("msg_identifier", paramCdsMessageContentParser.getIdentifier());
    localContentValues1.put("msg_versionKey", paramCdsMessageContentParser.getVersionKey());
    localContentValues1.put("msg_type", paramString);
    ContentValues localContentValues2 = new ContentValues();
    int i;
    if (paramCdsMessageContentParser.isSplitButton())
    {
      paramString = paramCdsMessageContentParser.getActionButtonText();
      localContentValues2.put("msgcnt_actionButton", paramString);
      localContentValues2.put("msgcnt_beginDate", DateTimeUtils.toSqlDateTime(paramCdsMessageContentParser.getBeginDate()));
      localContentValues2.put("msgcnt_contentIdentifier", paramCdsMessageContentParser.getContentIdentifier());
      localContentValues2.put("msgcnt_contentURL", mManifestParser.getAssetsBaseURL() + paramCdsMessageContentParser.getContentURL());
      localContentValues2.put("msgcnt_dismissButton", paramCdsMessageContentParser.getDismissButtonText());
      localContentValues2.put("msgcnt_endDate", DateTimeUtils.toSqlDateTime(paramCdsMessageContentParser.getEndDate()));
      localContentValues2.put("msgcnt_layoutStyle", paramCdsMessageContentParser.getLayoutStyle());
      localContentValues2.put("msgcnt_paragraph", paramCdsMessageContentParser.getParagraph());
      if (!paramCdsMessageContentParser.isShowNewBanner()) {
        break label391;
      }
      i = 1;
      label292:
      localContentValues2.put("msgcnt_showNewBanner", Integer.valueOf(i));
      localContentValues2.put("msgcnt_title", paramCdsMessageContentParser.getTitle());
      i = mContext.getContentResolver().bulkInsert(PackageManagerUtils.getCDSProviderContentUri(mContext, "bulk/insertMessageAndContent"), new ContentValues[] { localContentValues1, localContentValues2 });
      if (i <= 0) {
        break label396;
      }
    }
    label391:
    label396:
    for (boolean bool = true;; bool = false)
    {
      Assert.assertTrue(bool);
      logger.verbose("added new message with id: %d", new Object[] { Integer.valueOf(i) });
      return;
      paramString = null;
      break;
      i = 0;
      break label292;
    }
  }
  
  private void updateMessageFromJson(CdsMessageContentParser paramCdsMessageContentParser, MessageColumns.MessageCursorWrapper paramMessageCursorWrapper, String paramString)
    throws JSONException, IOException, AssertionError, RemoteException, OperationApplicationException
  {
    Assert.assertNotNull(paramCdsMessageContentParser);
    Assert.assertNotNull(paramMessageCursorWrapper);
    Assert.assertNotNull(paramString);
    if (paramCdsMessageContentParser.getVersionKey().equals(paramMessageCursorWrapper.getVersionKey()))
    {
      logger.warn("versionKey identical");
      return;
    }
    MessageColumns.MessageCursorWrapper localMessageCursorWrapper = CdsUtils.getMessageByIdentifier(mContext, paramCdsMessageContentParser.getIdentifier(), new String[] { "msg_id" });
    label137:
    int i;
    if (localMessageCursorWrapper != null)
    {
      bool = true;
      Assert.assertTrue("currentMessageContent is null", bool);
      ContentValues localContentValues1 = new ContentValues();
      localContentValues1.put("msg_identifier", paramCdsMessageContentParser.getIdentifier());
      localContentValues1.put("msg_versionKey", paramCdsMessageContentParser.getVersionKey());
      localContentValues1.put("msg_type", paramString);
      ContentValues localContentValues2 = new ContentValues();
      if (!paramCdsMessageContentParser.isSplitButton()) {
        break label614;
      }
      paramString = paramCdsMessageContentParser.getActionButtonText();
      localContentValues2.put("msgcnt_actionButton", paramString);
      localContentValues2.put("msgcnt_beginDate", DateTimeUtils.toSqlDateTime(paramCdsMessageContentParser.getBeginDate()));
      localContentValues2.put("msgcnt_contentIdentifier", paramCdsMessageContentParser.getContentIdentifier());
      localContentValues2.put("msgcnt_contentURL", mManifestParser.getAssetsBaseURL() + paramCdsMessageContentParser.getContentURL());
      localContentValues2.put("msgcnt_dismissButton", paramCdsMessageContentParser.getDismissButtonText());
      localContentValues2.put("msgcnt_endDate", DateTimeUtils.toSqlDateTime(paramCdsMessageContentParser.getEndDate()));
      localContentValues2.put("msgcnt_layoutStyle", paramCdsMessageContentParser.getLayoutStyle());
      localContentValues2.put("msgcnt_paragraph", paramCdsMessageContentParser.getParagraph());
      if (!paramCdsMessageContentParser.isShowNewBanner()) {
        break label619;
      }
      i = 1;
      label269:
      localContentValues2.put("msgcnt_showNewBanner", Integer.valueOf(i));
      localContentValues2.put("msgcnt_title", paramCdsMessageContentParser.getTitle());
      paramCdsMessageContentParser = new Bundle();
      paramCdsMessageContentParser.putLong("messageId", paramMessageCursorWrapper.getId());
      paramCdsMessageContentParser.putLong("messageContentId", localMessageCursorWrapper.getId());
      paramCdsMessageContentParser.putParcelable("messageValues", localContentValues1);
      paramCdsMessageContentParser.putParcelable("messageContentValues", localContentValues2);
      paramCdsMessageContentParser = new ArrayList();
      paramCdsMessageContentParser.add(ContentProviderOperation.newUpdate(PackageManagerUtils.getCDSProviderContentUri(mContext, "message/id/" + paramMessageCursorWrapper.getId() + "/update")).withValues(localContentValues1).build());
      paramCdsMessageContentParser.add(ContentProviderOperation.newUpdate(PackageManagerUtils.getCDSProviderContentUri(mContext, "message/id/" + paramMessageCursorWrapper.getId() + "/content/id/" + localMessageCursorWrapper.getId() + "/update")).withValues(localContentValues2).build());
      paramString = PackageManagerUtils.getCDSProviderContentUri(mContext, null);
      logger.log("authority: %s - %s", new Object[] { paramString, paramString.getAuthority() });
      paramCdsMessageContentParser = mContext.getContentResolver().applyBatch(paramString.getAuthority(), paramCdsMessageContentParser);
      Assert.assertNotNull("batch result is null", paramCdsMessageContentParser);
      if (paramCdsMessageContentParser.length != 2) {
        break label625;
      }
      bool = true;
      label536:
      Assert.assertTrue("batch result size != 2", bool);
      if ((paramCdsMessageContentParser[0] == null) || (0count.intValue() <= 0)) {
        break label631;
      }
      bool = true;
      label565:
      Assert.assertTrue(bool);
      if ((paramCdsMessageContentParser[1] == null) || (1count.intValue() <= 0)) {
        break label637;
      }
    }
    label614:
    label619:
    label625:
    label631:
    label637:
    for (boolean bool = true;; bool = false)
    {
      Assert.assertTrue(bool);
      CdsUtils.notifyMessageContentUpdate(mContext, paramMessageCursorWrapper.getId());
      return;
      bool = false;
      break;
      paramString = null;
      break label137;
      i = 0;
      break label269;
      bool = false;
      break label536;
      bool = false;
      break label565;
    }
  }
  
  void consume()
  {
    SystemUtils.throwIfUiThread();
    long l1 = System.currentTimeMillis();
    if (mManifestParser.hasMessages())
    {
      ??? = mManifestParser.getMessages();
      Iterator localIterator1 = ((HashMap)???).keySet().iterator();
      while (localIterator1.hasNext())
      {
        String str = (String)localIterator1.next();
        logger.verbose("processing messages: %s", new Object[] { str });
        Iterator localIterator2 = ((List)((HashMap)???).get(str)).iterator();
        while (localIterator2.hasNext())
        {
          CdsManifestParser.ManifestPackItem localManifestPackItem = (CdsManifestParser.ManifestPackItem)localIterator2.next();
          if (localManifestPackItem != null) {
            consumeMessage(localManifestPackItem, str);
          }
        }
      }
      synchronized (mLocks)
      {
        for (;;)
        {
          if (mLocks.get() > 0)
          {
            logger.verbose("wait for locks... %d", new Object[] { Integer.valueOf(mLocks.get()) });
            try
            {
              mLocks.wait();
            }
            catch (InterruptedException localInterruptedException)
            {
              localInterruptedException.printStackTrace();
            }
          }
        }
      }
    }
    long l2 = System.currentTimeMillis();
    logger.verbose("total time: %dms", new Object[] { Long.valueOf(l2 - l1) });
  }
  
  public List<Throwable> getExceptions()
  {
    return mExceptions;
  }
  
  static class Builder
  {
    private final Context context;
    private CdsManifestParser manifestParser;
    private ThreadPool threadPool;
    private boolean wifiOnly;
    
    public Builder(Context paramContext)
    {
      context = paramContext;
    }
    
    public CdsManifestMessagesConsumer build()
    {
      if (manifestParser == null) {
        throw new IllegalArgumentException("manifest parser cannot be null");
      }
      return new CdsManifestMessagesConsumer(context, wifiOnly, threadPool, manifestParser, null);
    }
    
    public Builder withParser(CdsManifestParser paramCdsManifestParser)
    {
      manifestParser = paramCdsManifestParser;
      return this;
    }
    
    public Builder withThreadPool(ThreadPool paramThreadPool)
    {
      threadPool = paramThreadPool;
      return this;
    }
    
    public Builder withWifiOnly(boolean paramBoolean)
    {
      wifiOnly = paramBoolean;
      return this;
    }
  }
}
