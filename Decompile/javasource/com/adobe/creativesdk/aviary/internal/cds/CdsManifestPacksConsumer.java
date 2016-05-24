package com.adobe.creativesdk.aviary.internal.cds;

import android.content.ContentProviderOperation;
import android.content.ContentProviderOperation.Builder;
import android.content.ContentProviderResult;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.OperationApplicationException;
import android.database.Cursor;
import android.net.Uri;
import android.os.RemoteException;
import android.text.TextUtils;
import com.adobe.creativesdk.aviary.internal.cds.json.CdsContentParser;
import com.adobe.creativesdk.aviary.internal.cds.json.CdsContentParser.ContentItem;
import com.adobe.creativesdk.aviary.internal.cds.json.CdsManifestParser;
import com.adobe.creativesdk.aviary.internal.cds.json.CdsManifestParser.ManifestPackItem;
import com.adobe.creativesdk.aviary.internal.threading.ThreadPool;
import com.adobe.creativesdk.aviary.internal.threading.ThreadPool.Job;
import com.adobe.creativesdk.aviary.internal.threading.ThreadPool.Worker;
import com.adobe.creativesdk.aviary.internal.utils.IOUtils;
import com.adobe.creativesdk.aviary.internal.utils.PackageManagerUtils;
import com.adobe.creativesdk.aviary.internal.utils.SystemUtils;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;
import junit.framework.Assert;
import org.json.JSONException;

public final class CdsManifestPacksConsumer
{
  static LoggerFactory.Logger logger = LoggerFactory.getLogger("CdsManifestPacksConsumer");
  private final Context mContext;
  private final boolean mDebug;
  private final List<Throwable> mExceptions;
  private final AtomicInteger mLocks;
  private final CdsManifestParser mManifestParser;
  private final String mServerRoot;
  private final ThreadPool mThreadPool;
  private final boolean mWifiOnly;
  private final HashSet<String> notificationList;
  private final Operations operations;
  
  private CdsManifestPacksConsumer(Context paramContext, boolean paramBoolean, ThreadPool paramThreadPool, CdsManifestParser paramCdsManifestParser, Operations paramOperations)
  {
    mWifiOnly = paramBoolean;
    mContext = paramContext;
    mThreadPool = paramThreadPool;
    mLocks = new AtomicInteger(0);
    mServerRoot = CdsServiceParamsUtils.getInstance().getServerUrl(mContext);
    mDebug = CdsServiceParamsUtils.getInstance().isDebug(mContext);
    mManifestParser = paramCdsManifestParser;
    mExceptions = new ArrayList();
    notificationList = new HashSet();
    operations = paramOperations;
  }
  
