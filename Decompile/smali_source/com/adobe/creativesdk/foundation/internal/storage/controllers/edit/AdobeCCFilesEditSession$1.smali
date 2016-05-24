.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession$1;
.super Ljava/lang/Object;
.source "AdobeCCFilesEditSession.java"

# interfaces
.implements Ljava/util/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession;->handleRenameOperation(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesRenameDialogDismissController;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession;

.field final synthetic val$targetAsset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession;Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession;

    .prologue
    .line 68
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession$1;->val$targetAsset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .registers 9
    .param p1, "observable"    # Ljava/util/Observable;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    const/4 v5, 0x0

    .line 71
    move-object v1, p2

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditRenameOperationStatus;

    .line 72
    .local v1, "status":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditRenameOperationStatus;
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditRenameOperationStatus;->ADOBE_CC_FILES_EDIT_RENAME_OPERATION_STATUS_COMPLETED:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditRenameOperationStatus;

    if-ne v1, v2, :cond_42

    .line 74
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession$1;->val$targetAsset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    instance-of v2, v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    if-eqz v2, :cond_34

    .line 75
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession$1;->val$targetAsset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getName()Ljava/lang/String;

    move-result-object v3

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession$1;->val$targetAsset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    check-cast v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData$EditStatus;->Completed:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData$EditStatus;

    invoke-direct {v0, v3, v2, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData;-><init>(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData$EditStatus;)V

    .line 78
    .local v0, "assetData":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData;
    :goto_1f
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession;->clearSummary()V
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession;)V

    .line 79
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession;->addAssetToSummary(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData;)V
    invoke-static {v2, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData;)V

    .line 80
    invoke-static {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditManager;->setEditCompletionHandled(Z)V

    .line 81
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession;->editResponseCallback:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeEditAssetCallback;

    invoke-interface {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeEditAssetCallback;->onComplete()V

    .line 95
    .end local v0    # "assetData":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData;
    :goto_33
    return-void

    .line 77
    :cond_34
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession$1;->val$targetAsset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getName()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData$EditStatus;->Completed:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData$EditStatus;

    invoke-direct {v0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData;-><init>(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData$EditStatus;)V

    .restart local v0    # "assetData":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData;
    goto :goto_1f

    .line 82
    .end local v0    # "assetData":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData;
    :cond_42
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditRenameOperationStatus;->ADOBE_CC_FILES_EDIT_RENAME_OPERATION_STATUS_FAILED:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditRenameOperationStatus;

    if-ne v1, v2, :cond_80

    .line 84
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession$1;->val$targetAsset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    instance-of v2, v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    if-eqz v2, :cond_72

    .line 85
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession$1;->val$targetAsset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getName()Ljava/lang/String;

    move-result-object v3

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession$1;->val$targetAsset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    check-cast v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData$EditStatus;->Error:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData$EditStatus;

    invoke-direct {v0, v3, v2, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData;-><init>(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData$EditStatus;)V

    .line 88
    .restart local v0    # "assetData":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData;
    :goto_5d
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession;->clearSummary()V
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession;)V

    .line 89
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession;->addAssetToSummary(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData;)V
    invoke-static {v2, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData;)V

    .line 90
    invoke-static {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditManager;->setEditCompletionHandled(Z)V

    .line 91
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession;->editResponseCallback:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeEditAssetCallback;

    invoke-interface {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeEditAssetCallback;->onComplete()V

    goto :goto_33

    .line 87
    .end local v0    # "assetData":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData;
    :cond_72
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession$1;->val$targetAsset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getName()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData$EditStatus;->Error:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData$EditStatus;

    invoke-direct {v0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData;-><init>(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData$EditStatus;)V

    .restart local v0    # "assetData":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData;
    goto :goto_5d

    .line 93
    .end local v0    # "assetData":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData;
    :cond_80
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession;->editResponseCallback:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeEditAssetCallback;

    invoke-interface {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeEditAssetCallback;->onAbort()V

    goto :goto_33
.end method
