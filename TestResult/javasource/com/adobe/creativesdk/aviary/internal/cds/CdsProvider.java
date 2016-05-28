package com.adobe.creativesdk.aviary.internal.cds;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.content.UriMatcher;
import android.database.Cursor;
import android.database.MergeCursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import com.adobe.creativesdk.aviary.internal.utils.PackageManagerUtils;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import java.util.List;

public final class CdsProvider
  extends ContentProvider
{
  private static final LoggerFactory.Logger LOGGER = LoggerFactory.getLogger("AdobeImageCdsProvider");
  private static CdsDatabaseHelper mDbHelper;
  private static UriMatcher mUriMatcher;
  
  public CdsProvider() {}
  
  private void setupUriMatcher(Context paramContext)
  {
    paramContext = PackageManagerUtils.getCDSProviderAuthority(paramContext);
    mUriMatcher = new UriMatcher(-1);
    mUriMatcher.addURI(paramContext, "pack/identifier/*", 6);
    mUriMatcher.addURI(paramContext, "pack/id/#", 5);
    mUriMatcher.addURI(paramContext, "pack/list", 7);
    mUriMatcher.addURI(paramContext, "pack/id/#/update", 204);
    mUriMatcher.addURI(paramContext, "pack/id/#/remove", 303);
    mUriMatcher.addURI(paramContext, "pack/content/list", 43);
    mUriMatcher.addURI(paramContext, "pack/id/#/content/id/#/update", 203);
    mUriMatcher.addURI(paramContext, "pack/id/#/content/id/#/updatePurchasedStatus/#", 207);
    mUriMatcher.addURI(paramContext, "pack/id/#/requestDownload/#", 208);
    mUriMatcher.addURI(paramContext, "pack/id/#/content", 8);
    mUriMatcher.addURI(paramContext, "pack/identifier/*/content", 9);
    mUriMatcher.addURI(paramContext, "pack/type/*/content/available/list", 11);
    mUriMatcher.addURI(paramContext, "pack/type/*/content/hidden/list", 19);
    mUriMatcher.addURI(paramContext, "pack/type/*/content/availableAndPurchasable/list", 20);
    mUriMatcher.addURI(paramContext, "pack/type/*/content/restore/list", 15);
    mUriMatcher.addURI(paramContext, "pack/type/*/content/installed/list", 17);
    mUriMatcher.addURI(paramContext, "pack/content/installed/list", 18);
    mUriMatcher.addURI(paramContext, "pack/#/item/list", 10);
    mUriMatcher.addURI(paramContext, "pack/content/item/#", 12);
    mUriMatcher.addURI(paramContext, "pack/*/item/*", 21);
    mUriMatcher.addURI(paramContext, "bulk/insertPackContentAndItems", 401);
    mUriMatcher.addURI(paramContext, "bulk/insertMessageAndContent", 402);
    mUriMatcher.addURI(paramContext, "packTray/#/#/#/#/#/*", 54);
    mUriMatcher.addURI(paramContext, "storeFeatured/#/#", 56);
    mUriMatcher.addURI(paramContext, "storeFeatured/banners/#", 57);
    mUriMatcher.addURI(paramContext, "manifestVersion", 1);
    mUriMatcher.addURI(paramContext, "manifestVersion/insert", 101);
    mUriMatcher.addURI(paramContext, "permissions/list", 55);
    mUriMatcher.addURI(paramContext, "permissions/replace", 104);
    mUriMatcher.addURI(paramContext, "message/list", 2);
    mUriMatcher.addURI(paramContext, "message/active/*", 13);
    mUriMatcher.addURI(paramContext, "message/next/*", 14);
    mUriMatcher.addURI(paramContext, "message/future/*", 22);
    mUriMatcher.addURI(paramContext, "message/identifier/*", 3);
    mUriMatcher.addURI(paramContext, "message/id/#/content", 4);
    mUriMatcher.addURI(paramContext, "message/id/#/remove", 301);
    mUriMatcher.addURI(paramContext, "message/id/#/update", 201);
    mUriMatcher.addURI(paramContext, "message/id/#/content/id/#/update", 202);
    mUriMatcher.addURI(paramContext, "message/content/id/#/markasread/#", 209);
    mUriMatcher.addURI(paramContext, "packDownloadStatus/#", 47);
    mUriMatcher.addURI(paramContext, "insertPacksDownloadTable", 103);
    mUriMatcher.addURI(paramContext, "downloadPackId/#", 48);
    mUriMatcher.addURI(paramContext, "download/id/#/updateStatus/#", 206);
    mUriMatcher.addURI(paramContext, "pack/#/delete_download_entry", 302);
  }
  
  /* Error */
  public android.content.ContentProviderResult[] applyBatch(java.util.ArrayList<android.content.ContentProviderOperation> paramArrayList)
  {
    // Byte code:
    //   0: aload_1
    //   1: invokevirtual 143	java/util/ArrayList:size	()I
    //   4: anewarray 145	android/content/ContentProviderResult
    //   7: astore 5
    //   9: getstatic 147	com/adobe/creativesdk/aviary/internal/cds/CdsProvider:mDbHelper	Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;
    //   12: invokevirtual 153	com/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper:getWritableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   15: astore 4
    //   17: aload 4
    //   19: invokevirtual 158	android/database/sqlite/SQLiteDatabase:beginTransaction	()V
    //   22: aload_1
    //   23: invokevirtual 162	java/util/ArrayList:iterator	()Ljava/util/Iterator;
    //   26: astore_1
    //   27: iconst_0
    //   28: istore_2
    //   29: aload_1
    //   30: invokeinterface 168 1 0
    //   35: ifeq +36 -> 71
    //   38: aload_1
    //   39: invokeinterface 172 1 0
    //   44: checkcast 174	android/content/ContentProviderOperation
    //   47: astore 6
    //   49: iload_2
    //   50: iconst_1
    //   51: iadd
    //   52: istore_3
    //   53: aload 5
    //   55: iload_2
    //   56: aload 6
    //   58: aload_0
    //   59: aload 5
    //   61: iload_3
    //   62: invokevirtual 178	android/content/ContentProviderOperation:apply	(Landroid/content/ContentProvider;[Landroid/content/ContentProviderResult;I)Landroid/content/ContentProviderResult;
    //   65: aastore
    //   66: iload_3
    //   67: istore_2
    //   68: goto -39 -> 29
    //   71: aload 4
    //   73: invokevirtual 181	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   76: aload 4
    //   78: invokevirtual 184	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   81: aload 5
    //   83: areturn
    //   84: astore_1
    //   85: getstatic 22	com/adobe/creativesdk/aviary/internal/cds/CdsProvider:LOGGER	Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    //   88: ldc -70
    //   90: iconst_1
    //   91: anewarray 188	java/lang/Object
    //   94: dup
    //   95: iconst_0
    //   96: aload_1
    //   97: invokevirtual 192	android/content/OperationApplicationException:getMessage	()Ljava/lang/String;
    //   100: aastore
    //   101: invokeinterface 198 3 0
    //   106: aload 4
    //   108: invokevirtual 184	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   111: aload 5
    //   113: areturn
    //   114: astore_1
    //   115: aload 4
    //   117: invokevirtual 184	android/database/sqlite/SQLiteDatabase:endTransaction	()V
    //   120: aload_1
    //   121: athrow
    //   122: astore_1
    //   123: goto -8 -> 115
    //   126: astore_1
    //   127: goto -42 -> 85
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	130	0	this	CdsProvider
    //   0	130	1	paramArrayList	java.util.ArrayList<android.content.ContentProviderOperation>
    //   28	40	2	i	int
    //   52	15	3	j	int
    //   15	101	4	localSQLiteDatabase	SQLiteDatabase
    //   7	105	5	arrayOfContentProviderResult	android.content.ContentProviderResult[]
    //   47	10	6	localContentProviderOperation	android.content.ContentProviderOperation
    // Exception table:
    //   from	to	target	type
    //   22	27	84	android/content/OperationApplicationException
    //   53	66	84	android/content/OperationApplicationException
    //   22	27	114	finally
    //   53	66	114	finally
    //   85	106	114	finally
    //   29	49	122	finally
    //   71	76	122	finally
    //   29	49	126	android/content/OperationApplicationException
    //   71	76	126	android/content/OperationApplicationException
  }
  
  public int bulkInsert(Uri paramUri, ContentValues[] paramArrayOfContentValues)
  {
    int i = 0;
    int j = 0;
    int n = 1;
    SQLiteDatabase localSQLiteDatabase = CdsDatabaseHelper.getInstance(getContext()).getWritableDatabase();
    localSQLiteDatabase.beginTransaction();
    for (;;)
    {
      try
      {
        switch (mUriMatcher.match(paramUri))
        {
        case 401: 
          LOGGER.error("invalid uri");
          m = 0;
          if (m != 0) {
            localSQLiteDatabase.setTransactionSuccessful();
          }
          localSQLiteDatabase.endTransaction();
          if (m == 0) {
            break label348;
          }
          return j;
        }
      }
      finally
      {
        int m;
        long l1;
        long l2;
        int k;
        localSQLiteDatabase.endTransaction();
      }
      if (paramArrayOfContentValues.length < 3)
      {
        LOGGER.error("invalid size");
        localSQLiteDatabase.endTransaction();
        return 0;
      }
      l1 = CdsDatabaseHelper.insertValues("packs_table", paramArrayOfContentValues[0], localSQLiteDatabase);
      if (l1 < 0L)
      {
        localSQLiteDatabase.endTransaction();
        return 0;
      }
      paramUri = paramArrayOfContentValues[1];
      paramUri.put("content_packId", Long.valueOf(l1));
      l2 = CdsDatabaseHelper.insertValues("content_table", paramUri, localSQLiteDatabase);
      if (l2 < 0L)
      {
        localSQLiteDatabase.endTransaction();
        return 0;
      }
      k = 2;
      j = i;
      m = n;
      if (k < paramArrayOfContentValues.length)
      {
        paramUri = paramArrayOfContentValues[k];
        paramUri.put("item_packId", Long.valueOf(l1));
        l2 = CdsDatabaseHelper.insertValues("items_table", paramUri, localSQLiteDatabase);
        if (l2 < 0L)
        {
          localSQLiteDatabase.endTransaction();
          return 0;
        }
        i += 1;
        k += 1;
        continue;
        i = paramArrayOfContentValues.length;
        if (i != 2)
        {
          localSQLiteDatabase.endTransaction();
          return 0;
        }
        l1 = CdsDatabaseHelper.insertValues("messages_table", paramArrayOfContentValues[0], localSQLiteDatabase);
        if (l1 < 0L)
        {
          localSQLiteDatabase.endTransaction();
          return 0;
        }
        paramUri = paramArrayOfContentValues[1];
        paramUri.put("msgcnt_messageId", Long.valueOf(l1));
        l1 = CdsDatabaseHelper.insertValues("messages_content_table", paramUri, localSQLiteDatabase);
        if (l1 < 0L)
        {
          localSQLiteDatabase.endTransaction();
          return 0;
        }
        j = 1;
        m = n;
        continue;
        label348:
        return 0;
      }
    }
  }
  
  public int delete(Uri paramUri, String paramString, String[] paramArrayOfString)
  {
    switch (mUriMatcher.match(paramUri))
    {
    default: 
      return 0;
    case 303: 
      l = Long.parseLong((String)paramUri.getPathSegments().get(paramUri.getPathSegments().size() - 2));
      return mDbHelper.deletePack(l);
    case 302: 
      l = Long.parseLong((String)paramUri.getPathSegments().get(paramUri.getPathSegments().size() - 2));
      mDbHelper.deletePackDownloadEntry(l);
      return 0;
    case 301: 
      l = Long.parseLong((String)paramUri.getPathSegments().get(paramUri.getPathSegments().size() - 2));
      return mDbHelper.deleteMessage(l);
    }
    long l = Long.parseLong(paramUri.getLastPathSegment());
    return mDbHelper.deletePackDownloadEntry(l);
  }
  
  public String getType(Uri paramUri)
  {
    return "vnd.android.cursor.item";
  }
  
  public Uri insert(Uri paramUri, ContentValues paramContentValues)
  {
    switch (mUriMatcher.match(paramUri))
    {
    case 102: 
    default: 
      LOGGER.error("invalid uri");
    }
    long l;
    do
    {
      do
      {
        do
        {
          return null;
          if ((!paramContentValues.containsKey("version_versionKey")) || (!paramContentValues.containsKey("version_assetsBaseURL")))
          {
            LOGGER.error("missing version or asset url from values!");
            return null;
          }
          l = mDbHelper.insertValues("version_table", paramContentValues);
        } while (l <= -1L);
        return PackageManagerUtils.getCDSProviderContentUri(getContext(), "manifestVersion/" + l);
        l = mDbHelper.insertValues("packs_download_table", paramContentValues);
      } while (l <= -1L);
      return PackageManagerUtils.getCDSProviderContentUri(getContext(), "downloadEntry/" + l);
      l = mDbHelper.replacePermissions(paramContentValues);
    } while (l <= 0L);
    return PackageManagerUtils.getCDSProviderContentUri(getContext(), "permissions/" + l);
  }
  
  public boolean onCreate()
  {
    LOGGER.info("onCreate");
    mDbHelper = CdsDatabaseHelper.getInstance(getContext());
    setupUriMatcher(getContext());
    return true;
  }
  
  public Cursor query(Uri paramUri, String[] paramArrayOfString1, String paramString1, String[] paramArrayOfString2, String paramString2)
  {
    int i;
    long l;
    int j;
    boolean bool1;
    switch (mUriMatcher.match(paramUri))
    {
    case 16: 
    case 23: 
    case 24: 
    case 25: 
    case 26: 
    case 27: 
    case 28: 
    case 29: 
    case 30: 
    case 31: 
    case 32: 
    case 33: 
    case 34: 
    case 35: 
    case 36: 
    case 37: 
    case 38: 
    case 39: 
    case 40: 
    case 41: 
    case 42: 
    case 44: 
    case 45: 
    case 46: 
    case 49: 
    case 50: 
    case 51: 
    case 52: 
    case 53: 
    default: 
      LOGGER.error("Unrecognized query: " + paramUri);
      return null;
    case 43: 
      return mDbHelper.getPacksContent(paramArrayOfString1, paramString1, paramArrayOfString2, paramString2);
    case 7: 
      return mDbHelper.getPacks(paramArrayOfString1, paramString1, paramArrayOfString2);
    case 9: 
      paramUri = (String)paramUri.getPathSegments().get(paramUri.getPathSegments().size() - 2);
      return mDbHelper.getPackContentByIdentifier(paramUri, paramArrayOfString1);
    case 8: 
      i = Integer.parseInt((String)paramUri.getPathSegments().get(paramUri.getPathSegments().size() - 2));
      return mDbHelper.getPackContentById(i, paramArrayOfString1);
    case 10: 
      i = Integer.parseInt((String)paramUri.getPathSegments().get(paramUri.getPathSegments().size() - 3));
      return mDbHelper.getPackItems(i, paramArrayOfString1);
    case 12: 
      i = Integer.parseInt(paramUri.getLastPathSegment());
      return mDbHelper.getPackItemById(i, paramArrayOfString1);
    case 21: 
      paramString2 = (String)paramUri.getPathSegments().get(paramUri.getPathSegments().size() - 3);
      paramUri = paramUri.getLastPathSegment();
      return mDbHelper.getPackItemByIdentifier(paramString2, paramUri, paramArrayOfString1, paramString1, paramArrayOfString2);
    case 1: 
      return mDbHelper.getManifestVersion(paramArrayOfString1);
    case 6: 
      paramUri = paramUri.getLastPathSegment();
      return mDbHelper.getPackByIdentifier(paramUri, paramArrayOfString1);
    case 5: 
      l = Long.parseLong(paramUri.getLastPathSegment());
      return mDbHelper.getPackById(l, paramArrayOfString1);
    case 47: 
      paramUri = paramUri.getLastPathSegment();
      return mDbHelper.getPackDownloadStatus(paramUri, paramArrayOfString1);
    case 48: 
      paramUri = paramUri.getLastPathSegment();
      return mDbHelper.getPackIdOfDownload(paramUri, paramArrayOfString1);
    case 11: 
      paramUri = (String)paramUri.getPathSegments().get(paramUri.getPathSegments().size() - 4);
      return mDbHelper.getAvailablePacksByType(paramUri, paramArrayOfString1, paramString1, paramArrayOfString2, paramString2);
    case 19: 
      paramUri = (String)paramUri.getPathSegments().get(paramUri.getPathSegments().size() - 4);
      return mDbHelper.getHiddenPacksByType(paramUri, paramArrayOfString1, paramString1, paramArrayOfString2, paramString2);
    case 20: 
      paramUri = (String)paramUri.getPathSegments().get(paramUri.getPathSegments().size() - 4);
      return new MergeCursor(new Cursor[] { mDbHelper.getAvailablePacksByType(paramUri, paramArrayOfString1, paramString1, paramArrayOfString2, paramString2), mDbHelper.getHiddenPacksByType(paramUri, paramArrayOfString1, paramString1, paramArrayOfString2, paramString2) });
    case 17: 
      paramUri = (String)paramUri.getPathSegments().get(paramUri.getPathSegments().size() - 4);
      return mDbHelper.getInstalledPacksByType(paramUri, paramArrayOfString1, paramString2);
    case 18: 
      return mDbHelper.getInstalledPacks(paramArrayOfString1, paramString2);
    case 15: 
      paramUri = (String)paramUri.getPathSegments().get(paramUri.getPathSegments().size() - 4);
      return mDbHelper.getAvailableForRestorePacksByType(paramUri, paramArrayOfString1, paramString2);
    case 3: 
      paramUri = paramUri.getLastPathSegment();
      return mDbHelper.getMessageByIdentifier(paramUri, paramArrayOfString1);
    case 2: 
      return mDbHelper.getMessages(paramArrayOfString1, paramString1, paramArrayOfString2);
    case 13: 
      return mDbHelper.getActiveMessage(paramUri.getLastPathSegment(), paramArrayOfString1);
    case 14: 
      return mDbHelper.getNextMessage(paramUri.getLastPathSegment(), paramArrayOfString1);
    case 22: 
      return mDbHelper.getFutureMessages(paramUri.getLastPathSegment(), paramArrayOfString1);
    case 4: 
      l = Long.parseLong((String)paramUri.getPathSegments().get(paramUri.getPathSegments().size() - 2));
      return mDbHelper.getMessageContent(l, paramArrayOfString1);
    case 54: 
      paramArrayOfString1 = paramUri.getLastPathSegment();
      i = Integer.parseInt((String)paramUri.getPathSegments().get(paramUri.getPathSegments().size() - 6));
      j = Integer.parseInt((String)paramUri.getPathSegments().get(paramUri.getPathSegments().size() - 5));
      int k = Integer.parseInt((String)paramUri.getPathSegments().get(paramUri.getPathSegments().size() - 4));
      boolean bool2;
      boolean bool3;
      if (Integer.parseInt((String)paramUri.getPathSegments().get(paramUri.getPathSegments().size() - 3)) == 1)
      {
        bool1 = true;
        if (Integer.parseInt((String)paramUri.getPathSegments().get(paramUri.getPathSegments().size() - 2)) != 1) {
          break label1065;
        }
        bool2 = true;
        paramUri = mDbHelper;
        if (j == 0) {
          break label1071;
        }
        bool3 = true;
        if (k == 0) {
          break label1077;
        }
      }
      for (boolean bool4 = true;; bool4 = false)
      {
        return paramUri.getTray(paramArrayOfString1, i, bool3, bool4, bool1, bool2);
        bool1 = false;
        break;
        bool2 = false;
        break label1023;
        bool3 = false;
        break label1035;
      }
    case 56: 
      i = Integer.parseInt(paramUri.getLastPathSegment());
      j = Integer.parseInt((String)paramUri.getPathSegments().get(paramUri.getPathSegments().size() - 2));
      paramUri = mDbHelper;
      if (j > 0) {}
      for (bool1 = true;; bool1 = false) {
        return paramUri.getFeatured(bool1, i);
      }
    case 57: 
      label1023:
      label1035:
      label1065:
      label1071:
      label1077:
      return mDbHelper.getFeaturedBanners(Integer.parseInt(paramUri.getLastPathSegment()));
    }
    return mDbHelper.getPermissions(paramArrayOfString1);
  }
  
  public int update(Uri paramUri, ContentValues paramContentValues, String paramString, String[] paramArrayOfString)
  {
    long l2;
    switch (mUriMatcher.match(paramUri))
    {
    case 205: 
    default: 
      LOGGER.error("invalid uri");
      return 0;
    case 206: 
      l1 = Long.parseLong((String)paramUri.getPathSegments().get(paramUri.getPathSegments().size() - 3));
      i = Integer.parseInt(paramUri.getLastPathSegment());
      return mDbHelper.updateDownloadStatus(l1, i);
    case 204: 
      l1 = Long.parseLong((String)paramUri.getPathSegments().get(paramUri.getPathSegments().size() - 2));
      return mDbHelper.updatePack(l1, paramContentValues);
    case 203: 
      l1 = Long.parseLong((String)paramUri.getPathSegments().get(paramUri.getPathSegments().size() - 2));
      l2 = Long.parseLong((String)paramUri.getPathSegments().get(paramUri.getPathSegments().size() - 5));
      return mDbHelper.updatePackContent(l2, l1, paramContentValues);
    case 201: 
      l1 = Long.parseLong((String)paramUri.getPathSegments().get(paramUri.getPathSegments().size() - 2));
      return mDbHelper.updateMessage(l1, paramContentValues);
    case 202: 
      l1 = Long.parseLong((String)paramUri.getPathSegments().get(paramUri.getPathSegments().size() - 5));
      l2 = Long.parseLong((String)paramUri.getPathSegments().get(paramUri.getPathSegments().size() - 2));
      return mDbHelper.updateMessageContent(l1, l2, paramContentValues);
    case 209: 
      l1 = Long.parseLong((String)paramUri.getPathSegments().get(paramUri.getPathSegments().size() - 3));
      i = Integer.parseInt(paramUri.getLastPathSegment());
      return mDbHelper.setMessageasVisited(l1, i);
    case 207: 
      l1 = Long.parseLong((String)paramUri.getPathSegments().get(paramUri.getPathSegments().size() - 3));
      l2 = Long.parseLong((String)paramUri.getPathSegments().get(paramUri.getPathSegments().size() - 6));
      i = Integer.parseInt(paramUri.getLastPathSegment());
      paramUri = null;
      if (paramContentValues != null) {
        paramUri = paramContentValues.getAsString("content_contentPath");
      }
      return mDbHelper.updatePackContentPurchasedStatus(l2, l1, i, paramUri);
    }
    long l1 = Long.parseLong((String)paramUri.getPathSegments().get(paramUri.getPathSegments().size() - 3));
    int i = Integer.parseInt(paramUri.getLastPathSegment());
    return mDbHelper.updatePackContentRequestDownloadStatus(l1, i);
  }
}
