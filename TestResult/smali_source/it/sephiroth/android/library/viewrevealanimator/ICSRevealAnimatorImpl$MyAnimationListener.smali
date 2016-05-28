.class Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl$MyAnimationListener;
.super Ljava/lang/Object;
.source "ICSRevealAnimatorImpl.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyAnimationListener"
.end annotation


# instance fields
.field final childIndex:I

.field final prevIndex:I

.field final synthetic this$0:Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;


# direct methods
.method public constructor <init>(Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;II)V
    .registers 4
    .param p1, "this$0"    # Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;
    .param p2, "previousChild"    # I
    .param p3, "childIndex"    # I

    .prologue
    .line 83
    iput-object p1, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl$MyAnimationListener;->this$0:Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    iput p2, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl$MyAnimationListener;->prevIndex:I

    .line 85
    iput p3, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl$MyAnimationListener;->childIndex:I

    .line 86
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .registers 5
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 98
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl$MyAnimationListener;->this$0:Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;

    iget-object v0, v0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    iget v1, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl$MyAnimationListener;->prevIndex:I

    iget v2, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl$MyAnimationListener;->childIndex:I

    invoke-virtual {v0, v1, v2}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->onAnimationCompleted(II)V

    .line 99
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl$MyAnimationListener;->this$0:Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;

    iget-object v0, v0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    iget v1, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl$MyAnimationListener;->prevIndex:I

    iget v2, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl$MyAnimationListener;->childIndex:I

    invoke-virtual {v0, v1, v2}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->onViewChanged(II)V

    .line 100
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 105
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .registers 5
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 90
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl$MyAnimationListener;->this$0:Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;

    iget-object v0, v0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    iget v1, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl$MyAnimationListener;->prevIndex:I

    iget v2, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl$MyAnimationListener;->childIndex:I

    invoke-virtual {v0, v1, v2}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->onAnimationStarted(II)V

    .line 91
    return-void
.end method
