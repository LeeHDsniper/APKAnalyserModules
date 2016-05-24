.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController$3;
.super Ljava/lang/Object;
.source "AdobeOneUpSinglePageAssetController.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->initiateDisplay()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback",
        "<[B",
        "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;

    .prologue
    .line 177
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancellation()V
    .registers 3

    .prologue
    .line 185
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;

    const/4 v1, 0x0

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->handleAssetImageData([B)V
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;[B)V

    .line 186
    return-void
.end method

.method public bridge synthetic onCompletion(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 177
    check-cast p1, [B

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController$3;->onCompletion([B)V

    return-void
.end method

.method public onCompletion([B)V
    .registers 3
    .param p1, "data"    # [B

    .prologue
    .line 190
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->handleAssetImageData([B)V
    invoke-static {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;[B)V

    .line 191
    return-void
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V
    .registers 4
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    .prologue
    .line 195
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;

    const/4 v1, 0x0

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->handleAssetImageData([B)V
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;[B)V

    .line 196
    return-void
.end method

.method public bridge synthetic onError(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 177
    check-cast p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController$3;->onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    return-void
.end method

.method public onProgress(D)V
    .registers 3
    .param p1, "progress"    # D

    .prologue
    .line 182
    return-void
.end method
