.class public Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;
.super Ljava/lang/Object;
.source "AdobeAssetDataSource.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSource;


# static fields
.field private static kAssetDataSourceItemsPerPageLimit:I


# instance fields
.field private _cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

.field data:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;",
            ">;"
        }
    .end annotation
.end field

.field dataSourceType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

.field private delegate:Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;

.field loadingItems:Z

.field loadingItemsFromScratch:Z

.field private targetFolder:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 66
    const/16 v0, 0x14

    sput v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->kAssetDataSourceItemsPerPageLimit:I

    return-void
.end method

.method public constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V
    .registers 3
    .param p1, "dataSourceType"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;
    .param p2, "cloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .prologue
    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->dataSourceType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    .line 92
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 93
    return-void
.end method


# virtual methods
.method public assetsToDisplay()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;",
            ">;"
        }
    .end annotation

    .prologue
    .line 103
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getCount()I
    .registers 2

    .prologue
    .line 353
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->data:Ljava/util/ArrayList;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->data:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getDelegate()Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;
    .registers 2

    .prologue
    .line 69
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->delegate:Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;

    return-object v0
.end method

.method public getTargetFolder()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .registers 2

    .prologue
    .line 77
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->targetFolder:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    return-object v0
.end method

.method public loadItemsFromScratch()Z
    .registers 2

    .prologue
    .line 358
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->loadItemsFromScratch(Z)Z

    move-result v0

    return v0
.end method

.method public loadItemsFromScratch(Z)Z
    .registers 7
    .param p1, "fromScratch"    # Z

    .prologue
    .line 115
    iget-boolean v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->loadingItems:Z

    if-eqz v2, :cond_6

    .line 118
    const/4 v2, 0x0

    .line 185
    :goto_5
    return v2

    .line 121
    :cond_6
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->targetFolder:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    if-eqz v2, :cond_41

    .line 123
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->loadingItemsFromScratch:Z

    .line 124
    if-eqz p1, :cond_20

    .line 127
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->targetFolder:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    sget-object v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;->ADOBE_ASSET_FOLDER_ORDER_BY_MODIFIED:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;

    sget-object v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;->ADOBE_ASSET_FOLDER_ORDER_DESCENDING:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;

    invoke-virtual {v2, v3, v4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->resetPagingOrderedByField(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;)V

    .line 130
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->getDelegate()Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;

    move-result-object v0

    .line 131
    .local v0, "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;
    if-eqz v0, :cond_20

    .line 132
    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;->willLoadDataFromScratch()V

    .line 134
    .end local v0    # "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;
    :cond_20
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->targetFolder:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->hasNextPage()Z

    move-result v2

    if-eqz v2, :cond_36

    .line 136
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->getDelegate()Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;

    move-result-object v0

    .line 137
    .restart local v0    # "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;
    if-eqz v0, :cond_31

    .line 138
    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;->willLoadNextPageForExistingPackage()V

    .line 140
    :cond_31
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->loadNextPage()Z

    move-result v2

    goto :goto_5

    .line 143
    .end local v0    # "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;
    :cond_36
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->getDelegate()Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;

    move-result-object v0

    .line 144
    .restart local v0    # "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;
    if-eqz v0, :cond_3f

    .line 145
    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;->didFinishLoading()V

    .line 185
    :cond_3f
    const/4 v2, 0x1

    goto :goto_5

    .line 150
    .end local v0    # "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;
    :cond_41
    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;->AdobeAssetProductUndefined:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    .line 151
    .local v1, "product":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->dataSourceType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    sget-object v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceDraw:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_67

    .line 153
    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;->AdobeAssetProductDraw:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    .line 176
    :cond_4f
    :goto_4f
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    invoke-static {v1, v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->getRootForProduct(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->targetFolder:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    .line 177
    if-eqz p1, :cond_62

    .line 178
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->getDelegate()Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;

    move-result-object v0

    .line 179
    .restart local v0    # "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;
    if-eqz v0, :cond_62

    .line 180
    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;->willLoadDataFromScratch()V

    .line 183
    .end local v0    # "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;
    :cond_62
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->loadNextPage()Z

    move-result v2

    goto :goto_5

    .line 155
    :cond_67
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->dataSourceType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    sget-object v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceSketches:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_74

    .line 157
    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;->AdobeAssetProductSketch:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    goto :goto_4f

    .line 159
    :cond_74
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->dataSourceType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    sget-object v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceLine:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_81

    .line 161
    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;->AdobeAssetProductLine:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    goto :goto_4f

    .line 163
    :cond_81
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->dataSourceType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    sget-object v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceLibrary:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8e

    .line 165
    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;->AdobeAssetProductLibrary:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    goto :goto_4f

    .line 167
    :cond_8e
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->dataSourceType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    sget-object v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourcePSMix:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9b

    .line 169
    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;->AdobeAssetProductPSMix:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    goto :goto_4f

    .line 171
    :cond_9b
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->dataSourceType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    sget-object v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceCompositions:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4f

    .line 173
    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;->AdobeAssetProductComposition:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;

    goto :goto_4f
.end method

.method public loadNextPage()Z
    .registers 8

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 195
    iget-boolean v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->loadingItems:Z

    if-eqz v6, :cond_7

    .line 347
    :cond_6
    :goto_6
    return v4

    .line 200
    :cond_7
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->targetFolder:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->hasNextPage()Z

    move-result v6

    if-nez v6, :cond_19

    .line 202
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->getDelegate()Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;

    move-result-object v0

    .line 203
    .local v0, "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;
    if-eqz v0, :cond_6

    .line 204
    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;->didFinishLoading()V

    goto :goto_6

    .line 210
    .end local v0    # "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;
    :cond_19
    iput-boolean v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->loadingItems:Z

    .line 212
    const/4 v2, 0x0

    .line 214
    .local v2, "pageLimit":I
    if-nez v2, :cond_31

    .line 216
    sget v2, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->kAssetDataSourceItemsPerPageLimit:I

    .line 223
    :cond_20
    :goto_20
    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-direct {v3, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 225
    .local v3, "weakThis":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;>;"
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;

    invoke-direct {v1, p0, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;Ljava/lang/ref/WeakReference;)V

    .line 344
    .local v1, "nextPageCallback":Lcom/adobe/creativesdk/foundation/storage/IAdobeAssetFolderNextPageCallback;
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->targetFolder:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    invoke-virtual {v4, v2, v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getNextPage(ILcom/adobe/creativesdk/foundation/storage/IAdobeAssetFolderNextPageCallback;)V

    move v4, v5

    .line 347
    goto :goto_6

    .line 218
    .end local v1    # "nextPageCallback":Lcom/adobe/creativesdk/foundation/storage/IAdobeAssetFolderNextPageCallback;
    .end local v3    # "weakThis":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;>;"
    :cond_31
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->targetFolder:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    instance-of v4, v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    if-eqz v4, :cond_20

    .line 220
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->targetFolder:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    check-cast v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->count()I

    move-result v2

    goto :goto_20
.end method

.method public loadNextPageOfData()V
    .registers 1

    .prologue
    .line 363
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->loadNextPage()Z

    .line 364
    return-void
.end method

.method public resetDelegate()V
    .registers 2

    .prologue
    .line 368
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->setDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;)V

    .line 369
    return-void
.end method

.method public setDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;)V
    .registers 2
    .param p1, "delegate"    # Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;

    .prologue
    .line 73
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->delegate:Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;

    .line 74
    return-void
.end method
