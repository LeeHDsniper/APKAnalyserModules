.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity$2;
.super Ljava/lang/Object;
.source "AdobeAssetShareBaseOneUpActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;

    .prologue
    .line 229
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 232
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->mLayout:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    sget-object v1, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;->COLLAPSED:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;

    invoke-virtual {v0, v1}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->setPanelState(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;)V

    .line 233
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->mLayout:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->setVisibility(I)V

    .line 234
    return-void
.end method
