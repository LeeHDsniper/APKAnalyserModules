package org.apache.http.io;

import org.apache.http.HttpMessage;
import org.apache.http.config.MessageConstraints;

public abstract interface HttpMessageParserFactory<T extends HttpMessage>
{
  public abstract HttpMessageParser<T> create(SessionInputBuffer paramSessionInputBuffer, MessageConstraints paramMessageConstraints);
}
