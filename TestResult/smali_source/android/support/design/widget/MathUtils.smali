.class Landroid/support/design/widget/MathUtils;
.super Ljava/lang/Object;
.source "MathUtils.java"


# direct methods
.method static constrain(III)I
    .registers 3
    .param p0, "amount"    # I
    .param p1, "low"    # I
    .param p2, "high"    # I

    .prologue
    .line 22
    if-ge p0, p1, :cond_3

    .end local p1    # "low":I
    :goto_2
    return p1

    .restart local p1    # "low":I
    :cond_3
    if-le p0, p2, :cond_7

    move p1, p2

    goto :goto_2

    :cond_7
    move p1, p0

    goto :goto_2
.end method
