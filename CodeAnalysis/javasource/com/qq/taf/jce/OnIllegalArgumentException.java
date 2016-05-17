package com.qq.taf.jce;

import java.nio.ByteBuffer;

public abstract interface OnIllegalArgumentException
{
  public abstract void onException(IllegalArgumentException paramIllegalArgumentException, ByteBuffer paramByteBuffer, int paramInt1, int paramInt2);
}
