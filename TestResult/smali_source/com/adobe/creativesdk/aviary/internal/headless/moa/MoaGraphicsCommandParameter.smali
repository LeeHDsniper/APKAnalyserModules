.class public Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;
.super Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;
.source "MoaGraphicsCommandParameter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter",
        "<[F>;"
    }
.end annotation


# static fields
.field static final FORMATTER:Ljava/text/DecimalFormat;

.field static final SYMBOLS:Ljava/text/DecimalFormatSymbols;

.field private static final serialVersionUID:J = 0x11a8e22da6aaa51eL


# instance fields
.field private commandType:I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 23
    new-instance v0, Ljava/text/DecimalFormatSymbols;

    invoke-direct {v0}, Ljava/text/DecimalFormatSymbols;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->SYMBOLS:Ljava/text/DecimalFormatSymbols;

    .line 24
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->SYMBOLS:Ljava/text/DecimalFormatSymbols;

    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljava/text/DecimalFormatSymbols;->setDecimalSeparator(C)V

    .line 25
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v1, "##.#####"

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->SYMBOLS:Ljava/text/DecimalFormatSymbols;

    invoke-direct {v0, v1, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;Ljava/text/DecimalFormatSymbols;)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->FORMATTER:Ljava/text/DecimalFormat;

    .line 26
    return-void
.end method

.method public constructor <init>(I)V
    .registers 2
    .param p1, "type"    # I

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;-><init>()V

    .line 29
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->init(I)V

    .line 30
    return-void
.end method

.method public constructor <init>(IFF)V
    .registers 4
    .param p1, "type"    # I
    .param p2, "x"    # F
    .param p3, "y"    # F

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;-><init>()V

    .line 33
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->init(I)V

    .line 34
    invoke-virtual {p0, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->setPoint(FF)V

    .line 35
    return-void
.end method

.method public constructor <init>(IFFFF)V
    .registers 6
    .param p1, "type"    # I
    .param p2, "x"    # F
    .param p3, "y"    # F
    .param p4, "x1"    # F
    .param p5, "y1"    # F

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;-><init>()V

    .line 38
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->init(I)V

    .line 39
    invoke-virtual {p0, p2, p3, p4, p5}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->setPoint(FFFF)V

    .line 40
    return-void
.end method

.method private init(I)V
    .registers 4
    .param p1, "type"    # I

    .prologue
    .line 49
    packed-switch p1, :pswitch_data_20

    .line 64
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Unsupported type"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 52
    :pswitch_b
    const/4 v0, 0x2

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->value:Ljava/lang/Object;

    .line 66
    :goto_10
    iput p1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->commandType:I

    .line 67
    return-void

    .line 56
    :pswitch_13
    const/4 v0, 0x4

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->value:Ljava/lang/Object;

    goto :goto_10

    .line 60
    :pswitch_19
    const/4 v0, 0x6

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->value:Ljava/lang/Object;

    goto :goto_10

    .line 49
    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_b
        :pswitch_b
        :pswitch_13
        :pswitch_19
    .end packed-switch
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 7

    .prologue
    const/4 v5, 0x0

    .line 123
    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->commandType:I

    .line 124
    .local v1, "type":I
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;-><init>(I)V

    .line 125
    .local v0, "result":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->value:Ljava/lang/Object;

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->value:Ljava/lang/Object;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->value:Ljava/lang/Object;

    check-cast v2, [F

    array-length v2, v2

    invoke-static {v3, v5, v4, v5, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 126
    return-object v0
.end method

.method public encode()Ljava/lang/Object;
    .registers 9

    .prologue
    .line 103
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 104
    .local v3, "object":Lorg/json/JSONObject;
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 107
    .local v0, "array":Lorg/json/JSONArray;
    :try_start_a
    const-string v4, "c"

    iget v5, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->commandType:I

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 109
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_12
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->value:Ljava/lang/Object;

    check-cast v4, [F

    array-length v4, v4

    if-ge v2, v4, :cond_2c

    .line 111
    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->FORMATTER:Ljava/text/DecimalFormat;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->value:Ljava/lang/Object;

    check-cast v4, [F

    aget v4, v4, v2

    float-to-double v6, v4

    invoke-virtual {v5, v6, v7}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 109
    add-int/lit8 v2, v2, 0x1

    goto :goto_12

    .line 114
    :cond_2c
    const-string v4, "p"

    invoke-virtual {v3, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_31
    .catch Lorg/json/JSONException; {:try_start_a .. :try_end_31} :catch_32

    .line 118
    .end local v2    # "i":I
    :goto_31
    return-object v3

    .line 115
    :catch_32
    move-exception v1

    .line 116
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_31
.end method

.method public getPoint()Landroid/graphics/PointF;
    .registers 5

    .prologue
    .line 98
    new-instance v1, Landroid/graphics/PointF;

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->value:Ljava/lang/Object;

    check-cast v0, [F

    const/4 v2, 0x0

    aget v2, v0, v2

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->value:Ljava/lang/Object;

    check-cast v0, [F

    const/4 v3, 0x1

    aget v0, v0, v3

    invoke-direct {v1, v2, v0}, Landroid/graphics/PointF;-><init>(FF)V

    return-object v1
.end method

.method public setPoint(FF)V
    .registers 5
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 72
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->value:Ljava/lang/Object;

    check-cast v0, [F

    const/4 v1, 0x0

    aput p1, v0, v1

    .line 73
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->value:Ljava/lang/Object;

    check-cast v0, [F

    const/4 v1, 0x1

    aput p2, v0, v1

    .line 74
    return-void
.end method

.method public setPoint(FFFF)V
    .registers 7
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "x1"    # F
    .param p4, "y1"    # F

    .prologue
    .line 79
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->value:Ljava/lang/Object;

    check-cast v0, [F

    const/4 v1, 0x0

    aput p1, v0, v1

    .line 80
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->value:Ljava/lang/Object;

    check-cast v0, [F

    const/4 v1, 0x1

    aput p2, v0, v1

    .line 81
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->value:Ljava/lang/Object;

    check-cast v0, [F

    const/4 v1, 0x2

    aput p3, v0, v1

    .line 82
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->value:Ljava/lang/Object;

    check-cast v0, [F

    const/4 v1, 0x3

    aput p4, v0, v1

    .line 83
    return-void
.end method
