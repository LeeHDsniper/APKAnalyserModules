.class public interface abstract Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;
.super Ljava/lang/Object;
.source "IAdobeAssetDataSourceDelegate.java"


# virtual methods
.method public abstract didFailToLoadMoreDataWithError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V
.end method

.method public abstract didFinishLoading()V
.end method

.method public abstract didLoadMoreDataWithCount(I)V
.end method

.method public abstract willLoadDataFromScratch()V
.end method

.method public abstract willLoadNextPageForExistingPackage()V
.end method
