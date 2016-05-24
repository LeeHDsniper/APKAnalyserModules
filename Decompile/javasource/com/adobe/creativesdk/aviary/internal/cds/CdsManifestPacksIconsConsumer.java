package com.adobe.creativesdk.aviary.internal.cds;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.text.TextUtils;
import com.adobe.creativesdk.aviary.internal.cds.json.CdsManifestParser;
import com.adobe.creativesdk.aviary.internal.threading.ThreadPool;
import com.adobe.creativesdk.aviary.internal.threading.ThreadPool.Job;
import com.adobe.creativesdk.aviary.internal.threading.ThreadPool.Worker;
import com.adobe.creativesdk.aviary.internal.utils.ConnectionUtils;
import com.adobe.creativesdk.aviary.internal.utils.IOUtils;
import com.adobe.creativesdk.aviary.internal.utils.PackageManagerUtils;
import com.adobe.creativesdk.aviary.internal.utils.SystemUtils;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import java.io.Closeable;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import junit.framework.Assert;

public final class CdsManifestPacksIconsConsumer
{
  private static final Object WRITE_DISK_LOCK = new Object();
  private static LoggerFactory.Logger logger = LoggerFactory.getLogger("CdsManifestPacksIconsConsumer");
  private final Context mContext;
  private final List<Exception> mExceptions;
  private final AtomicInteger mLocks;
  private final CdsManifestParser mManifestParser;
  private final ArrayList<PacksColumns.PackCursorWrapper> mPackList;
  private final ThreadPool mThreadPool;
  private final boolean mWifiOnly;
  
  private CdsManifestPacksIconsConsumer(Context paramContext, CdsManifestParser paramCdsManifestParser, ThreadPool paramThreadPool, boolean paramBoolean, ArrayList<PacksColumns.PackCursorWrapper> paramArrayList)
  {
    mContext = paramContext;
    mManifestParser = paramCdsManifestParser;
    mThreadPool = paramThreadPool;
    mWifiOnly = paramBoolean;
    mExceptions = new ArrayList();
    mLocks = new AtomicInteger(0);
    mPackList = paramArrayList;
  }
  
  private void consumePack(PacksColumns.PackCursorWrapper paramPackCursorWrapper)
  {
    if ((paramPackCursorWrapper == null) || (paramPackCursorWrapper.getContent() == null)) {
      return;
    }
    if ((paramPackCursorWrapper.getContent().getIconPath() == null) || (paramPackCursorWrapper.getContent().getIconNeedDownload() > 0))
    {
      i = 1;
      label34:
      if (i != 0)
      {
        logger.log("%s need to download icon", new Object[] { paramPackCursorWrapper.getIdentifier() });
        ThreadPool.Job localJob = createJob();
        mLocks.incrementAndGet();
        mThreadPool.submit(localJob, null, new PacksColumns.PackCursorWrapper[] { paramPackCursorWrapper });
      }
    }
    else
    {
      if (new File(paramPackCursorWrapper.getContent().getIconPath()).exists()) {
        break label116;
      }
    }
    label116:
    for (int i = 1;; i = 0)
    {
      break label34;
      break;
    }
  }
  
