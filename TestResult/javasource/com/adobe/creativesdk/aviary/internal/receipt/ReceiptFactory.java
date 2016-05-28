package com.adobe.creativesdk.aviary.internal.receipt;

public final class ReceiptFactory
{
  private static IReceiptManager sInstance;
  
  /* Error */
  public static IReceiptManager getReceiptManager(android.content.Context paramContext)
  {
    // Byte code:
    //   0: getstatic 10	com/adobe/creativesdk/aviary/internal/receipt/ReceiptFactory:sInstance	Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;
    //   3: ifnonnull +32 -> 35
    //   6: ldc 12
    //   8: monitorenter
    //   9: getstatic 10	com/adobe/creativesdk/aviary/internal/receipt/ReceiptFactory:sInstance	Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;
    //   12: ifnonnull +20 -> 32
    //   15: ldc 12
    //   17: monitorenter
    //   18: new 12	com/adobe/creativesdk/aviary/internal/receipt/ReceiptManager
    //   21: dup
    //   22: aload_0
    //   23: invokespecial 16	com/adobe/creativesdk/aviary/internal/receipt/ReceiptManager:<init>	(Landroid/content/Context;)V
    //   26: putstatic 10	com/adobe/creativesdk/aviary/internal/receipt/ReceiptFactory:sInstance	Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;
    //   29: ldc 12
    //   31: monitorexit
    //   32: ldc 12
    //   34: monitorexit
    //   35: getstatic 10	com/adobe/creativesdk/aviary/internal/receipt/ReceiptFactory:sInstance	Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;
    //   38: areturn
    //   39: astore_0
    //   40: ldc 12
    //   42: monitorexit
    //   43: aload_0
    //   44: athrow
    //   45: astore_0
    //   46: ldc 12
    //   48: monitorexit
    //   49: aload_0
    //   50: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	51	0	paramContext	android.content.Context
    // Exception table:
    //   from	to	target	type
    //   18	32	39	finally
    //   40	43	39	finally
    //   9	18	45	finally
    //   32	35	45	finally
    //   43	45	45	finally
    //   46	49	45	finally
  }
}
