package org.apache.http.impl;

import java.util.HashMap;
import java.util.Map;
import org.apache.http.HttpConnectionMetrics;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.io.HttpTransportMetrics;

@NotThreadSafe
public class HttpConnectionMetricsImpl
  implements HttpConnectionMetrics
{
  public static final String RECEIVED_BYTES_COUNT = "http.received-bytes-count";
  public static final String REQUEST_COUNT = "http.request-count";
  public static final String RESPONSE_COUNT = "http.response-count";
  public static final String SENT_BYTES_COUNT = "http.sent-bytes-count";
  private final HttpTransportMetrics inTransportMetric;
  private Map<String, Object> metricsCache;
  private final HttpTransportMetrics outTransportMetric;
  private long requestCount = 0L;
  private long responseCount = 0L;
  
  public HttpConnectionMetricsImpl(HttpTransportMetrics paramHttpTransportMetrics1, HttpTransportMetrics paramHttpTransportMetrics2)
  {
    inTransportMetric = paramHttpTransportMetrics1;
    outTransportMetric = paramHttpTransportMetrics2;
  }
  
  public Object getMetric(String paramString)
  {
    Object localObject1 = null;
    if (metricsCache != null) {
      localObject1 = metricsCache.get(paramString);
    }
    Object localObject2 = localObject1;
    if (localObject1 == null)
    {
      if (!"http.request-count".equals(paramString)) {
        break label45;
      }
      localObject2 = Long.valueOf(requestCount);
    }
    label45:
    do
    {
      return localObject2;
      if ("http.response-count".equals(paramString)) {
        return Long.valueOf(responseCount);
      }
      if ("http.received-bytes-count".equals(paramString))
      {
        if (inTransportMetric != null) {
          return Long.valueOf(inTransportMetric.getBytesTransferred());
        }
        return null;
      }
      localObject2 = localObject1;
    } while (!"http.sent-bytes-count".equals(paramString));
    if (outTransportMetric != null) {
      return Long.valueOf(outTransportMetric.getBytesTransferred());
    }
    return null;
  }
  
  public long getReceivedBytesCount()
  {
    if (inTransportMetric != null) {
      return inTransportMetric.getBytesTransferred();
    }
    return -1L;
  }
  
  public long getRequestCount()
  {
    return requestCount;
  }
  
  public long getResponseCount()
  {
    return responseCount;
  }
  
  public long getSentBytesCount()
  {
    if (outTransportMetric != null) {
      return outTransportMetric.getBytesTransferred();
    }
    return -1L;
  }
  
  public void incrementRequestCount()
  {
    requestCount += 1L;
  }
  
  public void incrementResponseCount()
  {
    responseCount += 1L;
  }
  
  public void reset()
  {
    if (outTransportMetric != null) {
      outTransportMetric.reset();
    }
    if (inTransportMetric != null) {
      inTransportMetric.reset();
    }
    requestCount = 0L;
    responseCount = 0L;
    metricsCache = null;
  }
  
  public void setMetric(String paramString, Object paramObject)
  {
    if (metricsCache == null) {
      metricsCache = new HashMap();
    }
    metricsCache.put(paramString, paramObject);
  }
}
