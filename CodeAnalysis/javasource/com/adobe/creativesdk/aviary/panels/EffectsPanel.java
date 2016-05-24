package com.adobe.creativesdk.aviary.panels;

import android.content.Context;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.media.ThumbnailUtils;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import com.adobe.creativesdk.aviary.internal.AdobeImageEditorController;
import com.adobe.creativesdk.aviary.internal.cds.Cds.PackType;
import com.adobe.creativesdk.aviary.internal.cds.TrayColumns.TrayCursorWrapper;
import com.adobe.creativesdk.aviary.internal.content.ToolEntry;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory.Tools;
import com.adobe.creativesdk.aviary.internal.headless.filters.INativeFilter;
import com.adobe.creativesdk.aviary.internal.headless.filters.NativeFilter;
import com.adobe.creativesdk.aviary.internal.headless.filters.NativeFilterProxy;
import com.adobe.creativesdk.aviary.internal.headless.filters.impl.EffectFilter;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaResult;
import com.adobe.creativesdk.aviary.internal.utils.ApiHelper;
import com.adobe.creativesdk.aviary.internal.utils.SystemUtils.CpuInfo;
import com.aviary.android.feather.sdk.R.layout;
import it.sephiroth.android.library.picasso.Picasso;
import it.sephiroth.android.library.picasso.Picasso.LoadedFrom;
import it.sephiroth.android.library.picasso.Request;
import it.sephiroth.android.library.picasso.RequestHandler;
import it.sephiroth.android.library.picasso.RequestHandler.Result;
import java.io.IOException;

