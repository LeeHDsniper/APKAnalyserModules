.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController$1;
.super Ljava/lang/Object;
.source "AdobeOneUpSinglePageAssetController.java"

# interfaces
.implements Luk/co/senab/photoview/IPhotoViewZoomDelegate;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->performInitialization(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;

    .prologue
    .line 93
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public signalDragDetected(FF)V
    .registers 3
    .param p1, "v"    # F
    .param p2, "v2"    # F

    .prologue
    .line 103
    return-void
.end method

.method public signalZoomHandled(FFF)V
    .registers 4
    .param p1, "v"    # F
    .param p2, "v2"    # F
    .param p3, "v3"    # F

    .prologue
    .line 98
    return-void
.end method
