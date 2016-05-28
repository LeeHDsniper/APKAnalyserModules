.class public final Lit/sephiroth/android/library/viewrevealanimator/R$styleable;
.super Ljava/lang/Object;
.source "R.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/viewrevealanimator/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "styleable"
.end annotation


# static fields
.field public static final ViewRelealAnimator:[I

.field public static final ViewRelealAnimator_android_animateFirstView:I = 0x5

.field public static final ViewRelealAnimator_android_animationDuration:I = 0x1

.field public static final ViewRelealAnimator_android_inAnimation:I = 0x3

.field public static final ViewRelealAnimator_android_interpolator:I = 0x2

.field public static final ViewRelealAnimator_android_measureAllChildren:I = 0x0

.field public static final ViewRelealAnimator_android_outAnimation:I = 0x4

.field public static final ViewRelealAnimator_vra_hideBeforeReveal:I = 0x6


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 14
    const/4 v0, 0x7

    new-array v0, v0, [I

    fill-array-data v0, :array_a

    sput-object v0, Lit/sephiroth/android/library/viewrevealanimator/R$styleable;->ViewRelealAnimator:[I

    return-void

    nop

    :array_a
    .array-data 4
        0x101010a
        0x1010112
        0x1010141
        0x1010177
        0x1010178
        0x10102d5
        0x7f0101c5
    .end array-data
.end method
