package com.adobe.creativesdk.foundation.internal.storage.controllers;

import com.adobe.creativesdk.foundation.internal.common.AdobeCommonLearnedSettings;

public class AdobeUXAssetViewerPreferences
{
  private static String _appIdentifierKey = "177FCAA1-70EA-4FD7-B016-19D56F387C64";
  
  static String getFileProvideAuthority()
  {
    try
    {
      String str = AdobeCommonLearnedSettings.getFileProvideAuthority();
      return str;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  /* Error */
  static boolean isMenuEnabled()
  {
    // Byte code:
    //   0: ldc 2
    //   2: monitorenter
    //   3: invokestatic 19	com/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings:getFileProvideAuthority	()Ljava/lang/String;
    //   6: astore_1
    //   7: aload_1
    //   8: ifnull +10 -> 18
    //   11: iconst_1
    //   12: istore_0
    //   13: ldc 2
    //   15: monitorexit
    //   16: iload_0
    //   17: ireturn
    //   18: iconst_0
    //   19: istore_0
    //   20: goto -7 -> 13
    //   23: astore_1
    //   24: ldc 2
    //   26: monitorexit
    //   27: aload_1
    //   28: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   12	8	0	bool	boolean
    //   6	2	1	str	String
    //   23	5	1	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   3	7	23	finally
  }
}
