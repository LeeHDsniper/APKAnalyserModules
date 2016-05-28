package org.apache.http.impl.auth;

import java.io.UnsupportedEncodingException;
import java.security.Key;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.Locale;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.codec.binary.Base64;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.util.EncodingUtils;

@NotThreadSafe
final class NTLMEngineImpl
  implements NTLMEngine
{
  static final String DEFAULT_CHARSET = "ASCII";
  protected static final int FLAG_DOMAIN_PRESENT = 4096;
  protected static final int FLAG_REQUEST_128BIT_KEY_EXCH = 536870912;
  protected static final int FLAG_REQUEST_56BIT_ENCRYPTION = Integer.MIN_VALUE;
  protected static final int FLAG_REQUEST_ALWAYS_SIGN = 32768;
  protected static final int FLAG_REQUEST_EXPLICIT_KEY_EXCH = 1073741824;
  protected static final int FLAG_REQUEST_LAN_MANAGER_KEY = 128;
  protected static final int FLAG_REQUEST_NTLM2_SESSION = 524288;
  protected static final int FLAG_REQUEST_NTLMv1 = 512;
  protected static final int FLAG_REQUEST_SEAL = 32;
  protected static final int FLAG_REQUEST_SIGN = 16;
  protected static final int FLAG_REQUEST_TARGET = 4;
  protected static final int FLAG_REQUEST_UNICODE_ENCODING = 1;
  protected static final int FLAG_REQUEST_VERSION = 33554432;
  protected static final int FLAG_TARGETINFO_PRESENT = 8388608;
  protected static final int FLAG_WORKSTATION_PRESENT = 8192;
  private static final SecureRandom RND_GEN;
  private static final byte[] SIGNATURE;
  private String credentialCharset = "ASCII";
  
  static
  {
    Object localObject = null;
    try
    {
      SecureRandom localSecureRandom = SecureRandom.getInstance("SHA1PRNG");
      localObject = localSecureRandom;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
    RND_GEN = (SecureRandom)localObject;
    localObject = EncodingUtils.getBytes("NTLMSSP", "ASCII");
    SIGNATURE = new byte[localObject.length + 1];
    System.arraycopy(localObject, 0, SIGNATURE, 0, localObject.length);
    SIGNATURE[localObject.length] = 0;
  }
  
  NTLMEngineImpl() {}
  
  static int F(int paramInt1, int paramInt2, int paramInt3)
  {
    return paramInt1 & paramInt2 | (paramInt1 ^ 0xFFFFFFFF) & paramInt3;
  }
  
  static int G(int paramInt1, int paramInt2, int paramInt3)
  {
    return paramInt1 & paramInt2 | paramInt1 & paramInt3 | paramInt2 & paramInt3;
  }
  
  static int H(int paramInt1, int paramInt2, int paramInt3)
  {
    return paramInt1 ^ paramInt2 ^ paramInt3;
  }
  
  static byte[] RC4(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2)
    throws NTLMEngineException
  {
    try
    {
      Cipher localCipher = Cipher.getInstance("RC4");
      localCipher.init(1, new SecretKeySpec(paramArrayOfByte2, "RC4"));
      paramArrayOfByte1 = localCipher.doFinal(paramArrayOfByte1);
      return paramArrayOfByte1;
    }
    catch (Exception paramArrayOfByte1)
    {
      throw new NTLMEngineException(paramArrayOfByte1.getMessage(), paramArrayOfByte1);
    }
  }
  
  private static String convertDomain(String paramString)
  {
    return stripDotSuffix(paramString);
  }
  
  private static String convertHost(String paramString)
  {
    return stripDotSuffix(paramString);
  }
  
  private static byte[] createBlob(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2, byte[] paramArrayOfByte3)
  {
    byte[] arrayOfByte1 = new byte[4];
    byte[] tmp7_5 = arrayOfByte1;
    tmp7_5[0] = 1;
    byte[] tmp12_7 = tmp7_5;
    tmp12_7[1] = 1;
    byte[] tmp17_12 = tmp12_7;
    tmp17_12[2] = 0;
    byte[] tmp22_17 = tmp17_12;
    tmp22_17[3] = 0;
    tmp22_17;
    byte[] arrayOfByte2 = new byte[4];
    byte[] tmp35_33 = arrayOfByte2;
    tmp35_33[0] = 0;
    byte[] tmp40_35 = tmp35_33;
    tmp40_35[1] = 0;
    byte[] tmp45_40 = tmp40_35;
    tmp45_40[2] = 0;
    byte[] tmp50_45 = tmp45_40;
    tmp50_45[3] = 0;
    tmp50_45;
    byte[] arrayOfByte3 = new byte[4];
    byte[] tmp63_61 = arrayOfByte3;
    tmp63_61[0] = 0;
    byte[] tmp68_63 = tmp63_61;
    tmp68_63[1] = 0;
    byte[] tmp73_68 = tmp68_63;
    tmp73_68[2] = 0;
    byte[] tmp78_73 = tmp73_68;
    tmp78_73[3] = 0;
    tmp78_73;
    byte[] arrayOfByte4 = new byte[4];
    byte[] tmp91_89 = arrayOfByte4;
    tmp91_89[0] = 0;
    byte[] tmp96_91 = tmp91_89;
    tmp96_91[1] = 0;
    byte[] tmp101_96 = tmp96_91;
    tmp101_96[2] = 0;
    byte[] tmp106_101 = tmp101_96;
    tmp106_101[3] = 0;
    tmp106_101;
    byte[] arrayOfByte5 = new byte[arrayOfByte1.length + arrayOfByte2.length + paramArrayOfByte3.length + 8 + arrayOfByte3.length + paramArrayOfByte2.length + arrayOfByte4.length];
    System.arraycopy(arrayOfByte1, 0, arrayOfByte5, 0, arrayOfByte1.length);
    int i = 0 + arrayOfByte1.length;
    System.arraycopy(arrayOfByte2, 0, arrayOfByte5, i, arrayOfByte2.length);
    i += arrayOfByte2.length;
    System.arraycopy(paramArrayOfByte3, 0, arrayOfByte5, i, paramArrayOfByte3.length);
    i += paramArrayOfByte3.length;
    System.arraycopy(paramArrayOfByte1, 0, arrayOfByte5, i, 8);
    i += 8;
    System.arraycopy(arrayOfByte3, 0, arrayOfByte5, i, arrayOfByte3.length);
    i += arrayOfByte3.length;
    System.arraycopy(paramArrayOfByte2, 0, arrayOfByte5, i, paramArrayOfByte2.length);
    i += paramArrayOfByte2.length;
    System.arraycopy(arrayOfByte4, 0, arrayOfByte5, i, arrayOfByte4.length);
    i = arrayOfByte4.length;
    return arrayOfByte5;
  }
  
  private static Key createDESKey(byte[] paramArrayOfByte, int paramInt)
  {
    byte[] arrayOfByte = new byte[7];
    System.arraycopy(paramArrayOfByte, paramInt, arrayOfByte, 0, 7);
    paramArrayOfByte = new byte[8];
    paramArrayOfByte[0] = arrayOfByte[0];
    paramArrayOfByte[1] = ((byte)(arrayOfByte[0] << 7 | (arrayOfByte[1] & 0xFF) >>> 1));
    paramArrayOfByte[2] = ((byte)(arrayOfByte[1] << 6 | (arrayOfByte[2] & 0xFF) >>> 2));
    paramArrayOfByte[3] = ((byte)(arrayOfByte[2] << 5 | (arrayOfByte[3] & 0xFF) >>> 3));
    paramArrayOfByte[4] = ((byte)(arrayOfByte[3] << 4 | (arrayOfByte[4] & 0xFF) >>> 4));
    paramArrayOfByte[5] = ((byte)(arrayOfByte[4] << 3 | (arrayOfByte[5] & 0xFF) >>> 5));
    paramArrayOfByte[6] = ((byte)(arrayOfByte[5] << 2 | (arrayOfByte[6] & 0xFF) >>> 6));
    paramArrayOfByte[7] = ((byte)(arrayOfByte[6] << 1));
    oddParity(paramArrayOfByte);
    return new SecretKeySpec(paramArrayOfByte, "DES");
  }
  
  static byte[] hmacMD5(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2)
    throws NTLMEngineException
  {
    paramArrayOfByte2 = new HMACMD5(paramArrayOfByte2);
    paramArrayOfByte2.update(paramArrayOfByte1);
    return paramArrayOfByte2.getOutput();
  }
  
  private static byte[] lmHash(String paramString)
    throws NTLMEngineException
  {
    try
    {
      paramString = paramString.toUpperCase(Locale.US).getBytes("US-ASCII");
      int i = Math.min(paramString.length, 14);
      Object localObject = new byte[14];
      System.arraycopy(paramString, 0, localObject, 0, i);
      paramString = createDESKey((byte[])localObject, 0);
      localObject = createDESKey((byte[])localObject, 7);
      byte[] arrayOfByte = "KGS!@#$%".getBytes("US-ASCII");
      Cipher localCipher = Cipher.getInstance("DES/ECB/NoPadding");
      localCipher.init(1, paramString);
      paramString = localCipher.doFinal(arrayOfByte);
      localCipher.init(1, (Key)localObject);
      localObject = localCipher.doFinal(arrayOfByte);
      arrayOfByte = new byte[16];
      System.arraycopy(paramString, 0, arrayOfByte, 0, 8);
      System.arraycopy(localObject, 0, arrayOfByte, 8, 8);
      return arrayOfByte;
    }
    catch (Exception paramString)
    {
      throw new NTLMEngineException(paramString.getMessage(), paramString);
    }
  }
  
  private static byte[] lmResponse(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2)
    throws NTLMEngineException
  {
    try
    {
      Object localObject2 = new byte[21];
      System.arraycopy(paramArrayOfByte1, 0, localObject2, 0, 16);
      paramArrayOfByte1 = createDESKey((byte[])localObject2, 0);
      Object localObject1 = createDESKey((byte[])localObject2, 7);
      localObject2 = createDESKey((byte[])localObject2, 14);
      Cipher localCipher = Cipher.getInstance("DES/ECB/NoPadding");
      localCipher.init(1, paramArrayOfByte1);
      paramArrayOfByte1 = localCipher.doFinal(paramArrayOfByte2);
      localCipher.init(1, (Key)localObject1);
      localObject1 = localCipher.doFinal(paramArrayOfByte2);
      localCipher.init(1, (Key)localObject2);
      paramArrayOfByte2 = localCipher.doFinal(paramArrayOfByte2);
      localObject2 = new byte[24];
      System.arraycopy(paramArrayOfByte1, 0, localObject2, 0, 8);
      System.arraycopy(localObject1, 0, localObject2, 8, 8);
      System.arraycopy(paramArrayOfByte2, 0, localObject2, 16, 8);
      return localObject2;
    }
    catch (Exception paramArrayOfByte1)
    {
      throw new NTLMEngineException(paramArrayOfByte1.getMessage(), paramArrayOfByte1);
    }
  }
  
  private static byte[] lmv2Hash(String paramString1, String paramString2, byte[] paramArrayOfByte)
    throws NTLMEngineException
  {
    try
    {
      paramArrayOfByte = new HMACMD5(paramArrayOfByte);
      paramArrayOfByte.update(paramString2.toUpperCase(Locale.US).getBytes("UnicodeLittleUnmarked"));
      if (paramString1 != null) {
        paramArrayOfByte.update(paramString1.toUpperCase(Locale.US).getBytes("UnicodeLittleUnmarked"));
      }
      paramString1 = paramArrayOfByte.getOutput();
      return paramString1;
    }
    catch (UnsupportedEncodingException paramString1)
    {
      throw new NTLMEngineException("Unicode not supported! " + paramString1.getMessage(), paramString1);
    }
  }
  
  private static byte[] lmv2Response(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2, byte[] paramArrayOfByte3)
    throws NTLMEngineException
  {
    paramArrayOfByte1 = new HMACMD5(paramArrayOfByte1);
    paramArrayOfByte1.update(paramArrayOfByte2);
    paramArrayOfByte1.update(paramArrayOfByte3);
    paramArrayOfByte1 = paramArrayOfByte1.getOutput();
    paramArrayOfByte2 = new byte[paramArrayOfByte1.length + paramArrayOfByte3.length];
    System.arraycopy(paramArrayOfByte1, 0, paramArrayOfByte2, 0, paramArrayOfByte1.length);
    System.arraycopy(paramArrayOfByte3, 0, paramArrayOfByte2, paramArrayOfByte1.length, paramArrayOfByte3.length);
    return paramArrayOfByte2;
  }
  
  private static byte[] makeRandomChallenge()
    throws NTLMEngineException
  {
    if (RND_GEN == null) {
      throw new NTLMEngineException("Random generator not available");
    }
    byte[] arrayOfByte = new byte[8];
    synchronized (RND_GEN)
    {
      RND_GEN.nextBytes(arrayOfByte);
      return arrayOfByte;
    }
  }
  
  private static byte[] makeSecondaryKey()
    throws NTLMEngineException
  {
    if (RND_GEN == null) {
      throw new NTLMEngineException("Random generator not available");
    }
    byte[] arrayOfByte = new byte[16];
    synchronized (RND_GEN)
    {
      RND_GEN.nextBytes(arrayOfByte);
      return arrayOfByte;
    }
  }
  
  static byte[] ntlm2SessionResponse(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2, byte[] paramArrayOfByte3)
    throws NTLMEngineException
  {
    try
    {
      MessageDigest localMessageDigest = MessageDigest.getInstance("MD5");
      localMessageDigest.update(paramArrayOfByte2);
      localMessageDigest.update(paramArrayOfByte3);
      paramArrayOfByte2 = localMessageDigest.digest();
      paramArrayOfByte3 = new byte[8];
      System.arraycopy(paramArrayOfByte2, 0, paramArrayOfByte3, 0, 8);
      paramArrayOfByte1 = lmResponse(paramArrayOfByte1, paramArrayOfByte3);
      return paramArrayOfByte1;
    }
    catch (Exception paramArrayOfByte1)
    {
      if ((paramArrayOfByte1 instanceof NTLMEngineException)) {
        throw ((NTLMEngineException)paramArrayOfByte1);
      }
      throw new NTLMEngineException(paramArrayOfByte1.getMessage(), paramArrayOfByte1);
    }
  }
  
  private static byte[] ntlmHash(String paramString)
    throws NTLMEngineException
  {
    try
    {
      paramString = paramString.getBytes("UnicodeLittleUnmarked");
      MD4 localMD4 = new MD4();
      localMD4.update(paramString);
      paramString = localMD4.getOutput();
      return paramString;
    }
    catch (UnsupportedEncodingException paramString)
    {
      throw new NTLMEngineException("Unicode not supported: " + paramString.getMessage(), paramString);
    }
  }
  
  private static byte[] ntlmv2Hash(String paramString1, String paramString2, byte[] paramArrayOfByte)
    throws NTLMEngineException
  {
    try
    {
      paramArrayOfByte = new HMACMD5(paramArrayOfByte);
      paramArrayOfByte.update(paramString2.toUpperCase(Locale.US).getBytes("UnicodeLittleUnmarked"));
      if (paramString1 != null) {
        paramArrayOfByte.update(paramString1.getBytes("UnicodeLittleUnmarked"));
      }
      paramString1 = paramArrayOfByte.getOutput();
      return paramString1;
    }
    catch (UnsupportedEncodingException paramString1)
    {
      throw new NTLMEngineException("Unicode not supported! " + paramString1.getMessage(), paramString1);
    }
  }
  
  private static void oddParity(byte[] paramArrayOfByte)
  {
    int i = 0;
    if (i < paramArrayOfByte.length)
    {
      int j = paramArrayOfByte[i];
      if (((j >>> 7 ^ j >>> 6 ^ j >>> 5 ^ j >>> 4 ^ j >>> 3 ^ j >>> 2 ^ j >>> 1) & 0x1) == 0)
      {
        j = 1;
        label48:
        if (j == 0) {
          break label73;
        }
        paramArrayOfByte[i] = ((byte)(paramArrayOfByte[i] | 0x1));
      }
      for (;;)
      {
        i += 1;
        break;
        j = 0;
        break label48;
        label73:
        paramArrayOfByte[i] = ((byte)(paramArrayOfByte[i] & 0xFFFFFFFE));
      }
    }
  }
  
  private static byte[] readSecurityBuffer(byte[] paramArrayOfByte, int paramInt)
    throws NTLMEngineException
  {
    int i = readUShort(paramArrayOfByte, paramInt);
    paramInt = readULong(paramArrayOfByte, paramInt + 4);
    if (paramArrayOfByte.length < paramInt + i) {
      throw new NTLMEngineException("NTLM authentication - buffer too small for data item");
    }
    byte[] arrayOfByte = new byte[i];
    System.arraycopy(paramArrayOfByte, paramInt, arrayOfByte, 0, i);
    return arrayOfByte;
  }
  
  private static int readULong(byte[] paramArrayOfByte, int paramInt)
    throws NTLMEngineException
  {
    if (paramArrayOfByte.length < paramInt + 4) {
      throw new NTLMEngineException("NTLM authentication - buffer too small for DWORD");
    }
    return paramArrayOfByte[paramInt] & 0xFF | (paramArrayOfByte[(paramInt + 1)] & 0xFF) << 8 | (paramArrayOfByte[(paramInt + 2)] & 0xFF) << 16 | (paramArrayOfByte[(paramInt + 3)] & 0xFF) << 24;
  }
  
  private static int readUShort(byte[] paramArrayOfByte, int paramInt)
    throws NTLMEngineException
  {
    if (paramArrayOfByte.length < paramInt + 2) {
      throw new NTLMEngineException("NTLM authentication - buffer too small for WORD");
    }
    return paramArrayOfByte[paramInt] & 0xFF | (paramArrayOfByte[(paramInt + 1)] & 0xFF) << 8;
  }
  
  static int rotintlft(int paramInt1, int paramInt2)
  {
    return paramInt1 << paramInt2 | paramInt1 >>> 32 - paramInt2;
  }
  
  private static String stripDotSuffix(String paramString)
  {
    String str;
    if (paramString == null) {
      str = null;
    }
    int i;
    do
    {
      return str;
      i = paramString.indexOf(".");
      str = paramString;
    } while (i == -1);
    return paramString.substring(0, i);
  }
  
  static void writeULong(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    paramArrayOfByte[paramInt2] = ((byte)(paramInt1 & 0xFF));
    paramArrayOfByte[(paramInt2 + 1)] = ((byte)(paramInt1 >> 8 & 0xFF));
    paramArrayOfByte[(paramInt2 + 2)] = ((byte)(paramInt1 >> 16 & 0xFF));
    paramArrayOfByte[(paramInt2 + 3)] = ((byte)(paramInt1 >> 24 & 0xFF));
  }
  
  public String generateType1Msg(String paramString1, String paramString2)
    throws NTLMEngineException
  {
    return getType1Message(paramString2, paramString1);
  }
  
  public String generateType3Msg(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5)
    throws NTLMEngineException
  {
    paramString5 = new Type2Message(paramString5);
    return getType3Message(paramString1, paramString2, paramString4, paramString3, paramString5.getChallenge(), paramString5.getFlags(), paramString5.getTarget(), paramString5.getTargetInfo());
  }
  
  String getCredentialCharset()
  {
    return credentialCharset;
  }
  
  final String getResponseFor(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5)
    throws NTLMEngineException
  {
    if ((paramString1 == null) || (paramString1.trim().equals(""))) {
      return getType1Message(paramString4, paramString5);
    }
    paramString1 = new Type2Message(paramString1);
    return getType3Message(paramString2, paramString3, paramString4, paramString5, paramString1.getChallenge(), paramString1.getFlags(), paramString1.getTarget(), paramString1.getTargetInfo());
  }
  
  String getType1Message(String paramString1, String paramString2)
    throws NTLMEngineException
  {
    return new Type1Message(paramString2, paramString1).getResponse();
  }
  
  String getType3Message(String paramString1, String paramString2, String paramString3, String paramString4, byte[] paramArrayOfByte1, int paramInt, String paramString5, byte[] paramArrayOfByte2)
    throws NTLMEngineException
  {
    return new Type3Message(paramString4, paramString3, paramString1, paramString2, paramArrayOfByte1, paramInt, paramString5, paramArrayOfByte2).getResponse();
  }
  
  void setCredentialCharset(String paramString)
  {
    credentialCharset = paramString;
  }
  
  protected static class CipherGen
  {
    protected final byte[] challenge;
    protected byte[] clientChallenge;
    protected byte[] clientChallenge2;
    protected final String domain;
    protected byte[] lanManagerSessionKey = null;
    protected byte[] lm2SessionResponse = null;
    protected byte[] lmHash = null;
    protected byte[] lmResponse = null;
    protected byte[] lmUserSessionKey = null;
    protected byte[] lmv2Hash = null;
    protected byte[] lmv2Response = null;
    protected byte[] ntlm2SessionResponse = null;
    protected byte[] ntlm2SessionResponseUserSessionKey = null;
    protected byte[] ntlmHash = null;
    protected byte[] ntlmResponse = null;
    protected byte[] ntlmUserSessionKey = null;
    protected byte[] ntlmv2Blob = null;
    protected byte[] ntlmv2Hash = null;
    protected byte[] ntlmv2Response = null;
    protected byte[] ntlmv2UserSessionKey = null;
    protected final String password;
    protected byte[] secondaryKey;
    protected final String target;
    protected final byte[] targetInformation;
    protected byte[] timestamp;
    protected final String user;
    
    public CipherGen(String paramString1, String paramString2, String paramString3, byte[] paramArrayOfByte1, String paramString4, byte[] paramArrayOfByte2)
    {
      this(paramString1, paramString2, paramString3, paramArrayOfByte1, paramString4, paramArrayOfByte2, null, null, null, null);
    }
    
    public CipherGen(String paramString1, String paramString2, String paramString3, byte[] paramArrayOfByte1, String paramString4, byte[] paramArrayOfByte2, byte[] paramArrayOfByte3, byte[] paramArrayOfByte4, byte[] paramArrayOfByte5, byte[] paramArrayOfByte6)
    {
      domain = paramString1;
      target = paramString4;
      user = paramString2;
      password = paramString3;
      challenge = paramArrayOfByte1;
      targetInformation = paramArrayOfByte2;
      clientChallenge = paramArrayOfByte3;
      clientChallenge2 = paramArrayOfByte4;
      secondaryKey = paramArrayOfByte5;
      timestamp = paramArrayOfByte6;
    }
    
    public byte[] getClientChallenge()
      throws NTLMEngineException
    {
      if (clientChallenge == null) {
        clientChallenge = NTLMEngineImpl.access$000();
      }
      return clientChallenge;
    }
    
    public byte[] getClientChallenge2()
      throws NTLMEngineException
    {
      if (clientChallenge2 == null) {
        clientChallenge2 = NTLMEngineImpl.access$000();
      }
      return clientChallenge2;
    }
    
    public byte[] getLM2SessionResponse()
      throws NTLMEngineException
    {
      if (lm2SessionResponse == null)
      {
        byte[] arrayOfByte = getClientChallenge();
        lm2SessionResponse = new byte[24];
        System.arraycopy(arrayOfByte, 0, lm2SessionResponse, 0, arrayOfByte.length);
        Arrays.fill(lm2SessionResponse, arrayOfByte.length, lm2SessionResponse.length, (byte)0);
      }
      return lm2SessionResponse;
    }
    
    public byte[] getLMHash()
      throws NTLMEngineException
    {
      if (lmHash == null) {
        lmHash = NTLMEngineImpl.lmHash(password);
      }
      return lmHash;
    }
    
    public byte[] getLMResponse()
      throws NTLMEngineException
    {
      if (lmResponse == null) {
        lmResponse = NTLMEngineImpl.lmResponse(getLMHash(), challenge);
      }
      return lmResponse;
    }
    
    public byte[] getLMUserSessionKey()
      throws NTLMEngineException
    {
      if (lmUserSessionKey == null)
      {
        byte[] arrayOfByte = getLMHash();
        lmUserSessionKey = new byte[16];
        System.arraycopy(arrayOfByte, 0, lmUserSessionKey, 0, 8);
        Arrays.fill(lmUserSessionKey, 8, 16, (byte)0);
      }
      return lmUserSessionKey;
    }
    
    public byte[] getLMv2Hash()
      throws NTLMEngineException
    {
      if (lmv2Hash == null) {
        lmv2Hash = NTLMEngineImpl.lmv2Hash(domain, user, getNTLMHash());
      }
      return lmv2Hash;
    }
    
    public byte[] getLMv2Response()
      throws NTLMEngineException
    {
      if (lmv2Response == null) {
        lmv2Response = NTLMEngineImpl.lmv2Response(getLMv2Hash(), challenge, getClientChallenge());
      }
      return lmv2Response;
    }
    
    public byte[] getLanManagerSessionKey()
      throws NTLMEngineException
    {
      byte[] arrayOfByte;
      Object localObject2;
      if (lanManagerSessionKey == null)
      {
        arrayOfByte = getLMHash();
        localObject2 = getLMResponse();
      }
      try
      {
        Object localObject1 = new byte[14];
        System.arraycopy(arrayOfByte, 0, localObject1, 0, 8);
        Arrays.fill((byte[])localObject1, 8, localObject1.length, (byte)-67);
        Object localObject3 = NTLMEngineImpl.createDESKey((byte[])localObject1, 0);
        localObject1 = NTLMEngineImpl.createDESKey((byte[])localObject1, 7);
        arrayOfByte = new byte[8];
        System.arraycopy(localObject2, 0, arrayOfByte, 0, arrayOfByte.length);
        localObject2 = Cipher.getInstance("DES/ECB/NoPadding");
        ((Cipher)localObject2).init(1, (Key)localObject3);
        localObject2 = ((Cipher)localObject2).doFinal(arrayOfByte);
        localObject3 = Cipher.getInstance("DES/ECB/NoPadding");
        ((Cipher)localObject3).init(1, (Key)localObject1);
        localObject1 = ((Cipher)localObject3).doFinal(arrayOfByte);
        lanManagerSessionKey = new byte[16];
        System.arraycopy(localObject2, 0, lanManagerSessionKey, 0, localObject2.length);
        System.arraycopy(localObject1, 0, lanManagerSessionKey, localObject2.length, localObject1.length);
        return lanManagerSessionKey;
      }
      catch (Exception localException)
      {
        throw new NTLMEngineException(localException.getMessage(), localException);
      }
    }
    
    public byte[] getNTLM2SessionResponse()
      throws NTLMEngineException
    {
      if (ntlm2SessionResponse == null) {
        ntlm2SessionResponse = NTLMEngineImpl.ntlm2SessionResponse(getNTLMHash(), challenge, getClientChallenge());
      }
      return ntlm2SessionResponse;
    }
    
    public byte[] getNTLM2SessionResponseUserSessionKey()
      throws NTLMEngineException
    {
      if (ntlm2SessionResponseUserSessionKey == null)
      {
        byte[] arrayOfByte1 = getNTLMUserSessionKey();
        byte[] arrayOfByte2 = getLM2SessionResponse();
        byte[] arrayOfByte3 = new byte[challenge.length + arrayOfByte2.length];
        System.arraycopy(challenge, 0, arrayOfByte3, 0, challenge.length);
        System.arraycopy(arrayOfByte2, 0, arrayOfByte3, challenge.length, arrayOfByte2.length);
        ntlm2SessionResponseUserSessionKey = NTLMEngineImpl.hmacMD5(arrayOfByte3, arrayOfByte1);
      }
      return ntlm2SessionResponseUserSessionKey;
    }
    
    public byte[] getNTLMHash()
      throws NTLMEngineException
    {
      if (ntlmHash == null) {
        ntlmHash = NTLMEngineImpl.ntlmHash(password);
      }
      return ntlmHash;
    }
    
    public byte[] getNTLMResponse()
      throws NTLMEngineException
    {
      if (ntlmResponse == null) {
        ntlmResponse = NTLMEngineImpl.lmResponse(getNTLMHash(), challenge);
      }
      return ntlmResponse;
    }
    
    public byte[] getNTLMUserSessionKey()
      throws NTLMEngineException
    {
      if (ntlmUserSessionKey == null)
      {
        byte[] arrayOfByte = getNTLMHash();
        NTLMEngineImpl.MD4 localMD4 = new NTLMEngineImpl.MD4();
        localMD4.update(arrayOfByte);
        ntlmUserSessionKey = localMD4.getOutput();
      }
      return ntlmUserSessionKey;
    }
    
    public byte[] getNTLMv2Blob()
      throws NTLMEngineException
    {
      if (ntlmv2Blob == null) {
        ntlmv2Blob = NTLMEngineImpl.createBlob(getClientChallenge2(), targetInformation, getTimestamp());
      }
      return ntlmv2Blob;
    }
    
    public byte[] getNTLMv2Hash()
      throws NTLMEngineException
    {
      if (ntlmv2Hash == null) {
        ntlmv2Hash = NTLMEngineImpl.ntlmv2Hash(domain, user, getNTLMHash());
      }
      return ntlmv2Hash;
    }
    
    public byte[] getNTLMv2Response()
      throws NTLMEngineException
    {
      if (ntlmv2Response == null) {
        ntlmv2Response = NTLMEngineImpl.lmv2Response(getNTLMv2Hash(), challenge, getNTLMv2Blob());
      }
      return ntlmv2Response;
    }
    
    public byte[] getNTLMv2UserSessionKey()
      throws NTLMEngineException
    {
      if (ntlmv2UserSessionKey == null)
      {
        byte[] arrayOfByte1 = getNTLMv2Hash();
        byte[] arrayOfByte2 = new byte[16];
        System.arraycopy(getNTLMv2Response(), 0, arrayOfByte2, 0, 16);
        ntlmv2UserSessionKey = NTLMEngineImpl.hmacMD5(arrayOfByte2, arrayOfByte1);
      }
      return ntlmv2UserSessionKey;
    }
    
    public byte[] getSecondaryKey()
      throws NTLMEngineException
    {
      if (secondaryKey == null) {
        secondaryKey = NTLMEngineImpl.access$100();
      }
      return secondaryKey;
    }
    
    public byte[] getTimestamp()
    {
      if (timestamp == null)
      {
        long l = (System.currentTimeMillis() + 11644473600000L) * 10000L;
        timestamp = new byte[8];
        int i = 0;
        while (i < 8)
        {
          timestamp[i] = ((byte)(int)l);
          l >>>= 8;
          i += 1;
        }
      }
      return timestamp;
    }
  }
  
  static class HMACMD5
  {
    protected byte[] ipad;
    protected MessageDigest md5;
    protected byte[] opad;
    
    HMACMD5(byte[] paramArrayOfByte)
      throws NTLMEngineException
    {
      int k;
      try
      {
        md5 = MessageDigest.getInstance("MD5");
        ipad = new byte[64];
        opad = new byte[64];
        int i = paramArrayOfByte.length;
        byte[] arrayOfByte = paramArrayOfByte;
        int j = i;
        if (i > 64)
        {
          md5.update(paramArrayOfByte);
          arrayOfByte = md5.digest();
          j = arrayOfByte.length;
        }
        i = 0;
        for (;;)
        {
          k = i;
          if (i >= j) {
            break;
          }
          ipad[i] = ((byte)(arrayOfByte[i] ^ 0x36));
          opad[i] = ((byte)(arrayOfByte[i] ^ 0x5C));
          i += 1;
        }
        if (k >= 64) {
          break label175;
        }
      }
      catch (Exception paramArrayOfByte)
      {
        throw new NTLMEngineException("Error getting md5 message digest implementation: " + paramArrayOfByte.getMessage(), paramArrayOfByte);
      }
      for (;;)
      {
        ipad[k] = 54;
        opad[k] = 92;
        k += 1;
      }
      label175:
      md5.reset();
      md5.update(ipad);
    }
    
    byte[] getOutput()
    {
      byte[] arrayOfByte = md5.digest();
      md5.update(opad);
      return md5.digest(arrayOfByte);
    }
    
    void update(byte[] paramArrayOfByte)
    {
      md5.update(paramArrayOfByte);
    }
    
    void update(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    {
      md5.update(paramArrayOfByte, paramInt1, paramInt2);
    }
  }
  
  static class MD4
  {
    protected int A = 1732584193;
    protected int B = -271733879;
    protected int C = -1732584194;
    protected int D = 271733878;
    protected long count = 0L;
    protected byte[] dataBuffer = new byte[64];
    
    MD4() {}
    
    byte[] getOutput()
    {
      int i = (int)(count & 0x3F);
      if (i < 56) {}
      for (i = 56 - i;; i = 120 - i)
      {
        arrayOfByte = new byte[i + 8];
        arrayOfByte[0] = Byte.MIN_VALUE;
        int j = 0;
        while (j < 8)
        {
          arrayOfByte[(i + j)] = ((byte)(int)(count * 8L >>> j * 8));
          j += 1;
        }
      }
      update(arrayOfByte);
      byte[] arrayOfByte = new byte[16];
      NTLMEngineImpl.writeULong(arrayOfByte, A, 0);
      NTLMEngineImpl.writeULong(arrayOfByte, B, 4);
      NTLMEngineImpl.writeULong(arrayOfByte, C, 8);
      NTLMEngineImpl.writeULong(arrayOfByte, D, 12);
      return arrayOfByte;
    }
    
    protected void processBuffer()
    {
      int[] arrayOfInt = new int[16];
      int i = 0;
      while (i < 16)
      {
        arrayOfInt[i] = ((dataBuffer[(i * 4)] & 0xFF) + ((dataBuffer[(i * 4 + 1)] & 0xFF) << 8) + ((dataBuffer[(i * 4 + 2)] & 0xFF) << 16) + ((dataBuffer[(i * 4 + 3)] & 0xFF) << 24));
        i += 1;
      }
      i = A;
      int j = B;
      int k = C;
      int m = D;
      round1(arrayOfInt);
      round2(arrayOfInt);
      round3(arrayOfInt);
      A += i;
      B += j;
      C += k;
      D += m;
    }
    
    protected void round1(int[] paramArrayOfInt)
    {
      A = NTLMEngineImpl.rotintlft(A + NTLMEngineImpl.F(B, C, D) + paramArrayOfInt[0], 3);
      D = NTLMEngineImpl.rotintlft(D + NTLMEngineImpl.F(A, B, C) + paramArrayOfInt[1], 7);
      C = NTLMEngineImpl.rotintlft(C + NTLMEngineImpl.F(D, A, B) + paramArrayOfInt[2], 11);
      B = NTLMEngineImpl.rotintlft(B + NTLMEngineImpl.F(C, D, A) + paramArrayOfInt[3], 19);
      A = NTLMEngineImpl.rotintlft(A + NTLMEngineImpl.F(B, C, D) + paramArrayOfInt[4], 3);
      D = NTLMEngineImpl.rotintlft(D + NTLMEngineImpl.F(A, B, C) + paramArrayOfInt[5], 7);
      C = NTLMEngineImpl.rotintlft(C + NTLMEngineImpl.F(D, A, B) + paramArrayOfInt[6], 11);
      B = NTLMEngineImpl.rotintlft(B + NTLMEngineImpl.F(C, D, A) + paramArrayOfInt[7], 19);
      A = NTLMEngineImpl.rotintlft(A + NTLMEngineImpl.F(B, C, D) + paramArrayOfInt[8], 3);
      D = NTLMEngineImpl.rotintlft(D + NTLMEngineImpl.F(A, B, C) + paramArrayOfInt[9], 7);
      C = NTLMEngineImpl.rotintlft(C + NTLMEngineImpl.F(D, A, B) + paramArrayOfInt[10], 11);
      B = NTLMEngineImpl.rotintlft(B + NTLMEngineImpl.F(C, D, A) + paramArrayOfInt[11], 19);
      A = NTLMEngineImpl.rotintlft(A + NTLMEngineImpl.F(B, C, D) + paramArrayOfInt[12], 3);
      D = NTLMEngineImpl.rotintlft(D + NTLMEngineImpl.F(A, B, C) + paramArrayOfInt[13], 7);
      C = NTLMEngineImpl.rotintlft(C + NTLMEngineImpl.F(D, A, B) + paramArrayOfInt[14], 11);
      B = NTLMEngineImpl.rotintlft(B + NTLMEngineImpl.F(C, D, A) + paramArrayOfInt[15], 19);
    }
    
    protected void round2(int[] paramArrayOfInt)
    {
      A = NTLMEngineImpl.rotintlft(A + NTLMEngineImpl.G(B, C, D) + paramArrayOfInt[0] + 1518500249, 3);
      D = NTLMEngineImpl.rotintlft(D + NTLMEngineImpl.G(A, B, C) + paramArrayOfInt[4] + 1518500249, 5);
      C = NTLMEngineImpl.rotintlft(C + NTLMEngineImpl.G(D, A, B) + paramArrayOfInt[8] + 1518500249, 9);
      B = NTLMEngineImpl.rotintlft(B + NTLMEngineImpl.G(C, D, A) + paramArrayOfInt[12] + 1518500249, 13);
      A = NTLMEngineImpl.rotintlft(A + NTLMEngineImpl.G(B, C, D) + paramArrayOfInt[1] + 1518500249, 3);
      D = NTLMEngineImpl.rotintlft(D + NTLMEngineImpl.G(A, B, C) + paramArrayOfInt[5] + 1518500249, 5);
      C = NTLMEngineImpl.rotintlft(C + NTLMEngineImpl.G(D, A, B) + paramArrayOfInt[9] + 1518500249, 9);
      B = NTLMEngineImpl.rotintlft(B + NTLMEngineImpl.G(C, D, A) + paramArrayOfInt[13] + 1518500249, 13);
      A = NTLMEngineImpl.rotintlft(A + NTLMEngineImpl.G(B, C, D) + paramArrayOfInt[2] + 1518500249, 3);
      D = NTLMEngineImpl.rotintlft(D + NTLMEngineImpl.G(A, B, C) + paramArrayOfInt[6] + 1518500249, 5);
      C = NTLMEngineImpl.rotintlft(C + NTLMEngineImpl.G(D, A, B) + paramArrayOfInt[10] + 1518500249, 9);
      B = NTLMEngineImpl.rotintlft(B + NTLMEngineImpl.G(C, D, A) + paramArrayOfInt[14] + 1518500249, 13);
      A = NTLMEngineImpl.rotintlft(A + NTLMEngineImpl.G(B, C, D) + paramArrayOfInt[3] + 1518500249, 3);
      D = NTLMEngineImpl.rotintlft(D + NTLMEngineImpl.G(A, B, C) + paramArrayOfInt[7] + 1518500249, 5);
      C = NTLMEngineImpl.rotintlft(C + NTLMEngineImpl.G(D, A, B) + paramArrayOfInt[11] + 1518500249, 9);
      B = NTLMEngineImpl.rotintlft(B + NTLMEngineImpl.G(C, D, A) + paramArrayOfInt[15] + 1518500249, 13);
    }
    
    protected void round3(int[] paramArrayOfInt)
    {
      A = NTLMEngineImpl.rotintlft(A + NTLMEngineImpl.H(B, C, D) + paramArrayOfInt[0] + 1859775393, 3);
      D = NTLMEngineImpl.rotintlft(D + NTLMEngineImpl.H(A, B, C) + paramArrayOfInt[8] + 1859775393, 9);
      C = NTLMEngineImpl.rotintlft(C + NTLMEngineImpl.H(D, A, B) + paramArrayOfInt[4] + 1859775393, 11);
      B = NTLMEngineImpl.rotintlft(B + NTLMEngineImpl.H(C, D, A) + paramArrayOfInt[12] + 1859775393, 15);
      A = NTLMEngineImpl.rotintlft(A + NTLMEngineImpl.H(B, C, D) + paramArrayOfInt[2] + 1859775393, 3);
      D = NTLMEngineImpl.rotintlft(D + NTLMEngineImpl.H(A, B, C) + paramArrayOfInt[10] + 1859775393, 9);
      C = NTLMEngineImpl.rotintlft(C + NTLMEngineImpl.H(D, A, B) + paramArrayOfInt[6] + 1859775393, 11);
      B = NTLMEngineImpl.rotintlft(B + NTLMEngineImpl.H(C, D, A) + paramArrayOfInt[14] + 1859775393, 15);
      A = NTLMEngineImpl.rotintlft(A + NTLMEngineImpl.H(B, C, D) + paramArrayOfInt[1] + 1859775393, 3);
      D = NTLMEngineImpl.rotintlft(D + NTLMEngineImpl.H(A, B, C) + paramArrayOfInt[9] + 1859775393, 9);
      C = NTLMEngineImpl.rotintlft(C + NTLMEngineImpl.H(D, A, B) + paramArrayOfInt[5] + 1859775393, 11);
      B = NTLMEngineImpl.rotintlft(B + NTLMEngineImpl.H(C, D, A) + paramArrayOfInt[13] + 1859775393, 15);
      A = NTLMEngineImpl.rotintlft(A + NTLMEngineImpl.H(B, C, D) + paramArrayOfInt[3] + 1859775393, 3);
      D = NTLMEngineImpl.rotintlft(D + NTLMEngineImpl.H(A, B, C) + paramArrayOfInt[11] + 1859775393, 9);
      C = NTLMEngineImpl.rotintlft(C + NTLMEngineImpl.H(D, A, B) + paramArrayOfInt[7] + 1859775393, 11);
      B = NTLMEngineImpl.rotintlft(B + NTLMEngineImpl.H(C, D, A) + paramArrayOfInt[15] + 1859775393, 15);
    }
    
    void update(byte[] paramArrayOfByte)
    {
      int j = (int)(count & 0x3F);
      int i = 0;
      int k;
      while (paramArrayOfByte.length - i + j >= dataBuffer.length)
      {
        k = dataBuffer.length - j;
        System.arraycopy(paramArrayOfByte, i, dataBuffer, j, k);
        count += k;
        j = 0;
        i += k;
        processBuffer();
      }
      if (i < paramArrayOfByte.length)
      {
        k = paramArrayOfByte.length - i;
        System.arraycopy(paramArrayOfByte, i, dataBuffer, j, k);
        count += k;
      }
    }
  }
  
  static class NTLMMessage
  {
    private int currentOutputPosition = 0;
    private byte[] messageContents = null;
    
    NTLMMessage() {}
    
    NTLMMessage(String paramString, int paramInt)
      throws NTLMEngineException
    {
      messageContents = Base64.decodeBase64(EncodingUtils.getBytes(paramString, "ASCII"));
      if (messageContents.length < NTLMEngineImpl.SIGNATURE.length) {
        throw new NTLMEngineException("NTLM message decoding error - packet too short");
      }
      int i = 0;
      while (i < NTLMEngineImpl.SIGNATURE.length)
      {
        if (messageContents[i] != NTLMEngineImpl.SIGNATURE[i]) {
          throw new NTLMEngineException("NTLM message expected - instead got unrecognized bytes");
        }
        i += 1;
      }
      i = readULong(NTLMEngineImpl.SIGNATURE.length);
      if (i != paramInt) {
        throw new NTLMEngineException("NTLM type " + Integer.toString(paramInt) + " message expected - instead got type " + Integer.toString(i));
      }
      currentOutputPosition = messageContents.length;
    }
    
    protected void addByte(byte paramByte)
    {
      messageContents[currentOutputPosition] = paramByte;
      currentOutputPosition += 1;
    }
    
    protected void addBytes(byte[] paramArrayOfByte)
    {
      if (paramArrayOfByte == null) {}
      for (;;)
      {
        return;
        int k = paramArrayOfByte.length;
        int j = 0;
        while (j < k)
        {
          int i = paramArrayOfByte[j];
          messageContents[currentOutputPosition] = i;
          currentOutputPosition += 1;
          j += 1;
        }
      }
    }
    
    protected void addULong(int paramInt)
    {
      addByte((byte)(paramInt & 0xFF));
      addByte((byte)(paramInt >> 8 & 0xFF));
      addByte((byte)(paramInt >> 16 & 0xFF));
      addByte((byte)(paramInt >> 24 & 0xFF));
    }
    
    protected void addUShort(int paramInt)
    {
      addByte((byte)(paramInt & 0xFF));
      addByte((byte)(paramInt >> 8 & 0xFF));
    }
    
    protected int getMessageLength()
    {
      return currentOutputPosition;
    }
    
    protected int getPreambleLength()
    {
      return NTLMEngineImpl.SIGNATURE.length + 4;
    }
    
    String getResponse()
    {
      byte[] arrayOfByte;
      if (messageContents.length > currentOutputPosition)
      {
        arrayOfByte = new byte[currentOutputPosition];
        System.arraycopy(messageContents, 0, arrayOfByte, 0, currentOutputPosition);
      }
      for (;;)
      {
        return EncodingUtils.getAsciiString(Base64.encodeBase64(arrayOfByte));
        arrayOfByte = messageContents;
      }
    }
    
    protected void prepareResponse(int paramInt1, int paramInt2)
    {
      messageContents = new byte[paramInt1];
      currentOutputPosition = 0;
      addBytes(NTLMEngineImpl.SIGNATURE);
      addULong(paramInt2);
    }
    
    protected byte readByte(int paramInt)
      throws NTLMEngineException
    {
      if (messageContents.length < paramInt + 1) {
        throw new NTLMEngineException("NTLM: Message too short");
      }
      return messageContents[paramInt];
    }
    
    protected void readBytes(byte[] paramArrayOfByte, int paramInt)
      throws NTLMEngineException
    {
      if (messageContents.length < paramArrayOfByte.length + paramInt) {
        throw new NTLMEngineException("NTLM: Message too short");
      }
      System.arraycopy(messageContents, paramInt, paramArrayOfByte, 0, paramArrayOfByte.length);
    }
    
    protected byte[] readSecurityBuffer(int paramInt)
      throws NTLMEngineException
    {
      return NTLMEngineImpl.readSecurityBuffer(messageContents, paramInt);
    }
    
    protected int readULong(int paramInt)
      throws NTLMEngineException
    {
      return NTLMEngineImpl.readULong(messageContents, paramInt);
    }
    
    protected int readUShort(int paramInt)
      throws NTLMEngineException
    {
      return NTLMEngineImpl.readUShort(messageContents, paramInt);
    }
  }
  
  static class Type1Message
    extends NTLMEngineImpl.NTLMMessage
  {
    protected byte[] domainBytes;
    protected byte[] hostBytes;
    
    /* Error */
    Type1Message(String paramString1, String paramString2)
      throws NTLMEngineException
    {
      // Byte code:
      //   0: aconst_null
      //   1: astore_3
      //   2: aload_0
      //   3: invokespecial 19	org/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage:<init>	()V
      //   6: aload_2
      //   7: invokestatic 23	org/apache/http/impl/auth/NTLMEngineImpl:access$1400	(Ljava/lang/String;)Ljava/lang/String;
      //   10: astore 4
      //   12: aload_1
      //   13: invokestatic 26	org/apache/http/impl/auth/NTLMEngineImpl:access$1500	(Ljava/lang/String;)Ljava/lang/String;
      //   16: astore_2
      //   17: aload 4
      //   19: ifnull +41 -> 60
      //   22: aload 4
      //   24: ldc 28
      //   26: invokevirtual 34	java/lang/String:getBytes	(Ljava/lang/String;)[B
      //   29: astore_1
      //   30: aload_0
      //   31: aload_1
      //   32: putfield 36	org/apache/http/impl/auth/NTLMEngineImpl$Type1Message:hostBytes	[B
      //   35: aload_3
      //   36: astore_1
      //   37: aload_2
      //   38: ifnull +16 -> 54
      //   41: aload_2
      //   42: getstatic 42	java/util/Locale:US	Ljava/util/Locale;
      //   45: invokevirtual 46	java/lang/String:toUpperCase	(Ljava/util/Locale;)Ljava/lang/String;
      //   48: ldc 28
      //   50: invokevirtual 34	java/lang/String:getBytes	(Ljava/lang/String;)[B
      //   53: astore_1
      //   54: aload_0
      //   55: aload_1
      //   56: putfield 48	org/apache/http/impl/auth/NTLMEngineImpl$Type1Message:domainBytes	[B
      //   59: return
      //   60: aconst_null
      //   61: astore_1
      //   62: goto -32 -> 30
      //   65: astore_1
      //   66: new 14	org/apache/http/impl/auth/NTLMEngineException
      //   69: dup
      //   70: new 50	java/lang/StringBuilder
      //   73: dup
      //   74: invokespecial 51	java/lang/StringBuilder:<init>	()V
      //   77: ldc 53
      //   79: invokevirtual 57	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   82: aload_1
      //   83: invokevirtual 61	java/io/UnsupportedEncodingException:getMessage	()Ljava/lang/String;
      //   86: invokevirtual 57	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   89: invokevirtual 64	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   92: aload_1
      //   93: invokespecial 67	org/apache/http/impl/auth/NTLMEngineException:<init>	(Ljava/lang/String;Ljava/lang/Throwable;)V
      //   96: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	97	0	this	Type1Message
      //   0	97	1	paramString1	String
      //   0	97	2	paramString2	String
      //   1	35	3	localObject	Object
      //   10	13	4	str	String
      // Exception table:
      //   from	to	target	type
      //   6	17	65	java/io/UnsupportedEncodingException
      //   22	30	65	java/io/UnsupportedEncodingException
      //   30	35	65	java/io/UnsupportedEncodingException
      //   41	54	65	java/io/UnsupportedEncodingException
      //   54	59	65	java/io/UnsupportedEncodingException
    }
    
    String getResponse()
    {
      prepareResponse(40, 1);
      addULong(-1576500735);
      addUShort(0);
      addUShort(0);
      addULong(40);
      addUShort(0);
      addUShort(0);
      addULong(40);
      addUShort(261);
      addULong(2600);
      addUShort(3840);
      return super.getResponse();
    }
  }
  
  static class Type2Message
    extends NTLMEngineImpl.NTLMMessage
  {
    protected byte[] challenge = new byte[8];
    protected int flags;
    protected String target;
    protected byte[] targetInfo;
    
    Type2Message(String paramString)
      throws NTLMEngineException
    {
      super(2);
      readBytes(challenge, 24);
      flags = readULong(20);
      if ((flags & 0x1) == 0) {
        throw new NTLMEngineException("NTLM type 2 message has flags that make no sense: " + Integer.toString(flags));
      }
      target = null;
      if (getMessageLength() >= 20)
      {
        paramString = readSecurityBuffer(12);
        if (paramString.length == 0) {}
      }
      try
      {
        target = new String(paramString, "UnicodeLittleUnmarked");
        targetInfo = null;
        if (getMessageLength() >= 48)
        {
          paramString = readSecurityBuffer(40);
          if (paramString.length != 0) {
            targetInfo = paramString;
          }
        }
        return;
      }
      catch (UnsupportedEncodingException paramString)
      {
        throw new NTLMEngineException(paramString.getMessage(), paramString);
      }
    }
    
    byte[] getChallenge()
    {
      return challenge;
    }
    
    int getFlags()
    {
      return flags;
    }
    
    String getTarget()
    {
      return target;
    }
    
    byte[] getTargetInfo()
    {
      return targetInfo;
    }
  }
  
  static class Type3Message
    extends NTLMEngineImpl.NTLMMessage
  {
    protected byte[] domainBytes;
    protected byte[] hostBytes;
    protected byte[] lmResp;
    protected byte[] ntResp;
    protected byte[] sessionKey;
    protected int type2Flags;
    protected byte[] userBytes;
    
    /* Error */
    Type3Message(String paramString1, String paramString2, String paramString3, String paramString4, byte[] paramArrayOfByte1, int paramInt, String paramString5, byte[] paramArrayOfByte2)
      throws NTLMEngineException
    {
      // Byte code:
      //   0: aload_0
      //   1: invokespecial 25	org/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage:<init>	()V
      //   4: aload_0
      //   5: iload 6
      //   7: putfield 27	org/apache/http/impl/auth/NTLMEngineImpl$Type3Message:type2Flags	I
      //   10: aload_2
      //   11: invokestatic 31	org/apache/http/impl/auth/NTLMEngineImpl:access$1400	(Ljava/lang/String;)Ljava/lang/String;
      //   14: astore 9
      //   16: aload_1
      //   17: invokestatic 34	org/apache/http/impl/auth/NTLMEngineImpl:access$1500	(Ljava/lang/String;)Ljava/lang/String;
      //   20: astore_2
      //   21: new 36	org/apache/http/impl/auth/NTLMEngineImpl$CipherGen
      //   24: dup
      //   25: aload_2
      //   26: aload_3
      //   27: aload 4
      //   29: aload 5
      //   31: aload 7
      //   33: aload 8
      //   35: invokespecial 39	org/apache/http/impl/auth/NTLMEngineImpl$CipherGen:<init>	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BLjava/lang/String;[B)V
      //   38: astore 4
      //   40: ldc 40
      //   42: iload 6
      //   44: iand
      //   45: ifeq +135 -> 180
      //   48: aload 8
      //   50: ifnull +130 -> 180
      //   53: aload 7
      //   55: ifnull +125 -> 180
      //   58: aload_0
      //   59: aload 4
      //   61: invokevirtual 44	org/apache/http/impl/auth/NTLMEngineImpl$CipherGen:getNTLMv2Response	()[B
      //   64: putfield 46	org/apache/http/impl/auth/NTLMEngineImpl$Type3Message:ntResp	[B
      //   67: aload_0
      //   68: aload 4
      //   70: invokevirtual 49	org/apache/http/impl/auth/NTLMEngineImpl$CipherGen:getLMv2Response	()[B
      //   73: putfield 51	org/apache/http/impl/auth/NTLMEngineImpl$Type3Message:lmResp	[B
      //   76: iload 6
      //   78: sipush 128
      //   81: iand
      //   82: ifeq +89 -> 171
      //   85: aload 4
      //   87: invokevirtual 54	org/apache/http/impl/auth/NTLMEngineImpl$CipherGen:getLanManagerSessionKey	()[B
      //   90: astore_1
      //   91: iload 6
      //   93: bipush 16
      //   95: iand
      //   96: ifeq +234 -> 330
      //   99: ldc 55
      //   101: iload 6
      //   103: iand
      //   104: ifeq +218 -> 322
      //   107: aload_0
      //   108: aload 4
      //   110: invokevirtual 58	org/apache/http/impl/auth/NTLMEngineImpl$CipherGen:getSecondaryKey	()[B
      //   113: aload_1
      //   114: invokestatic 62	org/apache/http/impl/auth/NTLMEngineImpl:RC4	([B[B)[B
      //   117: putfield 64	org/apache/http/impl/auth/NTLMEngineImpl$Type3Message:sessionKey	[B
      //   120: aload 9
      //   122: ifnull +216 -> 338
      //   125: aload 9
      //   127: ldc 66
      //   129: invokevirtual 72	java/lang/String:getBytes	(Ljava/lang/String;)[B
      //   132: astore_1
      //   133: aload_0
      //   134: aload_1
      //   135: putfield 74	org/apache/http/impl/auth/NTLMEngineImpl$Type3Message:hostBytes	[B
      //   138: aload_2
      //   139: ifnull +204 -> 343
      //   142: aload_2
      //   143: getstatic 80	java/util/Locale:US	Ljava/util/Locale;
      //   146: invokevirtual 84	java/lang/String:toUpperCase	(Ljava/util/Locale;)Ljava/lang/String;
      //   149: ldc 66
      //   151: invokevirtual 72	java/lang/String:getBytes	(Ljava/lang/String;)[B
      //   154: astore_1
      //   155: aload_0
      //   156: aload_1
      //   157: putfield 86	org/apache/http/impl/auth/NTLMEngineImpl$Type3Message:domainBytes	[B
      //   160: aload_0
      //   161: aload_3
      //   162: ldc 66
      //   164: invokevirtual 72	java/lang/String:getBytes	(Ljava/lang/String;)[B
      //   167: putfield 88	org/apache/http/impl/auth/NTLMEngineImpl$Type3Message:userBytes	[B
      //   170: return
      //   171: aload 4
      //   173: invokevirtual 91	org/apache/http/impl/auth/NTLMEngineImpl$CipherGen:getNTLMv2UserSessionKey	()[B
      //   176: astore_1
      //   177: goto -86 -> 91
      //   180: ldc 92
      //   182: iload 6
      //   184: iand
      //   185: ifeq +48 -> 233
      //   188: aload_0
      //   189: aload 4
      //   191: invokevirtual 95	org/apache/http/impl/auth/NTLMEngineImpl$CipherGen:getNTLM2SessionResponse	()[B
      //   194: putfield 46	org/apache/http/impl/auth/NTLMEngineImpl$Type3Message:ntResp	[B
      //   197: aload_0
      //   198: aload 4
      //   200: invokevirtual 98	org/apache/http/impl/auth/NTLMEngineImpl$CipherGen:getLM2SessionResponse	()[B
      //   203: putfield 51	org/apache/http/impl/auth/NTLMEngineImpl$Type3Message:lmResp	[B
      //   206: iload 6
      //   208: sipush 128
      //   211: iand
      //   212: ifeq +12 -> 224
      //   215: aload 4
      //   217: invokevirtual 54	org/apache/http/impl/auth/NTLMEngineImpl$CipherGen:getLanManagerSessionKey	()[B
      //   220: astore_1
      //   221: goto -130 -> 91
      //   224: aload 4
      //   226: invokevirtual 101	org/apache/http/impl/auth/NTLMEngineImpl$CipherGen:getNTLM2SessionResponseUserSessionKey	()[B
      //   229: astore_1
      //   230: goto -139 -> 91
      //   233: aload_0
      //   234: aload 4
      //   236: invokevirtual 104	org/apache/http/impl/auth/NTLMEngineImpl$CipherGen:getNTLMResponse	()[B
      //   239: putfield 46	org/apache/http/impl/auth/NTLMEngineImpl$Type3Message:ntResp	[B
      //   242: aload_0
      //   243: aload 4
      //   245: invokevirtual 107	org/apache/http/impl/auth/NTLMEngineImpl$CipherGen:getLMResponse	()[B
      //   248: putfield 51	org/apache/http/impl/auth/NTLMEngineImpl$Type3Message:lmResp	[B
      //   251: iload 6
      //   253: sipush 128
      //   256: iand
      //   257: ifeq +12 -> 269
      //   260: aload 4
      //   262: invokevirtual 54	org/apache/http/impl/auth/NTLMEngineImpl$CipherGen:getLanManagerSessionKey	()[B
      //   265: astore_1
      //   266: goto -175 -> 91
      //   269: aload 4
      //   271: invokevirtual 110	org/apache/http/impl/auth/NTLMEngineImpl$CipherGen:getNTLMUserSessionKey	()[B
      //   274: astore_1
      //   275: goto -184 -> 91
      //   278: astore_1
      //   279: aload_0
      //   280: iconst_0
      //   281: newarray byte
      //   283: putfield 46	org/apache/http/impl/auth/NTLMEngineImpl$Type3Message:ntResp	[B
      //   286: aload_0
      //   287: aload 4
      //   289: invokevirtual 107	org/apache/http/impl/auth/NTLMEngineImpl$CipherGen:getLMResponse	()[B
      //   292: putfield 51	org/apache/http/impl/auth/NTLMEngineImpl$Type3Message:lmResp	[B
      //   295: iload 6
      //   297: sipush 128
      //   300: iand
      //   301: ifeq +12 -> 313
      //   304: aload 4
      //   306: invokevirtual 54	org/apache/http/impl/auth/NTLMEngineImpl$CipherGen:getLanManagerSessionKey	()[B
      //   309: astore_1
      //   310: goto -219 -> 91
      //   313: aload 4
      //   315: invokevirtual 113	org/apache/http/impl/auth/NTLMEngineImpl$CipherGen:getLMUserSessionKey	()[B
      //   318: astore_1
      //   319: goto -228 -> 91
      //   322: aload_0
      //   323: aload_1
      //   324: putfield 64	org/apache/http/impl/auth/NTLMEngineImpl$Type3Message:sessionKey	[B
      //   327: goto -207 -> 120
      //   330: aload_0
      //   331: aconst_null
      //   332: putfield 64	org/apache/http/impl/auth/NTLMEngineImpl$Type3Message:sessionKey	[B
      //   335: goto -215 -> 120
      //   338: aconst_null
      //   339: astore_1
      //   340: goto -207 -> 133
      //   343: aconst_null
      //   344: astore_1
      //   345: goto -190 -> 155
      //   348: astore_1
      //   349: new 20	org/apache/http/impl/auth/NTLMEngineException
      //   352: dup
      //   353: new 115	java/lang/StringBuilder
      //   356: dup
      //   357: invokespecial 116	java/lang/StringBuilder:<init>	()V
      //   360: ldc 118
      //   362: invokevirtual 122	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   365: aload_1
      //   366: invokevirtual 126	java/io/UnsupportedEncodingException:getMessage	()Ljava/lang/String;
      //   369: invokevirtual 122	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   372: invokevirtual 129	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   375: aload_1
      //   376: invokespecial 132	org/apache/http/impl/auth/NTLMEngineException:<init>	(Ljava/lang/String;Ljava/lang/Throwable;)V
      //   379: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	380	0	this	Type3Message
      //   0	380	1	paramString1	String
      //   0	380	2	paramString2	String
      //   0	380	3	paramString3	String
      //   0	380	4	paramString4	String
      //   0	380	5	paramArrayOfByte1	byte[]
      //   0	380	6	paramInt	int
      //   0	380	7	paramString5	String
      //   0	380	8	paramArrayOfByte2	byte[]
      //   14	112	9	str	String
      // Exception table:
      //   from	to	target	type
      //   58	76	278	org/apache/http/impl/auth/NTLMEngineException
      //   85	91	278	org/apache/http/impl/auth/NTLMEngineException
      //   171	177	278	org/apache/http/impl/auth/NTLMEngineException
      //   188	206	278	org/apache/http/impl/auth/NTLMEngineException
      //   215	221	278	org/apache/http/impl/auth/NTLMEngineException
      //   224	230	278	org/apache/http/impl/auth/NTLMEngineException
      //   233	251	278	org/apache/http/impl/auth/NTLMEngineException
      //   260	266	278	org/apache/http/impl/auth/NTLMEngineException
      //   269	275	278	org/apache/http/impl/auth/NTLMEngineException
      //   125	133	348	java/io/UnsupportedEncodingException
      //   133	138	348	java/io/UnsupportedEncodingException
      //   142	155	348	java/io/UnsupportedEncodingException
      //   155	170	348	java/io/UnsupportedEncodingException
    }
    
    String getResponse()
    {
      int m = ntResp.length;
      int n = lmResp.length;
      int i;
      int j;
      label40:
      int i1;
      if (domainBytes != null)
      {
        i = domainBytes.length;
        if (hostBytes == null) {
          break label392;
        }
        j = hostBytes.length;
        i1 = userBytes.length;
        if (sessionKey == null) {
          break label397;
        }
      }
      label392:
      label397:
      for (int k = sessionKey.length;; k = 0)
      {
        int i2 = n + 72;
        int i3 = i2 + m;
        int i4 = i3 + i;
        int i5 = i4 + i1;
        int i6 = i5 + j;
        prepareResponse(i6 + k, 3);
        addUShort(n);
        addUShort(n);
        addULong(72);
        addUShort(m);
        addUShort(m);
        addULong(i2);
        addUShort(i);
        addUShort(i);
        addULong(i3);
        addUShort(i1);
        addUShort(i1);
        addULong(i4);
        addUShort(j);
        addUShort(j);
        addULong(i5);
        addUShort(k);
        addUShort(k);
        addULong(i6);
        addULong(type2Flags & 0x80 | type2Flags & 0x200 | type2Flags & 0x80000 | 0x2000000 | type2Flags & 0x8000 | type2Flags & 0x20 | type2Flags & 0x10 | type2Flags & 0x20000000 | type2Flags & 0x80000000 | type2Flags & 0x40000000 | type2Flags & 0x800000 | type2Flags & 0x1 | type2Flags & 0x4);
        addUShort(261);
        addULong(2600);
        addUShort(3840);
        addBytes(lmResp);
        addBytes(ntResp);
        addBytes(domainBytes);
        addBytes(userBytes);
        addBytes(hostBytes);
        if (sessionKey != null) {
          addBytes(sessionKey);
        }
        return super.getResponse();
        i = 0;
        break;
        j = 0;
        break label40;
      }
    }
  }
}
