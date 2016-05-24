.class Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$3;
.super Landroid/animation/AnimatorListenerAdapter;
.source "LollipopRevealAnimatorImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->circularReveal(IIZLandroid/graphics/Point;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field isCancelled:Z

.field final synthetic this$0:Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;

.field final synthetic val$hideBeforeReveal:Z

.field final synthetic val$nextIndex:I

.field final synthetic val$previousIndex:I

.field final synthetic val$previousView:Landroid/view/View;


# direct methods
.method constructor <init>(Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;ZLandroid/view/View;II)V
    .registers 6
    .param p1, "this$0"    # Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;

    .prologue
    .line 144
    iput-object p1, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$3;->this$0:Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;

    iput-boolean p2, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$3;->val$hideBeforeReveal:Z

    iput-object p3, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$3;->val$previousView:Landroid/view/View;

    iput p4, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$3;->val$previousIndex:I

    iput p5, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$3;->val$nextIndex:I

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .registers 4
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 167
    const/4 v0, 0x1

    iput-boolean v0, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$3;->isCancelled:Z

    .line 168
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$3;->this$0:Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;

    const/4 v1, 0x0

    # setter for: Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->mAnimatorAnimating:Z
    invoke-static {v0, v1}, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->access$002(Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;Z)Z

    .line 169
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationCancel(Landroid/animation/Animator;)V

    .line 170
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 5
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 149
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 150
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$3;->this$0:Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;

    const/4 v1, 0x0

    # setter for: Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->mAnimatorAnimating:Z
    invoke-static {v0, v1}, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->access$002(Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;Z)Z

    .line 152
    iget-boolean v0, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$3;->val$hideBeforeReveal:Z

    if-nez v0, :cond_14

    .line 153
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$3;->val$previousView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 156
    :cond_14
    iget-boolean v0, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$3;->isCancelled:Z

    if-nez v0, :cond_2e

    .line 157
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$3;->this$0:Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;

    iget-object v0, v0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    iget v1, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$3;->val$previousIndex:I

    iget v2, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$3;->val$nextIndex:I

    invoke-virtual {v0, v1, v2}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->onAnimationCompleted(II)V

    .line 158
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$3;->this$0:Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;

    iget-object v0, v0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    iget v1, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$3;->val$previousIndex:I

    iget v2, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$3;->val$nextIndex:I

    invoke-virtual {v0, v1, v2}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->onViewChanged(II)V

    .line 160
    :cond_2e
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .registers 5
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 174
    iget-boolean v0, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$3;->val$hideBeforeReveal:Z

    if-nez v0, :cond_f

    .line 175
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$3;->this$0:Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;

    iget-object v0, v0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    iget v1, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$3;->val$previousIndex:I

    iget v2, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$3;->val$nextIndex:I

    invoke-virtual {v0, v1, v2}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->onAnimationStarted(II)V

    .line 177
    :cond_f
    return-void
.end method
