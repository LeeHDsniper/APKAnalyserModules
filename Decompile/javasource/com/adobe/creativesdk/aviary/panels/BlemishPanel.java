package com.adobe.creativesdk.aviary.panels;

import android.annotation.SuppressLint;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.res.Resources;
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
import android.widget.BaseAdapter;
import android.widget.ImageView;
import com.adobe.android.ui.view.AdobeTutorialOverlay;
import com.adobe.android.ui.widget.AdobeAdapterView;
import com.adobe.android.ui.widget.AdobeGalleryView;
import com.adobe.android.ui.widget.AdobeGalleryView.OnItemsScrollListener;
import com.adobe.android.ui.widget.VibrationWidget;
import com.adobe.creativesdk.aviary.AdobeImageEditorActivity;
import com.adobe.creativesdk.aviary.graphics.PreviewSpotDrawable;
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
import com.adobe.creativesdk.aviary.overlays.AbstractBaseOverlay;
import com.adobe.creativesdk.aviary.overlays.BlemishOverlay;
import com.adobe.creativesdk.aviary.widget.ImageViewSpotSingleTap;
import com.adobe.creativesdk.aviary.widget.ImageViewSpotSingleTap.OnTapListener;
import com.adobe.creativesdk.aviary.widget.ImageViewSpotSingleTap.TouchMode;
import com.aviary.android.feather.sdk.R.array;
import com.aviary.android.feather.sdk.R.id;
import com.aviary.android.feather.sdk.R.integer;
import com.aviary.android.feather.sdk.R.layout;
import com.aviary.android.feather.sdk.R.string;
import it.sephiroth.android.library.imagezoom.ImageViewTouch;
import it.sephiroth.android.library.imagezoom.ImageViewTouchBase.DisplayType;

