.class public Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;
.super Landroid/support/v4/app/DialogFragment;
.source "StoreContainerFragment.java"

# interfaces
.implements Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$OnStoreElementSelected;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;
    }
.end annotation


# static fields
.field public static logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# instance fields
.field private mArgumentsChanged:Z

.field private mViewLayoutParams:Landroid/view/ViewGroup$LayoutParams;

.field private viewAnimator:Landroid/widget/ViewAnimator;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 42
    const-string v0, "StoreContainerFragment"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 38
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 309
    return-void
.end method

.method private connectIfNecessary()V
    .registers 5

    .prologue
    .line 126
    sget-object v1, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "connectIfNecessary"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 127
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeImageAccountDelegate;

    .line 128
    .local v0, "delegate":Lcom/adobe/creativesdk/aviary/internal/account/AdobeImageAccountDelegate;
    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeImageAccountDelegate;->isContentServiceConnected()Z

    move-result v1

    if-eqz v1, :cond_21

    .line 129
    sget-object v1, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "already connected"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 130
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->update()V

    .line 149
    :goto_20
    return-void

    .line 132
    :cond_21
    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeImageAccountDelegate;->tryConnectToContentService()Lrx/Observable;

    move-result-object v1

    new-instance v2, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$2;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$2;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;)V

    new-instance v3, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$3;

    invoke-direct {v3, p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$3;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;)V

    invoke-virtual {v1, v2, v3}, Lrx/Observable;->subscribe(Lrx/functions/Action1;Lrx/functions/Action1;)Lrx/Subscription;

    .line 147
    sget-object v1, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "not yet connected"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_20
.end method

