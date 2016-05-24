package com.facebook.ads.internal.http;

import android.content.Context;
import com.facebook.ads.internal.dto.f;
import com.facebook.ads.internal.e;
import com.facebook.ads.internal.util.g;
import com.facebook.ads.internal.util.h;
import com.facebook.ads.internal.util.p;
import com.facebook.ads.internal.util.q;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.security.KeyStore;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.zip.GZIPInputStream;
import org.apache.http.Header;
import org.apache.http.HeaderElement;
import org.apache.http.HttpEntity;
import org.apache.http.HttpRequest;
import org.apache.http.HttpRequestInterceptor;
import org.apache.http.HttpResponse;
import org.apache.http.HttpResponseInterceptor;
import org.apache.http.HttpVersion;
import org.apache.http.client.methods.HttpEntityEnclosingRequestBase;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.conn.params.ConnManagerParams;
import org.apache.http.conn.params.ConnPerRouteBean;
import org.apache.http.conn.scheme.PlainSocketFactory;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.conn.scheme.SocketFactory;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.entity.HttpEntityWrapper;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.conn.tsccm.ThreadSafeClientConnManager;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpProtocolParams;
import org.apache.http.protocol.BasicHttpContext;
import org.apache.http.protocol.HttpContext;
import org.apache.http.protocol.SyncBasicHttpContext;

public class a
{
  private static final p a = new p();
  private static final ThreadPoolExecutor b = (ThreadPoolExecutor)Executors.newCachedThreadPool(a);
  private final DefaultHttpClient c;
  private final Map<Context, List<WeakReference<Future<?>>>> d;
  private final Map<String, String> e;
  private Context f;
  
  public a(Context paramContext, e paramE)
  {
    f = paramContext;
    BasicHttpParams localBasicHttpParams = new BasicHttpParams();
    localBasicHttpParams.setParameter("http.protocol.cookie-policy", "compatibility");
    ConnManagerParams.setTimeout(localBasicHttpParams, 10000L);
    ConnManagerParams.setMaxConnectionsPerRoute(localBasicHttpParams, new ConnPerRouteBean(100));
    ConnManagerParams.setMaxTotalConnections(localBasicHttpParams, 100);
    HttpConnectionParams.setSoTimeout(localBasicHttpParams, 10000);
    HttpConnectionParams.setConnectionTimeout(localBasicHttpParams, 10000);
    HttpConnectionParams.setTcpNoDelay(localBasicHttpParams, true);
    HttpConnectionParams.setSocketBufferSize(localBasicHttpParams, 8192);
    HttpProtocolParams.setUserAgent(localBasicHttpParams, h.a(paramContext, paramE) + " [" + "FBAN/AudienceNetworkForAndroid;" + "FBSN/" + "Android" + ";" + "FBSV/" + f.a + ";" + "FBAB/" + f.d + ";" + "FBAV/" + f.f + ";" + "FBBV/" + f.g + ";" + "FBLC/" + Locale.getDefault().toString() + "]");
    HttpProtocolParams.setVersion(localBasicHttpParams, HttpVersion.HTTP_1_1);
    paramContext = new SchemeRegistry();
    paramContext.register(new Scheme("http", PlainSocketFactory.getSocketFactory(), 80));
    if (g.a()) {
      a(localBasicHttpParams, paramContext);
    }
    for (;;)
    {
      c = new DefaultHttpClient(new ThreadSafeClientConnManager(localBasicHttpParams, paramContext), localBasicHttpParams);
      c.addRequestInterceptor(new HttpRequestInterceptor()
      {
        public void process(HttpRequest paramAnonymousHttpRequest, HttpContext paramAnonymousHttpContext)
        {
          if (!paramAnonymousHttpRequest.containsHeader("Accept-Encoding")) {
            paramAnonymousHttpRequest.addHeader("Accept-Encoding", "gzip");
          }
          paramAnonymousHttpContext = a.a(a.this).keySet().iterator();
          while (paramAnonymousHttpContext.hasNext())
          {
            String str = (String)paramAnonymousHttpContext.next();
            paramAnonymousHttpRequest.addHeader(str, (String)a.a(a.this).get(str));
          }
        }
      });
      c.addResponseInterceptor(new HttpResponseInterceptor()
      {
        public void process(HttpResponse paramAnonymousHttpResponse, HttpContext paramAnonymousHttpContext)
        {
          paramAnonymousHttpContext = paramAnonymousHttpResponse.getEntity();
          if (paramAnonymousHttpContext == null) {}
          for (;;)
          {
            return;
            paramAnonymousHttpContext = paramAnonymousHttpContext.getContentEncoding();
            if (paramAnonymousHttpContext != null)
            {
              paramAnonymousHttpContext = paramAnonymousHttpContext.getElements();
              int j = paramAnonymousHttpContext.length;
              int i = 0;
              while (i < j)
              {
                if (paramAnonymousHttpContext[i].getName().equalsIgnoreCase("gzip"))
                {
                  paramAnonymousHttpResponse.setEntity(new a.a(paramAnonymousHttpResponse.getEntity()));
                  return;
                }
                i += 1;
              }
            }
          }
        }
      });
      d = new WeakHashMap();
      e = new HashMap();
      return;
      paramContext.register(new Scheme("https", SSLSocketFactory.getSocketFactory(), 443));
    }
  }
  
