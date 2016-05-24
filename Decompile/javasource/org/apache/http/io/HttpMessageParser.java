package org.apache.http.io;

import java.io.IOException;
import org.apache.http.HttpException;
import org.apache.http.HttpMessage;

public abstract interface HttpMessageParser<T extends HttpMessage>
{
  public abstract T parse()
    throws IOException, HttpException;
}
