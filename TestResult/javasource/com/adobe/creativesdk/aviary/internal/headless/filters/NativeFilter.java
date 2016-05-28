package com.adobe.creativesdk.aviary.internal.headless.filters;

import android.graphics.Bitmap;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaAction;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionFactory;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionList;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaPointParameter;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaResult;
import org.json.JSONException;

public class NativeFilter
  implements INativeFilter
{
  public static final int SEED = (int)System.currentTimeMillis();
  protected MoaActionList mActions;
  protected MoaResult mResult;
  
  NativeFilter(String paramString)
  {
    mActions = MoaActionFactory.actionList();
    mActions.add(MoaActionFactory.action(paramString));
  }
  
  public NativeFilter(String... paramVarArgs)
  {
    mActions = MoaActionFactory.actionList(paramVarArgs);
  }
  
  public Bitmap execute(Bitmap paramBitmap1, Bitmap paramBitmap2, int paramInt1, int paramInt2)
    throws JSONException
  {
    mResult = NativeFilterProxy.prepareActions(mActions, paramBitmap1, paramBitmap2, paramInt1, paramInt2);
    mResult.execute();
    paramBitmap1 = mResult.outputBitmap;
    mResult = null;
    return paramBitmap1;
  }
  
  public MoaActionList getActions()
  {
    return mActions;
  }
  
  public MoaResult prepare(Bitmap paramBitmap1, Bitmap paramBitmap2, int paramInt1, int paramInt2)
    throws JSONException
  {
    return NativeFilterProxy.prepareActions(mActions, paramBitmap1, paramBitmap2, paramInt1, paramInt2);
  }
  
  public void setPreviewSize(int paramInt1, int paramInt2)
  {
    mActions.get(0).setValue("previewsize", new MoaPointParameter(paramInt1, paramInt2));
  }
  
  public void setSeed(int paramInt)
  {
    mActions.get(0).setValue("seed", paramInt);
  }
  
  public boolean stop()
  {
    boolean bool = false;
    if (mResult != null)
    {
      mResult.active = 0;
      bool = true;
    }
    return bool;
  }
}
