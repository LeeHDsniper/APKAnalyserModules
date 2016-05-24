.class Lcom/adobe/creativesdk/foundation/internal/storage/DataSourceDelegate;
.super Ljava/lang/Object;
.source "DataSourceDelegate.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;


# instance fields
.field private _type:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;)V
    .registers 2
    .param p1, "type"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/DataSourceDelegate;->_type:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    .line 57
    return-void
.end method


# virtual methods
.method public didFailToLoadMoreDataWithError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V
    .registers 2
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    .prologue
    .line 77
    return-void
.end method

.method public didFinishLoading()V
    .registers 3

    .prologue
    .line 81
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;

    move-result-object v0

    if-eqz v0, :cond_f

    .line 82
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/DataSourceDelegate;->_type:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->notifyDataSourceIsReady(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;)V

    .line 84
    :cond_f
    return-void
.end method

.method public didLoadMoreDataWithCount(I)V
    .registers 2
    .param p1, "count"    # I

    .prologue
    .line 72
    return-void
.end method

.method public willLoadDataFromScratch()V
    .registers 1

    .prologue
    .line 62
    return-void
.end method

.method public willLoadNextPageForExistingPackage()V
    .registers 1

    .prologue
    .line 67
    return-void
.end method
