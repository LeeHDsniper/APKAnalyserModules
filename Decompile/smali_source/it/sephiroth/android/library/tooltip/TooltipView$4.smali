.class Lit/sephiroth/android/library/tooltip/TooltipView$4;
.super Ljava/lang/Object;
.source "TooltipView.java"

# interfaces
.implements Lcom/nineoldandroids/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lit/sephiroth/android/library/tooltip/TooltipView;->fadeOut(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field cancelled:Z

.field final synthetic this$0:Lit/sephiroth/android/library/tooltip/TooltipView;

.field final synthetic val$remove:Z


# direct methods
.method constructor <init>(Lit/sephiroth/android/library/tooltip/TooltipView;Z)V
    .registers 3

    .prologue
    .line 260
    iput-object p1, p0, Lit/sephiroth/android/library/tooltip/TooltipView$4;->this$0:Lit/sephiroth/android/library/tooltip/TooltipView;

    iput-boolean p2, p0, Lit/sephiroth/android/library/tooltip/TooltipView$4;->val$remove:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Lcom/nineoldandroids/animation/Animator;)V
    .registers 3
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 282
    const/4 v0, 0x1

    iput-boolean v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView$4;->cancelled:Z

    .line 283
    return-void
.end method

.method public onAnimationEnd(Lcom/nineoldandroids/animation/Animator;)V
    .registers 4
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 271
    iget-boolean v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView$4;->cancelled:Z

    if-eqz v0, :cond_5

    .line 277
    :goto_4
    return-void

    .line 273
    :cond_5
    iget-boolean v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView$4;->val$remove:Z

    if-eqz v0, :cond_e

    .line 274
    iget-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView$4;->this$0:Lit/sephiroth/android/library/tooltip/TooltipView;

    # invokes: Lit/sephiroth/android/library/tooltip/TooltipView;->fireOnHideCompleted()V
    invoke-static {v0}, Lit/sephiroth/android/library/tooltip/TooltipView;->access$400(Lit/sephiroth/android/library/tooltip/TooltipView;)V

    .line 276
    :cond_e
    iget-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView$4;->this$0:Lit/sephiroth/android/library/tooltip/TooltipView;

    const/4 v1, 0x0

    iput-object v1, v0, Lit/sephiroth/android/library/tooltip/TooltipView;->mShowAnimation:Lcom/nineoldandroids/animation/Animator;

    goto :goto_4
.end method

.method public onAnimationRepeat(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 288
    return-void
.end method

.method public onAnimationStart(Lcom/nineoldandroids/animation/Animator;)V
    .registers 3
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 265
    const/4 v0, 0x0

    iput-boolean v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView$4;->cancelled:Z

    .line 266
    return-void
.end method
