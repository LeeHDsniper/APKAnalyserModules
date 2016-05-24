.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;
.super Landroid/support/v4/app/Fragment;
.source "AdobeUXMobilePackageItemOneUpViewerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AdobeUXMobilePackageItemFragment"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$AssetsViewBaseActionBarController;
    }
.end annotation


# instance fields
.field _actionBarController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$AssetsViewBaseActionBarController;

.field private _main_content_container:Landroid/widget/RelativeLayout;

.field private _noInternetConnView:Landroid/view/View;

.field private _noPreviewView:Landroid/view/View;

.field _photoViewData:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$PhotoViewData;

.field private _spinner:Landroid/widget/ProgressBar;

.field private mIndexPos:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 378
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 631
    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;

    .prologue
    .line 378
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->handleNoImageItemPreview()V

    return-void
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;Z)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 378
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->setSpinnerVisibility(Z)V

    return-void
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;

    .prologue
    .line 378
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->mIndexPos:I

    return v0
.end method

.method private handleNoImageItemPreview()V
    .registers 2

    .prologue
    .line 589
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->visibilityhandler_isOffLineOrError(Z)V

    .line 590
    return-void
.end method

.method private initializeViewWithMobilePackageItem(I)V
    .registers 4
    .param p1, "itemPos"    # I

    .prologue
    .line 456
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->getItemAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-result-object v0

    .line 459
    .local v0, "file":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->setupLibraryImageCollectionView(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)V

    .line 460
    return-void
.end method

