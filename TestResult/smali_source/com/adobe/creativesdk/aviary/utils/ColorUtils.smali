.class public final Lcom/adobe/creativesdk/aviary/utils/ColorUtils;
.super Ljava/lang/Object;
.source "ColorUtils.java"


# direct methods
.method private static findMinimumAlpha(IID)I
    .registers 14
    .param p0, "foreground"    # I
    .param p1, "background"    # I
    .param p2, "minContrastRatio"    # D

    .prologue
    const/16 v9, 0xff

    const/16 v8, 0xa

    .line 19
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v5

    if-eq v5, v9, :cond_12

    .line 20
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v8, "background can not be translucent"

    invoke-direct {v5, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 24
    :cond_12
    invoke-static {p0, v9}, Lcom/adobe/creativesdk/aviary/utils/ColorUtils;->modifyAlpha(II)I

    move-result v4

    .line 25
    .local v4, "testForeground":I
    invoke-static {v4, p1}, Landroid/support/v4/graphics/ColorUtils;->calculateContrast(II)D

    move-result-wide v6

    .line 26
    .local v6, "testRatio":D
    cmpg-double v5, v6, p2

    if-gez v5, :cond_20

    .line 28
    const/4 v0, -0x1

    .line 53
    :cond_1f
    return v0

    .line 32
    :cond_20
    const/4 v2, 0x0

    .line 33
    .local v2, "numIterations":I
    const/4 v1, 0x0

    .line 34
    .local v1, "minAlpha":I
    const/16 v0, 0xff

    .line 36
    .local v0, "maxAlpha":I
    :goto_24
    if-gt v2, v8, :cond_1f

    sub-int v5, v0, v1

    if-le v5, v8, :cond_1f

    .line 38
    add-int v5, v1, v0

    div-int/lit8 v3, v5, 0x2

    .line 40
    .local v3, "testAlpha":I
    invoke-static {p0, v3}, Lcom/adobe/creativesdk/aviary/utils/ColorUtils;->modifyAlpha(II)I

    move-result v4

    .line 41
    invoke-static {v4, p1}, Landroid/support/v4/graphics/ColorUtils;->calculateContrast(II)D

    move-result-wide v6

    .line 43
    cmpg-double v5, v6, p2

    if-gez v5, :cond_3e

    .line 44
    move v1, v3

    .line 49
    :goto_3b
    add-int/lit8 v2, v2, 0x1

    .line 50
    goto :goto_24

    .line 46
    :cond_3e
    move v0, v3

    goto :goto_3b
.end method

.method public static getTextColorForBackground(IF)I
    .registers 8
    .param p0, "backgroundColor"    # I
    .param p1, "minContrastRatio"    # F

    .prologue
    const/high16 v3, -0x1000000

    const/4 v2, -0x1

    .line 58
    float-to-double v4, p1

    .line 59
    invoke-static {v2, p0, v4, v5}, Lcom/adobe/creativesdk/aviary/utils/ColorUtils;->findMinimumAlpha(IID)I

    move-result v1

    .line 61
    .local v1, "whiteMinAlpha":I
    if-ltz v1, :cond_f

    .line 62
    invoke-static {v2, v1}, Lcom/adobe/creativesdk/aviary/utils/ColorUtils;->modifyAlpha(II)I

    move-result v2

    .line 75
    :cond_e
    :goto_e
    return v2

    .line 67
    :cond_f
    float-to-double v4, p1

    .line 68
    invoke-static {v3, p0, v4, v5}, Lcom/adobe/creativesdk/aviary/utils/ColorUtils;->findMinimumAlpha(IID)I

    move-result v0

    .line 70
    .local v0, "blackMinAlpha":I
    if-ltz v0, :cond_e

    .line 71
    invoke-static {v3, v0}, Lcom/adobe/creativesdk/aviary/utils/ColorUtils;->modifyAlpha(II)I

    move-result v2

    goto :goto_e
.end method

.method public static modifyAlpha(II)I
    .registers 4
    .param p0, "color"    # I
    .param p1, "alpha"    # I

    .prologue
    .line 82
    const v0, 0xffffff

    and-int/2addr v0, p0

    shl-int/lit8 v1, p1, 0x18

    or-int/2addr v0, v1

    return v0
.end method
