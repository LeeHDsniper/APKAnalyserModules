package com.adobe.creativesdk.aviary.panels;

import android.app.ProgressDialog;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import com.adobe.creativesdk.aviary.AdobeImageEditorActivity;
import com.adobe.creativesdk.aviary.internal.AdobeImageEditorController;
import com.adobe.creativesdk.aviary.internal.content.ToolEntry;
import com.adobe.creativesdk.aviary.internal.filters.EnhanceFilter;
import com.adobe.creativesdk.aviary.internal.filters.EnhanceFilter.Types;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory.Tools;
import com.adobe.creativesdk.aviary.internal.headless.moa.Moa;
import com.adobe.creativesdk.aviary.internal.os.AdobeImageAsyncTask;
import com.adobe.creativesdk.aviary.internal.tracking.AdobeImageAnalyticsTracker;
import com.adobe.creativesdk.aviary.internal.utils.ApiHelper;
import com.adobe.creativesdk.aviary.internal.utils.BitmapUtils;
import com.adobe.creativesdk.aviary.internal.vo.EditToolResultVO;
import com.adobe.creativesdk.aviary.internal.vo.ToolActionVO;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.widget.AdobeImageHighlightImageButton;
import com.adobe.creativesdk.aviary.widget.AdobeImageHighlightImageButton.OnCheckedChangeListener;
import com.aviary.android.feather.sdk.R.id;
import com.aviary.android.feather.sdk.R.layout;
import com.aviary.android.feather.sdk.R.string;
import java.util.HashMap;
import org.json.JSONException;

