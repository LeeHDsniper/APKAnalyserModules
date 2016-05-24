.class Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$FlingRunnable;
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
    name = "FlingRunnable"
.end annotation


# instance fields
.field private mCurrentX:I

.field private mCurrentY:I

.field private final mScroller:Lcom/behance/sdk/senab/photoview/ScrollerProxy;

.field final synthetic this$0:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;


# direct methods
.method public constructor <init>(Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;Landroid/content/Context;)V
    .registers 4
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 850
    iput-object p1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$FlingRunnable;->this$0:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 851
    invoke-static {p2}, Lcom/behance/sdk/senab/photoview/ScrollerProxy;->getScroller(Landroid/content/Context;)Lcom/behance/sdk/senab/photoview/ScrollerProxy;

    move-result-object v0

    iput-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$FlingRunnable;->mScroller:Lcom/behance/sdk/senab/photoview/ScrollerProxy;

    .line 852
    return-void
.end method


# virtual methods
.method public cancelFling()V
    .registers 3

    .prologue
    .line 855
    sget-boolean v0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->DEBUG:Z

    if-eqz v0, :cond_b

    .line 856
    const-string v0, "PhotoViewAttacher"

    const-string v1, "Cancel Fling"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 858
    :cond_b
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$FlingRunnable;->mScroller:Lcom/behance/sdk/senab/photoview/ScrollerProxy;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/senab/photoview/ScrollerProxy;->forceFinished(Z)V

    .line 859
    return-void
.end method

.method public fling(IIII)V
    .registers 17
    .param p1, "viewWidth"    # I
    .param p2, "viewHeight"    # I
    .param p3, "velocityX"    # I
    .param p4, "velocityY"    # I

    .prologue
    .line 862
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$FlingRunnable;->this$0:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v11

    .line 863
    .local v11, "rect":Landroid/graphics/RectF;
    if-nez v11, :cond_9

    .line 896
    :cond_8
    :goto_8
    return-void

    .line 867
    :cond_9
    iget v0, v11, Landroid/graphics/RectF;->left:F

    neg-float v0, v0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 870
    .local v1, "startX":I
    int-to-float v0, p1

    invoke-virtual {v11}, Landroid/graphics/RectF;->width()F

    move-result v3

    cmpg-float v0, v0, v3

    if-gez v0, :cond_8d

    .line 871
    const/4 v5, 0x0

    .line 872
    .local v5, "minX":I
    invoke-virtual {v11}, Landroid/graphics/RectF;->width()F

    move-result v0

    int-to-float v3, p1

    sub-float/2addr v0, v3

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v6

    .line 877
    .local v6, "maxX":I
    :goto_24
    iget v0, v11, Landroid/graphics/RectF;->top:F

    neg-float v0, v0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v2

    .line 878
    .local v2, "startY":I
    int-to-float v0, p2

    invoke-virtual {v11}, Landroid/graphics/RectF;->height()F

    move-result v3

    cmpg-float v0, v0, v3

    if-gez v0, :cond_90

    .line 879
    const/4 v7, 0x0

    .line 880
    .local v7, "minY":I
    invoke-virtual {v11}, Landroid/graphics/RectF;->height()F

    move-result v0

    int-to-float v3, p2

    sub-float/2addr v0, v3

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v8

    .line 885
    .local v8, "maxY":I
    :goto_3f
    iput v1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$FlingRunnable;->mCurrentX:I

    .line 886
    iput v2, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$FlingRunnable;->mCurrentY:I

    .line 888
    sget-boolean v0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->DEBUG:Z

    if-eqz v0, :cond_7d

    .line 889
    const-string v0, "PhotoViewAttacher"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "fling. StartX:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " StartY:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " MaxX:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " MaxY:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 893
    :cond_7d
    if-ne v1, v6, :cond_81

    if-eq v2, v8, :cond_8

    .line 894
    :cond_81
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$FlingRunnable;->mScroller:Lcom/behance/sdk/senab/photoview/ScrollerProxy;

    const/4 v9, 0x0

    const/4 v10, 0x0

    move v3, p3

    move/from16 v4, p4

    invoke-virtual/range {v0 .. v10}, Lcom/behance/sdk/senab/photoview/ScrollerProxy;->fling(IIIIIIIIII)V

    goto/16 :goto_8

    .line 874
    .end local v2    # "startY":I
    .end local v5    # "minX":I
    .end local v6    # "maxX":I
    .end local v7    # "minY":I
    .end local v8    # "maxY":I
    :cond_8d
    move v6, v1

    .restart local v6    # "maxX":I
    move v5, v1

    .restart local v5    # "minX":I
    goto :goto_24

    .line 882
    .restart local v2    # "startY":I
    :cond_90
    move v8, v2

    .restart local v8    # "maxY":I
    move v7, v2

    .restart local v7    # "minY":I
    goto :goto_3f
.end method

.method public run()V
    .registers 7

    .prologue
    .line 900
    iget-object v3, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$FlingRunnable;->this$0:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v3}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 901
    .local v0, "imageView":Landroid/widget/ImageView;
    if-eqz v0, :cond_7d

    iget-object v3, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$FlingRunnable;->mScroller:Lcom/behance/sdk/senab/photoview/ScrollerProxy;

    invoke-virtual {v3}, Lcom/behance/sdk/senab/photoview/ScrollerProxy;->computeScrollOffset()Z

    move-result v3

    if-eqz v3, :cond_7d

    .line 903
    iget-object v3, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$FlingRunnable;->mScroller:Lcom/behance/sdk/senab/photoview/ScrollerProxy;

    invoke-virtual {v3}, Lcom/behance/sdk/senab/photoview/ScrollerProxy;->getCurrX()I

    move-result v1

    .line 904
    .local v1, "newX":I
    iget-object v3, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$FlingRunnable;->mScroller:Lcom/behance/sdk/senab/photoview/ScrollerProxy;

    invoke-virtual {v3}, Lcom/behance/sdk/senab/photoview/ScrollerProxy;->getCurrY()I

    move-result v2

    .line 906
    .local v2, "newY":I
    sget-boolean v3, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->DEBUG:Z

    if-eqz v3, :cond_5a

    .line 907
    const-string v3, "PhotoViewAttacher"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "fling run(). CurrentX:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$FlingRunnable;->mCurrentX:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " CurrentY:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$FlingRunnable;->mCurrentY:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " NewX:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " NewY:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 911
    :cond_5a
    iget-object v3, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$FlingRunnable;->this$0:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    # getter for: Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;
    invoke-static {v3}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->access$200(Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;)Landroid/graphics/Matrix;

    move-result-object v3

    iget v4, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$FlingRunnable;->mCurrentX:I

    sub-int/2addr v4, v1

    int-to-float v4, v4

    iget v5, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$FlingRunnable;->mCurrentY:I

    sub-int/2addr v5, v2

    int-to-float v5, v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 912
    iget-object v3, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$FlingRunnable;->this$0:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    iget-object v4, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$FlingRunnable;->this$0:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v4}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getDisplayMatrix()Landroid/graphics/Matrix;

    move-result-object v4

    # invokes: Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->setImageViewMatrix(Landroid/graphics/Matrix;)V
    invoke-static {v3, v4}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->access$400(Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;Landroid/graphics/Matrix;)V

    .line 914
    iput v1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$FlingRunnable;->mCurrentX:I

    .line 915
    iput v2, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$FlingRunnable;->mCurrentY:I

    .line 918
    invoke-static {v0, p0}, Lcom/behance/sdk/senab/photoview/Compat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 920
    .end local v1    # "newX":I
    .end local v2    # "newY":I
    :cond_7d
    return-void
.end method
