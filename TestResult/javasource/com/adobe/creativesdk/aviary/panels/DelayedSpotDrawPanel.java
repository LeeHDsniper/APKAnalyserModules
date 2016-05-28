package com.adobe.creativesdk.aviary.panels;

import android.annotation.SuppressLint;
import android.app.ProgressDialog;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.os.Bundle;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Message;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import com.adobe.android.ui.widget.AdobeAdapterView;
import com.adobe.android.ui.widget.AdobeGalleryView;
import com.adobe.android.ui.widget.AdobeGalleryView.OnItemsScrollListener;
import com.adobe.android.ui.widget.VibrationWidget;
import com.adobe.creativesdk.aviary.AdobeImageEditorActivity;
import com.adobe.creativesdk.aviary.internal.AdobeImageEditorController;
import com.adobe.creativesdk.aviary.internal.content.ToolEntry;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory.Tools;
import com.adobe.creativesdk.aviary.internal.headless.filters.NativeToolFilter;
import com.adobe.creativesdk.aviary.internal.headless.filters.NativeToolFilter.BrushMode;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionFactory;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionList;
import com.adobe.creativesdk.aviary.internal.os.AdobeImageAsyncTask;
import com.adobe.creativesdk.aviary.internal.services.ConfigService;
import com.adobe.creativesdk.aviary.internal.utils.BitmapUtils;
import com.adobe.creativesdk.aviary.internal.vo.EditToolResultVO;
import com.adobe.creativesdk.aviary.internal.vo.ToolActionVO;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.widget.ImageViewSpotDraw;
import com.adobe.creativesdk.aviary.widget.ImageViewSpotDraw.OnDrawListener;
import com.adobe.creativesdk.aviary.widget.ImageViewSpotDraw.TouchMode;
import com.aviary.android.feather.sdk.R.array;
import com.aviary.android.feather.sdk.R.id;
import com.aviary.android.feather.sdk.R.integer;
import com.aviary.android.feather.sdk.R.layout;
import com.aviary.android.feather.sdk.R.string;
import it.sephiroth.android.library.imagezoom.ImageViewTouch;
import it.sephiroth.android.library.imagezoom.ImageViewTouchBase.DisplayType;

