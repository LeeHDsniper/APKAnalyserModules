package org.apache.http.entity.mime;

import java.io.File;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import org.apache.http.HttpEntity;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.content.ByteArrayBody;
import org.apache.http.entity.mime.content.ContentBody;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.InputStreamBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.util.Args;

public class MultipartEntityBuilder
{
  private static final String DEFAULT_SUBTYPE = "form-data";
  private static final char[] MULTIPART_CHARS = "-_1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray();
  private List<FormBodyPart> bodyParts = null;
  private String boundary = null;
  private Charset charset = null;
  private HttpMultipartMode mode = HttpMultipartMode.STRICT;
  private String subType = "form-data";
  
  MultipartEntityBuilder() {}
  
  public static MultipartEntityBuilder create()
  {
    return new MultipartEntityBuilder();
  }
  
  private String generateBoundary()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    Random localRandom = new Random();
    int j = localRandom.nextInt(11);
    int i = 0;
    while (i < j + 30)
    {
      localStringBuilder.append(MULTIPART_CHARS[localRandom.nextInt(MULTIPART_CHARS.length)]);
      i += 1;
    }
    return localStringBuilder.toString();
  }
  
  private String generateContentType(String paramString, Charset paramCharset)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("multipart/form-data; boundary=");
    localStringBuilder.append(paramString);
    if (paramCharset != null)
    {
      localStringBuilder.append("; charset=");
      localStringBuilder.append(paramCharset.name());
    }
    return localStringBuilder.toString();
  }
  
  public MultipartEntityBuilder addBinaryBody(String paramString, File paramFile)
  {
    return addBinaryBody(paramString, paramFile, ContentType.DEFAULT_BINARY, null);
  }
  
  public MultipartEntityBuilder addBinaryBody(String paramString1, File paramFile, ContentType paramContentType, String paramString2)
  {
    return addPart(paramString1, new FileBody(paramFile, paramContentType, paramString2));
  }
  
  public MultipartEntityBuilder addBinaryBody(String paramString, InputStream paramInputStream)
  {
    return addBinaryBody(paramString, paramInputStream, ContentType.DEFAULT_BINARY, null);
  }
  
  public MultipartEntityBuilder addBinaryBody(String paramString1, InputStream paramInputStream, ContentType paramContentType, String paramString2)
  {
    return addPart(paramString1, new InputStreamBody(paramInputStream, paramContentType, paramString2));
  }
  
  public MultipartEntityBuilder addBinaryBody(String paramString, byte[] paramArrayOfByte)
  {
    return addBinaryBody(paramString, paramArrayOfByte, ContentType.DEFAULT_BINARY, null);
  }
  
  public MultipartEntityBuilder addBinaryBody(String paramString1, byte[] paramArrayOfByte, ContentType paramContentType, String paramString2)
  {
    return addPart(paramString1, new ByteArrayBody(paramArrayOfByte, paramContentType, paramString2));
  }
  
  public MultipartEntityBuilder addPart(String paramString, ContentBody paramContentBody)
  {
    Args.notNull(paramString, "Name");
    Args.notNull(paramContentBody, "Content body");
    return addPart(new FormBodyPart(paramString, paramContentBody));
  }
  
  MultipartEntityBuilder addPart(FormBodyPart paramFormBodyPart)
  {
    if (paramFormBodyPart == null) {
      return this;
    }
    if (bodyParts == null) {
      bodyParts = new ArrayList();
    }
    bodyParts.add(paramFormBodyPart);
    return this;
  }
  
  public MultipartEntityBuilder addTextBody(String paramString1, String paramString2)
  {
    return addTextBody(paramString1, paramString2, ContentType.DEFAULT_TEXT);
  }
  
  public MultipartEntityBuilder addTextBody(String paramString1, String paramString2, ContentType paramContentType)
  {
    return addPart(paramString1, new StringBody(paramString2, paramContentType));
  }
  
  public HttpEntity build()
  {
    return buildEntity();
  }
  
  MultipartFormEntity buildEntity()
  {
    Object localObject1;
    Charset localCharset;
    String str;
    label30:
    Object localObject2;
    label49:
    HttpMultipartMode localHttpMultipartMode;
    if (subType != null)
    {
      localObject1 = subType;
      localCharset = charset;
      if (boundary == null) {
        break label131;
      }
      str = boundary;
      if (bodyParts == null) {
        break label139;
      }
      localObject2 = new ArrayList(bodyParts);
      if (mode == null) {
        break label146;
      }
      localHttpMultipartMode = mode;
      label62:
      switch (1.$SwitchMap$org$apache$http$entity$mime$HttpMultipartMode[localHttpMultipartMode.ordinal()])
      {
      default: 
        localObject1 = new HttpStrictMultipart((String)localObject1, localCharset, str, (List)localObject2);
      }
    }
    for (;;)
    {
      return new MultipartFormEntity((AbstractMultipartForm)localObject1, generateContentType(str, localCharset), ((AbstractMultipartForm)localObject1).getTotalLength());
      localObject1 = "form-data";
      break;
      label131:
      str = generateBoundary();
      break label30;
      label139:
      localObject2 = Collections.emptyList();
      break label49;
      label146:
      localHttpMultipartMode = HttpMultipartMode.STRICT;
      break label62;
      localObject1 = new HttpBrowserCompatibleMultipart((String)localObject1, localCharset, str, (List)localObject2);
      continue;
      localObject1 = new HttpRFC6532Multipart((String)localObject1, localCharset, str, (List)localObject2);
    }
  }
  
  public MultipartEntityBuilder setBoundary(String paramString)
  {
    boundary = paramString;
    return this;
  }
  
  public MultipartEntityBuilder setCharset(Charset paramCharset)
  {
    charset = paramCharset;
    return this;
  }
  
  public MultipartEntityBuilder setLaxMode()
  {
    mode = HttpMultipartMode.BROWSER_COMPATIBLE;
    return this;
  }
  
  public MultipartEntityBuilder setMode(HttpMultipartMode paramHttpMultipartMode)
  {
    mode = paramHttpMultipartMode;
    return this;
  }
  
  public MultipartEntityBuilder setStrictMode()
  {
    mode = HttpMultipartMode.STRICT;
    return this;
  }
}
