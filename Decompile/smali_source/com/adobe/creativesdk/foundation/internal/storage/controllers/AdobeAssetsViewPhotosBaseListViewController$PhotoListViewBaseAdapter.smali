.class public abstract Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController$PhotoListViewBaseAdapter;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$AssetsListViewBaseAdapter;
.source "AdobeAssetsViewPhotosBaseListViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x404
    name = "PhotoListViewBaseAdapter"
.end annotation


# instance fields
.field _photoCollectionsList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController;Landroid/content/Context;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 171
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController$PhotoListViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController;

    .line 172
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$AssetsListViewBaseAdapter;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController;Landroid/content/Context;)V

    .line 173
    return-void
.end method


# virtual methods
.method protected createNewAssetCellView(Landroid/view/ViewGroup;I)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;
    .registers 6
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 270
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetGenericStaggeredCellView;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetGenericStaggeredCellView;-><init>()V

    .line 272
    .local v0, "staggeredCellView":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetGenericStaggeredCellView;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController$PhotoListViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController;->getHostActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_generic_staggered_assetviewcell:I

    invoke-virtual {v0, v1, v2, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetGenericStaggeredCellView;->initializeFromLayout(Landroid/view/LayoutInflater;ILandroid/view/ViewGroup;)V

    .line 275
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController$PhotoListViewBaseAdapter;->handleCellPostCreation(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetGenericStaggeredCellView;)V

    .line 276
    return-object v0
.end method

.method getAssetCellDataFromPhoto(Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;
    .registers 4
    .param p1, "photoItem"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;

    .prologue
    .line 192
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;-><init>()V

    .line 193
    .local v0, "assetData":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;
    iput-object p1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->originalAsset:Ljava/lang/Object;

    .line 194
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->getGUID()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->guid:Ljava/lang/String;

    .line 195
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController$PhotoListViewBaseAdapter;->getPhotoName(Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->title:Ljava/lang/String;

    .line 196
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->getCreationDate()Ljava/util/Date;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->creationDate:Ljava/util/Date;

    .line 197
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->getModificationDate()Ljava/util/Date;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->modificationDate:Ljava/util/Date;

    .line 198
    instance-of v1, p1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    if-eqz v1, :cond_2c

    check-cast p1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    .end local p1    # "photoItem":Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->getMetadata()Lorg/json/JSONObject;

    move-result-object v1

    :goto_29
    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->optionalMetadata:Lorg/json/JSONObject;

    .line 200
    return-object v0

    .line 198
    .restart local p1    # "photoItem":Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;
    :cond_2c
    const/4 v1, 0x0

    goto :goto_29
.end method

.method protected getAssetItemData(I)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;
    .registers 6
    .param p1, "position"    # I

    .prologue
    .line 205
    const/4 v0, 0x0

    .line 206
    .local v0, "assetData":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController$PhotoListViewBaseAdapter;->getPhotosList()Ljava/util/ArrayList;

    move-result-object v1

    .line 208
    .local v1, "photoCollectionsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;>;"
    if-eqz v1, :cond_19

    if-ltz p1, :cond_19

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge p1, v3, :cond_19

    .line 209
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;

    .line 210
    .local v2, "photoItem":Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;
    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController$PhotoListViewBaseAdapter;->getAssetCellDataFromPhoto(Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;

    move-result-object v0

    .line 212
    .end local v2    # "photoItem":Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;
    :cond_19
    return-object v0
.end method

.method protected getAssetsCount()I
    .registers 3

    .prologue
    .line 176
    const/4 v0, 0x0

    .line 177
    .local v0, "count":I
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController$PhotoListViewBaseAdapter;->getPhotosList()Ljava/util/ArrayList;

    move-result-object v1

    if-eqz v1, :cond_f

    .line 178
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController$PhotoListViewBaseAdapter;->getPhotosList()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 179
    :cond_f
    return v0
.end method

.method protected getPhotoName(Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;)Ljava/lang/String;
    .registers 4
    .param p1, "photo"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;

    .prologue
    .line 183
    const/4 v0, 0x0

    .line 184
    .local v0, "name":Ljava/lang/String;
    instance-of v1, p1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

    if-eqz v1, :cond_c

    .line 185
    check-cast p1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

    .end local p1    # "photo":Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->getName()Ljava/lang/String;

    move-result-object v0

    .line 188
    :cond_b
    :goto_b
    return-object v0

    .line 186
    .restart local p1    # "photo":Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;
    :cond_c
    instance-of v1, p1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    if-eqz v1, :cond_b

    .line 187
    check-cast p1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    .end local p1    # "photo":Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_b
.end method

.method protected abstract getPhotosList()Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;",
            ">;"
        }
    .end annotation
.end method

.method protected handleCellPostCreation(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetGenericStaggeredCellView;)V
    .registers 2
    .param p1, "cellView"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetGenericStaggeredCellView;

    .prologue
    .line 265
    return-void
.end method

.method protected invalidateAssetsList()V
    .registers 2

    .prologue
    .line 228
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController$PhotoListViewBaseAdapter;->_photoCollectionsList:Ljava/util/ArrayList;

    .line 229
    return-void
.end method

.method protected isAssetCellViewAlreadyRepresentAsset(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;)Z
    .registers 9
    .param p1, "assetCellView"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;
    .param p2, "asset"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;

    .prologue
    .line 233
    const/4 v2, 0x0

    .line 234
    .local v2, "isAssetCellSame":Z
    iget-object v5, p2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->originalAsset:Ljava/lang/Object;

    instance-of v5, v5, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    if-eqz v5, :cond_2d

    .line 236
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->getGuid()Ljava/lang/String;

    move-result-object v1

    .line 237
    .local v1, "cellViewGuid":Ljava/lang/String;
    iget-object v0, p2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->guid:Ljava/lang/String;

    .line 238
    .local v0, "assetGuid":Ljava/lang/String;
    if-eqz v1, :cond_2d

    if-eqz v0, :cond_2d

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2d

    .line 240
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->isMultiSelectModeActive()Z

    move-result v5

    if-eqz v5, :cond_2c

    .line 242
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->isMarkedSelected()Z

    move-result v4

    .line 243
    .local v4, "isCellViewSelected":Z
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController$PhotoListViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController;

    invoke-virtual {v5, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController;->isAssetSelected(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;)Z

    move-result v3

    .line 244
    .local v3, "isAssetSelected":Z
    if-eq v4, v3, :cond_2c

    .line 245
    invoke-virtual {p1, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->markSelected(Z)V

    .line 247
    .end local v3    # "isAssetSelected":Z
    .end local v4    # "isCellViewSelected":Z
    :cond_2c
    const/4 v2, 0x1

    .line 260
    .end local v0    # "assetGuid":Ljava/lang/String;
    .end local v1    # "cellViewGuid":Ljava/lang/String;
    :cond_2d
    return v2
.end method

.method protected isAssetHasThumbnail(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;)Z
    .registers 3
    .param p1, "asset"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;

    .prologue
    .line 223
    const/4 v0, 0x1

    return v0
.end method

.method protected isAssetSelectable(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;)Z
    .registers 3
    .param p1, "asset"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;

    .prologue
    .line 217
    const/4 v0, 0x0

    return v0
.end method
