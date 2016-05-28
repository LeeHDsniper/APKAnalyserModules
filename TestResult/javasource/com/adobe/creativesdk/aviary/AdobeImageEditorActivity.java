package com.adobe.creativesdk.aviary;

import android.app.AlertDialog.Builder;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.DialogInterface.OnClickListener;
import android.content.DialogInterface.OnDismissListener;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Point;
import android.media.MediaScannerConnection.OnScanCompletedListener;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.os.Handler;
import android.os.Parcelable;
import android.os.SystemClock;
import android.support.v4.app.ActivityCompat;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.util.DisplayMetrics;
import android.util.Pair;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;
import com.adobe.android.ui.utils.UIUtils;
import com.adobe.android.ui.widget.AdobeCustomToast;
import com.adobe.creativesdk.aviary.async_tasks.AdobeImageDownloadAsyncTask;
import com.adobe.creativesdk.aviary.async_tasks.AdobeImageDownloadAsyncTask.DownloadCompleteEvent;
import com.adobe.creativesdk.aviary.async_tasks.AdobeImageDownloadAsyncTask.DownloadErrorEvent;
import com.adobe.creativesdk.aviary.async_tasks.AdobeImageDownloadAsyncTask.DownloadStartEvent;
import com.adobe.creativesdk.aviary.async_tasks.ToolsLoaderAsyncTask;
import com.adobe.creativesdk.aviary.async_tasks.ToolsLoaderAsyncTask.ToolsLoadedEvent;
import com.adobe.creativesdk.aviary.dialogs.ConfirmExitDialogFragment;
import com.adobe.creativesdk.aviary.dialogs.ConfirmExitNoChangesDialogFragment;
import com.adobe.creativesdk.aviary.dialogs.DownloadErrorDialogFragment;
import com.adobe.creativesdk.aviary.dialogs.FeedBackDialogFragment;
import com.adobe.creativesdk.aviary.dialogs.MessagePromoDialogFragment;
import com.adobe.creativesdk.aviary.internal.AdobeImageEditorController;
import com.adobe.creativesdk.aviary.internal.MonitoredActivity;
import com.adobe.creativesdk.aviary.internal.account.AccountResult;
import com.adobe.creativesdk.aviary.internal.account.AdobeAccountConnection;
import com.adobe.creativesdk.aviary.internal.account.AdobeImageAccountDelegate;
import com.adobe.creativesdk.aviary.internal.cds.util.IabResult;
import com.adobe.creativesdk.aviary.internal.content.ToolEntry;
import com.adobe.creativesdk.aviary.internal.events.ControllerStateChangedEvent;
import com.adobe.creativesdk.aviary.internal.events.HistoryUndoRedoEvent;
import com.adobe.creativesdk.aviary.internal.events.MessageReceivedEvent;
import com.adobe.creativesdk.aviary.internal.events.MessageUserActionEvent;
import com.adobe.creativesdk.aviary.internal.events.QuickLaunchEvent;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory.Tools;
import com.adobe.creativesdk.aviary.internal.headless.AdobeImageExecutionException;
import com.adobe.creativesdk.aviary.internal.headless.AdobeImageInitializationException;
import com.adobe.creativesdk.aviary.internal.headless.filters.NativeFilterProxy;
import com.adobe.creativesdk.aviary.internal.media.SingleMediaScannerItem.OnScanErrorListener;
import com.adobe.creativesdk.aviary.internal.os.AdobeImageAsyncTask;
import com.adobe.creativesdk.aviary.internal.services.HiResBackgroundService;
import com.adobe.creativesdk.aviary.internal.services.HiResBackgroundService.OnHiresListener;
import com.adobe.creativesdk.aviary.internal.services.LocalDataService;
import com.adobe.creativesdk.aviary.internal.services.MessageService;
import com.adobe.creativesdk.aviary.internal.services.SessionService;
import com.adobe.creativesdk.aviary.internal.tracking.AdobeImageAnalyticsTracker;
import com.adobe.creativesdk.aviary.internal.utils.ApiHelper;
import com.adobe.creativesdk.aviary.internal.utils.DateTimeUtils;
import com.adobe.creativesdk.aviary.internal.utils.IOUtils;
import com.adobe.creativesdk.aviary.internal.utils.ImageInfo;
import com.adobe.creativesdk.aviary.internal.utils.PackageManagerUtils;
import com.adobe.creativesdk.aviary.internal.utils.ScreenUtils;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.log.LoggerFactory.LoggerType;
import com.adobe.creativesdk.aviary.utils.AdobeImageUIUtils;
import com.adobe.creativesdk.aviary.utils.EventBusUtils;
import com.adobe.creativesdk.aviary.utils.SharedPreferencesUtils;
import com.adobe.creativesdk.aviary.widget.AdobeImageBottomBarAnimator;
import com.adobe.creativesdk.aviary.widget.AdobeImageToolBar;
import com.adobe.creativesdk.aviary.widget.AdobeImageToolBar.ToolBarApplyEvent;
import com.adobe.creativesdk.aviary.widget.AdobeImageToolBar.ToolBarDoneEvent;
import com.adobe.creativesdk.aviary.widget.AdobeImageViewUndoRedo;
import com.aviary.android.feather.sdk.R.dimen;
import com.aviary.android.feather.sdk.R.id;
import com.aviary.android.feather.sdk.R.layout;
import com.aviary.android.feather.sdk.R.string;
import de.greenrobot.event.EventBus;
import it.sephiroth.android.library.exif2.ExifInterface;
import it.sephiroth.android.library.imagezoom.ImageViewTouch;
import it.sephiroth.android.library.imagezoom.ImageViewTouchBase.DisplayType;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import rx.Observable;
import rx.android.app.AppObservable;
import rx.functions.Action1;

