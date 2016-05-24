.class public Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetLibraryInternal;
.super Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;
.source "AdobeAssetLibraryInternal.java"


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V
    .registers 3
    .param p1, "asrc"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .param p2, "adobeStorageResourceCollection"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    .prologue
    .line 25
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V

    .line 26
    return-void
.end method


# virtual methods
.method public setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V
    .registers 2
    .param p1, "cloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .prologue
    .line 30
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 31
    return-void
.end method
