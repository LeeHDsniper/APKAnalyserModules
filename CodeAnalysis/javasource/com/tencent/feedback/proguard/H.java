package com.tencent.feedback.proguard;

import java.security.NoSuchAlgorithmException;

public abstract interface H
{
  public abstract void a(String paramString);
  
  public abstract byte[] a(byte[] paramArrayOfByte)
    throws Exception;
  
  public abstract byte[] b(byte[] paramArrayOfByte)
    throws Exception, NoSuchAlgorithmException;
}
