.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;
.super Landroid/support/v4/app/Fragment;
.source "AdobeUXAssetOneUpViewerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AdobeUXAssetViewerAssetFragment"
.end annotation


# instance fields
.field private _commentCountObserver:Ljava/util/Observer;

.field private _network_reachability_observer:Ljava/util/Observer;

.field fragmentController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;

.field mNum:I

.field num_pages:I

.field singlePageAssetController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 711
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 778
    const/4 v0, 0x1

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->num_pages:I

    return-void
.end method

.method private checkPageCount(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)I
    .registers 6
    .param p1, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .prologue
    .line 763
    instance-of v1, p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    if-eqz v1, :cond_1d

    move-object v0, p1

    .line 764
    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .line 765
    .local v0, "assetFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getOptionalMetadata()Lorg/json/JSONObject;

    move-result-object v1

    if-eqz v1, :cond_1a

    .line 766
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getOptionalMetadata()Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "pages"

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->num_pages:I

    .line 768
    :cond_1a
    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->num_pages:I

    .line 771
    .end local v0    # "assetFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    :goto_1c
    return v1

    :cond_1d
    const/4 v1, 0x0

    goto :goto_1c
.end method

.method static newInstance(I)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;
    .registers 4
    .param p0, "num"    # I

    .prologue
    .line 720
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;

    invoke-direct {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;-><init>()V

    .line 723
    .local v1, "f":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 724
    .local v0, "args":Landroid/os/Bundle;
    const-string v2, "num"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 725
    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->setArguments(Landroid/os/Bundle;)V

    .line 727
    return-object v1
.end method


# virtual methods
.method getReusableImageWorker()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;
    .registers 3

    .prologue
    .line 781
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;

    .line 782
    .local v0, "oneUpViewerActivity":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;
    const/4 v1, 0x0

    .line 783
    .local v1, "worker":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;
    if-eqz v0, :cond_d

    .line 784
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->getReusableBitmapCacheWorker()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    move-result-object v1

    .line 786
    :cond_d
    return-object v1
.end method

.method public handleBackPressed()Z
    .registers 4

    .prologue
    const/4 v0, 0x1

    .line 849
    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->num_pages:I

    if-le v1, v0, :cond_2f

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->fragmentController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->getState()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;->AdobeMultiPageViewPager:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    if-ne v1, v2, :cond_2f

    .line 851
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->fragmentController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->getPreviousState()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;->AdobeMultiPageGridView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    if-ne v1, v2, :cond_1f

    .line 852
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->fragmentController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->displayGridView()V

    .line 858
    :cond_1e
    :goto_1e
    return v0

    .line 853
    :cond_1f
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->fragmentController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->getPreviousState()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;->AdobeMultiPageListView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    if-ne v1, v2, :cond_1e

    .line 854
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->fragmentController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->displayListView()V

    goto :goto_1e

    .line 858
    :cond_2f
    const/4 v0, 0x0

    goto :goto_1e
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 3
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 866
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->fragmentController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;

    if-eqz v0, :cond_9

    .line 867
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->fragmentController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->handleOrientationChange()V

    .line 868
    :cond_9
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 870
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 735
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 736
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_16

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "num"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    :goto_13
    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->mNum:I

    .line 740
    return-void

    .line 736
    :cond_16
    const/4 v0, 0x1

    goto :goto_13
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 11
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v6, 0x0

    .line 795
    const/4 v1, 0x0

    .line 798
    .local v1, "imageView":Landroid/view/View;
    iget v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->mNum:I

    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getAssetAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    move-result-object v0

    .line 799
    .local v0, "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->checkPageCount(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)I

    move-result v4

    iput v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->num_pages:I

    .line 803
    iget v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->num_pages:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_68

    .line 804
    sget v4, Lcom/adobe/creativesdk/foundation/assets/R$layout;->fragment_asset_image:I

    invoke-virtual {p1, v4, p2, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    .line 805
    .local v3, "rootView":Landroid/view/View;
    sget v4, Lcom/adobe/creativesdk/foundation/assets/R$id;->asset_image_view:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 806
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;

    invoke-direct {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;-><init>()V

    iput-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->singlePageAssetController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;

    .line 807
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->singlePageAssetController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->getReusableImageWorker()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->setReuseableBitmapCacheWorker(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;)V

    .line 808
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->singlePageAssetController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;

    invoke-virtual {v4, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->setMainRootView(Landroid/view/View;)V

    .line 809
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->singlePageAssetController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;

    invoke-virtual {v4, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->setAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)V

    .line 810
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->singlePageAssetController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;

    iget v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->mNum:I

    invoke-virtual {v4, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->setCurrentAssetPos(I)V

    .line 811
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->singlePageAssetController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->performInitialization(Landroid/content/Context;)V

    .line 812
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->singlePageAssetController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->initiateDisplay()V

    .line 830
    :goto_4e
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment$1;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;)V

    .line 839
    .local v2, "mPagerOnLongClickListener":Landroid/view/View$OnLongClickListener;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->isMenuEnabled()Z

    move-result v4

    if-eqz v4, :cond_5e

    if-eqz v1, :cond_5e

    .line 840
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 842
    :cond_5e
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    check-cast v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->setShareIntent()V
    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;)V

    .line 843
    return-object v3

    .line 818
    .end local v2    # "mPagerOnLongClickListener":Landroid/view/View$OnLongClickListener;
    .end local v3    # "rootView":Landroid/view/View;
    :cond_68
    sget v4, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_multipage_fragment_controller:I

    invoke-virtual {p1, v4, p2, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    .line 819
    .restart local v3    # "rootView":Landroid/view/View;
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;

    invoke-direct {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;-><init>()V

    iput-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->fragmentController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;

    .line 820
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->fragmentController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;

    invoke-virtual {v4, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->setFragmentView(Landroid/view/View;)V

    .line 821
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->fragmentController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;

    invoke-virtual {v4, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->setAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)V

    .line 822
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->fragmentController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;

    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;->AdobeMultiPageGridView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    invoke-virtual {v4, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->setState(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;)V

    .line 823
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->fragmentController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->performInitiallization(Landroid/content/Context;)V

    .line 824
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->fragmentController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->getReusableImageWorker()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->setReuseableBitmapCacheWorker(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;)V

    .line 825
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->fragmentController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->provideViewToActivity()Landroid/view/View;

    goto :goto_4e
.end method

.method public onDestroyView()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 745
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDestroyView()V

    .line 747
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->singlePageAssetController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;

    if-eqz v0, :cond_15

    .line 748
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->singlePageAssetController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->cancelAnyOneUpImageOperation()V

    .line 749
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->singlePageAssetController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->setMainRootView(Landroid/view/View;)V

    .line 750
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->singlePageAssetController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;

    .line 755
    :cond_14
    :goto_14
    return-void

    .line 752
    :cond_15
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->fragmentController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;

    if-eqz v0, :cond_14

    goto :goto_14
.end method

.method public onStart()V
    .registers 1

    .prologue
    .line 874
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStart()V

    .line 876
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->registerLocalNofications()V

    .line 878
    return-void
.end method

.method public onStop()V
    .registers 1

    .prologue
    .line 882
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStop()V

    .line 883
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->unRegisterLocalNotifications()V

    .line 884
    return-void
.end method

.method public registerLocalNofications()V
    .registers 4

    .prologue
    .line 888
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->_network_reachability_observer:Ljava/util/Observer;

    if-nez v0, :cond_b

    .line 889
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment$2;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->_network_reachability_observer:Ljava/util/Observer;

    .line 912
    :cond_b
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->_commentCountObserver:Ljava/util/Observer;

    if-nez v0, :cond_16

    .line 914
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment$3;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment$3;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->_commentCountObserver:Ljava/util/Observer;

    .line 937
    :cond_16
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeNetworkStatusChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->_network_reachability_observer:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 939
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeCCFilesNotificationRefreshCommentCount:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->_commentCountObserver:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 943
    return-void
.end method

.method public unRegisterLocalNotifications()V
    .registers 4

    .prologue
    .line 949
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeNetworkStatusChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->_network_reachability_observer:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->removeObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 951
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeCCFilesNotificationRefreshCommentCount:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->_commentCountObserver:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->removeObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 953
    return-void
.end method
