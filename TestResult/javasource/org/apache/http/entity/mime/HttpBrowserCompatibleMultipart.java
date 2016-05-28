package org.apache.http.entity.mime;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.util.List;
import org.apache.http.entity.mime.content.ContentBody;

class HttpBrowserCompatibleMultipart
  extends AbstractMultipartForm
{
  private final List<FormBodyPart> parts;
  
  public HttpBrowserCompatibleMultipart(String paramString1, Charset paramCharset, String paramString2, List<FormBodyPart> paramList)
  {
    super(paramString1, paramCharset, paramString2);
    parts = paramList;
  }
  
  protected void formatMultipartHeader(FormBodyPart paramFormBodyPart, OutputStream paramOutputStream)
    throws IOException
  {
    Header localHeader = paramFormBodyPart.getHeader();
    writeField(localHeader.getField("Content-Disposition"), charset, paramOutputStream);
    if (paramFormBodyPart.getBody().getFilename() != null) {
      writeField(localHeader.getField("Content-Type"), charset, paramOutputStream);
    }
  }
  
  public List<FormBodyPart> getBodyParts()
  {
    return parts;
  }
}
