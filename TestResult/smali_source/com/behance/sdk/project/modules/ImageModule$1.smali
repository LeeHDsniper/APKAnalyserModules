.class Lcom/behance/sdk/project/modules/ImageModule$1;
.super Ljava/lang/Object;
.source "ImageModule.java"

# interfaces
.implements Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/behance/sdk/project/modules/ImageModule;->displayImage(Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/behance/sdk/project/modules/ImageModule;

.field final synthetic val$imageView:Landroid/widget/ImageView;

.field final synthetic val$listener:Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;

.field final synthetic val$module:Lcom/behance/sdk/project/modules/ImageModule;


# direct methods
.method constructor <init>(Lcom/behance/sdk/project/modules/ImageModule;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;Lcom/behance/sdk/project/modules/ImageModule;Landroid/widget/ImageView;)V
    .registers 5
    .param p1, "this$0"    # Lcom/behance/sdk/project/modules/ImageModule;

    .prologue
    .line 364
    iput-object p1, p0, Lcom/behance/sdk/project/modules/ImageModule$1;->this$0:Lcom/behance/sdk/project/modules/ImageModule;

    iput-object p2, p0, Lcom/behance/sdk/project/modules/ImageModule$1;->val$listener:Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;

    iput-object p3, p0, Lcom/behance/sdk/project/modules/ImageModule$1;->val$module:Lcom/behance/sdk/project/modules/ImageModule;

    iput-object p4, p0, Lcom/behance/sdk/project/modules/ImageModule$1;->val$imageView:Landroid/widget/ImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLoadingCancelled(Ljava/lang/String;Landroid/view/View;)V
    .registers 4
    .param p1, "arg0"    # Ljava/lang/String;
    .param p2, "arg1"    # Landroid/view/View;

    .prologue
    .line 389
    iget-object v0, p0, Lcom/behance/sdk/project/modules/ImageModule$1;->val$listener:Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;

    if-eqz v0, :cond_9

    .line 390
    iget-object v0, p0, Lcom/behance/sdk/project/modules/ImageModule$1;->val$listener:Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;

    invoke-interface {v0, p1, p2}, Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;->onLoadingCancelled(Ljava/lang/String;Landroid/view/View;)V

    .line 392
    :cond_9
    return-void
.end method

.method public onLoadingComplete(Ljava/lang/String;Landroid/view/View;Landroid/graphics/Bitmap;)V
    .registers 6
    .param p1, "arg0"    # Ljava/lang/String;
    .param p2, "arg1"    # Landroid/view/View;
    .param p3, "loadedBitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 380
    iget-object v0, p0, Lcom/behance/sdk/project/modules/ImageModule$1;->this$0:Lcom/behance/sdk/project/modules/ImageModule;

    iget-object v1, p0, Lcom/behance/sdk/project/modules/ImageModule$1;->val$module:Lcom/behance/sdk/project/modules/ImageModule;

    invoke-static {p3, v1}, Lcom/behance/sdk/util/BehanceSDKImageLoaderUtils;->updateBitmapForRotation(Landroid/graphics/Bitmap;Lcom/behance/sdk/project/modules/ImageModule;)Landroid/graphics/Bitmap;

    move-result-object v1

    # setter for: Lcom/behance/sdk/project/modules/ImageModule;->bitmap:Landroid/graphics/Bitmap;
    invoke-static {v0, v1}, Lcom/behance/sdk/project/modules/ImageModule;->access$002(Lcom/behance/sdk/project/modules/ImageModule;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 381
    iget-object v0, p0, Lcom/behance/sdk/project/modules/ImageModule$1;->this$0:Lcom/behance/sdk/project/modules/ImageModule;

    iget-object v1, p0, Lcom/behance/sdk/project/modules/ImageModule$1;->val$imageView:Landroid/widget/ImageView;

    # invokes: Lcom/behance/sdk/project/modules/ImageModule;->setImageViewLayerType(Landroid/widget/ImageView;Landroid/graphics/Bitmap;)V
    invoke-static {v0, v1, p3}, Lcom/behance/sdk/project/modules/ImageModule;->access$100(Lcom/behance/sdk/project/modules/ImageModule;Landroid/widget/ImageView;Landroid/graphics/Bitmap;)V

    .line 382
    iget-object v0, p0, Lcom/behance/sdk/project/modules/ImageModule$1;->val$imageView:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/behance/sdk/project/modules/ImageModule$1;->this$0:Lcom/behance/sdk/project/modules/ImageModule;

    # getter for: Lcom/behance/sdk/project/modules/ImageModule;->bitmap:Landroid/graphics/Bitmap;
    invoke-static {v1}, Lcom/behance/sdk/project/modules/ImageModule;->access$000(Lcom/behance/sdk/project/modules/ImageModule;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 383
    iget-object v0, p0, Lcom/behance/sdk/project/modules/ImageModule$1;->val$listener:Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;

    if-eqz v0, :cond_2c

    .line 384
    iget-object v0, p0, Lcom/behance/sdk/project/modules/ImageModule$1;->val$listener:Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;

    iget-object v1, p0, Lcom/behance/sdk/project/modules/ImageModule$1;->this$0:Lcom/behance/sdk/project/modules/ImageModule;

    # getter for: Lcom/behance/sdk/project/modules/ImageModule;->bitmap:Landroid/graphics/Bitmap;
    invoke-static {v1}, Lcom/behance/sdk/project/modules/ImageModule;->access$000(Lcom/behance/sdk/project/modules/ImageModule;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-interface {v0, p1, p2, v1}, Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;->onLoadingComplete(Ljava/lang/String;Landroid/view/View;Landroid/graphics/Bitmap;)V

    .line 385
    :cond_2c
    return-void
.end method

.method public onLoadingFailed(Ljava/lang/String;Landroid/view/View;Lcom/nostra13/universalimageloader/core/assist/FailReason;)V
    .registers 5
    .param p1, "arg0"    # Ljava/lang/String;
    .param p2, "arg1"    # Landroid/view/View;
    .param p3, "arg2"    # Lcom/nostra13/universalimageloader/core/assist/FailReason;

    .prologue
    .line 374
    iget-object v0, p0, Lcom/behance/sdk/project/modules/ImageModule$1;->val$listener:Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;

    if-eqz v0, :cond_9

    .line 375
    iget-object v0, p0, Lcom/behance/sdk/project/modules/ImageModule$1;->val$listener:Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;

    invoke-interface {v0, p1, p2, p3}, Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;->onLoadingFailed(Ljava/lang/String;Landroid/view/View;Lcom/nostra13/universalimageloader/core/assist/FailReason;)V

    .line 376
    :cond_9
    return-void
.end method

.method public onLoadingStarted(Ljava/lang/String;Landroid/view/View;)V
    .registers 4
    .param p1, "arg0"    # Ljava/lang/String;
    .param p2, "arg1"    # Landroid/view/View;

    .prologue
    .line 368
    iget-object v0, p0, Lcom/behance/sdk/project/modules/ImageModule$1;->val$listener:Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;

    if-eqz v0, :cond_9

    .line 369
    iget-object v0, p0, Lcom/behance/sdk/project/modules/ImageModule$1;->val$listener:Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;

    invoke-interface {v0, p1, p2}, Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;->onLoadingStarted(Ljava/lang/String;Landroid/view/View;)V

    .line 370
    :cond_9
    return-void
.end method
