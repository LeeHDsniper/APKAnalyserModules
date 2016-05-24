package org.apache.http.conn.scheme;

import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;
import org.apache.http.params.HttpParams;

@Deprecated
class SchemeLayeredSocketFactoryAdaptor
  extends SchemeSocketFactoryAdaptor
  implements SchemeLayeredSocketFactory
{
  private final LayeredSocketFactory factory;
  
  SchemeLayeredSocketFactoryAdaptor(LayeredSocketFactory paramLayeredSocketFactory)
  {
    super(paramLayeredSocketFactory);
    factory = paramLayeredSocketFactory;
  }
  
  public Socket createLayeredSocket(Socket paramSocket, String paramString, int paramInt, HttpParams paramHttpParams)
    throws IOException, UnknownHostException
  {
    return factory.createSocket(paramSocket, paramString, paramInt, true);
  }
}
