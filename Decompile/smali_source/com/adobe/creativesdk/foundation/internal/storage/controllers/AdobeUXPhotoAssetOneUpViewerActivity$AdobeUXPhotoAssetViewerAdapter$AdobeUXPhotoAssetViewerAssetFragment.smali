.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$AdobeUXPhotoAssetViewerAdapter$AdobeUXPhotoAssetViewerAssetFragment;
.super Landroid/support/v4/app/Fragment;
.source "AdobeUXPhotoAssetOneUpViewerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$AdobeUXPhotoAssetViewerAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AdobeUXPhotoAssetViewerAssetFragment"
.end annotation


# instance fields
.field mNum:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 582
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    return-void
.end method

.method static newInstance(I)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$AdobeUXPhotoAssetViewerAdapter$AdobeUXPhotoAssetViewerAssetFragment;
    .registers 4
    .param p0, "num"    # I

    .prologue
    .line 590
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$AdobeUXPhotoAssetViewerAdapter$AdobeUXPhotoAssetViewerAssetFragment;

    invoke-direct {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$AdobeUXPhotoAssetViewerAdapter$AdobeUXPhotoAssetViewerAssetFragment;-><init>()V

    .line 593
    .local v1, "f":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$AdobeUXPhotoAssetViewerAdapter$AdobeUXPhotoAssetViewerAssetFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 594
    .local v0, "args":Landroid/os/Bundle;
    const-string v2, "num"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 595
    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$AdobeUXPhotoAssetViewerAdapter$AdobeUXPhotoAssetViewerAssetFragment;->setArguments(Landroid/os/Bundle;)V

    .line 597
    return-object v1
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 605
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 606
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$AdobeUXPhotoAssetViewerAdapter$AdobeUXPhotoAssetViewerAssetFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_16

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$AdobeUXPhotoAssetViewerAdapter$AdobeUXPhotoAssetViewerAssetFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "num"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    :goto_13
    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$AdobeUXPhotoAssetViewerAdapter$AdobeUXPhotoAssetViewerAssetFragment;->mNum:I

    .line 607
    return-void

    .line 606
    :cond_16
    const/4 v0, 0x1

    goto :goto_13
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 24
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 619
    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$layout;->fragment_photo_image:I

    const/4 v9, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-virtual {v0, v3, v1, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v19

    .line 620
    .local v19, "v":Landroid/view/View;
    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$id;->photo_image_view:I

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 621
    .local v4, "iv":Landroid/view/View;
    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$id;->photo_viewer_no_internet_connection:I

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    .line 622
    .local v5, "noInternetConnView":Landroid/view/View;
    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$id;->photo_viewer_no_preview:I

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .line 624
    .local v6, "noPreviewView":Landroid/view/View;
    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$id;->photo_image_progressbar_new:I

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/ProgressBar;

    .line 625
    .local v7, "spinner":Landroid/widget/ProgressBar;
    const/4 v3, 0x0

    invoke-virtual {v7, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 626
    move-object/from16 v0, p0

    iget v3, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$AdobeUXPhotoAssetViewerAdapter$AdobeUXPhotoAssetViewerAssetFragment;->mNum:I

    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->getAssetAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    move-result-object v14

    .line 628
    .local v14, "asset":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$AdobeUXPhotoAssetViewerAdapter$AdobeUXPhotoAssetViewerAssetFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v11

    .line 630
    .local v11, "displayMetrics":Landroid/util/DisplayMetrics;
    new-instance v15, Luk/co/senab/photoview/PhotoViewAttacher;

    move-object v3, v4

    check-cast v3, Landroid/widget/ImageView;

    invoke-direct {v15, v3}, Luk/co/senab/photoview/PhotoViewAttacher;-><init>(Landroid/widget/ImageView;)V

    .line 641
    .local v15, "attacher":Luk/co/senab/photoview/PhotoViewAttacher;
    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$AdobeUXPhotoAssetViewerAdapter$AdobeUXPhotoAssetViewerAssetFragment$1PhotoTapListener;

    move-object/from16 v0, p0

    invoke-direct {v3, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$AdobeUXPhotoAssetViewerAdapter$AdobeUXPhotoAssetViewerAssetFragment$1PhotoTapListener;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$AdobeUXPhotoAssetViewerAdapter$AdobeUXPhotoAssetViewerAssetFragment;)V

    invoke-virtual {v15, v3}, Luk/co/senab/photoview/PhotoViewAttacher;->setOnViewTapListener(Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;)V

    .line 643
    new-instance v16, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$AdobeUXPhotoAssetViewerAdapter$AdobeUXPhotoAssetViewerAssetFragment$1;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$AdobeUXPhotoAssetViewerAdapter$AdobeUXPhotoAssetViewerAssetFragment$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$AdobeUXPhotoAssetViewerAdapter$AdobeUXPhotoAssetViewerAssetFragment;)V

    .line 652
    .local v16, "mPagerOnLongClickListener":Landroid/view/View$OnLongClickListener;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->isMenuEnabled()Z

    move-result v3

    if-eqz v3, :cond_65

    .line 653
    invoke-virtual/range {v15 .. v16}, Luk/co/senab/photoview/PhotoViewAttacher;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 674
    :cond_65
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$AdobeUXPhotoAssetViewerAdapter$AdobeUXPhotoAssetViewerAssetFragment$1VisibilityHandler;

    move-object/from16 v3, p0

    invoke-direct/range {v2 .. v7}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$AdobeUXPhotoAssetViewerAdapter$AdobeUXPhotoAssetViewerAssetFragment$1VisibilityHandler;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$AdobeUXPhotoAssetViewerAdapter$AdobeUXPhotoAssetViewerAssetFragment;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/widget/ProgressBar;)V

    .line 677
    .local v2, "visibilityHandler":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$AdobeUXPhotoAssetViewerAdapter$AdobeUXPhotoAssetViewerAssetFragment$1VisibilityHandler;
    new-instance v8, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$AdobeUXPhotoAssetViewerAdapter$AdobeUXPhotoAssetViewerAssetFragment$2;

    move-object/from16 v9, p0

    move-object v10, v2

    move-object v12, v4

    move-object v13, v7

    invoke-direct/range {v8 .. v13}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$AdobeUXPhotoAssetViewerAdapter$AdobeUXPhotoAssetViewerAssetFragment$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$AdobeUXPhotoAssetViewerAdapter$AdobeUXPhotoAssetViewerAssetFragment;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$AdobeUXPhotoAssetViewerAdapter$AdobeUXPhotoAssetViewerAssetFragment$1VisibilityHandler;Landroid/util/DisplayMetrics;Landroid/view/View;Landroid/widget/ProgressBar;)V

    .line 729
    .local v8, "rendDelegate":Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;, "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback<[BLcom/adobe/creativesdk/foundation/storage/AdobePhotoException;>;"
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;->isNetworkAvailable()Z

    move-result v3

    if-eqz v3, :cond_f9

    .line 731
    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$AdobeUXPhotoAssetViewerAdapter$AdobeUXPhotoAssetViewerAssetFragment$1VisibilityHandler;->isOnLine()V

    .line 732
    invoke-virtual {v14}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->getRenditions()Ljava/util/Map;

    move-result-object v18

    .line 733
    .local v18, "renditions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;>;"
    const-string v3, "2048"

    move-object/from16 v0, v18

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_a6

    .line 734
    const-string v3, "2048"

    move-object/from16 v0, v18

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;

    .line 735
    .local v17, "rendition":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;
    move-object/from16 v0, v17

    invoke-virtual {v14, v0, v8}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->downloadRendition(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V

    .line 760
    .end local v17    # "rendition":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;
    .end local v18    # "renditions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;>;"
    :goto_9c
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$AdobeUXPhotoAssetViewerAdapter$AdobeUXPhotoAssetViewerAssetFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;->setShareIntent()V
    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;)V

    .line 762
    return-object v19

    .line 737
    .restart local v18    # "renditions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;>;"
    :cond_a6
    const-string v3, "1024"

    move-object/from16 v0, v18

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_c0

    .line 739
    const-string v3, "1024"

    move-object/from16 v0, v18

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;

    .line 740
    .restart local v17    # "rendition":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;
    move-object/from16 v0, v17

    invoke-virtual {v14, v0, v8}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->downloadRendition(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V

    goto :goto_9c

    .line 742
    .end local v17    # "rendition":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;
    :cond_c0
    const-string v3, "thumbnail2x"

    move-object/from16 v0, v18

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_da

    .line 744
    const-string v3, "thumbnail2x"

    move-object/from16 v0, v18

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;

    .line 745
    .restart local v17    # "rendition":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;
    move-object/from16 v0, v17

    invoke-virtual {v14, v0, v8}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->downloadRendition(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V

    goto :goto_9c

    .line 747
    .end local v17    # "rendition":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;
    :cond_da
    const-string v3, "144h"

    move-object/from16 v0, v18

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_f4

    .line 749
    const-string v3, "144h"

    move-object/from16 v0, v18

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;

    .line 750
    .restart local v17    # "rendition":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;
    move-object/from16 v0, v17

    invoke-virtual {v14, v0, v8}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->downloadRendition(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V

    goto :goto_9c

    .line 753
    .end local v17    # "rendition":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;
    :cond_f4
    const/4 v3, 0x0

    invoke-interface {v8, v3}, Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;->onCompletion(Ljava/lang/Object;)V

    goto :goto_9c

    .line 757
    .end local v18    # "renditions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;>;"
    :cond_f9
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$AdobeUXPhotoAssetViewerAdapter$AdobeUXPhotoAssetViewerAssetFragment$1VisibilityHandler;->isOffLineOrError(Z)V

    goto :goto_9c
.end method
