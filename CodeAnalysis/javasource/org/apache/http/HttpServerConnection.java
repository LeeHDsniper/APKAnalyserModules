package org.apache.http;

import java.io.IOException;

public abstract interface HttpServerConnection
  extends HttpConnection
{
  public abstract void flush()
    throws IOException;
  
  public abstract void receiveRequestEntity(HttpEntityEnclosingRequest paramHttpEntityEnclosingRequest)
    throws HttpException, IOException;
  
  public abstract HttpRequest receiveRequestHeader()
    throws HttpException, IOException;
  
  public abstract void sendResponseEntity(HttpResponse paramHttpResponse)
    throws HttpException, IOException;
  
  public abstract void sendResponseHeader(HttpResponse paramHttpResponse)
    throws HttpException, IOException;
}
