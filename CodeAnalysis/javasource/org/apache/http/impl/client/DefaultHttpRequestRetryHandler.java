package org.apache.http.impl.client;

import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.ConnectException;
import java.net.UnknownHostException;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import javax.net.ssl.SSLException;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.HttpRequest;
import org.apache.http.annotation.Immutable;
import org.apache.http.client.HttpRequestRetryHandler;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;

@Immutable
public class DefaultHttpRequestRetryHandler
  implements HttpRequestRetryHandler
{
  public static final DefaultHttpRequestRetryHandler INSTANCE = new DefaultHttpRequestRetryHandler();
  private final Set<Class<? extends IOException>> nonRetriableClasses;
  private final boolean requestSentRetryEnabled;
  private final int retryCount;
  
  public DefaultHttpRequestRetryHandler()
  {
    this(3, false);
  }
  
  public DefaultHttpRequestRetryHandler(int paramInt, boolean paramBoolean)
  {
    this(paramInt, paramBoolean, Arrays.asList(new Class[] { InterruptedIOException.class, UnknownHostException.class, ConnectException.class, SSLException.class }));
  }
  
  protected DefaultHttpRequestRetryHandler(int paramInt, boolean paramBoolean, Collection<Class<? extends IOException>> paramCollection)
  {
    retryCount = paramInt;
    requestSentRetryEnabled = paramBoolean;
    nonRetriableClasses = new HashSet();
    paramCollection = paramCollection.iterator();
    while (paramCollection.hasNext())
    {
      Class localClass = (Class)paramCollection.next();
      nonRetriableClasses.add(localClass);
    }
  }
  
  public int getRetryCount()
  {
    return retryCount;
  }
  
  protected boolean handleAsIdempotent(HttpRequest paramHttpRequest)
  {
    return !(paramHttpRequest instanceof HttpEntityEnclosingRequest);
  }
  
  public boolean isRequestSentRetryEnabled()
  {
    return requestSentRetryEnabled;
  }
  
  @Deprecated
  protected boolean requestIsAborted(HttpRequest paramHttpRequest)
  {
    HttpRequest localHttpRequest = paramHttpRequest;
    if ((paramHttpRequest instanceof RequestWrapper)) {
      localHttpRequest = ((RequestWrapper)paramHttpRequest).getOriginal();
    }
    return ((localHttpRequest instanceof HttpUriRequest)) && (((HttpUriRequest)localHttpRequest).isAborted());
  }
  
  public boolean retryRequest(IOException paramIOException, int paramInt, HttpContext paramHttpContext)
  {
    Args.notNull(paramIOException, "Exception parameter");
    Args.notNull(paramHttpContext, "HTTP context");
    if (paramInt > retryCount) {}
    do
    {
      do
      {
        do
        {
          return false;
        } while (nonRetriableClasses.contains(paramIOException.getClass()));
        Iterator localIterator = nonRetriableClasses.iterator();
        while (localIterator.hasNext()) {
          if (((Class)localIterator.next()).isInstance(paramIOException)) {
            return false;
          }
        }
        paramIOException = HttpClientContext.adapt(paramHttpContext);
        paramHttpContext = paramIOException.getRequest();
      } while (requestIsAborted(paramHttpContext));
      if (handleAsIdempotent(paramHttpContext)) {
        return true;
      }
    } while ((paramIOException.isRequestSent()) && (!requestSentRetryEnabled));
    return true;
  }
}