  private ThreadPool.Job<PacksColumns.PackCursorWrapper, Object> createJob()
  {
    new ThreadPool.Job()
    {
      public Object run(ThreadPool.Worker<PacksColumns.PackCursorWrapper, Object> arg1, PacksColumns.PackCursorWrapper... paramAnonymousVarArgs)
        throws Exception
      {
        PacksColumns.PackCursorWrapper localPackCursorWrapper = paramAnonymousVarArgs[0];
        Object localObject6 = null;
        Object localObject7 = null;
        File localFile = null;
        localObject4 = null;
        localObject2 = null;
        localObject1 = localFile;
        localObject3 = localObject6;
        ??? = localObject7;
        try
        {
          localObject5 = localPackCursorWrapper.getContent().getIconURL();
          localObject1 = localFile;
          localObject2 = localObject5;
          localObject3 = localObject6;
          localObject4 = localObject5;
          ??? = localObject7;
          CdsManifestPacksIconsConsumer.logger.verbose("iconUrl: %s", new Object[] { localObject5 });
          paramAnonymousVarArgs = (PacksColumns.PackCursorWrapper[])localObject5;
          localObject1 = localFile;
          localObject2 = localObject5;
          localObject3 = localObject6;
          localObject4 = localObject5;
          ??? = localObject7;
          if (!TextUtils.isEmpty((CharSequence)localObject5))
          {
            paramAnonymousVarArgs = (PacksColumns.PackCursorWrapper[])localObject5;
            localObject1 = localFile;
            localObject2 = localObject5;
            localObject3 = localObject6;
            localObject4 = localObject5;
            ??? = localObject7;
            if (!((String)localObject5).startsWith("http://"))
            {
              paramAnonymousVarArgs = (PacksColumns.PackCursorWrapper[])localObject5;
              localObject1 = localFile;
              localObject2 = localObject5;
              localObject3 = localObject6;
              localObject4 = localObject5;
              ??? = localObject7;
              if (!((String)localObject5).startsWith("https://"))
              {
                paramAnonymousVarArgs = (PacksColumns.PackCursorWrapper[])localObject5;
                localObject1 = localFile;
                localObject2 = localObject5;
                localObject3 = localObject6;
                localObject4 = localObject5;
                ??? = localObject7;
                if (!((String)localObject5).startsWith("file://"))
                {
                  localObject1 = localFile;
                  localObject2 = localObject5;
                  localObject3 = localObject6;
                  localObject4 = localObject5;
                  ??? = localObject7;
                  paramAnonymousVarArgs = mManifestParser.getAssetsBaseURL() + (String)localObject5;
                }
              }
            }
          }
          localObject1 = localFile;
          localObject2 = paramAnonymousVarArgs;
          localObject3 = localObject6;
          localObject4 = paramAnonymousVarArgs;
          ??? = localObject7;
          Uri localUri = Uri.parse(paramAnonymousVarArgs);
          localObject1 = localFile;
          localObject2 = paramAnonymousVarArgs;
          localObject3 = localObject6;
          localObject4 = paramAnonymousVarArgs;
          ??? = localObject7;
          localObject5 = CdsManifestPacksIconsConsumer.this.download(paramAnonymousVarArgs);
          localObject1 = localObject5;
          localObject2 = paramAnonymousVarArgs;
          localObject3 = localObject5;
          localObject4 = paramAnonymousVarArgs;
          ??? = (ThreadPool.Worker<PacksColumns.PackCursorWrapper, Object>)localObject5;
          localFile = new File(mContext.getFilesDir() + "/" + CdsUtils.getPackIconPath(localPackCursorWrapper.getIdentifier()));
          localObject1 = localObject5;
          localObject2 = paramAnonymousVarArgs;
          localObject3 = localObject5;
          localObject4 = paramAnonymousVarArgs;
          ??? = (ThreadPool.Worker<PacksColumns.PackCursorWrapper, Object>)localObject5;
          i = CdsManifestPacksIconsConsumer.this.updatePackIcon(localPackCursorWrapper.getContent().getId(), localPackCursorWrapper.getId(), localFile, localUri.getLastPathSegment(), (InputStream)localObject5);
          if (i <= 0) {
            break label491;
          }
          localObject1 = localObject5;
          localObject2 = paramAnonymousVarArgs;
          localObject3 = localObject5;
          localObject4 = paramAnonymousVarArgs;
          ??? = (ThreadPool.Worker<PacksColumns.PackCursorWrapper, Object>)localObject5;
          CdsUtils.notifyPackContentUpdate(mContext, localPackCursorWrapper.getId());
        }
        catch (Exception paramAnonymousVarArgs) {}catch (AssertionError paramAnonymousVarArgs)
        {
          for (;;)
          {
            Object localObject5;
            int i;
            ??? = localObject3;
            CdsManifestPacksIconsConsumer.logger.warn("failed to updated icon '%s': %s", new Object[] { localObject4, paramAnonymousVarArgs });
            ??? = localObject3;
            mExceptions.add(new Exception(paramAnonymousVarArgs));
            IOUtils.closeSilently(localObject3);
            synchronized (mLocks)
            {
              mLocks.decrementAndGet();
              mLocks.notifyAll();
            }
          }
        }
        finally
        {
          IOUtils.closeSilently(???);
          synchronized (mLocks)
          {
            mLocks.decrementAndGet();
            mLocks.notifyAll();
            throw paramAnonymousVarArgs;
          }
        }
        IOUtils.closeSilently((Closeable)localObject5);
      }
    };
  }
  
