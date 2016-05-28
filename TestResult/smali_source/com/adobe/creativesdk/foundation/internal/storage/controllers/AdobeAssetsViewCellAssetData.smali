.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;
.super Ljava/lang/Object;
.source "AdobeAssetsViewCellAssetData.java"


# instance fields
.field public creationDate:Ljava/util/Date;

.field public guid:Ljava/lang/String;

.field public imageMD5Hash:Ljava/lang/String;

.field public isEditInProgress:Z

.field public modificationDate:Ljava/util/Date;

.field public optionalMetadata:Lorg/json/JSONObject;

.field public originalAsset:Ljava/lang/Object;

.field public title:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->isEditInProgress:Z

    return-void
.end method
