package org.apache.http.impl.client;

import java.io.IOException;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.annotation.Immutable;
import org.apache.http.client.HttpResponseException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.util.EntityUtils;

@Immutable
public class BasicResponseHandler
  implements ResponseHandler<String>
{
  public BasicResponseHandler() {}
  
  public String handleResponse(HttpResponse paramHttpResponse)
    throws HttpResponseException, IOException
  {
    StatusLine localStatusLine = paramHttpResponse.getStatusLine();
    paramHttpResponse = paramHttpResponse.getEntity();
    if (localStatusLine.getStatusCode() >= 300)
    {
      EntityUtils.consume(paramHttpResponse);
      throw new HttpResponseException(localStatusLine.getStatusCode(), localStatusLine.getReasonPhrase());
    }
    if (paramHttpResponse == null) {
      return null;
    }
    return EntityUtils.toString(paramHttpResponse);
  }
}
