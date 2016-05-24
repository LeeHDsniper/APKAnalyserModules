package org.apache.http.entity.mime;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.util.Iterator;
import java.util.List;
import org.apache.http.entity.mime.content.ContentBody;
import org.apache.http.util.Args;
import org.apache.http.util.ByteArrayBuffer;

abstract class AbstractMultipartForm
{
  private static final ByteArrayBuffer CR_LF = encode(MIME.DEFAULT_CHARSET, "\r\n");
  private static final ByteArrayBuffer FIELD_SEP = encode(MIME.DEFAULT_CHARSET, ": ");
  private static final ByteArrayBuffer TWO_DASHES = encode(MIME.DEFAULT_CHARSET, "--");
  private final String boundary;
  protected final Charset charset;
  private final String subType;
  
  public AbstractMultipartForm(String paramString1, String paramString2)
  {
    this(paramString1, null, paramString2);
  }
  
  public AbstractMultipartForm(String paramString1, Charset paramCharset, String paramString2)
  {
    Args.notNull(paramString1, "Multipart subtype");
    Args.notNull(paramString2, "Multipart boundary");
    subType = paramString1;
    if (paramCharset != null) {}
    for (;;)
    {
      charset = paramCharset;
      boundary = paramString2;
      return;
      paramCharset = MIME.DEFAULT_CHARSET;
    }
  }
  
  private static ByteArrayBuffer encode(Charset paramCharset, String paramString)
  {
    paramCharset = paramCharset.encode(CharBuffer.wrap(paramString));
    paramString = new ByteArrayBuffer(paramCharset.remaining());
    paramString.append(paramCharset.array(), paramCharset.position(), paramCharset.remaining());
    return paramString;
  }
  
  private static void writeBytes(String paramString, OutputStream paramOutputStream)
    throws IOException
  {
    writeBytes(encode(MIME.DEFAULT_CHARSET, paramString), paramOutputStream);
  }
  
  private static void writeBytes(String paramString, Charset paramCharset, OutputStream paramOutputStream)
    throws IOException
  {
    writeBytes(encode(paramCharset, paramString), paramOutputStream);
  }
  
  private static void writeBytes(ByteArrayBuffer paramByteArrayBuffer, OutputStream paramOutputStream)
    throws IOException
  {
    paramOutputStream.write(paramByteArrayBuffer.buffer(), 0, paramByteArrayBuffer.length());
  }
  
  protected static void writeField(MinimalField paramMinimalField, OutputStream paramOutputStream)
    throws IOException
  {
    writeBytes(paramMinimalField.getName(), paramOutputStream);
    writeBytes(FIELD_SEP, paramOutputStream);
    writeBytes(paramMinimalField.getBody(), paramOutputStream);
    writeBytes(CR_LF, paramOutputStream);
  }
  
  protected static void writeField(MinimalField paramMinimalField, Charset paramCharset, OutputStream paramOutputStream)
    throws IOException
  {
    writeBytes(paramMinimalField.getName(), paramCharset, paramOutputStream);
    writeBytes(FIELD_SEP, paramOutputStream);
    writeBytes(paramMinimalField.getBody(), paramCharset, paramOutputStream);
    writeBytes(CR_LF, paramOutputStream);
  }
  
  void doWriteTo(OutputStream paramOutputStream, boolean paramBoolean)
    throws IOException
  {
    ByteArrayBuffer localByteArrayBuffer = encode(charset, getBoundary());
    Iterator localIterator = getBodyParts().iterator();
    while (localIterator.hasNext())
    {
      FormBodyPart localFormBodyPart = (FormBodyPart)localIterator.next();
      writeBytes(TWO_DASHES, paramOutputStream);
      writeBytes(localByteArrayBuffer, paramOutputStream);
      writeBytes(CR_LF, paramOutputStream);
      formatMultipartHeader(localFormBodyPart, paramOutputStream);
      writeBytes(CR_LF, paramOutputStream);
      if (paramBoolean) {
        localFormBodyPart.getBody().writeTo(paramOutputStream);
      }
      writeBytes(CR_LF, paramOutputStream);
    }
    writeBytes(TWO_DASHES, paramOutputStream);
    writeBytes(localByteArrayBuffer, paramOutputStream);
    writeBytes(TWO_DASHES, paramOutputStream);
    writeBytes(CR_LF, paramOutputStream);
  }
  
  protected abstract void formatMultipartHeader(FormBodyPart paramFormBodyPart, OutputStream paramOutputStream)
    throws IOException;
  
  public abstract List<FormBodyPart> getBodyParts();
  
  public String getBoundary()
  {
    return boundary;
  }
  
  public Charset getCharset()
  {
    return charset;
  }
  
  public String getSubType()
  {
    return subType;
  }
  
  public long getTotalLength()
  {
    long l3 = -1L;
    long l1 = 0L;
    Object localObject = getBodyParts().iterator();
    long l2;
    while (((Iterator)localObject).hasNext())
    {
      long l4 = ((FormBodyPart)((Iterator)localObject).next()).getBody().getContentLength();
      l2 = l3;
      if (l4 < 0L) {
        break label96;
      }
      l1 += l4;
    }
    localObject = new ByteArrayOutputStream();
    try
    {
      doWriteTo((OutputStream)localObject, false);
      int i = ((ByteArrayOutputStream)localObject).toByteArray().length;
      l2 = i + l1;
      label96:
      return l2;
    }
    catch (IOException localIOException) {}
    return -1L;
  }
  
  public void writeTo(OutputStream paramOutputStream)
    throws IOException
  {
    doWriteTo(paramOutputStream, true);
  }
}
