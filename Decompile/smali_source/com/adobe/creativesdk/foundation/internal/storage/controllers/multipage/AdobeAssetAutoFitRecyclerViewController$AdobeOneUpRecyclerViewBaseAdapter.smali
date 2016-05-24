.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "AdobeAssetAutoFitRecyclerViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "AdobeOneUpRecyclerViewBaseAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$AdobeOneUpRecyclerCellViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter",
        "<",
        "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;


# direct methods
.method protected constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    .prologue
    .line 292
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 406
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .registers 6

    .prologue
    .line 390
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;->_asset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    instance-of v1, v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    if-eqz v1, :cond_28

    .line 391
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    iget-object v0, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;->_asset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .line 392
    .local v0, "assetFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getOptionalMetadata()Lorg/json/JSONObject;

    move-result-object v1

    if-eqz v1, :cond_23

    .line 393
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getOptionalMetadata()Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "pages"

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;->num_pages:I

    .line 395
    :cond_23
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    iget v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;->num_pages:I

    .line 397
    .end local v0    # "assetFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    :goto_27
    return v1

    :cond_28
    const/4 v1, -0x1

    goto :goto_27
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .registers 11
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    const/4 v6, 0x0

    .line 327
    check-cast p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$AdobeOneUpRecyclerCellViewHolder;

    .end local p1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$AdobeOneUpRecyclerCellViewHolder;->getCellView()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;

    move-result-object v1

    .line 329
    .local v1, "cellView":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;
    invoke-virtual {v1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->setCellPos(I)V

    .line 330
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->prepareForReuse()V

    .line 333
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->getRootView()Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5, v6, v6}, Landroid/view/View;->measure(II)V

    .line 334
    new-instance v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->getRootView()Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->getRootView()Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    move-result v6

    int-to-float v6, v6

    invoke-direct {v2, v5, v6}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;-><init>(FF)V

    .line 336
    .local v2, "dimension":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    iget-object v5, v5, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;->_asset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    instance-of v5, v5, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    if-eqz v5, :cond_7b

    .line 338
    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$1;

    invoke-direct {v3, p0, v1, v2, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;I)V

    .line 362
    .local v3, "rendDelegate":Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;, "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback<[BLcom/adobe/creativesdk/foundation/storage/AdobeAssetException;>;"
    const/4 v4, 0x1

    .line 363
    .local v4, "shouldLoadFromFile":Z
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;->isReusableWorkerValid()Z
    invoke-static {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;)Z

    move-result v5

    if-eqz v5, :cond_6e

    .line 364
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;->_reusableBitmapCacheWorker:Ljava/lang/ref/WeakReference;
    invoke-static {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;->access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;)Ljava/lang/ref/WeakReference;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    iget-object v6, v6, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;->_asset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    sget-object v7, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ADOBE_ASSET_FILE_RENDITION_TYPE_PNG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    invoke-static {v6, v7, v2, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->cacheKeyForAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->loadImage(Ljava/lang/String;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v0

    .line 366
    .local v0, "bitmapDrawable":Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v0, :cond_6e

    .line 367
    invoke-virtual {v1, v0, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->displayThumbnail(Landroid/graphics/drawable/BitmapDrawable;I)V

    .line 368
    const/4 v4, 0x0

    .line 370
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    const/4 v6, 0x1

    iput-boolean v6, v5, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;->_areCellsVisible:Z

    .line 371
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    iget-object v5, v5, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;->_spinner:Landroid/view/View;

    const/4 v6, 0x4

    invoke-virtual {v5, v6}, Landroid/view/View;->setVisibility(I)V

    .line 375
    .end local v0    # "bitmapDrawable":Landroid/graphics/drawable/BitmapDrawable;
    :cond_6e
    if-eqz v4, :cond_7b

    .line 377
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    iget-object v5, v5, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;->_asset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    check-cast v5, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    sget-object v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ADOBE_ASSET_FILE_RENDITION_TYPE_PNG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    invoke-virtual {v5, v6, v2, p2, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getRenditionWithType(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;ILcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V

    .line 382
    .end local v3    # "rendDelegate":Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;, "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback<[BLcom/adobe/creativesdk/foundation/storage/AdobeAssetException;>;"
    .end local v4    # "shouldLoadFromFile":Z
    :cond_7b
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 4

    .prologue
    .line 292
    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$AdobeOneUpRecyclerCellViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$AdobeOneUpRecyclerCellViewHolder;
    .registers 8
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 300
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_multipage_autorecycler_cellview:I

    const/4 v4, 0x0

    invoke-virtual {v2, v3, p1, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 309
    .local v0, "v":Landroid/view/View;
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$AdobeOneUpRecyclerCellViewHolder;

    invoke-direct {v1, p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$AdobeOneUpRecyclerCellViewHolder;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;Landroid/view/View;)V

    .line 311
    .local v1, "vh":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$AdobeOneUpRecyclerCellViewHolder;
    return-object v1
.end method
