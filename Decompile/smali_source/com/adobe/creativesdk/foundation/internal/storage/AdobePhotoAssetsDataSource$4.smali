.class Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$4;
.super Ljava/lang/Object;
.source "AdobePhotoAssetsDataSource.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->loadFirstPage()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback",
        "<",
        "Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    .prologue
    .line 151
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V
    .registers 4
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    .prologue
    .line 154
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    const/4 v1, 0x1

    # setter for: Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_queryForMoreData:Z
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->access$402(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;Z)Z

    .line 156
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_delegate:Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoAssetsDataSourceDelegate;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->access$500(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;)Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoAssetsDataSourceDelegate;

    move-result-object v0

    if-eqz v0, :cond_17

    .line 157
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_delegate:Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoAssetsDataSourceDelegate;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->access$500(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;)Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoAssetsDataSourceDelegate;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoAssetsDataSourceDelegate;->loadFirstPageFailed(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V

    .line 159
    :cond_17
    return-void
.end method

.method public bridge synthetic onError(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 151
    check-cast p1, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$4;->onError(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V

    return-void
.end method
