.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$EditProgressNotificationObserver;
.super Ljava/lang/Object;
.source "AdobeAssetViewCCFilesWithUploadContainerFragment.java"

# interfaces
.implements Ljava/util/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "EditProgressNotificationObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    .prologue
    .line 1096
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$EditProgressNotificationObserver;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .registers 9
    .param p1, "observable"    # Ljava/util/Observable;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 1100
    move-object v1, p2

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    .line 1101
    .local v1, "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getId()Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;

    move-result-object v4

    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAssetEditProgressChanged:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    if-ne v4, v5, :cond_28

    .line 1103
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getInfo()Ljava/util/Map;

    move-result-object v0

    .line 1104
    .local v0, "info":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v4, "EDIT_PROGRESS_KEY"

    invoke-interface {v0, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_28

    .line 1106
    const-string v4, "EDIT_PROGRESS_KEY"

    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Double;

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    .line 1107
    .local v2, "progressValue":D
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$EditProgressNotificationObserver;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->setEditProgress(D)V
    invoke-static {v4, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->access$1800(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;D)V

    .line 1110
    .end local v0    # "info":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v2    # "progressValue":D
    :cond_28
    return-void
.end method
