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
import com.adobe.creativesdk.aviary.internal.tracking.AdobeImageAnalyticsTracker;
import com.adobe.creativesdk.aviary.internal.utils.BitmapUtils;
import com.adobe.creativesdk.aviary.internal.vo.EditToolResultVO;
import com.adobe.creativesdk.aviary.internal.vo.ToolActionVO;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.widget.AdobeImageHighlightImageButton;
import com.adobe.creativesdk.aviary.widget.AdobeImageHighlightImageButton.OnCheckedChangeListener;
import com.adobe.creativesdk.aviary.widget.ImageViewSpotDraw;
import com.adobe.creativesdk.aviary.widget.ImageViewSpotDraw.OnDrawListener;
import com.adobe.creativesdk.aviary.widget.ImageViewSpotDraw.TouchMode;
import com.aviary.android.feather.sdk.R.dimen;
import com.aviary.android.feather.sdk.R.id;
import com.aviary.android.feather.sdk.R.layout;
import com.aviary.android.feather.sdk.R.string;
import it.sephiroth.android.library.imagezoom.ImageViewTouch;
import it.sephiroth.android.library.imagezoom.ImageViewTouchBase.DisplayType;
import java.util.Locale;

public class ColorSplashPanel
  extends AbstractContentPanel
  implements View.OnClickListener, AdobeImageHighlightImageButton.OnCheckedChangeListener, ImageViewSpotDraw.OnDrawListener
{
  private BackgroundDrawThread mBackgroundDrawThread;
  private NativeToolFilter.BrushMode mBrushType = NativeToolFilter.BrushMode.Free;
  private AdobeImageHighlightImageButton mCurrent;
  private View mDisabledStatusView;
  private AdobeImageHighlightImageButton mErase;
  private NativeToolFilter mFilter;
  private AdobeImageHighlightImageButton mFree;
  private ImageView mLensButton;
  private AdobeImageHighlightImageButton mSmart;
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
        if ((isActive()) && (mImageView != null))
        {
          mImageView.postInvalidate();
          continue;
          if (isActive()) {
            setIsChanged(true);
          }
        }
      }
    }
  });
  private final ToolActionVO<String> mToolAction = new ToolActionVO(NativeToolFilter.BrushMode.None.name());
  
  public ColorSplashPanel(AdobeImageEditorController paramAdobeImageEditorController, ToolEntry paramToolEntry)
  {
    super(paramAdobeImageEditorController, paramToolEntry);
  }
  
  private void onComplete(Bitmap paramBitmap, MoaActionList paramMoaActionList)
  {
    mEditResult.setActionList(paramMoaActionList);
    mEditResult.setToolAction(mToolAction);
    onComplete(paramBitmap);
  }
  
  private void setSelectedTool(ImageViewSpotDraw.TouchMode paramTouchMode)
  {
    ((ImageViewSpotDraw)mImageView).setDrawMode(paramTouchMode);
    if (paramTouchMode == ImageViewSpotDraw.TouchMode.IMAGE)
    {
      mLensButton.setImageState(new int[] { 16842912 }, true);
      mLensButton.invalidate();
      if (paramTouchMode == ImageViewSpotDraw.TouchMode.IMAGE) {
        break label75;
      }
    }
    label75:
    for (boolean bool = true;; bool = false)
    {
      setPanelEnabled(bool);
      return;
      mLensButton.setImageState(new int[] { -16842912 }, false);
      break;
    }
  }
  
  protected NativeToolFilter createFilter()
  {
    return (NativeToolFilter)ToolLoaderFactory.get(ToolLoaderFactory.Tools.SPLASH);
  }
  
  @SuppressLint({"InflateParams"})
  protected View generateContentView(LayoutInflater paramLayoutInflater)
  {
    return paramLayoutInflater.inflate(R.layout.com_adobe_image_editor_content_spot_draw, null);
  }
  
  protected ViewGroup generateOptionView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup)
  {
    return (ViewGroup)paramLayoutInflater.inflate(R.layout.com_adobe_image_panel_colorsplash, paramViewGroup, false);
  }
  
  public void onActivate()
  {
    super.onActivate();
    if (mFree.isChecked()) {
      mCurrent = mFree;
    }
    if (mSmart.isChecked()) {
      mCurrent = mSmart;
    }
    if (mErase.isChecked()) {
      mCurrent = mErase;
    }
    mPreview = BitmapUtils.copy(mBitmap, Bitmap.Config.ARGB_8888);
    ((ImageViewSpotDraw)mImageView).setOnDrawStartListener(this);
    mImageView.setDisplayType(ImageViewTouchBase.DisplayType.FIT_IF_BIGGER);
    mImageView.setImageBitmap(mPreview, null, -1.0F, 8.0F);
    mBackgroundDrawThread.start(mBitmap, mPreview);
    mLensButton.setOnClickListener(this);
    getContentView().setVisibility(0);
    contentReady();
  }
  
  public void onCheckedChanged(AdobeImageHighlightImageButton paramAdobeImageHighlightImageButton, boolean paramBoolean1, boolean paramBoolean2)
  {
    if ((mCurrent != null) && (!paramAdobeImageHighlightImageButton.equals(mCurrent))) {
      mCurrent.setChecked(false);
    }
    mCurrent = paramAdobeImageHighlightImageButton;
    int i;
    if ((paramBoolean2) && (paramBoolean1))
    {
      i = paramAdobeImageHighlightImageButton.getId();
      if (i != mFree.getId()) {
        break label129;
      }
      mBrushType = NativeToolFilter.BrushMode.Free;
      getContext().getTracker().tagEvent(ToolLoaderFactory.Tools.SPLASH.name().toLowerCase(Locale.US) + ": free_color_selected");
    }
    for (;;)
    {
      if (((ImageViewSpotDraw)mImageView).getDrawMode() != ImageViewSpotDraw.TouchMode.DRAW) {
        setSelectedTool(ImageViewSpotDraw.TouchMode.DRAW);
      }
      return;
      label129:
      if (i == mSmart.getId())
      {
        mBrushType = NativeToolFilter.BrushMode.Smart;
        getContext().getTracker().tagEvent(ToolLoaderFactory.Tools.SPLASH.name().toLowerCase(Locale.US) + ": smart_color_selected");
      }
      else if (i == mErase.getId())
      {
        mBrushType = NativeToolFilter.BrushMode.Erase;
        getContext().getTracker().tagEvent(ToolLoaderFactory.Tools.SPLASH.name().toLowerCase(Locale.US) + ": eraser_selected");
      }
    }
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
  
  public void onCreate(Bitmap paramBitmap, Bundle paramBundle)
  {
    super.onCreate(paramBitmap, paramBundle);
    int i = ((ConfigService)getContext().getService(ConfigService.class)).getDimensionPixelSize(R.dimen.com_adobe_image_editor_color_splash_brush_size);
    mLensButton = ((ImageView)getContentView().findViewById(R.id.lens));
    mFree = ((AdobeImageHighlightImageButton)getOptionView().findViewById(R.id.button1));
    mSmart = ((AdobeImageHighlightImageButton)getOptionView().findViewById(R.id.button2));
    mErase = ((AdobeImageHighlightImageButton)getOptionView().findViewById(R.id.button3));
    mFree.setOnCheckedChangeListener(this);
    mSmart.setOnCheckedChangeListener(this);
    mErase.setOnCheckedChangeListener(this);
    mImageView = ((ImageViewSpotDraw)getContentView().findViewById(R.id.image));
    ((ImageViewSpotDraw)mImageView).setBrushSize((int)(i * 1.5F));
    ((ImageViewSpotDraw)mImageView).setDrawLimit(0.0D);
    ((ImageViewSpotDraw)mImageView).setPaintEnabled(false);
    mImageView.setDisplayType(ImageViewTouchBase.DisplayType.FIT_IF_BIGGER);
    mDisabledStatusView = getOptionView().findViewById(R.id.disabled_status);
    mFilter = createFilter();
    mBackgroundDrawThread = new BackgroundDrawThread("draw-thread", 5, mFilter, mThreadHandler, 1.5D);
  }
  
  public void onDeactivate()
  {
    mFree.setOnCheckedChangeListener(null);
    mSmart.setOnCheckedChangeListener(null);
    mErase.setOnCheckedChangeListener(null);
    mLensButton.setOnClickListener(null);
    ((ImageViewSpotDraw)mImageView).setOnDrawStartListener(null);
    if (mBackgroundDrawThread != null)
    {
      mBackgroundDrawThread.clear();
      if (mBackgroundDrawThread.isAlive())
      {
        mBackgroundDrawThread.quit();
        while (mBackgroundDrawThread.isAlive()) {
          logger.log("isAlive...");
        }
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
    mBackgroundDrawThread.pathStart(paramFloat / 1.5F, paramArrayOfFloat, mBrushType);
    mToolAction.setValue(mBrushType.name());
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
    onComplete(mPreview, mFilter.getActions());
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
        break label71;
      }
    }
    label51:
    label71:
    for (int i = 4;; i = 0)
    {
      localView.setVisibility(i);
      return;
      setToolbarTitle(getContext().getBaseContext().getString(R.string.feather_zoom_mode));
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
        ColorSplashPanel.this.onComplete(mPreview, paramMoaActionList);
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
