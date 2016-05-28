.class public final Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;
.super Ljava/lang/Object;
.source "MoaMetadata.java"


# instance fields
.field private cellsize:[I

.field private grid:[I

.field private imagesize:[I

.field private inplace:I


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x2

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-array v0, v1, [I

    fill-array-data v0, :array_1e

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;->imagesize:[I

    .line 20
    new-array v0, v1, [I

    fill-array-data v0, :array_26

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;->cellsize:[I

    .line 21
    new-array v0, v1, [I

    fill-array-data v0, :array_2e

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;->grid:[I

    .line 22
    const/4 v0, 0x0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;->inplace:I

    return-void

    .line 19
    nop

    :array_1e
    .array-data 4
        0x1
        0x1
    .end array-data

    .line 20
    :array_26
    .array-data 4
        -0x1
        -0x1
    .end array-data

    .line 21
    :array_2e
    .array-data 4
        0x0
        0x0
    .end array-data
.end method


# virtual methods
.method public cellHeight()I
    .registers 3

    .prologue
    .line 58
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;->cellsize:[I

    const/4 v1, 0x1

    aget v0, v0, v1

    return v0
.end method

.method public cellWidth()I
    .registers 3

    .prologue
    .line 54
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;->cellsize:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    return v0
.end method

.method public cols()I
    .registers 3

    .prologue
    .line 62
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;->grid:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    return v0
.end method

.method public encode()Lorg/json/JSONObject;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 81
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 82
    .local v1, "root":Lorg/json/JSONObject;
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 83
    .local v0, "imgsize":Lorg/json/JSONArray;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;->imagesize:[I

    const/4 v3, 0x0

    aget v2, v2, v3

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    .line 84
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;->imagesize:[I

    const/4 v3, 0x1

    aget v2, v2, v3

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    .line 86
    const-string v2, "imageorigsize"

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 87
    const-string v2, "cellWidth"

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;->cellWidth()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 88
    const-string v2, "cellHeight"

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;->cellHeight()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 89
    const-string v2, "cols"

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;->cols()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 90
    const-string v2, "rows"

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;->rows()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 91
    const-string v2, "inplace"

    iget v3, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;->inplace:I

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 92
    const-string v2, "version"

    const-string v3, "2.1.2"

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 93
    return-object v1
.end method

.method public rows()I
    .registers 3

    .prologue
    .line 66
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;->grid:[I

    const/4 v1, 0x1

    aget v0, v0, v1

    return v0
.end method

.method public setImageSize(II)V
    .registers 5
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 32
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;->imagesize:[I

    const/4 v1, 0x0

    aput p1, v0, v1

    .line 33
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;->imagesize:[I

    const/4 v1, 0x1

    aput p2, v0, v1

    .line 34
    return-void
.end method
