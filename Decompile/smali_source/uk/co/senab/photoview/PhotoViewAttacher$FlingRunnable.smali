.class Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;
.super Ljava/lang/Object;
.source "PhotoViewAttacher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Luk/co/senab/photoview/PhotoViewAttacher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FlingRunnable"
.end annotation


# instance fields
.field private mCurrentX:I

.field private mCurrentY:I

.field private final mScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

.field final synthetic this$0:Luk/co/senab/photoview/PhotoViewAttacher;


# direct methods
.method public constructor <init>(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/content/Context;)V
    .registers 4
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 1072
    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1073
    invoke-static {p2}, Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;->getScroller(Landroid/content/Context;)Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    move-result-object v0

    iput-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;->mScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    .line 1074
    return-void
.end method


# virtual methods
.method public cancelFling()V
    .registers 4

    .prologue
    .line 1077
    # getter for: Luk/co/senab/photoview/PhotoViewAttacher;->DEBUG:Z
    invoke-static {}, Luk/co/senab/photoview/PhotoViewAttacher;->access$2()Z

    move-result v0

    if-eqz v0, :cond_11

    .line 1078
    invoke-static {}, Luk/co/senab/photoview/log/LogManager;->getLogger()Luk/co/senab/photoview/log/Logger;

    move-result-object v0

    const-string v1, "PhotoViewAttacher"

    const-string v2, "Cancel Fling"

    invoke-interface {v0, v1, v2}, Luk/co/senab/photoview/log/Logger;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1080
    :cond_11
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;->mScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;->forceFinished(Z)V

    .line 1081
    return-void
.end method

