.class Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$6;
.super Ljava/lang/Object;
.source "AdobePhotoAssetsDataSource.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->loadAssetsOnPage(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobePhotoSortType;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
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

.field final synthetic val$errorCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    .prologue
    .line 232
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$6;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$6;->val$errorCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V
    .registers 5
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    .prologue
    .line 235
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$6;->val$errorCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    if-eqz v0, :cond_a

    .line 236
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$6;->val$errorCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;->onError(Ljava/lang/Object;)V

    .line 242
    :goto_9
    return-void

    .line 240
    :cond_a
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Failed to retrieve the assets."

    invoke-static {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_9
.end method

.method public bridge synthetic onError(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 232
    check-cast p1, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$6;->onError(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V

    return-void
.end method
