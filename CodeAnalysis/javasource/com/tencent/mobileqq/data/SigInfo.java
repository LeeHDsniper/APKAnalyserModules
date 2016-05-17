package com.tencent.mobileqq.data;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class SigInfo
{
  public byte cReplyCodeBody;
  public byte cType;
  public byte[] sessionKey;
  public byte[] signature;
  public short wSignatureLen;
  
  public SigInfo()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
}
