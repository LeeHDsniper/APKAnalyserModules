package com.adobe.creativesdk.aviary.internal.cds;

import android.annotation.TargetApi;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteQueryBuilder;
import android.os.Build.VERSION;
import com.adobe.creativesdk.aviary.internal.utils.DateTimeUtils;
import com.adobe.creativesdk.aviary.internal.utils.IOUtils;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.aviary.android.feather.sdk.R.string;
import java.util.ArrayList;
import java.util.List;

final class CdsDatabaseHelper
  extends SQLiteOpenHelper
{
  private static volatile CdsDatabaseHelper instance;
  private static LoggerFactory.Logger logger = LoggerFactory.getLogger("CdsDatabaseHelper");
  private static Context mContext;
  
  CdsDatabaseHelper(Context paramContext)
  {
    super(paramContext, "aviarycds.sqlite", null, 10);
    mContext = paramContext;
  }
  
  public static CdsDatabaseHelper getInstance(Context paramContext)
  {
    if (instance == null) {}
    try
    {
      if (instance == null) {
        instance = new CdsDatabaseHelper(paramContext);
      }
      return instance;
    }
    finally {}
  }
  
  static String getPackFeaturedLabel(Context paramContext, String paramString)
  {
    paramString = Cds.PackType.fromString(paramString);
    if (paramString != null)
    {
      switch (1.$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$Cds$PackType[paramString.ordinal()])
      {
      default: 
        return "Featured";
      case 1: 
        if (paramContext != null) {
          return paramContext.getString(R.string.feather_featured_frames);
        }
        return "Featured Frames";
      case 2: 
        if (paramContext != null) {
          return paramContext.getString(R.string.feather_featured_effects);
        }
        return "Featured Effects";
      case 3: 
        if (paramContext != null) {
          return paramContext.getString(R.string.feather_featured_stickers);
        }
        return "Featured Stickers";
      }
      if (paramContext != null) {
        return paramContext.getString(R.string.feather_featured_overlays);
      }
      return "Featured Overlays";
    }
    return "Featured";
  }
  
  private int getTrayFeaturedCount(String paramString, boolean paramBoolean)
  {
    logger.info("getTrayFeaturedCount: packType: %s, freeOnly: %b", new Object[] { paramString, Boolean.valueOf(paramBoolean) });
    Object localObject2 = new StringBuilder().append("SELECT COUNT(pack_id) as _count  FROM packs_table, content_table WHERE pack_id=content_packId AND pack_visible=1 AND pack_finishedDownloading=1");
    String str;
    if (paramBoolean) {
      str = " AND content_isFree=1";
    }
    for (;;)
    {
      str = str + " AND " + "content_iconPath" + " NOT NULL" + " AND " + "content_purchased" + "=0" + " AND " + "pack_type" + "='" + paramString + "' " + " ORDER BY " + "pack_displayOrder" + " ASC";
      localObject2 = getReadableDatabase();
      paramString = null;
      if (localObject2 != null) {
        paramString = ((SQLiteDatabase)localObject2).rawQuery(str, null);
      }
      if (paramString != null) {}
      try
      {
        if (paramString.moveToFirst())
        {
          int i = paramString.getInt(0);
          return i;
          str = "";
        }
      }
      catch (SQLiteException localSQLiteException)
      {
        for (;;)
        {
          logger.error("handled: " + localSQLiteException);
          IOUtils.closeSilently(paramString);
        }
      }
      finally
      {
        IOUtils.closeSilently(paramString);
      }
    }
    return 0;
  }
  
  private int getTrayInstalledCount(String paramString)
  {
    int i = 0;
    String str = "SELECT count(pack_id) as _count FROM packs_table, content_table WHERE pack_id=content_packId AND pack_type='" + paramString + "'" + " AND " + "content_purchased" + "=1" + " AND " + "content_contentPath" + " NOT NULL";
    SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
    paramString = null;
    if (localSQLiteDatabase != null) {
      paramString = localSQLiteDatabase.rawQuery(str, null);
    }
    if (paramString != null) {}
    try
    {
      if (paramString.moveToFirst())
      {
        i = paramString.getInt(0);
        return i;
      }
      return 0;
    }
    catch (SQLiteException localSQLiteException)
    {
      logger.error("handled: " + localSQLiteException);
      return 0;
    }
    finally
    {
      IOUtils.closeSilently(paramString);
    }
  }
  
  static long insertValues(String paramString, ContentValues paramContentValues, SQLiteDatabase paramSQLiteDatabase)
  {
    return insertValues(paramString, paramContentValues, paramSQLiteDatabase, 4);
  }
  
  static long insertValues(String paramString, ContentValues paramContentValues, SQLiteDatabase paramSQLiteDatabase, int paramInt)
  {
    long l = paramSQLiteDatabase.insertWithOnConflict(paramString, null, paramContentValues, paramInt);
    if (l == -1L) {
      logger.warn("Error occurred inserting " + paramContentValues.toString() + " into " + paramString);
    }
    return l;
  }
  
  int delete(SQLiteDatabase paramSQLiteDatabase, String paramString1, String paramString2, String[] paramArrayOfString)
  {
    return paramSQLiteDatabase.delete(paramString1, paramString2, paramArrayOfString);
  }
  
  int deleteMessage(long paramLong)
  {
    int i = 0;
    SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
    if (localSQLiteDatabase != null) {
      i = localSQLiteDatabase.delete("messages_table", "msg_id=?", new String[] { String.valueOf(paramLong) });
    }
    return i;
  }
  
  int deletePack(long paramLong)
  {
    int i = 0;
    SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
    if (localSQLiteDatabase != null) {
      i = localSQLiteDatabase.delete("packs_table", "pack_id=?", new String[] { String.valueOf(paramLong) });
    }
    return i;
  }
  
  int deletePackDownloadEntry(long paramLong)
  {
    int i = 0;
    SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
    if (localSQLiteDatabase != null) {
      i = localSQLiteDatabase.delete("packs_download_table", "download_packId=?", new String[] { String.valueOf(paramLong) });
    }
    return i;
  }
  
  @TargetApi(11)
  Cursor getActiveMessage(String paramString, String[] paramArrayOfString)
  {
    Cursor localCursor = null;
    SQLiteQueryBuilder localSQLiteQueryBuilder = new SQLiteQueryBuilder();
    localSQLiteQueryBuilder.setTables("messages_table JOIN messages_content_table ON (messages_table.msg_id = messages_content_table.msgcnt_messageId), packs_table, content_table");
    SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
    if (localSQLiteDatabase != null) {
      localCursor = localSQLiteQueryBuilder.query(localSQLiteDatabase, paramArrayOfString, "msg_type=? AND msgcnt_visited=0 AND msgcnt_contentPath NOT NULL AND (strftime('%s', datetime('now')) BETWEEN strftime('%s',msgcnt_beginDate) AND strftime('%s', msgcnt_endDate)) AND pack_id=content_packId AND pack_identifier=msgcnt_contentIdentifier AND content_purchased=0", new String[] { paramString }, null, null, "msgcnt_beginDate DESC");
    }
    return localCursor;
  }
  
  Cursor getAvailableForRestorePacksByType(String paramString1, String[] paramArrayOfString, String paramString2)
  {
    Cursor localCursor = null;
    SQLiteQueryBuilder localSQLiteQueryBuilder = new SQLiteQueryBuilder();
    localSQLiteQueryBuilder.setTables("packs_table JOIN content_table ON (packs_table.pack_id = content_table.content_packId)");
    SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
    if (localSQLiteDatabase != null) {
      localCursor = localSQLiteQueryBuilder.query(localSQLiteDatabase, paramArrayOfString, "(content_purchased=0 OR ifnull(length(content_contentPath), 0) < 1 ) AND pack_type=? AND pack_markedForDeletion=0", new String[] { paramString1 }, null, null, paramString2);
    }
    return localCursor;
  }
  
  Cursor getAvailablePacksByType(String paramString1, String[] paramArrayOfString1, String paramString2, String[] paramArrayOfString2, String paramString3)
  {
    paramString2 = null;
    paramArrayOfString2 = new SQLiteQueryBuilder();
    paramArrayOfString2.setTables("packs_table JOIN content_table ON (packs_table.pack_id = content_table.content_packId)");
    paramArrayOfString2.appendWhere("pack_finishedDownloading=1 AND ");
    paramArrayOfString2.appendWhere("pack_type='" + paramString1 + "' AND ");
    paramArrayOfString2.appendWhere("(pack_visible=1 OR (pack_visible=0 AND content_purchased=1)) AND ");
    paramArrayOfString2.appendWhere("pack_markedForDeletion=0 ");
    SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
    paramString1 = paramString2;
    if (localSQLiteDatabase != null) {
      paramString1 = paramArrayOfString2.query(localSQLiteDatabase, paramArrayOfString1, null, null, null, null, paramString3);
    }
    return paramString1;
  }
  
  Context getContext()
  {
    return mContext;
  }
  
  public Cursor getFeatured(boolean paramBoolean, int paramInt)
  {
    Cursor localCursor = null;
    StringBuilder localStringBuilder = new StringBuilder();
    if (paramBoolean)
    {
      localStringBuilder.append("SELECT * FROM (  SELECT -2 as _id, '' as identifier, 'effect' as packType, 'Featured Effects' as displayName, '' as iconPath, '' as free, '' as purchased, '' as contentPath, 0 as featureisFreeWithLogin, 0 as type)");
      localStringBuilder.append(" UNION ALL ");
    }
    Object localObject = new String[4];
    localObject[0] = "effect";
    localObject[1] = "frame";
    localObject[2] = "sticker";
    localObject[3] = "overlay";
    int i = 0;
    while (i < localObject.length)
    {
      localStringBuilder.append("SELECT * FROM (  SELECT " + -(i + 1000) + " as " + "_id" + ", " + "'' as " + "identifier" + ", " + "'" + localObject[i] + "' as " + "packType" + ", " + "'" + getPackFeaturedLabel(getContext(), localObject[i]) + "' as " + "displayName" + ", " + "'' as " + "iconPath" + ", " + "'' as " + "free" + ", " + "'' as " + "purchased" + ", " + "" + "'' as " + "contentPath" + ", " + "0 as " + "featureisFreeWithLogin" + ", " + 1 + " as " + "type" + ")");
      localStringBuilder.append(" UNION ALL ");
      localStringBuilder.append("SELECT * FROM ( SELECT pack_id as _id, pack_identifier as identifier, pack_type as packType, content_displayName as displayName, content_iconPath as iconPath, content_isFree as free, content_purchased as purchased, content_contentPath as contentPath, content_isFreeWithLogin as featureisFreeWithLogin, 2 as type FROM packs_table JOIN content_table ON ( packs_table.pack_id = content_table.content_packId) WHERE pack_type='" + localObject[i] + "'" + " AND " + "pack_visible" + "=1" + " AND " + "pack_finishedDownloading" + "=1" + " AND " + "pack_markedForDeletion" + "=0" + " ORDER BY " + "content_purchased" + " ASC, " + "pack_displayOrder" + " ASC" + " LIMIT 0, " + paramInt + " )");
      if (i + 1 < localObject.length) {
        localStringBuilder.append(" UNION ALL ");
      }
      i += 1;
    }
    localObject = getReadableDatabase();
    if (localObject != null) {
      localCursor = ((SQLiteDatabase)localObject).rawQuery(localStringBuilder.toString(), null);
    }
    return localCursor;
  }
  
  public Cursor getFeaturedBanners(int paramInt)
  {
    if (paramInt < 1) {}
    String str;
    SQLiteDatabase localSQLiteDatabase;
    do
    {
      return null;
      str = "SELECT pack_id as _id, pack_identifier as identifier, pack_type as packType, content_displayName as displayName, content_featureImageURL as featureURL, content_featureImageLocalPath as featureImageLocalPath, content_isFree as free, content_purchased as purchased, 0 as type FROM (SELECT * FROM content_table JOIN packs_table ON (packs_table.pack_id=content_table.content_packId) WHERE ifnull(length(content_featureImageURL), 0) > 0 AND pack_visible=1 AND pack_markedForDeletion=0 ORDER BY content_isFree DESC, pack_displayOrder DESC, pack_id DESC ) GROUP BY pack_type LIMIT 0, " + paramInt;
      localSQLiteDatabase = getReadableDatabase();
    } while (localSQLiteDatabase == null);
    return localSQLiteDatabase.rawQuery(str, null);
  }
  
  Cursor getFutureMessages(String paramString, String[] paramArrayOfString)
  {
    Cursor localCursor = null;
    SQLiteQueryBuilder localSQLiteQueryBuilder = new SQLiteQueryBuilder();
    localSQLiteQueryBuilder.setTables("messages_table JOIN messages_content_table ON (messages_table.msg_id = messages_content_table.msgcnt_messageId), packs_table, content_table");
    SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
    if (localSQLiteDatabase != null) {
      localCursor = localSQLiteQueryBuilder.query(localSQLiteDatabase, paramArrayOfString, "msg_type=? AND msgcnt_visited=0 AND ( strftime('%s', datetime('now')) BETWEEN strftime('%s',msgcnt_beginDate) AND strftime('%s', msgcnt_endDate) ) AND pack_id=content_packId AND pack_identifier=msgcnt_contentIdentifier AND content_purchased=0", new String[] { paramString }, null, null, "msgcnt_beginDate DESC");
    }
    return localCursor;
  }
  
  Cursor getHiddenPacksByType(String paramString1, String[] paramArrayOfString1, String paramString2, String[] paramArrayOfString2, String paramString3)
  {
    paramArrayOfString2 = null;
    SQLiteQueryBuilder localSQLiteQueryBuilder = new SQLiteQueryBuilder();
    localSQLiteQueryBuilder.setTables("packs_table JOIN content_table ON (packs_table.pack_id = content_table.content_packId)");
    localSQLiteQueryBuilder.appendWhere("pack_finishedDownloading=1 AND ");
    localSQLiteQueryBuilder.appendWhere("pack_type='" + paramString1 + "' AND ");
    paramString1 = new StringBuilder();
    paramString1.append("pack_visible=0 AND content_purchased=0");
    if (paramString2 != null)
    {
      paramString1.append(" AND ");
      paramString1.append(paramString2);
    }
    paramString1.append(" AND ");
    localSQLiteQueryBuilder.appendWhere(paramString1);
    localSQLiteQueryBuilder.appendWhere("pack_markedForDeletion=0 ");
    paramString2 = getReadableDatabase();
    paramString1 = paramArrayOfString2;
    if (paramString2 != null) {
      paramString1 = localSQLiteQueryBuilder.query(paramString2, paramArrayOfString1, null, null, null, null, paramString3);
    }
    return paramString1;
  }
  
  Cursor getInstalledPacks(String[] paramArrayOfString, String paramString)
  {
    SQLiteQueryBuilder localSQLiteQueryBuilder = new SQLiteQueryBuilder();
    localSQLiteQueryBuilder.setTables("packs_table JOIN content_table ON (packs_table.pack_id = content_table.content_packId)");
    SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
    if (localSQLiteDatabase == null) {
      return null;
    }
    return localSQLiteQueryBuilder.query(localSQLiteDatabase, paramArrayOfString, "content_purchased=1  AND pack_markedForDeletion=0 AND content_contentPath NOT NULL ", null, null, null, paramString);
  }
  
  Cursor getInstalledPacksByType(String paramString1, String[] paramArrayOfString, String paramString2)
  {
    Cursor localCursor = null;
    SQLiteQueryBuilder localSQLiteQueryBuilder = new SQLiteQueryBuilder();
    localSQLiteQueryBuilder.setTables("packs_table JOIN content_table ON (packs_table.pack_id = content_table.content_packId)");
    SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
    if (localSQLiteDatabase != null) {
      localCursor = localSQLiteQueryBuilder.query(localSQLiteDatabase, paramArrayOfString, "content_purchased=1  AND pack_type=? AND pack_markedForDeletion=0 AND content_contentPath NOT NULL ", new String[] { paramString1 }, null, null, paramString2);
    }
    return localCursor;
  }
  
  Cursor getManifestVersion(String[] paramArrayOfString)
  {
    Cursor localCursor = null;
    SQLiteQueryBuilder localSQLiteQueryBuilder = new SQLiteQueryBuilder();
    localSQLiteQueryBuilder.setTables("version_table");
    SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
    if (localSQLiteDatabase != null) {
      localCursor = localSQLiteQueryBuilder.query(localSQLiteDatabase, paramArrayOfString, null, null, null, null, "version_id DESC");
    }
    return localCursor;
  }
  
  Cursor getMessageByIdentifier(String paramString, String[] paramArrayOfString)
  {
    Cursor localCursor = null;
    SQLiteQueryBuilder localSQLiteQueryBuilder = new SQLiteQueryBuilder();
    localSQLiteQueryBuilder.setTables("messages_table");
    SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
    if (localSQLiteDatabase != null) {
      localCursor = localSQLiteQueryBuilder.query(localSQLiteDatabase, paramArrayOfString, "msg_identifier=?", new String[] { paramString }, null, null, null);
    }
    return localCursor;
  }
  
  Cursor getMessageContent(long paramLong, String[] paramArrayOfString)
  {
    Cursor localCursor = null;
    SQLiteQueryBuilder localSQLiteQueryBuilder = new SQLiteQueryBuilder();
    localSQLiteQueryBuilder.setTables("messages_table JOIN messages_content_table ON (messages_table.msg_id = messages_content_table.msgcnt_messageId)");
    SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
    if (localSQLiteDatabase != null) {
      localCursor = localSQLiteQueryBuilder.query(localSQLiteDatabase, paramArrayOfString, "msg_id=?", new String[] { String.valueOf(paramLong) }, null, null, null);
    }
    return localCursor;
  }
  
  Cursor getMessages(String[] paramArrayOfString1, String paramString, String[] paramArrayOfString2)
  {
    Cursor localCursor = null;
    SQLiteQueryBuilder localSQLiteQueryBuilder = new SQLiteQueryBuilder();
    localSQLiteQueryBuilder.setTables("messages_table");
    SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
    if (localSQLiteDatabase != null) {
      localCursor = localSQLiteQueryBuilder.query(localSQLiteDatabase, paramArrayOfString1, paramString, paramArrayOfString2, null, null, null);
    }
    return localCursor;
  }
  
  @TargetApi(11)
  Cursor getNextMessage(String paramString, String[] paramArrayOfString)
  {
    Cursor localCursor = null;
    SQLiteQueryBuilder localSQLiteQueryBuilder = new SQLiteQueryBuilder();
    localSQLiteQueryBuilder.setTables("messages_table JOIN messages_content_table ON (messages_table.msg_id = messages_content_table.msgcnt_messageId), packs_table, content_table");
    SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
    if (localSQLiteDatabase != null) {
      localCursor = localSQLiteQueryBuilder.query(localSQLiteDatabase, paramArrayOfString, "msg_type=? AND msgcnt_visited=0 AND msgcnt_contentPath IS NULL AND ( strftime('%s', datetime('now')) BETWEEN strftime('%s',msgcnt_beginDate) AND strftime('%s', msgcnt_endDate) ) AND pack_id=content_packId AND pack_identifier=msgcnt_contentIdentifier AND content_purchased=0", new String[] { paramString }, null, null, "msgcnt_beginDate DESC");
    }
    return localCursor;
  }
  
  Cursor getPackById(long paramLong, String[] paramArrayOfString)
  {
    Cursor localCursor = null;
    SQLiteQueryBuilder localSQLiteQueryBuilder = new SQLiteQueryBuilder();
    localSQLiteQueryBuilder.setTables("packs_table");
    SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
    if (localSQLiteDatabase != null) {
      localCursor = localSQLiteQueryBuilder.query(localSQLiteDatabase, paramArrayOfString, "pack_id=?", new String[] { String.valueOf(paramLong) }, null, null, null);
    }
    return localCursor;
  }
  
  Cursor getPackByIdentifier(String paramString, String[] paramArrayOfString)
  {
    Cursor localCursor = null;
    SQLiteQueryBuilder localSQLiteQueryBuilder = new SQLiteQueryBuilder();
    localSQLiteQueryBuilder.setTables("packs_table");
    SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
    if (localSQLiteDatabase != null) {
      localCursor = localSQLiteQueryBuilder.query(localSQLiteDatabase, paramArrayOfString, "pack_identifier=?", new String[] { paramString }, null, null, null);
    }
    return localCursor;
  }
  
  Cursor getPackContentById(int paramInt, String[] paramArrayOfString)
  {
    Cursor localCursor = null;
    SQLiteQueryBuilder localSQLiteQueryBuilder = new SQLiteQueryBuilder();
    SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
    localSQLiteQueryBuilder.setTables("packs_table JOIN content_table ON (packs_table.pack_id = content_table.content_packId)");
    if (localSQLiteDatabase != null) {
      localCursor = localSQLiteQueryBuilder.query(localSQLiteDatabase, paramArrayOfString, "packs_table.pack_id=?", new String[] { String.valueOf(paramInt) }, null, null, null);
    }
    return localCursor;
  }
  
  Cursor getPackContentByIdentifier(String paramString, String[] paramArrayOfString)
  {
    Cursor localCursor = null;
    SQLiteQueryBuilder localSQLiteQueryBuilder = new SQLiteQueryBuilder();
    localSQLiteQueryBuilder.setTables("packs_table JOIN content_table ON (packs_table.pack_id = content_table.content_packId)");
    SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
    if (localSQLiteDatabase != null) {
      localCursor = localSQLiteQueryBuilder.query(localSQLiteDatabase, paramArrayOfString, "packs_table.pack_identifier=?", new String[] { paramString }, null, null, null);
    }
    return localCursor;
  }
  
  Cursor getPackDownloadStatus(String paramString, String[] paramArrayOfString)
  {
    Cursor localCursor = null;
    SQLiteQueryBuilder localSQLiteQueryBuilder = new SQLiteQueryBuilder();
    localSQLiteQueryBuilder.setTables("packs_download_table");
    SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
    if (localSQLiteDatabase != null) {
      localCursor = localSQLiteQueryBuilder.query(localSQLiteDatabase, paramArrayOfString, "download_packId=?", new String[] { String.valueOf(paramString) }, null, null, null);
    }
    return localCursor;
  }
  
  Cursor getPackIdOfDownload(String paramString, String[] paramArrayOfString)
  {
    Cursor localCursor = null;
    SQLiteQueryBuilder localSQLiteQueryBuilder = new SQLiteQueryBuilder();
    localSQLiteQueryBuilder.setTables("packs_download_table");
    SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
    if (localSQLiteDatabase != null) {
      localCursor = localSQLiteQueryBuilder.query(localSQLiteDatabase, paramArrayOfString, "download_refId=?", new String[] { String.valueOf(paramString) }, null, null, null);
    }
    return localCursor;
  }
  
  Cursor getPackItemById(long paramLong, String[] paramArrayOfString)
  {
    Cursor localCursor = null;
    SQLiteQueryBuilder localSQLiteQueryBuilder = new SQLiteQueryBuilder();
    localSQLiteQueryBuilder.setTables("items_table");
    SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
    if (localSQLiteDatabase != null) {
      localCursor = localSQLiteQueryBuilder.query(localSQLiteDatabase, paramArrayOfString, "item_id=?", new String[] { String.valueOf(paramLong) }, null, null, null);
    }
    return localCursor;
  }
  
  @TargetApi(11)
  Cursor getPackItemByIdentifier(String paramString1, String paramString2, String[] paramArrayOfString1, String paramString3, String[] paramArrayOfString2)
  {
    Object localObject = null;
    SQLiteQueryBuilder localSQLiteQueryBuilder = new SQLiteQueryBuilder();
    localSQLiteQueryBuilder.setTables("packs_table, content_table, items_table");
    localSQLiteQueryBuilder.appendWhere("pack_id= content_packId AND item_packId=pack_id");
    localSQLiteQueryBuilder.appendWhere(" AND pack_identifier=");
    localSQLiteQueryBuilder.appendWhereEscapeString(paramString1);
    localSQLiteQueryBuilder.appendWhere(" AND item_identifier=");
    localSQLiteQueryBuilder.appendWhereEscapeString(paramString2);
    paramString2 = getReadableDatabase();
    paramString1 = localObject;
    if (paramString2 != null) {
      paramString1 = localSQLiteQueryBuilder.query(paramString2, paramArrayOfString1, paramString3, paramArrayOfString2, null, null, null);
    }
    return paramString1;
  }
  
  Cursor getPackItems(int paramInt, String[] paramArrayOfString)
  {
    Cursor localCursor = null;
    SQLiteQueryBuilder localSQLiteQueryBuilder = new SQLiteQueryBuilder();
    localSQLiteQueryBuilder.setTables("packs_table JOIN items_table ON (packs_table.pack_id = items_table.item_packId)");
    SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
    if (localSQLiteDatabase != null) {
      localCursor = localSQLiteQueryBuilder.query(localSQLiteDatabase, paramArrayOfString, "pack_id=?", new String[] { String.valueOf(paramInt) }, null, null, null);
    }
    return localCursor;
  }
  
  Cursor getPacks(String[] paramArrayOfString1, String paramString, String[] paramArrayOfString2)
  {
    Cursor localCursor = null;
    SQLiteQueryBuilder localSQLiteQueryBuilder = new SQLiteQueryBuilder();
    localSQLiteQueryBuilder.setTables("packs_table");
    SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
    if (localSQLiteDatabase != null) {
      localCursor = localSQLiteQueryBuilder.query(localSQLiteDatabase, paramArrayOfString1, paramString, paramArrayOfString2, null, null, null);
    }
    return localCursor;
  }
  
  Cursor getPacksContent(String[] paramArrayOfString1, String paramString1, String[] paramArrayOfString2, String paramString2)
  {
    Cursor localCursor = null;
    SQLiteQueryBuilder localSQLiteQueryBuilder = new SQLiteQueryBuilder();
    localSQLiteQueryBuilder.setTables("packs_table JOIN content_table ON (packs_table.pack_id = content_table.content_packId)");
    SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
    if (localSQLiteDatabase != null) {
      localCursor = localSQLiteQueryBuilder.query(localSQLiteDatabase, paramArrayOfString1, paramString1, paramArrayOfString2, null, null, paramString2);
    }
    return localCursor;
  }
  
  Cursor getPermissions(String[] paramArrayOfString)
  {
    Cursor localCursor = null;
    SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
    if (localSQLiteDatabase != null) {
      localCursor = localSQLiteDatabase.query("permission_table", paramArrayOfString, null, null, null, null, "perm_id DESC");
    }
    return localCursor;
  }
  
  Cursor getTray(String paramString, int paramInt, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, boolean paramBoolean4)
  {
    int j = getTrayFeaturedCount(paramString, paramBoolean1);
    int k = getTrayInstalledCount(paramString);
    int i;
    StringBuilder localStringBuilder1;
    if ((j > 1) || (k > 1))
    {
      i = 1;
      logger.log("availableFeatured: %d", new Object[] { Integer.valueOf(j) });
      logger.log("installedCount: %d", new Object[] { Integer.valueOf(k) });
      localStringBuilder1 = new StringBuilder();
      if (i != 0) {
        localStringBuilder1.append("SELECT -1 as _id, -1 as _order, '' as packagename, '' as identifier, 5 as type, '' as displayName, '' as path, '' as installDate, 0 as isFree, -1 as packId, '' as packDisplayName, 0 as isFreeWithLogin UNION ALL ");
      }
      StringBuilder localStringBuilder2 = new StringBuilder().append(" SELECT * from ( SELECT * from (SELECT pack_id as _id, pack_displayOrder as _order, pack_identifier as packagename, pack_identifier as identifier, 1 as type, content_displayName as displayName, content_iconPath as path, content_installDate as installDate, content_isFree as isFree, pack_id as packId, content_displayName as packDisplayName, content_isFreeWithLogin as isFreeWithLogin FROM packs_table, content_table WHERE pack_id=content_packId AND pack_visible=1 AND pack_finishedDownloading=1");
      if (!paramBoolean1) {
        break label382;
      }
      localObject = " AND content_isFree=1";
      label122:
      localStringBuilder1.append((String)localObject + " AND " + "content_iconPath" + " NOT NULL " + " AND " + "content_purchased" + "=0 " + " AND " + "pack_type" + "=? " + " ORDER BY " + "pack_displayOrder" + " ASC LIMIT " + paramInt + " )" + " ORDER BY " + "_order" + " DESC )");
      j = 0 + 1;
      if ((paramBoolean4) && (k > 0)) {
        localStringBuilder1.append("UNION ALL SELECT -1 as _id, -1 as _order, '' as packagename, '' as identifier, 7 as type, '' as displayName, '' as path, '' as installDate, 0 as isFree, -1 as packId, '' as packDisplayName, 0 as isFreeWithLogin");
      }
      if ((paramBoolean2) || (paramBoolean3)) {
        localStringBuilder1.append(" UNION ALL SELECT * from (");
      }
      paramInt = j;
      if (paramBoolean3)
      {
        localStringBuilder1.append("SELECT DISTINCT pack_id as _id, (pack_id * 10000) as _order, pack_identifier as packagename, pack_identifier as identifier, 2 as type, content_displayName as displayName, content_iconPath as path, content_installDate as installDate, content_isFree as isFree, pack_id as packId, content_displayName as packDisplayName, content_isFreeWithLogin as isFreeWithLogin FROM packs_table, content_table, items_table WHERE pack_id=content_packId  AND pack_id=item_packId AND pack_type=?  AND content_purchased=1  AND content_contentPath NOT NULL");
        paramInt = j + 1;
      }
      if (!paramBoolean2) {
        break label389;
      }
      if (paramBoolean3) {
        localStringBuilder1.append(" UNION ALL");
      }
      localStringBuilder1.append(" SELECT item_id as _id, ((pack_id * 10000) + item_id ) as _order, pack_identifier as packagename, item_identifier as identifier, 0 as type, item_displayName as displayName, content_contentPath as path, content_installDate as installDate, content_isFree as isFree, pack_id as packId, content_displayName as packDisplayName, content_isFreeWithLogin as isFreeWithLogin FROM packs_table, content_table, items_table WHERE pack_id=content_packId AND pack_id=item_packId AND pack_type=?  AND content_purchased=1  AND content_contentPath NOT NULL  ORDER BY installDate DESC, _order ASC)");
      j = paramInt + 1;
    }
    for (;;)
    {
      if (i != 0) {
        localStringBuilder1.append(" UNION ALL SELECT -1 as _id, -1 as _order, '' as packagename, '' as identifier, 6 as type, '' as displayName, '' as path, '' as installDate, 0 as isFree, -1 as packId, '' as packDisplayName, 0 as isFreeWithLogin");
      }
      localObject = new ArrayList(j);
      paramInt = 0;
      while (paramInt < j)
      {
        ((List)localObject).add(paramString);
        paramInt += 1;
      }
      i = 0;
      break;
      label382:
      localObject = "";
      break label122;
      label389:
      j = paramInt;
      if (paramBoolean3)
      {
        localStringBuilder1.append(" ORDER BY installDate DESC, _order ASC)");
        j = paramInt;
      }
    }
    paramString = (String[])((List)localObject).toArray(new String[((List)localObject).size()]);
    Object localObject = getReadableDatabase();
    if (localObject != null) {
      return ((SQLiteDatabase)localObject).rawQuery(localStringBuilder1.toString(), paramString);
    }
    return null;
  }
  
  long insertValues(String paramString, ContentValues paramContentValues)
  {
    return insertValues(paramString, paramContentValues, getWritableDatabase(), 4);
  }
  
  public void onConfigure(SQLiteDatabase paramSQLiteDatabase)
  {
    logger.info("onConfigure");
    if (!paramSQLiteDatabase.isReadOnly())
    {
      paramSQLiteDatabase.execSQL("PRAGMA foreign_keys=ON;");
      paramSQLiteDatabase.execSQL("PRAGMA encoding=\"UTF-8\";");
      paramSQLiteDatabase.execSQL("PRAGMA page_size=4096;");
      paramSQLiteDatabase.execSQL("PRAGMA cache_size=5000;");
    }
  }
  
  public void onCreate(SQLiteDatabase paramSQLiteDatabase)
  {
    logger.info("onCreate");
    paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS version_table (version_id INTEGER PRIMARY KEY AUTOINCREMENT, version_versionKey VARCHAR(255) NOT NULL, version_assetsBaseURL VARCHAR(255) NOT NULL );");
    paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS packs_table (pack_id INTEGER PRIMARY KEY AUTOINCREMENT, pack_identifier VARCHAR(255) NOT NULL UNIQUE, pack_type VARCHAR(255) NOT NULL, pack_finishedDownloading INTEGER NOT NULL DEFAULT 0, pack_markedForDeletion INTEGER NOT NULL DEFAULT 0, pack_visible INTEGER NOT NULL DEFAULT 1, pack_displayOrder INTEGER NOT NULL DEFAULT 0 ,pack_creationDate DATETIME DEFAULT (datetime('now','localtime')), pack_versionKey VARCHAR(255) NOT NULL);");
    paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS messages_table (msg_id INTEGER PRIMARY KEY AUTOINCREMENT, msg_type VARCHAR(255) NOT NULL, msg_identifier VARCHAR(255) NOT NULL UNIQUE, msg_versionKey VARCHAR(255) NOT NULL);");
    paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS messages_content_table ( msgcnt_id INTEGER PRIMARY KEY AUTOINCREMENT, msgcnt_messageId INTEGER NOT NULL, msgcnt_contentIdentifier VARCHAR(255), msgcnt_beginDate DATETIME, msgcnt_endDate DATETIME, msgcnt_contentURL TEXT NOT NULL, msgcnt_actionButton VARCHAR(255), msgcnt_dismissButton VARCHAR(255) NOT NULL, msgcnt_layoutStyle VARCHAR(255), msgcnt_paragraph TEXT NOT NULL, msgcnt_showNewBanner INTEGER NOT NULL DEFAULT 1, msgcnt_contentPath TEXT DEFAULT NULL, msgcnt_visited INTEGER NOT NULL DEFAULT 0, msgcnt_title VARCHAR(255),  FOREIGN KEY( msgcnt_messageId ) REFERENCES messages_table( msg_id ) ON DELETE CASCADE );");
    paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS content_table (content_id INTEGER PRIMARY KEY AUTOINCREMENT, content_packId INTEGER NOT NULL, content_contentVersion VARCHAR(255) NOT NULL, content_previewVersion VARCHAR(255) NOT NULL, content_iconVersion VARCHAR(255) NOT NULL,content_previewURL VARCHAR(255) NOT NULL, content_contentURL VARCHAR(255) NOT NULL, content_iconUrl VARCHAR(255) NOT NULL, content_isFree INTEGER DEFAULT 0, content_isFreeWithLogin INTEGER DEFAULT 0, content_displayName VARCHAR(255) NOT NULL, content_displayDescription VARCHAR(255), content_downloadRequested INTEGER NOT NULL DEFAULT 0, content_purchased INTEGER NOT NULL DEFAULT 0, content_previewPath VARCHAR(255), content_contentPath VARCHAR(255), content_author VARCHAR(255) DEFAULT '', content_authorHyperlink VARCHAR(255) DEFAULT '', content_socialMediaString VARCHAR(255) DEFAULT '', content_shopBackgroundColor VARCHAR(255) DEFAULT '', content_featureImageURL VARCHAR(255) DEFAULT '', content_featureImageVersion VARCHAR(255) DEFAULT '', content_detailImageURL VARCHAR(255) DEFAULT '', content_detailImageVersion VARCHAR(255) DEFAULT '', content_detailImageLocalPath VARCHAR(255) DEFAULT '', content_featureImageLocalPath VARCHAR(255) DEFAULT '', content_iconPath VARCHAR(255), content_iconNeedDownload INTEGER NOT NULL DEFAULT 0, content_previewNeedDownload INTEGER NOT NULL DEFAULT 0, content_contentNeedDownload INTEGER NOT NULL DEFAULT 0, content_installDate DATETIME NOT NULL DEFAULT (datetime(current_timestamp)), content_numItems INTEGER DEFAULT 0, FOREIGN KEY(content_packId) REFERENCES packs_table(pack_id) ON DELETE CASCADE);");
    paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS items_table (item_id INTEGER PRIMARY KEY AUTOINCREMENT, item_identifier VARCHAR(255) NOT NULL, item_displayName VARCHAR(255), item_contentPath VARCHAR(255), item_options BLOB, item_packId INTEGER NOT NULL, FOREIGN KEY(item_packId) REFERENCES packs_table(pack_id) ON DELETE CASCADE);");
    paramSQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS packs_download_table (downloadId INTEGER PRIMARY KEY AUTOINCREMENT, download_packId INTEGER NOT NULL UNIQUE, download_refId INTEGER, download_status INTEGER DEFAULT 0, FOREIGN KEY(download_packId) REFERENCES packs_table(pack_id) ON DELETE CASCADE);");
    PermissionColumns.create(paramSQLiteDatabase);
    SubscriptionsColumns.create(paramSQLiteDatabase);
    SubscriptionsContentColumns.create(paramSQLiteDatabase);
    paramSQLiteDatabase.execSQL("CREATE TRIGGER notify_download_finished AFTER UPDATE OF content_iconPath ON content_table BEGIN UPDATE packs_table SET pack_finishedDownloading = 1 WHERE packs_table.pack_id = OLD.content_packId; END;");
  }
  
  public void onDowngrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2)
  {
    logger.info("onDowngrade from %d to %d", new Object[] { Integer.valueOf(paramInt1), Integer.valueOf(paramInt2) });
    if (getContext().deleteDatabase("aviarycds.sqlite")) {
      onCreate(paramSQLiteDatabase);
    }
  }
  
  public void onOpen(SQLiteDatabase paramSQLiteDatabase)
  {
    logger.info("onOpen, isReadOnly: %b", new Object[] { Boolean.valueOf(paramSQLiteDatabase.isReadOnly()) });
    if (!paramSQLiteDatabase.isReadOnly())
    {
      if (Build.VERSION.SDK_INT < 16) {
        onConfigure(paramSQLiteDatabase);
      }
      new CdsDefaultContentLoader(mContext).loadDefaultContent(paramSQLiteDatabase);
    }
    super.onOpen(paramSQLiteDatabase);
  }
  
  public void onUpgrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2)
  {
    if (paramSQLiteDatabase.isReadOnly()) {
      logger.warn("Could not upgrade table, db is read only");
    }
    do
    {
      return;
      logger.info("onUpgrade: %d >> %d", new Object[] { Integer.valueOf(paramInt1), Integer.valueOf(paramInt2) });
      if (paramInt1 <= 3) {
        PermissionColumns.create(paramSQLiteDatabase);
      }
      if (paramInt1 <= 4)
      {
        SubscriptionsColumns.create(paramSQLiteDatabase);
        SubscriptionsContentColumns.create(paramSQLiteDatabase);
      }
      if (paramInt1 <= 5)
      {
        paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS subscription_table");
        paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS subscriptions_content_table");
        SubscriptionsColumns.create(paramSQLiteDatabase);
        SubscriptionsContentColumns.create(paramSQLiteDatabase);
      }
      if (paramInt1 <= 6)
      {
        paramSQLiteDatabase.execSQL("ALTER TABLE content_table ADD COLUMN content_author VARCHAR(255) DEFAULT ''");
        paramSQLiteDatabase.execSQL("ALTER TABLE content_table ADD COLUMN content_authorHyperlink VARCHAR(255) DEFAULT ''");
        paramSQLiteDatabase.execSQL("ALTER TABLE content_table ADD COLUMN content_socialMediaString VARCHAR(255) DEFAULT ''");
        paramSQLiteDatabase.execSQL("ALTER TABLE content_table ADD COLUMN content_shopBackgroundColor VARCHAR(255) DEFAULT ''");
        paramSQLiteDatabase.execSQL("ALTER TABLE content_table ADD COLUMN content_featureImageURL VARCHAR(255) DEFAULT ''");
        paramSQLiteDatabase.execSQL("ALTER TABLE content_table ADD COLUMN content_featureImageVersion VARCHAR(255) DEFAULT ''");
        paramSQLiteDatabase.execSQL("ALTER TABLE content_table ADD COLUMN content_detailImageURL VARCHAR(255) DEFAULT ''");
        paramSQLiteDatabase.execSQL("ALTER TABLE content_table ADD COLUMN content_detailImageVersion VARCHAR(255) DEFAULT ''");
      }
      if (paramInt1 <= 7)
      {
        paramSQLiteDatabase.execSQL("ALTER TABLE content_table ADD COLUMN content_detailImageLocalPath VARCHAR(255) DEFAULT ''");
        paramSQLiteDatabase.execSQL("ALTER TABLE content_table ADD COLUMN content_featureImageLocalPath VARCHAR(255) DEFAULT ''");
      }
    } while ((paramInt1 <= 8) && (paramInt1 > 9));
    paramSQLiteDatabase.execSQL("ALTER TABLE content_table ADD COLUMN content_isFreeWithLogin INTEGER DEFAULT 0");
  }
  
  long replacePermissions(ContentValues paramContentValues)
  {
    long l = 0L;
    SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
    if (localSQLiteDatabase != null) {
      localSQLiteDatabase.beginTransaction();
    }
    try
    {
      delete(localSQLiteDatabase, "permission_table", null, null);
      l = insertValues("permission_table", paramContentValues, localSQLiteDatabase);
      localSQLiteDatabase.setTransactionSuccessful();
      return l;
    }
    finally
    {
      localSQLiteDatabase.setTransactionSuccessful();
    }
  }
  
  int setMessageasVisited(long paramLong, int paramInt)
  {
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("msgcnt_visited", Integer.valueOf(paramInt));
    SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
    if (localSQLiteDatabase != null) {
      return localSQLiteDatabase.update("messages_content_table", localContentValues, "msgcnt_id=?", new String[] { String.valueOf(paramLong) });
    }
    return -1;
  }
  
  int updateDownloadStatus(long paramLong, int paramInt)
  {
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("download_status", Integer.valueOf(paramInt));
    SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
    if (localSQLiteDatabase != null) {
      return localSQLiteDatabase.update("packs_download_table", localContentValues, "download_refId=?", new String[] { String.valueOf(paramLong) });
    }
    return -1;
  }
  
  int updateMessage(long paramLong, ContentValues paramContentValues)
  {
    SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
    if (localSQLiteDatabase != null) {
      return localSQLiteDatabase.update("messages_table", paramContentValues, "msg_id=?", new String[] { String.valueOf(paramLong) });
    }
    return -1;
  }
  
  int updateMessageContent(long paramLong1, long paramLong2, ContentValues paramContentValues)
  {
    SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
    if (localSQLiteDatabase != null) {
      return localSQLiteDatabase.update("messages_content_table", paramContentValues, "msgcnt_messageId=? AND msgcnt_id=?", new String[] { String.valueOf(paramLong1), String.valueOf(paramLong2) });
    }
    return -1;
  }
  
  int updatePack(long paramLong, ContentValues paramContentValues)
  {
    return updatePack(paramLong, paramContentValues, getWritableDatabase());
  }
  
  int updatePack(long paramLong, ContentValues paramContentValues, SQLiteDatabase paramSQLiteDatabase)
  {
    if (paramSQLiteDatabase != null) {
      return paramSQLiteDatabase.update("packs_table", paramContentValues, "pack_id=?", new String[] { String.valueOf(paramLong) });
    }
    return -1;
  }
  
  int updatePackContent(long paramLong1, long paramLong2, ContentValues paramContentValues)
  {
    return updatePackContent(paramLong1, paramLong2, paramContentValues, getWritableDatabase());
  }
  
  int updatePackContent(long paramLong1, long paramLong2, ContentValues paramContentValues, SQLiteDatabase paramSQLiteDatabase)
  {
    if (paramSQLiteDatabase != null) {
      return paramSQLiteDatabase.update("content_table", paramContentValues, "content_id=? AND content_packId=?", new String[] { String.valueOf(paramLong2), String.valueOf(paramLong1) });
    }
    return -1;
  }
  
  int updatePackContentPurchasedStatus(long paramLong1, long paramLong2, int paramInt, String paramString)
  {
    logger.info("updatePackContentPurchasedstatus: %d, content: %s", new Object[] { Long.valueOf(paramLong1), paramString });
    ContentValues localContentValues = new ContentValues();
    if (paramString != null)
    {
      localContentValues.put("content_contentPath", paramString);
      localContentValues.put("content_installDate", DateTimeUtils.toSqlDateTime(System.currentTimeMillis()));
    }
    for (;;)
    {
      localContentValues.put("content_purchased", Integer.valueOf(paramInt));
      paramString = getWritableDatabase();
      if (paramString == null) {
        break;
      }
      return paramString.update("content_table", localContentValues, "content_id=? AND content_packId=?", new String[] { String.valueOf(paramLong2), String.valueOf(paramLong1) });
      localContentValues.putNull("content_contentPath");
    }
    return -1;
  }
  
  int updatePackContentRequestDownloadStatus(long paramLong, int paramInt)
  {
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("content_downloadRequested", Integer.valueOf(paramInt));
    SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
    if (localSQLiteDatabase != null) {
      return localSQLiteDatabase.update("content_table", localContentValues, "content_packId=?", new String[] { String.valueOf(paramLong) });
    }
    return -1;
  }
}
