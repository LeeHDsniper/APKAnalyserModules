.class public Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;
.super Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;
.source "AdobeImageEditorActivity.java"

# interfaces
.implements Lcom/adobe/creativesdk/aviary/internal/account/AdobeImageAccountDelegate;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;,
        Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter;,
        Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field protected static logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

.field private static mMessageShown:Z


# instance fields
.field private mAccountConnection:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

.field private mActionBarSize:I

.field private mAdobeImageToolBar:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;

.field private mBottomBarFlipper:Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;

.field private mContentManagerService:Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

.field private mDownloadId:J

.field private mDownloadTask:Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;

.field private mDrawingViewContainer:Landroid/view/ViewGroup;

.field protected final mHandler:Landroid/os/Handler;

.field private mImageRestore:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;

.field private mInlineProgressLoader:Landroid/view/View;

.field private mIsRunning:Z

.field private mMainContent:Landroid/view/ViewGroup;

.field protected mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

.field private mOrientation:I

.field protected mSaving:Z

.field private mSetupDone:Z

.field private mToastLoader:Lcom/adobe/android/ui/widget/AdobeCustomToast;

.field private mToolsList:Landroid/support/v7/widget/RecyclerView;

.field private pResultCode:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 374
    const-class v0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_14

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->$assertionsDisabled:Z

    .line 383
    const-string v0, "AdobeImageEditorActivity"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void

    .line 374
    :cond_14
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 374
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;-><init>()V

    .line 376
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mDownloadId:J

    .line 389
    const/4 v0, 0x0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->pResultCode:I

    .line 411
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mHandler:Landroid/os/Handler;

    .line 417
    const/4 v0, -0x1

    iput v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mActionBarSize:I

    .line 1702
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;
    .param p1, "x1"    # Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    .prologue
    .line 374
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->onServiceConnected(Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;)V

    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;)Landroid/view/View;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    .prologue
    .line 374
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mInlineProgressLoader:Landroid/view/View;

    return-object v0
.end method

