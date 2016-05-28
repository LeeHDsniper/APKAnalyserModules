.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotosViewContainerConfiguration;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;
.source "AdobePhotosViewContainerConfiguration.java"


# instance fields
.field private getTargetCollectionCatalogGuid:Ljava/lang/String;

.field private getTargetCollectionCatalogName:Ljava/lang/String;

.field private targetCollectionGUID:Ljava/lang/String;

.field private targetCollectionName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 8
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromBundle(Landroid/os/Bundle;)V
    .registers 3
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 37
    if-nez p1, :cond_3

    .line 46
    :goto_2
    return-void

    .line 40
    :cond_3
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;->createFromBundle(Landroid/os/Bundle;)V

    .line 42
    const-string v0, "ASSET_CONTAINER_TARGET_COLLECTION_GUID"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotosViewContainerConfiguration;->targetCollectionGUID:Ljava/lang/String;

    .line 43
    const-string v0, "ASSET_CONTAINER_TARGET_COLLECTION_NAME"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotosViewContainerConfiguration;->targetCollectionName:Ljava/lang/String;

    .line 44
    const-string v0, "ASSET_CONTAINER_TARGET_COLLECTION_CATALOG_GUID"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotosViewContainerConfiguration;->getTargetCollectionCatalogGuid:Ljava/lang/String;

    .line 45
    const-string v0, "ASSET_CONTAINER_TARGET_COLLECTION_CATALOG_NAME"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotosViewContainerConfiguration;->getTargetCollectionCatalogName:Ljava/lang/String;

    goto :goto_2
.end method

.method public getTargetCollectionCatalogGUID()Ljava/lang/String;
    .registers 2

    .prologue
    .line 28
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotosViewContainerConfiguration;->getTargetCollectionCatalogGuid:Ljava/lang/String;

    return-object v0
.end method

.method public getTargetCollectionCatalogName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 31
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotosViewContainerConfiguration;->getTargetCollectionCatalogName:Ljava/lang/String;

    return-object v0
.end method

.method public getTargetCollectionGUID()Ljava/lang/String;
    .registers 2

    .prologue
    .line 22
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotosViewContainerConfiguration;->targetCollectionGUID:Ljava/lang/String;

    return-object v0
.end method

.method public getTargetCollectionName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 25
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotosViewContainerConfiguration;->targetCollectionName:Ljava/lang/String;

    return-object v0
.end method
