package com.nostra13.universalimageloader.cache.disc.naming;

public class HashCodeFileNameGenerator
  implements FileNameGenerator
{
  public HashCodeFileNameGenerator() {}
  
  public String generate(String paramString)
  {
    return String.valueOf(paramString.hashCode());
  }
}
