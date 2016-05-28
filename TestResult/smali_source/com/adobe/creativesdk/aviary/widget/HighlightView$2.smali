.class Lcom/adobe/creativesdk/aviary/widget/HighlightView$2;
.super Ljava/lang/Object;
.source "HighlightView.java"

# interfaces
.implements Lcom/nineoldandroids/animation/Animator$AnimatorListener;


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

.field final synthetic val$maintainAspectRatio:Z

.field final synthetic val$parent:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/HighlightView;ZLandroid/view/View;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    .prologue
    .line 598
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    iput-boolean p2, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$2;->val$maintainAspectRatio:Z

    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$2;->val$parent:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 618
    return-void
.end method

.method public onAnimationEnd(Lcom/nineoldandroids/animation/Animator;)V
    .registers 4
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 606
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$2;->val$maintainAspectRatio:Z

    # setter for: Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mMaintainAspectRatio:Z
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->access$102(Lcom/adobe/creativesdk/aviary/widget/HighlightView;Z)Z

    .line 607
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mRunning:Z

    .line 608
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->invalidate()V

    .line 610
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$2;->val$parent:Landroid/view/View;

    if-eqz v0, :cond_1a

    .line 611
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$2;->val$parent:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->postInvalidate()V

    .line 613
    :cond_1a
    return-void
.end method

.method public onAnimationRepeat(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 623
    return-void
.end method

.method public onAnimationStart(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 602
    return-void
.end method
