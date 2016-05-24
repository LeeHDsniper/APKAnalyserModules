package com.adobe.creativesdk.aviary.internal.headless.filters;

import android.content.Context;
import android.graphics.Bitmap;
import android.os.Build.VERSION;
import com.adobe.creativesdk.aviary.internal.headless.AdobeImageInitializationException;
import com.adobe.creativesdk.aviary.internal.headless.moa.JSONWriter;
import com.adobe.creativesdk.aviary.internal.headless.moa.Moa;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionFactory;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionList;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaMetadata;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaResult;
import org.json.JSONException;

public final class NativeFilterProxy
{
  private static boolean mInitialized = false;
  
  private NativeFilterProxy() {}
  
  public static String encodeActions(MoaActionList paramMoaActionList)
    throws JSONException
  {
    MoaMetadata localMoaMetadata = MoaActionFactory.metadata();
    localMoaMetadata.setImageSize(1, 1);
    return JSONWriter.encode(paramMoaActionList, localMoaMetadata);
  }
  
  public static void init(Context paramContext)
    throws AdobeImageInitializationException
  {
    try
    {
      if (!mInitialized)
      {
        Moa.init(paramContext, paramContext.getPackageName(), Build.VERSION.SDK_INT);
        mInitialized = true;
      }
      return;
    }
    finally
    {
      paramContext = finally;
      throw paramContext;
    }
  }
  
  public static MoaResult prepareActions(MoaActionList paramMoaActionList, Bitmap paramBitmap1, Bitmap paramBitmap2, int paramInt1, int paramInt2)
    throws JSONException
  {
    Object localObject = MoaActionFactory.metadata();
    ((MoaMetadata)localObject).setImageSize(paramInt1, paramInt2);
    try
    {
      paramMoaActionList = JSONWriter.encode(paramMoaActionList, (MoaMetadata)localObject);
      localObject = new MoaResult();
      if (paramBitmap2 != null) {
        outputBitmap = paramBitmap2;
      }
      inputString = paramMoaActionList;
      outputString = "";
      inputBitmap = paramBitmap1;
      return localObject;
    }
    catch (JSONException paramMoaActionList)
    {
      paramMoaActionList.printStackTrace();
      throw paramMoaActionList;
    }
  }
}
