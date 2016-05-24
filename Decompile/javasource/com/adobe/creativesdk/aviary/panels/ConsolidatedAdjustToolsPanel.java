package com.adobe.creativesdk.aviary.panels;

import android.app.ProgressDialog;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.os.Bundle;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v4.view.ViewPager.SimpleOnPageChangeListener;
import android.util.SparseIntArray;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.SeekBar;
import android.widget.SeekBar.OnSeekBarChangeListener;
import com.adobe.android.ui.utils.UIUtils;
import com.adobe.creativesdk.aviary.AdobeImageEditorActivity;
import com.adobe.creativesdk.aviary.internal.AdobeImageEditorController;
import com.adobe.creativesdk.aviary.internal.content.ToolEntry;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory.Tools;
import com.adobe.creativesdk.aviary.internal.graphics.drawable.FakeBitmapDrawable;
import com.adobe.creativesdk.aviary.internal.headless.filters.IFilter;
import com.adobe.creativesdk.aviary.internal.headless.filters.INativeFilter;
import com.adobe.creativesdk.aviary.internal.headless.filters.NativeFilter;
import com.adobe.creativesdk.aviary.internal.headless.filters.impl.AdjustColorFilter;
import com.adobe.creativesdk.aviary.internal.headless.filters.impl.AdjustExposureFilter;
import com.adobe.creativesdk.aviary.internal.headless.filters.impl.AdjustSliderFilter;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionList;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaResult;
import com.adobe.creativesdk.aviary.internal.os.AdobeImageAsyncTask;
import com.adobe.creativesdk.aviary.internal.tracking.AdobeImageAnalyticsTracker;
import com.adobe.creativesdk.aviary.internal.utils.BitmapUtils;
import com.adobe.creativesdk.aviary.internal.vo.EditToolResultVO;
import com.adobe.creativesdk.aviary.internal.vo.ToolActionVO;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.widget.AdobeImageToggleButton;
import com.aviary.android.feather.sdk.R.id;
import com.aviary.android.feather.sdk.R.layout;
import com.aviary.android.feather.sdk.R.string;
import java.util.HashMap;
import java.util.Locale;

