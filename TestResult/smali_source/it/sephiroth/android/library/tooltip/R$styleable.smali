.class public final Lit/sephiroth/android/library/tooltip/R$styleable;
.super Ljava/lang/Object;
.source "R.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/tooltip/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "styleable"
.end annotation


# static fields
.field public static final TooltipLayout:[I

.field public static final TooltipLayout_ttlm_arrowRatio:I = 0x5

.field public static final TooltipLayout_ttlm_backgroundColor:I = 0x2

.field public static final TooltipLayout_ttlm_cornerRadius:I = 0x4

.field public static final TooltipLayout_ttlm_padding:I = 0x0

.field public static final TooltipLayout_ttlm_strokeColor:I = 0x1

.field public static final TooltipLayout_ttlm_strokeWeight:I = 0x3


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 35
    const/4 v0, 0x6

    new-array v0, v0, [I

    fill-array-data v0, :array_a

    sput-object v0, Lit/sephiroth/android/library/tooltip/R$styleable;->TooltipLayout:[I

    return-void

    nop

    :array_a
    .array-data 4
        0x7f0101ba
        0x7f0101bb
        0x7f0101bc
        0x7f0101bd
        0x7f0101be
        0x7f0101bf
    .end array-data
.end method