public class AdobeImageEditorActivity
  extends MonitoredActivity
  implements AdobeImageAccountDelegate
{
  protected static LoggerFactory.Logger logger;
  private static boolean mMessageShown;
  private AdobeAccountConnection mAccountConnection;
  private int mActionBarSize = -1;
  private AdobeImageToolBar mAdobeImageToolBar;
  private AdobeImageBottomBarAnimator mBottomBarFlipper;
  private AdobeImageBillingService mContentManagerService;
  private long mDownloadId = -1L;
  private AdobeImageDownloadAsyncTask mDownloadTask;
  private ViewGroup mDrawingViewContainer;
  protected final Handler mHandler = new Handler();
  private AdobeImageViewUndoRedo mImageRestore;
  private View mInlineProgressLoader;
  private boolean mIsRunning;
  private ViewGroup mMainContent;
  protected AdobeImageEditorController mMainController;
  private int mOrientation;
  protected boolean mSaving;
  private boolean mSetupDone;
  private AdobeCustomToast mToastLoader;
  private RecyclerView mToolsList;
  private int pResultCode = 0;
  
  static
  {
    if (!AdobeImageEditorActivity.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      logger = LoggerFactory.getLogger("AdobeImageEditorActivity");
      return;
    }
  }
  
  public AdobeImageEditorActivity() {}
  
  private boolean canShowNextMessage(AdobeImageEditorController paramAdobeImageEditorController)
  {
    boolean bool = true;
    if ((paramAdobeImageEditorController == null) || (!paramAdobeImageEditorController.isClosed()))
    {
      LoggerFactory.Logger localLogger = logger;
      if (paramAdobeImageEditorController != null)
      {
        paramAdobeImageEditorController = Boolean.valueOf(paramAdobeImageEditorController.isClosed());
        localLogger.verbose("controller is closed? %s", new Object[] { paramAdobeImageEditorController });
        bool = false;
      }
    }
    long l;
    do
    {
      return bool;
      paramAdobeImageEditorController = "null";
      break;
      if (mMessageShown) {
        return false;
      }
      if (!SharedPreferencesUtils.getInstance(this).containsSingleTimeKey("first.time.launch.no.message"))
      {
        logger.verbose("don't show message at first launch", new Object[0]);
        return false;
      }
      l = SharedPreferencesUtils.getInstance(this).getLong("message.service.lastMessageShowDate", -1L);
    } while (System.currentTimeMillis() - l >= 259200000L);
    logger.warn("message already shown in the previous 3 days");
    return false;
  }
  
  private void createDownloadErrorDialog()
  {
    addDialogFragment(new DownloadErrorDialogFragment());
  }
  
  private void createExitConfirmationDialog()
  {
    addDialogFragment(new ConfirmExitDialogFragment());
  }
  
  private void createExitNoChangesConfirmationDialog()
  {
    addDialogFragment(new ConfirmExitNoChangesDialogFragment());
  }
  
  private void createFeedBackDialog()
  {
    addDialogFragment(new FeedBackDialogFragment());
  }
  
  private void flagPromoMessageAsShown()
  {
    logger.verbose("flagPromoMessageAsShown", new Object[0]);
    mMessageShown = true;
    SharedPreferencesUtils.getInstance(this).putLong("message.service.lastMessageShowDate", System.currentTimeMillis());
  }
  
  private void hideProgressLoader()
  {
    AlphaAnimation localAlphaAnimation = new AlphaAnimation(1.0F, 0.0F);
    localAlphaAnimation.setDuration(getResources().getInteger(17694721));
    localAlphaAnimation.setAnimationListener(new Animation.AnimationListener()
    {
      public void onAnimationEnd(Animation paramAnonymousAnimation)
      {
        mInlineProgressLoader.setVisibility(8);
      }
      
      public void onAnimationRepeat(Animation paramAnonymousAnimation) {}
      
      public void onAnimationStart(Animation paramAnonymousAnimation) {}
    });
    mInlineProgressLoader.startAnimation(localAlphaAnimation);
  }
  
  private void initializeController()
  {
    mMainController = new AdobeImageEditorController(this);
    mMainController.setIsTablet(ScreenUtils.isTablet(this));
    onControllerLoaded(mMainController);
  }
  
  private void initializeMessages()
  {
    logger.info("initializeMessages");
  }
  
  private void onServiceConnected(AdobeImageBillingService paramAdobeImageBillingService)
  {
    logger.info("onServiceConnected");
    mContentManagerService = paramAdobeImageBillingService;
    if ((isFinishing()) || (!isActive())) {
      return;
    }
    AppObservable.bindActivity(this, mContentManagerService.startSetup()).subscribe(new Action1()new Action1
    {
      public void call(Pair<AccountResult, IabResult> paramAnonymousPair)
      {
        onSetupDone(paramAnonymousPair);
      }
    }, new Action1()
    {
      public void call(Throwable paramAnonymousThrowable)
      {
        onSetupDone(null);
      }
    });
  }
  
  public void addDialogFragment(DialogFragment paramDialogFragment)
  {
    FragmentTransaction localFragmentTransaction = getSupportFragmentManager().beginTransaction();
    Fragment localFragment = getSupportFragmentManager().findFragmentByTag("dialog");
    if (localFragment != null) {
      localFragmentTransaction.remove(localFragment);
    }
    paramDialogFragment.show(localFragmentTransaction, "dialog");
  }
  
  protected void exitWithNoModifications()
  {
    logger.info("exitWithNoModifications");
    Intent localIntent = new Intent();
    localIntent.putExtra("bitmap-changed", false);
    onSetResult(0, localIntent);
    ActivityCompat.finishAfterTransition(this);
  }
  
  public int getActionBarSize()
  {
    if (mActionBarSize < 0) {
      mActionBarSize = UIUtils.getActionBarHeight(this);
    }
    return mActionBarSize;
  }
  
  public AdobeImageBottomBarAnimator getBottomBar()
  {
    return mBottomBarFlipper;
  }
  
  public AdobeImageBillingService getContentService()
  {
    return mAccountConnection.getService();
  }
  
  protected File getDefaultOutputDestination(Bitmap.CompressFormat paramCompressFormat)
  {
    return getSystemDefaultOutput(paramCompressFormat);
  }
  
  public ViewGroup getDrawingImageContainer()
  {
    return mDrawingViewContainer;
  }
  
  public ViewGroup getMainContent()
  {
    return mMainContent;
  }
  
  public AdobeImageEditorController getMainController()
  {
    return mMainController;
  }
  
  public ImageViewTouch getMainImage()
  {
    return mImageRestore;
  }
  
  public AdobeImageToolBar getMainToolBar()
  {
    return mAdobeImageToolBar;
  }
  
  public ViewGroup getOptionsPanelContainer()
  {
    return mBottomBarFlipper.getContentPanel();
  }
  
  protected File getSystemDefaultOutput(Bitmap.CompressFormat paramCompressFormat)
  {
    File localFile = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES);
    StringBuilder localStringBuilder = new StringBuilder().append("aviary-image-").append(System.currentTimeMillis()).append(".");
    if (paramCompressFormat == Bitmap.CompressFormat.JPEG) {}
    for (paramCompressFormat = "jpeg";; paramCompressFormat = "png") {
      return new File(localFile, paramCompressFormat);
    }
  }
  
  public AdobeImageAnalyticsTracker getTracker()
  {
    return mTracker;
  }
  
  protected boolean handleBackPressedOnUnchangedImage()
  {
    boolean bool2 = false;
    logger.verbose("handleBackPressedOnUnchangedImage", new Object[0]);
    boolean bool1 = bool2;
    if (getMainController() != null)
    {
      Object localObject = (LocalDataService)getMainController().getService(LocalDataService.class);
      bool1 = bool2;
      if (localObject != null)
      {
        bool1 = bool2;
        if (((LocalDataService)localObject).getIntentHasExtra("source-type"))
        {
          localObject = (String)((LocalDataService)localObject).getIntentExtra("source-type", AdobeImageIntent.SourceType.Gallery.name());
          bool1 = bool2;
          if (AdobeImageIntent.SourceType.Camera.name().equals(localObject))
          {
            createExitNoChangesConfirmationDialog();
            bool1 = true;
          }
        }
      }
    }
    return bool1;
  }
  
  protected Uri handleIntent(Intent paramIntent)
  {
    logger.verbose("handleIntent: %s", new Object[] { paramIntent });
    if ((paramIntent != null) && (paramIntent.getData() != null))
    {
      Object localObject = paramIntent.getAction();
      HashMap localHashMap = new HashMap();
      if (localObject != null) {}
      for (;;)
      {
        localHashMap.put("from", localObject);
        getTracker().tagEventAttributes("editor: invoked", localHashMap);
        localObject = paramIntent.getData();
        paramIntent = (Intent)localObject;
        if (ApiHelper.isIceCreamSandwich())
        {
          paramIntent = (Intent)localObject;
          if (((Uri)localObject).toString().startsWith("content://com.android.gallery3d.provider")) {
            paramIntent = Uri.parse(((Uri)localObject).toString().replace("com.android.gallery3d", "com.google.android.gallery3d"));
          }
        }
        logger.log("src: " + paramIntent);
        return paramIntent;
        localObject = "null";
      }
    }
    return null;
  }
  
  public void hideProgress(boolean paramBoolean)
  {
    if (!paramBoolean) {
      mAdobeImageToolBar.setApplyProgressVisible(false);
    }
    while (mToastLoader == null) {
      return;
    }
    mToastLoader.hide();
    mToastLoader = null;
  }
  
  public void hideProgressIfVisible()
  {
    if (mAdobeImageToolBar.getApplyProgressVisible()) {
      mAdobeImageToolBar.setApplyProgressVisible(false);
    }
    if (mToastLoader != null)
    {
      mToastLoader.hide();
      mToastLoader = null;
    }
  }
  
  public boolean isActive()
  {
    return mIsRunning;
  }
  
  public boolean isContentServiceConnected()
  {
    return mAccountConnection.isConnected();
  }
  
  protected void loadImage(Uri paramUri)
  {
    logger.verbose("loadImage: %s", new Object[] { paramUri });
    if (mDownloadTask != null)
    {
      mDownloadTask.setEnabled(false);
      mDownloadTask = null;
    }
    LocalDataService localLocalDataService = (LocalDataService)mMainController.getService(LocalDataService.class);
    assert (localLocalDataService != null);
    int i = ((Integer)localLocalDataService.getIntentExtra("max-image-size", Integer.valueOf(0))).intValue();
    localLocalDataService.setSourceImageUri(paramUri);
    mDownloadTask = new AdobeImageDownloadAsyncTask(mDownloadId, paramUri, i);
    mDownloadTask.executeInParallel(new Context[] { this });
    mImageRestore.setIsActive(false);
  }
  
  protected void loadTools()
  {
    logger.verbose("loadTools", new Object[0]);
    List localList = null;
    LocalDataService localLocalDataService = (LocalDataService)mMainController.getService(LocalDataService.class);
    if (mMainController.getToolList() == null)
    {
      assert (localLocalDataService != null);
      if (localLocalDataService.getIntentHasExtra("tools-list")) {
        localList = Arrays.asList((Object[])localLocalDataService.getIntentExtra("tools-list", new String[0]));
      }
      new ToolsLoaderAsyncTask(localList).executeInParallel(new AdobeImageEditorActivity[] { this });
    }
  }
  
  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    logger.verbose("onActivityResult: %d - %d", new Object[] { Integer.valueOf(paramInt1), Integer.valueOf(paramInt2) });
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
    EventBusUtils.register(this);
    if ((getContentService() != null) && (getContentService().handleActivityResult(paramInt1, paramInt2, paramIntent))) {
      return;
    }
    mMainController.onActivityResult(paramInt1, paramInt2, paramIntent);
  }
  
  public void onBackPressed()
  {
    Object localObject;
    if (!mMainController.onBackPressed())
    {
      if (mToastLoader != null)
      {
        mToastLoader.hide();
        mToastLoader = null;
      }
      localObject = getSupportFragmentManager();
      if (((FragmentManager)localObject).getBackStackEntryCount() <= 0) {
        break label61;
      }
      logger.verbose("remove fragments...", new Object[0]);
      ((FragmentManager)localObject).popBackStack();
    }
    label61:
    do
    {
      return;
      if (mMainController.getBitmapIsChanged())
      {
        localObject = (LocalDataService)mMainController.getService(LocalDataService.class);
        if ((localObject != null) && (((Boolean)((LocalDataService)localObject).getIntentExtra("hide-exit-unsave-confirmation", Boolean.valueOf(false))).booleanValue()))
        {
          super.onBackPressed();
          return;
        }
        createExitConfirmationDialog();
        return;
      }
    } while (handleBackPressedOnUnchangedImage());
    onSetResult(0, null);
    super.onBackPressed();
  }
  
  public void onBackPressed(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      super.onBackPressed();
      return;
    }
    onBackPressed();
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    super.onConfigurationChanged(paramConfiguration);
    if (mOrientation != orientation)
    {
      mOrientation = orientation;
      if (mMainController != null) {
        mMainController.onConfigurationChanged(paramConfiguration);
      }
    }
    mOrientation = orientation;
  }
  
  public void onContentChanged()
  {
    super.onContentChanged();
    mBottomBarFlipper = ((AdobeImageBottomBarAnimator)findViewById(R.id.bottombar));
    mToolsList = mBottomBarFlipper.getToolsListView();
    mDrawingViewContainer = ((ViewGroup)findViewById(R.id.drawing_view_container));
    mInlineProgressLoader = findViewById(R.id.image_loading_view);
    mImageRestore = ((AdobeImageViewUndoRedo)findViewById(R.id.image));
    mMainContent = ((ViewGroup)findViewById(R.id.main_content));
    mAdobeImageToolBar = ((AdobeImageToolBar)getToolbar());
    mAdobeImageToolBar.setClickable(false);
    mAdobeImageToolBar.setSaveEnabled(false);
    mImageRestore.setDisplayType(ImageViewTouchBase.DisplayType.FIT_IF_BIGGER);
    mToolsList.setEnabled(false);
    mToolsList.setHasFixedSize(true);
    mToolsList.setLayoutManager(new LinearLayoutManager(this, 0, false));
  }
  
  protected void onControllerLoaded(AdobeImageEditorController paramAdobeImageEditorController)
  {
    tryConnectToContentService().doOnError(new Action1()
    {
      public void call(Throwable paramAnonymousThrowable)
      {
        AdobeImageEditorActivity.logger.error("connection error: %s", new Object[] { paramAnonymousThrowable.getMessage() });
      }
    }).doOnNext(new Action1()
    {
      public void call(AdobeImageBillingService paramAnonymousAdobeImageBillingService)
      {
        AdobeImageEditorActivity.logger.verbose("connected!", new Object[0]);
        AdobeImageEditorActivity.this.onServiceConnected(paramAnonymousAdobeImageBillingService);
      }
    }).subscribe();
  }
  
  public void onCreate(Bundle paramBundle)
  {
    long l = DateTimeUtils.tick();
    onPreCreate();
    super.onCreate(paramBundle);
    if (!ScreenUtils.isTablet(this)) {
      setRequestedOrientation(1);
    }
    setContentView(R.layout.com_adobe_image_main_layout);
    onSetResult(0, null);
    mAccountConnection = new AdobeAccountConnection(this);
    initializeController();
    onInitializeUtils();
    paramBundle = handleIntent(getIntent());
    if (paramBundle == null)
    {
      onSetResult(0, null);
      ActivityCompat.finishAfterTransition(this);
      return;
    }
    loadTools();
    loadImage(paramBundle);
    onPostCreate();
    getTracker().tagEvent("editor: opened");
    DateTimeUtils.tick(l, "onCreate finished");
    logger.verbose("actionbarsize: " + UIUtils.getActionBarHeight(this), new Object[0]);
  }
  
  protected void onDestroy()
  {
    if (pResultCode != -1) {
      getTracker().tagEvent("editor: cancelled");
    }
    super.onDestroy();
    EventBusUtils.unregister(this);
    if (mDownloadTask != null)
    {
      mDownloadTask.setEnabled(false);
      mDownloadTask = null;
    }
    if (mMainController != null) {
      mMainController.dispose();
    }
    mAccountConnection.dispose();
    mMainController = null;
  }
  
  public void onEvent(final MessageUserActionEvent paramMessageUserActionEvent)
  {
    logger.verbose("MessageUserActionEvent", new Object[0]);
    if (extras != null)
    {
      Object localObject = extras.getString("extra-in-quick-tool");
      paramMessageUserActionEvent = extras.getBundle("extra-in-quick-tool-options");
      localObject = ToolLoaderFactory.findToolByName((String)localObject);
      if ((localObject != null) && (paramMessageUserActionEvent != null)) {
        mHandler.postDelayed(new Runnable()
        {
          public void run()
          {
            EventBusUtils.getInstance().post(new QuickLaunchEvent(val$tool, paramMessageUserActionEvent));
          }
        }, 500L);
      }
    }
  }
  
  public void onEventMainThread(AdobeImageEditorActivity.ToolsListAdapter.ToolsListFeedbackEvent paramToolsListFeedbackEvent)
  {
    createFeedBackDialog();
  }
  
  public void onEventMainThread(AdobeImageDownloadAsyncTask.DownloadCompleteEvent paramDownloadCompleteEvent)
  {
    logger.info("DownloadCompleteEvent, %d == %d", new Object[] { Long.valueOf(paramDownloadCompleteEvent.getId()), Long.valueOf(mDownloadId) });
    if (paramDownloadCompleteEvent.getId() == mDownloadId)
    {
      mDownloadTask.setEnabled(false);
      mDownloadTask = null;
      Object localObject = bitmap;
      paramDownloadCompleteEvent = imageInfo;
      getMainImage().setImageBitmap((Bitmap)localObject, null, -1.0F, -1.0F);
      Animation localAnimation = AnimationUtils.loadAnimation(this, 17432576);
      localAnimation.setFillEnabled(true);
      mImageRestore.setVisibility(0);
      mImageRestore.startAnimation(localAnimation);
      hideProgressLoader();
      if (mMainController != null)
      {
        if (!mMainController.getEnabled()) {
          mMainController.onActivate((Bitmap)localObject, paramDownloadCompleteEvent);
        }
        mImageRestore.setIsActive(true);
      }
      if ((localObject != null) && (paramDownloadCompleteEvent.getOriginalSize() != null))
      {
        logger.error("original.size: " + paramDownloadCompleteEvent.getOriginalSize()[0] + "x" + paramDownloadCompleteEvent.getOriginalSize()[1]);
        logger.error("final.size: " + ((Bitmap)localObject).getWidth() + "x" + ((Bitmap)localObject).getHeight());
      }
      localObject = getIntent();
      int j = 0;
      int i = j;
      if (localObject != null)
      {
        i = j;
        if (((Intent)localObject).hasExtra("extra-in-quick-tool"))
        {
          paramDownloadCompleteEvent = ToolLoaderFactory.findToolByName(((Intent)localObject).getStringExtra("extra-in-quick-tool"));
          localObject = ((Intent)localObject).getBundleExtra("extra-in-quick-tool-options");
          EventBusUtils.getInstance().post(new QuickLaunchEvent(paramDownloadCompleteEvent, (Bundle)localObject));
          i = 1;
        }
      }
      if (i == 0) {
        initializeMessages();
      }
      return;
    }
    logger.warn("different id");
  }
  
  public void onEventMainThread(AdobeImageDownloadAsyncTask.DownloadErrorEvent paramDownloadErrorEvent)
  {
    if (paramDownloadErrorEvent.getId() == mDownloadId)
    {
      logger.error("onDownloadError", new Object[] { error });
      mDownloadTask.setEnabled(false);
      mDownloadTask = null;
      hideProgressLoader();
      createDownloadErrorDialog();
    }
  }
  
  public void onEventMainThread(AdobeImageDownloadAsyncTask.DownloadStartEvent paramDownloadStartEvent)
  {
    logger.verbose("DownloadStartEvent", new Object[0]);
    if (paramDownloadStartEvent.getId() == mDownloadId) {
      mImageRestore.setVisibility(4);
    }
    paramDownloadStartEvent = (LocalDataService)mMainController.getService(LocalDataService.class);
    if ((paramDownloadStartEvent != null) && (paramDownloadStartEvent.hasAccentColor()))
    {
      int i = paramDownloadStartEvent.getAccentColor(0);
      logger.verbose("accentColor: %x", new Object[] { Integer.valueOf(i) });
      if (i != 0) {
        UIUtils.setIndeterminateProgressBarTint((ProgressBar)mInlineProgressLoader.findViewById(R.id.progress), i);
      }
    }
    mInlineProgressLoader.setVisibility(0);
  }
  
  public void onEventMainThread(ToolsLoaderAsyncTask.ToolsLoadedEvent paramToolsLoadedEvent)
  {
    boolean bool = false;
    logger.verbose("ToolsLoadedEvent", new Object[0]);
    if (!isDestroyed())
    {
      if (!PackageManagerUtils.isStandalone(this)) {
        bool = true;
      }
      mToolsList.setAdapter(new ToolsListAdapter(this, entries, bool));
      mMainController.setToolList(labels);
    }
  }
  
  public void onEventMainThread(final ToolEntry paramToolEntry)
  {
    if ((mToolsList.isEnabled()) && (mToolsList.getAdapter() != null))
    {
      final Point localPoint = null;
      int i = 0;
      while (i < mToolsList.getChildCount())
      {
        View localView = mToolsList.getChildAt(i);
        if (paramToolEntry == localView.getTag()) {
          localPoint = new Point(localView.getLeft() + localView.getWidth() / 2, localView.getTop() + localView.getHeight() / 2);
        }
        i += 1;
      }
      mHandler.postDelayed(new Runnable()
      {
        public void run()
        {
          mMainController.activateTool(paramToolEntry, null, localPoint);
        }
      }, 150L);
    }
  }
  
  public void onEventMainThread(ControllerStateChangedEvent paramControllerStateChangedEvent)
  {
    onStateChanged(newState, oldState);
  }
  
  public void onEventMainThread(HistoryUndoRedoEvent paramHistoryUndoRedoEvent)
  {
    logger.verbose("HistoryUndoRedoEvent", new Object[0]);
    if (isUndo)
    {
      mMainController.onUndo();
      return;
    }
    mMainController.onRedo();
  }
  
  public void onEventMainThread(MessageReceivedEvent paramMessageReceivedEvent)
  {
    logger.info("onEventMainThread(MessageReceivedEvent)");
    Object localObject = getMainController();
    if ((!mMessageShown) && (localObject != null) && (((AdobeImageEditorController)localObject).isClosed()))
    {
      localObject = new MessagePromoDialogFragment();
      ((MessagePromoDialogFragment)localObject).setArguments(extra);
      addDialogFragment((DialogFragment)localObject);
      flagPromoMessageAsShown();
      return;
    }
    logger.warn("message already shown in this session");
  }
  
  public void onEventMainThread(AdobeImageToolBar.ToolBarApplyEvent paramToolBarApplyEvent)
  {
    logger.verbose("ToolBarApplyEvent", new Object[0]);
    mMainController.onApply();
  }
  
  public void onEventMainThread(AdobeImageToolBar.ToolBarDoneEvent paramToolBarDoneEvent)
  {
    logger.verbose("ToolBarDoneEvent", new Object[0]);
    if ((mMainController != null) && (mMainController.getEnabled()))
    {
      paramToolBarDoneEvent = (LocalDataService)mMainController.getService(LocalDataService.class);
      boolean bool1 = mMainController.getBitmapIsChanged();
      assert (paramToolBarDoneEvent != null);
      boolean bool2 = ((Boolean)paramToolBarDoneEvent.getIntentExtra("save-on-no-changes", Boolean.valueOf(true))).booleanValue();
      logger.log("bitmap changed: %b", new Object[] { Boolean.valueOf(bool1) });
      logger.log("save with no changes: %b", new Object[] { Boolean.valueOf(bool2) });
      if ((bool1) || (bool2)) {
        break label147;
      }
      exitWithNoModifications();
    }
    label147:
    do
    {
      return;
      paramToolBarDoneEvent = mMainController.getBitmap();
    } while (paramToolBarDoneEvent == null);
    performSave(paramToolBarDoneEvent);
  }
  
  protected void onInitializeUtils()
  {
    try
    {
      NativeFilterProxy.init(this);
      return;
    }
    catch (AdobeImageInitializationException localAdobeImageInitializationException)
    {
      localAdobeImageInitializationException.printStackTrace();
      Toast.makeText(getApplicationContext(), "Sorry an error occurred: " + localAdobeImageInitializationException.getMessage(), 1).show();
      ActivityCompat.finishAfterTransition(this);
    }
  }
  
  protected void onPause()
  {
    super.onPause();
    EventBusUtils.unregister(this);
    mMainController.onPause();
    mIsRunning = false;
  }
  
  protected void onPostCreate() {}
  
  protected void onPreCreate()
  {
    if (mDownloadId == -1L) {
      mDownloadId = SystemClock.elapsedRealtime();
    }
  }
  
  protected void onRestart()
  {
    super.onRestart();
  }
  
  protected void onRestoreInstanceState(Bundle paramBundle)
  {
    super.onRestoreInstanceState(paramBundle);
  }
  
  protected void onResume()
  {
    super.onResume();
    EventBusUtils.register(this);
    mMainController.onResume();
    mIsRunning = true;
  }
  
  protected void onSaveCompleted(Pair<String, Uri> paramPair, FinalAction paramFinalAction)
  {
    logger.info("onSaveCompleted");
    paramFinalAction = new Intent();
    if (paramPair != null)
    {
      paramFinalAction.setDataAndType(Uri.parse((String)first), "image/jpeg");
      paramFinalAction.putExtra("extra-output-uri", (Parcelable)second);
    }
    onSetResult(-1, paramFinalAction);
    ActivityCompat.finishAfterTransition(this);
  }
  
  protected void onSaveCustomTags(ExifInterface paramExifInterface) {}
  
  protected void onSaveError(String paramString)
  {
    onSetResult(0, null);
    new AlertDialog.Builder(this).setTitle(R.string.feather_generic_error_title).setMessage(paramString).setCancelable(false).setOnCancelListener(new DialogInterface.OnCancelListener()
    {
      public void onCancel(DialogInterface paramAnonymousDialogInterface)
      {
        onSetResult(0, null);
        ActivityCompat.finishAfterTransition(AdobeImageEditorActivity.this);
      }
    }).setPositiveButton(R.string.feather_close, new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        onSetResult(0, null);
        ActivityCompat.finishAfterTransition(AdobeImageEditorActivity.this);
      }
    }).show();
  }
  
  protected void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
  }
  
  protected final void onSetResult(int paramInt, Intent paramIntent)
  {
    pResultCode = paramInt;
    Intent localIntent = paramIntent;
    if (paramIntent == null) {
      localIntent = new Intent();
    }
    paramIntent = getIntent();
    if (paramIntent != null)
    {
      paramIntent = paramIntent.getBundleExtra("extra-in-extras");
      if (paramIntent != null) {
        localIntent.putExtra("extra-in-extras", paramIntent);
      }
      if ((mMainController != null) && (!localIntent.hasExtra("bitmap-changed"))) {
        localIntent.putExtra("bitmap-changed", mMainController.getBitmapIsChanged());
      }
    }
    setResult(paramInt, localIntent);
  }
  
  public void onSetupDone(Pair<AccountResult, IabResult> paramPair)
  {
    if ((isFinishing()) || (!isActive()) || (mSetupDone)) {}
    AdobeImageEditorController localAdobeImageEditorController;
    do
    {
      return;
      localAdobeImageEditorController = getMainController();
    } while (localAdobeImageEditorController == null);
    if ((paramPair != null) && (second != null) && (((IabResult)second).isSuccess())) {
      mSetupDone = true;
    }
    logger.log("onSetupDone: %s", new Object[] { paramPair });
    if (canShowNextMessage(localAdobeImageEditorController))
    {
      paramPair = (MessageService)localAdobeImageEditorController.getService(MessageService.class);
      if (paramPair != null)
      {
        paramPair.processMessages();
        return;
      }
      logger.warn("messageService is null");
      return;
    }
    logger.verbose("can't show next message", new Object[0]);
  }
  
  public void onStart()
  {
    super.onStart();
    mOrientation = getResourcesgetConfigurationorientation;
  }
  
  protected void onStateChanged(int paramInt1, int paramInt2)
  {
    switch (paramInt1)
    {
    default: 
      logger.warn("state not handled: %d", new Object[] { Integer.valueOf(paramInt1) });
      return;
    case 1: 
      mAdobeImageToolBar.setClickable(false);
      return;
    case 2: 
      mAdobeImageToolBar.setClickable(true);
      return;
    case 3: 
      mAdobeImageToolBar.setClickable(false);
      mImageRestore.setVisibility(0);
      return;
    case 4: 
    case 5: 
      mToolsList.setEnabled(true);
      mAdobeImageToolBar.setClickable(true);
      mAdobeImageToolBar.close();
      mAdobeImageToolBar.setSaveEnabled(true);
      return;
    }
    mToolsList.setEnabled(false);
    mAdobeImageToolBar.setClickable(false);
    mAdobeImageToolBar.setSaveEnabled(false);
  }
  
  public void onStop()
  {
    super.onStop();
  }
  
  protected void performSave(Bitmap paramBitmap)
  {
    if (mSaving) {
      return;
    }
    mSaving = true;
    getTracker().tagEvent("editor: saved", new String[] { "tool_count", String.valueOf(mMainController.getToolCompleteCount()) });
    mMainController.setEnabled(false);
    LocalDataService localLocalDataService = (LocalDataService)mMainController.getService(LocalDataService.class);
    assert (localLocalDataService != null);
    if (((Boolean)localLocalDataService.getIntentExtra("return-data", Boolean.valueOf(false))).booleanValue())
    {
      localObject = new Bundle();
      ((Bundle)localObject).putParcelable("data", paramBitmap);
      onSetResult(-1, new Intent().setData(localLocalDataService.getDestImageUri()).setAction("inline-data").putExtras((Bundle)localObject));
      ActivityCompat.finishAfterTransition(this);
      return;
    }
    Object localObject = (HiResBackgroundService)mMainController.getService(HiResBackgroundService.class);
    assert (localObject != null);
    boolean bool = ((HiResBackgroundService)localObject).getHiresEnabled();
    localObject = FinalAction.ASK;
    if ("aviary.intent.action.EDIT".equals(getIntent().getAction())) {
      localObject = FinalAction.CLOSE;
    }
    performSave(paramBitmap, localLocalDataService.getDestImageUri(), localLocalDataService.getOutputFormat(), localLocalDataService.getOutputQuality(), bool, (FinalAction)localObject);
  }
  
  protected void performSave(Bitmap paramBitmap, Uri paramUri, Bitmap.CompressFormat paramCompressFormat, int paramInt, boolean paramBoolean, FinalAction paramFinalAction)
  {
    logger.info("performSave, uri:%s, quality: %d, action:%s", new Object[] { paramUri, Integer.valueOf(paramInt), paramFinalAction });
    if (paramUri != null) {}
    for (paramUri = new File(paramUri.getPath());; paramUri = getDefaultOutputDestination(paramCompressFormat))
    {
      try
      {
        logger.log("trying to create the new file...");
        Uri localUri1 = paramUri;
        if (!paramUri.exists())
        {
          localUri1 = paramUri;
          if (!paramUri.createNewFile())
          {
            logger.error("Failed to create the file");
            localUri1 = paramUri;
          }
        }
      }
      catch (IOException localIOException1)
      {
        Uri localUri2;
        for (;;)
        {
          localIOException1.printStackTrace();
          try
          {
            logger.error("using a temporary file!");
            File localFile = File.createTempFile("aviary-image-", ".jpeg");
          }
          catch (IOException localIOException2)
          {
            localIOException2.printStackTrace();
            localUri2 = paramUri;
          }
        }
        paramUri.setDestImageUri(Uri.parse(localUri2.getAbsolutePath()));
        new SaveHiResImageTask(localUri2, paramFinalAction, paramCompressFormat, paramInt, paramBoolean).execute(new Bitmap[] { paramBitmap });
      }
      paramUri = (LocalDataService)getMainController().getService(LocalDataService.class);
      if (($assertionsDisabled) || (paramUri != null)) {
        break;
      }
      throw new AssertionError();
    }
  }
  
  protected void saveExif(String paramString)
  {
    logger.log("saveExif: " + paramString);
    if (paramString == null) {
      return;
    }
    Object localObject = (LocalDataService)mMainController.getService(LocalDataService.class);
    ExifInterface localExifInterface = new ExifInterface();
    if (localObject != null)
    {
      localObject = ((LocalDataService)localObject).getImageInfo();
      if (localObject != null) {
        localExifInterface.setTags(((ImageInfo)localObject).getExifTagList());
      }
    }
    localExifInterface.deleteTag(ExifInterface.TAG_IMAGE_WIDTH);
    localExifInterface.deleteTag(ExifInterface.TAG_IMAGE_LENGTH);
    localExifInterface.setTag(localExifInterface.buildTag(ExifInterface.TAG_ORIENTATION, Integer.valueOf(0)));
    localExifInterface.setTag(localExifInterface.buildTag(ExifInterface.TAG_SOFTWARE, "Aviary for Android 4.1.1"));
    onSaveCustomTags(localExifInterface);
    try
    {
      localExifInterface.writeExif(paramString);
      return;
    }
    catch (Throwable paramString)
    {
      paramString.printStackTrace();
    }
  }
  
  public void showProgress(boolean paramBoolean)
  {
    if (!paramBoolean)
    {
      mAdobeImageToolBar.setApplyProgressVisible(true);
      return;
    }
    if (mToastLoader == null) {
      mToastLoader = AdobeImageUIUtils.createModalLoaderToast(this);
    }
    mToastLoader.show();
  }
  
  public Observable<AdobeImageBillingService> tryConnectToContentService()
  {
    return mAccountConnection.tryConnect();
  }
  
  public static enum FinalAction
  {
    ASK,  CLOSE;
    
    private FinalAction() {}
  }
  
  class SaveHiResImageTask
    extends AdobeImageAsyncTask<Bitmap, Integer, Pair<String, Uri>>
    implements DialogInterface.OnDismissListener, MediaScannerConnection.OnScanCompletedListener, SingleMediaScannerItem.OnScanErrorListener, HiResBackgroundService.OnHiresListener
  {
    LoggerFactory.Logger logger = LoggerFactory.getLogger("SaveHiResImageTask", LoggerFactory.LoggerType.ConsoleLoggerType);
    Bitmap mBitmap;
    Bitmap.CompressFormat mCompressFormat;
    private int mCompressQuality;
    File mDestFile;
    String mErrorString;
    AdobeImageEditorActivity.FinalAction mFinalAction;
    private final Object mFinishedLock = new Object();
    AdobeImageExecutionException mHiresException;
    boolean mIsHiRes;
    private Uri mOutputContentUri;
    ProgressDialog mProgress;
    private final Object mScanCompletedLock = new Object();
    
    public SaveHiResImageTask(File paramFile, AdobeImageEditorActivity.FinalAction paramFinalAction, Bitmap.CompressFormat paramCompressFormat, int paramInt, boolean paramBoolean)
    {
      logger.info("ctor, file: %s, action: %s, hires: %b", new Object[] { paramFile.getAbsolutePath(), paramFinalAction, Boolean.valueOf(paramBoolean) });
      mFinalAction = paramFinalAction;
      mDestFile = paramFile;
      mIsHiRes = paramBoolean;
      mCompressFormat = paramCompressFormat;
      mCompressQuality = paramInt;
    }
    
    private boolean saveInBackgroundHiRes()
    {
      logger.info("saveInBackgroundHiRes");
      ??? = (SessionService)mMainController.getService(SessionService.class);
      if (??? == null) {
        return false;
      }
      mMainController.addOnHiresListener(this);
      ((SessionService)???).save(mDestFile.getAbsolutePath(), mCompressFormat, mCompressQuality);
      logger.log("waiting for notification from mFinishedLock..");
      synchronized (mFinishedLock)
      {
        logger.log("waiting for mFinishedLock...");
        try
        {
          mFinishedLock.wait();
          mMainController.removeOnHiresListener(this);
          return true;
        }
        catch (InterruptedException localInterruptedException)
        {
          localInterruptedException.printStackTrace();
          mMainController.removeOnHiresListener(this);
          return false;
        }
      }
    }
    
    private boolean saveInBackgroundLowRes()
    {
      logger.info("saveInBackgroundLowRes");
      try
      {
        FileOutputStream localFileOutputStream = new FileOutputStream(mDestFile);
        mBitmap.compress(mCompressFormat, mCompressQuality, localFileOutputStream);
        IOUtils.closeSilently(localFileOutputStream);
        return true;
      }
      catch (IOException localIOException)
      {
        logger.error(localIOException.getMessage());
        mErrorString = localIOException.getMessage();
        localIOException.printStackTrace();
      }
      return false;
    }
    
    /* Error */
    protected Pair<String, Uri> doInBackground(Bitmap... arg1)
    {
      // Byte code:
      //   0: aload_0
      //   1: aload_1
      //   2: iconst_0
      //   3: aaload
      //   4: putfield 159	com/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask:mBitmap	Landroid/graphics/Bitmap;
      //   7: aload_0
      //   8: getfield 98	com/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask:mIsHiRes	Z
      //   11: ifeq +17 -> 28
      //   14: aload_0
      //   15: invokespecial 186	com/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask:saveInBackgroundHiRes	()Z
      //   18: istore_2
      //   19: aload_0
      //   20: invokevirtual 189	com/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask:isCancelled	()Z
      //   23: ifeq +13 -> 36
      //   26: aconst_null
      //   27: areturn
      //   28: aload_0
      //   29: invokespecial 191	com/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask:saveInBackgroundLowRes	()Z
      //   32: istore_2
      //   33: goto -14 -> 19
      //   36: iload_2
      //   37: ifeq +153 -> 190
      //   40: aload_0
      //   41: getfield 96	com/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask:mDestFile	Ljava/io/File;
      //   44: ifnull +146 -> 190
      //   47: aload_0
      //   48: getfield 179	com/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask:mErrorString	Ljava/lang/String;
      //   51: ifnonnull +139 -> 190
      //   54: aload_0
      //   55: getfield 193	com/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask:mHiresException	Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;
      //   58: ifnonnull +132 -> 190
      //   61: aload_0
      //   62: getfield 72	com/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask:logger	Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
      //   65: ldc -61
      //   67: iconst_0
      //   68: anewarray 52	java/lang/Object
      //   71: invokeinterface 198 3 0
      //   76: aload_0
      //   77: getfield 47	com/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask:this$0	Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;
      //   80: aload_0
      //   81: getfield 96	com/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask:mDestFile	Ljava/io/File;
      //   84: invokestatic 204	com/adobe/creativesdk/aviary/internal/media/MediaUtils:insertImage	(Landroid/content/Context;Ljava/io/File;)Landroid/net/Uri;
      //   87: pop
      //   88: aload_0
      //   89: getfield 47	com/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask:this$0	Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;
      //   92: aload_0
      //   93: getfield 96	com/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask:mDestFile	Ljava/io/File;
      //   96: invokevirtual 80	java/io/File:getAbsolutePath	()Ljava/lang/String;
      //   99: invokevirtual 207	com/adobe/creativesdk/aviary/AdobeImageEditorActivity:saveExif	(Ljava/lang/String;)V
      //   102: new 209	com/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem
      //   105: dup
      //   106: aload_0
      //   107: getfield 47	com/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask:this$0	Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;
      //   110: aload_0
      //   111: getfield 96	com/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask:mDestFile	Ljava/io/File;
      //   114: aload_0
      //   115: aload_0
      //   116: invokespecial 212	com/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem:<init>	(Landroid/content/Context;Ljava/io/File;Landroid/media/MediaScannerConnection$OnScanCompletedListener;Lcom/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem$OnScanErrorListener;)V
      //   119: invokevirtual 215	com/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem:run	()V
      //   122: aload_0
      //   123: getfield 57	com/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask:mScanCompletedLock	Ljava/lang/Object;
      //   126: astore_1
      //   127: aload_1
      //   128: monitorenter
      //   129: aload_0
      //   130: getfield 57	com/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask:mScanCompletedLock	Ljava/lang/Object;
      //   133: invokevirtual 141	java/lang/Object:wait	()V
      //   136: aload_1
      //   137: monitorexit
      //   138: aload_0
      //   139: getfield 96	com/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask:mDestFile	Ljava/io/File;
      //   142: invokevirtual 80	java/io/File:getAbsolutePath	()Ljava/lang/String;
      //   145: aload_0
      //   146: getfield 217	com/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask:mOutputContentUri	Landroid/net/Uri;
      //   149: invokestatic 223	android/util/Pair:create	(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;
      //   152: areturn
      //   153: astore_1
      //   154: aload_1
      //   155: invokevirtual 224	java/lang/IllegalStateException:printStackTrace	()V
      //   158: aload_0
      //   159: aload_1
      //   160: invokevirtual 225	java/lang/IllegalStateException:getMessage	()Ljava/lang/String;
      //   163: putfield 179	com/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask:mErrorString	Ljava/lang/String;
      //   166: aconst_null
      //   167: areturn
      //   168: astore_3
      //   169: aload_3
      //   170: invokevirtual 148	java/lang/InterruptedException:printStackTrace	()V
      //   173: aload_0
      //   174: aload_3
      //   175: invokevirtual 226	java/lang/InterruptedException:getMessage	()Ljava/lang/String;
      //   178: putfield 179	com/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask:mErrorString	Ljava/lang/String;
      //   181: aload_1
      //   182: monitorexit
      //   183: aconst_null
      //   184: areturn
      //   185: astore_3
      //   186: aload_1
      //   187: monitorexit
      //   188: aload_3
      //   189: athrow
      //   190: aload_0
      //   191: getfield 72	com/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask:logger	Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
      //   194: ldc -28
      //   196: invokeinterface 231 2 0
      //   201: aconst_null
      //   202: areturn
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	203	0	this	SaveHiResImageTask
      //   18	19	2	bool	boolean
      //   168	7	3	localInterruptedException	InterruptedException
      //   185	4	3	localObject	Object
      // Exception table:
      //   from	to	target	type
      //   76	88	153	java/lang/IllegalStateException
      //   129	136	168	java/lang/InterruptedException
      //   129	136	185	finally
      //   136	138	185	finally
      //   169	183	185	finally
      //   186	188	185	finally
    }
    
    protected void doPostExecute(Pair<String, Uri> paramPair)
    {
      logger.info("doPostExecute, mErrorString:%s, mHiResException: %s", new Object[] { mErrorString, mHiresException });
      try
      {
        if (mProgress.getWindow() != null) {
          mProgress.dismiss();
        }
        if (isCancelled())
        {
          logger.warn("was cancelled..");
          onSetResult(0, null);
          supportFinishAfterTransition();
          return;
        }
      }
      catch (Throwable localThrowable)
      {
        for (;;)
        {
          localThrowable.printStackTrace();
          logger.error(localThrowable.getMessage());
        }
        if ((mHiresException != null) || (mErrorString != null) || (paramPair == null))
        {
          if (mHiresException != null)
          {
            performSave(mBitmap, null, mCompressFormat, mCompressQuality, false, mFinalAction);
            return;
          }
          AdobeImageEditorActivity localAdobeImageEditorActivity = AdobeImageEditorActivity.this;
          if (mErrorString != null) {}
          for (paramPair = mErrorString;; paramPair = getString(R.string.feather_error_saving_image))
          {
            localAdobeImageEditorActivity.onSaveError(paramPair);
            return;
          }
        }
        onSaveCompleted(paramPair, mFinalAction);
      }
    }
    
    protected void doPreExecute()
    {
      logger.info("doPreExecute");
      mProgress = new ProgressDialog(AdobeImageEditorActivity.this);
      mProgress.setIndeterminate(true);
      mProgress.setProgressStyle(1);
      mProgress.setCancelable(true);
      mProgress.setCanceledOnTouchOutside(false);
      mProgress.setOnDismissListener(this);
      mProgress.setMessage(getString(R.string.feather_save_progress));
      mProgress.show();
    }
    
    protected void doProgressUpdate(Integer... paramVarArgs)
    {
      int i = paramVarArgs[0].intValue();
      int j = paramVarArgs[1].intValue();
      logger.info("doProgressUpdate. %d/%d", new Object[] { Integer.valueOf(i), Integer.valueOf(j) });
      if (i == 0)
      {
        paramVarArgs = getString(R.string.feather_loading_image);
        mProgress.setProgress(0);
        mProgress.setIndeterminate(true);
      }
      for (;;)
      {
        mProgress.setMessage(paramVarArgs);
        return;
        if (i != j) {
          break;
        }
        paramVarArgs = getString(R.string.feather_save_progress);
        mProgress.setProgress(100);
        mProgress.setIndeterminate(true);
      }
      float f;
      if ((i >= 0) && (i <= j)) {
        f = i / j;
      }
      for (;;)
      {
        try
        {
          mProgress.setProgress((int)(f * 100.0F));
          mProgress.setIndeterminate(false);
          paramVarArgs = "Applying actions...";
        }
        catch (Exception paramVarArgs)
        {
          mProgress.setIndeterminate(true);
          continue;
        }
        mProgress.setIndeterminate(true);
      }
    }
    
    protected void onCancelled()
    {
      logger.error("save task cancelled");
      onSetResult(0, null);
      ActivityCompat.finishAfterTransition(AdobeImageEditorActivity.this);
    }
    
    public void onDismiss(DialogInterface paramDialogInterface)
    {
      logger.error("onDismiss");
      cancel(true);
    }
    
    public void onHiresComplete()
    {
      logger.log("onHiresComplete");
      synchronized (mFinishedLock)
      {
        mFinishedLock.notify();
        return;
      }
    }
    
    public void onHiresError(AdobeImageExecutionException arg1)
    {
      logger.info("onHiresError: %s", new Object[] { ??? });
      mHiresException = ???;
      synchronized (mFinishedLock)
      {
        mFinishedLock.notify();
        return;
      }
    }
    
    public void onHiresProgress(int paramInt1, int paramInt2)
    {
      publishProgress(new Integer[] { Integer.valueOf(paramInt1), Integer.valueOf(paramInt2) });
    }
    
    public void onScanCompleted(String arg1, Uri paramUri)
    {
      logger.info("onScanCompleted: " + ??? + ", uri: " + paramUri);
      mOutputContentUri = paramUri;
      synchronized (mScanCompletedLock)
      {
        mScanCompletedLock.notify();
        return;
      }
    }
    
    public void onScanError()
    {
      logger.error("onScanError");
      synchronized (mScanCompletedLock)
      {
        mScanCompletedLock.notify();
        return;
      }
    }
  }
  
  static final class ToolsListAdapter
    extends RecyclerView.Adapter<ToolsViewHolder>
    implements View.OnClickListener
  {
    boolean mHideFeedback;
    LayoutInflater mInflater;
    List<ToolEntry> mObjects;
    int mToolDefaultWidth;
    int mToolViewWidth;
    int mViewWidth;
    
    public ToolsListAdapter(Context paramContext, List<ToolEntry> paramList, boolean paramBoolean)
    {
      mViewWidth = getResourcesgetDisplayMetricswidthPixels;
      mToolDefaultWidth = paramContext.getResources().getDimensionPixelSize(R.dimen.com_adobe_image_bottombar_tool_item_min_width);
      mInflater = LayoutInflater.from(paramContext);
      mObjects = paramList;
      mHideFeedback = paramBoolean;
      double d1 = mViewWidth / mToolDefaultWidth % 1.0D;
      if ((d1 < 0.3D) || (d1 > 0.7D))
      {
        double d2 = Math.floor(mViewWidth / mToolDefaultWidth);
        double d3 = Math.abs(0.5D - d1);
        if (d1 > 0.5D) {}
        for (int i = 1;; i = -1)
        {
          d1 = d2 + d3 * i;
          mToolViewWidth = ((int)(mViewWidth / d1));
          AdobeImageEditorActivity.logger.log("numberOfItems: %g", new Object[] { Double.valueOf(d1) });
          return;
        }
      }
      mToolViewWidth = mToolDefaultWidth;
    }
    
    public int getItemCount()
    {
      return mObjects.size() + 1;
    }
    
    public long getItemId(int paramInt)
    {
      return paramInt;
    }
    
    public int getItemViewType(int paramInt)
    {
      if (paramInt == getItemCount() - 1)
      {
        if (mHideFeedback) {
          return 2;
        }
        return 1;
      }
      return 0;
    }
    
    public void onBindViewHolder(ToolsViewHolder paramToolsViewHolder, int paramInt)
    {
      if (paramToolsViewHolder.getItemViewType() == 0)
      {
        ToolEntry localToolEntry = (ToolEntry)mObjects.get(paramInt);
        itemView.setTag(localToolEntry);
        textView.setText(labelResourceId);
        imageView.setImageResource(iconResourceId);
      }
    }
    
    public void onClick(View paramView)
    {
      paramView = paramView.getTag();
      if ((paramView instanceof ToolEntry)) {
        EventBusUtils.getInstance().post(paramView);
      }
      while (mHideFeedback) {
        return;
      }
      EventBusUtils.getInstance().post(new ToolsListFeedbackEvent());
    }
    
    public ToolsViewHolder onCreateViewHolder(ViewGroup paramViewGroup, int paramInt)
    {
      if (paramInt == 0)
      {
        paramViewGroup = mInflater.inflate(R.layout.com_adobe_image_bottombar_tool_item_layout, paramViewGroup, false);
        paramViewGroup.setLayoutParams(new ViewGroup.LayoutParams(mToolViewWidth, -1));
      }
      for (;;)
      {
        paramViewGroup.setOnClickListener(this);
        return new ToolsViewHolder(paramViewGroup);
        if (paramInt == 1) {
          paramViewGroup = mInflater.inflate(R.layout.com_adobe_image_bottombar_feedback_item_layout, paramViewGroup, false);
        } else {
          paramViewGroup = mInflater.inflate(R.layout.com_adobe_image_bottombar_branding_item_layout, paramViewGroup, false);
        }
      }
    }
    
    static final class ToolsListFeedbackEvent
    {
      ToolsListFeedbackEvent() {}
    }
    
    static class ToolsViewHolder
      extends RecyclerView.ViewHolder
    {
      final ImageView imageView;
      final TextView textView;
      
      public ToolsViewHolder(View paramView)
      {
        super();
        imageView = ((ImageView)paramView.findViewById(16908294));
        textView = ((TextView)paramView.findViewById(16908308));
      }
    }
  }
}
