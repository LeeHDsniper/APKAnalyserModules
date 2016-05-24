package com.behance.sdk.project.modules;

import android.graphics.Bitmap;
import com.behance.sdk.logger.ILogger;
import com.behance.sdk.logger.LoggerFactory;

public class CoverImage
{
  private static final ILogger logger = LoggerFactory.getLogger(CoverImage.class);
  private Bitmap coverImage;
  private ImageModule originalImage;
  
  public CoverImage(ImageModule paramImageModule, Bitmap paramBitmap)
  {
    originalImage = paramImageModule;
    coverImage = paramBitmap;
  }
  
  public Bitmap getBitMap()
  {
    return coverImage;
  }
  
  /* Error */
  public byte[] getByteArray()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 29	com/behance/sdk/project/modules/CoverImage:coverImage	Landroid/graphics/Bitmap;
    //   4: ifnull +90 -> 94
    //   7: aload_0
    //   8: getfield 29	com/behance/sdk/project/modules/CoverImage:coverImage	Landroid/graphics/Bitmap;
    //   11: sipush 404
    //   14: sipush 316
    //   17: iconst_0
    //   18: invokestatic 41	android/graphics/Bitmap:createScaledBitmap	(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;
    //   21: astore_3
    //   22: aconst_null
    //   23: astore_2
    //   24: new 43	java/io/ByteArrayOutputStream
    //   27: dup
    //   28: invokespecial 44	java/io/ByteArrayOutputStream:<init>	()V
    //   31: astore_1
    //   32: aload_3
    //   33: getstatic 50	android/graphics/Bitmap$CompressFormat:PNG	Landroid/graphics/Bitmap$CompressFormat;
    //   36: bipush 100
    //   38: aload_1
    //   39: invokevirtual 54	android/graphics/Bitmap:compress	(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    //   42: pop
    //   43: aload_1
    //   44: invokevirtual 57	java/io/ByteArrayOutputStream:toByteArray	()[B
    //   47: astore_2
    //   48: aload_1
    //   49: ifnull +7 -> 56
    //   52: aload_1
    //   53: invokevirtual 60	java/io/ByteArrayOutputStream:close	()V
    //   56: aload_2
    //   57: areturn
    //   58: astore_1
    //   59: getstatic 20	com/behance/sdk/project/modules/CoverImage:logger	Lcom/behance/sdk/logger/ILogger;
    //   62: aload_1
    //   63: invokeinterface 66 2 0
    //   68: aload_2
    //   69: areturn
    //   70: astore_1
    //   71: aload_2
    //   72: ifnull +7 -> 79
    //   75: aload_2
    //   76: invokevirtual 60	java/io/ByteArrayOutputStream:close	()V
    //   79: aload_1
    //   80: athrow
    //   81: astore_2
    //   82: getstatic 20	com/behance/sdk/project/modules/CoverImage:logger	Lcom/behance/sdk/logger/ILogger;
    //   85: aload_2
    //   86: invokeinterface 66 2 0
    //   91: goto -12 -> 79
    //   94: iconst_0
    //   95: newarray byte
    //   97: areturn
    //   98: astore_3
    //   99: aload_1
    //   100: astore_2
    //   101: aload_3
    //   102: astore_1
    //   103: goto -32 -> 71
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	106	0	this	CoverImage
    //   31	22	1	localByteArrayOutputStream	java.io.ByteArrayOutputStream
    //   58	5	1	localIOException1	java.io.IOException
    //   70	30	1	localObject1	Object
    //   102	1	1	localObject2	Object
    //   23	53	2	arrayOfByte	byte[]
    //   81	5	2	localIOException2	java.io.IOException
    //   100	1	2	localObject3	Object
    //   21	12	3	localBitmap	Bitmap
    //   98	4	3	localObject4	Object
    // Exception table:
    //   from	to	target	type
    //   52	56	58	java/io/IOException
    //   24	32	70	finally
    //   75	79	81	java/io/IOException
    //   32	48	98	finally
  }
  
  public String getName()
  {
    if (originalImage != null) {
      return originalImage.getName();
    }
    return "";
  }
  
  public ImageModule getOriginalImage()
  {
    return originalImage;
  }
  
  public void remove()
  {
    if (coverImage != null) {
      coverImage.recycle();
    }
  }
}
