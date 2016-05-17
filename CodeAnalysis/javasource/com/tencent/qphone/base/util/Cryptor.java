package com.tencent.qphone.base.util;

public class Cryptor
{
  b impl = new b();
  
  public Cryptor() {}
  
  public byte[] decrypt(byte[] paramArrayOfByte1, int paramInt1, int paramInt2, byte[] paramArrayOfByte2)
  {
    return impl.a(paramArrayOfByte1, paramInt1, paramInt2, paramArrayOfByte2);
  }
  
  public byte[] decrypt(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2)
  {
    return impl.a(paramArrayOfByte1, paramArrayOfByte2);
  }
  
  public void enableResultRandom(boolean paramBoolean)
  {
    impl.a(paramBoolean);
  }
  
  public byte[] encrypt(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2)
  {
    return impl.b(paramArrayOfByte1, paramArrayOfByte2);
  }
}
