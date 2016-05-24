package org.apache.http.impl.auth;

public abstract interface NTLMEngine
{
  public abstract String generateType1Msg(String paramString1, String paramString2)
    throws NTLMEngineException;
  
  public abstract String generateType3Msg(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5)
    throws NTLMEngineException;
}
