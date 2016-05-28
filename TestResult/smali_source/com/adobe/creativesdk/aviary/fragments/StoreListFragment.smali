.class public Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;
.super Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;
.source "StoreListFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$NotifyDataSetChangedAsyncTask;,
        Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$RequestPackDownloadAsyncTask;,
        Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$RunInventoryAsyncTask;,
        Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;,
        Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;
    }
.end annotation


# instance fields
.field protected adapter:Landroid/support/v4/widget/CursorAdapter;

.field protected autoSelectedPackId:J

.field maxRetry:I

.field private packOptionMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Long;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;",
            ">;"
        }
    .end annotation
.end field

.field protected picasso:Lit/sephiroth/android/library/picasso/Picasso;

.field progressBar:Landroid/widget/ProgressBar;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 83
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;-><init>()V

    .line 68
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->autoSelectedPackId:J

    .line 69
    const/4 v0, 0x2

    iput v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->maxRetry:I

    .line 70
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->packOptionMap:Ljava/util/HashMap;

    .line 84
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    .prologue
    .line 65
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->onRestoreAllInternal()V

    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;)Ljava/util/HashMap;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    .prologue
    .line 65
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->packOptionMap:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$400(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;)V
    .registers 8
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;
    .param p1, "x1"    # J
    .param p3, "x2"    # Ljava/lang/String;
    .param p4, "x3"    # Ljava/lang/String;
    .param p5, "x4"    # Ljava/lang/String;
    .param p6, "x5"    # Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    .prologue
    .line 65
    invoke-direct/range {p0 .. p6}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->restorePackItem(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;)V

    return-void
.end method

