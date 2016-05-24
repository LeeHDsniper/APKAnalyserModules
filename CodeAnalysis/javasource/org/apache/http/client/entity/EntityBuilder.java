package org.apache.http.client.entity;

import java.io.File;
import java.io.InputStream;
import java.io.Serializable;
import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.List;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.entity.AbstractHttpEntity;
import org.apache.http.entity.BasicHttpEntity;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.FileEntity;
import org.apache.http.entity.InputStreamEntity;
import org.apache.http.entity.SerializableEntity;
import org.apache.http.entity.StringEntity;

@NotThreadSafe
public class EntityBuilder
{
  private byte[] binary;
  private boolean chunked;
  private String contentEncoding;
  private ContentType contentType;
  private File file;
  private boolean gzipCompress;
  private List<NameValuePair> parameters;
  private Serializable serializable;
  private InputStream stream;
  private String text;
  
  EntityBuilder() {}
  
  private void clearContent()
  {
    text = null;
    binary = null;
    stream = null;
    parameters = null;
    serializable = null;
    file = null;
  }
  
  public static EntityBuilder create()
  {
    return new EntityBuilder();
  }
  
  private ContentType getContentOrDefault(ContentType paramContentType)
  {
    if (contentType != null) {
      paramContentType = contentType;
    }
    return paramContentType;
  }
  
  public HttpEntity build()
  {
    Object localObject1;
    if (text != null) {
      localObject1 = new StringEntity(text, getContentOrDefault(ContentType.DEFAULT_TEXT));
    }
    for (;;)
    {
      if ((((AbstractHttpEntity)localObject1).getContentType() != null) && (contentType != null)) {
        ((AbstractHttpEntity)localObject1).setContentType(contentType.toString());
      }
      ((AbstractHttpEntity)localObject1).setContentEncoding(contentEncoding);
      ((AbstractHttpEntity)localObject1).setChunked(chunked);
      Object localObject2 = localObject1;
      if (gzipCompress) {
        localObject2 = new GzipCompressingEntity((HttpEntity)localObject1);
      }
      return localObject2;
      if (binary != null)
      {
        localObject1 = new ByteArrayEntity(binary, getContentOrDefault(ContentType.DEFAULT_BINARY));
      }
      else if (stream != null)
      {
        localObject1 = new InputStreamEntity(stream, 1L, getContentOrDefault(ContentType.DEFAULT_BINARY));
      }
      else
      {
        if (parameters != null)
        {
          localObject2 = parameters;
          if (contentType != null) {}
          for (localObject1 = contentType.getCharset();; localObject1 = null)
          {
            localObject1 = new UrlEncodedFormEntity((Iterable)localObject2, (Charset)localObject1);
            break;
          }
        }
        if (serializable != null)
        {
          localObject1 = new SerializableEntity(serializable);
          ((AbstractHttpEntity)localObject1).setContentType(ContentType.DEFAULT_BINARY.toString());
        }
        else if (file != null)
        {
          localObject1 = new FileEntity(file, getContentOrDefault(ContentType.DEFAULT_BINARY));
        }
        else
        {
          localObject1 = new BasicHttpEntity();
        }
      }
    }
  }
  
  public EntityBuilder chunked()
  {
    chunked = true;
    return this;
  }
  
  public byte[] getBinary()
  {
    return binary;
  }
  
  public String getContentEncoding()
  {
    return contentEncoding;
  }
  
  public ContentType getContentType()
  {
    return contentType;
  }
  
  public File getFile()
  {
    return file;
  }
  
  public List<NameValuePair> getParameters()
  {
    return parameters;
  }
  
  public Serializable getSerializable()
  {
    return serializable;
  }
  
  public InputStream getStream()
  {
    return stream;
  }
  
  public String getText()
  {
    return text;
  }
  
  public EntityBuilder gzipCompress()
  {
    gzipCompress = true;
    return this;
  }
  
  public boolean isChunked()
  {
    return chunked;
  }
  
  public boolean isGzipCompress()
  {
    return gzipCompress;
  }
  
  public EntityBuilder setBinary(byte[] paramArrayOfByte)
  {
    clearContent();
    binary = paramArrayOfByte;
    return this;
  }
  
  public EntityBuilder setContentEncoding(String paramString)
  {
    contentEncoding = paramString;
    return this;
  }
  
  public EntityBuilder setContentType(ContentType paramContentType)
  {
    contentType = paramContentType;
    return this;
  }
  
  public EntityBuilder setFile(File paramFile)
  {
    clearContent();
    file = paramFile;
    return this;
  }
  
  public EntityBuilder setParameters(List<NameValuePair> paramList)
  {
    clearContent();
    parameters = paramList;
    return this;
  }
  
  public EntityBuilder setParameters(NameValuePair... paramVarArgs)
  {
    return setParameters(Arrays.asList(paramVarArgs));
  }
  
  public EntityBuilder setSerializable(Serializable paramSerializable)
  {
    clearContent();
    serializable = paramSerializable;
    return this;
  }
  
  public EntityBuilder setStream(InputStream paramInputStream)
  {
    clearContent();
    stream = paramInputStream;
    return this;
  }
  
  public EntityBuilder setText(String paramString)
  {
    clearContent();
    text = paramString;
    return this;
  }
}
