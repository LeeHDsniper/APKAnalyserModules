package com.adobe.creativesdk.aviary.internal;

import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.Point;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Handler;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import com.adobe.android.ui.view.AdobeTutorialOverlay;
import com.adobe.creativesdk.aviary.AdobeImageEditorActivity;
import com.adobe.creativesdk.aviary.fragments.StoreContainerFragment;
import com.adobe.creativesdk.aviary.internal.content.ToolEntry;
import com.adobe.creativesdk.aviary.internal.events.ControllerStateChangedEvent;
import com.adobe.creativesdk.aviary.internal.events.QuickLaunchEvent;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory.Tools;
import com.adobe.creativesdk.aviary.internal.headless.AdobeImageExecutionException;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionList;
import com.adobe.creativesdk.aviary.internal.services.BaseContextService;
import com.adobe.creativesdk.aviary.internal.services.ConfigService;
import com.adobe.creativesdk.aviary.internal.services.HiResBackgroundService;
import com.adobe.creativesdk.aviary.internal.services.HiResBackgroundService.OnHiresListener;
import com.adobe.creativesdk.aviary.internal.services.LocalDataService;
import com.adobe.creativesdk.aviary.internal.services.MessageService;
import com.adobe.creativesdk.aviary.internal.services.ServiceLoader;
import com.adobe.creativesdk.aviary.internal.services.SessionService;
import com.adobe.creativesdk.aviary.internal.services.ThreadPoolService;
import com.adobe.creativesdk.aviary.internal.tracking.AdobeImageAnalyticsTracker;
import com.adobe.creativesdk.aviary.internal.utils.ApiHelper;
import com.adobe.creativesdk.aviary.internal.utils.BitmapUtils;
import com.adobe.creativesdk.aviary.internal.utils.ImageInfo;
import com.adobe.creativesdk.aviary.internal.vo.EditToolResultVO;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.overlays.AbstractBaseOverlay;
import com.adobe.creativesdk.aviary.overlays.UndoRedoOverlay;
import com.adobe.creativesdk.aviary.panels.AbstractContentPanel.ContentReadyEvent;
import com.adobe.creativesdk.aviary.panels.AbstractPanel;
import com.adobe.creativesdk.aviary.panels.AbstractPanel.CompleteEvent;
import com.adobe.creativesdk.aviary.panels.AbstractPanel.ContentPanel;
import com.adobe.creativesdk.aviary.panels.AbstractPanel.OnErrorListener;
import com.adobe.creativesdk.aviary.panels.AbstractPanel.OptionPanel;
import com.adobe.creativesdk.aviary.panels.AbstractPanel.PreviewBitmapChangedEvent;
import com.adobe.creativesdk.aviary.panels.AbstractPanel.PreviewDrawableChangedEvent;
import com.adobe.creativesdk.aviary.panels.AbstractPanel.PreviewUpdatedEvent;
import com.adobe.creativesdk.aviary.panels.AbstractPanel.ProgressEndEvent;
import com.adobe.creativesdk.aviary.panels.AbstractPanel.ProgressStartEvent;
import com.adobe.creativesdk.aviary.panels.AbstractPanel.RestoreToolBarTitleEvent;
import com.adobe.creativesdk.aviary.panels.AbstractPanel.SetApplyEnabledEvent;
import com.adobe.creativesdk.aviary.panels.AbstractPanel.SetToolBarTileEvent;
import com.adobe.creativesdk.aviary.panels.AbstractPanel.SetToolBarTileEventWithResId;
import com.adobe.creativesdk.aviary.panels.AbstractPanelLoaderService;
import com.adobe.creativesdk.aviary.utils.EventBusUtils;
import com.adobe.creativesdk.aviary.widget.AdobeImageBottomBarAnimator;
import com.adobe.creativesdk.aviary.widget.AdobeImageBottomBarAnimator.OnViewChangingStatusListener;
import com.adobe.creativesdk.aviary.widget.AdobeImageToolBar;
import com.aviary.android.feather.sdk.R.id;
import com.aviary.android.feather.sdk.R.layout;
import com.aviary.android.feather.sdk.R.string;
import com.aviary.android.feather.sdk.R.style;
import de.greenrobot.event.EventBus;
import it.sephiroth.android.library.imagezoom.ImageViewTouch;
import it.sephiroth.android.library.tooltip.TooltipManager;
import it.sephiroth.android.library.tooltip.TooltipManager.Builder;
import it.sephiroth.android.library.tooltip.TooltipManager.ClosePolicy;
import it.sephiroth.android.library.tooltip.TooltipManager.Gravity;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

