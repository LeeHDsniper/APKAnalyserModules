package com.adobe.creativesdk.aviary.internal.cds;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import com.adobe.creativesdk.aviary.internal.cds.json.CdsManifestParser;
import com.adobe.creativesdk.aviary.internal.cds.util.KillException;
import com.adobe.creativesdk.aviary.internal.utils.IOUtils;
import com.adobe.creativesdk.aviary.internal.utils.PackageManagerUtils;
import com.adobe.creativesdk.aviary.internal.utils.StringUtils;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import java.util.List;

class CdsManifestPermissionConsumer
{
  static LoggerFactory.Logger logger = LoggerFactory.getLogger("CdsManifestPermissionConsumer");
  private final Context mContext;
  private final CdsManifestParser mManifestParser;
  
  CdsManifestPermissionConsumer(Context paramContext, CdsManifestParser paramCdsManifestParser)
  {
    mContext = paramContext;
    mManifestParser = paramCdsManifestParser;
  }
  
  void consume()
    throws KillException
  {
    Object localObject1 = mContext.getContentResolver().query(PackageManagerUtils.getCDSProviderContentUri(mContext, "permissions/list"), null, null, null, null);
    int i = 0;
    int j = 0;
    String str = mManifestParser.getPermissionsKey();
    List localList = mManifestParser.getPermissions();
    Object localObject2;
    if (localObject1 != null)
    {
      i = j;
      if (((Cursor)localObject1).moveToFirst())
      {
        localObject2 = PermissionColumns.CursorWrapper.create((Cursor)localObject1);
        i = j;
        if (localObject2 != null)
        {
          logger.log("old permissions: %s", new Object[] { ((PermissionColumns.CursorWrapper)localObject2).getValue() });
          localObject2 = ((PermissionColumns.CursorWrapper)localObject2).getHashCode();
          i = j;
          if (localObject2 != null) {
            if (((String)localObject2).equals(str)) {
              break label244;
            }
          }
        }
      }
    }
    label244:
    for (i = 1;; i = 0)
    {
      IOUtils.closeSilently((Cursor)localObject1);
      if (i != 0)
      {
        localObject1 = StringUtils.join(localList, ",");
        logger.log("permissionString: '%s'", new Object[] { localObject1 });
        localObject2 = new ContentValues();
        ((ContentValues)localObject2).put("perm_value", (String)localObject1);
        ((ContentValues)localObject2).put("perm_hash", str);
        if (mContext.getContentResolver().insert(PackageManagerUtils.getCDSProviderContentUri(mContext, "permissions/replace"), (ContentValues)localObject2) != null) {
          CdsUtils.notifyPermissionsUpdated(mContext);
        }
      }
      if (!localList.contains(Cds.Permission.kill.name())) {
        break;
      }
      throw new KillException("This Application has been banned!");
    }
  }
}
