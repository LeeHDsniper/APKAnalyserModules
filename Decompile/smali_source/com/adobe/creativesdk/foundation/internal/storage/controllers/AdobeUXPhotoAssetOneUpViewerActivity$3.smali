.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$3;
.super Ljava/lang/Object;
.source "AdobeUXPhotoAssetOneUpViewerActivity.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;->setShareIntent()V
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
        "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;

.field final synthetic val$asset:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

.field final synthetic val$assetIndex:I


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;ILcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;

    .prologue
    .line 424
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;

    iput p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$3;->val$assetIndex:I

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$3;->val$asset:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected handleNoPreview()V
    .registers 4

    .prologue
    .line 433
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->isMenuEnabled()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 434
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;->mImagePath:Ljava/io/File;

    .line 438
    :goto_b
    return-void

    .line 436
    :cond_c
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;

    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$3;->val$assetIndex:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;->enableOrDisableOpenBtn(IZ)V

    goto :goto_b
.end method

.method public onCancellation()V
    .registers 1

    .prologue
    .line 442
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$3;->handleNoPreview()V

    .line 443
    return-void
.end method

.method public bridge synthetic onCompletion(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 424
    check-cast p1, [B

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$3;->onCompletion([B)V

    return-void
.end method

.method public onCompletion([B)V
    .registers 5
    .param p1, "data"    # [B

    .prologue
    .line 512
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$3$1GetImageUri;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$3$1GetImageUri;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$3;)V

    .line 514
    .local v1, "task":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$3$1GetImageUri;
    const/4 v2, 0x1

    new-array v0, v2, [[B

    .line 515
    .local v0, "arrayOfByteArray":[[B
    const/4 v2, 0x0

    aput-object p1, v0, v2

    .line 516
    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$3$1GetImageUri;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 517
    return-void
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;)V
    .registers 2
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    .prologue
    .line 521
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$3;->handleNoPreview()V

    .line 522
    return-void
.end method

.method public bridge synthetic onError(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 424
    check-cast p1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$3;->onError(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;)V

    return-void
.end method

.method public final onProgress(D)V
    .registers 3
    .param p1, "progress"    # D

    .prologue
    .line 429
    return-void
.end method
