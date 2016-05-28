.class Landroid/support/design/widget/ViewUtils;
.super Ljava/lang/Object;
.source "ViewUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/design/widget/ViewUtils$ViewUtilsImplLollipop;,
        Landroid/support/design/widget/ViewUtils$ViewUtilsImplBase;,
        Landroid/support/design/widget/ViewUtils$ViewUtilsImpl;
    }
.end annotation


# static fields
.field static final DEFAULT_ANIMATOR_CREATOR:Landroid/support/design/widget/ValueAnimatorCompat$Creator;

.field private static final IMPL:Landroid/support/design/widget/ViewUtils$ViewUtilsImpl;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v2, 0x0

    .line 24
    new-instance v1, Landroid/support/design/widget/ViewUtils$1;

    invoke-direct {v1}, Landroid/support/design/widget/ViewUtils$1;-><init>()V

    sput-object v1, Landroid/support/design/widget/ViewUtils;->DEFAULT_ANIMATOR_CREATOR:Landroid/support/design/widget/ValueAnimatorCompat$Creator;

    .line 55
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 56
    .local v0, "version":I
    const/16 v1, 0x15

    if-lt v0, v1, :cond_16

    .line 57
    new-instance v1, Landroid/support/design/widget/ViewUtils$ViewUtilsImplLollipop;

    invoke-direct {v1, v2}, Landroid/support/design/widget/ViewUtils$ViewUtilsImplLollipop;-><init>(Landroid/support/design/widget/ViewUtils$1;)V

    sput-object v1, Landroid/support/design/widget/ViewUtils;->IMPL:Landroid/support/design/widget/ViewUtils$ViewUtilsImpl;

    .line 61
    :goto_15
    return-void

    .line 59
    :cond_16
    new-instance v1, Landroid/support/design/widget/ViewUtils$ViewUtilsImplBase;

    invoke-direct {v1, v2}, Landroid/support/design/widget/ViewUtils$ViewUtilsImplBase;-><init>(Landroid/support/design/widget/ViewUtils$1;)V

    sput-object v1, Landroid/support/design/widget/ViewUtils;->IMPL:Landroid/support/design/widget/ViewUtils$ViewUtilsImpl;

    goto :goto_15
.end method

.method static createAnimator()Landroid/support/design/widget/ValueAnimatorCompat;
    .registers 1

    .prologue
    .line 68
    sget-object v0, Landroid/support/design/widget/ViewUtils;->DEFAULT_ANIMATOR_CREATOR:Landroid/support/design/widget/ValueAnimatorCompat$Creator;

    invoke-interface {v0}, Landroid/support/design/widget/ValueAnimatorCompat$Creator;->createAnimator()Landroid/support/design/widget/ValueAnimatorCompat;

    move-result-object v0

    return-object v0
.end method
