package org.apache.http.client.utils;

import java.io.Closeable;
import java.io.IOException;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.util.EntityUtils;

public class HttpClientUtils
{
  private HttpClientUtils() {}
  
  public static void closeQuietly(HttpResponse paramHttpResponse)
  {
    if (paramHttpResponse != null)
    {
      paramHttpResponse = paramHttpResponse.getEntity();
      if (paramHttpResponse == null) {}
    }
    try
    {
      EntityUtils.consume(paramHttpResponse);
      return;
    }
    catch (IOException paramHttpResponse) {}
  }
  
  public static void closeQuietly(HttpClient paramHttpClient)
  {
    if ((paramHttpClient != null) && ((paramHttpClient instanceof Closeable))) {}
    try
    {
      ((Closeable)paramHttpClient).close();
      return;
    }
    catch (IOException paramHttpClient) {}
  }
  
  public static void closeQuietly(CloseableHttpResponse paramCloseableHttpResponse)
  {
    if (paramCloseableHttpResponse != null) {
      try
      {
        EntityUtils.consume(paramCloseableHttpResponse.getEntity());
        return;
      }
      finally
      {
        try
        {
          paramCloseableHttpResponse.close();
          return;
        }
        catch (IOException paramCloseableHttpResponse) {}
        localObject = finally;
        paramCloseableHttpResponse.close();
      }
    }
  }
}
