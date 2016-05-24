.class public Lcom/behance/sdk/ui/activities/BehanceSDKPublishResultsActivity;
.super Landroid/support/v4/app/FragmentActivity;
.source "BehanceSDKPublishResultsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final logger:Lcom/behance/sdk/logger/ILogger;


# instance fields
.field private workUrl:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 46
    const-class v0, Lcom/behance/sdk/ui/activities/BehanceSDKPublishResultsActivity;

    invoke-static {v0}, Lcom/behance/sdk/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/behance/sdk/logger/ILogger;

    move-result-object v0

    sput-object v0, Lcom/behance/sdk/ui/activities/BehanceSDKPublishResultsActivity;->logger:Lcom/behance/sdk/logger/ILogger;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 41
    invoke-direct {p0}, Landroid/support/v4/app/FragmentActivity;-><init>()V

    return-void
.end method

.method private closeThisView()V
    .registers 1

    .prologue
    .line 110
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishResultsActivity;->finish()V

    .line 111
    return-void
.end method

.method private dispatchViewWorkUrlIntent()V
    .registers 8

    .prologue
    .line 99
    :try_start_0
    iget-object v2, p0, Lcom/behance/sdk/ui/activities/BehanceSDKPublishResultsActivity;->workUrl:Ljava/lang/String;

    if-eqz v2, :cond_14

    .line 100
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    iget-object v3, p0, Lcom/behance/sdk/ui/activities/BehanceSDKPublishResultsActivity;->workUrl:Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 101
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishResultsActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_14
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_14} :catch_18

    .line 106
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_14
    :goto_14
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishResultsActivity;->closeThisView()V

    .line 107
    return-void

    .line 103
    :catch_18
    move-exception v1

    .line 104
    .local v1, "t":Ljava/lang/Throwable;
    sget-object v2, Lcom/behance/sdk/ui/activities/BehanceSDKPublishResultsActivity;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v3, "Problem launching URL. [Url - %s]"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/behance/sdk/ui/activities/BehanceSDKPublishResultsActivity;->workUrl:Ljava/lang/String;

    aput-object v6, v4, v5

    invoke-interface {v2, v1, v3, v4}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_14
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 88
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/behance/sdk/R$id;->bsdkPublishResultsTitlebarBackBtnImageView:I

    if-ne v0, v1, :cond_c

    .line 89
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishResultsActivity;->closeThisView()V

    .line 95
    :cond_b
    :goto_b
    return-void

    .line 90
    :cond_c
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/behance/sdk/R$id;->bsdkPublishResultsBehanceBtn:I

    if-eq v0, v1, :cond_24

    .line 91
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/behance/sdk/R$id;->bsdkPublishResultsUrlTxtView:I

    if-eq v0, v1, :cond_24

    .line 92
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/behance/sdk/R$id;->bsdkPublishResultsWorkImageView:I

    if-ne v0, v1, :cond_b

    .line 93
    :cond_24
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishResultsActivity;->dispatchViewWorkUrlIntent()V

    goto :goto_b
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 14
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v11, 0x0

    .line 52
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 53
    sget v9, Lcom/behance/sdk/R$layout;->bsdk_activity_publish_results:I

    invoke-virtual {p0, v9}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishResultsActivity;->setContentView(I)V

    .line 55
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v9

    invoke-virtual {v9}, Lcom/nostra13/universalimageloader/core/ImageLoader;->isInited()Z

    move-result v9

    if-nez v9, :cond_1e

    .line 56
    invoke-static {p0}, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration;->createDefault(Landroid/content/Context;)Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration;

    move-result-object v6

    .line 57
    .local v6, "loaderConfiguration":Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration;
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v9

    invoke-virtual {v9, v6}, Lcom/nostra13/universalimageloader/core/ImageLoader;->init(Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration;)V

    .line 60
    .end local v6    # "loaderConfiguration":Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration;
    :cond_1e
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishResultsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    .line 61
    .local v5, "intent":Landroid/content/Intent;
    const-string v9, "INTENT_STRING_EXTRA_WORK_URL"

    invoke-virtual {v5, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/behance/sdk/ui/activities/BehanceSDKPublishResultsActivity;->workUrl:Ljava/lang/String;

    .line 62
    const-string v9, "INTENT_STRING_EXTRA_IMAGE_URL"

    invoke-virtual {v5, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 64
    .local v3, "imageUrl":Ljava/lang/String;
    sget v9, Lcom/behance/sdk/R$id;->bsdkPublishResultsTitlebarBackBtnImageView:I

    invoke-virtual {p0, v9}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishResultsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 65
    .local v0, "backBtn":Landroid/view/View;
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 67
    sget v9, Lcom/behance/sdk/R$id;->bsdkPublishResultsUrlTxtView:I

    invoke-virtual {p0, v9}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishResultsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    .line 68
    .local v8, "workUrlTxtView":Landroid/widget/TextView;
    invoke-virtual {v8, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 69
    iget-object v9, p0, Lcom/behance/sdk/ui/activities/BehanceSDKPublishResultsActivity;->workUrl:Ljava/lang/String;

    if-eqz v9, :cond_4d

    .line 70
    iget-object v9, p0, Lcom/behance/sdk/ui/activities/BehanceSDKPublishResultsActivity;->workUrl:Ljava/lang/String;

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    :cond_4d
    sget v9, Lcom/behance/sdk/R$id;->bsdkPublishResultsWorkImageView:I

    invoke-virtual {p0, v9}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishResultsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/ImageView;

    .line 74
    .local v7, "workImageView":Landroid/widget/ImageView;
    invoke-virtual {v7, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 75
    if-eqz v3, :cond_7e

    .line 76
    new-instance v9, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v9}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v9

    invoke-virtual {v9, v11}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->resetViewBeforeLoading(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v9

    invoke-virtual {v9, v11}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheOnDisk(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v9

    const v10, 0x1080078

    .line 77
    invoke-virtual {v9, v10}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageOnFail(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v9

    invoke-virtual {v9}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v2

    .line 78
    .local v2, "imageLoaderOptions":Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v4

    .line 79
    .local v4, "imageloader":Lcom/nostra13/universalimageloader/core/ImageLoader;
    invoke-virtual {v4, v3, v7, v2}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    .line 82
    .end local v2    # "imageLoaderOptions":Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .end local v4    # "imageloader":Lcom/nostra13/universalimageloader/core/ImageLoader;
    :cond_7e
    sget v9, Lcom/behance/sdk/R$id;->bsdkPublishResultsBehanceBtn:I

    invoke-virtual {p0, v9}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishResultsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 83
    .local v1, "behanceBtn":Landroid/view/View;
    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 84
    return-void
.end method
