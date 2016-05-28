package com.adobe.creativesdk.aviary.internal.cds;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import com.adobe.creativesdk.aviary.internal.cds.json.CdsContentParser;
import com.adobe.creativesdk.aviary.internal.cds.json.CdsManifestParser;
import com.adobe.creativesdk.aviary.internal.threading.ThreadPool;
import com.adobe.creativesdk.aviary.internal.threading.ThreadPool.Job;
import com.adobe.creativesdk.aviary.internal.threading.ThreadPool.Worker;
import com.adobe.creativesdk.aviary.internal.utils.IOUtils;
import com.adobe.creativesdk.aviary.internal.utils.PackageManagerUtils;
import com.adobe.creativesdk.aviary.internal.utils.SystemUtils;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

public final class CdsManifestResorePacksConsumer
{
  static LoggerFactory.Logger logger = LoggerFactory.getLogger("AviaryCdsManifestPacksConsumer");
  private final Context mContext;
  private final boolean mDebug;
  private final List<Exception> mExceptions;
  private final Iterator<String> mIterator;
  private final AtomicInteger mLocks;
  private final CdsManifestParser mManifestParser;
  private final String mServerRoot;
  private final ThreadPool mThreadPool;
  private final boolean mWifiOnly;
  
  private CdsManifestResorePacksConsumer(Context paramContext, boolean paramBoolean, ThreadPool paramThreadPool, CdsManifestParser paramCdsManifestParser, Iterator<String> paramIterator)
  {
    mWifiOnly = paramBoolean;
    mContext = paramContext;
    mThreadPool = paramThreadPool;
    mLocks = new AtomicInteger(0);
    mServerRoot = CdsServiceParamsUtils.getInstance().getServerUrl(mContext);
    mDebug = CdsServiceParamsUtils.getInstance().isDebug(mContext);
    mManifestParser = paramCdsManifestParser;
    mIterator = paramIterator;
    mExceptions = new ArrayList();
  }
  
  private ThreadPool.Job consumeNewPack()
  {
    new ThreadPool.Job()
    {
      public Object run(ThreadPool.Worker<String, Object> arg1, String... paramAnonymousVarArgs)
        throws Exception
      {
        try
        {
          ??? = (CdsContentParser)new CdsManifestPackContentDownloader(mServerRoot, mDebug).download(mContext, paramAnonymousVarArgs[0], paramAnonymousVarArgs[1], mWifiOnly);
          CdsManifestPacksConsumer.insertNewContentFromJson(mContext, ???, 10000, 1, mManifestParser.getAssetsBaseURL());
          synchronized (mLocks)
          {
            mLocks.decrementAndGet();
            mLocks.notifyAll();
          }
          return null;
        }
        catch (Throwable ???)
        {
          ???.printStackTrace();
          mExceptions.add(new Exception(???));
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
  
  void consume()
  {
    SystemUtils.throwIfUiThread();
    Object localObject3 = new StringBuilder();
    ArrayList localArrayList = new ArrayList();
    while (mIterator.hasNext())
    {
      localObject5 = (String)mIterator.next();
      localArrayList.add(localObject5);
      ((StringBuilder)localObject3).append("'").append((String)localObject5).append("'");
      if (mIterator.hasNext()) {
        ((StringBuilder)localObject3).append(",");
      }
    }
    logger.log("legacy packs size: %d", new Object[] { Integer.valueOf(localArrayList.size()) });
    Object localObject5 = mContext.getContentResolver();
    Uri localUri = PackageManagerUtils.getCDSProviderContentUri(mContext, "pack/content/list");
    localObject3 = "pack_identifier IN (" + ((StringBuilder)localObject3).toString() + ")";
    localObject3 = ((ContentResolver)localObject5).query(localUri, new String[] { "pack_identifier" }, (String)localObject3, null, null);
    if (localObject3 != null)
    {
      logger.log("cursor size: %d", new Object[] { Integer.valueOf(((Cursor)localObject3).getCount()) });
      try
      {
        while (((Cursor)localObject3).moveToNext())
        {
          localObject5 = ((Cursor)localObject3).getString(0);
          logger.log("remove '%s' from the legacy array", new Object[] { localObject5 });
          localArrayList.remove(localObject5);
        }
        ??? = localObject1.iterator();
      }
      finally
      {
        IOUtils.closeSilently((Cursor)localObject3);
      }
    }
    while (((Iterator)???).hasNext())
    {
      localObject3 = (String)((Iterator)???).next();
      localObject5 = consumeNewPack();
      mLocks.incrementAndGet();
      mThreadPool.submit((ThreadPool.Job)localObject5, null, new String[] { localObject3, mManifestParser.getFormatListId() });
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
  
  public List<Exception> getExceptions()
  {
    return mExceptions;
  }
  
  static class Builder
  {
    private final Context context;
    private Iterator<String> iterator;
    private CdsManifestParser manifestParser;
    private ThreadPool threadPool;
    private boolean wifiOnly;
    
    public Builder(Context paramContext)
    {
      context = paramContext;
    }
    
    public CdsManifestResorePacksConsumer build()
    {
      if (manifestParser == null) {
        throw new IllegalArgumentException("manifest parser cannot be null");
      }
      return new CdsManifestResorePacksConsumer(context, wifiOnly, threadPool, manifestParser, iterator, null);
    }
    
    public Builder withIterator(Iterator<String> paramIterator)
    {
      iterator = paramIterator;
      return this;
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
