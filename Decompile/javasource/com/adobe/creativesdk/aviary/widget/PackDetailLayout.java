package com.adobe.creativesdk.aviary.widget;

import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v7.graphics.Palette;
import android.support.v7.graphics.Palette.Swatch;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.OnScrollListener;
import android.support.v7.widget.Toolbar;
import android.text.Html;
import android.text.TextUtils;
import android.text.method.LinkMovementMethod;
import android.text.util.Linkify;
import android.util.AttributeSet;
import android.util.Pair;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.view.Window;
import android.widget.RelativeLayout;
import android.widget.Toast;
import com.adobe.android.ui.utils.UIUtils;
import com.adobe.android.ui.view.AdobeTextView;
import com.adobe.creativesdk.aviary.AdobeImageBillingService;
import com.adobe.creativesdk.aviary.ToolBarActivity;
import com.adobe.creativesdk.aviary.dialogs.PromoDialogFragment;
import com.adobe.creativesdk.aviary.fragments.StoreFragment;
import com.adobe.creativesdk.aviary.internal.AdobeAccountUserStatus;
import com.adobe.creativesdk.aviary.internal.AdobeAccountUserStatus.Type;
import com.adobe.creativesdk.aviary.internal.account.AccountResult;
import com.adobe.creativesdk.aviary.internal.account.AdobeImageAccountDelegate;
import com.adobe.creativesdk.aviary.internal.cds.CdsUtils;
import com.adobe.creativesdk.aviary.internal.cds.CdsUtils.PackOption;
import com.adobe.creativesdk.aviary.internal.cds.CdsUtils.PackOptionWithPrice;
import com.adobe.creativesdk.aviary.internal.cds.PacksColumns.PackCursorWrapper;
import com.adobe.creativesdk.aviary.internal.cds.PacksContentColumns.ContentCursorWrapper;
import com.adobe.creativesdk.aviary.internal.cds.util.IabResult;
import com.adobe.creativesdk.aviary.internal.cds.util.Purchase;
import com.adobe.creativesdk.aviary.internal.events.DetailPaletteEvent;
import com.adobe.creativesdk.aviary.internal.utils.ApiHelper;
import com.adobe.creativesdk.aviary.internal.utils.BundleUtils;
import com.adobe.creativesdk.aviary.internal.utils.ScreenUtils;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.utils.AdobeImageUIUtils;
import com.adobe.creativesdk.aviary.utils.ColorUtils;
import com.adobe.creativesdk.aviary.utils.EventBusUtils;
import com.aviary.android.feather.sdk.R.attr;
import com.aviary.android.feather.sdk.R.id;
import com.aviary.android.feather.sdk.R.integer;
import com.aviary.android.feather.sdk.R.string;
import com.nineoldandroids.animation.AnimatorSet;
import com.nineoldandroids.animation.ArgbEvaluator;
import com.nineoldandroids.animation.ValueAnimator;
import com.nineoldandroids.animation.ValueAnimator.AnimatorUpdateListener;
import it.sephiroth.android.library.picasso.Picasso;
import java.lang.ref.SoftReference;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import rx.Observable;
import rx.Subscription;
import rx.android.app.AppObservable;
import rx.android.schedulers.AndroidSchedulers;
import rx.functions.Action1;
import rx.schedulers.Schedulers;
import rx.subscriptions.CompositeSubscription;

