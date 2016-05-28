package com.adobe.creativesdk.aviary.panels;

import android.content.DialogInterface.OnClickListener;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Handler;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.adobe.creativesdk.aviary.internal.AdobeImageEditorController;
import com.adobe.creativesdk.aviary.internal.content.ToolEntry;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory.Tools;
import com.adobe.creativesdk.aviary.internal.headless.filters.IFilter;
import com.adobe.creativesdk.aviary.internal.tracking.AdobeImageAnalyticsTracker;
import com.adobe.creativesdk.aviary.internal.vo.EditToolResultVO;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.log.LoggerFactory.LoggerType;
import com.adobe.creativesdk.aviary.utils.EventBusUtils;
import de.greenrobot.event.EventBus;
import java.util.HashMap;

public abstract class AbstractPanel
{
  private final Handler handlerBase = new Handler();
  protected LoggerFactory.Logger logger;
  private boolean mActive;
  protected Bitmap mBitmap;
  protected boolean mChanged;
  private boolean mCreated;
  protected final EditToolResultVO mEditResult;
  protected boolean mEnabled;
  private ToolLoaderFactory.Tools mEntryName;
  protected OnErrorListener mErrorListener;
  protected IFilter mFilter;
  private AdobeImageEditorController mFilterContext;
  private Bundle mOptions;
  protected Bitmap mPreview;
  protected boolean mSaving;
  protected HashMap<String, String> mTrackingAttributes;
  
  public AbstractPanel(AdobeImageEditorController paramAdobeImageEditorController, ToolEntry paramToolEntry)
  {
    mFilterContext = paramAdobeImageEditorController;
    mEntryName = name;
    mActive = false;
    mEnabled = true;
    mTrackingAttributes = new HashMap();
    logger = LoggerFactory.getLogger(getClass().getSimpleName(), LoggerFactory.LoggerType.ConsoleLoggerType);
    mEditResult = new EditToolResultVO(ToolLoaderFactory.getToolId(mEntryName), ToolLoaderFactory.getToolVersion(mEntryName));
    setIsChanged(false);
  }
  
  private void internalDispose()
  {
    recyclePreview();
    mPreview = null;
    mBitmap = null;
    mErrorListener = null;
    mFilterContext = null;
    mFilter = null;
    mEntryName = null;
    mOptions = null;
  }
  
  public AdobeImageEditorController getContext()
  {
    return mFilterContext;
  }
  
  public EditToolResultVO getEditToolResult()
  {
    return mEditResult;
  }
  
  public Handler getHandler()
  {
    return handlerBase;
  }
  
  public boolean getIsChanged()
  {
    return mChanged;
  }
  
  public ToolLoaderFactory.Tools getName()
  {
    return mEntryName;
  }
  
  public Bundle getOptions()
  {
    return mOptions;
  }
  
  public boolean hasOption(String paramString)
  {
    return (hasOptions()) && (mOptions.containsKey(paramString));
  }
  
  public boolean hasOptions()
  {
    return mOptions != null;
  }
  
  public boolean isActive()
  {
    return (mActive) && (isCreated());
  }
  
  public boolean isCreated()
  {
    return mCreated;
  }
  
  public boolean isEnabled()
  {
    return mEnabled;
  }
  
  public void onActivate()
  {
    logger.info("onActivate");
    mActive = true;
  }
  
  public boolean onBackPressed()
  {
    return false;
  }
  
  public boolean onCancel()
  {
    logger.info("onCancel");
    return false;
  }
  
  public void onCancelled()
  {
    logger.info("onCancelled");
    setEnabled(false);
  }
  
  protected void onComplete(Bitmap paramBitmap)
  {
    onComplete(paramBitmap, mEditResult);
  }
  
  protected void onComplete(Bitmap paramBitmap, EditToolResultVO paramEditToolResultVO)
  {
    logger.info("onComplete(bitmap, editResult)");
    if (isActive())
    {
      getContext().getTracker().tagEventAttributes(ToolLoaderFactory.getToolName(mEntryName) + ": saved", mTrackingAttributes);
      EventBusUtils.getInstance().post(new CompleteEvent(this, paramBitmap, paramEditToolResultVO));
    }
    mPreview = null;
    mSaving = false;
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration1, Configuration paramConfiguration2) {}
  
