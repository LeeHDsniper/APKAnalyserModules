.class Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "LollipopRevealAnimatorImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->circularHide(IILandroid/graphics/Point;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field isCancelled:Z

.field final synthetic this$0:Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;

.field final synthetic val$nextIndex:I

.field final synthetic val$origin:Landroid/graphics/Point;

.field final synthetic val$previousIndex:I


# direct methods
.method constructor <init>(Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;IILandroid/graphics/Point;)V
    .registers 5
    .param p1, "this$0"    # Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;

    .prologue
    .line 48
    iput-object p1, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$1;->this$0:Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;

    iput p2, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$1;->val$previousIndex:I

    iput p3, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$1;->val$nextIndex:I

    iput-object p4, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$1;->val$origin:Landroid/graphics/Point;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .registers 4
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 62
    const/4 v0, 0x1

    iput-boolean v0, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$1;->isCancelled:Z

    .line 63
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$1;->this$0:Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;

    const/4 v1, 0x0

    # setter for: Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->mAnimatorAnimating:Z
    invoke-static {v0, v1}, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->access$002(Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;Z)Z

    .line 64
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 7
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 71
    iget-boolean v0, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$1;->isCancelled:Z

    if-nez v0, :cond_13

    .line 72
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 73
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$1;->this$0:Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;

    iget v1, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$1;->val$previousIndex:I

    iget v2, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$1;->val$nextIndex:I

    const/4 v3, 0x1

    iget-object v4, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$1;->val$origin:Landroid/graphics/Point;

    # invokes: Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->circularReveal(IIZLandroid/graphics/Point;)V
    invoke-static {v0, v1, v2, v3, v4}, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->access$100(Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;IIZLandroid/graphics/Point;)V

    .line 75
    :cond_13
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .registers 5
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 53
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 54
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$1;->this$0:Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;

    iget-object v0, v0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    iget v1, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$1;->val$previousIndex:I

    iget v2, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$1;->val$nextIndex:I

    invoke-virtual {v0, v1, v2}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->onAnimationStarted(II)V

    .line 55
    return-void
.end method
