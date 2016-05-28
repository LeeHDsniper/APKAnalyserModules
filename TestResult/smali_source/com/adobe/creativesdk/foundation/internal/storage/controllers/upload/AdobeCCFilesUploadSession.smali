.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;
.super Ljava/lang/Object;
.source "AdobeCCFilesUploadSession.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession$1;,
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession$UploadSummary;,
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession$ObservableWrapper;
    }
.end annotation


# static fields
.field private static _sUploadAssetUniqueIdCount:I


# instance fields
.field private _allAssetsUploadObservers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession$ObservableWrapper;",
            ">;"
        }
    .end annotation
.end field

.field private _assetsList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;",
            ">;"
        }
    .end annotation
.end field

.field private _destinationFolder:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

.field private _uploadSummary:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession$UploadSummary;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 32
    const v0, 0x12d681

    sput v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;->_sUploadAssetUniqueIdCount:I

    return-void
.end method


# virtual methods
.method public addObserverForAssetUpload(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;Ljava/util/Observer;)V
    .registers 6
    .param p1, "assetData"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;
    .param p2, "observer"    # Ljava/util/Observer;

    .prologue
    .line 147
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;->_allAssetsUploadObservers:Ljava/util/Map;

    iget-object v2, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;->guid:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession$ObservableWrapper;

    .line 148
    .local v0, "assetObservers":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession$ObservableWrapper;
    if-nez v0, :cond_19

    .line 149
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession$ObservableWrapper;

    .end local v0    # "assetObservers":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession$ObservableWrapper;
    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession$ObservableWrapper;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession$1;)V

    .line 150
    .restart local v0    # "assetObservers":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession$ObservableWrapper;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;->_allAssetsUploadObservers:Ljava/util/Map;

    iget-object v2, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;->guid:Ljava/lang/String;

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    :cond_19
    invoke-virtual {v0, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession$ObservableWrapper;->addObserver(Ljava/util/Observer;)V

    .line 153
    return-void
.end method

.method public getAssetsList()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 118
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;->_assetsList:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getDestinationFolder()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .registers 2

    .prologue
    .line 114
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;->_destinationFolder:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    return-object v0
.end method

.method public getUploadSummary()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession$UploadSummary;
    .registers 2

    .prologue
    .line 86
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;->_uploadSummary:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession$UploadSummary;

    return-object v0
.end method

.method public removeObserverForAssetUpload(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;Ljava/util/Observer;)V
    .registers 6
    .param p1, "assetData"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;
    .param p2, "observer"    # Ljava/util/Observer;

    .prologue
    .line 156
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;->_allAssetsUploadObservers:Ljava/util/Map;

    iget-object v2, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;->guid:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Observable;

    .line 157
    .local v0, "assetObservers":Ljava/util/Observable;
    if-nez v0, :cond_d

    .line 161
    :goto_c
    return-void

    .line 160
    :cond_d
    invoke-virtual {v0, p2}, Ljava/util/Observable;->deleteObserver(Ljava/util/Observer;)V

    goto :goto_c
.end method
