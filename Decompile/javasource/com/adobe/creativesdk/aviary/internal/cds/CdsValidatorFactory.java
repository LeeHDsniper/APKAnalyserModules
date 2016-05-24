package com.adobe.creativesdk.aviary.internal.cds;

import android.content.Context;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import java.io.File;

public final class CdsValidatorFactory
{
  public static Validator create(Cds.ContentType paramContentType, Cds.PackType paramPackType)
  {
    switch (1.$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$Cds$ContentType[paramContentType.ordinal()])
    {
    default: 
      return null;
    case 1: 
      return new CdsPreviewValidator(paramPackType);
    }
    return new CdsContentValidator(paramPackType);
  }
  
  public static abstract class Validator
  {
    LoggerFactory.Logger logger = LoggerFactory.getLogger("AdobeImageCdsValidatorFactory");
    final Cds.PackType mPackType;
    
    public Validator(Cds.PackType paramPackType)
    {
      mPackType = paramPackType;
    }
    
    public abstract boolean validate(Context paramContext, long paramLong, File paramFile, boolean paramBoolean)
      throws AssertionError;
  }
}
