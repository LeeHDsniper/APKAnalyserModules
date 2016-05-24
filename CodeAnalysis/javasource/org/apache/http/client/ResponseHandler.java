package org.apache.http.client;

import java.io.IOException;
import org.apache.http.HttpResponse;

public abstract interface ResponseHandler<T>
{
  public abstract T handleResponse(HttpResponse paramHttpResponse)
    throws ClientProtocolException, IOException;
}