  private HttpEntity a(d paramD)
  {
    HttpEntity localHttpEntity = null;
    if (paramD != null) {
      localHttpEntity = paramD.a();
    }
    return localHttpEntity;
  }
  
  private HttpEntityEnclosingRequestBase a(HttpEntityEnclosingRequestBase paramHttpEntityEnclosingRequestBase, HttpEntity paramHttpEntity)
  {
    if (paramHttpEntity != null) {
      paramHttpEntityEnclosingRequestBase.setEntity(paramHttpEntity);
    }
    return paramHttpEntityEnclosingRequestBase;
  }
  
  private void a(BasicHttpParams paramBasicHttpParams, SchemeRegistry paramSchemeRegistry)
  {
    try
    {
      Object localObject = KeyStore.getInstance(KeyStore.getDefaultType());
      ((KeyStore)localObject).load(null, null);
      localObject = new q((KeyStore)localObject);
      ((SSLSocketFactory)localObject).setHostnameVerifier(SSLSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);
      HttpProtocolParams.setContentCharset(paramBasicHttpParams, "UTF-8");
      paramSchemeRegistry.register(new Scheme("https", (SocketFactory)localObject, 443));
      return;
    }
    catch (Exception paramBasicHttpParams) {}
  }
  
  public void a(String paramString, d paramD, c paramC)
  {
    a(paramString, a(paramD), null, paramC);
  }
  
  public void a(String paramString1, HttpEntity paramHttpEntity, String paramString2, c paramC)
  {
    a(c, a(new HttpPost(paramString1), paramHttpEntity), paramString2, paramC);
  }
  
  protected void a(DefaultHttpClient paramDefaultHttpClient, HttpUriRequest paramHttpUriRequest, String paramString, c paramC)
  {
    if (paramString != null) {
      paramHttpUriRequest.addHeader("Content-Type", paramString);
    }
    paramString = new SyncBasicHttpContext(new BasicHttpContext());
    paramString = b.submit(new b(paramDefaultHttpClient, paramString, paramHttpUriRequest, paramC));
    paramHttpUriRequest = (List)d.get(f);
    paramDefaultHttpClient = paramHttpUriRequest;
    if (paramHttpUriRequest == null)
    {
      paramDefaultHttpClient = new LinkedList();
      d.put(f, paramDefaultHttpClient);
    }
    paramDefaultHttpClient.add(new WeakReference(paramString));
  }
  
  public void a(boolean paramBoolean)
  {
    Object localObject = (List)d.get(f);
    if (localObject != null)
    {
      localObject = ((List)localObject).iterator();
      while (((Iterator)localObject).hasNext())
      {
        Future localFuture = (Future)((WeakReference)((Iterator)localObject).next()).get();
        if (localFuture != null) {
          localFuture.cancel(paramBoolean);
        }
      }
    }
    d.remove(f);
  }
  
  private static class a
    extends HttpEntityWrapper
  {
    public a(HttpEntity paramHttpEntity)
    {
      super();
    }
    
    public InputStream getContent()
    {
      return new GZIPInputStream(wrappedEntity.getContent());
    }
    
    public long getContentLength()
    {
      return -1L;
    }
  }
}
