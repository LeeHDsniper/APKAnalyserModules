package com.adobe.creativesdk.foundation.internal.net;

import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.nio.ByteBuffer;
import java.util.List;
import java.util.Map;

public class AdobeNetworkHttpResponse
{
  private Exception _networkException = null;
  protected int bytesReceived = 0;
  protected int bytesSent = 0;
  protected ByteBuffer data = null;
  private boolean hasFileError = false;
  protected Map<String, List<String>> headers = null;
  protected int statusCode = 0;
  protected URL url = null;
  
  public AdobeNetworkHttpResponse() {}
  
  public int getBytesReceived()
  {
    return bytesReceived;
  }
  
  public byte[] getDataBytes()
  {
    if (data != null) {
      return data.array();
    }
    return null;
  }
  
  public String getDataString()
  {
    if (data != null) {
      try
      {
        String str = new String(data.array(), "UTF-8");
        return str;
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException)
      {
        return new String(data.array());
      }
    }
    return null;
  }
  
  public Map<String, List<String>> getHeaders()
  {
    return headers;
  }
  
  public Exception getNetworkException()
  {
    return _networkException;
  }
  
  public int getStatusCode()
  {
    return statusCode;
  }
  
  public URL getUrl()
  {
    return url;
  }
  
  public boolean hasFileError()
  {
    return hasFileError;
  }
  
  void setBytesReceived(int paramInt)
  {
    bytesReceived = paramInt;
  }
  
  void setBytesSent(int paramInt)
  {
    bytesSent = paramInt;
  }
  
  public void setData(ByteBuffer paramByteBuffer)
  {
    data = paramByteBuffer;
  }
  
  public void setHasFileError(boolean paramBoolean)
  {
    hasFileError = paramBoolean;
  }
  
  public void setHeaders(Map<String, List<String>> paramMap)
  {
    headers = paramMap;
  }
  
  public void setNetworkException(Exception paramException)
  {
    _networkException = paramException;
  }
  
  public void setStatusCode(int paramInt)
  {
    statusCode = paramInt;
  }
  
  public void setURL(URL paramURL)
  {
    url = paramURL;
  }
}
