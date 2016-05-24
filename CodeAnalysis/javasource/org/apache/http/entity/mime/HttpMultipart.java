package org.apache.http.entity.mime;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.apache.http.entity.mime.content.ContentBody;

@Deprecated
public class HttpMultipart
  extends AbstractMultipartForm
{
  private final HttpMultipartMode mode;
  private final List<FormBodyPart> parts;
  
  public HttpMultipart(String paramString1, String paramString2)
  {
    this(paramString1, null, paramString2);
  }
  
  public HttpMultipart(String paramString1, Charset paramCharset, String paramString2)
  {
    this(paramString1, paramCharset, paramString2, HttpMultipartMode.STRICT);
  }
  
  public HttpMultipart(String paramString1, Charset paramCharset, String paramString2, HttpMultipartMode paramHttpMultipartMode)
  {
    super(paramString1, paramCharset, paramString2);
    mode = paramHttpMultipartMode;
    parts = new ArrayList();
  }
  
  public void addBodyPart(FormBodyPart paramFormBodyPart)
  {
    if (paramFormBodyPart == null) {
      return;
    }
    parts.add(paramFormBodyPart);
  }
  
  protected void formatMultipartHeader(FormBodyPart paramFormBodyPart, OutputStream paramOutputStream)
    throws IOException
  {
    Header localHeader = paramFormBodyPart.getHeader();
    switch (1.$SwitchMap$org$apache$http$entity$mime$HttpMultipartMode[mode.ordinal()])
    {
    default: 
      paramFormBodyPart = localHeader.iterator();
    }
    while (paramFormBodyPart.hasNext())
    {
      writeField((MinimalField)paramFormBodyPart.next(), paramOutputStream);
      continue;
      writeField(localHeader.getField("Content-Disposition"), charset, paramOutputStream);
      if (paramFormBodyPart.getBody().getFilename() != null) {
        writeField(localHeader.getField("Content-Type"), charset, paramOutputStream);
      }
    }
  }
  
  public List<FormBodyPart> getBodyParts()
  {
    return parts;
  }
  
  public HttpMultipartMode getMode()
  {
    return mode;
  }
}