.method public static newInstance(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;
    .registers 4
    .param p0, "packType"    # Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .prologue
    .line 75
    new-instance v1, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    invoke-direct {v1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;-><init>()V

    .line 76
    .local v1, "fragment":Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 77
    .local v0, "arguments":Landroid/os/Bundle;
    const-string v2, "extra-pack-type"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 78
    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->setArguments(Landroid/os/Bundle;)V

    .line 79
    return-object v1
.end method

.method private onAskToLogin()V
    .registers 5

    .prologue
    .line 332
    sget-object v1, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "onAskToLogin"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 334
    new-instance v0, Landroid/app/AlertDialog$Builder;

    .line 335
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 337
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    sget-boolean v1, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_21:Z

    if-nez v1, :cond_19

    .line 338
    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_have_an_adobe_id:I

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 341
    :cond_19
    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_ask_to_login_before_restore:I

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$string;->feather_no_thanks:I

    new-instance v3, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$7;

    invoke-direct {v3, p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$7;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;)V

    .line 342
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$string;->feather_signin:I

    new-instance v3, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$6;

    invoke-direct {v3, p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$6;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;)V

    .line 349
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 360
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 362
    return-void
.end method

.method private onRestoreAll()V
    .registers 3

    .prologue
    .line 365
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onRestoreAll"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 367
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->isContentServiceConnected()Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 369
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getContentService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->isAuthenticated()Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 370
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->onRestoreAllInternal()V

    .line 378
    :goto_1a
    return-void

    .line 372
    :cond_1b
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->onAskToLogin()V

    goto :goto_1a

    .line 375
    :cond_1f
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "account not available.. just proceed"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 376
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->onRestoreAllInternal()V

    goto :goto_1a
.end method

.method private onRestoreAllInternal()V
    .registers 6

    .prologue
    const/4 v4, 0x0

    .line 381
    sget-object v1, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "onRestoreAllInternal"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 383
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$string;->feather_restore_all_request_sent:I

    .line 382
    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    .line 385
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 387
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent;->createCdsRestoreAllIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 388
    .local v0, "intent":Landroid/content/Intent;
    sget-object v1, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "intent: %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v0, v3, v4

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 389
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/support/v4/app/FragmentActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 390
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->getInstance(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v1

    const-string v2, "shop_list: restore_all_initiated"

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;)V

    .line 391
    return-void
.end method

.method private purchasePackItem(JLjava/lang/String;Ljava/lang/String;)V
    .registers 16
    .param p1, "packId"    # J
    .param p3, "identifier"    # Ljava/lang/String;
    .param p4, "price"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 230
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "purchasePackItem: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p3, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 232
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->isContentServiceConnected()Z

    move-result v0

    if-nez v0, :cond_28

    .line 233
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "Content Manager Service Unavailable"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 235
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$string;->common_google_play_services_network_error_title:I

    invoke-static {v0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 267
    :goto_27
    return-void

    .line 240
    :cond_28
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getContentService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v1

    .line 242
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v3

    .line 243
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getPackType()Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->toCdsString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getTrackerName()Ljava/lang/String;

    move-result-object v8

    move-wide v4, p1

    move-object v6, p3

    move-object v9, p4

    .line 241
    invoke-virtual/range {v1 .. v9}, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->purchase(Landroid/app/Activity;IJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/Observable;

    move-result-object v0

    .line 239
    invoke-static {p0, v0}, Lrx/android/app/AppObservable;->bindSupportFragment(Landroid/support/v4/app/Fragment;Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$1;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$1;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;)V

    new-instance v2, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$2;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$2;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;)V

    .line 244
    invoke-virtual {v0, v1, v2}, Lrx/Observable;->subscribe(Lrx/functions/Action1;Lrx/functions/Action1;)Lrx/Subscription;

    goto :goto_27
.end method

.method private restorePackItem(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;)V
    .registers 16
    .param p1, "packId"    # J
    .param p3, "identifier"    # Ljava/lang/String;
    .param p4, "packType"    # Ljava/lang/String;
    .param p5, "trackerName"    # Ljava/lang/String;
    .param p6, "buttonContainer"    # Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    .prologue
    .line 280
    if-eqz p6, :cond_14

    .line 281
    invoke-virtual {p6}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->getPackOption()Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    move-result-object v7

    .line 286
    .local v7, "original":Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;
    :goto_6
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->isContentServiceConnected()Z

    move-result v0

    if-nez v0, :cond_16

    .line 287
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "service not connected"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 329
    :goto_13
    return-void

    .line 283
    .end local v7    # "original":Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;
    :cond_14
    const/4 v7, 0x0

    .restart local v7    # "original":Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;
    goto :goto_6

    .line 293
    :cond_16
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getContentService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v1

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    .line 294
    invoke-virtual/range {v1 .. v6}, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->restore(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/Observable;

    move-result-object v0

    .line 295
    invoke-static {}, Lrx/android/schedulers/AndroidSchedulers;->mainThread()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->observeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$5;

    invoke-direct {v1, p0, p6, p1, p2}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$5;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;J)V

    .line 296
    invoke-virtual {v0, v1}, Lrx/Observable;->doOnRequest(Lrx/functions/Action1;)Lrx/Observable;

    move-result-object v0

    .line 292
    invoke-static {p0, v0}, Lrx/android/app/AppObservable;->bindSupportFragment(Landroid/support/v4/app/Fragment;Lrx/Observable;)Lrx/Observable;

    move-result-object v6

    new-instance v8, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$3;

    invoke-direct {v8, p0, p6, p1, p2}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$3;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;J)V

    new-instance v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$4;

    move-object v1, p0

    move-object v2, p6

    move-object v3, v7

    move-wide v4, p1

    invoke-direct/range {v0 .. v5}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$4;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;J)V

    .line 306
    invoke-virtual {v6, v8, v0}, Lrx/Observable;->subscribe(Lrx/functions/Action1;Lrx/functions/Action1;)Lrx/Subscription;

    goto :goto_13
.end method

.method private restorePackItem(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;)V
    .registers 10
    .param p1, "holder"    # Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;

    .prologue
    .line 270
    iget-wide v2, p1, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->packid:J

    iget-object v4, p1, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->identifier:Ljava/lang/String;

    iget-object v0, p1, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .line 271
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->toCdsString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getTrackerName()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p1, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->buttonContainer:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    move-object v1, p0

    .line 270
    invoke-direct/range {v1 .. v7}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->restorePackItem(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;)V

    .line 272
    return-void
.end method

.method private runDownloaderAsyncTask(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 16
    .param p1, "packId"    # J
    .param p3, "packIdentifier"    # Ljava/lang/String;
    .param p4, "packType"    # Ljava/lang/String;
    .param p5, "trackerName"    # Ljava/lang/String;
    .param p6, "userId"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x0

    .line 524
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "runDownloaderAsyncTask(%d, %s)"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v2, v8

    const/4 v3, 0x1

    aput-object p3, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 526
    const-wide/16 v0, -0x1

    cmp-long v0, p1, v0

    if-lez v0, :cond_36

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_36

    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_36

    .line 527
    new-instance v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$RequestPackDownloadAsyncTask;

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    move-object v7, p6

    invoke-direct/range {v0 .. v7}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$RequestPackDownloadAsyncTask;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-array v1, v8, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$RequestPackDownloadAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 529
    :cond_36
    return-void
.end method


# virtual methods
.method protected createAdapter()Landroid/support/v4/widget/CursorAdapter;
    .registers 4

    .prologue
    .line 135
    new-instance v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;Landroid/content/Context;Landroid/database/Cursor;)V

    return-object v0
.end method

.method protected createCursorForAvailablePacks(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)Landroid/database/Cursor;
    .registers 10
    .param p1, "packType"    # Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/database/sqlite/SQLiteException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v5, 0x0

    const/4 v3, 0x0

    .line 405
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "createCursorForAvailablePacks(%s)"

    new-array v2, v7, [Ljava/lang/Object;

    aput-object p1, v2, v5

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 407
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-nez v0, :cond_15

    .line 414
    :goto_14
    return-object v3

    .line 411
    :cond_15
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "pack/type/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->toCdsString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/content/available/list"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 413
    .local v6, "query1":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 415
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1, v6}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/16 v2, 0xf

    new-array v2, v2, [Ljava/lang/String;

    const-string v4, "pack_id as _id"

    aput-object v4, v2, v5

    const-string v4, "pack_id"

    aput-object v4, v2, v7

    const/4 v4, 0x2

    const-string v5, "pack_type"

    aput-object v5, v2, v4

    const/4 v4, 0x3

    const-string v5, "pack_identifier"

    aput-object v5, v2, v4

    const/4 v4, 0x4

    const-string v5, "content_id"

    aput-object v5, v2, v4

    const/4 v4, 0x5

    const-string v5, "content_contentPath"

    aput-object v5, v2, v4

    const/4 v4, 0x6

    const-string v5, "content_contentURL"

    aput-object v5, v2, v4

    const/4 v4, 0x7

    const-string v5, "content_displayName"

    aput-object v5, v2, v4

    const/16 v4, 0x8

    const-string v5, "content_iconPath"

    aput-object v5, v2, v4

    const/16 v4, 0x9

    const-string v5, "content_iconUrl"

    aput-object v5, v2, v4

    const/16 v4, 0xa

    const-string v5, "content_isFree"

    aput-object v5, v2, v4

    const/16 v4, 0xb

    const-string v5, "content_purchased"

    aput-object v5, v2, v4

    const/16 v4, 0xc

    const-string v5, "content_packId"

    aput-object v5, v2, v4

    const/16 v4, 0xd

    const-string v5, "content_numItems"

    aput-object v5, v2, v4

    const/16 v4, 0xe

    const-string v5, "content_isFreeWithLogin"

    aput-object v5, v2, v4

    const-string v5, "content_purchased ASC, pack_displayOrder ASC"

    move-object v4, v3

    .line 414
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3

    goto/16 :goto_14
.end method

.method public getContentService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;
    .registers 2

    .prologue
    .line 88
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeImageAccountDelegate;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeImageAccountDelegate;->getContentService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v0

    return-object v0
.end method

.method protected getTrackerName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 102
    const-string v0, "shop_list"

    return-object v0
.end method

.method public isContentServiceConnected()Z
    .registers 2

    .prologue
    .line 93
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeImageAccountDelegate;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeImageAccountDelegate;->isContentServiceConnected()Z

    move-result v0

    return v0
.end method

.method public isFragmentVisible()Z
    .registers 2

    .prologue
    .line 98
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getParentFragment()Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->isFragmentVisible(Landroid/support/v4/app/Fragment;)Z

    move-result v0

    return v0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 107
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->onAttach(Landroid/app/Activity;)V

    .line 108
    const/4 v0, 0x3

    iput v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->maxRetry:I

    .line 109
    invoke-static {p1}, Lit/sephiroth/android/library/picasso/Picasso;->with(Landroid/content/Context;)Lit/sephiroth/android/library/picasso/Picasso;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    .line 110
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 13
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 150
    sget-object v6, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v7, "onClick: %s"

    new-array v8, v9, [Ljava/lang/Object;

    aput-object p1, v8, v10

    invoke-interface {v6, v7, v8}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 152
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v6

    sget v7, Lcom/aviary/android/feather/sdk/R$id;->restore_all:I

    if-ne v6, v7, :cond_19

    .line 153
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->onRestoreAll()V

    .line 227
    :cond_18
    :goto_18
    return-void

    .line 157
    :cond_19
    instance-of v6, p1, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    if-eqz v6, :cond_18

    move-object v0, p1

    .line 158
    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    .line 159
    .local v0, "button":Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->getPackOption()Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    move-result-object v3

    .line 161
    .local v3, "packOption":Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;
    sget-object v6, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v7, "packOption: %s"

    new-array v8, v9, [Ljava/lang/Object;

    aput-object v3, v8, v10

    invoke-interface {v6, v7, v8}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 163
    if-eqz v3, :cond_18

    .line 167
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup;

    .line 168
    .local v4, "parent":Landroid/view/ViewGroup;
    sget-object v6, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v7, "parent: %s"

    new-array v8, v9, [Ljava/lang/Object;

    aput-object v4, v8, v10

    invoke-interface {v6, v7, v8}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 170
    if-eqz v4, :cond_18

    .line 174
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getTag()Ljava/lang/Object;

    move-result-object v5

    .line 175
    .local v5, "tag":Ljava/lang/Object;
    sget-object v6, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v7, "tag: %s"

    new-array v8, v9, [Ljava/lang/Object;

    aput-object v5, v8, v10

    invoke-interface {v6, v7, v8}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 177
    instance-of v6, v5, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;

    if-eqz v6, :cond_18

    move-object v1, v5

    .line 181
    check-cast v1, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;

    .line 183
    .local v1, "holder":Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;
    iget-wide v6, v1, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->packid:J

    const-wide/16 v8, 0x0

    cmp-long v6, v6, v8

    if-ltz v6, :cond_18

    iget-object v6, v1, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->identifier:Ljava/lang/String;

    if-eqz v6, :cond_18

    .line 187
    sget-object v6, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$8;->$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$CdsUtils$PackOption:[I

    iget-object v7, v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->option:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_d6

    goto :goto_18

    .line 190
    :pswitch_74
    iget-wide v6, v1, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->packid:J

    iget-object v8, v1, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->identifier:Ljava/lang/String;

    iget-object v9, v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->price:Ljava/lang/String;

    invoke-direct {p0, v6, v7, v8, v9}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->purchasePackItem(JLjava/lang/String;Ljava/lang/String;)V

    goto :goto_18

    .line 194
    :pswitch_7e
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->isContentServiceConnected()Z

    move-result v6

    if-eqz v6, :cond_92

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getContentService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v6

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->isAuthenticated()Z

    move-result v6

    if-eqz v6, :cond_92

    .line 195
    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->restorePackItem(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;)V

    goto :goto_18

    .line 197
    :cond_92
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 198
    .local v2, "options":Landroid/os/Bundle;
    const-string v6, "packId"

    iget-wide v8, v1, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->packid:J

    invoke-virtual {v2, v6, v8, v9}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 199
    const-string v6, "identifier"

    iget-object v7, v1, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->identifier:Ljava/lang/String;

    invoke-virtual {v2, v6, v7}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 200
    const-string v6, "packType"

    iget-object v7, v1, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->toCdsString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 201
    const-string v6, "uuid"

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getUUID()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 202
    const-string v6, "from"

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getTrackerName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    invoke-static {v6, v10, v2}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->showInActivity(Landroid/support/v4/app/FragmentActivity;ZLandroid/os/Bundle;)V

    goto/16 :goto_18

    .line 210
    .end local v2    # "options":Landroid/os/Bundle;
    :pswitch_cb
    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->restorePackItem(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;)V

    goto/16 :goto_18

    .line 215
    :pswitch_d0
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->startSetup()V

    goto/16 :goto_18

    .line 187
    nop

    :pswitch_data_d6
    .packed-switch 0x1
        :pswitch_74
        :pswitch_7e
        :pswitch_cb
        :pswitch_cb
        :pswitch_cb
        :pswitch_d0
    .end packed-switch
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 6
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 115
    sget v0, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_store_listview:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onDestroyView()V
    .registers 3

    .prologue
    .line 140
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->onDestroyView()V

    .line 142
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->adapter:Landroid/support/v4/widget/CursorAdapter;

    if-eqz v0, :cond_d

    .line 143
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->adapter:Landroid/support/v4/widget/CursorAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/CursorAdapter;->changeCursor(Landroid/database/Cursor;)V

    .line 145
    :cond_d
    return-void
.end method

.method public onDownloadStatusChanged(JLjava/lang/String;I)V
    .registers 8
    .param p1, "packid"    # J
    .param p3, "packType"    # Ljava/lang/String;
    .param p4, "status"    # I

    .prologue
    .line 453
    invoke-super {p0, p1, p2, p3, p4}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->onDownloadStatusChanged(JLjava/lang/String;I)V

    .line 455
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->adapter:Landroid/support/v4/widget/CursorAdapter;

    if-eqz v0, :cond_39

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_39

    .line 456
    if-eqz p3, :cond_39

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getPackType()Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->toCdsString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_39

    .line 457
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->packOptionMap:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {p4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->fromDownloadManagerStatus(I)Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    move-result-object v2

    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->from(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 458
    new-instance v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$NotifyDataSetChangedAsyncTask;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$NotifyDataSetChangedAsyncTask;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$NotifyDataSetChangedAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 461
    :cond_39
    return-void
.end method

.method public onPackInstalled(JLjava/lang/String;I)V
    .registers 12
    .param p1, "packId"    # J
    .param p3, "packType"    # Ljava/lang/String;
    .param p4, "purchased"    # I

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 465
    invoke-super {p0, p1, p2, p3, p4}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->onPackInstalled(JLjava/lang/String;I)V

    .line 467
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    .line 469
    .local v0, "context":Landroid/content/Context;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->adapter:Landroid/support/v4/widget/CursorAdapter;

    if-eqz v1, :cond_3a

    if-eqz v0, :cond_3a

    .line 470
    if-eqz p3, :cond_3a

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getPackType()Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->toCdsString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3a

    .line 471
    if-ne p4, v5, :cond_3b

    .line 472
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->packOptionMap:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->OWNED:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->from(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 473
    new-instance v1, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$NotifyDataSetChangedAsyncTask;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$NotifyDataSetChangedAsyncTask;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;)V

    new-array v2, v4, [Ljava/lang/Void;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$NotifyDataSetChangedAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 480
    :cond_3a
    :goto_3a
    return-void

    .line 475
    :cond_3b
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->packOptionMap:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->PACK_OPTION_BEING_DETERMINED:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->from(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 476
    invoke-virtual {p0, v4, v5}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->runInventoryAsyncTask(IZ)V

    goto :goto_3a
.end method

.method public onPurchaseSuccess(JLjava/lang/String;Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;)V
    .registers 8
    .param p1, "packId"    # J
    .param p3, "packType"    # Ljava/lang/String;
    .param p4, "purchase"    # Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;

    .prologue
    .line 484
    invoke-super {p0, p1, p2, p3, p4}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->onPurchaseSuccess(JLjava/lang/String;Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;)V

    .line 486
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->adapter:Landroid/support/v4/widget/CursorAdapter;

    if-eqz v0, :cond_37

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_37

    .line 487
    if-eqz p3, :cond_37

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getPackType()Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->toCdsString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_37

    .line 488
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->packOptionMap:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->RESTORE:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->from(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 489
    new-instance v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$NotifyDataSetChangedAsyncTask;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$NotifyDataSetChangedAsyncTask;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$NotifyDataSetChangedAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 492
    :cond_37
    return-void
.end method

.method public onServiceFinished()V
    .registers 3

    .prologue
    .line 533
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->onServiceFinished()V

    .line 535
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_e

    .line 536
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->runInventoryAsyncTask(IZ)V

    .line 538
    :cond_e
    return-void
.end method

.method public onSetupDone(Landroid/util/Pair;)V
    .registers 6
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
    const/4 v3, 0x0

    .line 440
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->onSetupDone(Landroid/util/Pair;)V

    .line 442
    iget-object v0, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    .line 444
    .local v0, "iabResult":Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;
    if-eqz v0, :cond_25

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;->isFailure()Z

    move-result v1

    if-eqz v1, :cond_25

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->isFragmentVisible()Z

    move-result v1

    if-eqz v1, :cond_25

    .line 445
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 448
    :cond_25
    const/4 v1, 0x1

    invoke-virtual {p0, v3, v1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->runInventoryAsyncTask(IZ)V

    .line 449
    return-void
.end method

.method protected onUserAuthenticated(Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;)V
    .registers 12
    .param p1, "userStatus"    # Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;

    .prologue
    const/4 v9, 0x0

    .line 496
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->onUserAuthenticated(Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;)V

    .line 498
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->getOptions()Landroid/os/Bundle;

    move-result-object v0

    .line 499
    .local v0, "options":Landroid/os/Bundle;
    const-string v1, "uuid"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 502
    .local v8, "uuid":Ljava/lang/String;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->packOptionMap:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    .line 503
    const/4 v1, 0x0

    const/4 v6, 0x1

    invoke-virtual {p0, v1, v6}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->runInventoryAsyncTask(IZ)V

    .line 505
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->getType()Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus$Type;

    move-result-object v1

    sget-object v6, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus$Type;->LOGOUT:Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus$Type;

    if-eq v1, v6, :cond_45

    .line 506
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->isSuccess()Z

    move-result v1

    if-eqz v1, :cond_45

    .line 507
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v1

    if-eqz v1, :cond_45

    .line 508
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getUUID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_45

    .line 510
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->getOptions()Landroid/os/Bundle;

    move-result-object v1

    const-string v6, "restore-all"

    invoke-virtual {v1, v6}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_46

    .line 511
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->onRestoreAllInternal()V

    .line 520
    :cond_45
    :goto_45
    return-void

    .line 513
    :cond_46
    const-string v1, "packId"

    const-wide/16 v6, -0x1

    invoke-virtual {v0, v1, v6, v7}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    .line 514
    .local v2, "packId":J
    const-string v1, "identifier"

    invoke-virtual {v0, v1, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 515
    .local v4, "packIdentifier":Ljava/lang/String;
    const-string v1, "packType"

    invoke-virtual {v0, v1, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 517
    .local v5, "packType":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getTrackerName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->getAdobeID()Ljava/lang/String;

    move-result-object v7

    move-object v1, p0

    .line 516
    invoke-direct/range {v1 .. v7}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->runDownloaderAsyncTask(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_45
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 5
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 120
    invoke-super {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 122
    sget v1, Lcom/aviary/android/feather/sdk/R$id;->progress:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->progressBar:Landroid/widget/ProgressBar;

    .line 123
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->createAdapter()Landroid/support/v4/widget/CursorAdapter;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->adapter:Landroid/support/v4/widget/CursorAdapter;

    .line 124
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->adapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 126
    sget v1, Lcom/aviary/android/feather/sdk/R$id;->restore_all:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 127
    .local v0, "restoreAllButton":Landroid/view/View;
    if-eqz v0, :cond_23

    .line 128
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 131
    :cond_23
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->setListShown(Z)V

    .line 132
    return-void
.end method

.method protected runInventoryAsyncTask(IZ)V
    .registers 7
    .param p1, "error"    # I
    .param p2, "queryPurchased"    # Z

    .prologue
    .line 394
    new-instance v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$RunInventoryAsyncTask;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$RunInventoryAsyncTask;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;)V

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getPackType()Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$RunInventoryAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 395
    return-void
.end method

.method public selectPack(J)V
    .registers 4
    .param p1, "id"    # J

    .prologue
    .line 542
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->selectPack(JZ)V

    .line 543
    return-void
.end method

.method selectPack(JZ)V
    .registers 13
    .param p1, "id"    # J
    .param p3, "setSelection"    # Z

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 546
    sget-object v2, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "selectPack: %d, setSelection: %b"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 547
    invoke-super {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->selectPack(J)V

    .line 549
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->adapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v2}, Landroid/support/v4/widget/CursorAdapter;->getCount()I

    move-result v2

    if-lez v2, :cond_6b

    .line 550
    const-wide/16 v2, -0x1

    cmp-long v2, p1, v2

    if-nez v2, :cond_2f

    .line 551
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->adapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v2, v7}, Landroid/support/v4/widget/CursorAdapter;->getItemId(I)J

    move-result-wide p1

    .line 554
    :cond_2f
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getListView()Landroid/widget/ListView;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/ListView;->getChoiceMode()I

    move-result v1

    .line 556
    .local v1, "mode":I
    if-ne v1, v6, :cond_5c

    .line 557
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3a
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->adapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v2}, Landroid/support/v4/widget/CursorAdapter;->getCount()I

    move-result v2

    if-ge v0, v2, :cond_5c

    .line 558
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->adapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v2, v0}, Landroid/support/v4/widget/CursorAdapter;->getItemId(I)J

    move-result-wide v2

    cmp-long v2, v2, p1

    if-nez v2, :cond_68

    .line 559
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getListView()Landroid/widget/ListView;

    move-result-object v2

    invoke-virtual {v2, v0, v6}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 560
    if-eqz p3, :cond_5c

    .line 561
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getListView()Landroid/widget/ListView;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/widget/ListView;->setSelection(I)V

    .line 567
    .end local v0    # "i":I
    :cond_5c
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getPackType()Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->toCdsString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, p1, p2, v2}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->fireOnItemClick(JLjava/lang/String;)V

    .line 571
    .end local v1    # "mode":I
    :goto_67
    return-void

    .line 557
    .restart local v0    # "i":I
    .restart local v1    # "mode":I
    :cond_68
    add-int/lit8 v0, v0, 0x1

    goto :goto_3a

    .line 569
    .end local v0    # "i":I
    .end local v1    # "mode":I
    :cond_6b
    iput-wide p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->autoSelectedPackId:J

    goto :goto_67
.end method
