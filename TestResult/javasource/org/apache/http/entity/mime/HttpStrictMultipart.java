package org.apache.http.entity.mime;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.util.Iterator;
import java.util.List;

class HttpStrictMultipart
  extends AbstractMultipartForm
{
  private final List<FormBodyPart> parts;
  
  public HttpStrictMultipart(String paramString1, Charset paramCharset, String paramString2, List<FormBodyPart> paramList)
  {
    super(paramString1, paramCharset, paramString2);
    parts = paramList;
  }
  
  protected void formatMultipartHeader(FormBodyPart paramFormBodyPart, OutputStream paramOutputStream)
    throws IOException
  {
    paramFormBodyPart = paramFormBodyPart.getHeader().iterator();
    while (paramFormBodyPart.hasNext()) {
      writeField((MinimalField)paramFormBodyPart.next(), paramOutputStream);
    }
  }
  
  public List<FormBodyPart> getBodyParts()
  {
    return parts;
  }
}
