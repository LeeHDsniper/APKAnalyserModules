package com.squareup.okhttp;

import com.squareup.okhttp.internal.http.HttpEngine;
import com.squareup.okhttp.internal.http.OkHeaders;
import java.io.IOException;
import java.net.ProtocolException;
import okio.BufferedSink;
import okio.BufferedSource;

public class Call
{
  volatile boolean canceled;
  private final OkHttpClient client;
  HttpEngine engine;
  private boolean executed;
  private int redirectionCount;
  private Request request;
  
  protected Call(OkHttpClient paramOkHttpClient, Request paramRequest)
  {
    client = paramOkHttpClient.copyWithDefaults();
    request = paramRequest;
  }
  
  private Response getResponse()
    throws IOException
  {
    Object localObject1 = request.body();
    Object localObject2;
    Object localObject3;
    if (localObject1 != null)
    {
      localObject2 = request.newBuilder();
      localObject3 = ((RequestBody)localObject1).contentType();
      if (localObject3 != null) {
        ((Request.Builder)localObject2).header("Content-Type", ((MediaType)localObject3).toString());
      }
      long l = ((RequestBody)localObject1).contentLength();
      if (l == -1L) {
        break label124;
      }
      ((Request.Builder)localObject2).header("Content-Length", Long.toString(l));
      ((Request.Builder)localObject2).removeHeader("Transfer-Encoding");
      request = ((Request.Builder)localObject2).build();
    }
    for (engine = new HttpEngine(client, request, false, null, null, null, null);; engine = new HttpEngine(client, request, false, (Connection)localObject3, null, null, localIOException))
    {
      for (;;)
      {
        if (canceled)
        {
          return null;
          label124:
          ((Request.Builder)localObject2).header("Transfer-Encoding", "chunked");
          ((Request.Builder)localObject2).removeHeader("Content-Length");
          break;
        }
        try
        {
          engine.sendRequest();
          if (request.body() != null)
          {
            localObject1 = engine.getBufferedRequestBody();
            request.body().writeTo((BufferedSink)localObject1);
          }
          engine.readResponse();
          localObject1 = engine.getResponse();
          localObject2 = engine.followUpRequest();
          if (localObject2 == null)
          {
            engine.releaseConnection();
            return ((Response)localObject1).newBuilder().body(new RealResponseBody((Response)localObject1, engine.getResponseBody())).build();
          }
        }
        catch (IOException localIOException)
        {
          localObject2 = engine.recover(localIOException, null);
          if (localObject2 != null) {
            engine = ((HttpEngine)localObject2);
          } else {
            throw localIOException;
          }
        }
      }
      if (engine.getResponse().isRedirect())
      {
        int i = redirectionCount + 1;
        redirectionCount = i;
        if (i > 20) {
          throw new ProtocolException("Too many redirects: " + redirectionCount);
        }
      }
      if (!engine.sameConnection(((Request)localObject2).url())) {
        engine.releaseConnection();
      }
      localObject3 = engine.close();
      request = ((Request)localObject2);
    }
  }
  
  public Response execute()
    throws IOException
  {
    try
    {
      if (executed) {
        throw new IllegalStateException("Already Executed");
      }
    }
    finally {}
    executed = true;
    try
    {
      client.getDispatcher().executed(this);
      Response localResponse1 = getResponse();
      engine.releaseConnection();
      if (localResponse1 == null) {
        throw new IOException("Canceled");
      }
    }
    finally
    {
      client.getDispatcher().finished(this);
    }
    client.getDispatcher().finished(this);
    return localResponse2;
  }
  
  private static class RealResponseBody
    extends ResponseBody
  {
    private final Response response;
    private final BufferedSource source;
    
    RealResponseBody(Response paramResponse, BufferedSource paramBufferedSource)
    {
      response = paramResponse;
      source = paramBufferedSource;
    }
    
    public long contentLength()
    {
      return OkHeaders.contentLength(response);
    }
    
    public BufferedSource source()
    {
      return source;
    }
  }
}
