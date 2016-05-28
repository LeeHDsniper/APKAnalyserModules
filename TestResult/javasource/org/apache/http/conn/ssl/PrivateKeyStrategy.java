package org.apache.http.conn.ssl;

import java.net.Socket;
import java.util.Map;

public abstract interface PrivateKeyStrategy
{
  public abstract String chooseAlias(Map<String, PrivateKeyDetails> paramMap, Socket paramSocket);
}
