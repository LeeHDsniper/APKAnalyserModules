.class public Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaRectParameter;
.super Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;
.source "MoaRectParameter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter",
        "<[D>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 12
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;-><init>()V

    .line 13
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaRectParameter;->init()V

    .line 14
    invoke-virtual {p0, v0, v0, v0, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaRectParameter;->setValue(FFFF)V

    .line 15
    return-void
.end method

.method public constructor <init>(DDDD)V
    .registers 10
    .param p1, "left"    # D
    .param p3, "top"    # D
    .param p5, "right"    # D
    .param p7, "bottom"    # D

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;-><init>()V

    .line 28
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaRectParameter;->init()V

    .line 29
    invoke-virtual/range {p0 .. p8}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaRectParameter;->setValue(DDDD)V

    .line 30
    return-void
.end method

.method public constructor <init>(Landroid/graphics/RectF;)V
    .registers 6
    .param p1, "src"    # Landroid/graphics/RectF;

    .prologue
    .line 17
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;-><init>()V

    .line 18
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaRectParameter;->init()V

    .line 19
    iget v0, p1, Landroid/graphics/RectF;->left:F

    iget v1, p1, Landroid/graphics/RectF;->top:F

    iget v2, p1, Landroid/graphics/RectF;->right:F

    iget v3, p1, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaRectParameter;->setValue(FFFF)V

    .line 20
    return-void
.end method

.method private init()V
    .registers 2

    .prologue
    .line 23
    const/4 v0, 0x4

    new-array v0, v0, [D

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaRectParameter;->value:Ljava/lang/Object;

    .line 24
    const-string v0, "rect"

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaRectParameter;->type:Ljava/lang/String;

    .line 25
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 11

    .prologue
    .line 90
    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaRectParameter;

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaRectParameter;->value:Ljava/lang/Object;

    check-cast v0, [D

    const/4 v2, 0x0

    aget-wide v2, v0, v2

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaRectParameter;->value:Ljava/lang/Object;

    check-cast v0, [D

    const/4 v4, 0x1

    aget-wide v4, v0, v4

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaRectParameter;->value:Ljava/lang/Object;

    check-cast v0, [D

    const/4 v6, 0x2

    aget-wide v6, v0, v6

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaRectParameter;->value:Ljava/lang/Object;

    check-cast v0, [D

    const/4 v8, 0x3

    aget-wide v8, v0, v8

    invoke-direct/range {v1 .. v9}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaRectParameter;-><init>(DDDD)V

    return-object v1
.end method

.method public encode()Ljava/lang/Object;
    .registers 5

    .prologue
    .line 53
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 55
    .local v0, "array":Lorg/json/JSONArray;
    :try_start_5
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaRectParameter;->value:Ljava/lang/Object;

    check-cast v1, [D

    const/4 v2, 0x0

    aget-wide v2, v1, v2

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONArray;->put(D)Lorg/json/JSONArray;

    .line 56
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaRectParameter;->value:Ljava/lang/Object;

    check-cast v1, [D

    const/4 v2, 0x1

    aget-wide v2, v1, v2

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONArray;->put(D)Lorg/json/JSONArray;

    .line 57
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaRectParameter;->value:Ljava/lang/Object;

    check-cast v1, [D

    const/4 v2, 0x2

    aget-wide v2, v1, v2

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONArray;->put(D)Lorg/json/JSONArray;

    .line 58
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaRectParameter;->value:Ljava/lang/Object;

    check-cast v1, [D

    const/4 v2, 0x3

    aget-wide v2, v1, v2

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONArray;->put(D)Lorg/json/JSONArray;
    :try_end_2d
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_2d} :catch_2e

    .line 61
    :goto_2d
    return-object v0

    .line 59
    :catch_2e
    move-exception v1

    goto :goto_2d
.end method

.method public setValue(DDDD)V
    .registers 12
    .param p1, "left"    # D
    .param p3, "top"    # D
    .param p5, "right"    # D
    .param p7, "bottom"    # D

    .prologue
    .line 45
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaRectParameter;->value:Ljava/lang/Object;

    check-cast v0, [D

    const/4 v1, 0x0

    aput-wide p1, v0, v1

    .line 46
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaRectParameter;->value:Ljava/lang/Object;

    check-cast v0, [D

    const/4 v1, 0x1

    aput-wide p3, v0, v1

    .line 47
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaRectParameter;->value:Ljava/lang/Object;

    check-cast v0, [D

    const/4 v1, 0x2

    aput-wide p5, v0, v1

    .line 48
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaRectParameter;->value:Ljava/lang/Object;

    check-cast v0, [D

    const/4 v1, 0x3

    aput-wide p7, v0, v1

    .line 49
    return-void
.end method

.method public setValue(FFFF)V
    .registers 9
    .param p1, "left"    # F
    .param p2, "top"    # F
    .param p3, "right"    # F
    .param p4, "bottom"    # F

    .prologue
    .line 38
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaRectParameter;->value:Ljava/lang/Object;

    check-cast v0, [D

    const/4 v1, 0x0

    float-to-double v2, p1

    aput-wide v2, v0, v1

    .line 39
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaRectParameter;->value:Ljava/lang/Object;

    check-cast v0, [D

    const/4 v1, 0x1

    float-to-double v2, p2

    aput-wide v2, v0, v1

    .line 40
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaRectParameter;->value:Ljava/lang/Object;

    check-cast v0, [D

    const/4 v1, 0x2

    float-to-double v2, p3

    aput-wide v2, v0, v1

    .line 41
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaRectParameter;->value:Ljava/lang/Object;

    check-cast v0, [D

    const/4 v1, 0x3

    float-to-double v2, p4

    aput-wide v2, v0, v1

    .line 42
    return-void
.end method
