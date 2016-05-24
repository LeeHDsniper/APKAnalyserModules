package com.squareup.okhttp;

import java.util.regex.Pattern;

public final class MediaType
{
  private static final Pattern PARAMETER = Pattern.compile(";\\s*(?:([a-zA-Z0-9-!#$%&'*+.^_`{|}~]+)=(?:([a-zA-Z0-9-!#$%&'*+.^_`{|}~]+)|\"([^\"]*)\"))?");
  private static final Pattern TYPE_SUBTYPE = Pattern.compile("([a-zA-Z0-9-!#$%&'*+.^_`{|}~]+)/([a-zA-Z0-9-!#$%&'*+.^_`{|}~]+)");
  private final String mediaType;
  
  public boolean equals(Object paramObject)
  {
    return ((paramObject instanceof MediaType)) && (mediaType.equals(mediaType));
  }
  
  public int hashCode()
  {
    return mediaType.hashCode();
  }
  
  public String toString()
  {
    return mediaType;
  }
}
