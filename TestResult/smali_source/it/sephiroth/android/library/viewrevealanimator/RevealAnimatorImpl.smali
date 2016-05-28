.class abstract Lit/sephiroth/android/library/viewrevealanimator/RevealAnimatorImpl;
.super Ljava/lang/Object;
.source "RevealAnimatorImpl.java"

# interfaces
.implements Lit/sephiroth/android/library/viewrevealanimator/RevealAnimator;


# instance fields
.field protected final parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;


# direct methods
.method constructor <init>(Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;)V
    .registers 2
    .param p1, "animator"    # Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lit/sephiroth/android/library/viewrevealanimator/RevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    .line 12
    return-void
.end method
