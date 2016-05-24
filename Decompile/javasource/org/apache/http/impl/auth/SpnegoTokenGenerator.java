package org.apache.http.impl.auth;

import java.io.IOException;

@Deprecated
public abstract interface SpnegoTokenGenerator
{
  public abstract byte[] generateSpnegoDERObject(byte[] paramArrayOfByte)
    throws IOException;
}