public abstract class PackDetailLayout
  extends RelativeLayout
  implements View.OnClickListener, ViewTreeObserver.OnGlobalLayoutListener
{
  protected static LoggerFactory.Logger logger = LoggerFactory.getLogger("PackDetailLayout");
  private boolean mAttached;
  private AdobeTextView mAuthorTextView;
  private View mButtonsContainerView;
  private IAPBuyButton mBuyButton;
  private int mClickedFromPosition = -1;
  private boolean mDataIsAnimating;
  protected int mDelay;
  private AdobeTextView mDescriptionTextView;
  private PackDetailBannerView mDetailViewContainer;
  private View mErrorView;
  private boolean mIsTablet;
  protected PacksColumns.PackCursorWrapper mPack;
  protected long mPackId = -1L;
  private Palette mPalette;
  private boolean mPaletteGenerated;
  protected StoreFragment mParent;
  CompositeSubscription mPermanentSubscriptions = new CompositeSubscription();
  protected Picasso mPicasso;
  private final RecyclerView.OnScrollListener mPreviewScrollListener = new RecyclerView.OnScrollListener()
  {
    public void onScrollStateChanged(RecyclerView paramAnonymousRecyclerView, int paramAnonymousInt)
    {
      PackDetailLayout.this.onScrollStateChanged(paramAnonymousRecyclerView, paramAnonymousInt);
    }
    
    public void onScrolled(RecyclerView paramAnonymousRecyclerView, int paramAnonymousInt1, int paramAnonymousInt2)
    {
      PackDetailLayout.this.onScrolled(paramAnonymousRecyclerView, paramAnonymousInt1, paramAnonymousInt2);
    }
  };
  protected PackDetailPreviews mPreviewView;
  private boolean mStoreSetupCompleted;
  private boolean mStoreSetupStarted;
  protected View mTextViewGroup;
  private AdobeTextView mTitleTextView;
  ToolBarPixelScroller mToolbarPixelScroller;
  
  public PackDetailLayout(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    initialize(paramContext);
  }
  
  private void determinePackOption(final long paramLong)
  {
    Object localObject = new HashMap();
    ((Map)localObject).put(Long.valueOf(getPack().getId()), getPack().getIdentifier());
    localObject = getContentManagerService().queryPurchases((Map)localObject).subscribeOn(Schedulers.trampoline()).subscribeOn(Schedulers.computation()).observeOn(AndroidSchedulers.mainThread()).subscribe(new Action1()
    {
      public void call(Map<Long, CdsUtils.PackOptionWithPrice> paramAnonymousMap)
      {
        if (getPackId() != paramLong) {
          return;
        }
        CdsUtils.PackOptionWithPrice localPackOptionWithPrice = (CdsUtils.PackOptionWithPrice)paramAnonymousMap.get(Long.valueOf(getPackId()));
        paramAnonymousMap = localPackOptionWithPrice;
        if (localPackOptionWithPrice == null) {
          paramAnonymousMap = new CdsUtils.PackOptionWithPrice(CdsUtils.PackOption.ERROR);
        }
        setPackOption(paramAnonymousMap, getPackId());
        PackDetailLayout.this.ensureButtonsVisible();
      }
    });
    mPermanentSubscriptions.add((Subscription)localObject);
  }
  
  @TargetApi(21)
  private void ensureButtonsVisible()
  {
    if (mButtonsContainerView.getVisibility() == 0) {
      return;
    }
    mButtonsContainerView.setVisibility(0);
  }
  
  private Context getBaseContext()
  {
    return getParentFragment().getActivity();
  }
  
  private void loadInternal()
  {
    boolean bool2 = true;
    logger.verbose("loadInternal{packId: %d, mPack: %s}", new Object[] { Long.valueOf(mPackId), mPack });
    if ((isValidContext()) && (mPackId > -1L) && (mPack == null))
    {
      if (mTextViewGroup.getWidth() <= 0)
      {
        mTextViewGroup.getViewTreeObserver().addOnGlobalLayoutListener(this);
        return;
      }
      logger.info("loadInternal{packId: %d}", new Object[] { Long.valueOf(mPackId) });
      resetView();
      setPackContent(CdsUtils.getPackFullInfoById(getContext(), mPackId));
      return;
    }
    LoggerFactory.Logger localLogger = logger;
    boolean bool3 = isValidContext();
    boolean bool1;
    if (mPackId > -1L)
    {
      bool1 = true;
      if (mPack != null) {
        break label196;
      }
    }
    for (;;)
    {
      localLogger.warn("loadInternal failed: {validContext: %b, validPackId: %b, validPack: %b}", new Object[] { Boolean.valueOf(bool3), Boolean.valueOf(bool1), Boolean.valueOf(bool2) });
      return;
      bool1 = false;
      break;
      label196:
      bool2 = false;
    }
  }
  
  private void onPackMissingError()
  {
    if (mErrorView != null) {
      mErrorView.setVisibility(0);
    }
  }
  
  private void purchasePackItem(long paramLong, String paramString1, String paramString2, String paramString3, int paramInt)
  {
    logger.info("purchasePackItem: %s", new Object[] { paramString1 });
    if (!isContentManagerServiceAvailable())
    {
      logger.error("Content Manager Service Unavailable");
      Toast.makeText(getContext(), R.string.common_google_play_services_network_error_title, 0).show();
      return;
    }
    AppObservable.bindSupportFragment((Fragment)getParentFragment(), getContentManagerService().purchase((Activity)getBaseContext(), getClass().hashCode(), paramLong, paramString1, paramString2, "shop_detail", paramString3, paramInt).doOnNext(new Action1()
    {
      public void call(Pair<IabResult, Integer> paramAnonymousPair)
      {
        PackDetailLayout.logger.log("purchasePackItem.onNext: %s, %d", new Object[] { first, second });
        PackDetailLayout.logger.verbose("thread: %s", new Object[] { Thread.currentThread() });
        if (((IabResult)first).isFailure())
        {
          if (((IabResult)first).getResponse() != 64531) {
            Toast.makeText(getContext(), ((IabResult)first).getMessage(), 0).show();
          }
        }
        else {
          return;
        }
        PackDetailLayout.logger.warn("purchase failed: %s", new Object[] { first });
      }
    }).doOnError(new Action1()
    {
      public void call(Throwable paramAnonymousThrowable)
      {
        PackDetailLayout.logger.error("purchasePackItem.onError: %s", new Object[] { paramAnonymousThrowable.getMessage() });
        PackDetailLayout.logger.verbose("current thread: %s", new Object[] { Thread.currentThread() });
        Toast.makeText(getContext(), paramAnonymousThrowable.getMessage(), 0).show();
      }
    })).subscribe();
  }
  
  private void resetView()
  {
    logger.log("resetView");
    setPackOption(new CdsUtils.PackOptionWithPrice(CdsUtils.PackOption.PACK_OPTION_BEING_DETERMINED), -1L);
    resetPositions();
    mPermanentSubscriptions.clear();
    if (mToolbarPixelScroller != null) {
      mToolbarPixelScroller.reset();
    }
    mPreviewView.clearAll();
    mDetailViewContainer.clearAll();
    mBuyButton.restoreTintColor();
  }
  
  private void restorePackItem(final long paramLong, String paramString1, String paramString2, String paramString3, final IAPBuyButton paramIAPBuyButton)
  {
    if (paramIAPBuyButton != null) {}
    for (final CdsUtils.PackOptionWithPrice localPackOptionWithPrice = paramIAPBuyButton.getPackOption();; localPackOptionWithPrice = null)
    {
      paramString1 = AppObservable.bindSupportFragment((Fragment)getParentFragment(), getContentManagerService().restore(paramLong, paramString1, paramString2, paramString3).observeOn(AndroidSchedulers.mainThread()).doOnRequest(new Action1()
      {
        public void call(Long paramAnonymousLong)
        {
          if ((paramIAPBuyButton != null) && (paramLong == getPackId())) {
            paramIAPBuyButton.setPackOption(CdsUtils.PackOptionWithPrice.from(CdsUtils.PackOption.DOWNLOADING), paramLong);
          }
        }
      })).subscribe(new Action1()new Action1
      {
        public void call(Integer paramAnonymousInteger)
        {
          paramAnonymousInteger = CdsUtils.PackOption.fromDownloadManagerStatus(paramAnonymousInteger.intValue());
          if ((paramAnonymousInteger != null) && (paramIAPBuyButton != null) && (paramLong == getPackId())) {
            paramIAPBuyButton.setPackOption(CdsUtils.PackOptionWithPrice.from(paramAnonymousInteger), paramLong);
          }
        }
      }, new Action1()
      {
        public void call(Throwable paramAnonymousThrowable)
        {
          PackDetailLayout.logger.error("restore::onError");
          paramAnonymousThrowable.printStackTrace();
          if (paramLong == getPackId())
          {
            Toast.makeText(getContext(), paramAnonymousThrowable.getMessage(), 0).show();
            if (localPackOptionWithPrice != null) {
              localPackOptionWithPrice.setPackOption(val$original, paramLong);
            }
          }
        }
      });
      mPermanentSubscriptions.add(paramString1);
      return;
    }
  }
  
  private void setPackContent(final PacksColumns.PackCursorWrapper paramPackCursorWrapper)
  {
    logger.log("setPackContent");
    if ((!isValidContext()) || (getPackId() < 0L)) {
      return;
    }
    if ((paramPackCursorWrapper == null) || (paramPackCursorWrapper.getContent() == null))
    {
      onPackMissingError();
      return;
    }
    mPack = paramPackCursorWrapper;
    mPackId = mPack.getId();
    String str1 = mPack.getContent().getDisplayDescription();
    String str2 = mPack.getContent().getAuthor();
    mTitleTextView.setText(mPack.getContent().getDisplayName());
    mTitleTextView.setSelected(true);
    AdobeTextView localAdobeTextView = mDescriptionTextView;
    paramPackCursorWrapper = str1;
    if (TextUtils.isEmpty(str1)) {
      paramPackCursorWrapper = "";
    }
    localAdobeTextView.setText(paramPackCursorWrapper);
    mAuthorTextView.setText(str2);
    boolean bool = false;
    paramPackCursorWrapper = mPack.getContent().getAuthorHyperLink();
    if ((!TextUtils.isEmpty(paramPackCursorWrapper)) && (!TextUtils.isEmpty(str2)) && (!"null".equals(paramPackCursorWrapper)))
    {
      bool = true;
      str1 = String.format(Locale.ROOT, "<u><a href='%s'>%s</a></u>", new Object[] { paramPackCursorWrapper, str2 });
      mAuthorTextView.setText(Html.fromHtml(str1));
      Linkify.addLinks(mAuthorTextView, 15);
      mAuthorTextView.setMovementMethod(LinkMovementMethod.getInstance());
      mAuthorTextView.setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          try
          {
            paramAnonymousView = new Intent("android.intent.action.VIEW", Uri.parse(paramPackCursorWrapper));
            getContext().startActivity(paramAnonymousView);
            return;
          }
          catch (Exception paramAnonymousView)
          {
            paramAnonymousView.printStackTrace();
          }
        }
      });
      paramPackCursorWrapper = getHandler();
      if (paramPackCursorWrapper == null) {
        break label364;
      }
      paramPackCursorWrapper.postDelayed(new Runnable()
      {
        public void run()
        {
          mPreviewView.loadPreviews(mPack, false, mTextViewGroup);
        }
      }, 600L);
      label277:
      mPreviewView.setInterceptTouchEventEnabled(bool);
      mDetailViewContainer.setFadeDetailImage(getArguments().getBoolean("animateDetailView", true));
      mDetailViewContainer.load(mPack);
      if ((!mStoreSetupStarted) || (!mStoreSetupCompleted)) {
        break label383;
      }
      determinePackOption(getPackId());
    }
    for (;;)
    {
      onPackLoaded(mPack);
      return;
      mAuthorTextView.setOnClickListener(null);
      mAuthorTextView.setMovementMethod(null);
      break;
      label364:
      mPreviewView.loadPreviews(mPack, false, mTextViewGroup);
      break label277;
      label383:
      startSetupInternal();
    }
  }
  
  private void startSetupInternal()
  {
    if (mPack == null)
    {
      logger.warn("pack is null");
      return;
    }
    if (isContentManagerServiceAvailable())
    {
      if (!mStoreSetupStarted)
      {
        logger.verbose("starting setup..", new Object[0]);
        mStoreSetupStarted = true;
        if (getContentManagerService().isSetupDone())
        {
          onSetupDone();
          return;
        }
        Subscription localSubscription = AppObservable.bindSupportFragment((Fragment)getParentFragment(), getContentManagerService().startSetup()).subscribe(new Action1()
        {
          public void call(Pair<AccountResult, IabResult> paramAnonymousPair)
          {
            onSetupDone();
          }
        });
        mPermanentSubscriptions.add(localSubscription);
        return;
      }
      logger.warn("setup already started");
      return;
    }
    logger.warn("content manager service not available");
  }
  
  public abstract Bundle getArguments();
  
  AdobeImageBillingService getContentManagerService()
  {
    return ((AdobeImageAccountDelegate)getBaseContext()).getContentService();
  }
  
  protected final PacksColumns.PackCursorWrapper getPack()
  {
    return mPack;
  }
  
  public final long getPackId()
  {
    return mPackId;
  }
  
  public StoreFragment getParentFragment()
  {
    return mParent;
  }
  
  public abstract String getUUID();
  
  protected void initialize(Context paramContext)
  {
    if (!isInEditMode()) {
      mPicasso = Picasso.with(paramContext);
    }
    Resources localResources = getResources();
    mIsTablet = ScreenUtils.isTablet(paramContext);
    mDelay = (localResources.getInteger(R.integer.com_adobe_image_editor_store_detail_animation_delay) + 100);
    mPackId = -1L;
  }
  
  boolean isContentManagerServiceAvailable()
  {
    return ((AdobeImageAccountDelegate)getBaseContext()).isContentServiceConnected();
  }
  
  public abstract boolean isValidContext();
  
  protected void onAttachedToWindow()
  {
    logger.log("onAttachedToWindow");
    super.onAttachedToWindow();
    mAttached = true;
    EventBusUtils.register(this);
    mPreviewView.setOnScrollListener(mPreviewScrollListener);
    mBuyButton.setOnClickListener(this);
    loadInternal();
  }
  
  public void onClick(View paramView)
  {
    int i = paramView.getId();
    if ((mErrorView != null) && (i == mErrorView.getId())) {
      onForceUpdate();
    }
    do
    {
      do
      {
        return;
      } while (i != mBuyButton.getId());
      paramView = ((IAPBuyButton)paramView).getPackOption();
    } while (paramView == null);
    switch (13.$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$CdsUtils$PackOption[option.ordinal()])
    {
    default: 
      return;
    case 1: 
      purchasePackItem(mPack.getId(), mPack.getIdentifier(), mPack.getPackType(), price, mClickedFromPosition);
      return;
    case 2: 
      if (getContentManagerService().isAuthenticated())
      {
        restorePackItem(mPack.getId(), mPack.getIdentifier(), mPack.getPackType(), "shop_detail", mBuyButton);
        return;
      }
      paramView = new Bundle();
      paramView.putLong("packId", mPack.getId());
      paramView.putString("identifier", mPack.getIdentifier());
      paramView.putString("packType", mPack.getPackType());
      paramView.putString("uuid", getUUID());
      paramView.putString("from", "shop_detail");
      PromoDialogFragment.showInActivity((FragmentActivity)getBaseContext(), false, paramView);
      return;
    case 3: 
    case 4: 
    case 5: 
      restorePackItem(mPack.getId(), mPack.getIdentifier(), mPack.getPackType(), "shop_detail", mBuyButton);
      return;
    }
    setPackOption(new CdsUtils.PackOptionWithPrice(CdsUtils.PackOption.PACK_OPTION_BEING_DETERMINED), getPackId());
    mStoreSetupStarted = false;
    mStoreSetupCompleted = false;
    startSetupInternal();
  }
  
  protected void onDetachedFromWindow()
  {
    mAttached = false;
    mPermanentSubscriptions.clear();
    mPermanentSubscriptions.unsubscribe();
    EventBusUtils.unregister(this);
    mPreviewView.setOnScrollListener(null);
    mBuyButton.setOnClickListener(null);
    super.onDetachedFromWindow();
  }
  
  public void onDownloadStatusChanged(long paramLong, String paramString, int paramInt)
  {
    if ((isValidContext()) && (getPack() != null) && (paramLong == getPackId()))
    {
      logger.verbose("onDownloadStatusChanged: %d - status: %d", new Object[] { Long.valueOf(paramLong), Integer.valueOf(paramInt) });
      paramString = CdsUtils.PackOption.fromDownloadManagerStatus(paramInt);
      if (paramString != null) {
        setPackOption(CdsUtils.PackOptionWithPrice.from(paramString), paramLong);
      }
    }
    else
    {
      return;
    }
    determinePackOption(getPackId());
  }
  
  public void onEventMainThread(DetailPaletteEvent paramDetailPaletteEvent)
  {
    if ((mPack == null) || (mPackId != packId)) {
      return;
    }
    mPaletteGenerated = true;
    mPalette = palette;
    int i;
    int k;
    int j;
    label125:
    Object localObject;
    if (mPalette != null)
    {
      paramDetailPaletteEvent = mPalette.getVibrantSwatch();
      if (paramDetailPaletteEvent != null)
      {
        i = paramDetailPaletteEvent.getRgb();
        k = ColorUtils.getTextColorForBackground(i, 6.0F);
        AdobeImageUIUtils.animateTextColor(mTitleTextView, k, 600L);
        AdobeImageUIUtils.animateTextColor(mAuthorTextView, k, 600L);
        AdobeImageUIUtils.animateTextColor(mDescriptionTextView, k, 600L);
        paramDetailPaletteEvent = mTextViewGroup.getBackground();
        if (!(paramDetailPaletteEvent instanceof ColorDrawable)) {
          break label386;
        }
        j = ((ColorDrawable)paramDetailPaletteEvent).getColor();
        localObject = new ColorDrawable(j);
        if (!ApiHelper.AT_LEAST_16) {
          break label391;
        }
        mTextViewGroup.setBackground((Drawable)localObject);
      }
    }
    for (;;)
    {
      paramDetailPaletteEvent = new AnimatorSet();
      ValueAnimator localValueAnimator = ValueAnimator.ofObject(new ArgbEvaluator(), new Object[] { Integer.valueOf(j), Integer.valueOf(i) });
      localValueAnimator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener()
      {
        public void onAnimationUpdate(ValueAnimator paramAnonymousValueAnimator)
        {
          int i = ((Integer)paramAnonymousValueAnimator.getAnimatedValue()).intValue();
          if (ApiHelper.AT_LEAST_21)
          {
            val$newDrawable.setTint(i);
            return;
          }
          val$newDrawable.setColor(i);
        }
      });
      paramDetailPaletteEvent.play(localValueAnimator);
      if (((getContext() instanceof Activity)) && (updateStatusBarColor()))
      {
        localObject = (Activity)getContext();
        j = ((Activity)localObject).getWindow().getStatusBarColor();
        localValueAnimator = ValueAnimator.ofObject(new ArgbEvaluator(), new Object[] { Integer.valueOf(j), Integer.valueOf(i) });
        localValueAnimator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener()
        {
          public void onAnimationUpdate(ValueAnimator paramAnonymousValueAnimator)
          {
            int i = ((Integer)paramAnonymousValueAnimator.getAnimatedValue()).intValue();
            if ((isValidContext()) && (val$activity.getWindow() != null)) {
              val$activity.getWindow().setStatusBarColor(i);
            }
          }
        });
        paramDetailPaletteEvent.play(localValueAnimator);
      }
      paramDetailPaletteEvent.setDuration(600L);
      paramDetailPaletteEvent.start();
      if (updateToolbarColor())
      {
        paramDetailPaletteEvent = new float[3];
        Color.colorToHSV(i, paramDetailPaletteEvent);
        paramDetailPaletteEvent[2] += 0.1F;
        setupToolbarColor(Color.HSVToColor(paramDetailPaletteEvent));
      }
      mBuyButton.setTintColor(i, k);
      ensureButtonsVisible();
      return;
      i = UIUtils.getThemeColor(getContext(), R.attr.colorPrimary);
      break;
      i = UIUtils.getThemeColor(getContext(), R.attr.colorPrimary);
      break;
      label386:
      j = -1;
      break label125;
      label391:
      mTextViewGroup.setBackgroundDrawable((Drawable)localObject);
    }
  }
  
  protected void onFinishInflate()
  {
    super.onFinishInflate();
    mDetailViewContainer = ((PackDetailBannerView)findViewById(R.id.switcher));
    mTitleTextView = ((AdobeTextView)findViewById(R.id.title));
    mAuthorTextView = ((AdobeTextView)findViewById(R.id.author));
    mDescriptionTextView = ((AdobeTextView)findViewById(R.id.description));
    mBuyButton = ((IAPBuyButton)findViewById(R.id.com_adobe_image_buy_button));
    mErrorView = findViewById(R.id.error_view);
    mTextViewGroup = findViewById(R.id.header);
    mPreviewView = ((PackDetailPreviews)findViewById(R.id.previews_container));
    mButtonsContainerView = findViewById(R.id.buttons_container);
  }
  
  protected abstract void onForceUpdate();
  
  public void onGlobalLayout()
  {
    logger.log("onGlobalLayout");
    if (mTextViewGroup != null)
    {
      if (!ApiHelper.AT_LEAST_16) {
        break label40;
      }
      mTextViewGroup.getViewTreeObserver().removeOnGlobalLayoutListener(this);
    }
    for (;;)
    {
      loadInternal();
      return;
      label40:
      mTextViewGroup.getViewTreeObserver().removeGlobalOnLayoutListener(this);
    }
  }
  
  public void onPackInstalled(long paramLong, String paramString, int paramInt)
  {
    if ((isValidContext()) && (getPack() != null) && (paramLong == getPackId()))
    {
      logger.verbose("onPackInstalled", new Object[0]);
      determinePackOption(getPackId());
    }
  }
  
  protected abstract void onPackLoaded(PacksColumns.PackCursorWrapper paramPackCursorWrapper);
  
  public void onPurchaseSuccess(long paramLong, String paramString, Purchase paramPurchase)
  {
    if ((isValidContext()) && (getPack() != null) && (paramLong == getPackId()))
    {
      logger.log("onPurchaseSuccess");
      determinePackOption(getPackId());
    }
  }
  
  public void onScrollStateChanged(RecyclerView paramRecyclerView, int paramInt) {}
  
  public void onScrolled(RecyclerView paramRecyclerView, int paramInt1, int paramInt2)
  {
    if ((paramInt1 == 0) && (paramInt2 == 0)) {}
    do
    {
      return;
      mTextViewGroup.setTranslationY(mTextViewGroup.getTranslationY() - paramInt2);
      mButtonsContainerView.setTranslationY(mTextViewGroup.getTranslationY());
      float f2 = (float)(mDetailViewContainer.getTranslationY() - paramInt2 / 1.5D);
      float f1 = f2;
      if (f2 > 0.0F) {
        f1 = 0.0F;
      }
      mDetailViewContainer.setTranslationY(f1);
    } while (mToolbarPixelScroller == null);
    mToolbarPixelScroller.scroll(paramInt1, paramInt2, mDetailViewContainer.getHeight());
  }
  
  public void onServiceCreated(AdobeImageBillingService paramAdobeImageBillingService)
  {
    logger.log("onServiceCreated");
    startSetupInternal();
  }
  
  protected void onSetupDone()
  {
    if (!mStoreSetupCompleted)
    {
      logger.log("onSetupDone");
      mStoreSetupCompleted = true;
      determinePackOption(getPackId());
    }
  }
  
  public void onUserAuthenticated(AdobeAccountUserStatus paramAdobeAccountUserStatus)
  {
    if (isValidContext())
    {
      logger.log("onUserAuthenticated: %s", new Object[] { paramAdobeAccountUserStatus });
      determinePackOption(getPackId());
      if ((paramAdobeAccountUserStatus.getType() != AdobeAccountUserStatus.Type.LOGOUT) && (getUUID().equals(paramAdobeAccountUserStatus.getUUID())) && (paramAdobeAccountUserStatus.isSuccess()))
      {
        long l = paramAdobeAccountUserStatus.getOptions().getLong("packId", -1L);
        String str = paramAdobeAccountUserStatus.getOptions().getString("identifier", null);
        paramAdobeAccountUserStatus = paramAdobeAccountUserStatus.getOptions().getString("packType", null);
        if ((l > -1L) && (!TextUtils.isEmpty(str)) && (!TextUtils.isEmpty(paramAdobeAccountUserStatus))) {
          restorePackItem(l, str, paramAdobeAccountUserStatus, "shop_detail", null);
        }
      }
    }
  }
  
  public void resetPositions()
  {
    mTextViewGroup.setTranslationY(0.0F);
    mButtonsContainerView.setTranslationY(0.0F);
    mDetailViewContainer.setTranslationY(0.0F);
    mPreviewView.resetPositions();
  }
  
  void setPackOption(CdsUtils.PackOptionWithPrice paramPackOptionWithPrice, long paramLong)
  {
    logger.verbose("setPackOption: %s", new Object[] { paramPackOptionWithPrice });
    mBuyButton.setPackOption(paramPackOptionWithPrice, paramLong);
  }
  
  public void setParentFragment(StoreFragment paramStoreFragment)
  {
    logger.log("setParentFragment: %s", new Object[] { paramStoreFragment });
    mParent = paramStoreFragment;
  }
  
  protected void setupToolbarColor(int paramInt)
  {
    Object localObject = getContext();
    if ((localObject instanceof ToolBarActivity))
    {
      localObject = ((ToolBarActivity)localObject).getToolbar();
      if (localObject != null)
      {
        mToolbarPixelScroller = new ToolBarPixelScroller((Toolbar)localObject);
        mToolbarPixelScroller.setColor(paramInt);
      }
    }
  }
  
  public void update(long paramLong, boolean paramBoolean, Bundle paramBundle)
  {
    logger.log("update{packId: %d, isAnimating: %b, extras: %s}", new Object[] { Long.valueOf(paramLong), Boolean.valueOf(paramBoolean), BundleUtils.toString(paramBundle) });
    int i = -1;
    if (paramBundle != null) {
      i = paramBundle.getInt("extra-click-from-position", -1);
    }
    mDataIsAnimating = paramBoolean;
    mPackId = paramLong;
    mPack = null;
    mClickedFromPosition = i;
    resetPositions();
    loadInternal();
  }
  
  protected boolean updateStatusBarColor()
  {
    return false;
  }
  
  protected boolean updateToolbarColor()
  {
    return false;
  }
  
  static class ToolBarPixelScroller
  {
    private boolean initialized;
    private int originalAlpha;
    private int originalBlue;
    private int originalColor;
    private int originalGreen;
    private int originalRed;
    private int position;
    private final SoftReference<Toolbar> toolbarSoftReference;
    
    ToolBarPixelScroller(Toolbar paramToolbar)
    {
      toolbarSoftReference = new SoftReference(paramToolbar);
      position = 0;
      init(paramToolbar);
    }
    
    private void init(Toolbar paramToolbar)
    {
      if (paramToolbar != null)
      {
        paramToolbar = paramToolbar.getBackground();
        if ((paramToolbar instanceof ColorDrawable))
        {
          int i = ((ColorDrawable)paramToolbar).getColor();
          originalAlpha = Color.alpha(i);
          originalColor = i;
          originalRed = Color.red(originalColor);
          originalGreen = Color.green(originalColor);
          originalBlue = Color.blue(originalColor);
          initialized = true;
        }
      }
    }
    
    public void reset()
    {
      if (initialized)
      {
        position = 0;
        Toolbar localToolbar = (Toolbar)toolbarSoftReference.get();
        if (localToolbar != null) {
          localToolbar.setBackgroundColor(originalColor);
        }
      }
    }
    
    public void scroll(int paramInt1, int paramInt2, int paramInt3)
    {
      Toolbar localToolbar = (Toolbar)toolbarSoftReference.get();
      if ((initialized) && (localToolbar != null) && (paramInt3 > 0))
      {
        position += paramInt2;
        if (position >= 0)
        {
          paramInt1 = localToolbar.getHeight();
          localToolbar.setBackgroundColor(Color.argb(Math.min(255, Math.max(0, (int)(originalAlpha + position / (paramInt3 - paramInt1) * (255 - originalAlpha)))), originalRed, originalGreen, originalBlue));
        }
      }
    }
    
    public void setColor(int paramInt)
    {
      Toolbar localToolbar = (Toolbar)toolbarSoftReference.get();
      if ((initialized) && (localToolbar != null))
      {
        originalRed = Color.red(paramInt);
        originalGreen = Color.green(paramInt);
        originalBlue = Color.blue(paramInt);
        localToolbar.setBackgroundColor(Color.argb(originalAlpha, originalRed, originalGreen, originalBlue));
      }
    }
  }
}
