package com.google.zxing;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public final class WriterException
  extends Exception
{
  public WriterException()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public WriterException(String paramString)
  {
    super(paramString);
  }
  
  public WriterException(Throwable paramThrowable)
  {
    super(paramThrowable);
  }
}