public class EffectsPanel
  extends BordersPanel
{
  private double mFactor;
  private RequestHandler mRequestHandler;
  protected Bitmap mThumbBitmap;
  
  public EffectsPanel(AdobeImageEditorController paramAdobeImageEditorController, ToolEntry paramToolEntry)
  {
    super(paramAdobeImageEditorController, paramToolEntry, Cds.PackType.EFFECT);
  }
  
  protected PacksListAdapter createListAdapter(Context paramContext, Cursor paramCursor, int paramInt)
  {
    return new PacksListAdapter.Builder(paramContext, this, paramCursor).setCellWidth(mCellWidth).setContentResId(R.layout.com_adobe_image_content_default_item_content_item).setSupplyResId(R.layout.com_adobe_image_content_frames_item_supplies).setExternalResId(R.layout.com_adobe_image_content_frames_item_external_pack).setDividerResId(R.layout.com_adobe_image_content_frames_item_header_pack).setDefaultPackTextBackgroundColor(mDefaultPackTextBackgroundColor).setPackType(mPackType).setPicasso(mPicasso, mCache).setTintColor(paramInt).build();
  }
  
  protected BordersPanel.RenderTask createRenderTask(int paramInt, float paramFloat)
  {
    return new EffectsRenderTask(paramInt, paramFloat);
  }
  
  protected boolean getIntensityIsManaged()
  {
    return false;
  }
  
  protected boolean getIntensitySliderEnabled()
  {
    return ApiHelper.EFFECT_INTENSITY_AVAILABLE;
  }
  
  protected boolean isContentTutorialNeeded()
  {
    return false;
  }
  
  protected NativeFilter loadNativeFilter(TrayColumns.TrayCursorWrapper paramTrayCursorWrapper, int paramInt, boolean paramBoolean, float paramFloat)
  {
    if ((paramTrayCursorWrapper != null) && (paramInt > -1))
    {
      EffectFilter localEffectFilter = (EffectFilter)ToolLoaderFactory.get(ToolLoaderFactory.Tools.EFFECTS);
      localEffectFilter.setMoaLiteEffect(paramTrayCursorWrapper.getPath() + "/" + paramTrayCursorWrapper.getIdentifier() + ".json");
      localEffectFilter.setPreviewSize(mPreview.getWidth(), mPreview.getHeight());
      localEffectFilter.setIntensity(paramFloat);
      return localEffectFilter;
    }
    return null;
  }
  
  protected void onAddCustomRequestHandlers()
  {
    mThumbBitmap = ThumbnailUtils.extractThumbnail(mBitmap, (int)(mThumbWidth / mFactor), (int)(mThumbWidth / mFactor));
    mRequestHandler = new EffectsRequestHandler(mThumbBitmap);
    try
    {
      mPicasso.addRequestHandler(mRequestHandler);
      return;
    }
    catch (IllegalStateException localIllegalStateException)
    {
      localIllegalStateException.printStackTrace();
    }
  }
  
  public void onCreate(Bitmap paramBitmap, Bundle paramBundle)
  {
    super.onCreate(paramBitmap, paramBundle);
    mFactor = 1.4D;
    int i = SystemUtils.CpuInfo.getCpuMhz();
    if ((i > 0) && (i < 1000)) {
      mFactor = 2.0D;
    }
  }
  
  protected void onDispose()
  {
    super.onDispose();
    if ((mThumbBitmap != null) && (!mThumbBitmap.isRecycled())) {
      mThumbBitmap.recycle();
    }
    mThumbBitmap = null;
  }
  
  protected void onProgressEnd()
  {
    if (!mEnableFastPreview)
    {
      super.onProgressModalEnd();
      return;
    }
    super.onProgressEnd();
  }
  
  protected void onProgressStart()
  {
    if (!mEnableFastPreview)
    {
      super.onProgressModalStart();
      return;
    }
    super.onProgressStart();
  }
  
  protected void onRemoveCustomRequestHandlers()
  {
    super.onRemoveCustomRequestHandlers();
    if (mRequestHandler != null) {
      mPicasso.removeRequestHandler(mRequestHandler);
    }
    mRequestHandler = null;
  }
  
  protected class EffectsRenderTask
    extends BordersPanel.RenderTask
  {
    public EffectsRenderTask(int paramInt, float paramFloat)
    {
      super(paramInt, paramFloat);
    }
  }
  
  static class EffectsRequestHandler
    extends RequestHandler
  {
    private Bitmap srcBitmap;
    
    public EffectsRequestHandler(Bitmap paramBitmap)
    {
      srcBitmap = paramBitmap;
    }
    
    private INativeFilter loadFilter(CharSequence paramCharSequence)
    {
      EffectFilter localEffectFilter = (EffectFilter)ToolLoaderFactory.get(ToolLoaderFactory.Tools.EFFECTS);
      localEffectFilter.setMoaLiteEffect((String)paramCharSequence);
      localEffectFilter.setPreviewSize(srcBitmap.getWidth(), srcBitmap.getHeight());
      return localEffectFilter;
    }
    
    public Bitmap call(String paramString)
      throws Exception
    {
      Object localObject = null;
      try
      {
        paramString = loadFilter(paramString);
        paramString = NativeFilterProxy.prepareActions(paramString.getActions(), srcBitmap, null, 1, 1);
        paramString.execute();
        return outputBitmap;
      }
      catch (Throwable paramString)
      {
        for (;;)
        {
          paramString.printStackTrace();
          paramString = localObject;
        }
      }
    }
    
    public boolean canHandleRequest(Request paramRequest)
    {
      boolean bool2 = false;
      boolean bool1 = bool2;
      if (uri != null)
      {
        paramRequest = uri.getScheme();
        bool1 = bool2;
        if (paramRequest != null)
        {
          bool1 = bool2;
          if ("aviary_effect".equals(paramRequest)) {
            bool1 = true;
          }
        }
      }
      return bool1;
    }
    
    public Bitmap decode(Uri paramUri)
      throws IOException
    {
      try
      {
        paramUri = call(paramUri.getPath());
        return paramUri;
      }
      catch (Throwable paramUri)
      {
        paramUri.printStackTrace();
        throw new IOException(paramUri);
      }
    }
    
    public RequestHandler.Result load(Request paramRequest, int paramInt)
      throws IOException
    {
      if (uri != null)
      {
        Log.v("EffectsPanel", "uri: " + uri + ", param: " + paramInt);
        return new RequestHandler.Result(decode(uri), Picasso.LoadedFrom.NETWORK);
      }
      return null;
    }
  }
}