.method public fling(IIII)V
    .registers 17
    .param p1, "viewWidth"    # I
    .param p2, "viewHeight"    # I
    .param p3, "velocityX"    # I
    .param p4, "velocityY"    # I

    .prologue
    .line 1085
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v11

    .line 1086
    .local v11, "rect":Landroid/graphics/RectF;
    if-nez v11, :cond_9

    .line 1123
    :cond_8
    :goto_8
    return-void

    .line 1090
    :cond_9
    iget v0, v11, Landroid/graphics/RectF;->left:F

    neg-float v0, v0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 1093
    .local v1, "startX":I
    int-to-float v0, p1

    invoke-virtual {v11}, Landroid/graphics/RectF;->width()F

    move-result v3

    cmpg-float v0, v0, v3

    if-gez v0, :cond_8f

    .line 1094
    const/4 v5, 0x0

    .line 1095
    .local v5, "minX":I
    invoke-virtual {v11}, Landroid/graphics/RectF;->width()F

    move-result v0

    int-to-float v3, p1

    sub-float/2addr v0, v3

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v6

    .line 1100
    .local v6, "maxX":I
    :goto_24
    iget v0, v11, Landroid/graphics/RectF;->top:F

    neg-float v0, v0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v2

    .line 1101
    .local v2, "startY":I
    int-to-float v0, p2

    invoke-virtual {v11}, Landroid/graphics/RectF;->height()F

    move-result v3

    cmpg-float v0, v0, v3

    if-gez v0, :cond_92

    .line 1102
    const/4 v7, 0x0

    .line 1103
    .local v7, "minY":I
    invoke-virtual {v11}, Landroid/graphics/RectF;->height()F

    move-result v0

    int-to-float v3, p2

    sub-float/2addr v0, v3

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v8

    .line 1108
    .local v8, "maxY":I
    :goto_3f
    iput v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;->mCurrentX:I

    .line 1109
    iput v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;->mCurrentY:I

    .line 1111
    # getter for: Luk/co/senab/photoview/PhotoViewAttacher;->DEBUG:Z
    invoke-static {}, Luk/co/senab/photoview/PhotoViewAttacher;->access$2()Z

    move-result v0

    if-eqz v0, :cond_7f

    .line 1112
    invoke-static {}, Luk/co/senab/photoview/log/LogManager;->getLogger()Luk/co/senab/photoview/log/Logger;

    move-result-object v0

    .line 1113
    const-string v3, "PhotoViewAttacher"

    .line 1114
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v9, "fling. StartX:"

    invoke-direct {v4, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v9, " StartY:"

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 1115
    const-string v9, " MaxX:"

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v9, " MaxY:"

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 1114
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1112
    invoke-interface {v0, v3, v4}, Luk/co/senab/photoview/log/Logger;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1119
    :cond_7f
    if-ne v1, v6, :cond_83

    if-eq v2, v8, :cond_8

    .line 1120
    :cond_83
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;->mScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    .line 1121
    const/4 v9, 0x0

    const/4 v10, 0x0

    move v3, p3

    move/from16 v4, p4

    .line 1120
    invoke-virtual/range {v0 .. v10}, Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;->fling(IIIIIIIIII)V

    goto/16 :goto_8

    .line 1097
    .end local v2    # "startY":I
    .end local v5    # "minX":I
    .end local v6    # "maxX":I
    .end local v7    # "minY":I
    .end local v8    # "maxY":I
    :cond_8f
    move v6, v1

    .restart local v6    # "maxX":I
    move v5, v1

    .restart local v5    # "minX":I
    goto :goto_24

    .line 1105
    .restart local v2    # "startY":I
    :cond_92
    move v8, v2

    .restart local v8    # "maxY":I
    move v7, v2

    .restart local v7    # "minY":I
    goto :goto_3f
.end method

.method public run()V
    .registers 8

    .prologue
    .line 1127
    iget-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;->mScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    invoke-virtual {v3}, Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;->isFinished()Z

    move-result v3

    if-eqz v3, :cond_9

    .line 1154
    :cond_8
    :goto_8
    return-void

    .line 1131
    :cond_9
    iget-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v3}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 1132
    .local v0, "imageView":Landroid/widget/ImageView;
    if-eqz v0, :cond_8

    iget-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;->mScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    invoke-virtual {v3}, Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;->computeScrollOffset()Z

    move-result v3

    if-eqz v3, :cond_8

    .line 1134
    iget-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;->mScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    invoke-virtual {v3}, Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;->getCurrX()I

    move-result v1

    .line 1135
    .local v1, "newX":I
    iget-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;->mScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    invoke-virtual {v3}, Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;->getCurrY()I

    move-result v2

    .line 1137
    .local v2, "newY":I
    # getter for: Luk/co/senab/photoview/PhotoViewAttacher;->DEBUG:Z
    invoke-static {}, Luk/co/senab/photoview/PhotoViewAttacher;->access$2()Z

    move-result v3

    if-eqz v3, :cond_65

    .line 1138
    invoke-static {}, Luk/co/senab/photoview/log/LogManager;->getLogger()Luk/co/senab/photoview/log/Logger;

    move-result-object v3

    .line 1139
    const-string v4, "PhotoViewAttacher"

    .line 1140
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "fling run(). CurrentX:"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v6, p0, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;->mCurrentX:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " CurrentY:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 1141
    iget v6, p0, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;->mCurrentY:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " NewX:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " NewY:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 1142
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 1140
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1138
    invoke-interface {v3, v4, v5}, Luk/co/senab/photoview/log/Logger;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1145
    :cond_65
    iget-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    # getter for: Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;
    invoke-static {v3}, Luk/co/senab/photoview/PhotoViewAttacher;->access$0(Luk/co/senab/photoview/PhotoViewAttacher;)Landroid/graphics/Matrix;

    move-result-object v3

    iget v4, p0, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;->mCurrentX:I

    sub-int/2addr v4, v1

    int-to-float v4, v4

    iget v5, p0, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;->mCurrentY:I

    sub-int/2addr v5, v2

    int-to-float v5, v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 1146
    iget-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    iget-object v4, p0, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v4}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v4

    # invokes: Luk/co/senab/photoview/PhotoViewAttacher;->setImageViewMatrix(Landroid/graphics/Matrix;)V
    invoke-static {v3, v4}, Luk/co/senab/photoview/PhotoViewAttacher;->access$3(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/graphics/Matrix;)V

    .line 1148
    iput v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;->mCurrentX:I

    .line 1149
    iput v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;->mCurrentY:I

    .line 1152
    invoke-static {v0, p0}, Luk/co/senab/photoview/Compat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    goto :goto_8
.end method
