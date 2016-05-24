.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment$9;
.super Ljava/lang/Object;
.source "AdobeEditWindowDialogFragment.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesRenameDialogDismissController;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment;->startEditSession(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditOperation;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment;

    .prologue
    .line 323
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment$9;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public dialogClosed()V
    .registers 2

    .prologue
    .line 326
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditManager;->isEditInProgress()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 327
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment$9;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment;->endDialogFragment()V

    .line 330
    :goto_b
    return-void

    .line 329
    :cond_c
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment$9;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment;->setEditWindowVisible()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment;->access$700(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditWindowDialogFragment;)V

    goto :goto_b
.end method
