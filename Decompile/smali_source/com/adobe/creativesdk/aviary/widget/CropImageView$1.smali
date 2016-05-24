.class Lcom/adobe/creativesdk/aviary/widget/CropImageView$1;
.super Ljava/lang/Object;
.source "CropImageView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/widget/CropImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 39
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 41
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_2b

    check-cast v0, Lit/sephiroth/android/library/imagezoom/graphics/IBitmapDrawable;

    .end local v0    # "drawable":Landroid/graphics/drawable/Drawable;
    invoke-interface {v0}, Lit/sephiroth/android/library/imagezoom/graphics/IBitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_2b

    .line 42
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->access$000(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    move-result-object v1

    if-eqz v1, :cond_2b

    .line 43
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->access$000(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_2c

    .line 44
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 51
    :cond_2b
    :goto_2b
    return-void

    .line 46
    :cond_2c
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->access$000(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 47
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->access$000(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->invalidate()V

    goto :goto_2b
.end method
