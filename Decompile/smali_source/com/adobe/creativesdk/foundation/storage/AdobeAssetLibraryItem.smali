.class public Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
.super Ljava/lang/Object;
.source "AdobeAssetLibraryItem.java"


# instance fields
.field protected creationDate:Ljava/util/Date;

.field protected itemID:Ljava/lang/String;

.field protected library:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;",
            ">;"
        }
    .end annotation
.end field

.field protected modificationDate:Ljava/util/Date;

.field protected name:Ljava/lang/String;

.field protected renditionName:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)V
    .registers 11
    .param p1, "node"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    .param p2, "renditionName"    # Ljava/lang/String;
    .param p3, "library"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    .prologue
    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 110
    const-string v6, "library#created"

    invoke-virtual {p1, v6}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXUtils;->getLongVal(Ljava/lang/Object;)J

    move-result-wide v2

    .line 111
    .local v2, "creationVal":J
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    .line 112
    .local v0, "creationDate":Ljava/util/Date;
    const-string v6, "library#modified"

    invoke-virtual {p1, v6}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXUtils;->getLongVal(Ljava/lang/Object;)J

    move-result-wide v4

    .line 113
    .local v4, "modificationVal":J
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1, v4, v5}, Ljava/util/Date;-><init>(J)V

    .line 114
    .local v1, "modificationDate":Ljava/util/Date;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getName()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;->name:Ljava/lang/String;

    .line 115
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;->renditionName:Ljava/lang/String;

    .line 116
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;->getNodeId()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;->itemID:Ljava/lang/String;

    .line 117
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;->creationDate:Ljava/util/Date;

    .line 118
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;->modificationDate:Ljava/util/Date;

    .line 119
    new-instance v6, Ljava/lang/ref/WeakReference;

    invoke-direct {v6, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v6, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;->library:Ljava/lang/ref/WeakReference;

    .line 121
    return-void
.end method


# virtual methods
.method public getItemID()Ljava/lang/String;
    .registers 2

    .prologue
    .line 51
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;->itemID:Ljava/lang/String;

    return-object v0
.end method

.method public getLibrary()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;
    .registers 2

    .prologue
    .line 63
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;->library:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 47
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;->name:Ljava/lang/String;

    return-object v0
.end method

.method public nameOrIdForDisplay()Ljava/lang/String;
    .registers 2

    .prologue
    .line 125
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;->name:Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 127
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;->name:Ljava/lang/String;

    .line 135
    :goto_6
    return-object v0

    .line 129
    :cond_7
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;->renditionName:Ljava/lang/String;

    if-eqz v0, :cond_e

    .line 131
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;->renditionName:Ljava/lang/String;

    goto :goto_6

    .line 135
    :cond_e
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;->itemID:Ljava/lang/String;

    goto :goto_6
.end method
