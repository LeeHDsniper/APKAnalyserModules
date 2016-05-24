.class Lcom/adobe/creativesdk/aviary/widget/HighlightView$1;
.super Ljava/lang/Object;
.source "HighlightView.java"

# interfaces
.implements Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/widget/HighlightView;->animateTo(Landroid/view/View;Landroid/graphics/Matrix;Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

.field final synthetic val$anim1:Lcom/nineoldandroids/animation/ValueAnimator;

.field final synthetic val$anim2:Lcom/nineoldandroids/animation/ValueAnimator;

.field final synthetic val$anim3:Lcom/nineoldandroids/animation/ValueAnimator;

.field final synthetic val$anim4:Lcom/nineoldandroids/animation/ValueAnimator;

.field final synthetic val$parent:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/HighlightView;Lcom/nineoldandroids/animation/ValueAnimator;Lcom/nineoldandroids/animation/ValueAnimator;Lcom/nineoldandroids/animation/ValueAnimator;Lcom/nineoldandroids/animation/ValueAnimator;Landroid/view/View;)V
    .registers 7
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    .prologue
    .line 575
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$1;->val$anim1:Lcom/nineoldandroids/animation/ValueAnimator;

    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$1;->val$anim2:Lcom/nineoldandroids/animation/ValueAnimator;

    iput-object p4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$1;->val$anim3:Lcom/nineoldandroids/animation/ValueAnimator;

    iput-object p5, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$1;->val$anim4:Lcom/nineoldandroids/animation/ValueAnimator;

    iput-object p6, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$1;->val$parent:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Lcom/nineoldandroids/animation/ValueAnimator;)V
    .registers 7
    .param p1, "animation"    # Lcom/nineoldandroids/animation/ValueAnimator;

    .prologue
    .line 578
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$1;->val$anim1:Lcom/nineoldandroids/animation/ValueAnimator;

    invoke-virtual {v4}, Lcom/nineoldandroids/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 579
    .local v0, "value1":I
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$1;->val$anim2:Lcom/nineoldandroids/animation/ValueAnimator;

    invoke-virtual {v4}, Lcom/nineoldandroids/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 580
    .local v1, "value2":I
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$1;->val$anim3:Lcom/nineoldandroids/animation/ValueAnimator;

    invoke-virtual {v4}, Lcom/nineoldandroids/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 581
    .local v2, "value3":I
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$1;->val$anim4:Lcom/nineoldandroids/animation/ValueAnimator;

    invoke-virtual {v4}, Lcom/nineoldandroids/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 583
    .local v3, "value4":I
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mDrawRect:Landroid/graphics/Rect;
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->access$000(Lcom/adobe/creativesdk/aviary/widget/HighlightView;)Landroid/graphics/Rect;

    move-result-object v4

    iput v0, v4, Landroid/graphics/Rect;->left:I

    .line 584
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mDrawRect:Landroid/graphics/Rect;
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->access$000(Lcom/adobe/creativesdk/aviary/widget/HighlightView;)Landroid/graphics/Rect;

    move-result-object v4

    iput v1, v4, Landroid/graphics/Rect;->right:I

    .line 585
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mDrawRect:Landroid/graphics/Rect;
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->access$000(Lcom/adobe/creativesdk/aviary/widget/HighlightView;)Landroid/graphics/Rect;

    move-result-object v4

    iput v2, v4, Landroid/graphics/Rect;->top:I

    .line 586
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mDrawRect:Landroid/graphics/Rect;
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->access$000(Lcom/adobe/creativesdk/aviary/widget/HighlightView;)Landroid/graphics/Rect;

    move-result-object v4

    iput v3, v4, Landroid/graphics/Rect;->bottom:I

    .line 587
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$1;->val$parent:Landroid/view/View;

    if-eqz v4, :cond_59

    .line 588
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$1;->val$parent:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->invalidate()V

    .line 590
    :cond_59
    return-void
.end method
