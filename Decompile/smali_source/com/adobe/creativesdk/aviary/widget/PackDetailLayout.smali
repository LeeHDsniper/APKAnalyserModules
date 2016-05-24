.class public abstract Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;
.super Landroid/widget/RelativeLayout;
.source "PackDetailLayout.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;
    }
.end annotation


# static fields
.field protected static logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# instance fields
.field private mAttached:Z

.field private mAuthorTextView:Lcom/adobe/android/ui/view/AdobeTextView;

.field private mButtonsContainerView:Landroid/view/View;

.field private mBuyButton:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

.field private mClickedFromPosition:I

.field private mDataIsAnimating:Z

.field protected mDelay:I

.field private mDescriptionTextView:Lcom/adobe/android/ui/view/AdobeTextView;

.field private mDetailViewContainer:Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

.field private mErrorView:Landroid/view/View;

.field private mIsTablet:Z

.field protected mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

.field protected mPackId:J

.field private mPalette:Landroid/support/v7/graphics/Palette;

.field private mPaletteGenerated:Z

.field protected mParent:Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;

.field mPermanentSubscriptions:Lrx/subscriptions/CompositeSubscription;

.field protected mPicasso:Lit/sephiroth/android/library/picasso/Picasso;

.field private final mPreviewScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

.field protected mPreviewView:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

.field private mStoreSetupCompleted:Z

.field private mStoreSetupStarted:Z

.field protected mTextViewGroup:Landroid/view/View;

.field private mTitleTextView:Lcom/adobe/android/ui/view/AdobeTextView;

.field mToolbarPixelScroller:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 80
    const-string v0, "PackDetailLayout"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 130
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 90
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPackId:J

    .line 108
    const/4 v0, -0x1

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mClickedFromPosition:I

    .line 113
    new-instance v0, Lrx/subscriptions/CompositeSubscription;

    invoke-direct {v0}, Lrx/subscriptions/CompositeSubscription;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPermanentSubscriptions:Lrx/subscriptions/CompositeSubscription;

    .line 115
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$1;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$1;-><init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPreviewScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    .line 131
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->initialize(Landroid/content/Context;)V

    .line 132
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    .prologue
    .line 76
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->ensureButtonsVisible()V

    return-void
.end method

.method private determinePackOption(J)V
    .registers 8
    .param p1, "packId"    # J

    .prologue
    .line 495
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 496
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Ljava/lang/String;>;"
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getPack()Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getId()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getPack()Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 498
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getContentManagerService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v2

    .line 499
    invoke-virtual {v2, v0}, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->queryPurchases(Ljava/util/Map;)Lrx/Observable;

    move-result-object v2

    .line 500
    invoke-static {}, Lrx/schedulers/Schedulers;->trampoline()Lrx/Scheduler;

    move-result-object v3

    invoke-virtual {v2, v3}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v2

    .line 501
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Lrx/Scheduler;

    move-result-object v3

    invoke-virtual {v2, v3}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v2

    .line 502
    invoke-static {}, Lrx/android/schedulers/AndroidSchedulers;->mainThread()Lrx/Scheduler;

    move-result-object v3

    invoke-virtual {v2, v3}, Lrx/Observable;->observeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v2

    new-instance v3, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$7;

    invoke-direct {v3, p0, p1, p2}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$7;-><init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;J)V

    .line 503
    invoke-virtual {v2, v3}, Lrx/Observable;->subscribe(Lrx/functions/Action1;)Lrx/Subscription;

    move-result-object v1

    .line 522
    .local v1, "s1":Lrx/Subscription;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPermanentSubscriptions:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v2, v1}, Lrx/subscriptions/CompositeSubscription;->add(Lrx/Subscription;)V

    .line 524
    return-void
.end method

.method private ensureButtonsVisible()V
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 434
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mButtonsContainerView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_9

    .line 440
    :goto_8
    return-void

    .line 439
    :cond_9
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mButtonsContainerView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_8
.end method

