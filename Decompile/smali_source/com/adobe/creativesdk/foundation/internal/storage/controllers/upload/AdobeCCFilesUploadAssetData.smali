.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;
.source "AdobeCCFilesUploadAssetData.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;
    }
.end annotation


# instance fields
.field public _localAssetURL:Ljava/net/URL;

.field private _progress:D

.field private _uploadStatus:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 25
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;-><init>()V

    .line 26
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;->YetToStart:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;->_uploadStatus:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;

    .line 27
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;->_progress:D

    .line 28
    return-void
.end method


# virtual methods
.method public getProgress()D
    .registers 3

    .prologue
    .line 46
    iget-wide v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;->_progress:D

    return-wide v0
.end method

.method public getStatus()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;
    .registers 2

    .prologue
    .line 43
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;->_uploadStatus:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;

    return-object v0
.end method
