.class Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$2;
.super Ljava/lang/Object;
.source "BehanceSDKPublishProjectCoverFragment.java"

# interfaces
.implements Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->updateSelectedCoverImage()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;


# direct methods
.method constructor <init>(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;

    .prologue
    .line 302
    iput-object p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$2;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLoadingCancelled(Ljava/lang/String;Landroid/view/View;)V
    .registers 3
    .param p1, "arg0"    # Ljava/lang/String;
    .param p2, "arg1"    # Landroid/view/View;

    .prologue
    .line 328
    return-void
.end method

.method public onLoadingComplete(Ljava/lang/String;Landroid/view/View;Landroid/graphics/Bitmap;)V
    .registers 6
    .param p1, "arg0"    # Ljava/lang/String;
    .param p2, "arg1"    # Landroid/view/View;
    .param p3, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    const/16 v1, 0x8

    .line 317
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$2;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;

    # getter for: Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->cropImageView:Lcom/behance/sdk/edmodo/cropper/CropImageView;
    invoke-static {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->access$700(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;)Lcom/behance/sdk/edmodo/cropper/CropImageView;

    move-result-object v0

    invoke-virtual {v0, p3}, Lcom/behance/sdk/edmodo/cropper/CropImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 318
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$2;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;

    # getter for: Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->croppedImage:Landroid/widget/ImageView;
    invoke-static {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->access$900(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;)Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 319
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$2;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;

    # getter for: Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->progressBar:Landroid/view/View;
    invoke-static {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->access$800(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 320
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$2;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;

    # getter for: Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->cropImageView:Lcom/behance/sdk/edmodo/cropper/CropImageView;
    invoke-static {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->access$700(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;)Lcom/behance/sdk/edmodo/cropper/CropImageView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/behance/sdk/edmodo/cropper/CropImageView;->setVisibility(I)V

    .line 321
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$2;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;

    # getter for: Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImageBackground:Landroid/view/View;
    invoke-static {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->access$1000(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;)Landroid/view/View;

    move-result-object v0

    sget v1, Lcom/behance/sdk/R$color;->bsdk_add_project_cover_image_fragment_inprogress_state_background:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 322
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$2;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;

    invoke-virtual {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->enableActionBarRightNav()V

    .line 323
    return-void
.end method

.method public onLoadingFailed(Ljava/lang/String;Landroid/view/View;Lcom/nostra13/universalimageloader/core/assist/FailReason;)V
    .registers 4
    .param p1, "arg0"    # Ljava/lang/String;
    .param p2, "arg1"    # Landroid/view/View;
    .param p3, "arg2"    # Lcom/nostra13/universalimageloader/core/assist/FailReason;

    .prologue
    .line 313
    return-void
.end method

.method public onLoadingStarted(Ljava/lang/String;Landroid/view/View;)V
    .registers 5
    .param p1, "arg0"    # Ljava/lang/String;
    .param p2, "arg1"    # Landroid/view/View;

    .prologue
    .line 306
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$2;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;

    # getter for: Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->cropImageView:Lcom/behance/sdk/edmodo/cropper/CropImageView;
    invoke-static {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->access$700(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;)Lcom/behance/sdk/edmodo/cropper/CropImageView;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/behance/sdk/edmodo/cropper/CropImageView;->setVisibility(I)V

    .line 307
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$2;->this$0:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;

    # getter for: Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->progressBar:Landroid/view/View;
    invoke-static {v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->access$800(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 308
    return-void
.end method
