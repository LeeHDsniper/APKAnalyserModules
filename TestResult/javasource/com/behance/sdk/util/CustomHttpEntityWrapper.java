package com.behance.sdk.util;

import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import org.apache.http.HttpEntity;
import org.apache.http.entity.HttpEntityWrapper;

public class CustomHttpEntityWrapper
  extends HttpEntityWrapper
{
  private final CustomHttpEntityWrapperCallback callback;
  
  public CustomHttpEntityWrapper(HttpEntity paramHttpEntity, CustomHttpEntityWrapperCallback paramCustomHttpEntityWrapperCallback)
  {
    super(paramHttpEntity);
    callback = paramCustomHttpEntityWrapperCallback;
  }
  
  public void writeTo(OutputStream paramOutputStream)
    throws IOException
  {
    if ((paramOutputStream instanceof CustomFilterOutputStream))
    {
      wrappedEntity.writeTo(paramOutputStream);
      return;
    }
    wrappedEntity.writeTo(new CustomFilterOutputStream(paramOutputStream, callback, getContentLength()));
  }
  
  private class CustomFilterOutputStream
    extends FilterOutputStream
  {
    private final CustomHttpEntityWrapper.CustomHttpEntityWrapperCallback customHttpEntityWrapperCallback;
    private long totalBytesLength;
    private long transferredBytesLength;
    
    CustomFilterOutputStream(OutputStream paramOutputStream, CustomHttpEntityWrapper.CustomHttpEntityWrapperCallback paramCustomHttpEntityWrapperCallback, long paramLong)
    {
      super();
      customHttpEntityWrapperCallback = paramCustomHttpEntityWrapperCallback;
      transferredBytesLength = 0L;
      totalBytesLength = paramLong;
    }
    
    private void notifyUploadProgress()
    {
      float f = (float)transferredBytesLength / (float)totalBytesLength;
      if (customHttpEntityWrapperCallback != null) {
        customHttpEntityWrapperCallback.onUploadProgressUpdate(f * 100.0F);
      }
    }
    
    public void write(int paramInt)
      throws IOException
    {
      super.write(paramInt);
      transferredBytesLength += 1L;
      notifyUploadProgress();
    }
    
    public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
      throws IOException
    {
      super.write(paramArrayOfByte, paramInt1, paramInt2);
      transferredBytesLength += paramInt2;
      notifyUploadProgress();
    }
  }
  
  public static abstract interface CustomHttpEntityWrapperCallback
  {
    public abstract void onUploadProgressUpdate(float paramFloat);
  }
}
