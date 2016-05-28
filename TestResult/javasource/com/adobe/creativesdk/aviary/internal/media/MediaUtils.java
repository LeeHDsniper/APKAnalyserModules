package com.adobe.creativesdk.aviary.internal.media;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import android.provider.MediaStore.Images.Media;
import java.io.File;

public final class MediaUtils
{
  public static Uri insertImage(Context paramContext, File paramFile)
    throws IllegalStateException
  {
    if (paramFile == null) {
      return null;
    }
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("_data", paramFile.getAbsolutePath());
    localContentValues.put("date_added", Long.valueOf(System.currentTimeMillis()));
    localContentValues.put("datetaken", Long.valueOf(System.currentTimeMillis()));
    localContentValues.put("description", "Edited with Aviary");
    return paramContext.getContentResolver().insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, localContentValues);
  }
}
