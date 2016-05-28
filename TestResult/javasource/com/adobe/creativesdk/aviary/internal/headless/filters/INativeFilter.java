package com.adobe.creativesdk.aviary.internal.headless.filters;

import android.graphics.Bitmap;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionList;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaResult;
import org.json.JSONException;

public abstract interface INativeFilter
  extends IFilter
{
  public abstract MoaActionList getActions();
  
  public abstract MoaResult prepare(Bitmap paramBitmap1, Bitmap paramBitmap2, int paramInt1, int paramInt2)
    throws JSONException;
}
