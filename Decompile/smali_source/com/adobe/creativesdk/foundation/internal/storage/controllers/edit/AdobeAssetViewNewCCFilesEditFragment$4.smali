.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment$4;
.super Ljava/lang/Object;
.source "AdobeAssetViewNewCCFilesEditFragment.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeEditAssetCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->handleRenameButtonClick()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;

    .prologue
    .line 356
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAbort()V
    .registers 1

    .prologue
    .line 380
    return-void
.end method

.method public onComplete()V
    .registers 3

    .prologue
    .line 360
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;

    move-result-object v0

    .line 361
    .local v0, "commandMgr":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;
    const/4 v1, 0x0

    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditManager;->setEditCompletionHandled(Z)V

    .line 362
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;->ACTION_ASSETVIEW_EDIT_COMPLETED:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;->postCommand(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;)V

    .line 364
    return-void
.end method

.method public onProgress(D)V
    .registers 8
    .param p1, "progress"    # D

    .prologue
    .line 368
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    .line 369
    .local v0, "center":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 370
    .local v1, "data":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "EDIT_PROGRESS_KEY"

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 371
    invoke-static {p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditManager;->setProgressValue(D)V

    .line 372
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAssetEditProgressChanged:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    invoke-direct {v2, v3, v1}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;-><init>(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Map;)V

    .line 373
    .local v2, "notfication":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->postNotification(Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;)V

    .line 375
    return-void
.end method
