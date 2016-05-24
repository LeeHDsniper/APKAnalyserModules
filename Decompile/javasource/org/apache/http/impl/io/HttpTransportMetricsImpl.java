package org.apache.http.impl.io;

import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.io.HttpTransportMetrics;

@NotThreadSafe
public class HttpTransportMetricsImpl
  implements HttpTransportMetrics
{
  private long bytesTransferred = 0L;
  
  public HttpTransportMetricsImpl() {}
  
  public long getBytesTransferred()
  {
    return bytesTransferred;
  }
  
  public void incrementBytesTransferred(long paramLong)
  {
    bytesTransferred += paramLong;
  }
  
  public void reset()
  {
    bytesTransferred = 0L;
  }
  
  public void setBytesTransferred(long paramLong)
  {
    bytesTransferred = paramLong;
  }
}
