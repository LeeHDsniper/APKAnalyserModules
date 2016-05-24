.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$2;
.super Ljava/lang/Object;
.source "AdobeUXPhotoAssetOneUpViewerActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;

    .prologue
    .line 257
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 261
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;

    iget v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;->mPos:I

    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->getAssetAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    move-result-object v0

    .line 262
    .local v0, "asset":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;->mImageSelectbtn:Landroid/widget/ImageButton;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;->access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;)Landroid/widget/ImageButton;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/ImageButton;->isSelected()Z

    move-result v1

    if-nez v1, :cond_22

    .line 263
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;->mImageSelectbtn:Landroid/widget/ImageButton;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;->access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;)Landroid/widget/ImageButton;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setSelected(Z)V

    .line 264
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->addSelectedAsset(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;)V

    .line 270
    :goto_21
    return-void

    .line 267
    :cond_22
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;->mImageSelectbtn:Landroid/widget/ImageButton;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;->access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;)Landroid/widget/ImageButton;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setSelected(Z)V

    .line 268
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->removeSelectedAsset(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;)V

    goto :goto_21
.end method
