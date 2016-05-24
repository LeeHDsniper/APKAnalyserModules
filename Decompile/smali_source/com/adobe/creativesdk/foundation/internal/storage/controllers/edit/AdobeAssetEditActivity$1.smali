.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity$1;
.super Ljava/lang/Object;
.source "AdobeAssetEditActivity.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity;

    .prologue
    .line 75
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 4
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 78
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity;->handleOutsideTouchForFloatingButton()Z
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity;)Z

    move-result v0

    return v0
.end method