public class BlemishPanel
  extends AbstractContentPanel
  implements View.OnClickListener, AdobeGalleryView.OnItemsScrollListener, ImageViewSpotSingleTap.OnTapListener
{
  private BackgroundDrawThread mBackgroundDrawThread;
  protected int mBrushSize;
  protected int[] mBrushSizes;
  private NativeToolFilter.BrushMode mBrushType = NativeToolFilter.BrushMode.Free;
  private View mDisabledStatusView;
  private NativeToolFilter mFilter;
  protected ToolLoaderFactory.Tools mFilterType;
  protected AdobeGalleryView mGallery;
  protected ImageView mLensButton;
  private AdobeTutorialOverlay mOverlay;
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
  float maxRadiusSize;
  float minRadiusSize;
  
  public BlemishPanel(AdobeImageEditorController paramAdobeImageEditorController, ToolEntry paramToolEntry, ToolLoaderFactory.Tools paramTools)
  {
    super(paramAdobeImageEditorController, paramToolEntry);
    mFilterType = paramTools;
  }
  
  private void onComplete(Bitmap paramBitmap, MoaActionList paramMoaActionList)
  {
    mEditResult.setActionList(paramMoaActionList);
    mEditResult.setToolAction(new ToolActionVO(Integer.valueOf(mBrushSize)));
    onComplete(paramBitmap);
  }
  
  private void setSelectedTool(ImageViewSpotSingleTap.TouchMode paramTouchMode)
  {
    ((ImageViewSpotSingleTap)mImageView).setDrawMode(paramTouchMode);
    if (paramTouchMode == ImageViewSpotSingleTap.TouchMode.IMAGE)
    {
      mLensButton.setImageState(new int[] { 16842912 }, true);
      if (paramTouchMode == ImageViewSpotSingleTap.TouchMode.IMAGE) {
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
    return paramLayoutInflater.inflate(R.layout.com_adobe_image_editor_content_blemish, null);
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
    ((ImageViewSpotSingleTap)mImageView).setOnTapListener(this);
    mImageView.setDisplayType(ImageViewTouchBase.DisplayType.FIT_IF_BIGGER);
    mImageView.setImageBitmap(mPreview, null, -1.0F, 8.0F);
    mBackgroundDrawThread.start(mPreview);
    getContentView().setVisibility(0);
    contentReady();
    if (AbstractBaseOverlay.shouldShow(getContext().getBaseContext(), 2))
    {
      mOverlay = new BlemishOverlay(getContext().getBaseContext(), mImageView, mLensButton);
      mOverlay.showDelayed(100L);
    }
  }
  
  public boolean onBackPressed()
  {
    logger.info("onBackPressed");
    if ((mOverlay != null) && (mOverlay.onBackPressed())) {
      return true;
    }
    return super.onBackPressed();
  }
  
  public void onClick(View paramView)
  {
    if (paramView.getId() == mLensButton.getId()) {
      if (((ImageViewSpotSingleTap)mImageView).getDrawMode() != ImageViewSpotSingleTap.TouchMode.DRAW) {
        break label40;
      }
    }
    label40:
    for (paramView = ImageViewSpotSingleTap.TouchMode.IMAGE;; paramView = ImageViewSpotSingleTap.TouchMode.DRAW)
    {
      setSelectedTool(paramView);
      return;
    }
  }
  
  public void onCreate(Bitmap paramBitmap, Bundle paramBundle)
  {
    super.onCreate(paramBitmap, paramBundle);
    paramBitmap = (ConfigService)getContext().getService(ConfigService.class);
    int i = paramBitmap.getInteger(R.integer.com_adobe_image_editor_blemish_brush_size_selected);
    mBrushSizes = paramBitmap.getSizeArray(R.array.com_adobe_image_editor_blemish_brush_sizes);
    mBrushSize = mBrushSizes[i];
    int j = mBrushSizes[0];
    int k = mBrushSizes[(mBrushSizes.length - 1)];
    minRadiusSize = (paramBitmap.getInteger(R.integer.com_adobe_image_editor_gallery_drawable_min_size) / 100.0F);
    maxRadiusSize = (paramBitmap.getInteger(R.integer.com_adobe_image_editor_gallery_drawable_max_size) / 100.0F);
    mLensButton = ((ImageView)getContentView().findViewById(R.id.lens));
    mSizeContentDescription = paramBitmap.getString(R.string.feather_acc_size);
    mSelectedPosition = i;
    mGallery = ((AdobeGalleryView)getOptionView().findViewById(R.id.gallery));
    mGallery.setDefaultPosition(i);
    mGallery.setAutoSelectChild(true);
    mGallery.setCallbackDuringFling(false);
    i = 0;
    if (getContext().hasAccentColor()) {
      i = getContext().getAccentColor(0);
    }
    paramBitmap = new GalleryAdapter(getContext().getBaseContext(), mBrushSizes);
    paramBitmap.setSelectedPosition(mSelectedPosition);
    paramBitmap.setMinBrushSize(j);
    paramBitmap.setMaxBrushSize(k);
    paramBitmap.setMinRadiusSize(minRadiusSize);
    paramBitmap.setMaxRadiusSize(maxRadiusSize);
    paramBitmap.setAccentColor(i);
    mGallery.setAdapter(paramBitmap);
    mImageView = ((ImageViewSpotSingleTap)getContentView().findViewById(R.id.image));
    mImageView.setDisplayType(ImageViewTouchBase.DisplayType.FIT_IF_BIGGER);
    ((ImageViewSpotSingleTap)mImageView).setBrushSize(mBrushSize);
    mDisabledStatusView = getOptionView().findViewById(R.id.disabled_status);
    mFilter = createFilter(mFilterType);
    mBackgroundDrawThread = new BackgroundDrawThread("draw-thread", 5, mFilter, mThreadHandler, 1.5D);
    mBackgroundDrawThread.setSingleTapAllowed(true);
    mBackgroundDrawThread.setRegisterStrokeInitParams(true);
  }
  
  public void onDeactivate()
  {
    mLensButton.setOnClickListener(null);
    mGallery.setOnItemsScrollListener(null);
    ((ImageViewSpotSingleTap)mImageView).setOnTapListener(null);
    if (mBackgroundDrawThread != null)
    {
      mBackgroundDrawThread.clear();
      if (mBackgroundDrawThread.isAlive())
      {
        mBackgroundDrawThread.quit();
        while (mBackgroundDrawThread.isAlive()) {}
      }
    }
    if (mOverlay != null) {
      mOverlay.dismiss();
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
  
  protected void onGenerateResult()
  {
    if ((mBackgroundDrawThread.isAlive()) && (!mBackgroundDrawThread.isCompleted()))
    {
      mBackgroundDrawThread.finish();
      new GenerateResultTask().execute(new Void[0]);
      return;
    }
    onComplete(mPreview, mFilter.getActions());
  }
  
  public void onScroll(AdobeAdapterView<?> paramAdobeAdapterView, View paramView, int paramInt, long paramLong) {}
  
  public void onScrollFinished(AdobeAdapterView<?> paramAdobeAdapterView, View paramView, int paramInt, long paramLong)
  {
    mBrushSize = mBrushSizes[paramInt];
    ((ImageViewSpotSingleTap)mImageView).setBrushSize(mBrushSize);
    setSelectedTool(ImageViewSpotSingleTap.TouchMode.DRAW);
  }
  
  public void onScrollStarted(AdobeAdapterView<?> paramAdobeAdapterView, View paramView, int paramInt, long paramLong)
  {
    setSelectedTool(ImageViewSpotSingleTap.TouchMode.DRAW);
  }
  
  public void onTap(float[] paramArrayOfFloat, float paramFloat)
  {
    paramFloat = Math.max(1.0F, paramFloat);
    mBackgroundDrawThread.pathStart(2.0F * paramFloat, paramArrayOfFloat, mBrushType);
    mBackgroundDrawThread.pathEnd();
    setIsChanged(true);
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
  
  static class GalleryAdapter
    extends BaseAdapter
  {
    private int accentColor;
    private Context context;
    final LayoutInflater layoutInflater;
    private int maxBrushSize;
    private float maxRadiusSize;
    private int minBrushSize;
    private float minRadiusSize;
    final Resources resources;
    private int selectedPosition;
    private final int[] sizes;
    
    public GalleryAdapter(Context paramContext, int[] paramArrayOfInt)
    {
      context = paramContext;
      layoutInflater = LayoutInflater.from(paramContext);
      sizes = paramArrayOfInt;
      resources = paramContext.getResources();
    }
    
    public Context getContext()
    {
      return context;
    }
    
    public int getCount()
    {
      return sizes.length;
    }
    
    public Object getItem(int paramInt)
    {
      return Integer.valueOf(sizes[paramInt]);
    }
    
    public long getItemId(int paramInt)
    {
      return paramInt;
    }
    
    public int getItemViewType(int paramInt)
    {
      if ((paramInt >= 0) && (paramInt < getCount())) {}
      for (paramInt = 1; paramInt != 0; paramInt = 0) {
        return 0;
      }
      return 1;
    }
    
    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      boolean bool = false;
      int i = getItemViewType(paramInt);
      Object localObject;
      if (paramView == null)
      {
        paramViewGroup = (ImageView)layoutInflater.inflate(R.layout.com_adobe_image_gallery_item_view, paramViewGroup, false);
        localObject = paramViewGroup;
        PreviewSpotDrawable localPreviewSpotDrawable = (PreviewSpotDrawable)paramViewGroup.getDrawable();
        paramView = localPreviewSpotDrawable;
        if (i == 0)
        {
          if (localPreviewSpotDrawable != null) {
            break label178;
          }
          paramView = new PreviewSpotDrawable(getContext());
          if (accentColor != 0) {
            paramView.setSelectedTint(accentColor);
          }
          paramViewGroup.setImageDrawable(paramView);
        }
      }
      for (;;)
      {
        if ((paramView != null) && (i == 0))
        {
          i = sizes[paramInt];
          paramView.setRadius(minRadiusSize + (i - minBrushSize) / (maxBrushSize - minBrushSize) * (maxRadiusSize - minRadiusSize));
        }
        if (selectedPosition == paramInt) {
          bool = true;
        }
        paramViewGroup.setSelected(bool);
        paramViewGroup.invalidate();
        return localObject;
        paramViewGroup = (ImageView)paramView;
        localObject = paramView;
        break;
        label178:
        paramView = (PreviewSpotDrawable)paramViewGroup.getDrawable();
      }
    }
    
    public int getViewTypeCount()
    {
      return 2;
    }
    
    public void setAccentColor(int paramInt)
    {
      accentColor = paramInt;
    }
    
    public void setMaxBrushSize(int paramInt)
    {
      maxBrushSize = paramInt;
    }
    
    public void setMaxRadiusSize(float paramFloat)
    {
      maxRadiusSize = paramFloat;
    }
    
    public void setMinBrushSize(int paramInt)
    {
      minBrushSize = paramInt;
    }
    
    public void setMinRadiusSize(float paramFloat)
    {
      minRadiusSize = paramFloat;
    }
    
    public void setSelectedPosition(int paramInt)
    {
      selectedPosition = paramInt;
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
        BlemishPanel.this.onComplete(mPreview, paramMoaActionList);
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
