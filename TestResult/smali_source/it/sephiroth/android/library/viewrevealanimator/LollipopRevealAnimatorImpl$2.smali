.class Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$2;
.super Ljava/lang/Object;
.source "LollipopRevealAnimatorImpl.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->circularReveal(IIZLandroid/graphics/Point;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;

.field final synthetic val$hideBeforeReveal:Z

.field final synthetic val$nextIndex:I

.field final synthetic val$origin:Landroid/graphics/Point;

.field final synthetic val$previousIndex:I

.field final synthetic val$targetView:Landroid/view/View;


# direct methods
.method constructor <init>(Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;Landroid/view/View;IIZLandroid/graphics/Point;)V
    .registers 7
    .param p1, "this$0"    # Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;

    .prologue
    .line 109
    iput-object p1, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$2;->this$0:Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;

    iput-object p2, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$2;->val$targetView:Landroid/view/View;

    iput p3, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$2;->val$previousIndex:I

    iput p4, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$2;->val$nextIndex:I

    iput-boolean p5, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$2;->val$hideBeforeReveal:Z

    iput-object p6, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$2;->val$origin:Landroid/graphics/Point;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .registers 6

    .prologue
    .line 112
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$2;->val$targetView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 118
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$2;->val$targetView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    if-eqz v0, :cond_19

    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$2;->val$targetView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    if-nez v0, :cond_35

    .line 119
    :cond_19
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$2;->this$0:Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;

    const/4 v1, 0x0

    # setter for: Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->mAnimatorAnimating:Z
    invoke-static {v0, v1}, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->access$002(Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;Z)Z

    .line 120
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$2;->this$0:Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;

    iget v1, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$2;->val$previousIndex:I

    iget v2, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$2;->val$nextIndex:I

    invoke-virtual {v0, v1, v2}, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->showOnlyNoAnimation(II)V

    .line 121
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$2;->this$0:Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;

    iget-object v0, v0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    iget v1, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$2;->val$previousIndex:I

    iget v2, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$2;->val$nextIndex:I

    invoke-virtual {v0, v1, v2}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->onViewChanged(II)V

    .line 125
    :goto_33
    const/4 v0, 0x1

    return v0

    .line 123
    :cond_35
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$2;->this$0:Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;

    iget v1, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$2;->val$previousIndex:I

    iget v2, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$2;->val$nextIndex:I

    iget-boolean v3, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$2;->val$hideBeforeReveal:Z

    iget-object v4, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$2;->val$origin:Landroid/graphics/Point;

    # invokes: Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->circularReveal(IIZLandroid/graphics/Point;)V
    invoke-static {v0, v1, v2, v3, v4}, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->access$100(Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;IIZLandroid/graphics/Point;)V

    goto :goto_33
.end method
