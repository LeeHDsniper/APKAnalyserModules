package com.google.zxing.qrcode.encoder;

import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import com.google.zxing.qrcode.decoder.Mode;
import com.google.zxing.qrcode.decoder.Version;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public final class QRCode
{
  public static final int a = 8;
  private ErrorCorrectionLevel jdField_a_of_type_ComGoogleZxingQrcodeDecoderErrorCorrectionLevel;
  private Mode jdField_a_of_type_ComGoogleZxingQrcodeDecoderMode;
  private Version jdField_a_of_type_ComGoogleZxingQrcodeDecoderVersion;
  private ByteMatrix jdField_a_of_type_ComGoogleZxingQrcodeEncoderByteMatrix;
  private int b;
  
  public QRCode()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    b = -1;
  }
  
  public static boolean a(int paramInt)
  {
    return (paramInt >= 0) && (paramInt < 8);
  }
  
  public int a()
  {
    return b;
  }
  
  public ErrorCorrectionLevel a()
  {
    return jdField_a_of_type_ComGoogleZxingQrcodeDecoderErrorCorrectionLevel;
  }
  
  public Mode a()
  {
    return jdField_a_of_type_ComGoogleZxingQrcodeDecoderMode;
  }
  
  public Version a()
  {
    return jdField_a_of_type_ComGoogleZxingQrcodeDecoderVersion;
  }
  
  public ByteMatrix a()
  {
    return jdField_a_of_type_ComGoogleZxingQrcodeEncoderByteMatrix;
  }
  
  public void a(int paramInt)
  {
    b = paramInt;
  }
  
  public void a(ErrorCorrectionLevel paramErrorCorrectionLevel)
  {
    jdField_a_of_type_ComGoogleZxingQrcodeDecoderErrorCorrectionLevel = paramErrorCorrectionLevel;
  }
  
  public void a(Mode paramMode)
  {
    jdField_a_of_type_ComGoogleZxingQrcodeDecoderMode = paramMode;
  }
  
  public void a(Version paramVersion)
  {
    jdField_a_of_type_ComGoogleZxingQrcodeDecoderVersion = paramVersion;
  }
  
  public void a(ByteMatrix paramByteMatrix)
  {
    jdField_a_of_type_ComGoogleZxingQrcodeEncoderByteMatrix = paramByteMatrix;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder(200);
    localStringBuilder.append("<<\n");
    localStringBuilder.append(" mode: ");
    localStringBuilder.append(jdField_a_of_type_ComGoogleZxingQrcodeDecoderMode);
    localStringBuilder.append("\n ecLevel: ");
    localStringBuilder.append(jdField_a_of_type_ComGoogleZxingQrcodeDecoderErrorCorrectionLevel);
    localStringBuilder.append("\n version: ");
    localStringBuilder.append(jdField_a_of_type_ComGoogleZxingQrcodeDecoderVersion);
    localStringBuilder.append("\n maskPattern: ");
    localStringBuilder.append(b);
    if (jdField_a_of_type_ComGoogleZxingQrcodeEncoderByteMatrix == null) {
      localStringBuilder.append("\n matrix: null\n");
    }
    for (;;)
    {
      localStringBuilder.append(">>\n");
      return localStringBuilder.toString();
      localStringBuilder.append("\n matrix:\n");
      localStringBuilder.append(jdField_a_of_type_ComGoogleZxingQrcodeEncoderByteMatrix.toString());
    }
  }
}
