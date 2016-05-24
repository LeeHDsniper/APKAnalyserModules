.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$2;
.super Ljava/lang/Object;
.source "AdobeUXAssetOneUpViewerActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;

    .prologue
    .line 236
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 239
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->isMultiSelectModeActive()Z

    move-result v2

    if-nez v2, :cond_1c

    .line 240
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;

    iget v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mPos:I

    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getAssetAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    move-result-object v0

    .local v0, "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    move-object v2, v0

    .line 241
    check-cast v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->containsAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)Z

    move-result v2

    if-nez v2, :cond_1c

    .line 242
    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .end local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->addSelectedAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)V

    .line 245
    :cond_1c
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 246
    .local v1, "resultIntent":Landroid/content/Intent;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;

    const/4 v3, -0x1

    invoke-virtual {v2, v3, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->setResult(ILandroid/content/Intent;)V

    .line 247
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->finish()V

    .line 248
    return-void
.end method
