.class public interface abstract Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoCollectionsDataSourceDelegate;
.super Ljava/lang/Object;
.source "IAdobePhotoCollectionsDataSourceDelegate.java"


# virtual methods
.method public abstract loadCatalogFailed(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V
.end method

.method public abstract loadCatalogSucceeded(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;)V
.end method

.method public abstract loadFirstPageFailed(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V
.end method

.method public abstract loadFirstPageSucceeded()V
.end method

.method public abstract loadNextPageOfDataFailed(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V
.end method

.method public abstract loadNextPageOfDataSucceeded()V
.end method

.method public abstract willLoadCatalog()V
.end method

.method public abstract willLoadFirstPage()V
.end method

.method public abstract willLoadNextPage()V
.end method
