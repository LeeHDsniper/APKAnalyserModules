package org.apache.http.io;

import org.apache.http.HttpMessage;

public abstract interface HttpMessageWriterFactory<T extends HttpMessage>
{
  public abstract HttpMessageWriter<T> create(SessionOutputBuffer paramSessionOutputBuffer);
}