public class EnhanceEffectPanel
  extends AbstractOptionPanel
  implements AdobeImageHighlightImageButton.OnCheckedChangeListener
{
  boolean enableFastPreview = false;
  private AdobeImageHighlightImageButton mButton1;
  private AdobeImageHighlightImageButton mButton2;
  private AdobeImageHighlightImageButton mButton3;
  private AdobeImageHighlightImageButton mCurrent;
  private RenderTask mCurrentTask;
  private ToolLoaderFactory.Tools mFilterType;
  volatile boolean mIsRendering = false;
  
  public EnhanceEffectPanel(AdobeImageEditorController paramAdobeImageEditorController, ToolEntry paramToolEntry, ToolLoaderFactory.Tools paramTools)
  {
    super(paramAdobeImageEditorController, paramToolEntry);
    mFilterType = paramTools;
  }
  
  private void buttonClick(String paramString, boolean paramBoolean)
  {
    logger.info("buttonClick: %s, %b", new Object[] { paramString, Boolean.valueOf(paramBoolean) });
    EnhanceFilter.Types localTypes = EnhanceFilter.Types.HiDef;
    killCurrentTask();
    int i = -1;
    switch (paramString.hashCode())
    {
    default: 
      switch (i)
      {
      default: 
        paramString = EnhanceFilter.Types.ColorFix;
      }
      break;
    }
    for (;;)
    {
      if (paramBoolean) {
        break label214;
      }
      BitmapUtils.copy(mBitmap, mPreview);
      onPreviewChanged(mPreview, false, true);
      mEditResult.setActionList(null);
      mEditResult.setToolAction(null);
      mTrackingAttributes.clear();
      setIsChanged(false);
      return;
      if (!paramString.equals("enhance_hi_def")) {
        break;
      }
      i = 0;
      break;
      if (!paramString.equals("enhance_illuminate")) {
        break;
      }
      i = 1;
      break;
      if (!paramString.equals("enhance_color_fix")) {
        break;
      }
      i = 2;
      break;
      paramString = EnhanceFilter.Types.HiDef;
      continue;
      paramString = EnhanceFilter.Types.Illuminate;
    }
    label214:
    setIsChanged(true);
    mIsRendering = true;
    mCurrentTask = new RenderTask();
    mCurrentTask.execute(new EnhanceFilter.Types[] { paramString });
    mTrackingAttributes.put("name", paramString.name());
    getContext().getTracker().tagEvent("enhance: option_selected", new String[] { "name", paramString.name() });
  }
  
  private void killCurrentTask()
  {
    if (mCurrentTask != null) {}
    synchronized (mCurrentTask)
    {
      mCurrentTask.cancel(true);
      mCurrentTask.renderFilter.stop();
      onProgressEnd();
      mIsRendering = false;
      mCurrentTask = null;
      return;
    }
  }
  
  protected ViewGroup generateOptionView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup)
  {
    return (ViewGroup)paramLayoutInflater.inflate(R.layout.com_adobe_image_bottombar_panel_enhance, paramViewGroup, false);
  }
  
  public void onActivate()
  {
    super.onActivate();
    mPreview = BitmapUtils.copy(mBitmap, Bitmap.Config.ARGB_8888);
    enableFastPreview = ApiHelper.fastPreviewEnabled();
    if (hasOptions())
    {
      String str = getOptions().getString("quick-stringValue");
      logger.log("stringValue: %s", new Object[] { str });
      if (str != null)
      {
        AdobeImageHighlightImageButton localAdobeImageHighlightImageButton = (AdobeImageHighlightImageButton)getOptionView().findViewWithTag(str);
        if (localAdobeImageHighlightImageButton != null)
        {
          logger.log("button found: %s", new Object[] { localAdobeImageHighlightImageButton });
          localAdobeImageHighlightImageButton.setChecked(true);
          buttonClick(str, true);
        }
      }
    }
  }
  
  public boolean onBackPressed()
  {
    killCurrentTask();
    return super.onBackPressed();
  }
  
  public boolean onCancel()
  {
    killCurrentTask();
    return super.onCancel();
  }
  
  public void onCancelled()
  {
    killCurrentTask();
    mIsRendering = false;
    super.onCancelled();
  }
  
  public void onCheckedChanged(AdobeImageHighlightImageButton paramAdobeImageHighlightImageButton, boolean paramBoolean1, boolean paramBoolean2)
  {
    logger.info("onCheckedChanged: %b, fromUser: %b", new Object[] { Boolean.valueOf(paramBoolean1), Boolean.valueOf(paramBoolean2) });
    if ((mCurrent != null) && (!paramAdobeImageHighlightImageButton.equals(mCurrent))) {
      mCurrent.setChecked(false);
    }
    mCurrent = paramAdobeImageHighlightImageButton;
    if ((!isActive()) || (!isEnabled()) || (!paramBoolean2)) {
      return;
    }
    buttonClick((String)paramAdobeImageHighlightImageButton.getTag(), paramBoolean1);
  }
  
  public void onCreate(Bitmap paramBitmap, Bundle paramBundle)
  {
    super.onCreate(paramBitmap, paramBundle);
    paramBitmap = getOptionView();
    mButton1 = ((AdobeImageHighlightImageButton)paramBitmap.findViewById(R.id.button1));
    mButton1.setOnCheckedChangeListener(this);
    if (mButton1.isChecked()) {
      mCurrent = mButton1;
    }
    mButton2 = ((AdobeImageHighlightImageButton)paramBitmap.findViewById(R.id.button2));
    mButton2.setOnCheckedChangeListener(this);
    if (mButton2.isChecked()) {
      mCurrent = mButton2;
    }
    mButton3 = ((AdobeImageHighlightImageButton)paramBitmap.findViewById(R.id.button3));
    mButton3.setOnCheckedChangeListener(this);
    if (mButton3.isChecked()) {
      mCurrent = mButton3;
    }
  }
  
  public void onDeactivate()
  {
    super.onDeactivate();
    mButton1.setOnCheckedChangeListener(null);
    mButton2.setOnCheckedChangeListener(null);
    mButton3.setOnCheckedChangeListener(null);
  }
  
  protected void onGenerateResult()
  {
    if (mIsRendering)
    {
      new GenerateResultTask().execute(new Void[0]);
      return;
    }
    onComplete(mPreview);
  }
  
  protected void onProgressEnd()
  {
    if (!enableFastPreview)
    {
      onProgressModalEnd();
      return;
    }
    super.onProgressEnd();
  }
  
  protected void onProgressStart()
  {
    if (!enableFastPreview)
    {
      onProgressModalStart();
      return;
    }
    super.onProgressStart();
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
  
  class RenderTask
    extends AdobeImageAsyncTask<EnhanceFilter.Types, Void, Bitmap>
  {
    String mError = null;
    volatile EnhanceFilter renderFilter = (EnhanceFilter)ToolLoaderFactory.get(mFilterType);
    
    public RenderTask() {}
    
    protected Bitmap doInBackground(EnhanceFilter.Types... paramVarArgs)
    {
      if (isCancelled())
      {
        logger.warn("cancelled...");
        paramVarArgs = null;
      }
      for (;;)
      {
        return paramVarArgs;
        EnhanceFilter.Types localTypes = paramVarArgs[0];
        renderFilter.setType(localTypes);
        try
        {
          paramVarArgs = renderFilter.execute(mBitmap, mPreview, 1, 1);
          mEditResult.setActionList(renderFilter.getActions());
          mEditResult.setToolAction(new ToolActionVO(localTypes.name()));
          if (isCancelled())
          {
            logger.warn("cancelled...");
            return null;
          }
        }
        catch (JSONException paramVarArgs)
        {
          paramVarArgs.printStackTrace();
          mError = paramVarArgs.getMessage();
        }
      }
      return null;
    }
    
    protected void doPostExecute(Bitmap paramBitmap)
    {
      if (!isActive())
      {
        logger.warn("not active...");
        return;
      }
      onProgressEnd();
      if (isCancelled())
      {
        logger.warn("cancelled...");
        return;
      }
      if (paramBitmap != null)
      {
        Moa.notifyPixelsChanged(mPreview);
        onPreviewChanged(mPreview, false, true);
      }
      for (;;)
      {
        mIsRendering = false;
        EnhanceEffectPanel.access$102(EnhanceEffectPanel.this, null);
        return;
        if (mError != null) {
          onGenericError(mError, 17039370, null);
        }
      }
    }
    
    protected void doPreExecute()
    {
      onProgressStart();
    }
    
    protected void onCancelled()
    {
      renderFilter.stop();
      super.onCancelled();
    }
  }
}