  public void onCreate(Bitmap paramBitmap, Bundle paramBundle)
  {
    logger.info("onCreate");
    mBitmap = paramBitmap;
    mCreated = true;
    mOptions = paramBundle;
  }
  
  public void onDeactivate()
  {
    logger.info("onDeactivate");
    setEnabled(false);
    mActive = false;
  }
  
  public void onDestroy()
  {
    logger.info("onDestroy");
    mCreated = false;
    onDispose();
  }
  
  protected void onDispose()
  {
    logger.info("onDispose");
    internalDispose();
  }
  
  protected void onGenerateResult()
  {
    onGenerateResult(mEditResult);
  }
  
  protected void onGenerateResult(EditToolResultVO paramEditToolResultVO)
  {
    logger.info("onGenerateResult(editResult)");
    onComplete(mPreview, paramEditToolResultVO);
  }
  
  protected void onGenericError(CharSequence paramCharSequence, int paramInt, DialogInterface.OnClickListener paramOnClickListener)
  {
    if ((mErrorListener != null) && (isActive())) {
      mErrorListener.onError(paramCharSequence, paramInt, paramOnClickListener);
    }
  }
  
  protected void onGenericError(Exception paramException)
  {
    onGenericError(paramException.getMessage(), 17039370, null);
  }
  
  protected void onPreviewChanged(Bitmap paramBitmap, boolean paramBoolean1, boolean paramBoolean2)
  {
    if (paramBitmap != null) {}
    for (boolean bool = true;; bool = false)
    {
      setIsChanged(bool);
      if ((paramBitmap == null) || (!paramBitmap.equals(mPreview))) {
        recyclePreview();
      }
      mPreview = paramBitmap;
      if ((paramBoolean2) && (isActive())) {
        EventBusUtils.getInstance().post(new PreviewBitmapChangedEvent(this, paramBitmap, paramBoolean1));
      }
      return;
    }
  }
  
  protected void onPreviewChanged(Drawable paramDrawable, boolean paramBoolean1, boolean paramBoolean2)
  {
    if (paramDrawable != null) {}
    for (boolean bool = true;; bool = false)
    {
      setIsChanged(bool);
      if ((paramBoolean2) && (isActive())) {
        EventBusUtils.getInstance().post(new PreviewDrawableChangedEvent(this, paramDrawable, paramBoolean1));
      }
      return;
    }
  }
  
  protected void onPreviewUpdated()
  {
    setIsChanged(true);
    if (isActive()) {
      EventBusUtils.getInstance().post(new PreviewUpdatedEvent(this));
    }
  }
  
  protected void onProgressEnd()
  {
    if (isActive()) {
      EventBusUtils.getInstance().post(new ProgressEndEvent(this, false));
    }
  }
  
  protected void onProgressModalEnd()
  {
    if (isActive()) {
      EventBusUtils.getInstance().post(new ProgressEndEvent(this, true));
    }
  }
  
  protected void onProgressModalStart()
  {
    if (isActive()) {
      EventBusUtils.getInstance().post(new ProgressStartEvent(this, true));
    }
  }
  
  protected void onProgressStart()
  {
    if (isActive()) {
      EventBusUtils.getInstance().post(new ProgressStartEvent(this, false));
    }
  }
  
  public void onSave()
  {
    logger.info("onSave");
    if (!mSaving)
    {
      mSaving = true;
      onGenerateResult();
    }
  }
  
  protected void recyclePreview()
  {
    if ((mPreview != null) && (!mPreview.isRecycled()) && (!mPreview.equals(mBitmap)))
    {
      logger.warn("Recycle PreviewBitmap");
      mPreview.recycle();
    }
  }
  
  protected void restoreToolbarTitle()
  {
    if (isActive()) {
      EventBusUtils.getInstance().post(new RestoreToolBarTitleEvent(this));
    }
  }
  
  public void setEnabled(boolean paramBoolean)
  {
    mEnabled = paramBoolean;
  }
  
  protected void setIsChanged(boolean paramBoolean)
  {
    mChanged = paramBoolean;
  }
  
  public void setOnErrorListener(OnErrorListener paramOnErrorListener)
  {
    mErrorListener = paramOnErrorListener;
  }
  
