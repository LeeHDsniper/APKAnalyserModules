package org.apache.http.impl;

import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.CodingErrorAction;
import org.apache.http.config.ConnectionConfig;

public final class ConnSupport
{
  public ConnSupport() {}
  
  public static CharsetDecoder createDecoder(ConnectionConfig paramConnectionConfig)
  {
    if (paramConnectionConfig == null) {}
    Object localObject1;
    CodingErrorAction localCodingErrorAction;
    do
    {
      return null;
      localObject2 = paramConnectionConfig.getCharset();
      localObject1 = paramConnectionConfig.getMalformedInputAction();
      localCodingErrorAction = paramConnectionConfig.getUnmappableInputAction();
    } while (localObject2 == null);
    Object localObject2 = ((Charset)localObject2).newDecoder();
    if (localObject1 != null)
    {
      paramConnectionConfig = (ConnectionConfig)localObject1;
      localObject1 = ((CharsetDecoder)localObject2).onMalformedInput(paramConnectionConfig);
      if (localCodingErrorAction == null) {
        break label61;
      }
    }
    label61:
    for (paramConnectionConfig = localCodingErrorAction;; paramConnectionConfig = CodingErrorAction.REPORT)
    {
      return ((CharsetDecoder)localObject1).onUnmappableCharacter(paramConnectionConfig);
      paramConnectionConfig = CodingErrorAction.REPORT;
      break;
    }
  }
  
  public static CharsetEncoder createEncoder(ConnectionConfig paramConnectionConfig)
  {
    if (paramConnectionConfig == null) {}
    do
    {
      return null;
      localObject2 = paramConnectionConfig.getCharset();
    } while (localObject2 == null);
    Object localObject1 = paramConnectionConfig.getMalformedInputAction();
    CodingErrorAction localCodingErrorAction = paramConnectionConfig.getUnmappableInputAction();
    Object localObject2 = ((Charset)localObject2).newEncoder();
    if (localObject1 != null)
    {
      paramConnectionConfig = (ConnectionConfig)localObject1;
      localObject1 = ((CharsetEncoder)localObject2).onMalformedInput(paramConnectionConfig);
      if (localCodingErrorAction == null) {
        break label61;
      }
    }
    label61:
    for (paramConnectionConfig = localCodingErrorAction;; paramConnectionConfig = CodingErrorAction.REPORT)
    {
      return ((CharsetEncoder)localObject1).onUnmappableCharacter(paramConnectionConfig);
      paramConnectionConfig = CodingErrorAction.REPORT;
      break;
    }
  }
}
