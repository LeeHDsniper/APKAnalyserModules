.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView$VisibilityHandler;
.super Ljava/lang/Object;
.source "AdobeAssetOneUpBaseCellView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "VisibilityHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView;

    .prologue
    .line 180
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView$VisibilityHandler;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method isOffLineOrError(Z)V
    .registers 3
    .param p1, "offline"    # Z

    .prologue
    .line 186
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView$VisibilityHandler;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView;->handleOffline(Z)V

    .line 189
    return-void
.end method

.method isOnLine()V
    .registers 2

    .prologue
    .line 183
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView$VisibilityHandler;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView;->handleNetworkOnline()V

    .line 184
    return-void
.end method
