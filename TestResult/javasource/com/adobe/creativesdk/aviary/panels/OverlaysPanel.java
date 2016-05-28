package com.adobe.creativesdk.aviary.panels;

import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import com.adobe.android.ui.view.AdobeTutorialOverlay;
import com.adobe.android.ui.view.AdobeTutorialOverlay.OnCloseListener;
import com.adobe.creativesdk.aviary.internal.AdobeImageEditorController;
import com.adobe.creativesdk.aviary.internal.cds.Cds;
import com.adobe.creativesdk.aviary.internal.cds.Cds.PackType;
import com.adobe.creativesdk.aviary.internal.cds.Cds.Size;
import com.adobe.creativesdk.aviary.internal.cds.CdsUtils;
import com.adobe.creativesdk.aviary.internal.cds.TrayColumns.TrayCursorWrapper;
import com.adobe.creativesdk.aviary.internal.content.ToolEntry;
import com.adobe.creativesdk.aviary.internal.filters.OverlayFilter;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory.Tools;
import com.adobe.creativesdk.aviary.internal.tracking.AdobeImageAnalyticsTracker;
import com.adobe.creativesdk.aviary.internal.utils.DecodeUtils;
import com.adobe.creativesdk.aviary.internal.utils.ImageInfo;
import com.adobe.creativesdk.aviary.internal.vo.EditToolResultVO;
import com.adobe.creativesdk.aviary.internal.vo.ToolActionVO;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.overlays.AbstractBaseOverlay;
import com.adobe.creativesdk.aviary.overlays.OverlayOverlay;
import com.adobe.creativesdk.aviary.widget.ImageViewOverlay;
import com.aviary.android.feather.sdk.R.attr;
import com.aviary.android.feather.sdk.R.layout;
import java.util.HashMap;
import java.util.Locale;

public class OverlaysPanel
  extends BordersPanel
{
  private OverlayFilter mCurrentFilter;
  
  public OverlaysPanel(AdobeImageEditorController paramAdobeImageEditorController, ToolEntry paramToolEntry)
  {
    super(paramAdobeImageEditorController, paramToolEntry, Cds.PackType.OVERLAY);
  }
  
  boolean backHandled()
  {
    if (super.backHandled()) {
      return true;
    }
    AdobeTutorialOverlay localAdobeTutorialOverlay = AdobeTutorialOverlay.findOverlay(getContext().getBaseContext(), new Class[] { OverlayOverlay.class });
    if (localAdobeTutorialOverlay != null)
    {
      localAdobeTutorialOverlay.onBackPressed();
      return true;
    }
    return false;
  }
  
  protected View generateContentView(LayoutInflater paramLayoutInflater)
  {
    return paramLayoutInflater.inflate(R.layout.com_adobe_image_editor_content_overlays, null);
  }
  
  protected int getTutorialOverlayId()
  {
    return 7;
  }
  
  public void onCreate(Bitmap paramBitmap, Bundle paramBundle)
  {
    super.onCreate(paramBitmap, paramBundle);
  }
  
  protected void onGenerateFinalBitmap()
  {
    if (mCurrentFilter != null)
    {
      Bitmap localBitmap = ((ImageViewOverlay)mImageView).generateResultBitmap(mCurrentFilter);
      getEditToolResult().setActionList(mCurrentFilter.getActions());
      onComplete(localBitmap);
      return;
    }
    getContext().cancel();
  }
  
  protected void onSetupImageView()
  {
    ((ImageViewOverlay)mImageView).setImageBitmap(mPreview, null);
  }
  
  protected void renderEffect(TrayColumns.TrayCursorWrapper paramTrayCursorWrapper, int paramInt, float paramFloat)
  {
    logger.info("renderEffect. item: %s", new Object[] { paramTrayCursorWrapper });
    if (paramTrayCursorWrapper != null)
    {
      Object localObject = paramTrayCursorWrapper.getPath() + "/" + Cds.getPackItemFilename(paramTrayCursorWrapper.getIdentifier(), Cds.PackType.STICKER, Cds.Size.Medium);
      paramInt = Math.max(mPreview.getWidth(), mPreview.getHeight());
      logger.log("path: %s", new Object[] { localObject });
      logger.log("max_size: %d", new Object[] { Integer.valueOf(paramInt) });
      localObject = DecodeUtils.decode(getContext().getBaseContext(), Uri.parse((String)localObject), paramInt, paramInt, new ImageInfo());
      if (((ImageViewOverlay)mImageView).getOverlayDrawable() != null) {
        ((ImageViewOverlay)mImageView).updateImageOverlay((Bitmap)localObject);
      }
      for (;;)
      {
        setIsChanged(true);
        localObject = new ToolActionVO();
        ((ToolActionVO)localObject).setPackIdentifier(paramTrayCursorWrapper.getPackageName());
        ((ToolActionVO)localObject).setContentIdentifier(paramTrayCursorWrapper.getIdentifier());
        getEditToolResult().setToolAction((ToolActionVO)localObject);
        localObject = CdsUtils.getPackContentPath(getContext().getBaseContext(), paramTrayCursorWrapper.getPackId());
        logger.log("packId: %d, contentPath: %s", new Object[] { Long.valueOf(paramTrayCursorWrapper.getId()), localObject });
        mCurrentFilter = ((OverlayFilter)ToolLoaderFactory.get(getName()));
        mCurrentFilter.setSourceDir((String)localObject);
        mCurrentFilter.setUrl(paramTrayCursorWrapper.getIdentifier());
        localObject = new HashMap();
        ((HashMap)localObject).put("pack", paramTrayCursorWrapper.getPackageName());
        ((HashMap)localObject).put("item", paramTrayCursorWrapper.getIdentifier());
        getContext().getTracker().tagEventAttributes(getName().name().toLowerCase(Locale.US) + ": item_previewed", (HashMap)localObject);
        mTrackingAttributes.put("pack", paramTrayCursorWrapper.getPackageName());
        mTrackingAttributes.put("item", paramTrayCursorWrapper.getIdentifier());
        if (AbstractBaseOverlay.shouldShow(getContext().getBaseContext(), 8))
        {
          paramTrayCursorWrapper = new OverlayOverlay(getContext().getBaseContext(), R.attr.com_adobe_image_editor_overlay_overlay_style);
          if (paramTrayCursorWrapper.show()) {
            paramTrayCursorWrapper.setOnCloseListener(new AdobeTutorialOverlay.OnCloseListener()
            {
              public void onClose(AdobeTutorialOverlay paramAnonymousAdobeTutorialOverlay)
              {
                paramAnonymousAdobeTutorialOverlay.dismiss();
              }
            });
          }
        }
        return;
        ((ImageViewOverlay)mImageView).setImageBitmap(mPreview, (Bitmap)localObject);
      }
    }
    ((ImageViewOverlay)mImageView).setImageBitmap(mPreview, null);
    getEditToolResult().reset();
    setIsChanged(false);
  }
}
