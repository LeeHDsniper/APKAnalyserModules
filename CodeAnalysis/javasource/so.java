import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public final class so
{
  private final byte[] a;
  private final byte[] b;
  
  public so(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = paramArrayOfByte1;
    b = paramArrayOfByte2;
  }
  
  public byte[] a()
  {
    return a;
  }
  
  public byte[] b()
  {
    return b;
  }
}
