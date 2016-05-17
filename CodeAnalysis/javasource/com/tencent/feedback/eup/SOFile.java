package com.tencent.feedback.eup;

public class SOFile
{
  public final String arch;
  public final String fileName;
  public final String sha1;
  
  public SOFile(String paramString1, String paramString2, String paramString3)
  {
    if ((paramString1 == null) || (paramString2 == null) || (paramString3 == null)) {
      throw new RuntimeException("SOFile args should not be null!");
    }
    fileName = paramString1;
    arch = paramString2;
    sha1 = paramString3;
  }
}