public final class AdobeImageEditorController
  implements HiResBackgroundService.OnHiresListener, AbstractPanel.OnErrorListener
{
  private LoggerFactory.Logger logger = LoggerFactory.getLogger(AdobeImageEditorController.class.getSimpleName());
  private Bitmap mBitmap;
  private boolean mChanged;
  private Configuration mConfiguration;
  private AdobeImageEditorActivity mContext;
  private AbstractPanel mCurrentEffect;
  private ToolEntry mCurrentEntry;
  private int mCurrentState;
  private final Handler mHandler = new Handler();
  private List<HiResBackgroundService.OnHiresListener> mHiresListeners;
  private boolean mIsTablet;
  private AbstractPanelLoaderService mPanelCreatorService;
  private final ServiceLoader<BaseContextService> mServiceLoader;
  private int mToolCompleteCount;
  private List<String> mToolList;
  
  public AdobeImageEditorController(AdobeImageEditorActivity paramAdobeImageEditorActivity)
  {
    mContext = paramAdobeImageEditorActivity;
    mToolCompleteCount = 0;
    mHiresListeners = new ArrayList(0);
    mServiceLoader = new ServiceLoader(this);
    mConfiguration = new Configuration(paramAdobeImageEditorActivity.getResources().getConfiguration());
    initServices();
    mCurrentState = 0;
    mChanged = false;
  }
  
  private void initHiResService(Bitmap paramBitmap, ImageInfo paramImageInfo)
  {
    LocalDataService localLocalDataService = (LocalDataService)getService(LocalDataService.class);
    Object localObject = (HiResBackgroundService)getService(HiResBackgroundService.class);
    if ((paramBitmap != null) && (paramImageInfo.getOriginalSize() != null) && (paramImageInfo.getOriginalSize().length == 2))
    {
      logger.log("original size: %dx%d", new Object[] { Integer.valueOf(paramImageInfo.getOriginalSize()[0]), Integer.valueOf(paramImageInfo.getOriginalSize()[1]) });
      logger.log("bitmap size: %dx%d", new Object[] { Integer.valueOf(paramBitmap.getWidth()), Integer.valueOf(paramBitmap.getHeight()) });
    }
    if (!((HiResBackgroundService)localObject).isRunning()) {
      ((HiResBackgroundService)localObject).setOnHiresListener(this);
    }
    localObject = (SessionService)getService(SessionService.class);
    if (!((SessionService)localObject).isRunning()) {
      ((SessionService)localObject).start();
    }
    ((SessionService)localObject).load(paramBitmap, localLocalDataService.getRequestedMegaPixels(), paramImageInfo);
  }
  
  private void initServices()
  {
    try
    {
      logger.info("initServices");
      mServiceLoader.register(SessionService.class);
      mServiceLoader.register(LocalDataService.class);
      mServiceLoader.register(ThreadPoolService.class);
      mServiceLoader.register(ConfigService.class);
      mServiceLoader.register(HiResBackgroundService.class);
      mServiceLoader.register(AbstractPanelLoaderService.class);
      mServiceLoader.register(MessageService.class);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  private boolean isSamePanel(AbstractPanel paramAbstractPanel1, AbstractPanel paramAbstractPanel2)
  {
    return (paramAbstractPanel1 != null) && (paramAbstractPanel2 != null) && (paramAbstractPanel1.getName() == paramAbstractPanel2.getName());
  }
  
  private void onClose(final boolean paramBoolean)
  {
    logger.info("onClose");
    setCurrentState(3);
    mContext.getBottomBar().setOnViewChangingStatusListener(new AdobeImageBottomBarAnimator.OnViewChangingStatusListener()
    {
      public void onCloseEnd()
      {
        AdobeImageEditorController localAdobeImageEditorController = AdobeImageEditorController.this;
        if (paramBoolean) {}
        for (int i = 4;; i = 5)
        {
          localAdobeImageEditorController.setCurrentState(i);
          mContext.getBottomBar().setOnViewChangingStatusListener(null);
          return;
        }
      }
      
      public void onCloseStart() {}
      
      public void onOpenEnd() {}
      
      public void onOpenStart() {}
    });
    mContext.getBottomBar().close();
  }
  
  private void onComplete(Bitmap paramBitmap, EditToolResultVO paramEditToolResultVO)
  {
    mToolCompleteCount += 1;
    if (paramBitmap != null) {
      setNextBitmap(paramBitmap, true);
    }
    for (;;)
    {
      onClose(true);
      if (paramEditToolResultVO == null) {
        break label173;
      }
      if (!paramEditToolResultVO.valid()) {
        logger.error("editResult is not valid!");
      }
      LocalDataService localLocalDataService = (LocalDataService)getService(LocalDataService.class);
      if (localLocalDataService != null) {
        localLocalDataService.addRecipe(paramEditToolResultVO.getEditTool());
      }
      if ((paramEditToolResultVO.getActionList() == null) || (paramEditToolResultVO.getActionList().size() <= 0)) {
        break;
      }
      ((SessionService)getService(SessionService.class)).push(paramBitmap, paramEditToolResultVO);
      if ((ApiHelper.isUndoRedoAvailable()) && (AbstractBaseOverlay.shouldShow(getBaseContext(), 5))) {
        new UndoRedoOverlay(getBaseContext()).showDelayed(200L);
      }
      return;
      logger.error("Error: returned bitmap is null!");
      setNextBitmap(mBitmap, true);
    }
    logger.error("actionlist is missing!");
    return;
    label173:
    logger.error("Something was wrong, edit result is null!");
  }
  
  private void onPanelReady()
  {
    mContext.getMainImage().resetMatrix();
    mContext.getMainToolBar().setTitle(getActiveToollabelResourceId, false);
    mContext.getMainToolBar().open();
  }
  
  private void prepareToolPanel(AbstractPanel paramAbstractPanel, Bundle paramBundle)
  {
    View localView;
    if ((paramAbstractPanel instanceof AbstractPanel.OptionPanel))
    {
      localView = ((AbstractPanel.OptionPanel)paramAbstractPanel).getOptionView(LayoutInflater.from(mContext), mContext.getOptionsPanelContainer());
      mContext.getOptionsPanelContainer().addView(localView);
    }
    if ((paramAbstractPanel instanceof AbstractPanel.ContentPanel))
    {
      localView = ((AbstractPanel.ContentPanel)paramAbstractPanel).getContentView(LayoutInflater.from(mContext));
      localView.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
      mContext.getDrawingImageContainer().addView(localView);
    }
    paramAbstractPanel.onCreate(mBitmap, paramBundle);
  }
  
  private void setCurrentState(int paramInt)
  {
    int i;
    if (paramInt != mCurrentState)
    {
      logger.info("setcurrentState: %s >> %s", new Object[] { Integer.valueOf(mCurrentState), Integer.valueOf(paramInt) });
      i = mCurrentState;
      mCurrentState = paramInt;
    }
    switch (paramInt)
    {
    default: 
      logger.error("Invalid state");
    case 1: 
    case 2: 
      do
      {
        return;
        mCurrentEffect.setOnErrorListener(this);
        EventBusUtils.getInstance().post(new ControllerStateChangedEvent(paramInt, i));
        return;
        mCurrentEffect.onActivate();
        EventBusUtils.getInstance().post(new ControllerStateChangedEvent(paramInt, i));
      } while ((mCurrentEffect instanceof AbstractPanel.ContentPanel));
      onPanelReady();
      return;
    case 3: 
      EventBusUtils.getInstance().post(new ControllerStateChangedEvent(paramInt, i));
      mCurrentEffect.onDeactivate();
      mHandler.post(new Runnable()
      {
        public void run()
        {
          mContext.getDrawingImageContainer().removeAllViews();
        }
      });
      return;
    case 4: 
    case 5: 
      mContext.getOptionsPanelContainer().removeAllViews();
      if (i != 0)
      {
        mCurrentEffect.onDestroy();
        mCurrentEffect.setOnErrorListener(null);
        mCurrentEffect = null;
        mCurrentEntry = null;
        mContext.hideProgressIfVisible();
      }
      EventBusUtils.getInstance().post(new ControllerStateChangedEvent(paramInt, i));
      System.gc();
      return;
    }
    EventBusUtils.getInstance().post(new ControllerStateChangedEvent(paramInt, i));
  }
  
  private void showUndoRedoToolTip(int paramInt)
  {
    DisplayMetrics localDisplayMetrics = getBaseActivity().getResources().getDisplayMetrics();
    TooltipManager.getInstance(getBaseActivity()).remove(0);
    TooltipManager.getInstance(getBaseActivity()).create(0).withCustomView(R.layout.com_adobe_image_editor_content_tooltip, false).closePolicy(TooltipManager.ClosePolicy.None, 1000L).text(getBaseContext().getResources(), paramInt).withStyleId(R.style.AdobeImageWidget_ContentPanelsTooltip).actionBarSize(mContext.getActionBarSize()).toggleArrow(false).anchor(new Point(widthPixels / 2, 90), TooltipManager.Gravity.BOTTOM).show();
  }
  
  public void activateTool(ToolEntry paramToolEntry, Bundle paramBundle, Point paramPoint)
  {
    if ((!getEnabled()) || (!isClosed()) || (mBitmap == null)) {}
    AbstractPanel localAbstractPanel;
    do
    {
      do
      {
        return;
      } while ((mToolList != null) && (mToolList.indexOf(name.name()) < 0));
      if (mCurrentEffect != null) {
        throw new IllegalStateException("There is already an active effect. Cannot activate new");
      }
      if (mPanelCreatorService == null) {
        mPanelCreatorService = ((AbstractPanelLoaderService)getService(AbstractPanelLoaderService.class));
      }
      localAbstractPanel = mPanelCreatorService.createNew(paramToolEntry);
    } while (localAbstractPanel == null);
    mCurrentEffect = localAbstractPanel;
    mCurrentEntry = paramToolEntry;
    setCurrentState(1);
    prepareToolPanel(localAbstractPanel, paramBundle);
    getTracker().tagEvent(mCurrentEntry.name.name().toLowerCase(Locale.US) + ": opened");
    mContext.getBottomBar().setOnViewChangingStatusListener(new AdobeImageBottomBarAnimator.OnViewChangingStatusListener()
    {
      public void onCloseEnd() {}
      
      public void onCloseStart() {}
      
      public void onOpenEnd()
      {
        AdobeImageEditorController.this.setCurrentState(2);
        mContext.getBottomBar().setOnViewChangingStatusListener(null);
      }
      
      public void onOpenStart() {}
    });
    mContext.getBottomBar().open(paramPoint);
  }
  
  public void addOnHiresListener(HiResBackgroundService.OnHiresListener paramOnHiresListener)
  {
    mHiresListeners.add(paramOnHiresListener);
  }
  
  public void cancel()
  {
    logger.info("FilterManager::cancel");
    if ((!getEnabled()) || (!isOpened())) {
      return;
    }
    if (mCurrentEffect == null) {
      throw new IllegalStateException("there is no current effect active in the context");
    }
    mContext.getTracker().tagEvent(mCurrentEntry.name.name().toLowerCase(Locale.US) + ": cancelled");
    mCurrentEffect.onCancelled();
    if (mCurrentEffect.getIsChanged()) {
      setNextBitmap(mBitmap, true);
    }
    for (;;)
    {
      onClose(false);
      return;
      setNextBitmap(mBitmap, true);
    }
  }
  
  public boolean closeStoreDialog()
  {
    logger.info("closeStoreDialog");
    if (getStoreFragment() != null)
    {
      mContext.getSupportFragmentManager().popBackStack();
      mContext.getMainToolBar().setApplyVisible(true);
      mContext.getMainContent().setVisibility(0);
      mContext.getBottomBar().setVisibility(0);
      return true;
    }
    return false;
  }
  
  public void dispose()
  {
    EventBusUtils.unregister(this);
    if (mCurrentEffect != null)
    {
      logger.log("Deactivate and destroy current panel");
      mCurrentEffect.onDeactivate();
      mCurrentEffect.onDestroy();
      mCurrentEffect = null;
    }
    HiResBackgroundService localHiResBackgroundService = (HiResBackgroundService)getService(HiResBackgroundService.class);
    if (localHiResBackgroundService != null) {
      localHiResBackgroundService.setOnHiresListener(null);
    }
    mServiceLoader.dispose();
    mContext = null;
    System.gc();
  }
  
  public int getAccentColor(int paramInt)
  {
    LocalDataService localLocalDataService = (LocalDataService)getService(LocalDataService.class);
    if (localLocalDataService != null) {
      return localLocalDataService.getAccentColor(paramInt);
    }
    return 0;
  }
  
  public ToolEntry getActiveTool()
  {
    return mCurrentEntry;
  }
  
  public AdobeImageEditorActivity getBaseActivity()
  {
    return mContext;
  }
  
  public Context getBaseContext()
  {
    return mContext;
  }
  
  public Bitmap getBitmap()
  {
    return mBitmap;
  }
  
  public boolean getBitmapIsChanged()
  {
    return mChanged;
  }
  
  public Matrix getCurrentImageViewMatrix()
  {
    return mContext.getMainImage().getDisplayMatrix();
  }
  
  public boolean getEnabled()
  {
    return mCurrentState != 0;
  }
  
  public <T> T getService(Class<T> paramClass)
  {
    try
    {
      paramClass = mServiceLoader.getService(paramClass);
      return paramClass;
    }
    catch (IllegalAccessException paramClass)
    {
      paramClass.printStackTrace();
    }
    return null;
  }
  
  public StoreContainerFragment getStoreFragment()
  {
    Object localObject = mContext.getSupportFragmentManager();
    int i = ((FragmentManager)localObject).getBackStackEntryCount();
    localObject = (StoreContainerFragment)((FragmentManager)localObject).findFragmentByTag("iap-dialog-fragment");
    logger.verbose("count: %d", new Object[] { Integer.valueOf(i) });
    logger.verbose("fragment: %s", new Object[] { localObject });
    return localObject;
  }
  
  public int getToolCompleteCount()
  {
    return mToolCompleteCount;
  }
  
  public List<String> getToolList()
  {
    return mToolList;
  }
  
  public AdobeImageAnalyticsTracker getTracker()
  {
    return mContext.getTracker();
  }
  
  public boolean hasAccentColor()
  {
    LocalDataService localLocalDataService = (LocalDataService)getService(LocalDataService.class);
    if (localLocalDataService != null) {
      return localLocalDataService.hasAccentColor();
    }
    return false;
  }
  
  public boolean isClosed()
  {
    return (mCurrentState == 5) || (mCurrentState == 4);
  }
  
  public boolean isOpened()
  {
    return mCurrentState == 2;
  }
  
  public void onActivate(Bitmap paramBitmap, ImageInfo paramImageInfo)
  {
    if (mCurrentState != 0) {
      throw new IllegalStateException("Cannot activate. Already active!");
    }
    if ((mBitmap != null) && (!mBitmap.isRecycled())) {
      mBitmap = null;
    }
    mBitmap = paramBitmap;
    LocalDataService localLocalDataService = (LocalDataService)getService(LocalDataService.class);
    localLocalDataService.setImageInfo(paramImageInfo);
    mChanged = false;
    setCurrentState(4);
    initHiResService(paramBitmap, paramImageInfo);
    if ((localLocalDataService != null) && (localLocalDataService.hasAccentColor())) {
      getBaseActivity().getMainToolBar().setTint(localLocalDataService.getAccentColor(0));
    }
    EventBusUtils.register(this);
  }
  
  public boolean onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    EventBusUtils.register(this);
    return false;
  }
  
  public void onApply()
  {
    logger.info("FilterManager::onapply");
    if ((!getEnabled()) || (!isOpened())) {}
    do
    {
      return;
      if (mCurrentEffect == null) {
        throw new IllegalStateException("there is no current effect active in the context");
      }
    } while (!mCurrentEffect.isEnabled());
    if (mCurrentEffect.getIsChanged())
    {
      mCurrentEffect.onSave();
      mChanged = true;
      return;
    }
    onCancel();
  }
  
  public boolean onBackPressed()
  {
    logger.info("onBackPressed");
    if (isClosed()) {}
    do
    {
      return false;
      StoreContainerFragment localStoreContainerFragment = getStoreFragment();
      if (localStoreContainerFragment != null) {
        if (!localStoreContainerFragment.onBackPressed())
        {
          if (closeStoreDialog()) {
            return true;
          }
        }
        else {
          return true;
        }
      }
    } while (mCurrentState == 0);
    if ((isOpened()) && (!mCurrentEffect.onBackPressed())) {
      onCancel();
    }
    return true;
  }
  
  public void onCancel()
  {
    if ((!getEnabled()) || (!isOpened())) {}
    do
    {
      return;
      if (mCurrentEffect == null) {
        throw new IllegalStateException("there is no current effect active in the context");
      }
    } while (mCurrentEffect.onCancel());
    cancel();
  }
  
  public boolean onConfigurationChanged(Configuration paramConfiguration)
  {
    boolean bool2 = false;
    logger.info("onConfigurationChanged: " + orientation + ", " + mConfiguration.orientation);
    boolean bool1 = bool2;
    if (mCurrentEffect != null)
    {
      bool1 = bool2;
      if (mCurrentEffect.isCreated())
      {
        logger.info("onConfigurationChanged, sending event to ", new Object[] { mCurrentEffect });
        mCurrentEffect.onConfigurationChanged(paramConfiguration, mConfiguration);
        bool1 = true;
      }
    }
    mConfiguration = new Configuration(paramConfiguration);
    return bool1;
  }
  
  public void onError(CharSequence paramCharSequence, int paramInt, DialogInterface.OnClickListener paramOnClickListener)
  {
    new AlertDialog.Builder(mContext).setTitle(R.string.feather_generic_error_title).setMessage(paramCharSequence).setPositiveButton(paramInt, paramOnClickListener).setIcon(17301543).show();
  }
  
  public void onEventMainThread(QuickLaunchEvent paramQuickLaunchEvent)
  {
    logger.info("onEventMainThread(QuickLaunchEvent)");
    if ((isClosed()) && (getEnabled()))
    {
      ToolEntry localToolEntry = ((AbstractPanelLoaderService)getService(AbstractPanelLoaderService.class)).findEntry(tool);
      if (localToolEntry != null) {
        activateTool(localToolEntry, options, null);
      }
    }
  }
  
  public void onEventMainThread(AbstractContentPanel.ContentReadyEvent paramContentReadyEvent)
  {
    if ((mCurrentState == 2) && (isSamePanel(panel, mCurrentEffect)))
    {
      mContext.getMainImage().setVisibility(8);
      onPanelReady();
    }
  }
  
  public void onEventMainThread(AbstractPanel.CompleteEvent paramCompleteEvent)
  {
    logger.log("CompleteEvent. currentState: %d", new Object[] { Integer.valueOf(mCurrentState) });
    onComplete(bitmap, editResult);
  }
  
  public void onEventMainThread(AbstractPanel.PreviewBitmapChangedEvent paramPreviewBitmapChangedEvent)
  {
    logger.info("PreviewBitmapChangedEvent");
    if ((mCurrentState != 2) || (!isSamePanel(panel, mCurrentEffect)) || (!getEnabled()) || (!isOpened())) {
      return;
    }
    boolean bool1 = true;
    boolean bool2 = reset;
    Bitmap localBitmap = bitmap;
    if (!bool2) {
      bool1 = BitmapUtils.compareBySize(mContext.getMainImage().getDrawable(), localBitmap);
    }
    logger.info("onPreviewChange: changed: %b", new Object[] { Boolean.valueOf(bool1) });
    paramPreviewBitmapChangedEvent = null;
    if (!bool1) {
      paramPreviewBitmapChangedEvent = mContext.getMainImage().getDisplayMatrix();
    }
    mContext.getMainImage().setImageBitmap(localBitmap, paramPreviewBitmapChangedEvent, -1.0F, -1.0F);
  }
  
  public void onEventMainThread(AbstractPanel.PreviewDrawableChangedEvent paramPreviewDrawableChangedEvent)
  {
    logger.info("PreviewDrawableChangedEvent");
    if ((mCurrentState != 2) || (!isSamePanel(panel, mCurrentEffect)) || (!getEnabled()) || (!isOpened())) {
      return;
    }
    boolean bool1 = true;
    boolean bool2 = reset;
    Drawable localDrawable = drawable;
    if (!bool2) {
      bool1 = BitmapUtils.compareBySize(mContext.getMainImage().getDrawable(), localDrawable);
    }
    paramPreviewDrawableChangedEvent = null;
    if (!bool1) {
      paramPreviewDrawableChangedEvent = mContext.getMainImage().getDisplayMatrix();
    }
    mContext.getMainImage().setImageDrawable(localDrawable, paramPreviewDrawableChangedEvent, -1.0F, -1.0F);
  }
  
  public void onEventMainThread(AbstractPanel.PreviewUpdatedEvent paramPreviewUpdatedEvent)
  {
    if ((mCurrentState != 2) || (!isSamePanel(panel, mCurrentEffect)) || (!getEnabled()) || (!isOpened())) {
      return;
    }
    mContext.getMainImage().postInvalidate();
  }
  
  public void onEventMainThread(AbstractPanel.ProgressEndEvent paramProgressEndEvent)
  {
    mContext.hideProgress(isModal);
  }
  
  public void onEventMainThread(AbstractPanel.ProgressStartEvent paramProgressStartEvent)
  {
    if (mCurrentState == 2) {
      mContext.showProgress(isModal);
    }
  }
  
  public void onEventMainThread(AbstractPanel.RestoreToolBarTitleEvent paramRestoreToolBarTitleEvent)
  {
    if (mCurrentEntry != null) {
      mContext.getMainToolBar().setTitle(mCurrentEntry.labelResourceId);
    }
  }
  
  public void onEventMainThread(AbstractPanel.SetApplyEnabledEvent paramSetApplyEnabledEvent)
  {
    logger.info("SetApplyEnabledEvent");
    mContext.getMainToolBar().setApplyVisible(applyEnabled);
  }
  
  public void onEventMainThread(AbstractPanel.SetToolBarTileEvent paramSetToolBarTileEvent)
  {
    if ((mCurrentState == 2) && (isSamePanel(panel, mCurrentEffect))) {
      mContext.getMainToolBar().setTitle(title);
    }
  }
  
  public void onEventMainThread(AbstractPanel.SetToolBarTileEventWithResId paramSetToolBarTileEventWithResId)
  {
    if ((mCurrentState == 2) && (isSamePanel(panel, mCurrentEffect))) {
      mContext.getMainToolBar().setTitle(resId);
    }
  }
  
  public void onHiresComplete()
  {
    logger.info("onHiresComplete");
    Iterator localIterator = mHiresListeners.iterator();
    while (localIterator.hasNext()) {
      ((HiResBackgroundService.OnHiresListener)localIterator.next()).onHiresComplete();
    }
  }
  
  public void onHiresError(AdobeImageExecutionException paramAdobeImageExecutionException)
  {
    logger.info("onHiresError: " + paramAdobeImageExecutionException);
    Iterator localIterator = mHiresListeners.iterator();
    while (localIterator.hasNext()) {
      ((HiResBackgroundService.OnHiresListener)localIterator.next()).onHiresError(paramAdobeImageExecutionException);
    }
  }
  
  public void onHiresProgress(int paramInt1, int paramInt2)
  {
    logger.info("onHiresProgress: %d of %d", new Object[] { Integer.valueOf(paramInt1), Integer.valueOf(paramInt2) });
    Iterator localIterator = mHiresListeners.iterator();
    while (localIterator.hasNext()) {
      ((HiResBackgroundService.OnHiresListener)localIterator.next()).onHiresProgress(paramInt1, paramInt2);
    }
  }
  
  public void onPause()
  {
    EventBusUtils.unregister(this);
  }
  
  public void onRedo()
  {
    logger.info("onRedo");
    if ((!getEnabled()) || (mCurrentEffect != null)) {}
    Object localObject;
    do
    {
      do
      {
        return;
        localObject = (SessionService)getService(SessionService.class);
      } while (!((SessionService)localObject).canRedo());
      localObject = ((SessionService)localObject).redo();
    } while (localObject == null);
    setNextBitmap((Bitmap)localObject, true);
    showUndoRedoToolTip(R.string.feather_redo);
    getTracker().tagEvent("editor: redo");
  }
  
  public void onResume()
  {
    EventBusUtils.register(this);
  }
  
  public void onUndo()
  {
    logger.info("onUndo");
    if ((!getEnabled()) || (mCurrentEffect != null)) {}
    Object localObject;
    do
    {
      do
      {
        return;
        localObject = (SessionService)getService(SessionService.class);
        if (!((SessionService)localObject).canUndo()) {
          break;
        }
        localObject = ((SessionService)localObject).undo();
      } while (localObject == null);
      setNextBitmap((Bitmap)localObject, true);
      showUndoRedoToolTip(R.string.feather_undo);
      getTracker().tagEvent("editor: undo");
      return;
    } while (!((SessionService)localObject).canRedo());
    showUndoRedoToolTip(R.string.feather_cant_undo_anymore);
  }
  
  public void openOrUpdateStoreDialog(Bundle paramBundle)
  {
    logger.info("openOrUpdateStoreDialog");
    FragmentManager localFragmentManager = mContext.getSupportFragmentManager();
    FragmentTransaction localFragmentTransaction = localFragmentManager.beginTransaction();
    StoreContainerFragment localStoreContainerFragment = (StoreContainerFragment)localFragmentManager.findFragmentByTag("iap-dialog-fragment");
    if (localStoreContainerFragment != null)
    {
      localStoreContainerFragment.setArguments(paramBundle);
      localStoreContainerFragment.update();
      return;
    }
    paramBundle = StoreContainerFragment.newInstance(paramBundle);
    if (mIsTablet)
    {
      paramBundle.show(localFragmentTransaction, "iap-dialog-fragment");
      return;
    }
    localFragmentManager.beginTransaction().replace(R.id.feather_dialogs_container, paramBundle, "iap-dialog-fragment").addToBackStack(null).commit();
    mContext.getMainToolBar().setApplyVisible(false);
    mContext.getMainContent().setVisibility(4);
    mContext.getBottomBar().setVisibility(4);
  }
  
  public boolean removeOnHiresListener(HiResBackgroundService.OnHiresListener paramOnHiresListener)
  {
    return mHiresListeners.remove(paramOnHiresListener);
  }
  
  public void setEnabled(boolean paramBoolean)
  {
    if (!paramBoolean)
    {
      if (!isClosed()) {
        break label32;
      }
      if (!paramBoolean) {
        break label25;
      }
      EventBusUtils.register(this);
    }
    for (;;)
    {
      setCurrentState(0);
      return;
      label25:
      EventBusUtils.unregister(this);
    }
    label32:
    logger.warn("Controller must be closed to change state");
  }
  
  public void setIsTablet(boolean paramBoolean)
  {
    mIsTablet = paramBoolean;
  }
  
  void setNextBitmap(Bitmap paramBitmap, boolean paramBoolean)
  {
    setNextBitmap(paramBitmap, paramBoolean, null);
  }
  
  void setNextBitmap(Bitmap paramBitmap, boolean paramBoolean, Matrix paramMatrix)
  {
    logger.log("setNextBitmap", new Object[] { paramBitmap, Boolean.valueOf(paramBoolean), paramMatrix });
    Matrix localMatrix = paramMatrix;
    if (!paramBoolean)
    {
      localMatrix = paramMatrix;
      if (paramMatrix == null) {
        localMatrix = mContext.getMainImage().getDisplayMatrix();
      }
    }
    mContext.getMainImage().setImageBitmap(paramBitmap, localMatrix, -1.0F, -1.0F);
    if ((!mBitmap.equals(paramBitmap)) && (!mBitmap.isRecycled()))
    {
      logger.warn("[recycle] original Bitmap: " + mBitmap);
      mBitmap.recycle();
      mBitmap = null;
    }
    mBitmap = paramBitmap;
  }
  
  public void setToolList(List<String> paramList)
  {
    mToolList = paramList;
  }
}
