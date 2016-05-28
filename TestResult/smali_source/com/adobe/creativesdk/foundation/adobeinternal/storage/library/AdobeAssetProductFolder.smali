.class public Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;
.super Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
.source "AdobeAssetProductFolder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder$2;
    }
.end annotation


# direct methods
.method protected constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;Ljava/net/URI;)V
    .registers 5
    .param p1, "collection"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .param p2, "field"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;
    .param p3, "direction"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;
    .param p4, "parentHref"    # Ljava/net/URI;

    .prologue
    .line 87
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;Ljava/net/URI;)V

    .line 88
    return-void
.end method

.method static synthetic access$002(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    .prologue
    .line 76
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->asrCollection:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    return-object p1
.end method

.method static synthetic access$102(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;
    .param p1, "x1"    # Z

    .prologue
    .line 76
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->firstPageLoaded:Z

    return p1
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;

    .prologue
    .line 76
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->resourceCollection()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;

    .prologue
    .line 76
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->resourceCollection()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;

    .prologue
    .line 76
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->resourceCollection()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;

    .prologue
    .line 76
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->resourceCollection()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;

    .prologue
    .line 76
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->resourceCollection()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;

    .prologue
    .line 76
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->resourceCollection()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$800(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;

    .prologue
    .line 76
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->resourceCollection()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v0

    return-object v0
.end method

.method public static getRootForProduct(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;
    .registers 4
    .param p0, "product"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;
    .param p1, "cloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .prologue
    .line 91
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;->ADOBE_ASSET_FOLDER_ORDER_BY_MODIFIED:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;->ADOBE_ASSET_FOLDER_ORDER_DESCENDING:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;

    invoke-static {p0, p1, v0, v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->getRootForProduct(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;

    move-result-object v0

    return-object v0
.end method

.method public static getRootForProduct(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;
    .registers 10
    .param p0, "product"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;
    .param p1, "cloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .param p2, "field"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;
    .param p3, "direction"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;

    .prologue
    const/4 v2, 0x0

    .line 97
    if-nez p0, :cond_d

    .line 98
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v4, "AdobeAssetProductFolder.getRootForProduct"

    const-string v5, "AdobeAssetProduct enum is null"

    invoke-static {v3, v4, v5}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    :goto_c
    return-object v2

    .line 102
    :cond_d
    const-string v1, ""

    .line 104
    .local v1, "productID":Ljava/lang/String;
    sget-object v3, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder$2;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$storage$library$AdobeAssetProduct:[I

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProduct;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_5c

    .line 133
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v4, "AdobeAssetProductFolder.getRootForProduct"

    const-string v5, "Undefined product."

    invoke-static {v3, v4, v5}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    :goto_23
    const-string v3, "/assets/%s/"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v3

    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->collectionFromHref(Ljava/net/URI;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v0

    .line 138
    .local v0, "collection":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 140
    new-instance v3, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;

    invoke-static {p2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getStorageOrderByProperty(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;

    move-result-object v4

    invoke-static {p3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getStorageOrderRelation(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;

    move-result-object v5

    invoke-direct {v3, v0, v4, v5, v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;Ljava/net/URI;)V

    move-object v2, v3

    goto :goto_c

    .line 107
    .end local v0    # "collection":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    :pswitch_49
    const-string v1, "adobedraw"

    .line 108
    goto :goto_23

    .line 111
    :pswitch_4c
    const-string v1, "adobe-libraries"

    .line 112
    goto :goto_23

    .line 115
    :pswitch_4f
    const-string v1, "adobe-line"

    .line 116
    goto :goto_23

    .line 119
    :pswitch_52
    const-string v1, "adobesketch"

    .line 120
    goto :goto_23

    .line 123
    :pswitch_55
    const-string v1, "adobe-psmix"

    .line 124
    goto :goto_23

    .line 127
    :pswitch_58
    const-string v1, "adobe-layup"

    .line 128
    goto :goto_23

    .line 104
    nop

    :pswitch_data_5c
    .packed-switch 0x1
        :pswitch_49
        :pswitch_4c
        :pswitch_4f
        :pswitch_52
        :pswitch_55
        :pswitch_58
    .end packed-switch
.end method


# virtual methods
.method public getNextPage(ILcom/adobe/creativesdk/foundation/storage/IAdobeAssetFolderNextPageCallback;)V
    .registers 8
    .param p1, "pageSize"    # I
    .param p2, "nextPageDelegate"    # Lcom/adobe/creativesdk/foundation/storage/IAdobeAssetFolderNextPageCallback;

    .prologue
    .line 228
    move-object v1, p0

    .line 229
    .local v1, "self":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->resourceCollection()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->setLimit(I)V

    .line 233
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->resourceCollection()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v3

    const/4 v4, 0x0

    iput-object v4, v3, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->etag:Ljava/lang/String;

    .line 235
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder$1;

    invoke-direct {v0, p0, v1, p2}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder$1;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;Lcom/adobe/creativesdk/foundation/storage/IAdobeAssetFolderNextPageCallback;)V

    .line 341
    .local v0, "completionHandler":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->getSession()Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    move-result-object v2

    .line 342
    .local v2, "session":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;
    if-nez v2, :cond_1b

    .line 353
    :goto_1a
    return-void

    .line 345
    :cond_1b
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->resourceCollection()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v4

    iget-boolean v3, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetProductFolder;->firstPageLoaded:Z

    if-eqz v3, :cond_29

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;->AdobeStorageNextPageReplace:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;

    :goto_25
    invoke-virtual {v2, v4, v3, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getDirectory(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    goto :goto_1a

    :cond_29
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;->AdobeStorageFirstPage:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;

    goto :goto_25
.end method
