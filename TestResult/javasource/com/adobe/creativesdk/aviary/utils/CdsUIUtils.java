package com.adobe.creativesdk.aviary.utils;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import com.adobe.creativesdk.aviary.internal.cds.Cds;
import com.adobe.creativesdk.aviary.internal.cds.Cds.PackType;
import com.adobe.creativesdk.aviary.internal.utils.PackageManagerUtils;
import java.io.File;
import java.util.HashMap;

public final class CdsUIUtils
{
  static HashMap<Cds.PackType, String> sPackTypeStringMap = new HashMap();
  
  public static Cursor computePreviewAspectRatio(Context paramContext, long paramLong, String paramString1, String paramString2, double[] paramArrayOfDouble)
  {
    if (paramContext == null) {
      return null;
    }
    if ((paramArrayOfDouble == null) || (paramArrayOfDouble.length < 1)) {
      return null;
    }
    double d2 = 1.0D;
    paramContext = paramContext.getContentResolver().query(PackageManagerUtils.getCDSProviderContentUri(paramContext, "pack/" + paramLong + "/item/list"), new String[] { "item_id as _id", "pack_type", "item_id", "item_identifier", "item_displayName" }, null, null, null);
    double d1 = d2;
    Object localObject;
    if (paramContext != null)
    {
      d1 = d2;
      if (paramContext.moveToFirst())
      {
        localObject = paramContext.getString(paramContext.getColumnIndex("item_identifier"));
        paramString2 = new File(paramString2, (String)localObject + Cds.getPreviewItemExt(paramString1)).getAbsolutePath();
        localObject = new BitmapFactory.Options();
        inJustDecodeBounds = true;
        BitmapFactory.decodeFile(paramString2, (BitmapFactory.Options)localObject);
        if ((outHeight != 0) && (outWidth != 0)) {
          break label214;
        }
        d1 = 1.0D;
      }
    }
    for (;;)
    {
      paramArrayOfDouble[0] = d1;
      return paramContext;
      label214:
      if ("effect".equals(paramString1))
      {
        float f = outHeight;
        d1 = outWidth / (f * 0.865F);
      }
      else
      {
        d1 = outWidth / outHeight;
      }
    }
  }
}
