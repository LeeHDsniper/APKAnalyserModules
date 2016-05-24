package com.dumplingsandwich.pencilsketch.utils;

import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.Matrix;
import android.media.ExifInterface;
import android.net.Uri;
import android.os.Environment;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class BitmapUtils
{
  public static Bitmap decodeBitmapFile(Context paramContext, String paramString, int paramInt1, int paramInt2)
  {
    int k = necessaryRotation(paramString);
    paramContext = new BitmapFactory.Options();
    inJustDecodeBounds = true;
    BitmapFactory.decodeFile(paramString, paramContext);
    int j = 1;
    int i = j;
    if (outWidth >= outHeight)
    {
      i = j;
      if (outWidth > paramInt1) {
        i = outWidth / paramInt1;
      }
    }
    paramInt1 = i;
    if (outHeight > outWidth)
    {
      paramInt1 = i;
      if (outHeight > paramInt2) {
        paramInt1 = (int)Math.pow(2.0D, (int)Math.round(Math.log(paramInt2 / outHeight) / Math.log(0.5D)));
      }
    }
    paramContext = new BitmapFactory.Options();
    inSampleSize = paramInt1;
    paramContext = BitmapFactory.decodeFile(paramString, paramContext);
    paramString = new Matrix();
    paramString.postRotate(k);
    if (paramContext == null) {
      return null;
    }
    return Bitmap.createBitmap(paramContext, 0, 0, paramContext.getWidth(), paramContext.getHeight(), paramString, true);
  }
  
  public static Bitmap decodeBitmapStream(Context paramContext, Intent paramIntent, int paramInt1, int paramInt2)
  {
    BitmapFactory.Options localOptions = new BitmapFactory.Options();
    inJustDecodeBounds = true;
    try
    {
      InputStream localInputStream = paramContext.getContentResolver().openInputStream(paramIntent.getData());
      BitmapFactory.decodeStream(localInputStream, null, localOptions);
      localInputStream.close();
      int j = 1;
      int i = j;
      if (outWidth >= outHeight)
      {
        i = j;
        if (outWidth > paramInt1) {
          i = outWidth / paramInt1;
        }
      }
      paramInt1 = i;
      if (outHeight > outWidth)
      {
        paramInt1 = i;
        if (outHeight > paramInt2) {
          paramInt1 = (int)Math.pow(2.0D, (int)Math.round(Math.log(paramInt2 / outHeight) / Math.log(0.5D)));
        }
      }
      localOptions = new BitmapFactory.Options();
      inSampleSize = paramInt1;
      paramContext = paramContext.getContentResolver().openInputStream(paramIntent.getData());
      paramIntent = BitmapFactory.decodeStream(paramContext, null, localOptions);
      paramContext.close();
      return paramIntent;
    }
    catch (Exception paramContext) {}
    return null;
  }
  
  public static Bitmap decodeResource(Resources paramResources, int paramInt1, int paramInt2, int paramInt3)
  {
    BitmapFactory.Options localOptions = new BitmapFactory.Options();
    inJustDecodeBounds = true;
    BitmapFactory.decodeResource(paramResources, paramInt1, localOptions);
    int i = 1;
    int j = Math.max(paramInt2, paramInt3);
    if (outHeight <= paramInt3)
    {
      paramInt3 = i;
      if (outWidth <= paramInt2) {}
    }
    else
    {
      paramInt3 = (int)Math.pow(2.0D, (int)Math.round(Math.log(j / Math.max(outHeight, outWidth)) / Math.log(0.5D)));
    }
    localOptions = new BitmapFactory.Options();
    inSampleSize = paramInt3;
    return BitmapFactory.decodeResource(paramResources, paramInt1, localOptions);
  }
  
  public static int necessaryRotation(String paramString)
  {
    try
    {
      int i = new ExifInterface(paramString).getAttributeInt("Orientation", 1);
      switch (i)
      {
      case 4: 
      case 5: 
      case 7: 
      default: 
        return 0;
      case 8: 
        return 270;
      case 3: 
        return 180;
      }
      return 90;
    }
    catch (IOException paramString)
    {
      paramString.printStackTrace();
    }
    return 0;
  }
  
  /* Error */
  public static File saveImageOnPhone(Context paramContext, Bitmap paramBitmap, boolean paramBoolean)
  {
    // Byte code:
    //   0: new 137	java/io/File
    //   3: dup
    //   4: invokestatic 143	android/os/Environment:getExternalStorageDirectory	()Ljava/io/File;
    //   7: invokevirtual 147	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   10: ldc -107
    //   12: invokespecial 152	java/io/File:<init>	(Ljava/lang/String;Ljava/lang/String;)V
    //   15: astore_3
    //   16: aload_3
    //   17: invokevirtual 156	java/io/File:mkdir	()Z
    //   20: pop
    //   21: new 137	java/io/File
    //   24: dup
    //   25: aload_3
    //   26: new 158	java/lang/StringBuilder
    //   29: dup
    //   30: invokespecial 159	java/lang/StringBuilder:<init>	()V
    //   33: ldc -95
    //   35: invokevirtual 165	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   38: invokestatic 171	java/lang/System:currentTimeMillis	()J
    //   41: invokevirtual 174	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   44: ldc -80
    //   46: invokevirtual 165	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   49: invokevirtual 179	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   52: invokespecial 182	java/io/File:<init>	(Ljava/io/File;Ljava/lang/String;)V
    //   55: astore_3
    //   56: new 184	java/io/FileOutputStream
    //   59: dup
    //   60: aload_3
    //   61: invokespecial 187	java/io/FileOutputStream:<init>	(Ljava/io/File;)V
    //   64: astore 4
    //   66: aload_1
    //   67: getstatic 193	android/graphics/Bitmap$CompressFormat:JPEG	Landroid/graphics/Bitmap$CompressFormat;
    //   70: bipush 100
    //   72: aload 4
    //   74: invokevirtual 197	android/graphics/Bitmap:compress	(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    //   77: pop
    //   78: aload 4
    //   80: invokevirtual 202	java/io/OutputStream:flush	()V
    //   83: aload 4
    //   85: invokevirtual 203	java/io/OutputStream:close	()V
    //   88: iload_2
    //   89: ifeq +28 -> 117
    //   92: aload_0
    //   93: iconst_1
    //   94: anewarray 205	java/lang/String
    //   97: dup
    //   98: iconst_0
    //   99: aload_3
    //   100: invokevirtual 147	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   103: aastore
    //   104: iconst_1
    //   105: anewarray 205	java/lang/String
    //   108: dup
    //   109: iconst_0
    //   110: ldc -49
    //   112: aastore
    //   113: aconst_null
    //   114: invokestatic 213	android/media/MediaScannerConnection:scanFile	(Landroid/content/Context;[Ljava/lang/String;[Ljava/lang/String;Landroid/media/MediaScannerConnection$OnScanCompletedListener;)V
    //   117: aload_3
    //   118: areturn
    //   119: astore_0
    //   120: aload_0
    //   121: invokevirtual 214	java/io/FileNotFoundException:printStackTrace	()V
    //   124: aconst_null
    //   125: areturn
    //   126: astore_0
    //   127: aload_0
    //   128: invokevirtual 131	java/io/IOException:printStackTrace	()V
    //   131: aconst_null
    //   132: areturn
    //   133: astore_0
    //   134: goto -7 -> 127
    //   137: astore_0
    //   138: goto -18 -> 120
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	141	0	paramContext	Context
    //   0	141	1	paramBitmap	Bitmap
    //   0	141	2	paramBoolean	boolean
    //   15	103	3	localFile	File
    //   64	20	4	localFileOutputStream	FileOutputStream
    // Exception table:
    //   from	to	target	type
    //   56	66	119	java/io/FileNotFoundException
    //   56	66	126	java/io/IOException
    //   66	88	133	java/io/IOException
    //   92	117	133	java/io/IOException
    //   66	88	137	java/io/FileNotFoundException
    //   92	117	137	java/io/FileNotFoundException
  }
  
  public static Bitmap scaleBitmap(Bitmap paramBitmap, int paramInt1, int paramInt2)
  {
    Bitmap localBitmap = paramBitmap;
    if (paramBitmap != null)
    {
      if (paramBitmap.getWidth() <= paramBitmap.getHeight()) {
        break label61;
      }
      paramInt1 = Math.min((int)(paramInt2 * 0.6D), 870);
      localBitmap = paramBitmap;
      if (paramBitmap.getHeight() > paramInt1) {
        localBitmap = Bitmap.createScaledBitmap(paramBitmap, paramBitmap.getWidth() * paramInt1 / paramBitmap.getHeight(), paramInt1, true);
      }
    }
    label61:
    do
    {
      return localBitmap;
      paramInt1 = Math.min((int)(paramInt1 * 0.85D), 870);
      localBitmap = paramBitmap;
    } while (paramBitmap.getWidth() <= paramInt1);
    return Bitmap.createScaledBitmap(paramBitmap, paramInt1, paramBitmap.getHeight() * paramInt1 / paramBitmap.getWidth(), true);
  }
  
  public static File shareImage(Context paramContext, Bitmap paramBitmap)
  {
    File localFile = new File(Environment.getExternalStorageDirectory().getAbsolutePath(), "Pencil_Sketch");
    localFile.mkdir();
    localFile = new File(localFile, "pencil_sketch_" + System.currentTimeMillis() + ".jpg");
    try
    {
      FileOutputStream localFileOutputStream = new FileOutputStream(localFile);
      paramBitmap.compress(Bitmap.CompressFormat.JPEG, 100, localFileOutputStream);
      localFileOutputStream.flush();
      localFileOutputStream.close();
      paramBitmap = new Intent("android.intent.action.SEND");
      paramBitmap.setType("image/jpeg");
      paramBitmap.putExtra("android.intent.extra.STREAM", Uri.fromFile(localFile));
      paramBitmap.putExtra("android.intent.extra.SUBJECT", "Great Pic from Pencil Sketch");
      paramBitmap.putExtra("android.intent.extra.TEXT", "Pencil Sketch: https://play.google.com/store/apps/details?id=com.dumplingsandwich.pencilsketch");
      paramContext.startActivity(Intent.createChooser(paramBitmap, "Share Image"));
      return localFile;
    }
    catch (FileNotFoundException paramContext)
    {
      paramContext.printStackTrace();
      return null;
    }
    catch (IOException paramContext)
    {
      paramContext.printStackTrace();
    }
    return null;
  }
}
