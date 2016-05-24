package com.facebook;

import com.facebook.internal.Utility;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.UUID;

public final class NativeAppCallAttachmentStore
  implements NativeAppCallContentProvider.AttachmentDataSource
{
  private static final String TAG = NativeAppCallAttachmentStore.class.getName();
  private static File attachmentsDirectory;
  
  public NativeAppCallAttachmentStore() {}
  
  File getAttachmentFile(UUID paramUUID, String paramString, boolean paramBoolean)
    throws IOException
  {
    paramUUID = getAttachmentsDirectoryForCall(paramUUID, paramBoolean);
    if (paramUUID == null) {
      return null;
    }
    try
    {
      paramUUID = new File(paramUUID, URLEncoder.encode(paramString, "UTF-8"));
      return paramUUID;
    }
    catch (UnsupportedEncodingException paramUUID) {}
    return null;
  }
  
  File getAttachmentsDirectoryForCall(UUID paramUUID, boolean paramBoolean)
  {
    if (attachmentsDirectory == null) {
      paramUUID = null;
    }
    File localFile;
    do
    {
      do
      {
        return paramUUID;
        localFile = new File(attachmentsDirectory, paramUUID.toString());
        paramUUID = localFile;
      } while (!paramBoolean);
      paramUUID = localFile;
    } while (localFile.exists());
    localFile.mkdirs();
    return localFile;
  }
  
  public File openAttachment(UUID paramUUID, String paramString)
    throws FileNotFoundException
  {
    if ((Utility.isNullOrEmpty(paramString)) || (paramUUID == null)) {
      throw new FileNotFoundException();
    }
    try
    {
      paramUUID = getAttachmentFile(paramUUID, paramString, false);
      return paramUUID;
    }
    catch (IOException paramUUID)
    {
      throw new FileNotFoundException();
    }
  }
}
