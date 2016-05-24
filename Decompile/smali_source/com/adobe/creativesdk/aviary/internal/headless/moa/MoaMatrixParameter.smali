.class public Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMatrixParameter;
.super Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;
.source "MoaMatrixParameter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter",
        "<",
        "Landroid/graphics/Matrix;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x450fe31bd243fa97L


# instance fields
.field private matrix:Landroid/graphics/Matrix;


# direct methods
.method public constructor <init>(Landroid/graphics/Matrix;)V
    .registers 3
    .param p1, "value"    # Landroid/graphics/Matrix;

    .prologue
    .line 19
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;-><init>()V

    .line 20
    const-string v0, "matrix"

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMatrixParameter;->type:Ljava/lang/String;

    .line 21
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMatrixParameter;->matrix:Landroid/graphics/Matrix;

    .line 22
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 4

    .prologue
    .line 49
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMatrixParameter;

    new-instance v1, Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMatrixParameter;->matrix:Landroid/graphics/Matrix;

    invoke-direct {v1, v2}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMatrixParameter;-><init>(Landroid/graphics/Matrix;)V

    return-object v0
.end method

.method public encode()Ljava/lang/Object;
    .registers 8

    .prologue
    const/16 v6, 0x9

    .line 27
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 29
    .local v0, "array":Lorg/json/JSONArray;
    new-array v3, v6, [F

    .line 30
    .local v3, "values":[F
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMatrixParameter;->matrix:Landroid/graphics/Matrix;

    invoke-virtual {v4, v3}, Landroid/graphics/Matrix;->getValues([F)V

    .line 32
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_f
    if-ge v2, v6, :cond_1f

    .line 34
    :try_start_11
    aget v4, v3, v2

    float-to-double v4, v4

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONArray;->put(D)Lorg/json/JSONArray;
    :try_end_17
    .catch Lorg/json/JSONException; {:try_start_11 .. :try_end_17} :catch_1a

    .line 32
    :goto_17
    add-int/lit8 v2, v2, 0x1

    goto :goto_f

    .line 35
    :catch_1a
    move-exception v1

    .line 36
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_17

    .line 39
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_1f
    return-object v0
.end method
