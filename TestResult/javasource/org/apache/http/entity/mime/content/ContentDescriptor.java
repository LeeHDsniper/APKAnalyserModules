package org.apache.http.entity.mime.content;

public abstract interface ContentDescriptor
{
  public abstract String getCharset();
  
  public abstract long getContentLength();
  
  public abstract String getMediaType();
  
  public abstract String getMimeType();
  
  public abstract String getSubType();
  
  public abstract String getTransferEncoding();
}
