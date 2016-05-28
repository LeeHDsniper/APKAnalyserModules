.class Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;
.super Ljava/lang/Object;
.source "PhotoViewAttacher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AnimatedZoomRunnable"
.end annotation


# instance fields
.field private final mDeltaScale:F

.field private final mFocalX:F

.field private final mFocalY:F

.field private final mTargetZoom:F

.field final synthetic this$0:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;


# direct methods
.method public constructor <init>(Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;FFFF)V
    .registers 7
    .param p2, "currentZoom"    # F
    .param p3, "targetZoom"    # F
    .param p4, "focalX"    # F
    .param p5, "focalY"    # F

    .prologue
    .line 807
    iput-object p1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;->this$0:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 808
    iput p3, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;->mTargetZoom:F

    .line 809
    iput p4, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;->mFocalX:F

    .line 810
    iput p5, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;->mFocalY:F

    .line 812
    cmpg-float v0, p2, p3

    if-gez v0, :cond_15

    .line 813
    const v0, 0x3f88f5c3

    iput v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;->mDeltaScale:F

    .line 817
    :goto_14
    return-void

    .line 815
    :cond_15
    const v0, 0x3f6e147b

    iput v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;->mDeltaScale:F

    goto :goto_14
.end method


# virtual methods
.method public run()V
    .registers 10

    .prologue
    const/high16 v8, 0x3f800000

    .line 820
    iget-object v3, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;->this$0:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v3}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v2

    .line 822
    .local v2, "imageView":Landroid/widget/ImageView;
    if-eqz v2, :cond_41

    .line 823
    iget-object v3, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;->this$0:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    # getter for: Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;
    invoke-static {v3}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->access$200(Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;)Landroid/graphics/Matrix;

    move-result-object v3

    iget v4, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;->mDeltaScale:F

    iget v5, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;->mDeltaScale:F

    iget v6, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;->mFocalX:F

    iget v7, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;->mFocalY:F

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 824
    iget-object v3, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;->this$0:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    # invokes: Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V
    invoke-static {v3}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->access$300(Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;)V

    .line 826
    iget-object v3, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;->this$0:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v3}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v0

    .line 828
    .local v0, "currentScale":F
    iget v3, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;->mDeltaScale:F

    cmpl-float v3, v3, v8

    if-lez v3, :cond_32

    iget v3, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;->mTargetZoom:F

    cmpg-float v3, v0, v3

    if-ltz v3, :cond_3e

    :cond_32
    iget v3, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;->mDeltaScale:F

    cmpg-float v3, v3, v8

    if-gez v3, :cond_42

    iget v3, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;->mTargetZoom:F

    cmpg-float v3, v3, v0

    if-gez v3, :cond_42

    .line 832
    :cond_3e
    invoke-static {v2, p0}, Lcom/behance/sdk/senab/photoview/Compat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 842
    .end local v0    # "currentScale":F
    :cond_41
    :goto_41
    return-void

    .line 837
    .restart local v0    # "currentScale":F
    :cond_42
    iget v3, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;->mTargetZoom:F

    div-float v1, v3, v0

    .line 838
    .local v1, "delta":F
    iget-object v3, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;->this$0:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    # getter for: Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;
    invoke-static {v3}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->access$200(Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;)Landroid/graphics/Matrix;

    move-result-object v3

    iget v4, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;->mFocalX:F

    iget v5, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;->mFocalY:F

    invoke-virtual {v3, v1, v1, v4, v5}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 839
    iget-object v3, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;->this$0:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    # invokes: Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V
    invoke-static {v3}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->access$300(Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;)V

    goto :goto_41
.end method
