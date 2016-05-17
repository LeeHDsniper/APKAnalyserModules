package com.tencent.image;

import java.io.File;
import java.io.IOException;
import java.net.URL;

public class LocaleFileDownloader
  extends ProtocolDownloader.Adapter
{
  public LocaleFileDownloader() {}
  
  public boolean hasDiskFile(DownloadParams paramDownloadParams)
  {
    return new File(url.getFile()).exists();
  }
  
  public File loadImageFile(DownloadParams paramDownloadParams, URLDrawableHandler paramURLDrawableHandler)
    throws IOException
  {
    paramURLDrawableHandler = new File(url.getFile());
    if (paramURLDrawableHandler.exists()) {
      return paramURLDrawableHandler;
    }
    throw new IOException("File not Found. url: " + url);
  }
}
