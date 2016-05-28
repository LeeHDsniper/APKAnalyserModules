package org.apache.http.entity;

import org.apache.http.HttpException;
import org.apache.http.HttpMessage;

public abstract interface ContentLengthStrategy
{
  public static final int CHUNKED = -2;
  public static final int IDENTITY = -1;
  
  public abstract long determineLength(HttpMessage paramHttpMessage)
    throws HttpException;
}