  protected void setToolbarTitle(int paramInt)
  {
    if (isActive()) {
      EventBusUtils.getInstance().post(new SetToolBarTileEventWithResId(this, paramInt));
    }
  }
  
  protected void setToolbarTitle(CharSequence paramCharSequence)
  {
    if (isActive()) {
      EventBusUtils.getInstance().post(new SetToolBarTileEvent(this, paramCharSequence));
    }
  }
  
  public static final class CompleteEvent
    extends AbstractPanel.PanelEvent
  {
    public final Bitmap bitmap;
    public final EditToolResultVO editResult;
    
    protected CompleteEvent(AbstractPanel paramAbstractPanel, Bitmap paramBitmap, EditToolResultVO paramEditToolResultVO)
    {
      super();
      bitmap = paramBitmap;
      editResult = paramEditToolResultVO;
    }
  }
  
  public static abstract interface ContentPanel
  {
    public abstract View getContentView(LayoutInflater paramLayoutInflater);
  }
  
  public static abstract interface OnErrorListener
  {
    public abstract void onError(CharSequence paramCharSequence, int paramInt, DialogInterface.OnClickListener paramOnClickListener);
  }
  
  public static abstract interface OptionPanel
  {
    public abstract View getOptionView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup);
    
    public abstract ViewGroup getOptionView();
  }
  
  public static abstract class PanelEvent
  {
    public final AbstractPanel panel;
    
    protected PanelEvent(AbstractPanel paramAbstractPanel)
    {
      panel = paramAbstractPanel;
    }
  }
  
  public static final class PreviewBitmapChangedEvent
    extends AbstractPanel.PanelEvent
  {
    public final Bitmap bitmap;
    public final boolean reset;
    
    protected PreviewBitmapChangedEvent(AbstractPanel paramAbstractPanel, Bitmap paramBitmap, boolean paramBoolean)
    {
      super();
      bitmap = paramBitmap;
      reset = paramBoolean;
    }
  }
  
  public static final class PreviewDrawableChangedEvent
    extends AbstractPanel.PanelEvent
  {
    public final Drawable drawable;
    public final boolean reset;
    
    protected PreviewDrawableChangedEvent(AbstractPanel paramAbstractPanel, Drawable paramDrawable, boolean paramBoolean)
    {
      super();
      drawable = paramDrawable;
      reset = paramBoolean;
    }
  }
  
  public static final class PreviewUpdatedEvent
    extends AbstractPanel.PanelEvent
  {
    protected PreviewUpdatedEvent(AbstractPanel paramAbstractPanel)
    {
      super();
    }
  }
  
  public static final class ProgressEndEvent
    extends AbstractPanel.PanelEvent
  {
    public final boolean isModal;
    
    protected ProgressEndEvent(AbstractPanel paramAbstractPanel, boolean paramBoolean)
    {
      super();
      isModal = paramBoolean;
    }
    
    public String toString()
    {
      return "ProgressEndEvent(" + isModal + ")";
    }
  }
  
  public static final class ProgressStartEvent
    extends AbstractPanel.PanelEvent
  {
    public final boolean isModal;
    
    protected ProgressStartEvent(AbstractPanel paramAbstractPanel, boolean paramBoolean)
    {
      super();
      isModal = paramBoolean;
    }
    
    public String toString()
    {
      return "ProgressStartEvent(" + isModal + ")";
    }
  }
  
  public static final class RestoreToolBarTitleEvent
    extends AbstractPanel.PanelEvent
  {
    protected RestoreToolBarTitleEvent(AbstractPanel paramAbstractPanel)
    {
      super();
    }
  }
  
  public static final class SetApplyEnabledEvent
    extends AbstractPanel.PanelEvent
  {
    public final boolean applyEnabled;
  }
  
  public static final class SetToolBarTileEvent
    extends AbstractPanel.PanelEvent
  {
    public final CharSequence title;
    
    protected SetToolBarTileEvent(AbstractPanel paramAbstractPanel, CharSequence paramCharSequence)
    {
      super();
      title = paramCharSequence;
    }
  }
  
  public static final class SetToolBarTileEventWithResId
    extends AbstractPanel.PanelEvent
  {
    public final int resId;
    
    protected SetToolBarTileEventWithResId(AbstractPanel paramAbstractPanel, int paramInt)
    {
      super();
      resId = paramInt;
    }
  }
}
