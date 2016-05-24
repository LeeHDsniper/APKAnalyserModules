.class public Lcom/adobe/creativesdk/aviary/internal/graphics/animation/ExpoInterpolator;
.super Ljava/lang/Object;
.source "ExpoInterpolator.java"

# interfaces
.implements Landroid/view/animation/Interpolator;


# instance fields
.field private type:Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;)V
    .registers 2
    .param p1, "type"    # Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/ExpoInterpolator;->type:Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;

    .line 10
    return-void
.end method

.method private in(F)F
    .registers 6
    .param p1, "t"    # F

    .prologue
    .line 24
    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-nez v0, :cond_9

    const-wide/16 v0, 0x0

    :goto_7
    double-to-float v0, v0

    return v0

    :cond_9
    const-wide/high16 v0, 0x4000000000000000L

    const/high16 v2, 0x41200000

    const/high16 v3, 0x3f800000

    sub-float v3, p1, v3

    mul-float/2addr v2, v3

    float-to-double v2, v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    goto :goto_7
.end method

.method private inout(F)F
    .registers 10
    .param p1, "t"    # F

    .prologue
    const/4 v0, 0x0

    const-wide/high16 v6, 0x3fe0000000000000L

    const-wide/high16 v4, 0x4000000000000000L

    const/high16 v1, 0x3f800000

    .line 32
    cmpl-float v2, p1, v0

    if-nez v2, :cond_c

    .line 43
    :goto_b
    return v0

    .line 35
    :cond_c
    cmpl-float v0, p1, v1

    if-ltz v0, :cond_12

    move v0, v1

    .line 36
    goto :goto_b

    .line 38
    :cond_12
    const/high16 v0, 0x40000000

    mul-float/2addr p1, v0

    .line 39
    cmpg-float v0, p1, v1

    if-gez v0, :cond_26

    .line 40
    const/high16 v0, 0x41200000

    sub-float v1, p1, v1

    mul-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    mul-double/2addr v0, v6

    double-to-float v0, v0

    goto :goto_b

    .line 42
    :cond_26
    sub-float/2addr p1, v1

    .line 43
    const/high16 v0, -0x3ee00000

    mul-float/2addr v0, p1

    float-to-double v0, v0

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    neg-double v0, v0

    add-double/2addr v0, v4

    mul-double/2addr v0, v6

    double-to-float v0, v0

    goto :goto_b
.end method

.method private out(F)F
    .registers 8
    .param p1, "t"    # F

    .prologue
    const-wide/high16 v0, 0x3ff0000000000000L

    .line 28
    const/high16 v2, 0x3f800000

    cmpl-float v2, p1, v2

    if-ltz v2, :cond_a

    :goto_8
    double-to-float v0, v0

    return v0

    :cond_a
    const-wide/high16 v2, 0x4000000000000000L

    const/high16 v4, -0x3ee00000

    mul-float/2addr v4, p1

    float-to-double v4, v4

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    neg-double v2, v2

    add-double/2addr v0, v2

    goto :goto_8
.end method


# virtual methods
.method public getInterpolation(F)F
    .registers 4
    .param p1, "t"    # F

    .prologue
    .line 13
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/ExpoInterpolator;->type:Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;->IN:Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;

    if-ne v0, v1, :cond_b

    .line 14
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/ExpoInterpolator;->in(F)F

    move-result v0

    .line 20
    :goto_a
    return v0

    .line 15
    :cond_b
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/ExpoInterpolator;->type:Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;->OUT:Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;

    if-ne v0, v1, :cond_16

    .line 16
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/ExpoInterpolator;->out(F)F

    move-result v0

    goto :goto_a

    .line 17
    :cond_16
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/ExpoInterpolator;->type:Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;->INOUT:Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;

    if-ne v0, v1, :cond_21

    .line 18
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/ExpoInterpolator;->inout(F)F

    move-result v0

    goto :goto_a

    .line 20
    :cond_21
    const/4 v0, 0x0

    goto :goto_a
.end method
