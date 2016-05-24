.class public Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;
.super Ljava/lang/Object;
.source "AdobeStorageResource.java"


# instance fields
.field protected cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

.field public collaboration:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeCollaborationType;

.field public created:Ljava/lang/String;

.field public etag:Ljava/lang/String;

.field public href:Ljava/net/URI;

.field public internalID:Ljava/lang/String;

.field public isCollection:Z

.field public modified:Ljava/lang/String;

.field public name:Ljava/lang/String;

.field public ordinal:J

.field public type:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeCollaborationType;->ADOBE_COLLABORATION_TYPE_PRIVATE:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeCollaborationType;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;->collaboration:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeCollaborationType;

    return-void
.end method


# virtual methods
.method public getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .registers 2

    .prologue
    .line 96
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;->cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    if-nez v0, :cond_e

    .line 97
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->getSharedCloudManager()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->getDefaultCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;->cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 99
    :cond_e
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;->cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    return-object v0
.end method

.method public setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V
    .registers 2
    .param p1, "cloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .prologue
    .line 103
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;->cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 104
    return-void
.end method
