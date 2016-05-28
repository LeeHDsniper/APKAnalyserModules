.class public Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;
.super Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
.source "AdobeAssetLineFile.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 120
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;-><init>()V

    .line 123
    return-void
.end method

.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V
    .registers 3
    .param p1, "res"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .param p2, "resP"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    .prologue
    .line 116
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V

    .line 117
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    .line 108
    instance-of v0, p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;

    if-eqz v0, :cond_9

    .line 109
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 111
    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public loadMetadata(Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
    .registers 5
    .param p1, "successCallback"    # Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 42
    .local p2, "errorCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;>;"
    move-object v1, p0

    .line 44
    .local v1, "that":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile$1;

    invoke-direct {v0, p0, v1, p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile$1;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;)V

    .line 101
    .local v0, "inSuccessCallback":Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;
    invoke-super {p0, v0, p2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->loadMetadata(Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    .line 102
    return-void
.end method