public class ConsolidatedAdjustToolsPanel
  extends AbstractOptionPanel
  implements View.OnClickListener, SeekBar.OnSeekBarChangeListener
{
  MoaActionList mActions;
  ViewPagerAdapter mAdapter;
  SparseIntArray mAdjustToolValues = new SparseIntArray();
  SeekBar mCurrentSeekBar;
  ApplyFilterTask mCurrentTask;
  private int mCurrentToolId = 0;
  boolean mFirstLaunch = true;
  volatile boolean mIsRendering = false;
  final ToolActionVO<Float> mToolAction = new ToolActionVO();
  ViewPager mViewPager;
  AdobeImageToggleButton tool1;
  AdobeImageToggleButton tool2;
  AdobeImageToggleButton tool3;
  AdobeImageToggleButton tool4;
  
  public ConsolidatedAdjustToolsPanel(AdobeImageEditorController paramAdobeImageEditorController, ToolEntry paramToolEntry)
  {
    super(paramAdobeImageEditorController, paramToolEntry);
  }
  
  private void changeSeekBarToCurrent(int paramInt)
  {
    if (mCurrentSeekBar == null) {
      return;
    }
    switch (paramInt)
    {
    default: 
      return;
    case 0: 
      mCurrentSeekBar.setProgress(mAdjustToolValues.get(0));
      return;
    case 2: 
      mCurrentSeekBar.setProgress(mAdjustToolValues.get(2));
      return;
    case 1: 
      mCurrentSeekBar.setProgress(mAdjustToolValues.get(1));
      return;
    }
    mCurrentSeekBar.setProgress(mAdjustToolValues.get(3));
  }
  
  private String getToolName(int paramInt)
  {
    if (getName() == ToolLoaderFactory.Tools.LIGHTING) {
      return AdjustExposureFilter.getToolName(paramInt);
    }
    if (getName() == ToolLoaderFactory.Tools.COLOR) {
      return AdjustColorFilter.getToolName(paramInt);
    }
    return "invalid";
  }
  
  private void initializeAdapterTint(ViewPagerAdapter paramViewPagerAdapter)
  {
    if (!getContext().hasAccentColor()) {
      return;
    }
    accentColor = getContext().getAccentColor(0);
  }
  
  private void setToolSelected(int paramInt)
  {
    mViewPager.setCurrentItem(paramInt);
    switch (paramInt)
    {
    default: 
      if (paramInt != mCurrentToolId) {
        switch (mCurrentToolId)
        {
        }
      }
      break;
    }
    for (;;)
    {
      mCurrentToolId = paramInt;
      return;
      tool1.setChecked(true);
      break;
      tool2.setChecked(true);
      break;
      tool3.setChecked(true);
      break;
      tool4.setChecked(true);
      break;
      tool1.setChecked(false);
      continue;
      tool2.setChecked(false);
      continue;
      tool3.setChecked(false);
      continue;
      tool4.setChecked(false);
    }
  }
  
  private void updateToolLabels()
  {
    if (getName() == ToolLoaderFactory.Tools.LIGHTING)
    {
      tool1.setText(R.string.feather_brightness);
      tool2.setText(R.string.feather_contrast);
      tool3.setText(R.string.feather_tool_highlight);
      tool4.setText(R.string.feather_tool_shadow);
    }
    if (getName() == ToolLoaderFactory.Tools.COLOR)
    {
      tool1.setText(R.string.feather_saturation);
      tool2.setText(R.string.feather_tool_temperature);
      tool3.setText(R.string.feather_tool_tint);
      tool4.setText(R.string.feather_tool_fade);
    }
  }
  
  private void updatedToolValue(int paramInt1, int paramInt2)
  {
    mAdjustToolValues.put(paramInt1, paramInt2);
  }
  
  protected void applyFilter(boolean paramBoolean1, boolean paramBoolean2)
  {
    mIsRendering = true;
    mCurrentTask = new ApplyFilterTask(paramBoolean1, paramBoolean2);
    mCurrentTask.execute(new Bitmap[] { mBitmap });
    setIsChanged(true);
  }
  
  double convertValue(float paramFloat)
  {
    return (paramFloat - 50.0F) * 2.0F;
  }
  
  protected ViewGroup generateOptionView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup)
  {
    return (ViewGroup)paramLayoutInflater.inflate(R.layout.com_adobe_image_bottombar_panel_adjustements, paramViewGroup, false);
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
  
  public void onClick(View paramView)
  {
    if (paramView == null) {}
    int i;
    do
    {
      return;
      i = paramView.getId();
      if (i == R.id.tool1)
      {
        setToolSelected(0);
        getContext().getTracker().tagEvent(getName().name().toLowerCase(Locale.US) + ": option_selected", new String[] { "name", getToolName(0) });
        return;
      }
      if (i == R.id.tool2)
      {
        setToolSelected(1);
        getContext().getTracker().tagEvent(getName().name().toLowerCase(Locale.US) + "adjust: option_selected", new String[] { "name", getToolName(1) });
        return;
      }
      if (i == R.id.tool3)
      {
        setToolSelected(2);
        getContext().getTracker().tagEvent(getName().name().toLowerCase(Locale.US) + ": option_selected", new String[] { "name", getToolName(2) });
        return;
      }
    } while (i != R.id.tool4);
    setToolSelected(3);
    getContext().getTracker().tagEvent(getName().name().toLowerCase(Locale.US) + ": option_selected", new String[] { "name", getToolName(3) });
  }
  
  protected void onComplete(Bitmap paramBitmap, EditToolResultVO paramEditToolResultVO)
  {
    paramEditToolResultVO.setToolAction(mToolAction);
    paramEditToolResultVO.setActionList(mActions);
    int j = 0;
    int i = 0;
    if (i < 4)
    {
      if (convertValue(mAdjustToolValues.get(i)) != 0.0D)
      {
        mTrackingAttributes.put(getToolName(i), "true");
        j += 1;
      }
      for (;;)
      {
        i += 1;
        break;
        mTrackingAttributes.put(getToolName(i), "false");
      }
    }
    mTrackingAttributes.put("item_count", String.valueOf(j));
    super.onComplete(paramBitmap, paramEditToolResultVO);
  }
  
  public void onCreate(Bitmap paramBitmap, Bundle paramBundle)
  {
    super.onCreate(paramBitmap, paramBundle);
    mAdapter = new ViewPagerAdapter(getContext().getBaseContext());
    initializeAdapterTint(mAdapter);
    mViewPager = ((ViewPager)getOptionView().findViewById(R.id.pager));
    mViewPager.setAdapter(mAdapter);
    mViewPager.setOnPageChangeListener(new ViewPager.SimpleOnPageChangeListener()
    {
      public void onPageSelected(int paramAnonymousInt)
      {
        logger.info("onPageSelected: %d", new Object[] { Integer.valueOf(paramAnonymousInt) });
        mCurrentSeekBar = ((SeekBar)mViewPager.findViewWithTag(Integer.valueOf(paramAnonymousInt)));
        ConsolidatedAdjustToolsPanel.this.changeSeekBarToCurrent(paramAnonymousInt);
      }
    });
    tool1 = ((AdobeImageToggleButton)getOptionView().findViewById(R.id.tool1));
    tool2 = ((AdobeImageToggleButton)getOptionView().findViewById(R.id.tool2));
    tool3 = ((AdobeImageToggleButton)getOptionView().findViewById(R.id.tool3));
    tool4 = ((AdobeImageToggleButton)getOptionView().findViewById(R.id.tool4));
    updateToolLabels();
    tool1.setOnClickListener(this);
    tool2.setOnClickListener(this);
    tool3.setOnClickListener(this);
    tool4.setOnClickListener(this);
    mAdjustToolValues.put(0, 50);
    mAdjustToolValues.put(1, 50);
    mAdjustToolValues.put(3, 50);
    mAdjustToolValues.put(2, 50);
    setToolSelected(0);
    changeSeekBarToCurrent(0);
  }
  
  public void onDeactivate()
  {
    onProgressEnd();
    super.onDeactivate();
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
  
  public final void onProgressChanged(SeekBar paramSeekBar, int paramInt, boolean paramBoolean)
  {
    onSliderChanged(paramInt, paramBoolean);
  }
  
  protected void onSliderChanged(int paramInt, boolean paramBoolean)
  {
    logger.info("onSliderChanged: " + paramInt + ", fromUser: " + paramBoolean);
    updatedToolValue(mViewPager.getCurrentItem(), paramInt);
    if (mCurrentTask == null) {
      if (paramBoolean) {
        break label71;
      }
    }
    label71:
    for (paramBoolean = true;; paramBoolean = false)
    {
      applyFilter(paramBoolean, true);
      return;
    }
  }
  
  protected void onSliderEnd(int paramInt)
  {
    logger.info("onSliderEnd: " + paramInt);
    killCurrentTask(false);
    onProgressEnd();
    applyFilter(false, false);
  }
  
  protected void onSliderStart(int paramInt)
  {
    onProgressStart();
  }
  
  public final void onStartTrackingTouch(SeekBar paramSeekBar)
  {
    onSliderStart(paramSeekBar.getProgress());
  }
  
  public final void onStopTrackingTouch(SeekBar paramSeekBar)
  {
    onSliderEnd(paramSeekBar.getProgress());
  }
  
  protected void setValue(int paramInt)
  {
    mCurrentSeekBar.setProgress(paramInt);
  }
  
  class ApplyFilterTask
    extends AdobeImageAsyncTask<Bitmap, Void, Bitmap>
  {
    IFilter filter;
    boolean isPreview;
    Bitmap mCurrentBitmap;
    MoaResult mResult;
    boolean mShowProgress;
    
    public ApplyFilterTask(boolean paramBoolean1, boolean paramBoolean2)
    {
      isPreview = paramBoolean2;
      mShowProgress = paramBoolean1;
      filter = ToolLoaderFactory.get(getName());
      if (filter != null)
      {
        ((AdjustSliderFilter)filter).setAdjustTool(0, convertValue(mAdjustToolValues.get(0)));
        ((AdjustSliderFilter)filter).setAdjustTool(1, convertValue(mAdjustToolValues.get(1)));
        ((AdjustSliderFilter)filter).setAdjustTool(2, convertValue(mAdjustToolValues.get(2)));
        ((AdjustSliderFilter)filter).setAdjustTool(3, convertValue(mAdjustToolValues.get(3)));
      }
    }
    
    private Bitmap acquireBitmap(boolean paramBoolean)
    {
      if (paramBoolean)
      {
        Bitmap localBitmap = Bitmap.createBitmap(mBitmap.getWidth() / 3, mBitmap.getHeight() / 3, mBitmap.getConfig());
        BitmapUtils.copy(mBitmap, localBitmap);
        return localBitmap;
      }
      return Bitmap.createBitmap(mBitmap.getWidth(), mBitmap.getHeight(), mBitmap.getConfig());
    }
    
    protected Bitmap doInBackground(Bitmap... paramVarArgs)
    {
      if ((isCancelled()) || (filter == null)) {
        return null;
      }
      mCurrentBitmap = acquireBitmap(isPreview);
      if (isCancelled()) {
        return null;
      }
      try
      {
        if (isPreview) {}
        for (mResult = ((INativeFilter)filter).prepare(mCurrentBitmap, mCurrentBitmap, 1, 1);; mResult = ((INativeFilter)filter).prepare(mBitmap, mCurrentBitmap, 1, 1))
        {
          mResult.execute();
          if (!isCancelled()) {
            break;
          }
          return null;
        }
        mActions = ((NativeFilter)filter).getActions();
      }
      catch (Throwable paramVarArgs)
      {
        paramVarArgs.printStackTrace();
        return null;
      }
      if (isCancelled()) {
        return null;
      }
      return mCurrentBitmap;
    }
    
    protected void doPostExecute(Bitmap paramBitmap)
    {
      logger.info("onPostExecute, isPreview: %b", new Object[] { Boolean.valueOf(isPreview) });
      if (!isActive()) {
        return;
      }
      if (mShowProgress) {
        onProgressEnd();
      }
      if ((paramBitmap != null) && (!isCancelled())) {
        if (isPreview)
        {
          FakeBitmapDrawable localFakeBitmapDrawable = new FakeBitmapDrawable(paramBitmap, mBitmap.getWidth(), mBitmap.getHeight());
          onPreviewChanged(localFakeBitmapDrawable, false, true);
          setIsChanged(true);
          mPreview = paramBitmap;
        }
      }
      for (;;)
      {
        if (!isPreview) {
          mIsRendering = false;
        }
        mCurrentTask = null;
        return;
        onPreviewChanged(paramBitmap, false, true);
        break;
        BitmapUtils.copy(mBitmap, mPreview);
        onPreviewChanged(mPreview, false, true);
        setIsChanged(false);
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
      logger.info("GenerateResultTask::PostExecute");
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
  
  class ViewPagerAdapter
    extends PagerAdapter
  {
    int accentColor;
    final LayoutInflater inflater;
    
    ViewPagerAdapter(Context paramContext)
    {
      inflater = LayoutInflater.from(paramContext);
    }
    
    public void destroyItem(ViewGroup paramViewGroup, int paramInt, Object paramObject)
    {
      paramViewGroup.removeView((View)paramObject);
    }
    
    public int getCount()
    {
      return 4;
    }
    
    public Object instantiateItem(ViewGroup paramViewGroup, int paramInt)
    {
      View localView = inflater.inflate(R.layout.com_adobe_image_bottombar_adjustement_slider_layout, paramViewGroup, false);
      SeekBar localSeekBar = (SeekBar)localView.findViewById(R.id.seekbar);
      if (accentColor != 0) {
        UIUtils.setSeekBarProgressTint(localSeekBar, accentColor);
      }
      switch (paramInt)
      {
      }
      for (;;)
      {
        localSeekBar.setOnSeekBarChangeListener(ConsolidatedAdjustToolsPanel.this);
        localSeekBar.setTag(Integer.valueOf(paramInt));
        paramViewGroup.addView(localView, 0);
        return localView;
        localSeekBar.setProgress(mAdjustToolValues.get(0));
        if (mFirstLaunch)
        {
          mCurrentSeekBar = localSeekBar;
          mFirstLaunch = false;
          continue;
          localSeekBar.setProgress(mAdjustToolValues.get(2));
          continue;
          localSeekBar.setProgress(mAdjustToolValues.get(1));
          continue;
          localSeekBar.setProgress(mAdjustToolValues.get(3));
        }
      }
    }
    
    public boolean isViewFromObject(View paramView, Object paramObject)
    {
      return paramView == paramObject;
    }
  }
}
