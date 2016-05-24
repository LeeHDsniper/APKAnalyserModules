.class final Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController$1;
.super Ljava/lang/Object;
.source "AdobePhotoAssetViewerController.java"

# interfaces
.implements Ljava/util/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->setCurrentAssetViewerActivity(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 116
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .registers 4
    .param p1, "observable"    # Ljava/util/Observable;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 121
    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_assetViewerActivity:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->access$000()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;

    move-result-object v0

    if-nez v0, :cond_7

    .line 125
    :goto_6
    return-void

    .line 124
    :cond_7
    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_assetViewerActivity:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->access$000()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;

    move-result-object v0

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;->handleAssetSelectionChanged()V

    goto :goto_6
.end method
