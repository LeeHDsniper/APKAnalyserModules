.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$9;
.super Ljava/lang/Object;
.source "AdobeAssetViewCCFilesWithUploadContainerFragment.java"

# interfaces
.implements Ljava/util/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->registerLocalNofications()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    .prologue
    .line 748
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$9;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .registers 6
    .param p1, "observable"    # Ljava/util/Observable;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 751
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$9;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    check-cast p2, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    .end local p2    # "data":Ljava/lang/Object;
    invoke-virtual {p2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getInfo()Ljava/util/Map;

    move-result-object v0

    const-string v2, "unreadCount"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->setNotificationCount(I)V
    invoke-static {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->access$700(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;I)V

    .line 752
    return-void
.end method
