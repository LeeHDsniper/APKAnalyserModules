package com.adobe.creativesdk.aviary.internal.cds;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import com.adobe.creativesdk.aviary.internal.cds.json.CdsManifestParser;
import com.adobe.creativesdk.aviary.internal.cds.json.CdsManifestParser.ManifestPackItem;
import com.adobe.creativesdk.aviary.internal.utils.IOUtils;
import com.adobe.creativesdk.aviary.internal.utils.PackageManagerUtils;
import com.adobe.creativesdk.aviary.internal.utils.SystemUtils;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import java.io.File;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

public final class CdsManifestPackRemoverConsumer
{
  private static LoggerFactory.Logger logger = LoggerFactory.getLogger("AviaryCdsManifestPackRemoverConsumer");
  private final Context mContext;
  private final List<Throwable> mException;
  private final CdsManifestParser mManifestParser;
  private final Operations mOperations;
  private final HashSet<String> mRemovedPackTypes;
  
  private CdsManifestPackRemoverConsumer(Context paramContext, CdsManifestParser paramCdsManifestParser, Operations paramOperations)
  {
    mContext = paramContext;
    mManifestParser = paramCdsManifestParser;
    mRemovedPackTypes = new HashSet();
    mException = new ArrayList();
    mOperations = paramOperations;
  }
  
  private void deletePacks()
  {
    if ((mManifestParser.hasContent()) && (mManifestParser.hasDeletedPacks()))
    {
      Iterator localIterator = mManifestParser.getDeletedPacks().iterator();
      while (localIterator.hasNext())
      {
        CdsManifestParser.ManifestPackItem localManifestPackItem = (CdsManifestParser.ManifestPackItem)localIterator.next();
        if (localManifestPackItem != null)
        {
          logger.warn("%s need to be hard removed", new Object[] { localManifestPackItem.getIdentifier() });
          PacksColumns.PackCursorWrapper localPackCursorWrapper = CdsUtils.getPackByIdentifier(mContext, localManifestPackItem.getIdentifier(), null);
          if (localPackCursorWrapper != null) {
            if (mContext.getContentResolver().delete(PackageManagerUtils.getCDSProviderContentUri(mContext, "pack/id/" + localPackCursorWrapper.getId() + "/remove"), null, null) > 0)
            {
              logger.log("removed %s, now remove its contents", new Object[] { localManifestPackItem.getIdentifier() });
              mRemovedPackTypes.add(localPackCursorWrapper.getPackType());
              if (mOperations != null) {
                mOperations.delete();
              }
              deletePackFiles(localManifestPackItem);
            }
            else
            {
              logger.error("failed to remove entry. result = 0");
            }
          }
        }
      }
    }
  }
  
  private void hidePacks()
  {
    if ((mManifestParser.hasContent()) && (mManifestParser.hasEnabledPacks()))
    {
      Cursor localCursor = CdsUtils.getPacksList(mContext, new String[] { "pack_id", "pack_identifier", "pack_type" }, "pack_visible=1", null);
      if (localCursor != null)
      {
        for (;;)
        {
          try
          {
            if (!localCursor.moveToNext()) {
              break;
            }
            PacksColumns.PackCursorWrapper localPackCursorWrapper = PacksColumns.PackCursorWrapper.create(localCursor);
            if ((localPackCursorWrapper != null) && (!mManifestParser.containsEnabledPack(localPackCursorWrapper.getIdentifier())))
            {
              logger.warn("%s need to be hidden", new Object[] { localPackCursorWrapper.getIdentifier() });
              ContentValues localContentValues = new ContentValues();
              localContentValues.put("pack_visible", Integer.valueOf(0));
              if (mContext.getContentResolver().update(PackageManagerUtils.getCDSProviderContentUri(mContext, "pack/id/" + localPackCursorWrapper.getId() + "/update"), localContentValues, null, null) > 0)
              {
                mRemovedPackTypes.add(localPackCursorWrapper.getPackType());
                if (mOperations != null) {
                  mOperations.hide();
                }
              }
              else
              {
                logger.error("failed to update entry. result = 0");
              }
            }
          }
          finally
          {
            IOUtils.closeSilently(localCursor);
          }
        }
        IOUtils.closeSilently(localCursor);
      }
    }
  }
  
  void consume()
  {
    
    try
    {
      deletePacks();
      hidePacks();
      return;
    }
    catch (Throwable localThrowable)
    {
      mException.add(localThrowable);
    }
  }
  
  void deletePackFiles(CdsManifestParser.ManifestPackItem paramManifestPackItem)
  {
    paramManifestPackItem = CdsUtils.getPackRootContent(paramManifestPackItem.getIdentifier());
    IOUtils.deleteQuietly(new File(mContext.getFilesDir(), paramManifestPackItem));
  }
  
  List<Throwable> getExceptions()
  {
    return mException;
  }
  
  public HashSet<String> getRemovedPacksType()
  {
    return mRemovedPackTypes;
  }
  
  static class Builder
  {
    private final Context context;
    private Operations operations;
    private CdsManifestParser parser;
    
    Builder(Context paramContext)
    {
      context = paramContext;
    }
    
    CdsManifestPackRemoverConsumer build()
    {
      if (context == null) {
        throw new IllegalArgumentException("Context is null");
      }
      if (parser == null) {
        throw new IllegalArgumentException("Parser is null");
      }
      return new CdsManifestPackRemoverConsumer(context, parser, operations, null);
    }
    
    Builder withOperations(Operations paramOperations)
    {
      operations = paramOperations;
      return this;
    }
    
    Builder withParser(CdsManifestParser paramCdsManifestParser)
    {
      parser = paramCdsManifestParser;
      return this;
    }
  }
}