  private InputStream download(String paramString)
    throws IOException
  {
    
    if ((mWifiOnly) && (!ConnectionUtils.isWifiConnected(mContext))) {
      throw new IOException("Not connected");
    }
    return IOUtils.hunt(mContext, paramString);
  }
  
  private int updatePackIcon(long paramLong1, long paramLong2, File paramFile, String arg6, InputStream paramInputStream)
    throws IOException, AssertionError
  {
    SystemUtils.throwIfUiThread();
    Assert.assertNotNull("iconDir is null", paramFile);
    synchronized (WRITE_DISK_LOCK)
    {
      paramFile.mkdirs();
      IOUtils.createNoMediaFile(paramFile);
      Assert.assertTrue("iconDir is not a valid directory", paramFile.isDirectory());
      if (??? != null)
      {
        paramFile = new File(paramFile, ???);
        ??? = new FileOutputStream(paramFile, true);
      }
    }
    for (;;)
    {
      synchronized (WRITE_DISK_LOCK)
      {
        IOUtils.copyFile(paramInputStream, (OutputStream)???);
        IOUtils.closeSilently((Closeable)???);
        ??? = new ContentValues();
        ???.put("content_iconPath", paramFile.getAbsolutePath());
        ???.put("content_iconNeedDownload", Integer.valueOf(0));
        int i = mContext.getContentResolver().update(PackageManagerUtils.getCDSProviderContentUri(mContext, "pack/id/" + paramLong2 + "/content/id/" + paramLong1 + "/update"), ???, null, null);
        if (i > 0)
        {
          bool = true;
          Assert.assertTrue("!(result > 0)", bool);
          return i;
          paramFile = finally;
          throw paramFile;
          paramFile = File.createTempFile("icon-", ".png", paramFile);
        }
      }
      boolean bool = false;
    }
  }
  
  void consume()
  {
    
    if (mPackList != null)
    {
      ??? = mPackList.iterator();
      while (((Iterator)???).hasNext()) {
        consumePack((PacksColumns.PackCursorWrapper)((Iterator)???).next());
      }
    }
    ??? = mContext.getContentResolver().query(PackageManagerUtils.getCDSProviderContentUri(mContext, "pack/content/list"), null, null, null, null);
    if (??? != null)
    {
      logger.log("cursor.size: %d", new Object[] { Integer.valueOf(((Cursor)???).getCount()) });
      while (((Cursor)???).moveToNext())
      {
        PacksColumns.PackCursorWrapper localPackCursorWrapper = PacksColumns.PackCursorWrapper.create((Cursor)???);
        localPackCursorWrapper.setContent(PacksContentColumns.ContentCursorWrapper.create((Cursor)???));
        consumePack(localPackCursorWrapper);
      }
      IOUtils.closeSilently((Cursor)???);
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
  
  List<Exception> getExceptions()
  {
    return mExceptions;
  }
  
  static class Builder
  {
    private Context context;
    private CdsManifestParser manifestParser;
    private ArrayList<PacksColumns.PackCursorWrapper> packList;
    private ThreadPool threadPool;
    private boolean wifiOnly;
    
    Builder(Context paramContext)
    {
      context = paramContext;
    }
    
    CdsManifestPacksIconsConsumer build()
    {
      if (context == null) {
        throw new IllegalArgumentException("Context is null");
      }
      if (manifestParser == null) {
        throw new IllegalArgumentException("Parser is null");
      }
      if (threadPool == null) {
        throw new IllegalArgumentException("ThreadPool is null");
      }
      return new CdsManifestPacksIconsConsumer(context, manifestParser, threadPool, wifiOnly, packList, null);
    }
    
    Builder wifiOnly(boolean paramBoolean)
    {
      wifiOnly = paramBoolean;
      return this;
    }
    
    public Builder withDefinedList(ArrayList<PacksColumns.PackCursorWrapper> paramArrayList)
    {
      packList = paramArrayList;
      return this;
    }
    
    Builder withParser(CdsManifestParser paramCdsManifestParser)
    {
      manifestParser = paramCdsManifestParser;
      return this;
    }
    
    Builder withThreadPool(ThreadPool paramThreadPool)
    {
      threadPool = paramThreadPool;
      return this;
    }
  }
}
