package com.adobe.creativesdk.aviary.panels;

import android.app.ProgressDialog;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.os.Bundle;
import com.adobe.creativesdk.aviary.AdobeImageEditorActivity;
import com.adobe.creativesdk.aviary.internal.AdobeImageEditorController;
import com.adobe.creativesdk.aviary.internal.content.ToolEntry;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory.Tools;
import com.adobe.creativesdk.aviary.internal.graphics.drawable.FakeBitmapDrawable;
import com.adobe.creativesdk.aviary.internal.headless.filters.IFilter;
import com.adobe.creativesdk.aviary.internal.headless.filters.INativeRangeFilter;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionList;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaFloatParameter;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaResult;
import com.adobe.creativesdk.aviary.internal.os.AdobeImageAsyncTask;
import com.adobe.creativesdk.aviary.internal.utils.BitmapUtils;
import com.adobe.creativesdk.aviary.internal.vo.EditToolResultVO;
import com.adobe.creativesdk.aviary.internal.vo.ToolActionVO;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.aviary.android.feather.sdk.R.string;

public class NativeEffectRangePanel
  extends AbstractSeekbarOptionPanel
{
  private MoaActionList mActions;
  private ApplyFilterTask mCurrentTask;
  volatile boolean mIsRendering = false;
  private Bitmap mPreviewSmallBitmap;
  private FakeBitmapDrawable mPreviewSmallDrawable;
  private final ToolActionVO<Float> mToolAction;
  
  public NativeEffectRangePanel(AdobeImageEditorController paramAdobeImageEditorController, ToolEntry paramToolEntry, ToolLoaderFactory.Tools paramTools)
  {
    super(paramAdobeImageEditorController, paramToolEntry, paramTools);
    mFilter = ToolLoaderFactory.get(paramTools);
    mToolAction = new ToolActionVO();
  }
  
  private Bitmap acquireBitmap(int paramInt)
  {
    Bitmap localBitmap = Bitmap.createBitmap(mBitmap.getWidth() / paramInt, mBitmap.getHeight() / paramInt, mBitmap.getConfig());
    BitmapUtils.copy(mBitmap, localBitmap);
    return localBitmap;
  }
  
  protected void applyFilter(float paramFloat, boolean paramBoolean1, boolean paramBoolean2)
  {
    logger.info("applyFilter: " + paramFloat);
    if (paramFloat == 0.0F)
    {
      killCurrentTask(false);
      BitmapUtils.copy(mBitmap, mPreview);
      mPreviewSmallDrawable.updateBitmap(mPreview, mPreview.getWidth(), mPreview.getHeight());
      onPreviewUpdated();
      mIsRendering = false;
      setIsChanged(false);
      return;
    }
    mIsRendering = true;
    mCurrentTask = new ApplyFilterTask(paramFloat, paramBoolean1, paramBoolean2);
    mCurrentTask.execute(new Bitmap[] { mBitmap });
    setIsChanged(true);
  }
  
  boolean killCurrentTask(boolean paramBoolean)
  {
    if ((mCurrentTask != null) && (mCurrentTask.cancel(true)))
    {
      mIsRendering = false;
      if (paramBoolean) {
        onProgressEnd();
      }
      return true;
    }
    return false;
  }
  
  public void onActivate()
  {
    super.onActivate();
    mPreview = BitmapUtils.copy(mBitmap, Bitmap.Config.ARGB_8888);
    mPreviewSmallBitmap = acquireBitmap(3);
    mPreviewSmallDrawable = new FakeBitmapDrawable(mPreview, mPreview.getWidth(), mPreview.getHeight());
    onPreviewChanged(mPreviewSmallDrawable, false, true);
    setIsChanged(false);
    if (hasOptions())
    {
      Bundle localBundle = getOptions();
      if (localBundle.containsKey("quick-numericValue")) {
        setValue(localBundle.getInt("quick-numericValue", 0));
      }
    }
  }
  
  public boolean onBackPressed()
  {
    killCurrentTask(true);
    return super.onBackPressed();
  }
  
  public void onCancelled()
  {
    killCurrentTask(true);
    mIsRendering = false;
    super.onCancelled();
  }
  
  protected void onComplete(Bitmap paramBitmap, EditToolResultVO paramEditToolResultVO)
  {
    paramEditToolResultVO.setToolAction(mToolAction);
    paramEditToolResultVO.setActionList(mActions);
    super.onComplete(paramBitmap, paramEditToolResultVO);
  }
  
  public void onCreate(Bitmap paramBitmap, Bundle paramBundle)
  {
    super.onCreate(paramBitmap, paramBundle);
  }
  
  public void onDeactivate()
  {
    onProgressEnd();
    super.onDeactivate();
  }
  
  protected void onDispose()
  {
    super.onDispose();
    if ((mPreviewSmallBitmap != null) && (!mPreviewSmallBitmap.isRecycled()))
    {
      mPreviewSmallBitmap.recycle();
      mPreviewSmallBitmap = null;
    }
  }
  
  protected void onGenerateResult()
  {
    logger.info("onGenerateResult: " + mIsRendering);
    if (mIsRendering)
    {
      new GenerateResultTask().execute(new Void[0]);
      return;
    }
    onComplete(mPreview);
  }
  
  protected void onSliderChanged(int paramInt, boolean paramBoolean)
  {
    logger.info("onSliderChanged: " + paramInt + ", fromUser: " + paramBoolean);
    float f;
    if (mCurrentTask == null)
    {
      f = (paramInt - 50) * 2;
      if (paramBoolean) {
        break label67;
      }
    }
    label67:
    for (paramBoolean = true;; paramBoolean = false)
    {
      applyFilter(f, paramBoolean, true);
      return;
    }
  }
  
  protected void onSliderEnd(int paramInt)
  {
    logger.info("onSliderEnd: " + paramInt);
    killCurrentTask(false);
    onProgressEnd();
    applyFilter((paramInt - 50) * 2, false, false);
  }
  
  protected void onSliderStart(int paramInt)
  {
    onProgressStart();
  }
  
  class ApplyFilterTask
    extends AdobeImageAsyncTask<Bitmap, Void, Bitmap>
  {
    IFilter filter;
    boolean isPreview;
    Bitmap mCurrentBitmap;
    MoaResult mResult;
    boolean mShowProgress;
    
    public ApplyFilterTask(float paramFloat, boolean paramBoolean1, boolean paramBoolean2)
    {
      isPreview = paramBoolean2;
      mShowProgress = paramBoolean1;
      if (mFilter != null)
      {
        filter = ToolLoaderFactory.get(getName());
        ((INativeRangeFilter)filter).setValue(Float.valueOf(paramFloat));
      }
    }
    
    protected Bitmap doInBackground(Bitmap... paramVarArgs)
    {
      if ((isCancelled()) || (filter == null)) {
        return null;
      }
      try
      {
        if ((isPreview) && (mPreviewSmallBitmap != null)) {
          mCurrentBitmap = Bitmap.createBitmap(mPreviewSmallBitmap.getWidth(), mPreviewSmallBitmap.getHeight(), mPreviewSmallBitmap.getConfig());
        }
        for (mResult = ((INativeRangeFilter)filter).prepare(mPreviewSmallBitmap, mCurrentBitmap, 1, 1);; mResult = ((INativeRangeFilter)filter).prepare(mBitmap, mPreview, 1, 1))
        {
          mResult.execute();
          if (!isCancelled()) {
            break;
          }
          logger.warn("isCancelled... return null");
          return null;
        }
        mToolAction.setValue(((INativeRangeFilter)filter).getValue().getValue());
      }
      catch (Throwable paramVarArgs)
      {
        paramVarArgs.printStackTrace();
        return null;
      }
      NativeEffectRangePanel.access$202(NativeEffectRangePanel.this, ((INativeRangeFilter)filter).getActions());
      if (isCancelled()) {
        return null;
      }
      return mResult.outputBitmap;
    }
    
    protected void doPostExecute(Bitmap paramBitmap)
    {
      logger.info("onPostExecute, isPreview: %b, result: %s", new Object[] { Boolean.valueOf(isPreview), paramBitmap });
      if (!isActive()) {
        return;
      }
      if (mShowProgress) {
        onProgressEnd();
      }
      if ((paramBitmap != null) && (!isCancelled()))
      {
        logger.log("result size: %dx%d", new Object[] { Integer.valueOf(paramBitmap.getWidth()), Integer.valueOf(paramBitmap.getHeight()) });
        mPreviewSmallDrawable.updateBitmap(paramBitmap, mBitmap.getWidth(), mBitmap.getHeight());
        onPreviewUpdated();
        if (!isPreview) {
          setIsChanged(true);
        }
      }
      for (;;)
      {
        if (!isPreview) {
          mIsRendering = false;
        }
        NativeEffectRangePanel.access$402(NativeEffectRangePanel.this, null);
        return;
        logger.warn("result == null || isCancelled");
      }
    }
    
    protected void doPreExecute()
    {
      if ((filter != null) && (mShowProgress)) {
        onProgressStart();
      }
    }
    
    protected void onCancelled()
    {
      super.onCancelled();
      if (mResult != null) {
        mResult.cancel();
      }
      if ((mCurrentBitmap != null) && (!mCurrentBitmap.isRecycled())) {
        mCurrentBitmap.recycle();
      }
    }
  }
  
  class GenerateResultTask
    extends AdobeImageAsyncTask<Void, Void, Void>
  {
    ProgressDialog mProgress = new ProgressDialog(getContext().getBaseContext());
    
    GenerateResultTask() {}
    
    protected Void doInBackground(Void... paramVarArgs)
    {
      logger.info("GenerateResultTask::doInBackground", new Object[] { Boolean.valueOf(mIsRendering) });
      while (mIsRendering) {}
      return null;
    }
    
    protected void doPostExecute(Void paramVoid)
    {
      logger.info("GenerateResultTask::doPostExecute");
      if (getContext().getBaseActivity().isFinishing()) {
        return;
      }
      if (mProgress.isShowing()) {
        mProgress.dismiss();
      }
      onComplete(mPreview);
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
