package com.facebook;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.util.Log;
import android.util.Pair;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.UUID;

public class NativeAppCallContentProvider
  extends ContentProvider
{
  private static final String TAG = NativeAppCallContentProvider.class.getName();
  private final AttachmentDataSource dataSource;
  
  public NativeAppCallContentProvider()
  {
    this(new NativeAppCallAttachmentStore());
  }
  
  NativeAppCallContentProvider(AttachmentDataSource paramAttachmentDataSource)
  {
    dataSource = paramAttachmentDataSource;
  }
  
  public int delete(Uri paramUri, String paramString, String[] paramArrayOfString)
  {
    return 0;
  }
  
  public String getType(Uri paramUri)
  {
    return null;
  }
  
  public Uri insert(Uri paramUri, ContentValues paramContentValues)
  {
    return null;
  }
  
  public boolean onCreate()
  {
    return true;
  }
  
  public ParcelFileDescriptor openFile(Uri paramUri, String paramString)
    throws FileNotFoundException
  {
    paramUri = parseCallIdAndAttachmentName(paramUri);
    if (paramUri == null) {
      throw new FileNotFoundException();
    }
    try
    {
      paramUri = ParcelFileDescriptor.open(dataSource.openAttachment((UUID)first, (String)second), 268435456);
      return paramUri;
    }
    catch (FileNotFoundException paramUri)
    {
      Log.e(TAG, "Got unexpected exception:" + paramUri);
      throw paramUri;
    }
  }
  
  Pair<UUID, String> parseCallIdAndAttachmentName(Uri paramUri)
  {
    try
    {
      Object localObject = paramUri.getPath().substring(1).split("/");
      paramUri = localObject[0];
      localObject = localObject[1];
      paramUri = new Pair(UUID.fromString(paramUri), localObject);
      return paramUri;
    }
    catch (Exception paramUri) {}
    return null;
  }
  
  public Cursor query(Uri paramUri, String[] paramArrayOfString1, String paramString1, String[] paramArrayOfString2, String paramString2)
  {
    return null;
  }
  
  public int update(Uri paramUri, ContentValues paramContentValues, String paramString, String[] paramArrayOfString)
  {
    return 0;
  }
  
  static abstract interface AttachmentDataSource
  {
    public abstract File openAttachment(UUID paramUUID, String paramString)
      throws FileNotFoundException;
  }
}
