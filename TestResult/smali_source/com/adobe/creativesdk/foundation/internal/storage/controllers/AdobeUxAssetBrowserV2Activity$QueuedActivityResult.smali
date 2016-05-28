.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUxAssetBrowserV2Activity$QueuedActivityResult;
.super Ljava/lang/Object;
.source "AdobeUxAssetBrowserV2Activity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUxAssetBrowserV2Activity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "QueuedActivityResult"
.end annotation


# instance fields
.field public requestCode:I

.field public resultCode:I

.field public resultData:Landroid/content/Intent;

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUxAssetBrowserV2Activity;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUxAssetBrowserV2Activity;IILandroid/content/Intent;)V
    .registers 5
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUxAssetBrowserV2Activity;
    .param p2, "rc"    # I
    .param p3, "resc"    # I
    .param p4, "rd"    # Landroid/content/Intent;

    .prologue
    .line 390
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUxAssetBrowserV2Activity$QueuedActivityResult;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUxAssetBrowserV2Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 391
    iput p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUxAssetBrowserV2Activity$QueuedActivityResult;->requestCode:I

    .line 392
    iput-object p4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUxAssetBrowserV2Activity$QueuedActivityResult;->resultData:Landroid/content/Intent;

    .line 393
    iput p3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUxAssetBrowserV2Activity$QueuedActivityResult;->resultCode:I

    .line 394
    return-void
.end method
