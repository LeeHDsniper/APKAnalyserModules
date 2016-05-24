.class Lit/sephiroth/android/library/tooltip/TooltipView$1;
.super Ljava/lang/Object;
.source "TooltipView.java"

# interfaces
.implements Lcom/nineoldandroids/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lit/sephiroth/android/library/tooltip/TooltipView;->fadeIn()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field cancelled:Z

.field final synthetic this$0:Lit/sephiroth/android/library/tooltip/TooltipView;


# direct methods
.method constructor <init>(Lit/sephiroth/android/library/tooltip/TooltipView;)V
    .registers 2

    .prologue
    .line 153
    iput-object p1, p0, Lit/sephiroth/android/library/tooltip/TooltipView$1;->this$0:Lit/sephiroth/android/library/tooltip/TooltipView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Lcom/nineoldandroids/animation/Animator;)V
    .registers 3
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 174
    const/4 v0, 0x1

    iput-boolean v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView$1;->cancelled:Z

    .line 175
    return-void
.end method

.method public onAnimationEnd(Lcom/nineoldandroids/animation/Animator;)V
    .registers 6
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 165
    iget-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView$1;->this$0:Lit/sephiroth/android/library/tooltip/TooltipView;

    # getter for: Lit/sephiroth/android/library/tooltip/TooltipView;->tooltipListener:Lit/sephiroth/android/library/tooltip/TooltipView$OnToolTipListener;
    invoke-static {v0}, Lit/sephiroth/android/library/tooltip/TooltipView;->access$000(Lit/sephiroth/android/library/tooltip/TooltipView;)Lit/sephiroth/android/library/tooltip/TooltipView$OnToolTipListener;

    move-result-object v0

    if-eqz v0, :cond_22

    iget-boolean v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView$1;->cancelled:Z

    if-nez v0, :cond_22

    .line 166
    iget-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView$1;->this$0:Lit/sephiroth/android/library/tooltip/TooltipView;

    # getter for: Lit/sephiroth/android/library/tooltip/TooltipView;->tooltipListener:Lit/sephiroth/android/library/tooltip/TooltipView$OnToolTipListener;
    invoke-static {v0}, Lit/sephiroth/android/library/tooltip/TooltipView;->access$000(Lit/sephiroth/android/library/tooltip/TooltipView;)Lit/sephiroth/android/library/tooltip/TooltipView$OnToolTipListener;

    move-result-object v0

    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView$1;->this$0:Lit/sephiroth/android/library/tooltip/TooltipView;

    invoke-interface {v0, v1}, Lit/sephiroth/android/library/tooltip/TooltipView$OnToolTipListener;->onShowCompleted(Lit/sephiroth/android/library/tooltip/TooltipView;)V

    .line 167
    iget-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView$1;->this$0:Lit/sephiroth/android/library/tooltip/TooltipView;

    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView$1;->this$0:Lit/sephiroth/android/library/tooltip/TooltipView;

    # getter for: Lit/sephiroth/android/library/tooltip/TooltipView;->activateDelay:J
    invoke-static {v1}, Lit/sephiroth/android/library/tooltip/TooltipView;->access$100(Lit/sephiroth/android/library/tooltip/TooltipView;)J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lit/sephiroth/android/library/tooltip/TooltipView;->postActivate(J)V

    .line 169
    :cond_22
    return-void
.end method

.method public onAnimationRepeat(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 180
    return-void
.end method

.method public onAnimationStart(Lcom/nineoldandroids/animation/Animator;)V
    .registers 4
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    const/4 v1, 0x0

    .line 158
    iget-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipView$1;->this$0:Lit/sephiroth/android/library/tooltip/TooltipView;

    invoke-virtual {v0, v1}, Lit/sephiroth/android/library/tooltip/TooltipView;->setVisibility(I)V

    .line 159
    iput-boolean v1, p0, Lit/sephiroth/android/library/tooltip/TooltipView$1;->cancelled:Z

    .line 160
    return-void
.end method