.method private canShowNextMessage(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)Z
    .registers 12
    .param p1, "controller"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 1542
    if-eqz p1, :cond_a

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->isClosed()Z

    move-result v6

    if-nez v6, :cond_24

    .line 1543
    :cond_a
    sget-object v6, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v7, "controller is closed? %s"

    new-array v8, v4, [Ljava/lang/Object;

    if-eqz p1, :cond_21

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->isClosed()Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    :goto_1a
    aput-object v4, v8, v5

    invoke-interface {v6, v7, v8}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    move v4, v5

    .line 1568
    :cond_20
    :goto_20
    return v4

    .line 1543
    :cond_21
    const-string v4, "null"

    goto :goto_1a

    .line 1547
    :cond_24
    sget-boolean v6, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMessageShown:Z

    if-eqz v6, :cond_2a

    move v4, v5

    .line 1548
    goto :goto_20

    .line 1552
    :cond_2a
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->getInstance(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;

    move-result-object v6

    const-string v7, "first.time.launch.no.message"

    .line 1553
    invoke-virtual {v6, v7}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->containsSingleTimeKey(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_41

    .line 1554
    sget-object v4, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "don\'t show message at first launch"

    new-array v7, v5, [Ljava/lang/Object;

    invoke-interface {v4, v6, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    move v4, v5

    .line 1555
    goto :goto_20

    .line 1558
    :cond_41
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->getInstance(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;

    move-result-object v6

    const-string v7, "message.service.lastMessageShowDate"

    const-wide/16 v8, -0x1

    invoke-virtual {v6, v7, v8, v9}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    .line 1561
    .local v0, "lastMessageDateTime":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 1563
    .local v2, "now":J
    sub-long v6, v2, v0

    const-wide/32 v8, 0xf731400

    cmp-long v6, v6, v8

    if-gez v6, :cond_20

    .line 1564
    sget-object v4, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "message already shown in the previous 3 days"

    invoke-interface {v4, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    move v4, v5

    .line 1565
    goto :goto_20
.end method

.method private createDownloadErrorDialog()V
    .registers 2

    .prologue
    .line 624
    new-instance v0, Lcom/adobe/creativesdk/aviary/dialogs/DownloadErrorDialogFragment;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/dialogs/DownloadErrorDialogFragment;-><init>()V

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->addDialogFragment(Landroid/support/v4/app/DialogFragment;)V

    .line 625
    return-void
.end method

.method private createExitConfirmationDialog()V
    .registers 2

    .prologue
    .line 632
    new-instance v0, Lcom/adobe/creativesdk/aviary/dialogs/ConfirmExitDialogFragment;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/dialogs/ConfirmExitDialogFragment;-><init>()V

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->addDialogFragment(Landroid/support/v4/app/DialogFragment;)V

    .line 633
    return-void
.end method

.method private createExitNoChangesConfirmationDialog()V
    .registers 2

    .prologue
    .line 620
    new-instance v0, Lcom/adobe/creativesdk/aviary/dialogs/ConfirmExitNoChangesDialogFragment;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/dialogs/ConfirmExitNoChangesDialogFragment;-><init>()V

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->addDialogFragment(Landroid/support/v4/app/DialogFragment;)V

    .line 621
    return-void
.end method

.method private createFeedBackDialog()V
    .registers 2

    .prologue
    .line 628
    new-instance v0, Lcom/adobe/creativesdk/aviary/dialogs/FeedBackDialogFragment;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/dialogs/FeedBackDialogFragment;-><init>()V

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->addDialogFragment(Landroid/support/v4/app/DialogFragment;)V

    .line 629
    return-void
.end method

.method private flagPromoMessageAsShown()V
    .registers 5

    .prologue
    .line 1572
    sget-object v0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "flagPromoMessageAsShown"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1573
    const/4 v0, 0x1

    sput-boolean v0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMessageShown:Z

    .line 1574
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->getInstance(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;

    move-result-object v0

    const-string v1, "message.service.lastMessageShowDate"

    .line 1575
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 1574
    invoke-virtual {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->putLong(Ljava/lang/String;J)V

    .line 1576
    return-void
.end method

.method private hideProgressLoader()V
    .registers 5

    .prologue
    .line 920
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    const/high16 v1, 0x3f800000

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 921
    .local v0, "fadeout":Landroid/view/animation/Animation;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x10e0001

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    int-to-long v2, v1

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 922
    new-instance v1, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$3;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$3;-><init>(Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 936
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mInlineProgressLoader:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 937
    return-void
.end method

.method private initializeController()V
    .registers 3

    .prologue
    .line 543
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;-><init>(Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    .line 544
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/utils/ScreenUtils;->isTablet(Landroid/content/Context;)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->setIsTablet(Z)V

    .line 545
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->onControllerLoaded(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)V

    .line 546
    return-void
.end method

.method private initializeMessages()V
    .registers 3

    .prologue
    .line 1508
    sget-object v0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "initializeMessages"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 1509
    return-void
.end method

.method private onServiceConnected(Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;)V
    .registers 5
    .param p1, "service"    # Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    .prologue
    .line 1463
    sget-object v0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onServiceConnected"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 1464
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mContentManagerService:Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    .line 1466
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_15

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->isActive()Z

    move-result v0

    if-nez v0, :cond_16

    .line 1486
    :cond_15
    :goto_15
    return-void

    .line 1470
    :cond_16
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mContentManagerService:Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    .line 1471
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->startSetup()Lrx/Observable;

    move-result-object v0

    invoke-static {p0, v0}, Lrx/android/app/AppObservable;->bindActivity(Landroid/app/Activity;Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$8;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$8;-><init>(Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;)V

    new-instance v2, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$9;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$9;-><init>(Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;)V

    .line 1472
    invoke-virtual {v0, v1, v2}, Lrx/Observable;->subscribe(Lrx/functions/Action1;Lrx/functions/Action1;)Lrx/Subscription;

    goto :goto_15
.end method


# virtual methods
.method public addDialogFragment(Landroid/support/v4/app/DialogFragment;)V
    .registers 6
    .param p1, "dialog"    # Landroid/support/v4/app/DialogFragment;

    .prologue
    .line 636
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    .line 637
    .local v0, "ft":Landroid/support/v4/app/FragmentTransaction;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    const-string v3, "dialog"

    invoke-virtual {v2, v3}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v1

    .line 638
    .local v1, "prev":Landroid/support/v4/app/Fragment;
    if-eqz v1, :cond_17

    .line 639
    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 641
    :cond_17
    const-string v2, "dialog"

    invoke-virtual {p1, v0, v2}, Landroid/support/v4/app/DialogFragment;->show(Landroid/support/v4/app/FragmentTransaction;Ljava/lang/String;)I

    .line 642
    return-void
.end method

.method protected exitWithNoModifications()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 889
    sget-object v1, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "exitWithNoModifications"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 890
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 891
    .local v0, "result":Landroid/content/Intent;
    const-string v1, "bitmap-changed"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 892
    invoke-virtual {p0, v3, v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->onSetResult(ILandroid/content/Intent;)V

    .line 893
    invoke-static {p0}, Landroid/support/v4/app/ActivityCompat;->finishAfterTransition(Landroid/app/Activity;)V

    .line 894
    return-void
.end method

.method public getActionBarSize()I
    .registers 2

    .prologue
    .line 867
    iget v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mActionBarSize:I

    if-gez v0, :cond_a

    .line 868
    invoke-static {p0}, Lcom/adobe/android/ui/utils/UIUtils;->getActionBarHeight(Landroid/content/Context;)I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mActionBarSize:I

    .line 871
    :cond_a
    iget v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mActionBarSize:I

    return v0
.end method

.method public getBottomBar()Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;
    .registers 2

    .prologue
    .line 847
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mBottomBarFlipper:Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;

    return-object v0
.end method

.method public getContentService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;
    .registers 2

    .prologue
    .line 1494
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mAccountConnection:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->getService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v0

    return-object v0
.end method

.method protected getDefaultOutputDestination(Landroid/graphics/Bitmap$CompressFormat;)Ljava/io/File;
    .registers 3
    .param p1, "format"    # Landroid/graphics/Bitmap$CompressFormat;

    .prologue
    .line 1034
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getSystemDefaultOutput(Landroid/graphics/Bitmap$CompressFormat;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public getDrawingImageContainer()Landroid/view/ViewGroup;
    .registers 2

    .prologue
    .line 881
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mDrawingViewContainer:Landroid/view/ViewGroup;

    return-object v0
.end method

.method public getMainContent()Landroid/view/ViewGroup;
    .registers 2

    .prologue
    .line 851
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainContent:Landroid/view/ViewGroup;

    return-object v0
.end method

.method public getMainController()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
    .registers 2

    .prologue
    .line 1408
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    return-object v0
.end method

.method public getMainImage()Lit/sephiroth/android/library/imagezoom/ImageViewTouch;
    .registers 2

    .prologue
    .line 859
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mImageRestore:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;

    return-object v0
.end method

.method public getMainToolBar()Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;
    .registers 2

    .prologue
    .line 855
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mAdobeImageToolBar:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;

    return-object v0
.end method

.method public getOptionsPanelContainer()Landroid/view/ViewGroup;
    .registers 2

    .prologue
    .line 843
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mBottomBarFlipper:Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->getContentPanel()Landroid/view/ViewGroup;

    move-result-object v0

    return-object v0
.end method

.method protected getSystemDefaultOutput(Landroid/graphics/Bitmap$CompressFormat;)Ljava/io/File;
    .registers 8
    .param p1, "format"    # Landroid/graphics/Bitmap$CompressFormat;

    .prologue
    .line 1041
    new-instance v1, Ljava/io/File;

    sget-object v0, Landroid/os/Environment;->DIRECTORY_PICTURES:Ljava/lang/String;

    .line 1042
    invoke-static {v0}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "aviary-image-"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1043
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "."

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    if-ne p1, v0, :cond_33

    const-string v0, "jpeg"

    :goto_27
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v2, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v1

    :cond_33
    const-string v0, "png"

    goto :goto_27
.end method

.method public getTracker()Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;
    .registers 2

    .prologue
    .line 863
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mTracker:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    return-object v0
.end method

.method protected handleBackPressedOnUnchangedImage()Z
    .registers 8

    .prologue
    const/4 v3, 0x0

    .line 768
    sget-object v4, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "handleBackPressedOnUnchangedImage"

    new-array v6, v3, [Ljava/lang/Object;

    invoke-interface {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 769
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getMainController()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    .line 770
    .local v0, "controller":Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
    if-eqz v0, :cond_44

    .line 771
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getMainController()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v4

    const-class v5, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    invoke-virtual {v4, v5}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    .line 772
    .local v1, "service":Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;
    if-eqz v1, :cond_44

    .line 773
    const-string v4, "source-type"

    invoke-virtual {v1, v4}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->getIntentHasExtra(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_44

    .line 774
    const-string v4, "source-type"

    sget-object v5, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;->Gallery:Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;

    .line 775
    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;->name()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->getIntentExtra(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 776
    .local v2, "value":Ljava/lang/String;
    sget-object v4, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;->Camera:Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;->name()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_44

    .line 778
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->createExitNoChangesConfirmationDialog()V

    .line 779
    const/4 v3, 0x1

    .line 784
    .end local v1    # "service":Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;
    .end local v2    # "value":Ljava/lang/String;
    :cond_44
    return v3
.end method

.method protected handleIntent(Landroid/content/Intent;)Landroid/net/Uri;
    .registers 9
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 807
    sget-object v3, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "handleIntent: %s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 808
    if-eqz p1, :cond_70

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v3

    if-eqz v3, :cond_70

    .line 810
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 811
    .local v0, "action":Ljava/lang/String;
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 812
    .local v2, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v3, "from"

    if-eqz v0, :cond_6d

    .end local v0    # "action":Ljava/lang/String;
    :goto_22
    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 813
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getTracker()Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v3

    const-string v4, "editor: invoked"

    invoke-virtual {v3, v4, v2}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEventAttributes(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 815
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    .line 823
    .local v1, "data":Landroid/net/Uri;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->isIceCreamSandwich()Z

    move-result v3

    if-eqz v3, :cond_54

    .line 824
    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "content://com.android.gallery3d.provider"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_54

    .line 827
    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "com.android.gallery3d"

    const-string v5, "com.google.android.gallery3d"

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 831
    :cond_54
    sget-object v3, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "src: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 834
    .end local v1    # "data":Landroid/net/Uri;
    .end local v2    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_6c
    return-object v1

    .line 812
    .restart local v0    # "action":Ljava/lang/String;
    .restart local v2    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_6d
    const-string v0, "null"

    goto :goto_22

    .line 834
    .end local v0    # "action":Ljava/lang/String;
    .end local v2    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_70
    const/4 v1, 0x0

    goto :goto_6c
.end method

.method public hideProgress(Z)V
    .registers 4
    .param p1, "modal"    # Z

    .prologue
    .line 1099
    if-nez p1, :cond_9

    .line 1100
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mAdobeImageToolBar:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->setApplyProgressVisible(Z)V

    .line 1107
    :cond_8
    :goto_8
    return-void

    .line 1102
    :cond_9
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mToastLoader:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    if-eqz v0, :cond_8

    .line 1103
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mToastLoader:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    invoke-virtual {v0}, Lcom/adobe/android/ui/widget/AdobeCustomToast;->hide()V

    .line 1104
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mToastLoader:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    goto :goto_8
.end method

.method public hideProgressIfVisible()V
    .registers 3

    .prologue
    .line 1110
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mAdobeImageToolBar:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->getApplyProgressVisible()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 1111
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mAdobeImageToolBar:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->setApplyProgressVisible(Z)V

    .line 1113
    :cond_e
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mToastLoader:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    if-eqz v0, :cond_1a

    .line 1114
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mToastLoader:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    invoke-virtual {v0}, Lcom/adobe/android/ui/widget/AdobeCustomToast;->hide()V

    .line 1115
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mToastLoader:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    .line 1117
    :cond_1a
    return-void
.end method

.method public isActive()Z
    .registers 2

    .prologue
    .line 1401
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mIsRunning:Z

    return v0
.end method

.method public isContentServiceConnected()Z
    .registers 2

    .prologue
    .line 1499
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mAccountConnection:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->isConnected()Z

    move-result v0

    return v0
.end method

.method protected loadImage(Landroid/net/Uri;)V
    .registers 10
    .param p1, "data"    # Landroid/net/Uri;

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 684
    sget-object v2, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "loadImage: %s"

    new-array v4, v7, [Ljava/lang/Object;

    aput-object p1, v4, v6

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 685
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mDownloadTask:Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;

    if-eqz v2, :cond_19

    .line 686
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mDownloadTask:Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;

    invoke-virtual {v2, v6}, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;->setEnabled(Z)V

    .line 687
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mDownloadTask:Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;

    .line 690
    :cond_19
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    const-class v3, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    .line 692
    .local v0, "dataService":Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;
    sget-boolean v2, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->$assertionsDisabled:Z

    if-nez v2, :cond_2f

    if-nez v0, :cond_2f

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 693
    :cond_2f
    const-string v2, "max-image-size"

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->getIntentExtra(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 694
    .local v1, "maxSize":I
    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->setSourceImageUri(Landroid/net/Uri;)V

    .line 697
    new-instance v2, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;

    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mDownloadId:J

    invoke-direct {v2, v4, v5, p1, v1}, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;-><init>(JLandroid/net/Uri;I)V

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mDownloadTask:Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;

    .line 698
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mDownloadTask:Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;

    new-array v3, v7, [Landroid/content/Context;

    aput-object p0, v3, v6

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;->executeInParallel([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 701
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mImageRestore:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;

    invoke-virtual {v2, v6}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;->setIsActive(Z)V

    .line 702
    return-void
.end method

.method protected loadTools()V
    .registers 8

    .prologue
    const/4 v6, 0x0

    .line 667
    sget-object v3, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "loadTools"

    new-array v5, v6, [Ljava/lang/Object;

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 668
    const/4 v2, 0x0

    .line 669
    .local v2, "toolList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    const-class v4, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    .line 672
    .local v0, "dataService":Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getToolList()Ljava/util/List;

    move-result-object v3

    if-nez v3, :cond_4c

    .line 673
    sget-boolean v3, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->$assertionsDisabled:Z

    if-nez v3, :cond_29

    if-nez v0, :cond_29

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 674
    :cond_29
    const-string v3, "tools-list"

    invoke-virtual {v0, v3}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->getIntentHasExtra(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3f

    .line 675
    const-string v3, "tools-list"

    new-array v4, v6, [Ljava/lang/String;

    invoke-virtual {v0, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->getIntentExtra(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    .line 678
    :cond_3f
    new-instance v1, Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask;

    invoke-direct {v1, v2}, Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask;-><init>(Ljava/util/List;)V

    .line 679
    .local v1, "task":Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask;
    const/4 v3, 0x1

    new-array v3, v3, [Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    aput-object p0, v3, v6

    invoke-virtual {v1, v3}, Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask;->executeInParallel([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 681
    .end local v1    # "task":Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask;
    :cond_4c
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .registers 9
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 908
    sget-object v0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onActivityResult: %d - %d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 909
    invoke-super {p0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 910
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->register(Ljava/lang/Object;)V

    .line 912
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getContentService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v0

    if-eqz v0, :cond_2f

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getContentService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->handleActivityResult(IILandroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_2f

    .line 917
    :goto_2e
    return-void

    .line 916
    :cond_2f
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    invoke-virtual {v0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->onActivityResult(IILandroid/content/Intent;)Z

    goto :goto_2e
.end method

.method public onBackPressed()V
    .registers 7

    .prologue
    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 728
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->onBackPressed()Z

    move-result v3

    if-nez v3, :cond_2b

    .line 729
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mToastLoader:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    if-eqz v3, :cond_15

    .line 730
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mToastLoader:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    invoke-virtual {v3}, Lcom/adobe/android/ui/widget/AdobeCustomToast;->hide()V

    .line 731
    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mToastLoader:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    .line 735
    :cond_15
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    .line 736
    .local v2, "manager":Landroid/support/v4/app/FragmentManager;
    invoke-virtual {v2}, Landroid/support/v4/app/FragmentManager;->getBackStackEntryCount()I

    move-result v0

    .line 737
    .local v0, "count":I
    if-lez v0, :cond_2c

    .line 738
    sget-object v3, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "remove fragments..."

    new-array v5, v5, [Ljava/lang/Object;

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 739
    invoke-virtual {v2}, Landroid/support/v4/app/FragmentManager;->popBackStack()V

    .line 759
    .end local v0    # "count":I
    .end local v2    # "manager":Landroid/support/v4/app/FragmentManager;
    :cond_2b
    :goto_2b
    return-void

    .line 743
    .restart local v0    # "count":I
    .restart local v2    # "manager":Landroid/support/v4/app/FragmentManager;
    :cond_2c
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBitmapIsChanged()Z

    move-result v3

    if-eqz v3, :cond_5a

    .line 745
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    const-class v4, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    .line 746
    .local v1, "dataService":Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;
    if-eqz v1, :cond_56

    const-string v3, "hide-exit-unsave-confirmation"

    .line 747
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->getIntentExtra(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_56

    .line 748
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->onBackPressed()V

    goto :goto_2b

    .line 750
    :cond_56
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->createExitConfirmationDialog()V

    goto :goto_2b

    .line 753
    .end local v1    # "dataService":Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;
    :cond_5a
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->handleBackPressedOnUnchangedImage()Z

    move-result v3

    if-nez v3, :cond_2b

    .line 754
    invoke-virtual {p0, v5, v4}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->onSetResult(ILandroid/content/Intent;)V

    .line 755
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->onBackPressed()V

    goto :goto_2b
.end method

.method public onBackPressed(Z)V
    .registers 2
    .param p1, "force"    # Z

    .prologue
    .line 793
    if-eqz p1, :cond_6

    .line 794
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->onBackPressed()V

    .line 798
    :goto_5
    return-void

    .line 796
    :cond_6
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->onBackPressed()V

    goto :goto_5
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 4
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 653
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 655
    iget v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mOrientation:I

    iget v1, p1, Landroid/content/res/Configuration;->orientation:I

    if-eq v0, v1, :cond_16

    .line 656
    iget v0, p1, Landroid/content/res/Configuration;->orientation:I

    iput v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mOrientation:I

    .line 658
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    if-eqz v0, :cond_16

    .line 659
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->onConfigurationChanged(Landroid/content/res/Configuration;)Z

    .line 663
    :cond_16
    iget v0, p1, Landroid/content/res/Configuration;->orientation:I

    iput v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mOrientation:I

    .line 664
    return-void
.end method

.method public onContentChanged()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 706
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->onContentChanged()V

    .line 707
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->bottombar:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mBottomBarFlipper:Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;

    .line 708
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mBottomBarFlipper:Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->getToolsListView()Landroid/support/v7/widget/RecyclerView;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mToolsList:Landroid/support/v7/widget/RecyclerView;

    .line 709
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->drawing_view_container:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mDrawingViewContainer:Landroid/view/ViewGroup;

    .line 710
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->image_loading_view:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mInlineProgressLoader:Landroid/view/View;

    .line 711
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->image:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mImageRestore:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;

    .line 712
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->main_content:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainContent:Landroid/view/ViewGroup;

    .line 714
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mAdobeImageToolBar:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;

    .line 715
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mAdobeImageToolBar:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;

    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->setClickable(Z)V

    .line 716
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mAdobeImageToolBar:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;

    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->setSaveEnabled(Z)V

    .line 719
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mImageRestore:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;

    sget-object v1, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;->FIT_IF_BIGGER:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;->setDisplayType(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;)V

    .line 721
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mToolsList:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, v2}, Landroid/support/v7/widget/RecyclerView;->setEnabled(Z)V

    .line 722
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mToolsList:Landroid/support/v7/widget/RecyclerView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 723
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mToolsList:Landroid/support/v7/widget/RecyclerView;

    new-instance v1, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-direct {v1, p0, v2, v2}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 724
    return-void
.end method

.method protected onControllerLoaded(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)V
    .registers 4
    .param p1, "controller"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    .prologue
    .line 549
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->tryConnectToContentService()Lrx/Observable;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$2;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$2;-><init>(Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;)V

    .line 550
    invoke-virtual {v0, v1}, Lrx/Observable;->doOnError(Lrx/functions/Action1;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$1;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$1;-><init>(Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;)V

    .line 557
    invoke-virtual {v0, v1}, Lrx/Observable;->doOnNext(Lrx/functions/Action1;)Lrx/Observable;

    move-result-object v0

    .line 565
    invoke-virtual {v0}, Lrx/Observable;->subscribe()Lrx/Subscription;

    .line 566
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 9
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x0

    const/4 v6, 0x0

    .line 495
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/DateTimeUtils;->tick()J

    move-result-wide v2

    .line 497
    .local v2, "t1":J
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->onPreCreate()V

    .line 498
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->onCreate(Landroid/os/Bundle;)V

    .line 503
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/utils/ScreenUtils;->isTablet(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_16

    .line 504
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->setRequestedOrientation(I)V

    .line 507
    :cond_16
    sget v1, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_main_layout:I

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->setContentView(I)V

    .line 509
    invoke-virtual {p0, v6, v4}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->onSetResult(ILandroid/content/Intent;)V

    .line 511
    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mAccountConnection:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    .line 514
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->initializeController()V

    .line 516
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->onInitializeUtils()V

    .line 519
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->handleIntent(Landroid/content/Intent;)Landroid/net/Uri;

    move-result-object v0

    .line 521
    .local v0, "srcUri":Landroid/net/Uri;
    if-nez v0, :cond_3c

    .line 522
    invoke-virtual {p0, v6, v4}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->onSetResult(ILandroid/content/Intent;)V

    .line 523
    invoke-static {p0}, Landroid/support/v4/app/ActivityCompat;->finishAfterTransition(Landroid/app/Activity;)V

    .line 540
    :goto_3b
    return-void

    .line 528
    :cond_3c
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->loadTools()V

    .line 531
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->loadImage(Landroid/net/Uri;)V

    .line 534
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->onPostCreate()V

    .line 536
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getTracker()Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v1

    const-string v4, "editor: opened"

    invoke-virtual {v1, v4}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;)V

    .line 537
    const-string v1, "onCreate finished"

    invoke-static {v2, v3, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/DateTimeUtils;->tick(JLjava/lang/String;)J

    .line 539
    sget-object v1, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "actionbarsize: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {p0}, Lcom/adobe/android/ui/utils/UIUtils;->getActionBarHeight(Landroid/content/Context;)I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-array v5, v6, [Ljava/lang/Object;

    invoke-interface {v1, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_3b
.end method

.method protected onDestroy()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 599
    iget v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->pResultCode:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_f

    .line 600
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getTracker()Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v0

    const-string v1, "editor: cancelled"

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;)V

    .line 603
    :cond_f
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->onDestroy()V

    .line 604
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->unregister(Ljava/lang/Object;)V

    .line 606
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mDownloadTask:Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;

    if-eqz v0, :cond_21

    .line 607
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mDownloadTask:Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;->setEnabled(Z)V

    .line 608
    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mDownloadTask:Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;

    .line 611
    :cond_21
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    if-eqz v0, :cond_2a

    .line 612
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->dispose()V

    .line 615
    :cond_2a
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mAccountConnection:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->dispose()V

    .line 616
    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    .line 617
    return-void
.end method

.method public onEvent(Lcom/adobe/creativesdk/aviary/internal/events/MessageUserActionEvent;)V
    .registers 10
    .param p1, "event"    # Lcom/adobe/creativesdk/aviary/internal/events/MessageUserActionEvent;

    .prologue
    .line 1378
    sget-object v3, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "MessageUserActionEvent"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1379
    iget-object v3, p1, Lcom/adobe/creativesdk/aviary/internal/events/MessageUserActionEvent;->extras:Landroid/os/Bundle;

    if-eqz v3, :cond_32

    .line 1380
    iget-object v3, p1, Lcom/adobe/creativesdk/aviary/internal/events/MessageUserActionEvent;->extras:Landroid/os/Bundle;

    const-string v4, "extra-in-quick-tool"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1381
    .local v2, "toolName":Ljava/lang/String;
    iget-object v3, p1, Lcom/adobe/creativesdk/aviary/internal/events/MessageUserActionEvent;->extras:Landroid/os/Bundle;

    const-string v4, "extra-in-quick-tool-options"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 1383
    .local v0, "options":Landroid/os/Bundle;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory;->findToolByName(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    move-result-object v1

    .line 1384
    .local v1, "tool":Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;
    if-eqz v1, :cond_32

    if-eqz v0, :cond_32

    .line 1385
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mHandler:Landroid/os/Handler;

    new-instance v4, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$5;

    invoke-direct {v4, p0, v1, v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$5;-><init>(Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;Landroid/os/Bundle;)V

    const-wide/16 v6, 0x1f4

    invoke-virtual {v3, v4, v6, v7}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1394
    .end local v0    # "options":Landroid/os/Bundle;
    .end local v1    # "tool":Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;
    .end local v2    # "toolName":Ljava/lang/String;
    :cond_32
    return-void
.end method

.method public onEventMainThread(Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter$ToolsListFeedbackEvent;)V
    .registers 2
    .param p1, "event"    # Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter$ToolsListFeedbackEvent;

    .prologue
    .line 1224
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->createFeedBackDialog()V

    .line 1225
    return-void
.end method

.method public onEventMainThread(Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadCompleteEvent;)V
    .registers 16
    .param p1, "event"    # Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadCompleteEvent;

    .prologue
    .line 1324
    sget-object v7, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v8, "DownloadCompleteEvent, %d == %d"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadCompleteEvent;->getId()J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x1

    iget-wide v12, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mDownloadId:J

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-interface {v7, v8, v9}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1326
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadCompleteEvent;->getId()J

    move-result-wide v8

    iget-wide v10, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mDownloadId:J

    cmp-long v7, v8, v10

    if-nez v7, :cond_104

    .line 1327
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mDownloadTask:Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;->setEnabled(Z)V

    .line 1328
    const/4 v7, 0x0

    iput-object v7, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mDownloadTask:Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;

    .line 1330
    iget-object v1, p1, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadCompleteEvent;->bitmap:Landroid/graphics/Bitmap;

    .line 1331
    .local v1, "bitmap":Landroid/graphics/Bitmap;
    iget-object v2, p1, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadCompleteEvent;->imageInfo:Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;

    .line 1333
    .local v2, "imageInfo":Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getMainImage()Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    move-result-object v7

    const/4 v8, 0x0

    const/high16 v9, -0x40800000

    const/high16 v10, -0x40800000

    invoke-virtual {v7, v1, v8, v9, v10}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setImageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;FF)V

    .line 1335
    const/high16 v7, 0x10a0000

    invoke-static {p0, v7}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 1336
    .local v0, "animation":Landroid/view/animation/Animation;
    const/4 v7, 0x1

    invoke-virtual {v0, v7}, Landroid/view/animation/Animation;->setFillEnabled(Z)V

    .line 1338
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mImageRestore:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;->setVisibility(I)V

    .line 1339
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mImageRestore:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;

    invoke-virtual {v7, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;->startAnimation(Landroid/view/animation/Animation;)V

    .line 1341
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->hideProgressLoader()V

    .line 1343
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    if-eqz v7, :cond_70

    .line 1344
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getEnabled()Z

    move-result v7

    if-nez v7, :cond_6a

    .line 1345
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    invoke-virtual {v7, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->onActivate(Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;)V

    .line 1347
    :cond_6a
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mImageRestore:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;->setIsActive(Z)V

    .line 1350
    :cond_70
    if-eqz v1, :cond_d2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->getOriginalSize()[I

    move-result-object v7

    if-eqz v7, :cond_d2

    .line 1351
    sget-object v7, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "original.size: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->getOriginalSize()[I

    move-result-object v9

    const/4 v10, 0x0

    aget v9, v9, v10

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "x"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->getOriginalSize()[I

    move-result-object v9

    const/4 v10, 0x1

    aget v9, v9, v10

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 1352
    sget-object v7, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "final.size: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "x"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 1356
    :cond_d2
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    .line 1357
    .local v3, "intent":Landroid/content/Intent;
    const/4 v4, 0x0

    .line 1358
    .local v4, "quickLaunchRequested":Z
    if-eqz v3, :cond_fe

    .line 1359
    const-string v7, "extra-in-quick-tool"

    invoke-virtual {v3, v7}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_fe

    .line 1360
    const-string v7, "extra-in-quick-tool"

    .line 1361
    invoke-virtual {v3, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory;->findToolByName(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    move-result-object v5

    .line 1362
    .local v5, "tool":Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;
    const-string v7, "extra-in-quick-tool-options"

    invoke-virtual {v3, v7}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v6

    .line 1363
    .local v6, "toolExtras":Landroid/os/Bundle;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->getInstance()Lde/greenrobot/event/EventBus;

    move-result-object v7

    new-instance v8, Lcom/adobe/creativesdk/aviary/internal/events/QuickLaunchEvent;

    invoke-direct {v8, v5, v6}, Lcom/adobe/creativesdk/aviary/internal/events/QuickLaunchEvent;-><init>(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;Landroid/os/Bundle;)V

    invoke-virtual {v7, v8}, Lde/greenrobot/event/EventBus;->post(Ljava/lang/Object;)V

    .line 1364
    const/4 v4, 0x1

    .line 1368
    .end local v5    # "tool":Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;
    .end local v6    # "toolExtras":Landroid/os/Bundle;
    :cond_fe
    if-nez v4, :cond_103

    .line 1369
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->initializeMessages()V

    .line 1375
    .end local v0    # "animation":Landroid/view/animation/Animation;
    .end local v1    # "bitmap":Landroid/graphics/Bitmap;
    .end local v2    # "imageInfo":Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;
    .end local v3    # "intent":Landroid/content/Intent;
    .end local v4    # "quickLaunchRequested":Z
    :cond_103
    :goto_103
    return-void

    .line 1373
    :cond_104
    sget-object v7, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v8, "different id"

    invoke-interface {v7, v8}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_103
.end method

.method public onEventMainThread(Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadErrorEvent;)V
    .registers 7
    .param p1, "event"    # Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadErrorEvent;

    .prologue
    const/4 v4, 0x0

    .line 1310
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadErrorEvent;->getId()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mDownloadId:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_27

    .line 1311
    sget-object v0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onDownloadError"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p1, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadErrorEvent;->error:Ljava/lang/String;

    aput-object v3, v2, v4

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1312
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mDownloadTask:Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;

    invoke-virtual {v0, v4}, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;->setEnabled(Z)V

    .line 1313
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mDownloadTask:Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask;

    .line 1314
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->hideProgressLoader()V

    .line 1315
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->createDownloadErrorDialog()V

    .line 1317
    :cond_27
    return-void
.end method

.method public onEventMainThread(Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadStartEvent;)V
    .registers 9
    .param p1, "event"    # Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadStartEvent;

    .prologue
    const/4 v6, 0x0

    .line 1287
    sget-object v2, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "DownloadStartEvent"

    new-array v4, v6, [Ljava/lang/Object;

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1288
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/async_tasks/AdobeImageDownloadAsyncTask$DownloadStartEvent;->getId()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mDownloadId:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_1a

    .line 1289
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mImageRestore:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;->setVisibility(I)V

    .line 1292
    :cond_1a
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    const-class v3, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    .line 1294
    .local v1, "dataService":Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;
    if-eqz v1, :cond_4f

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->hasAccentColor()Z

    move-result v2

    if-eqz v2, :cond_4f

    .line 1295
    invoke-virtual {v1, v6}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->getAccentColor(I)I

    move-result v0

    .line 1296
    .local v0, "accentColor":I
    sget-object v2, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "accentColor: %x"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1297
    if-eqz v0, :cond_4f

    .line 1298
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mInlineProgressLoader:Landroid/view/View;

    sget v3, Lcom/aviary/android/feather/sdk/R$id;->progress:I

    .line 1299
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ProgressBar;

    .line 1298
    invoke-static {v2, v0}, Lcom/adobe/android/ui/utils/UIUtils;->setIndeterminateProgressBarTint(Landroid/widget/ProgressBar;I)Z

    .line 1302
    .end local v0    # "accentColor":I
    :cond_4f
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mInlineProgressLoader:Landroid/view/View;

    invoke-virtual {v2, v6}, Landroid/view/View;->setVisibility(I)V

    .line 1303
    return-void
.end method

.method public onEventMainThread(Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask$ToolsLoadedEvent;)V
    .registers 6
    .param p1, "event"    # Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask$ToolsLoadedEvent;

    .prologue
    const/4 v0, 0x0

    .line 1181
    sget-object v1, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "ToolsLoadedEvent"

    new-array v3, v0, [Ljava/lang/Object;

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1182
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_2a

    .line 1183
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->isStandalone(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_17

    const/4 v0, 0x1

    .line 1184
    .local v0, "whiteLabel2":Z
    :cond_17
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mToolsList:Landroid/support/v7/widget/RecyclerView;

    new-instance v2, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter;

    iget-object v3, p1, Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask$ToolsLoadedEvent;->entries:Ljava/util/List;

    invoke-direct {v2, p0, v3, v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter;-><init>(Landroid/content/Context;Ljava/util/List;Z)V

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 1185
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    iget-object v2, p1, Lcom/adobe/creativesdk/aviary/async_tasks/ToolsLoaderAsyncTask$ToolsLoadedEvent;->labels:Ljava/util/List;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->setToolList(Ljava/util/List;)V

    .line 1187
    .end local v0    # "whiteLabel2":Z
    :cond_2a
    return-void
.end method

.method public onEventMainThread(Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V
    .registers 12
    .param p1, "entry"    # Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    .prologue
    .line 1194
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mToolsList:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v5}, Landroid/support/v7/widget/RecyclerView;->isEnabled()Z

    move-result v5

    if-eqz v5, :cond_51

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mToolsList:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v5}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v5

    if-eqz v5, :cond_51

    .line 1196
    const/4 v3, 0x0

    .line 1198
    .local v3, "point":Landroid/graphics/Point;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_12
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mToolsList:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v5}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v5

    if-ge v2, v5, :cond_44

    .line 1199
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mToolsList:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v5, v2}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1200
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    .line 1202
    .local v4, "tag":Ljava/lang/Object;
    if-ne p1, v4, :cond_41

    .line 1203
    new-instance v3, Landroid/graphics/Point;

    .end local v3    # "point":Landroid/graphics/Point;
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v5

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v6

    div-int/lit8 v6, v6, 0x2

    add-int/2addr v5, v6

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v6

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v7

    div-int/lit8 v7, v7, 0x2

    add-int/2addr v6, v7

    invoke-direct {v3, v5, v6}, Landroid/graphics/Point;-><init>(II)V

    .line 1198
    .restart local v3    # "point":Landroid/graphics/Point;
    :cond_41
    add-int/lit8 v2, v2, 0x1

    goto :goto_12

    .line 1207
    .end local v0    # "child":Landroid/view/View;
    .end local v4    # "tag":Ljava/lang/Object;
    :cond_44
    move-object v1, v3

    .line 1209
    .local v1, "finalPoint":Landroid/graphics/Point;
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mHandler:Landroid/os/Handler;

    new-instance v6, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$4;

    invoke-direct {v6, p0, p1, v1}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$4;-><init>(Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;Landroid/graphics/Point;)V

    const-wide/16 v8, 0x96

    invoke-virtual {v5, v6, v8, v9}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1217
    .end local v1    # "finalPoint":Landroid/graphics/Point;
    .end local v2    # "i":I
    .end local v3    # "point":Landroid/graphics/Point;
    :cond_51
    return-void
.end method

.method public onEventMainThread(Lcom/adobe/creativesdk/aviary/internal/events/ControllerStateChangedEvent;)V
    .registers 4
    .param p1, "event"    # Lcom/adobe/creativesdk/aviary/internal/events/ControllerStateChangedEvent;

    .prologue
    .line 1157
    iget v0, p1, Lcom/adobe/creativesdk/aviary/internal/events/ControllerStateChangedEvent;->newState:I

    iget v1, p1, Lcom/adobe/creativesdk/aviary/internal/events/ControllerStateChangedEvent;->oldState:I

    invoke-virtual {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->onStateChanged(II)V

    .line 1158
    return-void
.end method

.method public onEventMainThread(Lcom/adobe/creativesdk/aviary/internal/events/HistoryUndoRedoEvent;)V
    .registers 5
    .param p1, "event"    # Lcom/adobe/creativesdk/aviary/internal/events/HistoryUndoRedoEvent;

    .prologue
    .line 1274
    sget-object v0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "HistoryUndoRedoEvent"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1275
    iget-boolean v0, p1, Lcom/adobe/creativesdk/aviary/internal/events/HistoryUndoRedoEvent;->isUndo:Z

    if-eqz v0, :cond_14

    .line 1276
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->onUndo()V

    .line 1280
    :goto_13
    return-void

    .line 1278
    :cond_14
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->onRedo()V

    goto :goto_13
.end method

.method public onEventMainThread(Lcom/adobe/creativesdk/aviary/internal/events/MessageReceivedEvent;)V
    .registers 6
    .param p1, "event"    # Lcom/adobe/creativesdk/aviary/internal/events/MessageReceivedEvent;

    .prologue
    .line 1162
    sget-object v2, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "onEventMainThread(MessageReceivedEvent)"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 1164
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getMainController()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    .line 1166
    .local v0, "controller":Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
    sget-boolean v2, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMessageShown:Z

    if-nez v2, :cond_28

    if-eqz v0, :cond_28

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->isClosed()Z

    move-result v2

    if-eqz v2, :cond_28

    .line 1167
    new-instance v1, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;

    invoke-direct {v1}, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;-><init>()V

    .line 1168
    .local v1, "dialog":Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;
    iget-object v2, p1, Lcom/adobe/creativesdk/aviary/internal/events/MessageReceivedEvent;->extra:Landroid/os/Bundle;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;->setArguments(Landroid/os/Bundle;)V

    .line 1169
    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->addDialogFragment(Landroid/support/v4/app/DialogFragment;)V

    .line 1170
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->flagPromoMessageAsShown()V

    .line 1174
    .end local v1    # "dialog":Lcom/adobe/creativesdk/aviary/dialogs/MessagePromoDialogFragment;
    :goto_27
    return-void

    .line 1172
    :cond_28
    sget-object v2, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "message already shown in this session"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_27
.end method

.method public onEventMainThread(Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ToolBarApplyEvent;)V
    .registers 5
    .param p1, "event"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ToolBarApplyEvent;

    .prologue
    .line 1232
    sget-object v0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "ToolBarApplyEvent"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1233
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->onApply()V

    .line 1234
    return-void
.end method

.method public onEventMainThread(Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ToolBarDoneEvent;)V
    .registers 12
    .param p1, "event"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar$ToolBarDoneEvent;

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 1241
    sget-object v4, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "ToolBarDoneEvent"

    new-array v6, v8, [Ljava/lang/Object;

    invoke-interface {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1242
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    if-eqz v4, :cond_68

    .line 1243
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getEnabled()Z

    move-result v4

    if-eqz v4, :cond_68

    .line 1245
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    const-class v5, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    invoke-virtual {v4, v5}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    .line 1247
    .local v2, "dataService":Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBitmapIsChanged()Z

    move-result v1

    .line 1248
    .local v1, "changed":Z
    sget-boolean v4, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->$assertionsDisabled:Z

    if-nez v4, :cond_33

    if-nez v2, :cond_33

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 1249
    :cond_33
    const-string v4, "save-on-no-changes"

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->getIntentExtra(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    .line 1252
    .local v3, "saveWithNoChanges":Z
    sget-object v4, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "bitmap changed: %b"

    new-array v6, v9, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-interface {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1253
    sget-object v4, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "save with no changes: %b"

    new-array v6, v9, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-interface {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1256
    if-nez v1, :cond_69

    if-nez v3, :cond_69

    .line 1257
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->exitWithNoModifications()V

    .line 1267
    .end local v1    # "changed":Z
    .end local v2    # "dataService":Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;
    .end local v3    # "saveWithNoChanges":Z
    :cond_68
    :goto_68
    return-void

    .line 1261
    .restart local v1    # "changed":Z
    .restart local v2    # "dataService":Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;
    .restart local v3    # "saveWithNoChanges":Z
    :cond_69
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1262
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_68

    .line 1263
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->performSave(Landroid/graphics/Bitmap;)V

    goto :goto_68
.end method

.method protected onInitializeUtils()V
    .registers 5

    .prologue
    .line 578
    :try_start_0
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilterProxy;->init(Landroid/content/Context;)V
    :try_end_3
    .catch Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageInitializationException; {:try_start_0 .. :try_end_3} :catch_4

    .line 585
    :goto_3
    return-void

    .line 579
    :catch_4
    move-exception v0

    .line 580
    .local v0, "e":Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageInitializationException;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageInitializationException;->printStackTrace()V

    .line 582
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Sorry an error occurred: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageInitializationException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 583
    invoke-static {p0}, Landroid/support/v4/app/ActivityCompat;->finishAfterTransition(Landroid/app/Activity;)V

    goto :goto_3
.end method

.method protected onPause()V
    .registers 2

    .prologue
    .line 1145
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->onPause()V

    .line 1146
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->unregister(Ljava/lang/Object;)V

    .line 1147
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->onPause()V

    .line 1148
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mIsRunning:Z

    .line 1149
    return-void
.end method

.method protected onPostCreate()V
    .registers 1

    .prologue
    .line 568
    return-void
.end method

.method protected onPreCreate()V
    .registers 5

    .prologue
    .line 571
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mDownloadId:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_e

    .line 572
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mDownloadId:J

    .line 574
    :cond_e
    return-void
.end method

.method protected onRestart()V
    .registers 1

    .prologue
    .line 1132
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->onRestart()V

    .line 1133
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 594
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 595
    return-void
.end method

.method protected onResume()V
    .registers 2

    .prologue
    .line 1137
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->onResume()V

    .line 1138
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->register(Ljava/lang/Object;)V

    .line 1139
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->onResume()V

    .line 1140
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mIsRunning:Z

    .line 1141
    return-void
.end method

.method protected onSaveCompleted(Landroid/util/Pair;Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;)V
    .registers 6
    .param p2, "action"    # Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Landroid/net/Uri;",
            ">;",
            "Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1449
    .local p1, "output":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Landroid/net/Uri;>;"
    sget-object v1, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "onSaveCompleted"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 1451
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 1453
    .local v0, "intent":Landroid/content/Intent;
    if-eqz p1, :cond_24

    .line 1454
    iget-object v1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const-string v2, "image/jpeg"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 1455
    const-string v2, "extra-output-uri"

    iget-object v1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v1, Landroid/os/Parcelable;

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1458
    :cond_24
    const/4 v1, -0x1

    invoke-virtual {p0, v1, v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->onSetResult(ILandroid/content/Intent;)V

    .line 1459
    invoke-static {p0}, Landroid/support/v4/app/ActivityCompat;->finishAfterTransition(Landroid/app/Activity;)V

    .line 1460
    return-void
.end method

.method protected onSaveCustomTags(Lit/sephiroth/android/library/exif2/ExifInterface;)V
    .registers 2
    .param p1, "exif"    # Lit/sephiroth/android/library/exif2/ExifInterface;

    .prologue
    .line 1078
    return-void
.end method

.method protected onSaveError(Ljava/lang/String;)V
    .registers 5
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 1420
    const/4 v0, 0x0

    invoke-virtual {p0, v2, v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->onSetResult(ILandroid/content/Intent;)V

    .line 1422
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_generic_error_title:I

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 1423
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 1424
    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$7;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$7;-><init>(Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;)V

    .line 1425
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_close:I

    new-instance v2, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$6;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$6;-><init>(Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;)V

    .line 1433
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 1441
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1442
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 589
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 590
    return-void
.end method

.method protected final onSetResult(ILandroid/content/Intent;)V
    .registers 7
    .param p1, "resultCode"    # I
    .param p2, "data"    # Landroid/content/Intent;

    .prologue
    .line 470
    iput p1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->pResultCode:I

    .line 472
    if-nez p2, :cond_9

    .line 473
    new-instance p2, Landroid/content/Intent;

    .end local p2    # "data":Landroid/content/Intent;
    invoke-direct {p2}, Landroid/content/Intent;-><init>()V

    .line 476
    .restart local p2    # "data":Landroid/content/Intent;
    :cond_9
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 478
    .local v0, "intent":Landroid/content/Intent;
    if-eqz v0, :cond_33

    .line 479
    const-string v2, "extra-in-extras"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    .line 480
    .local v1, "optionalBundle":Landroid/os/Bundle;
    if-eqz v1, :cond_1c

    .line 481
    const-string v2, "extra-in-extras"

    invoke-virtual {p2, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 484
    :cond_1c
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    if-eqz v2, :cond_33

    const-string v2, "bitmap-changed"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_33

    .line 485
    const-string v2, "bitmap-changed"

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBitmapIsChanged()Z

    move-result v3

    invoke-virtual {p2, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 489
    .end local v1    # "optionalBundle":Landroid/os/Bundle;
    :cond_33
    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->setResult(ILandroid/content/Intent;)V

    .line 490
    return-void
.end method

.method public onSetupDone(Landroid/util/Pair;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "result":Landroid/util/Pair;, "Landroid/util/Pair<Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;>;"
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 1512
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->isFinishing()Z

    move-result v2

    if-nez v2, :cond_12

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->isActive()Z

    move-result v2

    if-eqz v2, :cond_12

    iget-boolean v2, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mSetupDone:Z

    if-eqz v2, :cond_13

    .line 1539
    :cond_12
    :goto_12
    return-void

    .line 1516
    :cond_13
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getMainController()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    .line 1518
    .local v0, "controller":Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
    if-eqz v0, :cond_12

    .line 1522
    if-eqz p1, :cond_2b

    iget-object v2, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    if-eqz v2, :cond_2b

    iget-object v2, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v2, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;->isSuccess()Z

    move-result v2

    if-eqz v2, :cond_2b

    .line 1523
    iput-boolean v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mSetupDone:Z

    .line 1526
    :cond_2b
    sget-object v2, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "onSetupDone: %s"

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p1, v4, v5

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1528
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->canShowNextMessage(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)Z

    move-result v2

    if-eqz v2, :cond_52

    .line 1530
    const-class v2, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;

    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;

    .line 1531
    .local v1, "messageService":Lcom/adobe/creativesdk/aviary/internal/services/MessageService;
    if-eqz v1, :cond_4a

    .line 1532
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->processMessages()V

    goto :goto_12

    .line 1534
    :cond_4a
    sget-object v2, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "messageService is null"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_12

    .line 1537
    .end local v1    # "messageService":Lcom/adobe/creativesdk/aviary/internal/services/MessageService;
    :cond_52
    sget-object v2, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "can\'t show next message"

    new-array v4, v5, [Ljava/lang/Object;

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_12
.end method

.method public onStart()V
    .registers 2

    .prologue
    .line 1121
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->onStart()V

    .line 1122
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    iput v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mOrientation:I

    .line 1123
    return-void
.end method

.method protected onStateChanged(II)V
    .registers 8
    .param p1, "newState"    # I
    .param p2, "oldState"    # I

    .prologue
    const/4 v2, 0x1

    const/4 v4, 0x0

    .line 428
    packed-switch p1, :pswitch_data_52

    .line 457
    sget-object v0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "state not handled: %d"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 460
    :goto_14
    return-void

    .line 430
    :pswitch_15
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mAdobeImageToolBar:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;

    invoke-virtual {v0, v4}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->setClickable(Z)V

    goto :goto_14

    .line 434
    :pswitch_1b
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mAdobeImageToolBar:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;

    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->setClickable(Z)V

    goto :goto_14

    .line 438
    :pswitch_21
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mAdobeImageToolBar:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;

    invoke-virtual {v0, v4}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->setClickable(Z)V

    .line 439
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mImageRestore:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;

    invoke-virtual {v0, v4}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;->setVisibility(I)V

    goto :goto_14

    .line 444
    :pswitch_2c
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mToolsList:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, v2}, Landroid/support/v7/widget/RecyclerView;->setEnabled(Z)V

    .line 445
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mAdobeImageToolBar:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;

    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->setClickable(Z)V

    .line 446
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mAdobeImageToolBar:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->close()V

    .line 447
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mAdobeImageToolBar:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;

    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->setSaveEnabled(Z)V

    goto :goto_14

    .line 451
    :pswitch_41
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mToolsList:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, v4}, Landroid/support/v7/widget/RecyclerView;->setEnabled(Z)V

    .line 452
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mAdobeImageToolBar:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;

    invoke-virtual {v0, v4}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->setClickable(Z)V

    .line 453
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mAdobeImageToolBar:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;

    invoke-virtual {v0, v4}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->setSaveEnabled(Z)V

    goto :goto_14

    .line 428
    nop

    :pswitch_data_52
    .packed-switch 0x0
        :pswitch_41
        :pswitch_15
        :pswitch_1b
        :pswitch_21
        :pswitch_2c
        :pswitch_2c
    .end packed-switch
.end method

.method public onStop()V
    .registers 1

    .prologue
    .line 1127
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->onStop()V

    .line 1128
    return-void
.end method

.method protected performSave(Landroid/graphics/Bitmap;)V
    .registers 14
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v11, 0x1

    const/4 v4, 0x0

    .line 946
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mSaving:Z

    if-eqz v0, :cond_7

    .line 990
    :goto_6
    return-void

    .line 949
    :cond_7
    iput-boolean v11, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mSaving:Z

    .line 952
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getTracker()Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v0

    const-string v1, "editor: saved"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "tool_count"

    aput-object v3, v2, v4

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getToolCompleteCount()I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v11

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;[Ljava/lang/String;)V

    .line 955
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    invoke-virtual {v0, v4}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->setEnabled(Z)V

    .line 957
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    const-class v1, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    .line 959
    .local v10, "service":Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;
    sget-boolean v0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->$assertionsDisabled:Z

    if-nez v0, :cond_40

    if-nez v10, :cond_40

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 960
    :cond_40
    const-string v0, "return-data"

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v10, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->getIntentExtra(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    .line 962
    .local v9, "requestedBitmap":Z
    if-eqz v9, :cond_7b

    .line 964
    new-instance v7, Landroid/os/Bundle;

    invoke-direct {v7}, Landroid/os/Bundle;-><init>()V

    .line 965
    .local v7, "extras":Landroid/os/Bundle;
    const-string v0, "data"

    invoke-virtual {v7, v0, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 966
    const/4 v0, -0x1

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 967
    invoke-virtual {v10}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->getDestImageUri()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object v1

    const-string v2, "inline-data"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1, v7}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object v1

    .line 966
    invoke-virtual {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->onSetResult(ILandroid/content/Intent;)V

    .line 968
    invoke-static {p0}, Landroid/support/v4/app/ActivityCompat;->finishAfterTransition(Landroid/app/Activity;)V

    goto :goto_6

    .line 970
    .end local v7    # "extras":Landroid/os/Bundle;
    :cond_7b
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    const-class v1, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    .line 971
    .local v8, "hiresService":Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;
    sget-boolean v0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->$assertionsDisabled:Z

    if-nez v0, :cond_91

    if-nez v8, :cond_91

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 972
    :cond_91
    invoke-virtual {v8}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->getHiresEnabled()Z

    move-result v5

    .line 976
    .local v5, "hiresEnabled":Z
    sget-object v6, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;->ASK:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;

    .line 978
    .local v6, "action":Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;
    const-string v0, "aviary.intent.action.EDIT"

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a9

    .line 979
    sget-object v6, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;->CLOSE:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;

    .line 984
    :cond_a9
    invoke-virtual {v10}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->getDestImageUri()Landroid/net/Uri;

    move-result-object v2

    .line 985
    invoke-virtual {v10}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->getOutputFormat()Landroid/graphics/Bitmap$CompressFormat;

    move-result-object v3

    .line 986
    invoke-virtual {v10}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->getOutputQuality()I

    move-result v4

    move-object v0, p0

    move-object v1, p1

    .line 982
    invoke-virtual/range {v0 .. v6}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->performSave(Landroid/graphics/Bitmap;Landroid/net/Uri;Landroid/graphics/Bitmap$CompressFormat;IZLcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;)V

    goto/16 :goto_6
.end method

.method protected performSave(Landroid/graphics/Bitmap;Landroid/net/Uri;Landroid/graphics/Bitmap$CompressFormat;IZLcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;)V
    .registers 17
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "saveUri"    # Landroid/net/Uri;
    .param p3, "outputFormat"    # Landroid/graphics/Bitmap$CompressFormat;
    .param p4, "quality"    # I
    .param p5, "hires"    # Z
    .param p6, "action"    # Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;

    .prologue
    .line 994
    sget-object v1, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "performSave, uri:%s, quality: %d, action:%s"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p2, v4, v5

    const/4 v5, 0x1

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x2

    aput-object p6, v4, v5

    invoke-interface {v1, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 998
    if-eqz p2, :cond_54

    .line 999
    new-instance v2, Ljava/io/File;

    invoke-virtual {p2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1005
    .local v2, "destFile":Ljava/io/File;
    :goto_22
    :try_start_22
    sget-object v1, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "trying to create the new file..."

    invoke-interface {v1, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 1006
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_3c

    .line 1007
    invoke-virtual {v2}, Ljava/io/File;->createNewFile()Z

    move-result v1

    if-nez v1, :cond_3c

    .line 1008
    sget-object v1, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "Failed to create the file"

    invoke-interface {v1, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V
    :try_end_3c
    .catch Ljava/io/IOException; {:try_start_22 .. :try_end_3c} :catch_59

    .line 1022
    :cond_3c
    :goto_3c
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getMainController()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    const-class v3, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    invoke-virtual {v1, v3}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    .line 1023
    .local v9, "service":Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;
    sget-boolean v1, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->$assertionsDisabled:Z

    if-nez v1, :cond_72

    if-nez v9, :cond_72

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 1001
    .end local v2    # "destFile":Ljava/io/File;
    .end local v9    # "service":Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;
    :cond_54
    invoke-virtual {p0, p3}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getDefaultOutputDestination(Landroid/graphics/Bitmap$CompressFormat;)Ljava/io/File;

    move-result-object v2

    .restart local v2    # "destFile":Ljava/io/File;
    goto :goto_22

    .line 1011
    :catch_59
    move-exception v7

    .line 1012
    .local v7, "e":Ljava/io/IOException;
    invoke-virtual {v7}, Ljava/io/IOException;->printStackTrace()V

    .line 1014
    :try_start_5d
    sget-object v1, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "using a temporary file!"

    invoke-interface {v1, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 1015
    const-string v1, "aviary-image-"

    const-string v3, ".jpeg"

    invoke-static {v1, v3}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    :try_end_6b
    .catch Ljava/io/IOException; {:try_start_5d .. :try_end_6b} :catch_6d

    move-result-object v2

    goto :goto_3c

    .line 1016
    :catch_6d
    move-exception v8

    .line 1017
    .local v8, "e1":Ljava/io/IOException;
    invoke-virtual {v8}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3c

    .line 1024
    .end local v7    # "e":Ljava/io/IOException;
    .end local v8    # "e1":Ljava/io/IOException;
    .restart local v9    # "service":Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;
    :cond_72
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v9, v1}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->setDestImageUri(Landroid/net/Uri;)V

    .line 1026
    new-instance v0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;

    move-object v1, p0

    move-object/from16 v3, p6

    move-object v4, p3

    move v5, p4

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;-><init>(Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;Ljava/io/File;Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;Landroid/graphics/Bitmap$CompressFormat;IZ)V

    .line 1027
    .local v0, "mSaveTask":Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;
    const/4 v1, 0x1

    new-array v1, v1, [Landroid/graphics/Bitmap;

    const/4 v3, 0x0

    aput-object p1, v1, v3

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 1028
    return-void
.end method

.method protected saveExif(Ljava/lang/String;)V
    .registers 10
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 1047
    sget-object v5, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "saveExif: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 1049
    if-nez p1, :cond_1b

    .line 1076
    :goto_1a
    return-void

    .line 1053
    :cond_1b
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    const-class v6, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    .line 1054
    .local v0, "data":Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;
    new-instance v3, Lit/sephiroth/android/library/exif2/ExifInterface;

    invoke-direct {v3}, Lit/sephiroth/android/library/exif2/ExifInterface;-><init>()V

    .line 1056
    .local v3, "newexif":Lit/sephiroth/android/library/exif2/ExifInterface;
    if-eqz v0, :cond_39

    .line 1057
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->getImageInfo()Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;

    move-result-object v2

    .line 1058
    .local v2, "info":Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;
    if-eqz v2, :cond_39

    .line 1059
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->getExifTagList()Ljava/util/List;

    move-result-object v4

    .line 1060
    .local v4, "tags":Ljava/util/List;, "Ljava/util/List<Lit/sephiroth/android/library/exif2/ExifTag;>;"
    invoke-virtual {v3, v4}, Lit/sephiroth/android/library/exif2/ExifInterface;->setTags(Ljava/util/Collection;)V

    .line 1064
    .end local v2    # "info":Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;
    .end local v4    # "tags":Ljava/util/List;, "Ljava/util/List<Lit/sephiroth/android/library/exif2/ExifTag;>;"
    :cond_39
    sget v5, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_IMAGE_WIDTH:I

    invoke-virtual {v3, v5}, Lit/sephiroth/android/library/exif2/ExifInterface;->deleteTag(I)V

    .line 1065
    sget v5, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_IMAGE_LENGTH:I

    invoke-virtual {v3, v5}, Lit/sephiroth/android/library/exif2/ExifInterface;->deleteTag(I)V

    .line 1066
    sget v5, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_ORIENTATION:I

    const/4 v6, 0x0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Lit/sephiroth/android/library/exif2/ExifInterface;->buildTag(ILjava/lang/Object;)Lit/sephiroth/android/library/exif2/ExifTag;

    move-result-object v5

    invoke-virtual {v3, v5}, Lit/sephiroth/android/library/exif2/ExifInterface;->setTag(Lit/sephiroth/android/library/exif2/ExifTag;)Lit/sephiroth/android/library/exif2/ExifTag;

    .line 1067
    sget v5, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_SOFTWARE:I

    const-string v6, "Aviary for Android 4.1.1"

    invoke-virtual {v3, v5, v6}, Lit/sephiroth/android/library/exif2/ExifInterface;->buildTag(ILjava/lang/Object;)Lit/sephiroth/android/library/exif2/ExifTag;

    move-result-object v5

    invoke-virtual {v3, v5}, Lit/sephiroth/android/library/exif2/ExifInterface;->setTag(Lit/sephiroth/android/library/exif2/ExifTag;)Lit/sephiroth/android/library/exif2/ExifTag;

    .line 1069
    invoke-virtual {p0, v3}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->onSaveCustomTags(Lit/sephiroth/android/library/exif2/ExifInterface;)V

    .line 1072
    :try_start_5f
    invoke-virtual {v3, p1}, Lit/sephiroth/android/library/exif2/ExifInterface;->writeExif(Ljava/lang/String;)V
    :try_end_62
    .catch Ljava/lang/Throwable; {:try_start_5f .. :try_end_62} :catch_63

    goto :goto_1a

    .line 1073
    :catch_63
    move-exception v1

    .line 1074
    .local v1, "e":Ljava/lang/Throwable;
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_1a
.end method

.method public showProgress(Z)V
    .registers 4
    .param p1, "modal"    # Z

    .prologue
    .line 1084
    if-nez p1, :cond_9

    .line 1085
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mAdobeImageToolBar:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->setApplyProgressVisible(Z)V

    .line 1092
    :goto_8
    return-void

    .line 1087
    :cond_9
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mToastLoader:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    if-nez v0, :cond_13

    .line 1088
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/utils/AdobeImageUIUtils;->createModalLoaderToast(Landroid/content/Context;)Lcom/adobe/android/ui/widget/AdobeCustomToast;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mToastLoader:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    .line 1090
    :cond_13
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mToastLoader:Lcom/adobe/android/ui/widget/AdobeCustomToast;

    invoke-virtual {v0}, Lcom/adobe/android/ui/widget/AdobeCustomToast;->show()V

    goto :goto_8
.end method

.method public tryConnectToContentService()Lrx/Observable;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<",
            "Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1504
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mAccountConnection:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->tryConnect()Lrx/Observable;

    move-result-object v0

    return-object v0
.end method