.method public static newInstance(I)Landroid/support/v4/app/Fragment;
    .registers 4
    .param p0, "position"    # I

    .prologue
    .line 438
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;

    invoke-direct {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;-><init>()V

    .line 441
    .local v1, "f":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 442
    .local v0, "args":Landroid/os/Bundle;
    const-string v2, "indexPos"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 443
    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->setArguments(Landroid/os/Bundle;)V

    .line 444
    return-object v1
.end method

.method private setSpinnerVisibility(Z)V
    .registers 4
    .param p1, "visible"    # Z

    .prologue
    .line 463
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->_spinner:Landroid/widget/ProgressBar;

    if-eqz p1, :cond_9

    const/4 v0, 0x0

    :goto_5
    invoke-virtual {v1, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 464
    return-void

    .line 463
    :cond_9
    const/16 v0, 0x8

    goto :goto_5
.end method

.method private setupLibraryImageCollectionView(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)V
    .registers 10
    .param p1, "file"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .prologue
    const/4 v6, -0x2

    const/high16 v7, 0x44800000

    .line 467
    new-instance v4, Luk/co/senab/photoview/PhotoView;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-direct {v4, v5}, Luk/co/senab/photoview/PhotoView;-><init>(Landroid/content/Context;)V

    .line 468
    .local v4, "photoZoomView":Luk/co/senab/photoview/PhotoView;
    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v2, v6, v6}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 469
    .local v2, "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v5, 0xd

    invoke-virtual {v2, v5}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 470
    invoke-virtual {v4, v2}, Luk/co/senab/photoview/PhotoView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 473
    new-instance v0, Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-direct {v0, v4}, Luk/co/senab/photoview/PhotoViewAttacher;-><init>(Landroid/widget/ImageView;)V

    .line 483
    .local v0, "attacher":Luk/co/senab/photoview/PhotoViewAttacher;
    new-instance v5, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$1PhotoTapListener;

    invoke-direct {v5, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$1PhotoTapListener;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;)V

    invoke-virtual {v0, v5}, Luk/co/senab/photoview/PhotoViewAttacher;->setOnViewTapListener(Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;)V

    .line 484
    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$1;

    invoke-direct {v3, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;)V

    .line 493
    .local v3, "mPagerOnLongClickListener":Landroid/view/View$OnLongClickListener;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->isMenuEnabled()Z

    move-result v5

    if-eqz v5, :cond_34

    .line 494
    invoke-virtual {v0, v3}, Luk/co/senab/photoview/PhotoViewAttacher;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 496
    :cond_34
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;

    invoke-direct {v1, p0, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;Luk/co/senab/photoview/PhotoView;)V

    .line 583
    .local v1, "completionCallback":Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;, "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback<[BLcom/adobe/creativesdk/foundation/storage/AdobeAssetException;>;"
    sget-object v5, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ADOBE_ASSET_FILE_RENDITION_TYPE_PNG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    new-instance v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    invoke-direct {v6, v7, v7}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;-><init>(FF)V

    invoke-virtual {p1, v5, v6, v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getRenditionWithType(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V

    .line 585
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->_main_content_container:Landroid/widget/RelativeLayout;

    invoke-virtual {v5, v4}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 586
    return-void
.end method


# virtual methods
.method protected createActionBarController()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$AssetsViewBaseActionBarController;
    .registers 2

    .prologue
    .line 628
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$AssetsViewBaseActionBarController;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$AssetsViewBaseActionBarController;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;)V

    return-object v0
.end method

.method protected getActionBarController()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$AssetsViewBaseActionBarController;
    .registers 2

    .prologue
    .line 621
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->_actionBarController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$AssetsViewBaseActionBarController;

    if-nez v0, :cond_a

    .line 622
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->createActionBarController()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$AssetsViewBaseActionBarController;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->_actionBarController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$AssetsViewBaseActionBarController;

    .line 624
    :cond_a
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->_actionBarController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$AssetsViewBaseActionBarController;

    return-object v0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 617
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onAttach(Landroid/app/Activity;)V

    .line 618
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 449
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 450
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->setHasOptionsMenu(Z)V

    .line 451
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_1a

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "indexPos"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    :goto_17
    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->mIndexPos:I

    .line 452
    return-void

    .line 451
    :cond_1a
    const/4 v0, -0x1

    goto :goto_17
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .registers 4
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 409
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->getActionBarController()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$AssetsViewBaseActionBarController;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$AssetsViewBaseActionBarController;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 410
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/Fragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 411
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 8
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x1

    .line 595
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$layout;->mobilepackage_item_fragment:I

    const/4 v2, 0x0

    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 596
    .local v0, "v":Landroid/view/View;
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->mobilepackage_item_fragment_content_container:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->_main_content_container:Landroid/widget/RelativeLayout;

    .line 598
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->mobilepackage_item_no_internet_connection:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->_noInternetConnView:Landroid/view/View;

    .line 599
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->mobilepackage_item_no_preview:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->_noPreviewView:Landroid/view/View;

    .line 600
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->mobilepackage_item_progressbar_new:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->_spinner:Landroid/widget/ProgressBar;

    .line 601
    invoke-direct {p0, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->setSpinnerVisibility(Z)V

    .line 605
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->isNetworkAvailable()Z

    move-result v1

    if-eqz v1, :cond_3e

    .line 606
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->visibilityhandler_isOnLine()V

    .line 607
    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->mIndexPos:I

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->initializeViewWithMobilePackageItem(I)V

    .line 612
    :goto_3d
    return-object v0

    .line 609
    :cond_3e
    invoke-virtual {p0, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->visibilityhandler_isOffLineOrError(Z)V

    goto :goto_3d
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 7
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v1, 0x1

    .line 422
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->getActionBarController()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$AssetsViewBaseActionBarController;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$AssetsViewBaseActionBarController;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    .line 423
    .local v0, "handled":Z
    if-eqz v0, :cond_c

    .line 432
    :goto_b
    return v1

    .line 426
    :cond_c
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    const v3, 0x102002c

    if-ne v2, v3, :cond_20

    .line 428
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;

    move-result-object v2

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;->NAVIGATE_BACK:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;->postCommand(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;Ljava/lang/Object;)V

    goto :goto_b

    .line 432
    :cond_20
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    goto :goto_b
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)V
    .registers 3
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 415
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onPrepareOptionsMenu(Landroid/view/Menu;)V

    .line 416
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->getActionBarController()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$AssetsViewBaseActionBarController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$AssetsViewBaseActionBarController;->onPrepareOptionsMenu(Landroid/view/Menu;)V

    .line 417
    return-void
.end method

.method visibilityhandler_isOffLineOrError(Z)V
    .registers 5
    .param p1, "offline"    # Z

    .prologue
    const/16 v2, 0x8

    const/4 v1, 0x0

    .line 395
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->_main_content_container:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 396
    if-eqz p1, :cond_18

    .line 397
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->_noInternetConnView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 398
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->_noPreviewView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 404
    :goto_14
    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->setSpinnerVisibility(Z)V

    .line 405
    return-void

    .line 401
    :cond_18
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->_noInternetConnView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 402
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->_noPreviewView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_14
.end method

.method visibilityhandler_isOnLine()V
    .registers 4

    .prologue
    const/16 v2, 0x8

    .line 389
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->_main_content_container:Landroid/widget/RelativeLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 390
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->_noInternetConnView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 391
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->_noPreviewView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 392
    return-void
.end method
