package org.apache.http.client.entity;

import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.util.List;
import org.apache.http.NameValuePair;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.entity.StringEntity;

@NotThreadSafe
public class UrlEncodedFormEntity
  extends StringEntity
{
  public UrlEncodedFormEntity(Iterable<? extends NameValuePair> paramIterable)
  {
    this(paramIterable, null);
  }
  
  public UrlEncodedFormEntity(Iterable<? extends NameValuePair> paramIterable, Charset paramCharset) {}
  
  public UrlEncodedFormEntity(List<? extends NameValuePair> paramList)
    throws UnsupportedEncodingException
  {
    this(paramList, (Charset)null);
  }
  
  public UrlEncodedFormEntity(List<? extends NameValuePair> paramList, String paramString)
    throws UnsupportedEncodingException
  {}
}
