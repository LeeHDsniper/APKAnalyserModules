.class public interface abstract Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;
.super Ljava/lang/Object;
.source "IAdobeStorageDataSourceDelegate.java"


# virtual methods
.method public abstract didClearFilterString()V
.end method

.method public abstract didFailToLoadMoreDataWithError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V
.end method

.method public abstract didLoadMoreDataWithCount(ILcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListSectionsIndexSet;Ljava/util/ArrayList;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListSectionsIndexSet;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListIndexPath;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract didSortByType(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;)V
.end method

.method public abstract didStartLoadingMorePagesToFilter()V
.end method

.method public abstract didStopLoadingMorePagesToFilter()V
.end method

.method public abstract startedLoadingMoreFolders()V
.end method

.method public abstract stoppedLoadingMoreFolders()V
.end method

.method public abstract willLoadDataFromScratch()V
.end method

.method public abstract willLoadNextPageForExistingCollection()V
.end method

.method public abstract willLoadNextPageForNonExistingCollection()V
.end method