.method private getBaseContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 830
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getParentFragment()Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;

    move-result-object v0

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;->getActivity()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method private loadInternal()V
    .registers 15

    .prologue
    const-wide/16 v12, -0x1

    const/4 v10, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 555
    sget-object v2, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "loadInternal{packId: %d, mPack: %s}"

    new-array v6, v10, [Ljava/lang/Object;

    iget-wide v8, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPackId:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v6, v4

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    aput-object v7, v6, v3

    invoke-interface {v2, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 556
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->isValidContext()Z

    move-result v2

    if-eqz v2, :cond_5e

    iget-wide v6, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPackId:J

    cmp-long v2, v6, v12

    if-lez v2, :cond_5e

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    if-nez v2, :cond_5e

    .line 557
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mTextViewGroup:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v1

    .line 558
    .local v1, "width":I
    if-gtz v1, :cond_3c

    .line 559
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mTextViewGroup:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    invoke-virtual {v2, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 572
    .end local v1    # "width":I
    :goto_3b
    return-void

    .line 563
    .restart local v1    # "width":I
    :cond_3c
    sget-object v2, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "loadInternal{packId: %d}"

    new-array v3, v3, [Ljava/lang/Object;

    iget-wide v6, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPackId:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v3, v4

    invoke-interface {v2, v5, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 564
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->resetView()V

    .line 565
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPackId:J

    invoke-static {v2, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getPackFullInfoById(Landroid/content/Context;J)Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    move-result-object v0

    .line 566
    .local v0, "content":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->setPackContent(Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;)V

    goto :goto_3b

    .line 568
    .end local v0    # "content":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    .end local v1    # "width":I
    :cond_5e
    sget-object v5, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "loadInternal failed: {validContext: %b, validPackId: %b, validPack: %b}"

    const/4 v2, 0x3

    new-array v7, v2, [Ljava/lang/Object;

    .line 570
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->isValidContext()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    aput-object v2, v7, v4

    iget-wide v8, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPackId:J

    cmp-long v2, v8, v12

    if-lez v2, :cond_8a

    move v2, v3

    :goto_76
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    aput-object v2, v7, v3

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    if-nez v2, :cond_8c

    :goto_80
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    aput-object v2, v7, v10

    .line 568
    invoke-interface {v5, v6, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_3b

    :cond_8a
    move v2, v4

    .line 570
    goto :goto_76

    :cond_8c
    move v3, v4

    goto :goto_80
.end method

.method private onPackMissingError()V
    .registers 3

    .prologue
    .line 461
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mErrorView:Landroid/view/View;

    if-eqz v0, :cond_a

    .line 462
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mErrorView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 464
    :cond_a
    return-void
.end method

.method private purchasePackItem(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .registers 18
    .param p1, "packId"    # J
    .param p3, "identifier"    # Ljava/lang/String;
    .param p4, "packType"    # Ljava/lang/String;
    .param p5, "price"    # Ljava/lang/String;
    .param p6, "position"    # I

    .prologue
    .line 684
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "purchasePackItem: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p3, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 686
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->isContentManagerServiceAvailable()Z

    move-result v0

    if-nez v0, :cond_29

    .line 687
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "Content Manager Service Unavailable"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 688
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$string;->common_google_play_services_network_error_title:I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 724
    :goto_28
    return-void

    .line 693
    :cond_29
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getParentFragment()Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;

    move-result-object v0

    check-cast v0, Landroid/support/v4/app/Fragment;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getContentManagerService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v1

    .line 695
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Landroid/app/Activity;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    const-string v8, "shop_detail"

    move-wide v4, p1

    move-object v6, p3

    move-object v7, p4

    move-object/from16 v9, p5

    move/from16 v10, p6

    .line 694
    invoke-virtual/range {v1 .. v10}, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->purchase(Landroid/app/Activity;IJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Lrx/Observable;

    move-result-object v1

    new-instance v2, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$9;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$9;-><init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;)V

    .line 698
    invoke-virtual {v1, v2}, Lrx/Observable;->doOnNext(Lrx/functions/Action1;)Lrx/Observable;

    move-result-object v1

    new-instance v2, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$8;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$8;-><init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;)V

    .line 715
    invoke-virtual {v1, v2}, Lrx/Observable;->doOnError(Lrx/functions/Action1;)Lrx/Observable;

    move-result-object v1

    .line 692
    invoke-static {v0, v1}, Lrx/android/app/AppObservable;->bindSupportFragment(Landroid/support/v4/app/Fragment;Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    .line 723
    invoke-virtual {v0}, Lrx/Observable;->subscribe()Lrx/Subscription;

    goto :goto_28
.end method

.method private resetView()V
    .registers 5

    .prologue
    .line 304
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "resetView"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 305
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->PACK_OPTION_BEING_DETERMINED:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;)V

    const-wide/16 v2, -0x1

    invoke-virtual {p0, v0, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->setPackOption(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;J)V

    .line 306
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->resetPositions()V

    .line 308
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPermanentSubscriptions:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v0}, Lrx/subscriptions/CompositeSubscription;->clear()V

    .line 310
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mToolbarPixelScroller:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;

    if-eqz v0, :cond_24

    .line 311
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mToolbarPixelScroller:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->reset()V

    .line 314
    :cond_24
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPreviewView:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->clearAll()V

    .line 315
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mDetailViewContainer:Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->clearAll()V

    .line 317
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mBuyButton:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->restoreTintColor()V

    .line 319
    return-void
.end method

.method private restorePackItem(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;)V
    .registers 20
    .param p1, "packId"    # J
    .param p3, "identifier"    # Ljava/lang/String;
    .param p4, "packType"    # Ljava/lang/String;
    .param p5, "trackerName"    # Ljava/lang/String;
    .param p6, "buttonContainer"    # Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    .prologue
    .line 732
    if-eqz p6, :cond_4d

    .line 733
    invoke-virtual/range {p6 .. p6}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->getPackOption()Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    move-result-object v9

    .line 739
    .local v9, "original":Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;
    :goto_6
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getParentFragment()Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;

    move-result-object v2

    check-cast v2, Landroid/support/v4/app/Fragment;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getContentManagerService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v3

    move-wide v4, p1

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    move-object/from16 v8, p5

    .line 740
    invoke-virtual/range {v3 .. v8}, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->restore(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/Observable;

    move-result-object v3

    .line 741
    invoke-static {}, Lrx/android/schedulers/AndroidSchedulers;->mainThread()Lrx/Scheduler;

    move-result-object v4

    invoke-virtual {v3, v4}, Lrx/Observable;->observeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v3

    new-instance v4, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$12;

    move-object/from16 v0, p6

    invoke-direct {v4, p0, v0, p1, p2}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$12;-><init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;J)V

    .line 742
    invoke-virtual {v3, v4}, Lrx/Observable;->doOnRequest(Lrx/functions/Action1;)Lrx/Observable;

    move-result-object v3

    .line 738
    invoke-static {v2, v3}, Lrx/android/app/AppObservable;->bindSupportFragment(Landroid/support/v4/app/Fragment;Lrx/Observable;)Lrx/Observable;

    move-result-object v8

    new-instance v11, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$10;

    move-object/from16 v0, p6

    invoke-direct {v11, p0, v0, p1, p2}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$10;-><init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;J)V

    new-instance v2, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$11;

    move-object v3, p0

    move-wide v4, p1

    move-object/from16 v6, p6

    move-object v7, v9

    invoke-direct/range {v2 .. v7}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$11;-><init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;JLcom/adobe/creativesdk/aviary/widget/IAPBuyButton;Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;)V

    .line 752
    invoke-virtual {v8, v11, v2}, Lrx/Observable;->subscribe(Lrx/functions/Action1;Lrx/functions/Action1;)Lrx/Subscription;

    move-result-object v10

    .line 779
    .local v10, "subscription":Lrx/Subscription;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPermanentSubscriptions:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v2, v10}, Lrx/subscriptions/CompositeSubscription;->add(Lrx/Subscription;)V

    .line 780
    return-void

    .line 735
    .end local v9    # "original":Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;
    .end local v10    # "subscription":Lrx/Subscription;
    :cond_4d
    const/4 v9, 0x0

    .restart local v9    # "original":Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;
    goto :goto_6
.end method

.method private setPackContent(Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;)V
    .registers 15
    .param p1, "pack"    # Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    .prologue
    const/4 v12, 0x0

    const/4 v11, 0x0

    const/4 v10, 0x1

    .line 327
    sget-object v6, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v7, "setPackContent"

    invoke-interface {v6, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 328
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->isValidContext()Z

    move-result v6

    if-eqz v6, :cond_1a

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getPackId()J

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmp-long v6, v6, v8

    if-gez v6, :cond_1b

    .line 396
    :cond_1a
    :goto_1a
    return-void

    .line 332
    :cond_1b
    if-eqz p1, :cond_23

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getContent()Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    move-result-object v6

    if-nez v6, :cond_27

    .line 333
    :cond_23
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->onPackMissingError()V

    goto :goto_1a

    .line 337
    :cond_27
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    .line 338
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getId()J

    move-result-wide v6

    iput-wide v6, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPackId:J

    .line 340
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getContent()Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    move-result-object v6

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->getDisplayDescription()Ljava/lang/String;

    move-result-object v3

    .line 341
    .local v3, "description":Ljava/lang/String;
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getContent()Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    move-result-object v6

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->getAuthor()Ljava/lang/String;

    move-result-object v0

    .line 343
    .local v0, "author":Ljava/lang/String;
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mTitleTextView:Lcom/adobe/android/ui/view/AdobeTextView;

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getContent()Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    move-result-object v7

    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->getDisplayName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/adobe/android/ui/view/AdobeTextView;->setText(Ljava/lang/CharSequence;)V

    .line 344
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mTitleTextView:Lcom/adobe/android/ui/view/AdobeTextView;

    invoke-virtual {v6, v10}, Lcom/adobe/android/ui/view/AdobeTextView;->setSelected(Z)V

    .line 345
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mDescriptionTextView:Lcom/adobe/android/ui/view/AdobeTextView;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_63

    const-string v3, ""

    .end local v3    # "description":Ljava/lang/String;
    :cond_63
    invoke-virtual {v6, v3}, Lcom/adobe/android/ui/view/AdobeTextView;->setText(Ljava/lang/CharSequence;)V

    .line 346
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mAuthorTextView:Lcom/adobe/android/ui/view/AdobeTextView;

    invoke-virtual {v6, v0}, Lcom/adobe/android/ui/view/AdobeTextView;->setText(Ljava/lang/CharSequence;)V

    .line 348
    const/4 v5, 0x0

    .line 349
    .local v5, "hasAuthorLink":Z
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getContent()Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    move-result-object v6

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->getAuthorHyperLink()Ljava/lang/String;

    move-result-object v1

    .line 350
    .local v1, "authorLink":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_fe

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_fe

    const-string v6, "null"

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_fe

    .line 351
    const/4 v5, 0x1

    .line 352
    sget-object v6, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v7, "<u><a href=\'%s\'>%s</a></u>"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    aput-object v1, v8, v11

    aput-object v0, v8, v10

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 353
    .local v2, "authorText":Ljava/lang/String;
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mAuthorTextView:Lcom/adobe/android/ui/view/AdobeTextView;

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/adobe/android/ui/view/AdobeTextView;->setText(Ljava/lang/CharSequence;)V

    .line 354
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mAuthorTextView:Lcom/adobe/android/ui/view/AdobeTextView;

    const/16 v7, 0xf

    invoke-static {v6, v7}, Landroid/text/util/Linkify;->addLinks(Landroid/widget/TextView;I)Z

    .line 355
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mAuthorTextView:Lcom/adobe/android/ui/view/AdobeTextView;

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/adobe/android/ui/view/AdobeTextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 356
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mAuthorTextView:Lcom/adobe/android/ui/view/AdobeTextView;

    new-instance v7, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$4;

    invoke-direct {v7, p0, v1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$4;-><init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;Ljava/lang/String;)V

    invoke-virtual {v6, v7}, Lcom/adobe/android/ui/view/AdobeTextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 373
    .end local v2    # "authorText":Ljava/lang/String;
    :goto_bd
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getHandler()Landroid/os/Handler;

    move-result-object v4

    .line 374
    .local v4, "handler":Landroid/os/Handler;
    if-eqz v4, :cond_109

    .line 375
    new-instance v6, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$5;

    invoke-direct {v6, p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$5;-><init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;)V

    const-wide/16 v8, 0x258

    invoke-virtual {v4, v6, v8, v9}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 385
    :goto_cd
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPreviewView:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    invoke-virtual {v6, v5}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->setInterceptTouchEventEnabled(Z)V

    .line 387
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mDetailViewContainer:Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getArguments()Landroid/os/Bundle;

    move-result-object v7

    const-string v8, "animateDetailView"

    invoke-virtual {v7, v8, v10}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v7

    invoke-virtual {v6, v7}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->setFadeDetailImage(Z)V

    .line 388
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mDetailViewContainer:Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    invoke-virtual {v6, v7}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->load(Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;)V

    .line 390
    iget-boolean v6, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mStoreSetupStarted:Z

    if-eqz v6, :cond_113

    iget-boolean v6, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mStoreSetupCompleted:Z

    if-eqz v6, :cond_113

    .line 391
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getPackId()J

    move-result-wide v6

    invoke-direct {p0, v6, v7}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->determinePackOption(J)V

    .line 395
    :goto_f7
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    invoke-virtual {p0, v6}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->onPackLoaded(Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;)V

    goto/16 :goto_1a

    .line 369
    .end local v4    # "handler":Landroid/os/Handler;
    :cond_fe
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mAuthorTextView:Lcom/adobe/android/ui/view/AdobeTextView;

    invoke-virtual {v6, v12}, Lcom/adobe/android/ui/view/AdobeTextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 370
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mAuthorTextView:Lcom/adobe/android/ui/view/AdobeTextView;

    invoke-virtual {v6, v12}, Lcom/adobe/android/ui/view/AdobeTextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    goto :goto_bd

    .line 383
    .restart local v4    # "handler":Landroid/os/Handler;
    :cond_109
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPreviewView:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mTextViewGroup:Landroid/view/View;

    invoke-virtual {v6, v7, v11, v8}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->loadPreviews(Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;ZLandroid/view/View;)V

    goto :goto_cd

    .line 393
    :cond_113
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->startSetupInternal()V

    goto :goto_f7
.end method

.method private startSetupInternal()V
    .registers 5

    .prologue
    .line 399
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    if-nez v1, :cond_c

    .line 400
    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "pack is null"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 430
    :goto_b
    return-void

    .line 404
    :cond_c
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->isContentManagerServiceAvailable()Z

    move-result v1

    if-eqz v1, :cond_5a

    .line 405
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mStoreSetupStarted:Z

    if-nez v1, :cond_52

    .line 406
    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "starting setup.."

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 407
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mStoreSetupStarted:Z

    .line 409
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getContentManagerService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->isSetupDone()Z

    move-result v1

    if-eqz v1, :cond_31

    .line 410
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->onSetupDone()V

    goto :goto_b

    .line 413
    :cond_31
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getParentFragment()Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;

    move-result-object v1

    check-cast v1, Landroid/support/v4/app/Fragment;

    .line 414
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getContentManagerService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->startSetup()Lrx/Observable;

    move-result-object v2

    .line 412
    invoke-static {v1, v2}, Lrx/android/app/AppObservable;->bindSupportFragment(Landroid/support/v4/app/Fragment;Lrx/Observable;)Lrx/Observable;

    move-result-object v1

    new-instance v2, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$6;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$6;-><init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;)V

    .line 414
    invoke-virtual {v1, v2}, Lrx/Observable;->subscribe(Lrx/functions/Action1;)Lrx/Subscription;

    move-result-object v0

    .line 422
    .local v0, "subscription":Lrx/Subscription;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPermanentSubscriptions:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v1, v0}, Lrx/subscriptions/CompositeSubscription;->add(Lrx/Subscription;)V

    goto :goto_b

    .line 425
    .end local v0    # "subscription":Lrx/Subscription;
    :cond_52
    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "setup already started"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_b

    .line 428
    :cond_5a
    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "content manager service not available"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_b
.end method


# virtual methods
.method public abstract getArguments()Landroid/os/Bundle;
.end method

.method getContentManagerService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;
    .registers 2

    .prologue
    .line 834
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeImageAccountDelegate;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeImageAccountDelegate;->getContentService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v0

    return-object v0
.end method

.method protected final getPack()Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    .registers 2

    .prologue
    .line 487
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    return-object v0
.end method

.method public final getPackId()J
    .registers 3

    .prologue
    .line 454
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPackId:J

    return-wide v0
.end method

.method public getParentFragment()Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;
    .registers 2

    .prologue
    .line 159
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mParent:Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;

    return-object v0
.end method

.method public abstract getUUID()Ljava/lang/String;
.end method

.method protected initialize(Landroid/content/Context;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 135
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->isInEditMode()Z

    move-result v1

    if-nez v1, :cond_c

    .line 136
    invoke-static {p1}, Lit/sephiroth/android/library/picasso/Picasso;->with(Landroid/content/Context;)Lit/sephiroth/android/library/picasso/Picasso;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPicasso:Lit/sephiroth/android/library/picasso/Picasso;

    .line 139
    :cond_c
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 140
    .local v0, "res":Landroid/content/res/Resources;
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/utils/ScreenUtils;->isTablet(Landroid/content/Context;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mIsTablet:Z

    .line 141
    sget v1, Lcom/aviary/android/feather/sdk/R$integer;->com_adobe_image_editor_store_detail_animation_delay:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x64

    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mDelay:I

    .line 142
    const-wide/16 v2, -0x1

    iput-wide v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPackId:J

    .line 143
    return-void
.end method

.method isContentManagerServiceAvailable()Z
    .registers 2

    .prologue
    .line 838
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeImageAccountDelegate;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeImageAccountDelegate;->isContentServiceConnected()Z

    move-result v0

    return v0
.end method

.method public abstract isValidContext()Z
.end method

.method protected onAttachedToWindow()V
    .registers 3

    .prologue
    .line 189
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onAttachedToWindow"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 190
    invoke-super {p0}, Landroid/widget/RelativeLayout;->onAttachedToWindow()V

    .line 191
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mAttached:Z

    .line 192
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->register(Ljava/lang/Object;)V

    .line 193
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPreviewView:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPreviewScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->setOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 194
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mBuyButton:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 195
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->loadInternal()V

    .line 196
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 13
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v4, 0x0

    .line 630
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v8

    .line 632
    .local v8, "id":I
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mErrorView:Landroid/view/View;

    if-eqz v1, :cond_15

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mErrorView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v1

    if-ne v8, v1, :cond_15

    .line 633
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->onForceUpdate()V

    .line 679
    :cond_14
    :goto_14
    return-void

    .line 634
    :cond_15
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mBuyButton:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->getId()I

    move-result v1

    if-ne v8, v1, :cond_14

    move-object v0, p1

    .line 635
    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    .line 636
    .local v0, "button":Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->getPackOption()Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    move-result-object v9

    .line 637
    .local v9, "option":Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;
    if-eqz v9, :cond_14

    .line 641
    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$13;->$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$CdsUtils$PackOption:[I

    iget-object v2, v9, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->option:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_e8

    goto :goto_14

    .line 644
    :pswitch_34
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getId()J

    move-result-wide v2

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v4

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getPackType()Ljava/lang/String;

    move-result-object v5

    iget-object v6, v9, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->price:Ljava/lang/String;

    iget v7, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mClickedFromPosition:I

    move-object v1, p0

    invoke-direct/range {v1 .. v7}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->purchasePackItem(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_14

    .line 648
    :pswitch_4f
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getContentManagerService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->isAuthenticated()Z

    move-result v1

    if-eqz v1, :cond_74

    .line 649
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getId()J

    move-result-wide v2

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v4

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getPackType()Ljava/lang/String;

    move-result-object v5

    const-string v6, "shop_detail"

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mBuyButton:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    move-object v1, p0

    invoke-direct/range {v1 .. v7}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->restorePackItem(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;)V

    goto :goto_14

    .line 651
    :cond_74
    new-instance v10, Landroid/os/Bundle;

    invoke-direct {v10}, Landroid/os/Bundle;-><init>()V

    .line 652
    .local v10, "options":Landroid/os/Bundle;
    const-string v1, "packId"

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getId()J

    move-result-wide v2

    invoke-virtual {v10, v1, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 653
    const-string v1, "identifier"

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v10, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 654
    const-string v1, "packType"

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getPackType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v10, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 655
    const-string v1, "uuid"

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getUUID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v10, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 656
    const-string v1, "from"

    const-string v2, "shop_detail"

    invoke-virtual {v10, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 657
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Landroid/support/v4/app/FragmentActivity;

    invoke-static {v1, v4, v10}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->showInActivity(Landroid/support/v4/app/FragmentActivity;ZLandroid/os/Bundle;)V

    goto/16 :goto_14

    .line 664
    .end local v10    # "options":Landroid/os/Bundle;
    :pswitch_b5
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getId()J

    move-result-wide v2

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v4

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getPackType()Ljava/lang/String;

    move-result-object v5

    const-string v6, "shop_detail"

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mBuyButton:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    move-object v1, p0

    invoke-direct/range {v1 .. v7}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->restorePackItem(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;)V

    goto/16 :goto_14

    .line 668
    :pswitch_d1
    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->PACK_OPTION_BEING_DETERMINED:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-direct {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;)V

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getPackId()J

    move-result-wide v2

    invoke-virtual {p0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->setPackOption(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;J)V

    .line 669
    iput-boolean v4, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mStoreSetupStarted:Z

    .line 670
    iput-boolean v4, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mStoreSetupCompleted:Z

    .line 671
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->startSetupInternal()V

    goto/16 :goto_14

    .line 641
    :pswitch_data_e8
    .packed-switch 0x1
        :pswitch_34
        :pswitch_4f
        :pswitch_b5
        :pswitch_b5
        :pswitch_b5
        :pswitch_d1
    .end packed-switch
.end method

.method protected onDetachedFromWindow()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 200
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mAttached:Z

    .line 201
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPermanentSubscriptions:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v0}, Lrx/subscriptions/CompositeSubscription;->clear()V

    .line 202
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPermanentSubscriptions:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v0}, Lrx/subscriptions/CompositeSubscription;->unsubscribe()V

    .line 203
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->unregister(Ljava/lang/Object;)V

    .line 204
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPreviewView:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->setOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 205
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mBuyButton:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 206
    invoke-super {p0}, Landroid/widget/RelativeLayout;->onDetachedFromWindow()V

    .line 207
    return-void
.end method

.method public onDownloadStatusChanged(JLjava/lang/String;I)V
    .registers 12
    .param p1, "packId"    # J
    .param p3, "packType"    # Ljava/lang/String;
    .param p4, "status"    # I

    .prologue
    .line 575
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->isValidContext()Z

    move-result v1

    if-eqz v1, :cond_39

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getPack()Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    move-result-object v1

    if-eqz v1, :cond_39

    .line 576
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getPackId()J

    move-result-wide v2

    cmp-long v1, p1, v2

    if-nez v1, :cond_39

    .line 577
    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "onDownloadStatusChanged: %d - status: %d"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 579
    invoke-static {p4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->fromDownloadManagerStatus(I)Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    move-result-object v0

    .line 580
    .local v0, "option":Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;
    if-eqz v0, :cond_3a

    .line 581
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->from(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    move-result-object v1

    invoke-virtual {p0, v1, p1, p2}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->setPackOption(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;J)V

    .line 587
    .end local v0    # "option":Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;
    :cond_39
    :goto_39
    return-void

    .line 583
    .restart local v0    # "option":Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;
    :cond_3a
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getPackId()J

    move-result-wide v2

    invoke-direct {p0, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->determinePackOption(J)V

    goto :goto_39
.end method

.method public onEventMainThread(Lcom/adobe/creativesdk/aviary/internal/events/DetailPaletteEvent;)V
    .registers 26
    .param p1, "event"    # Lcom/adobe/creativesdk/aviary/internal/events/DetailPaletteEvent;

    .prologue
    .line 211
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    move-object/from16 v19, v0

    if-eqz v19, :cond_18

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPackId:J

    move-wide/from16 v20, v0

    move-object/from16 v0, p1

    iget-wide v0, v0, Lcom/adobe/creativesdk/aviary/internal/events/DetailPaletteEvent;->packId:J

    move-wide/from16 v22, v0

    cmp-long v19, v20, v22

    if-eqz v19, :cond_19

    .line 301
    :cond_18
    :goto_18
    return-void

    .line 215
    :cond_19
    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPaletteGenerated:Z

    .line 216
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/internal/events/DetailPaletteEvent;->palette:Landroid/support/v7/graphics/Palette;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPalette:Landroid/support/v7/graphics/Palette;

    .line 218
    const/16 v10, 0x258

    .line 223
    .local v10, "colorAnimationDuration":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPalette:Landroid/support/v7/graphics/Palette;

    move-object/from16 v19, v0

    if-eqz v19, :cond_181

    .line 224
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPalette:Landroid/support/v7/graphics/Palette;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/support/v7/graphics/Palette;->getVibrantSwatch()Landroid/support/v7/graphics/Palette$Swatch;

    move-result-object v17

    .line 225
    .local v17, "swatch1":Landroid/support/v7/graphics/Palette$Swatch;
    if-eqz v17, :cond_175

    .line 226
    invoke-virtual/range {v17 .. v17}, Landroid/support/v7/graphics/Palette$Swatch;->getRgb()I

    move-result v5

    .line 233
    .end local v17    # "swatch1":Landroid/support/v7/graphics/Palette$Swatch;
    .local v5, "color1":I
    :goto_47
    move v6, v5

    .line 234
    .local v6, "color2":I
    const/high16 v19, 0x40c00000

    move/from16 v0, v19

    invoke-static {v5, v0}, Lcom/adobe/creativesdk/aviary/utils/ColorUtils;->getTextColorForBackground(IF)I

    move-result v18

    .line 236
    .local v18, "titleColor":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mTitleTextView:Lcom/adobe/android/ui/view/AdobeTextView;

    move-object/from16 v19, v0

    const-wide/16 v20, 0x258

    move-object/from16 v0, v19

    move/from16 v1, v18

    move-wide/from16 v2, v20

    invoke-static {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/utils/AdobeImageUIUtils;->animateTextColor(Landroid/widget/TextView;IJ)V

    .line 237
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mAuthorTextView:Lcom/adobe/android/ui/view/AdobeTextView;

    move-object/from16 v19, v0

    const-wide/16 v20, 0x258

    move-object/from16 v0, v19

    move/from16 v1, v18

    move-wide/from16 v2, v20

    invoke-static {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/utils/AdobeImageUIUtils;->animateTextColor(Landroid/widget/TextView;IJ)V

    .line 238
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mDescriptionTextView:Lcom/adobe/android/ui/view/AdobeTextView;

    move-object/from16 v19, v0

    const-wide/16 v20, 0x258

    move-object/from16 v0, v19

    move/from16 v1, v18

    move-wide/from16 v2, v20

    invoke-static {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/utils/AdobeImageUIUtils;->animateTextColor(Landroid/widget/TextView;IJ)V

    .line 240
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mTextViewGroup:Landroid/view/View;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v11

    .line 241
    .local v11, "drawable":Landroid/graphics/drawable/Drawable;
    instance-of v0, v11, Landroid/graphics/drawable/ColorDrawable;

    move/from16 v19, v0

    if-eqz v19, :cond_18d

    check-cast v11, Landroid/graphics/drawable/ColorDrawable;

    .end local v11    # "drawable":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v11}, Landroid/graphics/drawable/ColorDrawable;->getColor()I

    move-result v15

    .line 243
    .local v15, "startColor":I
    :goto_99
    new-instance v13, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v13, v15}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 245
    .local v13, "newDrawable":Landroid/graphics/drawable/ColorDrawable;
    sget-boolean v19, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_16:Z

    if-eqz v19, :cond_190

    .line 246
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mTextViewGroup:Landroid/view/View;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v13}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 251
    :goto_ad
    new-instance v14, Lcom/nineoldandroids/animation/AnimatorSet;

    invoke-direct {v14}, Lcom/nineoldandroids/animation/AnimatorSet;-><init>()V

    .line 254
    .local v14, "set":Lcom/nineoldandroids/animation/AnimatorSet;
    new-instance v19, Lcom/nineoldandroids/animation/ArgbEvaluator;

    invoke-direct/range {v19 .. v19}, Lcom/nineoldandroids/animation/ArgbEvaluator;-><init>()V

    const/16 v20, 0x2

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    aput-object v22, v20, v21

    const/16 v21, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    aput-object v22, v20, v21

    invoke-static/range {v19 .. v20}, Lcom/nineoldandroids/animation/ValueAnimator;->ofObject(Lcom/nineoldandroids/animation/TypeEvaluator;[Ljava/lang/Object;)Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v8

    .line 255
    .local v8, "colorAnim1":Lcom/nineoldandroids/animation/ValueAnimator;
    new-instance v19, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$2;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v13}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$2;-><init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;Landroid/graphics/drawable/ColorDrawable;)V

    move-object/from16 v0, v19

    invoke-virtual {v8, v0}, Lcom/nineoldandroids/animation/ValueAnimator;->addUpdateListener(Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 268
    invoke-virtual {v14, v8}, Lcom/nineoldandroids/animation/AnimatorSet;->play(Lcom/nineoldandroids/animation/Animator;)Lcom/nineoldandroids/animation/AnimatorSet$Builder;

    .line 270
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getContext()Landroid/content/Context;

    move-result-object v19

    move-object/from16 v0, v19

    instance-of v0, v0, Landroid/app/Activity;

    move/from16 v19, v0

    if-eqz v19, :cond_136

    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->updateStatusBarColor()Z

    move-result v19

    if-eqz v19, :cond_136

    .line 271
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getContext()Landroid/content/Context;

    move-result-object v4

    check-cast v4, Landroid/app/Activity;

    .line 272
    .local v4, "activity":Landroid/app/Activity;
    invoke-virtual {v4}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Landroid/view/Window;->getStatusBarColor()I

    move-result v16

    .line 274
    .local v16, "startColor2":I
    new-instance v19, Lcom/nineoldandroids/animation/ArgbEvaluator;

    invoke-direct/range {v19 .. v19}, Lcom/nineoldandroids/animation/ArgbEvaluator;-><init>()V

    const/16 v20, 0x2

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    aput-object v22, v20, v21

    const/16 v21, 0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    aput-object v22, v20, v21

    invoke-static/range {v19 .. v20}, Lcom/nineoldandroids/animation/ValueAnimator;->ofObject(Lcom/nineoldandroids/animation/TypeEvaluator;[Ljava/lang/Object;)Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v9

    .line 275
    .local v9, "colorAnim2":Lcom/nineoldandroids/animation/ValueAnimator;
    new-instance v19, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$3;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$3;-><init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;Landroid/app/Activity;)V

    move-object/from16 v0, v19

    invoke-virtual {v9, v0}, Lcom/nineoldandroids/animation/ValueAnimator;->addUpdateListener(Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 286
    invoke-virtual {v14, v9}, Lcom/nineoldandroids/animation/AnimatorSet;->play(Lcom/nineoldandroids/animation/Animator;)Lcom/nineoldandroids/animation/AnimatorSet$Builder;

    .line 288
    .end local v4    # "activity":Landroid/app/Activity;
    .end local v9    # "colorAnim2":Lcom/nineoldandroids/animation/ValueAnimator;
    .end local v16    # "startColor2":I
    :cond_136
    const-wide/16 v20, 0x258

    move-wide/from16 v0, v20

    invoke-virtual {v14, v0, v1}, Lcom/nineoldandroids/animation/AnimatorSet;->setDuration(J)Lcom/nineoldandroids/animation/AnimatorSet;

    .line 289
    invoke-virtual {v14}, Lcom/nineoldandroids/animation/AnimatorSet;->start()V

    .line 291
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->updateToolbarColor()Z

    move-result v19

    if-eqz v19, :cond_163

    .line 292
    const/16 v19, 0x3

    move/from16 v0, v19

    new-array v12, v0, [F

    .line 293
    .local v12, "hsv":[F
    invoke-static {v6, v12}, Landroid/graphics/Color;->colorToHSV(I[F)V

    .line 294
    const/16 v19, 0x2

    aget v20, v12, v19

    const v21, 0x3dcccccd

    add-float v20, v20, v21

    aput v20, v12, v19

    .line 295
    invoke-static {v12}, Landroid/graphics/Color;->HSVToColor([F)I

    move-result v7

    .line 296
    .local v7, "color3":I
    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->setupToolbarColor(I)V

    .line 299
    .end local v7    # "color3":I
    .end local v12    # "hsv":[F
    :cond_163
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mBuyButton:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move/from16 v1, v18

    invoke-virtual {v0, v6, v1}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->setTintColor(II)V

    .line 300
    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->ensureButtonsVisible()V

    goto/16 :goto_18

    .line 228
    .end local v5    # "color1":I
    .end local v6    # "color2":I
    .end local v8    # "colorAnim1":Lcom/nineoldandroids/animation/ValueAnimator;
    .end local v13    # "newDrawable":Landroid/graphics/drawable/ColorDrawable;
    .end local v14    # "set":Lcom/nineoldandroids/animation/AnimatorSet;
    .end local v15    # "startColor":I
    .end local v18    # "titleColor":I
    .restart local v17    # "swatch1":Landroid/support/v7/graphics/Palette$Swatch;
    :cond_175
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getContext()Landroid/content/Context;

    move-result-object v19

    sget v20, Lcom/aviary/android/feather/sdk/R$attr;->colorPrimary:I

    invoke-static/range {v19 .. v20}, Lcom/adobe/android/ui/utils/UIUtils;->getThemeColor(Landroid/content/Context;I)I

    move-result v5

    .restart local v5    # "color1":I
    goto/16 :goto_47

    .line 231
    .end local v5    # "color1":I
    .end local v17    # "swatch1":Landroid/support/v7/graphics/Palette$Swatch;
    :cond_181
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getContext()Landroid/content/Context;

    move-result-object v19

    sget v20, Lcom/aviary/android/feather/sdk/R$attr;->colorPrimary:I

    invoke-static/range {v19 .. v20}, Lcom/adobe/android/ui/utils/UIUtils;->getThemeColor(Landroid/content/Context;I)I

    move-result v5

    .restart local v5    # "color1":I
    goto/16 :goto_47

    .line 241
    .restart local v6    # "color2":I
    .restart local v11    # "drawable":Landroid/graphics/drawable/Drawable;
    .restart local v18    # "titleColor":I
    :cond_18d
    const/4 v15, -0x1

    goto/16 :goto_99

    .line 248
    .end local v11    # "drawable":Landroid/graphics/drawable/Drawable;
    .restart local v13    # "newDrawable":Landroid/graphics/drawable/ColorDrawable;
    .restart local v15    # "startColor":I
    :cond_190
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mTextViewGroup:Landroid/view/View;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v13}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_ad
.end method

.method protected onFinishInflate()V
    .registers 2

    .prologue
    .line 175
    invoke-super {p0}, Landroid/widget/RelativeLayout;->onFinishInflate()V

    .line 176
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->switcher:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mDetailViewContainer:Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    .line 177
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->title:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/adobe/android/ui/view/AdobeTextView;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mTitleTextView:Lcom/adobe/android/ui/view/AdobeTextView;

    .line 178
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->author:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/adobe/android/ui/view/AdobeTextView;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mAuthorTextView:Lcom/adobe/android/ui/view/AdobeTextView;

    .line 179
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->description:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/adobe/android/ui/view/AdobeTextView;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mDescriptionTextView:Lcom/adobe/android/ui/view/AdobeTextView;

    .line 180
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->com_adobe_image_buy_button:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mBuyButton:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    .line 181
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->error_view:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mErrorView:Landroid/view/View;

    .line 182
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->header:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mTextViewGroup:Landroid/view/View;

    .line 183
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->previews_container:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPreviewView:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    .line 184
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->buttons_container:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mButtonsContainerView:Landroid/view/View;

    .line 185
    return-void
.end method

.method protected abstract onForceUpdate()V
.end method

.method public onGlobalLayout()V
    .registers 3

    .prologue
    .line 786
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onGlobalLayout"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 787
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mTextViewGroup:Landroid/view/View;

    if-eqz v0, :cond_18

    .line 788
    sget-boolean v0, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_16:Z

    if-eqz v0, :cond_1c

    .line 789
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mTextViewGroup:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 794
    :cond_18
    :goto_18
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->loadInternal()V

    .line 795
    return-void

    .line 791
    :cond_1c
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mTextViewGroup:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    goto :goto_18
.end method

.method public onPackInstalled(JLjava/lang/String;I)V
    .registers 8
    .param p1, "packId"    # J
    .param p3, "packType"    # Ljava/lang/String;
    .param p4, "purchased"    # I

    .prologue
    .line 590
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->isValidContext()Z

    move-result v0

    if-eqz v0, :cond_25

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getPack()Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    move-result-object v0

    if-eqz v0, :cond_25

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getPackId()J

    move-result-wide v0

    cmp-long v0, p1, v0

    if-nez v0, :cond_25

    .line 591
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onPackInstalled"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 592
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getPackId()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->determinePackOption(J)V

    .line 594
    :cond_25
    return-void
.end method

.method protected abstract onPackLoaded(Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;)V
.end method

.method public onPurchaseSuccess(JLjava/lang/String;Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;)V
    .registers 8
    .param p1, "packId"    # J
    .param p3, "packType"    # Ljava/lang/String;
    .param p4, "purchase"    # Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;

    .prologue
    .line 597
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->isValidContext()Z

    move-result v0

    if-eqz v0, :cond_22

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getPack()Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    move-result-object v0

    if-eqz v0, :cond_22

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getPackId()J

    move-result-wide v0

    cmp-long v0, p1, v0

    if-nez v0, :cond_22

    .line 598
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onPurchaseSuccess"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 599
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getPackId()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->determinePackOption(J)V

    .line 601
    :cond_22
    return-void
.end method

.method public onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V
    .registers 3
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "newState"    # I

    .prologue
    .line 799
    return-void
.end method

.method public onScrolled(Landroid/support/v7/widget/RecyclerView;II)V
    .registers 12
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "dx"    # I
    .param p3, "dy"    # I

    .prologue
    .line 802
    if-nez p2, :cond_5

    if-nez p3, :cond_5

    .line 818
    :cond_4
    :goto_4
    return-void

    .line 806
    :cond_5
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mTextViewGroup:Landroid/view/View;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mTextViewGroup:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getTranslationY()F

    move-result v2

    int-to-float v3, p3

    sub-float/2addr v2, v3

    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 807
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mButtonsContainerView:Landroid/view/View;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mTextViewGroup:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getTranslationY()F

    move-result v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 809
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mDetailViewContainer:Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->getTranslationY()F

    move-result v1

    float-to-double v2, v1

    int-to-float v1, p3

    float-to-double v4, v1

    const-wide/high16 v6, 0x3ff8000000000000L

    div-double/2addr v4, v6

    sub-double/2addr v2, v4

    double-to-float v0, v2

    .line 810
    .local v0, "y":F
    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-lez v1, :cond_31

    .line 811
    const/4 v0, 0x0

    .line 813
    :cond_31
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mDetailViewContainer:Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->setTranslationY(F)V

    .line 815
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mToolbarPixelScroller:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;

    if-eqz v1, :cond_4

    .line 816
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mToolbarPixelScroller:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mDetailViewContainer:Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->getHeight()I

    move-result v2

    invoke-virtual {v1, p2, p3, v2}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->scroll(III)V

    goto :goto_4
.end method

.method public onServiceCreated(Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;)V
    .registers 4
    .param p1, "service"    # Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    .prologue
    .line 821
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onServiceCreated"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 822
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->startSetupInternal()V

    .line 823
    return-void
.end method

.method protected onSetupDone()V
    .registers 3

    .prologue
    .line 473
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mStoreSetupCompleted:Z

    if-nez v0, :cond_15

    .line 474
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onSetupDone"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 475
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mStoreSetupCompleted:Z

    .line 476
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getPackId()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->determinePackOption(J)V

    .line 478
    :cond_15
    return-void
.end method

.method public onUserAuthenticated(Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;)V
    .registers 14
    .param p1, "userStatus"    # Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;

    .prologue
    const-wide/16 v10, -0x1

    const/4 v7, 0x0

    .line 604
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->isValidContext()Z

    move-result v0

    if-eqz v0, :cond_6d

    .line 605
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onUserAuthenticated: %s"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p1, v6, v8

    invoke-interface {v0, v1, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 606
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getPackId()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->determinePackOption(J)V

    .line 608
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->getType()Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus$Type;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus$Type;->LOGOUT:Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus$Type;

    if-eq v0, v1, :cond_6d

    .line 609
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getUUID()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->getUUID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6d

    .line 610
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->isSuccess()Z

    move-result v0

    if-eqz v0, :cond_6d

    .line 611
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->getOptions()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "packId"

    invoke-virtual {v0, v1, v10, v11}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    .line 612
    .local v2, "packId":J
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->getOptions()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "identifier"

    invoke-virtual {v0, v1, v7}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 613
    .local v4, "packIdentifier":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->getOptions()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "packType"

    invoke-virtual {v0, v1, v7}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 614
    .local v5, "packType":Ljava/lang/String;
    cmp-long v0, v2, v10

    if-lez v0, :cond_6d

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6d

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6d

    .line 615
    const-string v6, "shop_detail"

    move-object v1, p0

    invoke-direct/range {v1 .. v7}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->restorePackItem(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;)V

    .line 621
    .end local v2    # "packId":J
    .end local v4    # "packIdentifier":Ljava/lang/String;
    .end local v5    # "packType":Ljava/lang/String;
    :cond_6d
    return-void
.end method

.method public resetPositions()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 548
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mTextViewGroup:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 549
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mButtonsContainerView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 550
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mDetailViewContainer:Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailBannerView;->setTranslationY(F)V

    .line 551
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPreviewView:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->resetPositions()V

    .line 552
    return-void
.end method

.method setPackOption(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;J)V
    .registers 8
    .param p1, "option"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;
    .param p2, "packId"    # J

    .prologue
    .line 449
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "setPackOption: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 450
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mBuyButton:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    invoke-virtual {v0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->setPackOption(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;J)V

    .line 451
    return-void
.end method

.method public setParentFragment(Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;)V
    .registers 6
    .param p1, "parent"    # Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;

    .prologue
    .line 154
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "setParentFragment: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 155
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mParent:Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;

    .line 156
    return-void
.end method

.method protected setupToolbarColor(I)V
    .registers 5
    .param p1, "color"    # I

    .prologue
    .line 163
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 164
    .local v0, "context":Landroid/content/Context;
    instance-of v2, v0, Lcom/adobe/creativesdk/aviary/ToolBarActivity;

    if-eqz v2, :cond_1c

    .line 165
    check-cast v0, Lcom/adobe/creativesdk/aviary/ToolBarActivity;

    .end local v0    # "context":Landroid/content/Context;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/ToolBarActivity;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v1

    .line 166
    .local v1, "toolbar":Landroid/support/v7/widget/Toolbar;
    if-eqz v1, :cond_1c

    .line 167
    new-instance v2, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;

    invoke-direct {v2, v1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;-><init>(Landroid/support/v7/widget/Toolbar;)V

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mToolbarPixelScroller:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;

    .line 168
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mToolbarPixelScroller:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;

    invoke-virtual {v2, p1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->setColor(I)V

    .line 171
    .end local v1    # "toolbar":Landroid/support/v7/widget/Toolbar;
    :cond_1c
    return-void
.end method

.method public update(JZLandroid/os/Bundle;)V
    .registers 12
    .param p1, "packId"    # J
    .param p3, "isAnimating"    # Z
    .param p4, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 531
    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "update{packId: %d, isAnimating: %b, extras: %s}"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    invoke-static {p4}, Lcom/adobe/creativesdk/aviary/internal/utils/BundleUtils;->toString(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 533
    const/4 v0, -0x1

    .line 534
    .local v0, "clickedFromPosition":I
    if-eqz p4, :cond_29

    .line 535
    const-string v1, "extra-click-from-position"

    const/4 v2, -0x1

    invoke-virtual {p4, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 538
    :cond_29
    iput-boolean p3, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mDataIsAnimating:Z

    .line 539
    iput-wide p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPackId:J

    .line 540
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    .line 541
    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->mClickedFromPosition:I

    .line 543
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->resetPositions()V

    .line 544
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->loadInternal()V

    .line 545
    return-void
.end method

.method protected updateStatusBarColor()Z
    .registers 2

    .prologue
    .line 146
    const/4 v0, 0x0

    return v0
.end method

.method protected updateToolbarColor()Z
    .registers 2

    .prologue
    .line 150
    const/4 v0, 0x0

    return v0
.end method
