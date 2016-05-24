.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;
.super Landroid/support/v4/app/Fragment;
.source "AdobeUXLibraryItemCollectionOneUpViewerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AdobeUXLibraryItemFragment"
.end annotation


# instance fields
.field private _main_content_container:Landroid/widget/RelativeLayout;

.field private _noInternetConnView:Landroid/view/View;

.field private _noPreviewView:Landroid/view/View;

.field _photoViewData:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$PhotoViewData;

.field private _spinner:Landroid/widget/ProgressBar;

.field private mIndexPos:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 403
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    return-void
.end method

.method static synthetic access$700(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;

    .prologue
    .line 403
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->handleNoImageItemPreview()V

    return-void
.end method

.method static synthetic access$800(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;Z)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 403
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->setSpinnerVisibility(Z)V

    return-void
.end method

.method private handleNoImageItemPreview()V
    .registers 2

    .prologue
    .line 606
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->visibilityhandler_isOffLineOrError(Z)V

    .line 607
    return-void
.end method

.method private initializeViewWithLibraryItem(I)V
    .registers 5
    .param p1, "itemPos"    # I

    .prologue
    const/4 v2, 0x0

    .line 456
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/LibraryItemsOneUpViewController;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/LibraryItemsOneUpViewController;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/LibraryItemsOneUpViewController;->getItemAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    move-result-object v0

    .line 457
    .local v0, "libraryItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    if-nez v0, :cond_c

    .line 473
    .end local v0    # "libraryItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    :cond_b
    :goto_b
    return-void

    .line 462
    .restart local v0    # "libraryItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    :cond_c
    instance-of v1, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;

    if-eqz v1, :cond_19

    .line 463
    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;

    .end local v0    # "libraryItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->setupColorView(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;)V

    .line 464
    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->setSpinnerVisibility(Z)V

    goto :goto_b

    .line 466
    .restart local v0    # "libraryItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    :cond_19
    instance-of v1, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;

    if-eqz v1, :cond_26

    .line 467
    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;

    .end local v0    # "libraryItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->setupColorThemeView(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;)V

    .line 468
    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->setSpinnerVisibility(Z)V

    goto :goto_b

    .line 470
    .restart local v0    # "libraryItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    :cond_26
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->libraryItemAsImageRendition(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 471
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->setupLibraryImageCollectionView(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)V

    goto :goto_b
.end method

.method private libraryItemAsImageRendition(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)Z
    .registers 3
    .param p1, "libraryItem"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    .prologue
    .line 450
    instance-of v0, p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;

    if-nez v0, :cond_14

    instance-of v0, p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;

    if-nez v0, :cond_14

    instance-of v0, p1, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;

    if-nez v0, :cond_14

    instance-of v0, p1, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemLayoutStyle;

    if-nez v0, :cond_14

    instance-of v0, p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;

    if-eqz v0, :cond_16

    :cond_14
    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method public static newInstance(I)Landroid/support/v4/app/Fragment;
    .registers 4
    .param p0, "position"    # I

    .prologue
    .line 434
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;

    invoke-direct {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;-><init>()V

    .line 437
    .local v1, "f":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 438
    .local v0, "args":Landroid/os/Bundle;
    const-string v2, "indexPos"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 439
    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->setArguments(Landroid/os/Bundle;)V

    .line 440
    return-object v1
.end method

.method private setSpinnerVisibility(Z)V
    .registers 4
    .param p1, "visible"    # Z

    .prologue
    .line 476
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->_spinner:Landroid/widget/ProgressBar;

    if-eqz p1, :cond_9

    const/4 v0, 0x0

    :goto_5
    invoke-virtual {v1, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 477
    return-void

    .line 476
    :cond_9
    const/16 v0, 0x8

    goto :goto_5
.end method

.method private setupColorThemeView(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;)V
    .registers 12
    .param p1, "colorThemeItem"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;

    .prologue
    .line 610
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v8

    invoke-direct {v1, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 611
    .local v1, "colorThemeContainerView":Landroid/widget/LinearLayout;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    sget v9, Lcom/adobe/creativesdk/foundation/assets/R$dimen;->adobe_library_oneup_colortheme_width:I

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v7

    .line 612
    .local v7, "viewWidth":I
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    sget v9, Lcom/adobe/creativesdk/foundation/assets/R$dimen;->adobe_library_oneup_colortheme_height:I

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    .line 613
    .local v6, "viewHeight":I
    new-instance v5, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v5, v7, v6}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 614
    .local v5, "lps":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v8, 0xd

    invoke-virtual {v5, v8}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 615
    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 617
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;->getRGBColors()Ljava/util/ArrayList;

    move-result-object v2

    .line 618
    .local v2, "colorThemes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    if-eqz v2, :cond_64

    .line 619
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, 0x0

    const/4 v9, -0x1

    invoke-direct {v4, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 620
    .local v4, "layoutParams":Landroid/widget/LinearLayout$LayoutParams;
    const/high16 v8, 0x3f800000

    iput v8, v4, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 621
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_3c
    const/4 v8, 0x5

    if-ge v3, v8, :cond_64

    .line 622
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v8

    invoke-direct {v0, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 623
    .local v0, "colorThemeChild":Landroid/widget/LinearLayout;
    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 624
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-ge v3, v8, :cond_5e

    .line 625
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 627
    :cond_5e
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 621
    add-int/lit8 v3, v3, 0x1

    goto :goto_3c

    .line 630
    .end local v0    # "colorThemeChild":Landroid/widget/LinearLayout;
    .end local v3    # "i":I
    .end local v4    # "layoutParams":Landroid/widget/LinearLayout$LayoutParams;
    :cond_64
    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->_main_content_container:Landroid/widget/RelativeLayout;

    invoke-virtual {v8, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 631
    return-void
.end method

.method private setupColorView(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;)V
    .registers 7
    .param p1, "colorItem"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;

    .prologue
    .line 635
    new-instance v1, Landroid/widget/RelativeLayout;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 636
    .local v1, "colorView":Landroid/widget/RelativeLayout;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lcom/adobe/creativesdk/foundation/assets/R$dimen;->adobe_library_oneup_color_size:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 637
    .local v0, "colorSize":I
    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v2, v0, v0}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 638
    .local v2, "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v3, 0xd

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 639
    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 640
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->color()I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 641
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->_main_content_container:Landroid/widget/RelativeLayout;

    invoke-virtual {v3, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 642
    return-void
.end method

.method private setupLibraryImageCollectionView(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)V
    .registers 12
    .param p1, "imageItem"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    .prologue
    const/4 v9, -0x2

    const/high16 v8, 0x44800000

    .line 505
    new-instance v5, Luk/co/senab/photoview/PhotoView;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v7

    invoke-direct {v5, v7}, Luk/co/senab/photoview/PhotoView;-><init>(Landroid/content/Context;)V

    .line 506
    .local v5, "photoZoomView":Luk/co/senab/photoview/PhotoView;
    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v2, v9, v9}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 507
    .local v2, "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v7, 0xd

    invoke-virtual {v2, v7}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 508
    invoke-virtual {v5, v2}, Luk/co/senab/photoview/PhotoView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 511
    new-instance v0, Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-direct {v0, v5}, Luk/co/senab/photoview/PhotoViewAttacher;-><init>(Landroid/widget/ImageView;)V

    .line 521
    .local v0, "attacher":Luk/co/senab/photoview/PhotoViewAttacher;
    new-instance v7, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment$1PhotoTapListener;

    invoke-direct {v7, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment$1PhotoTapListener;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;)V

    invoke-virtual {v0, v7}, Luk/co/senab/photoview/PhotoViewAttacher;->setOnViewTapListener(Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;)V

    .line 522
    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment$1;

    invoke-direct {v3, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;)V

    .line 534
    .local v3, "mPagerOnLongClickListener":Landroid/view/View$OnLongClickListener;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->isMenuEnabled()Z

    move-result v7

    if-eqz v7, :cond_34

    .line 535
    invoke-virtual {v0, v3}, Luk/co/senab/photoview/PhotoViewAttacher;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 537
    :cond_34
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment$2;

    invoke-direct {v1, p0, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;Luk/co/senab/photoview/PhotoView;)V

    .line 593
    .local v1, "completionCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;
    new-instance v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    invoke-direct {v4, v8, v8}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;-><init>(FF)V

    .line 594
    .local v4, "oneUpDimensions":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;
    invoke-static {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeLibraryItemUtils;->getRenditionFile(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-result-object v6

    .line 595
    .local v6, "renditionFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    if-eqz v6, :cond_4f

    .line 596
    sget-object v7, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ADOBE_ASSET_FILE_RENDITION_TYPE_PNG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    invoke-static {v6, v7, v4, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeLibraryItemUtils;->getImageRendition(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V

    .line 602
    :goto_49
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->_main_content_container:Landroid/widget/RelativeLayout;

    invoke-virtual {v7, v5}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 603
    return-void

    .line 600
    :cond_4f
    const/4 v7, 0x0

    invoke-interface {v1, v7}, Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;->onCompletion(Ljava/lang/Object;)V

    goto :goto_49
.end method


# virtual methods
.method public onAttach(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 671
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onAttach(Landroid/app/Activity;)V

    .line 672
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 445
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 446
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_16

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "indexPos"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    :goto_13
    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->mIndexPos:I

    .line 447
    return-void

    .line 446
    :cond_16
    const/4 v0, -0x1

    goto :goto_13
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 8
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x1

    .line 647
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$layout;->library_item_fragment:I

    const/4 v2, 0x0

    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 648
    .local v0, "v":Landroid/view/View;
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->library_item_fragment_content_container:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->_main_content_container:Landroid/widget/RelativeLayout;

    .line 650
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->alibrary_item_no_internet_connection:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->_noInternetConnView:Landroid/view/View;

    .line 651
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->library_item_no_preview:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->_noPreviewView:Landroid/view/View;

    .line 652
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->library_item_progressbar_new:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->_spinner:Landroid/widget/ProgressBar;

    .line 653
    invoke-direct {p0, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->setSpinnerVisibility(Z)V

    .line 657
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->isNetworkAvailable()Z

    move-result v1

    if-eqz v1, :cond_3e

    .line 658
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->visibilityhandler_isOnLine()V

    .line 659
    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->mIndexPos:I

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->initializeViewWithLibraryItem(I)V

    .line 665
    :goto_3d
    return-object v0

    .line 662
    :cond_3e
    invoke-virtual {p0, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->visibilityhandler_isOffLineOrError(Z)V

    goto :goto_3d
.end method

.method visibilityhandler_isOffLineOrError(Z)V
    .registers 5
    .param p1, "offline"    # Z

    .prologue
    const/16 v2, 0x8

    const/4 v1, 0x0

    .line 418
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->_main_content_container:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 419
    if-eqz p1, :cond_18

    .line 420
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->_noInternetConnView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 421
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->_noPreviewView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 427
    :goto_14
    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->setSpinnerVisibility(Z)V

    .line 428
    return-void

    .line 424
    :cond_18
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->_noInternetConnView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 425
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->_noPreviewView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_14
.end method

.method visibilityhandler_isOnLine()V
    .registers 4

    .prologue
    const/16 v2, 0x8

    .line 413
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->_main_content_container:Landroid/widget/RelativeLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 414
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->_noInternetConnView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 415
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;->_noPreviewView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 416
    return-void
.end method
