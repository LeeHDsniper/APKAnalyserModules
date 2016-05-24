.class final Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$9;
.super Ljava/lang/Object;
.source "AdobePhotoCollectionsDataSource.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/storage/IAdobePhotoAssetsListRequestCompletionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->getRenditionForCollection(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$collection:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

.field final synthetic val$downloadRenditionCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V
    .registers 3

    .prologue
    .line 253
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$9;->val$collection:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$9;->val$downloadRenditionCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Ljava/util/ArrayList;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;)V
    .registers 10
    .param p2, "previousPage"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;
    .param p3, "nextPage"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;",
            ">;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "assets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;>;"
    const/4 v5, 0x0

    .line 256
    if-eqz p1, :cond_2f

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x1

    if-lt v3, v4, :cond_2f

    .line 257
    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    .line 258
    .local v0, "asset":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$9;->val$collection:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

    invoke-virtual {v3, v0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->setCoverAsset(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;)V

    .line 260
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->getRenditions()Ljava/util/Map;

    move-result-object v2

    .line 261
    .local v2, "renditions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;>;"
    const-string v3, "thumbnail2x"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_3d

    .line 262
    const-string v3, "thumbnail2x"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;

    .line 264
    .local v1, "rendition":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$9;->val$downloadRenditionCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;

    invoke-virtual {v0, v1, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->downloadRendition(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V

    .line 270
    .end local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;
    .end local v1    # "rendition":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;
    .end local v2    # "renditions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;>;"
    :cond_2f
    :goto_2f
    if-eqz p1, :cond_3c

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-nez v3, :cond_3c

    .line 273
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$9;->val$downloadRenditionCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;

    invoke-interface {v3, v5}, Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;->onCompletion(Ljava/lang/Object;)V

    .line 276
    :cond_3c
    return-void

    .line 266
    .restart local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;
    .restart local v2    # "renditions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;>;"
    :cond_3d
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$9;->val$downloadRenditionCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;

    invoke-interface {v3, v5}, Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;->onCompletion(Ljava/lang/Object;)V

    goto :goto_2f
.end method