public class DelayedSpotDrawPanel
  extends AbstractContentPanel
  implements View.OnClickListener, AdobeGalleryView.OnItemsScrollListener, ImageViewSpotDraw.OnDrawListener
{
  private BackgroundDrawThread mBackgroundDrawThread;
  protected int mBrushSize;
  private int mBrushSizeIndex;
  protected int[] mBrushSizes;
  private NativeToolFilter.BrushMode mBrushType = NativeToolFilter.BrushMode.Free;
  private View mDisabledStatusView;
  private NativeToolFilter mFilter;
  protected ToolLoaderFactory.Tools mFilterType;
  protected AdobeGalleryView mGallery;
  protected ImageView mLensButton;
  protected int mSelectedPosition = -1;
  String mSizeContentDescription;
  Handler mThreadHandler = new Handler(new Handler.Callback()
  {
    public boolean handleMessage(Message paramAnonymousMessage)
    {
      switch (what)
      {
      }
      for (;;)
      {
        return false;
        onProgressStart();
        continue;
        onProgressEnd();
        continue;
        if ((isActive()) && (mImageView != null)) {
          mImageView.postInvalidate();
        }
      }
    }
  });
  private final ToolActionVO<Float> mToolAction;
  private int maxBrushSize;
  float maxRadiusSize;
  private int minBrushSize;
  float minRadiusSize;
  
  public DelayedSpotDrawPanel(AdobeImageEditorController paramAdobeImageEditorController, ToolEntry paramToolEntry, ToolLoaderFactory.Tools paramTools)
  {
    super(paramAdobeImageEditorController, paramToolEntry);
    mFilterType = paramTools;
    mToolAction = new ToolActionVO();
  }
  
  private void setSelectedTool(ImageViewSpotDraw.TouchMode paramTouchMode)
  {
    ((ImageViewSpotDraw)mImageView).setDrawMode(paramTouchMode);
    if (paramTouchMode == ImageViewSpotDraw.TouchMode.IMAGE)
    {
      mLensButton.setImageState(new int[] { 16842912 }, true);
      if (paramTouchMode == ImageViewSpotDraw.TouchMode.IMAGE) {
        break label68;
      }
    }
    label68:
    for (boolean bool = true;; bool = false)
    {
      setPanelEnabled(bool);
      return;
      mLensButton.setImageState(new int[] { -16842912 }, false);
      break;
    }
  }
  
  protected NativeToolFilter createFilter(ToolLoaderFactory.Tools paramTools)
  {
    return (NativeToolFilter)ToolLoaderFactory.get(paramTools);
  }
  
  @SuppressLint({"InflateParams"})
  protected View generateContentView(LayoutInflater paramLayoutInflater)
  {
    return paramLayoutInflater.inflate(R.layout.com_adobe_image_editor_content_spot_draw, null);
  }
  
  protected ViewGroup generateOptionView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup)
  {
    return (ViewGroup)paramLayoutInflater.inflate(R.layout.com_adobe_image_bottombar_panel_spot, paramViewGroup, false);
  }
  
  public void onActivate()
  {
    super.onActivate();
    disableHapticIsNecessary(new VibrationWidget[] { mGallery });
    mPreview = BitmapUtils.copy(mBitmap, Bitmap.Config.ARGB_8888);
    mLensButton.setOnClickListener(this);
    mGallery.setOnItemsScrollListener(this);
    ((ImageViewSpotDraw)mImageView).setOnDrawStartListener(this);
    mImageView.setDisplayType(ImageViewTouchBase.DisplayType.FIT_IF_BIGGER);
    mImageView.setImageBitmap(mPreview, null, -1.0F, 8.0F);
    mBackgroundDrawThread.start(mBitmap, mPreview);
    getContentView().setVisibility(0);
    contentReady();
  }
  
  public void onClick(View paramView)
  {
    if (paramView.getId() == mLensButton.getId()) {
      if (((ImageViewSpotDraw)mImageView).getDrawMode() != ImageViewSpotDraw.TouchMode.DRAW) {
        break label40;
      }
    }
    label40:
    for (paramView = ImageViewSpotDraw.TouchMode.IMAGE;; paramView = ImageViewSpotDraw.TouchMode.DRAW)
    {
      setSelectedTool(paramView);
      return;
    }
  }
  
  protected void onComplete(Bitmap paramBitmap, EditToolResultVO paramEditToolResultVO)
  {
    paramEditToolResultVO.setToolAction(mToolAction);
    paramEditToolResultVO.setActionList(mFilter.getActions());
    super.onComplete(paramBitmap, paramEditToolResultVO);
  }
  
  public void onCreate(Bitmap paramBitmap, Bundle paramBundle)
  {
    super.onCreate(paramBitmap, paramBundle);
    paramBitmap = (ConfigService)getContext().getService(ConfigService.class);
    mBrushSizeIndex = paramBitmap.getInteger(R.integer.com_adobe_image_editor_spot_brush_size_selected);
    mBrushSizes = paramBitmap.getSizeArray(R.array.com_adobe_image_editor_spot_brush_sizes);
    mBrushSize = mBrushSizes[mBrushSizeIndex];
    minBrushSize = mBrushSizes[0];
    maxBrushSize = mBrushSizes[(mBrushSizes.length - 1)];
    minRadiusSize = (paramBitmap.getInteger(R.integer.com_adobe_image_editor_gallery_drawable_min_size) / 100.0F);
    maxRadiusSize = (paramBitmap.getInteger(R.integer.com_adobe_image_editor_gallery_drawable_max_size) / 100.0F);
    mLensButton = ((ImageView)getContentView().findViewById(R.id.lens));
    mSizeContentDescription = paramBitmap.getString(R.string.feather_acc_size);
    mSelectedPosition = mBrushSizeIndex;
    mGallery = ((AdobeGalleryView)getOptionView().findViewById(R.id.gallery));
    mGallery.setDefaultPosition(mBrushSizeIndex);
    mGallery.setAutoSelectChild(true);
    mGallery.setCallbackDuringFling(false);
    int i = 0;
    if (getContext().hasAccentColor()) {
      i = getContext().getAccentColor(0);
    }
    paramBitmap = new BlemishPanel.GalleryAdapter(getContext().getBaseContext(), mBrushSizes);
    paramBitmap.setSelectedPosition(mSelectedPosition);
    paramBitmap.setMinBrushSize(minBrushSize);
    paramBitmap.setMaxBrushSize(maxBrushSize);
    paramBitmap.setMinRadiusSize(minRadiusSize);
    paramBitmap.setMaxRadiusSize(maxRadiusSize);
    paramBitmap.setAccentColor(i);
    mGallery.setAdapter(paramBitmap);
    mImageView = ((ImageViewSpotDraw)getContentView().findViewById(R.id.image));
    ((ImageViewSpotDraw)mImageView).setBrushSize(mBrushSize * 1.5F);
    ((ImageViewSpotDraw)mImageView).setDrawLimit(0.0D);
    ((ImageViewSpotDraw)mImageView).setPaintEnabled(false);
    mImageView.setDisplayType(ImageViewTouchBase.DisplayType.FIT_IF_BIGGER);
    mDisabledStatusView = getOptionView().findViewById(R.id.disabled_status);
    mFilter = createFilter(mFilterType);
    mBackgroundDrawThread = new BackgroundDrawThread("draw-thread", 5, mFilter, mThreadHandler, 1.5D);
  }
  
  public void onDeactivate()
  {
    mLensButton.setOnClickListener(null);
    mGallery.setOnItemsScrollListener(null);
    ((ImageViewSpotDraw)mImageView).setOnDrawStartListener(null);
    if (mBackgroundDrawThread != null)
    {
      mBackgroundDrawThread.clear();
      if (mBackgroundDrawThread.isAlive())
      {
        mBackgroundDrawThread.quit();
        while (mBackgroundDrawThread.isAlive()) {}
      }
    }
    onProgressEnd();
    super.onDeactivate();
  }
  
  public void onDestroy()
  {
    mImageView.clear();
    super.onDestroy();
  }
  
  protected void onDispose()
  {
    mBackgroundDrawThread = null;
    mThreadHandler = null;
    mFilter.dispose();
    super.onDispose();
  }
  
  public void onDrawEnd()
  {
    mBackgroundDrawThread.pathEnd();
  }
  
  public void onDrawStart(float[] paramArrayOfFloat, float paramFloat)
  {
    paramFloat = Math.max(1.0F, paramFloat);
    mBackgroundDrawThread.pathStart(paramFloat / 2.0F, paramArrayOfFloat, mBrushType);
    mToolAction.setValue(Float.valueOf(paramFloat));
    setIsChanged(true);
  }
  
  public void onDrawing(float[] paramArrayOfFloat, float paramFloat)
  {
    mBackgroundDrawThread.lineTo(paramArrayOfFloat);
  }
  
  protected void onGenerateResult()
  {
    if ((mBackgroundDrawThread.isAlive()) && (!mBackgroundDrawThread.isCompleted()))
    {
      mBackgroundDrawThread.finish();
      new GenerateResultTask().execute(new Void[0]);
      return;
    }
    mEditResult.setActionList(mFilter.getActions());
    mEditResult.setToolAction(mToolAction);
    onComplete(mPreview);
  }
  
  public void onScroll(AdobeAdapterView<?> paramAdobeAdapterView, View paramView, int paramInt, long paramLong) {}
  
  public void onScrollFinished(AdobeAdapterView<?> paramAdobeAdapterView, View paramView, int paramInt, long paramLong)
  {
    mBrushSize = mBrushSizes[paramInt];
    ((ImageViewSpotDraw)mImageView).setBrushSize(mBrushSize * 1.5F);
    setSelectedTool(ImageViewSpotDraw.TouchMode.DRAW);
  }
  
  public void onScrollStarted(AdobeAdapterView<?> paramAdobeAdapterView, View paramView, int paramInt, long paramLong)
  {
    setSelectedTool(ImageViewSpotDraw.TouchMode.DRAW);
  }
  
  public void setPanelEnabled(boolean paramBoolean)
  {
    View localView;
    if ((mOptionView != null) && (paramBoolean != mOptionView.isEnabled()))
    {
      mOptionView.setEnabled(paramBoolean);
      if (!paramBoolean) {
        break label51;
      }
      restoreToolbarTitle();
      localView = mDisabledStatusView;
      if (!paramBoolean) {
        break label61;
      }
    }
    label51:
    label61:
    for (int i = 4;; i = 0)
    {
      localView.setVisibility(i);
      return;
      setToolbarTitle(R.string.feather_zoom_mode);
      break;
    }
  }
  
  class GenerateResultTask
    extends AdobeImageAsyncTask<Void, Void, MoaActionList>
  {
    ProgressDialog mProgress = new ProgressDialog(getContext().getBaseContext());
    
    GenerateResultTask() {}
    
    protected MoaActionList doInBackground(Void... paramVarArgs)
    {
      paramVarArgs = MoaActionFactory.actionList();
      if (mBackgroundDrawThread != null) {
        while ((mBackgroundDrawThread != null) && (!mBackgroundDrawThread.isCompleted()))
        {
          logger.log("waiting.... " + mBackgroundDrawThread.getQueueSize());
          try
          {
            Thread.sleep(50L);
          }
          catch (InterruptedException localInterruptedException)
          {
            localInterruptedException.printStackTrace();
          }
        }
      }
      paramVarArgs.add(mFilter.getActions().get(0));
      return paramVarArgs;
    }
    
    protected void doPostExecute(MoaActionList paramMoaActionList)
    {
      if (getContext().getBaseActivity().isFinishing()) {
        return;
      }
      if (mProgress.isShowing()) {}
      try
      {
        mProgress.dismiss();
        mEditResult.setActionList(paramMoaActionList);
        mEditResult.setToolAction(mToolAction);
        onComplete(mPreview);
        return;
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        for (;;) {}
      }
    }
    
    protected void doPreExecute()
    {
      mProgress.setTitle(getContext().getBaseContext().getString(R.string.feather_loading_title));
      mProgress.setMessage(getContext().getBaseContext().getString(R.string.feather_effect_loading_message));
      mProgress.setIndeterminate(true);
      mProgress.setCancelable(false);
      mProgress.show();
    }
  }
}