.method private createFragmentIfRequired(I)V
    .registers 13
    .param p1, "targetChild"    # I

    .prologue
    const/4 v0, 0x1

    .line 230
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v4

    .line 232
    .local v4, "manager":Landroid/support/v4/app/FragmentManager;
    if-nez p1, :cond_32

    .line 234
    const-string v8, "list-fragment"

    invoke-virtual {v4, v8}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v3

    .line 235
    .local v3, "listFragment":Landroid/support/v4/app/Fragment;
    if-nez v3, :cond_31

    .line 237
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v8

    const-string v9, "extra-pack-type"

    invoke-virtual {v8, v9}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v8

    check-cast v8, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    invoke-static {v8}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->newInstance(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    move-result-object v2

    .line 239
    .local v2, "fragment":Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;
    invoke-virtual {v4}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v8

    sget v9, Lcom/aviary/android/feather/sdk/R$id;->listView:I

    const-string v10, "list-fragment"

    .line 240
    invoke-virtual {v8, v9, v2, v10}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v8

    .line 241
    invoke-virtual {v8}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 242
    invoke-virtual {v2, p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->setOnSelectedListener(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$OnStoreElementSelected;)V

    .line 262
    .end local v2    # "fragment":Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;
    .end local v3    # "listFragment":Landroid/support/v4/app/Fragment;
    :cond_31
    :goto_31
    return-void

    .line 244
    :cond_32
    if-ne p1, v0, :cond_31

    .line 246
    const-string v8, "detail-fragment"

    invoke-virtual {v4, v8}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragment;

    .line 247
    .local v1, "detailFragment":Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragment;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v8

    const-string v9, "extra-pack-id"

    invoke-virtual {v8, v9}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v6

    .line 248
    .local v6, "packId":J
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v8

    const-string v9, "extra-pack-type"

    invoke-virtual {v8, v9}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v5

    check-cast v5, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .line 249
    .local v5, "packType":Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    if-nez v1, :cond_76

    .line 250
    sget-boolean v8, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_21:Z

    if-nez v8, :cond_60

    const-string v8, "list-fragment"

    invoke-virtual {v4, v8}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v8

    if-nez v8, :cond_74

    .line 251
    .local v0, "animateDetail":Z
    :cond_60
    :goto_60
    invoke-static {v6, v7, v5, v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragment;->newInstance(JLcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;Z)Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragment;

    move-result-object v2

    .line 254
    .local v2, "fragment":Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragment;
    invoke-virtual {v4}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v8

    sget v9, Lcom/aviary/android/feather/sdk/R$id;->detailView:I

    const-string v10, "detail-fragment"

    .line 255
    invoke-virtual {v8, v9, v2, v10}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v8

    .line 256
    invoke-virtual {v8}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    goto :goto_31

    .line 250
    .end local v0    # "animateDetail":Z
    .end local v2    # "fragment":Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragment;
    :cond_74
    const/4 v0, 0x0

    goto :goto_60

    .line 258
    :cond_76
    invoke-virtual {v1, v6, v7}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragment;->showPackInfo(J)V

    goto :goto_31
.end method

.method public static newInstance(Landroid/os/Bundle;)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;
    .registers 2
    .param p0, "data"    # Landroid/os/Bundle;

    .prologue
    .line 48
    new-instance v0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;-><init>()V

    .line 49
    .local v0, "fragment":Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;
    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->setArguments(Landroid/os/Bundle;)V

    .line 50
    return-object v0
.end method

.method private updateDialogLayoutSize()V
    .registers 13

    .prologue
    const/4 v11, 0x1

    .line 152
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/utils/ScreenUtils;->isTablet(Landroid/content/Context;)Z

    move-result v6

    if-eqz v6, :cond_3d

    .line 153
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    .line 154
    .local v4, "resources":Landroid/content/res/Resources;
    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    .line 155
    .local v2, "metrics":Landroid/util/DisplayMetrics;
    iget v5, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 156
    .local v5, "screenHeight":I
    sget v6, Lcom/aviary/android/feather/sdk/R$fraction;->com_adobe_image_editor_store_container_height:I

    invoke-virtual {v4, v6, v11, v11}, Landroid/content/res/Resources;->getFraction(III)F

    move-result v1

    .line 157
    .local v1, "heightRatio":F
    int-to-float v6, v5

    mul-float/2addr v6, v1

    float-to-int v0, v6

    .line 159
    .local v0, "height":I
    sget-object v6, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v7, "ratio: %f, final height: %d"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v11

    invoke-interface {v6, v7, v8}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 160
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->viewAnimator:Landroid/widget/ViewAnimator;

    invoke-virtual {v6}, Landroid/widget/ViewAnimator;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    .line 161
    .local v3, "params":Landroid/view/ViewGroup$LayoutParams;
    iput v0, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 163
    .end local v0    # "height":I
    .end local v1    # "heightRatio":F
    .end local v2    # "metrics":Landroid/util/DisplayMetrics;
    .end local v3    # "params":Landroid/view/ViewGroup$LayoutParams;
    .end local v4    # "resources":Landroid/content/res/Resources;
    .end local v5    # "screenHeight":I
    :cond_3d
    return-void
.end method


# virtual methods
.method public isFragmentVisible(Landroid/support/v4/app/Fragment;)Z
    .registers 9
    .param p1, "fragment"    # Landroid/support/v4/app/Fragment;

    .prologue
    const/4 v6, 0x1

    const/4 v1, 0x0

    .line 265
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->viewAnimator:Landroid/widget/ViewAnimator;

    invoke-virtual {v2}, Landroid/widget/ViewAnimator;->getDisplayedChild()I

    move-result v0

    .line 266
    .local v0, "index":I
    sget-object v2, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "child: %d"

    new-array v4, v6, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v1

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 268
    if-nez v0, :cond_1c

    .line 269
    instance-of v1, p1, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;

    .line 273
    :cond_1b
    :goto_1b
    return v1

    .line 270
    :cond_1c
    if-ne v0, v6, :cond_1b

    .line 271
    instance-of v1, p1, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;

    goto :goto_1b
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 120
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onActivityCreated"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 121
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 122
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->connectIfNecessary()V

    .line 123
    return-void
.end method

.method public onBackPressed()Z
    .registers 9

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 294
    sget-object v4, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "onBackPressed. displayedChild: %d"

    new-array v6, v2, [Ljava/lang/Object;

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->viewAnimator:Landroid/widget/ViewAnimator;

    invoke-virtual {v7}, Landroid/widget/ViewAnimator;->getDisplayedChild()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v3

    invoke-interface {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 295
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->viewAnimator:Landroid/widget/ViewAnimator;

    invoke-virtual {v4}, Landroid/widget/ViewAnimator;->getDisplayedChild()I

    move-result v4

    if-ne v4, v2, :cond_3f

    .line 296
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    .line 297
    .local v1, "manager":Landroid/support/v4/app/FragmentManager;
    const-string v4, "list-fragment"

    invoke-virtual {v1, v4}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 299
    .local v0, "listFragment":Landroid/support/v4/app/Fragment;
    if-eqz v0, :cond_3f

    .line 300
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    const-string v4, "extra-pack-id"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 301
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->setArguments(Landroid/os/Bundle;)V

    .line 302
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->update()V

    .line 306
    .end local v0    # "listFragment":Landroid/support/v4/app/Fragment;
    .end local v1    # "manager":Landroid/support/v4/app/FragmentManager;
    :goto_3e
    return v2

    :cond_3f
    move v2, v3

    goto :goto_3e
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 6
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 104
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onConfigurationChanged: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 105
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 106
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->updateDialogLayoutSize()V

    .line 107
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 55
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onCreate"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 56
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 57
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->setStyle(II)V

    .line 58
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 6
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 63
    sget v0, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_store_container_fragment:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onPackSelected(JLcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;Ljava/lang/String;)V
    .registers 12
    .param p1, "packId"    # J
    .param p3, "packType"    # Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    .param p4, "from"    # Ljava/lang/String;

    .prologue
    .line 285
    sget-object v1, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "onPackSelected: %d"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 287
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 288
    .local v0, "arguments":Landroid/os/Bundle;
    const-string v1, "extra-pack-id"

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 289
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->setArguments(Landroid/os/Bundle;)V

    .line 290
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->update()V

    .line 291
    return-void
.end method

.method public onResume()V
    .registers 3

    .prologue
    .line 79
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onResume()V

    .line 81
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    .line 82
    .local v0, "dialog":Landroid/app/Dialog;
    if-eqz v0, :cond_11

    .line 83
    new-instance v1, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$1;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$1;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;)V

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 100
    :cond_11
    return-void
.end method

.method public onStart()V
    .registers 3

    .prologue
    .line 68
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onStart"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 69
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onStart()V

    .line 71
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    if-nez v0, :cond_11

    .line 75
    :goto_10
    return-void

    .line 74
    :cond_11
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->updateDialogLayoutSize()V

    goto :goto_10
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 111
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/DialogFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 112
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->mViewLayoutParams:Landroid/view/ViewGroup$LayoutParams;

    .line 113
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->view_animator:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ViewAnimator;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->viewAnimator:Landroid/widget/ViewAnimator;

    .line 114
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 115
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    .line 116
    return-void
.end method

.method public setArguments(Landroid/os/Bundle;)V
    .registers 3
    .param p1, "args"    # Landroid/os/Bundle;

    .prologue
    .line 167
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->mArgumentsChanged:Z

    .line 168
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_11

    .line 169
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    .line 173
    :goto_10
    return-void

    .line 171
    :cond_11
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->setArguments(Landroid/os/Bundle;)V

    goto :goto_10
.end method

.method public setDisplayedChild(I)V
    .registers 8
    .param p1, "targetChild"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 190
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->createFragmentIfRequired(I)V

    .line 192
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->viewAnimator:Landroid/widget/ViewAnimator;

    invoke-virtual {v3}, Landroid/widget/ViewAnimator;->getDisplayedChild()I

    move-result v3

    if-eq p1, v3, :cond_3d

    move v0, v1

    .line 193
    .local v0, "animationRequired":Z
    :goto_e
    sget-object v3, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "animationRequired: %b"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v1, v2

    invoke-interface {v3, v4, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 195
    if-eqz v0, :cond_3c

    .line 196
    if-nez p1, :cond_3f

    .line 197
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->viewAnimator:Landroid/widget/ViewAnimator;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    sget v3, Lcom/aviary/android/feather/sdk/R$anim;->com_adobe_image_void_animation:I

    invoke-virtual {v1, v2, v3}, Landroid/widget/ViewAnimator;->setInAnimation(Landroid/content/Context;I)V

    .line 198
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->viewAnimator:Landroid/widget/ViewAnimator;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    sget v3, Lcom/aviary/android/feather/sdk/R$anim;->com_adobe_image_slide_out_right:I

    invoke-virtual {v1, v2, v3}, Landroid/widget/ViewAnimator;->setOutAnimation(Landroid/content/Context;I)V

    .line 221
    :goto_37
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->viewAnimator:Landroid/widget/ViewAnimator;

    invoke-virtual {v1, p1}, Landroid/widget/ViewAnimator;->setDisplayedChild(I)V

    .line 223
    :cond_3c
    return-void

    .end local v0    # "animationRequired":Z
    :cond_3d
    move v0, v2

    .line 192
    goto :goto_e

    .line 200
    .restart local v0    # "animationRequired":Z
    :cond_3f
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->viewAnimator:Landroid/widget/ViewAnimator;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    sget v3, Lcom/aviary/android/feather/sdk/R$anim;->com_adobe_image_slide_in_right:I

    invoke-virtual {v1, v2, v3}, Landroid/widget/ViewAnimator;->setInAnimation(Landroid/content/Context;I)V

    .line 201
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->viewAnimator:Landroid/widget/ViewAnimator;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    sget v3, Lcom/aviary/android/feather/sdk/R$anim;->com_adobe_image_void_animation:I

    invoke-virtual {v1, v2, v3}, Landroid/widget/ViewAnimator;->setOutAnimation(Landroid/content/Context;I)V

    .line 203
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->viewAnimator:Landroid/widget/ViewAnimator;

    invoke-virtual {v1}, Landroid/widget/ViewAnimator;->getInAnimation()Landroid/view/animation/Animation;

    move-result-object v1

    new-instance v2, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$4;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$4;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;)V

    invoke-virtual {v1, v2}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    goto :goto_37
.end method

.method public update()V
    .registers 11

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 176
    iget-boolean v6, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->mArgumentsChanged:Z

    if-eqz v6, :cond_34

    .line 177
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 178
    .local v0, "arguments":Landroid/os/Bundle;
    const-string v6, "extra-pack-id"

    const-wide/16 v8, -0x1

    invoke-virtual {v0, v6, v8, v9}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    .line 179
    .local v2, "packId":J
    const-string v6, "extra-pack-type"

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .line 180
    .local v1, "packType":Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    if-nez v1, :cond_24

    .line 181
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "packType is missing!!"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 183
    :cond_24
    iput-boolean v4, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->mArgumentsChanged:Z

    .line 184
    const-wide/16 v6, 0x0

    cmp-long v6, v2, v6

    if-gez v6, :cond_35

    :goto_2c
    invoke-virtual {p0, v4}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->setDisplayedChild(I)V

    .line 185
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->viewAnimator:Landroid/widget/ViewAnimator;

    invoke-virtual {v4, v5}, Landroid/widget/ViewAnimator;->setAnimateFirstView(Z)V

    .line 187
    .end local v0    # "arguments":Landroid/os/Bundle;
    .end local v1    # "packType":Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    .end local v2    # "packId":J
    :cond_34
    return-void

    .restart local v0    # "arguments":Landroid/os/Bundle;
    .restart local v1    # "packType":Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    .restart local v2    # "packId":J
    :cond_35
    move v4, v5

    .line 184
    goto :goto_2c
.end method