  private ThreadPool.Job consumeNewPack(final int paramInt, final CdsManifestParser.ManifestPackItem paramManifestPackItem)
    throws IOException, JSONException
  {
    new ThreadPool.Job()
    {
      public Object run(ThreadPool.Worker<String, Object> arg1, String... paramAnonymousVarArgs)
        throws Exception
      {
        try
        {
          ??? = (CdsContentParser)new CdsManifestPackContentDownloader(mServerRoot, mDebug).download(mContext, paramAnonymousVarArgs[0], mWifiOnly);
          CdsManifestPacksConsumer.insertNewContentFromJson(mContext, ???, paramInt, 1, mManifestParser.getAssetsBaseURL());
          if (operations != null) {
            operations.add();
          }
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
          if ((paramManifestPackItem != null) && (paramManifestPackItem.getIdentifier() != null)) {
            CdsManifestPacksConsumer.logger.error("error with: %s", new Object[] { paramManifestPackItem.getIdentifier() });
          }
          CdsManifestPacksConsumer.logger.error(???.getMessage());
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
  
  private ThreadPool.Job consumeOldPack(final int paramInt, CdsManifestParser.ManifestPackItem paramManifestPackItem, final PacksColumns.PackCursorWrapper paramPackCursorWrapper)
  {
    if ((!paramPackCursorWrapper.getVersionKey().equals(paramManifestPackItem.getVersionKey())) || (paramPackCursorWrapper.getDisplayOrder() != paramInt) || (paramPackCursorWrapper.getVisible() != 1))
    {
      final boolean bool3 = paramPackCursorWrapper.getVersionKey().equals(paramManifestPackItem.getVersionKey());
      final boolean bool1;
      if (paramPackCursorWrapper.getDisplayOrder() == paramInt)
      {
        bool1 = true;
        if (paramPackCursorWrapper.getVisible() == 1) {
          break label88;
        }
      }
      label88:
      for (final boolean bool2 = true;; bool2 = false)
      {
        new ThreadPool.Job()
        {
          /* Error */
          public Object run(ThreadPool.Worker arg1, String[] paramAnonymousArrayOfString)
            throws Exception
          {
            // Byte code:
            //   0: new 54	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPackContentDownloader
            //   3: dup
            //   4: aload_0
            //   5: getfield 26	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:this$0	Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;
            //   8: invokestatic 58	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer:access$100	(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/lang/String;
            //   11: aload_0
            //   12: getfield 26	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:this$0	Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;
            //   15: invokestatic 62	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer:access$200	(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Z
            //   18: invokespecial 65	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPackContentDownloader:<init>	(Ljava/lang/String;Z)V
            //   21: aload_0
            //   22: getfield 26	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:this$0	Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;
            //   25: invokestatic 69	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer:access$300	(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Landroid/content/Context;
            //   28: aload_2
            //   29: iconst_0
            //   30: aaload
            //   31: aload_0
            //   32: getfield 26	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:this$0	Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;
            //   35: invokestatic 72	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer:access$400	(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Z
            //   38: invokevirtual 76	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPackContentDownloader:download	(Landroid/content/Context;Ljava/lang/String;Z)Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsJsonParser;
            //   41: checkcast 78	com/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser
            //   44: astore_1
            //   45: iconst_0
            //   46: istore_3
            //   47: aload_0
            //   48: getfield 28	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:val$versionKeyMatch	Z
            //   51: ifne +121 -> 172
            //   54: aload_0
            //   55: getfield 26	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:this$0	Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;
            //   58: aload_1
            //   59: aload_0
            //   60: getfield 30	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:val$currentPack	Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
            //   63: aload_0
            //   64: getfield 32	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:val$displayOrder	I
            //   67: invokestatic 82	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer:access$500	(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;I)Z
            //   70: istore 4
            //   72: iload 4
            //   74: istore_3
            //   75: aload_0
            //   76: getfield 26	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:this$0	Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;
            //   79: invokestatic 86	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer:access$600	(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Lcom/adobe/creativesdk/aviary/internal/cds/Operations;
            //   82: ifnull +16 -> 98
            //   85: aload_0
            //   86: getfield 26	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:this$0	Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;
            //   89: invokestatic 86	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer:access$600	(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Lcom/adobe/creativesdk/aviary/internal/cds/Operations;
            //   92: invokevirtual 91	com/adobe/creativesdk/aviary/internal/cds/Operations:update	()V
            //   95: iload 4
            //   97: istore_3
            //   98: iload_3
            //   99: ifeq +38 -> 137
            //   102: aload_0
            //   103: getfield 26	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:this$0	Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;
            //   106: invokestatic 95	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer:access$900	(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/HashSet;
            //   109: aload_0
            //   110: getfield 30	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:val$currentPack	Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
            //   113: invokevirtual 101	com/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper:getPackType	()Ljava/lang/String;
            //   116: invokevirtual 107	java/util/HashSet:add	(Ljava/lang/Object;)Z
            //   119: pop
            //   120: aload_0
            //   121: getfield 26	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:this$0	Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;
            //   124: invokestatic 69	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer:access$300	(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Landroid/content/Context;
            //   127: aload_0
            //   128: getfield 30	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:val$currentPack	Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
            //   131: invokevirtual 111	com/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper:getId	()J
            //   134: invokestatic 117	com/adobe/creativesdk/aviary/internal/cds/CdsUtils:notifyPackContentUpdate	(Landroid/content/Context;J)V
            //   137: aload_0
            //   138: getfield 26	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:this$0	Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;
            //   141: invokestatic 121	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer:access$1100	(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;
            //   144: astore_1
            //   145: aload_1
            //   146: monitorenter
            //   147: aload_0
            //   148: getfield 26	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:this$0	Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;
            //   151: invokestatic 121	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer:access$1100	(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;
            //   154: invokevirtual 127	java/util/concurrent/atomic/AtomicInteger:decrementAndGet	()I
            //   157: pop
            //   158: aload_0
            //   159: getfield 26	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:this$0	Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;
            //   162: invokestatic 121	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer:access$1100	(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;
            //   165: invokevirtual 130	java/lang/Object:notifyAll	()V
            //   168: aload_1
            //   169: monitorexit
            //   170: aconst_null
            //   171: areturn
            //   172: aload_0
            //   173: getfield 34	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:val$displayOrderMatch	Z
            //   176: ifne +114 -> 290
            //   179: aload_0
            //   180: getfield 26	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:this$0	Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;
            //   183: aload_0
            //   184: getfield 30	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:val$currentPack	Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
            //   187: invokevirtual 111	com/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper:getId	()J
            //   190: aload_0
            //   191: getfield 32	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:val$displayOrder	I
            //   194: invokestatic 134	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer:access$700	(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;JI)Z
            //   197: pop
            //   198: iconst_0
            //   199: istore 4
            //   201: iload 4
            //   203: istore_3
            //   204: aload_0
            //   205: getfield 26	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:this$0	Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;
            //   208: invokestatic 86	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer:access$600	(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Lcom/adobe/creativesdk/aviary/internal/cds/Operations;
            //   211: ifnull -113 -> 98
            //   214: aload_0
            //   215: getfield 26	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:this$0	Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;
            //   218: invokestatic 86	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer:access$600	(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Lcom/adobe/creativesdk/aviary/internal/cds/Operations;
            //   221: invokevirtual 91	com/adobe/creativesdk/aviary/internal/cds/Operations:update	()V
            //   224: iload 4
            //   226: istore_3
            //   227: goto -129 -> 98
            //   230: astore_1
            //   231: aload_0
            //   232: getfield 26	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:this$0	Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;
            //   235: invokestatic 138	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer:access$1000	(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/List;
            //   238: aload_1
            //   239: invokeinterface 141 2 0
            //   244: pop
            //   245: aload_1
            //   246: invokevirtual 144	java/lang/Throwable:printStackTrace	()V
            //   249: aload_0
            //   250: getfield 26	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:this$0	Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;
            //   253: invokestatic 121	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer:access$1100	(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;
            //   256: astore_1
            //   257: aload_1
            //   258: monitorenter
            //   259: aload_0
            //   260: getfield 26	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:this$0	Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;
            //   263: invokestatic 121	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer:access$1100	(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;
            //   266: invokevirtual 127	java/util/concurrent/atomic/AtomicInteger:decrementAndGet	()I
            //   269: pop
            //   270: aload_0
            //   271: getfield 26	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:this$0	Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;
            //   274: invokestatic 121	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer:access$1100	(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;
            //   277: invokevirtual 130	java/lang/Object:notifyAll	()V
            //   280: aload_1
            //   281: monitorexit
            //   282: goto -112 -> 170
            //   285: astore_2
            //   286: aload_1
            //   287: monitorexit
            //   288: aload_2
            //   289: athrow
            //   290: aload_0
            //   291: getfield 36	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:val$isHidden	Z
            //   294: ifeq -196 -> 98
            //   297: aload_0
            //   298: getfield 26	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:this$0	Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;
            //   301: aload_0
            //   302: getfield 30	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:val$currentPack	Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
            //   305: invokevirtual 111	com/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper:getId	()J
            //   308: iconst_1
            //   309: invokestatic 147	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer:access$800	(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;JI)Z
            //   312: istore 4
            //   314: iload 4
            //   316: istore_3
            //   317: aload_0
            //   318: getfield 26	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:this$0	Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;
            //   321: invokestatic 86	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer:access$600	(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Lcom/adobe/creativesdk/aviary/internal/cds/Operations;
            //   324: ifnull -226 -> 98
            //   327: aload_0
            //   328: getfield 26	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:this$0	Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;
            //   331: invokestatic 86	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer:access$600	(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Lcom/adobe/creativesdk/aviary/internal/cds/Operations;
            //   334: invokevirtual 91	com/adobe/creativesdk/aviary/internal/cds/Operations:update	()V
            //   337: iload 4
            //   339: istore_3
            //   340: goto -242 -> 98
            //   343: astore_2
            //   344: aload_0
            //   345: getfield 26	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:this$0	Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;
            //   348: invokestatic 121	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer:access$1100	(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;
            //   351: astore_1
            //   352: aload_1
            //   353: monitorenter
            //   354: aload_0
            //   355: getfield 26	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:this$0	Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;
            //   358: invokestatic 121	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer:access$1100	(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;
            //   361: invokevirtual 127	java/util/concurrent/atomic/AtomicInteger:decrementAndGet	()I
            //   364: pop
            //   365: aload_0
            //   366: getfield 26	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1:this$0	Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;
            //   369: invokestatic 121	com/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer:access$1100	(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;
            //   372: invokevirtual 130	java/lang/Object:notifyAll	()V
            //   375: aload_1
            //   376: monitorexit
            //   377: aload_2
            //   378: athrow
            //   379: astore_2
            //   380: aload_1
            //   381: monitorexit
            //   382: aload_2
            //   383: athrow
            //   384: astore_2
            //   385: aload_1
            //   386: monitorexit
            //   387: aload_2
            //   388: athrow
            // Local variable table:
            //   start	length	slot	name	signature
            //   0	389	0	this	1
            //   0	389	2	paramAnonymousArrayOfString	String[]
            //   46	294	3	i	int
            //   70	268	4	bool	boolean
            // Exception table:
            //   from	to	target	type
            //   0	45	230	java/lang/Throwable
            //   47	72	230	java/lang/Throwable
            //   75	95	230	java/lang/Throwable
            //   102	137	230	java/lang/Throwable
            //   172	198	230	java/lang/Throwable
            //   204	224	230	java/lang/Throwable
            //   290	314	230	java/lang/Throwable
            //   317	337	230	java/lang/Throwable
            //   259	282	285	finally
            //   286	288	285	finally
            //   0	45	343	finally
            //   47	72	343	finally
            //   75	95	343	finally
            //   102	137	343	finally
            //   172	198	343	finally
            //   204	224	343	finally
            //   231	249	343	finally
            //   290	314	343	finally
            //   317	337	343	finally
            //   147	170	379	finally
            //   380	382	379	finally
            //   354	377	384	finally
            //   385	387	384	finally
          }
        };
        bool1 = false;
        break;
      }
    }
    return null;
  }
  
  private void consumePack(int paramInt, CdsManifestParser.ManifestPackItem paramManifestPackItem)
    throws IOException, JSONException
  {
    logger.verbose("processing item: %s [%d]", new Object[] { paramManifestPackItem.getIdentifier(), Integer.valueOf(paramInt) });
    Object localObject = CdsUtils.getPackByIdentifier(mContext, paramManifestPackItem.getIdentifier(), null);
    if (localObject == null) {
      localObject = consumeNewPack(paramInt, paramManifestPackItem);
    }
    for (;;)
    {
      if (localObject != null) {}
      synchronized (mLocks)
      {
        mLocks.incrementAndGet();
        mThreadPool.submit((ThreadPool.Job)localObject, null, new String[] { paramManifestPackItem.getVersionKey() });
        return;
        localObject = consumeOldPack(paramInt, paramManifestPackItem, (PacksColumns.PackCursorWrapper)localObject);
      }
    }
  }
  
  static void insertNewContentFromJson(Context paramContext, CdsContentParser paramCdsContentParser, int paramInt1, int paramInt2, String paramString)
    throws AssertionError
  {
    logger.info("insertNewContentFromJson");
    SystemUtils.throwIfUiThread();
    Assert.assertNotNull(paramCdsContentParser);
    label47:
    ArrayList localArrayList;
    ContentValues localContentValues;
    if (paramCdsContentParser.getCode() == 0)
    {
      bool = true;
      Assert.assertTrue("Invalid Error Code", bool);
      if (TextUtils.isEmpty(paramCdsContentParser.getIdentifier())) {
        break label666;
      }
      bool = true;
      Assert.assertTrue("Identifier is null", bool);
      localArrayList = new ArrayList();
      localContentValues = new ContentValues();
      localContentValues.put("pack_identifier", paramCdsContentParser.getIdentifier());
      localContentValues.put("pack_type", paramCdsContentParser.getPackType());
      localContentValues.put("pack_versionKey", paramCdsContentParser.getVersionKey());
      localContentValues.put("pack_displayOrder", Integer.valueOf(paramInt1));
      localContentValues.put("pack_visible", Integer.valueOf(paramInt2));
      localArrayList.add(localContentValues);
      localContentValues = new ContentValues();
      localContentValues.put("content_previewURL", paramString + paramCdsContentParser.getPreviewURL());
      localContentValues.put("content_previewVersion", paramCdsContentParser.getPreviewVersion());
      localContentValues.put("content_contentURL", paramString + paramCdsContentParser.getContentURL());
      localContentValues.put("content_contentVersion", paramCdsContentParser.getContentVersion());
      localContentValues.put("content_iconUrl", paramString + paramCdsContentParser.getIconURL());
      localContentValues.put("content_iconVersion", paramCdsContentParser.getIconVersion());
      if (!paramCdsContentParser.isFree()) {
        break label672;
      }
      paramInt1 = 1;
      label284:
      localContentValues.put("content_isFree", Integer.valueOf(paramInt1));
      localContentValues.put("content_purchased", Integer.valueOf(0));
      localContentValues.put("content_iconNeedDownload", Integer.valueOf(1));
      localContentValues.put("content_displayName", paramCdsContentParser.getDisplayName());
      localContentValues.put("content_displayDescription", paramCdsContentParser.getDisplayDescription());
      localContentValues.put("content_numItems", Integer.valueOf(paramCdsContentParser.getItems().size()));
      if (!paramCdsContentParser.isFreeWithLogin()) {
        break label677;
      }
      paramInt1 = 1;
      label373:
      localContentValues.put("content_isFreeWithLogin", Integer.valueOf(paramInt1));
      localContentValues.put("content_author", paramCdsContentParser.getAuthor());
      if (!TextUtils.isEmpty(paramCdsContentParser.getAuthorHyperlink())) {
        break label682;
      }
      localContentValues.putNull("content_authorHyperlink");
      label415:
      if (!TextUtils.isEmpty(paramCdsContentParser.getSocialMediaString())) {
        break label697;
      }
      localContentValues.putNull("content_socialMediaString");
      label433:
      if (!TextUtils.isEmpty(paramCdsContentParser.getShopBackgroundColor())) {
        break label712;
      }
      localContentValues.putNull("content_shopBackgroundColor");
    }
    for (;;)
    {
      if (!TextUtils.isEmpty(paramCdsContentParser.getFeatureImageURL()))
      {
        localContentValues.put("content_featureImageURL", paramString + paramCdsContentParser.getFeatureImageURL());
        localContentValues.put("content_featureImageVersion", paramCdsContentParser.getFeatureImageVersion());
      }
      if (!TextUtils.isEmpty(paramCdsContentParser.getDetailImageURL()))
      {
        localContentValues.put("content_detailImageURL", paramString + paramCdsContentParser.getDetailImageURL());
        localContentValues.put("content_detailImageVersion", paramCdsContentParser.getDetailImageVersion());
      }
      localArrayList.add(localContentValues);
      paramCdsContentParser = paramCdsContentParser.getItems().iterator();
      while (paramCdsContentParser.hasNext())
      {
        paramString = (CdsContentParser.ContentItem)paramCdsContentParser.next();
        localContentValues = new ContentValues();
        localContentValues.put("item_identifier", paramString.getIdentifier());
        localContentValues.put("item_displayName", paramString.getDisplayName());
        if (paramString.getOptions() != null) {
          localContentValues.put("item_options", paramString.getOptions());
        }
        localArrayList.add(localContentValues);
      }
      bool = false;
      break;
      label666:
      bool = false;
      break label47;
      label672:
      paramInt1 = 0;
      break label284;
      label677:
      paramInt1 = 0;
      break label373;
      label682:
      localContentValues.put("content_authorHyperlink", paramCdsContentParser.getAuthorHyperlink());
      break label415;
      label697:
      localContentValues.put("content_socialMediaString", paramCdsContentParser.getSocialMediaString());
      break label433;
      label712:
      localContentValues.put("content_shopBackgroundColor", paramCdsContentParser.getShopBackgroundColor());
    }
    paramCdsContentParser = (ContentValues[])localArrayList.toArray(new ContentValues[localArrayList.size()]);
    paramInt1 = paramContext.getContentResolver().bulkInsert(PackageManagerUtils.getCDSProviderContentUri(paramContext, "bulk/insertPackContentAndItems"), paramCdsContentParser);
    if (paramInt1 > 0) {}
    for (boolean bool = true;; bool = false)
    {
      Assert.assertTrue(bool);
      logger.verbose("added new item with id: %d", new Object[] { Integer.valueOf(paramInt1) });
      return;
    }
  }
  
  private boolean updateContentFromJson(CdsContentParser paramCdsContentParser, PacksColumns.PackCursorWrapper paramPackCursorWrapper, int paramInt)
    throws IOException, JSONException, AssertionError, RemoteException, OperationApplicationException
  {
    Object localObject2 = mContext.getContentResolver().query(PackageManagerUtils.getCDSProviderContentUri(mContext, "pack/id/" + paramPackCursorWrapper.getId() + "/content"), new String[] { "content_id", "content_packId", "content_iconVersion", "content_previewVersion", "content_contentVersion", "content_featureImageVersion", "content_detailImageVersion", "content_previewPath" }, null, null, null);
    Assert.assertNotNull("currentCursor is null", localObject2);
    Assert.assertTrue("currentCursor.moveToFirst failed", ((Cursor)localObject2).moveToFirst());
    long l = ((Cursor)localObject2).getLong(0);
    Object localObject3 = ((Cursor)localObject2).getString(2);
    String str1 = ((Cursor)localObject2).getString(3);
    String str2 = ((Cursor)localObject2).getString(4);
    String str3 = ((Cursor)localObject2).getString(5);
    String str4 = ((Cursor)localObject2).getString(6);
    Object localObject1 = ((Cursor)localObject2).getString(7);
    IOUtils.closeSilently((Cursor)localObject2);
    int i;
    if (!paramCdsContentParser.getIconVersion().equals(localObject3)) {
      i = 1;
    }
    for (;;)
    {
      int j;
      label234:
      int k;
      label249:
      int m;
      label264:
      int n;
      if (!paramCdsContentParser.getPreviewVersion().equals(str1))
      {
        j = 1;
        if (paramCdsContentParser.getContentVersion().equals(str2)) {
          break label1059;
        }
        k = 1;
        if (paramCdsContentParser.getFeatureImageVersion().equals(str3)) {
          break label1065;
        }
        m = 1;
        if (paramCdsContentParser.getDetailImageVersion().equals(str4)) {
          break label1071;
        }
        n = 1;
        label279:
        localObject2 = new ContentValues();
        ((ContentValues)localObject2).put("pack_versionKey", paramCdsContentParser.getVersionKey());
        ((ContentValues)localObject2).put("pack_displayOrder", Integer.valueOf(paramInt));
        ((ContentValues)localObject2).put("pack_visible", Integer.valueOf(1));
        localObject3 = new ContentValues();
        ((ContentValues)localObject3).put("content_displayName", paramCdsContentParser.getDisplayName());
        ((ContentValues)localObject3).put("content_displayDescription", paramCdsContentParser.getDisplayDescription());
        if (!paramCdsContentParser.isFree()) {
          break label1077;
        }
        paramInt = 1;
        label366:
        ((ContentValues)localObject3).put("content_isFree", Integer.valueOf(paramInt));
        ((ContentValues)localObject3).put("content_numItems", Integer.valueOf(paramCdsContentParser.getItems().size()));
        ((ContentValues)localObject3).put("content_shopBackgroundColor", paramCdsContentParser.getShopBackgroundColor());
        if (!paramCdsContentParser.isFreeWithLogin()) {
          break label1082;
        }
        paramInt = 1;
        ((ContentValues)localObject3).put("content_isFreeWithLogin", Integer.valueOf(paramInt));
        if (i != 0)
        {
          ((ContentValues)localObject3).put("content_iconVersion", paramCdsContentParser.getIconVersion());
          ((ContentValues)localObject3).put("content_iconUrl", mManifestParser.getAssetsBaseURL() + paramCdsContentParser.getIconURL());
          ((ContentValues)localObject3).put("content_iconNeedDownload", Integer.valueOf(1));
        }
        if (j != 0)
        {
          logger.log("need to remove the previews");
          if (TextUtils.isEmpty((CharSequence)localObject1)) {}
        }
      }
      try
      {
        logger.log("trying to delete previews");
        IOUtils.cleanDirectory(new File((String)localObject1));
        ((ContentValues)localObject3).put("content_previewVersion", paramCdsContentParser.getPreviewVersion());
        ((ContentValues)localObject3).put("content_previewURL", mManifestParser.getAssetsBaseURL() + paramCdsContentParser.getPreviewURL());
        ((ContentValues)localObject3).putNull("content_previewPath");
        ((ContentValues)localObject3).put("content_previewNeedDownload", Integer.valueOf(1));
        if (k != 0)
        {
          ((ContentValues)localObject3).put("content_contentVersion", paramCdsContentParser.getContentVersion());
          ((ContentValues)localObject3).put("content_contentURL", mManifestParser.getAssetsBaseURL() + paramCdsContentParser.getContentURL());
          ((ContentValues)localObject3).put("content_contentNeedDownload", Integer.valueOf(1));
        }
        if ((m != 0) && (!TextUtils.isEmpty(paramCdsContentParser.getFeatureImageURL())))
        {
          ((ContentValues)localObject3).put("content_featureImageVersion", paramCdsContentParser.getFeatureImageVersion());
          ((ContentValues)localObject3).put("content_featureImageURL", mManifestParser.getAssetsBaseURL() + paramCdsContentParser.getFeatureImageURL());
        }
        if ((n != 0) && (!TextUtils.isEmpty(paramCdsContentParser.getDetailImageURL())))
        {
          ((ContentValues)localObject3).put("content_detailImageVersion", paramCdsContentParser.getDetailImageVersion());
          ((ContentValues)localObject3).put("content_detailImageURL", mManifestParser.getAssetsBaseURL() + paramCdsContentParser.getDetailImageURL());
        }
        paramCdsContentParser = new ArrayList();
        paramCdsContentParser.add(ContentProviderOperation.newUpdate(PackageManagerUtils.getCDSProviderContentUri(mContext, "pack/id/" + paramPackCursorWrapper.getId() + "/update")).withValues((ContentValues)localObject2).build());
        paramCdsContentParser.add(ContentProviderOperation.newUpdate(PackageManagerUtils.getCDSProviderContentUri(mContext, "pack/id/" + paramPackCursorWrapper.getId() + "/content/id/" + l + "/update")).withValues((ContentValues)localObject3).build());
        localObject1 = PackageManagerUtils.getCDSProviderContentUri(mContext, null);
        paramCdsContentParser = mContext.getContentResolver().applyBatch(((Uri)localObject1).getAuthority(), paramCdsContentParser);
        Assert.assertNotNull("batch result is null", paramCdsContentParser);
        if (paramCdsContentParser.length == 2)
        {
          bool = true;
          Assert.assertTrue("batch result size != 2", bool);
          if ((paramCdsContentParser[0] == null) || (0count.intValue() <= 0)) {
            break label1114;
          }
          bool = true;
          Assert.assertTrue(bool);
          if ((paramCdsContentParser[1] == null) || (1count.intValue() <= 0)) {
            break label1120;
          }
          bool = true;
          Assert.assertTrue(bool);
          logger.verbose("updated content: %s", new Object[] { paramPackCursorWrapper.getIdentifier() });
          return true;
          i = 0;
          continue;
          j = 0;
          break label234;
          label1059:
          k = 0;
          break label249;
          label1065:
          m = 0;
          break label264;
          label1071:
          n = 0;
          break label279;
          label1077:
          paramInt = 0;
          break label366;
          label1082:
          paramInt = 0;
        }
      }
      catch (Throwable localThrowable)
      {
        for (;;)
        {
          logger.error("error while deleting previews");
          localThrowable.printStackTrace();
          continue;
          boolean bool = false;
          continue;
          label1114:
          bool = false;
          continue;
          label1120:
          bool = false;
        }
      }
    }
  }
  
  private boolean updateDisplayOrder(long paramLong, int paramInt)
  {
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("pack_displayOrder", Integer.valueOf(paramInt));
    int i = mContext.getContentResolver().update(PackageManagerUtils.getCDSProviderContentUri(mContext, "pack/id/" + paramLong + "/update"), localContentValues, null, null);
    logger.verbose("updated pack display order -> %d", new Object[] { Integer.valueOf(paramInt) });
    return i > 0;
  }
  
  private boolean updateVisibility(long paramLong, int paramInt)
  {
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("pack_visible", Integer.valueOf(paramInt));
    return mContext.getContentResolver().update(PackageManagerUtils.getCDSProviderContentUri(mContext, "pack/id/" + paramLong + "/update"), localContentValues, null, null) > 0;
  }
  
  void consume()
    throws IOException, JSONException
  {
    long l1 = System.currentTimeMillis();
    SystemUtils.throwIfUiThread();
    if (mManifestParser.hasContent())
    {
      ??? = mManifestParser.getEnabledPacks();
      Iterator localIterator1 = ((HashMap)???).keySet().iterator();
      while (localIterator1.hasNext())
      {
        Iterator localIterator2 = ((List)((HashMap)???).get((String)localIterator1.next())).iterator();
        int i = 0;
        while (localIterator2.hasNext())
        {
          CdsManifestParser.ManifestPackItem localManifestPackItem = (CdsManifestParser.ManifestPackItem)localIterator2.next();
          if (localManifestPackItem != null) {
            consumePack(i, localManifestPackItem);
          }
          i += 1;
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
  
  public HashSet<String> getAddedOrUpdatedPackTypes()
  {
    return notificationList;
  }
  
  public List<Throwable> getExceptions()
  {
    return mExceptions;
  }
  
  static class Builder
  {
    private final Context context;
    private CdsManifestParser manifestParser;
    private Operations operations;
    private ThreadPool threadPool;
    private boolean wifiOnly;
    
    public Builder(Context paramContext)
    {
      context = paramContext;
    }
    
    public CdsManifestPacksConsumer build()
    {
      if (manifestParser == null) {
        throw new IllegalArgumentException("manifest parser cannot be null");
      }
      return new CdsManifestPacksConsumer(context, wifiOnly, threadPool, manifestParser, operations, null);
    }
    
    public Builder withOperations(Operations paramOperations)
    {
      operations = paramOperations;
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
