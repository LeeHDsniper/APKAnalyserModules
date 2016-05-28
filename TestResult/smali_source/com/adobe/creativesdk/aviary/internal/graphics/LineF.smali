.class public Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;
.super Ljava/lang/Object;
.source "LineF.java"

# interfaces
.implements Lcom/adobe/creativesdk/aviary/internal/graphics/IGeom;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final end:Landroid/graphics/PointF;

.field private final start:Landroid/graphics/PointF;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 216
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF$1;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF$1;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 15
    invoke-direct {p0, v0, v0, v0, v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;-><init>(FFFF)V

    .line 16
    return-void
.end method

.method public constructor <init>(FFFF)V
    .registers 6
    .param p1, "x1"    # F
    .param p2, "y1"    # F
    .param p3, "x2"    # F
    .param p4, "y2"    # F

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0, p1, p2}, Landroid/graphics/PointF;-><init>(FF)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->start:Landroid/graphics/PointF;

    .line 25
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0, p3, p4}, Landroid/graphics/PointF;-><init>(FF)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->end:Landroid/graphics/PointF;

    .line 26
    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    .prologue
    .line 174
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 205
    if-ne p0, p1, :cond_5

    .line 213
    :cond_4
    :goto_4
    return v1

    .line 208
    :cond_5
    if-eqz p1, :cond_11

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_13

    :cond_11
    move v1, v2

    .line 209
    goto :goto_4

    :cond_13
    move-object v0, p1

    .line 212
    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;

    .line 213
    .local v0, "r":Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->start:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->x:F

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->start:Landroid/graphics/PointF;

    iget v4, v4, Landroid/graphics/PointF;->x:F

    cmpl-float v3, v3, v4

    if-nez v3, :cond_46

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->start:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->y:F

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->start:Landroid/graphics/PointF;

    iget v4, v4, Landroid/graphics/PointF;->y:F

    cmpl-float v3, v3, v4

    if-nez v3, :cond_46

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->end:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->x:F

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->end:Landroid/graphics/PointF;

    iget v4, v4, Landroid/graphics/PointF;->x:F

    cmpl-float v3, v3, v4

    if-nez v3, :cond_46

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->end:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->y:F

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->end:Landroid/graphics/PointF;

    iget v4, v4, Landroid/graphics/PointF;->y:F

    cmpl-float v3, v3, v4

    if-eqz v3, :cond_4

    :cond_46
    move v1, v2

    goto :goto_4
.end method

.method public getEndX()F
    .registers 2

    .prologue
    .line 47
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->end:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->x:F

    return v0
.end method

.method public getEndY()F
    .registers 2

    .prologue
    .line 51
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->end:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->y:F

    return v0
.end method

.method public getStartX()F
    .registers 2

    .prologue
    .line 39
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->start:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->x:F

    return v0
.end method

.method public getStartY()F
    .registers 2

    .prologue
    .line 43
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->start:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->y:F

    return v0
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 195
    const/16 v0, 0x11

    .line 196
    .local v0, "hash":I
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->start:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->x:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Float;->hashCode()I

    move-result v1

    add-int/lit16 v0, v1, 0x275

    .line 197
    mul-int/lit8 v1, v0, 0x25

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->start:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->y:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Float;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 198
    mul-int/lit8 v1, v0, 0x25

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->end:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->x:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Float;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 199
    mul-int/lit8 v1, v0, 0x25

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->end:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->y:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Float;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 200
    return v0
.end method

.method public intersect(FFFF)Landroid/graphics/PointF;
    .registers 23
    .param p1, "x1"    # F
    .param p2, "y1"    # F
    .param p3, "x2"    # F
    .param p4, "y2"    # F

    .prologue
    .line 110
    sub-float v9, p4, p2

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->end:Landroid/graphics/PointF;

    iget v14, v14, Landroid/graphics/PointF;->x:F

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->start:Landroid/graphics/PointF;

    iget v15, v15, Landroid/graphics/PointF;->x:F

    sub-float/2addr v14, v15

    mul-float/2addr v9, v14

    sub-float v14, p3, p1

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->end:Landroid/graphics/PointF;

    iget v15, v15, Landroid/graphics/PointF;->y:F

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->start:Landroid/graphics/PointF;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v16, v0

    sub-float v15, v15, v16

    mul-float/2addr v14, v15

    sub-float/2addr v9, v14

    float-to-double v2, v9

    .line 111
    .local v2, "d":D
    sub-float v9, p3, p1

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->start:Landroid/graphics/PointF;

    iget v14, v14, Landroid/graphics/PointF;->y:F

    sub-float v14, v14, p2

    mul-float/2addr v9, v14

    sub-float v14, p4, p2

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->start:Landroid/graphics/PointF;

    iget v15, v15, Landroid/graphics/PointF;->x:F

    sub-float v15, v15, p1

    mul-float/2addr v14, v15

    sub-float/2addr v9, v14

    float-to-double v4, v9

    .line 112
    .local v4, "nA":D
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->end:Landroid/graphics/PointF;

    iget v9, v9, Landroid/graphics/PointF;->x:F

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->start:Landroid/graphics/PointF;

    iget v14, v14, Landroid/graphics/PointF;->x:F

    sub-float/2addr v9, v14

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->start:Landroid/graphics/PointF;

    iget v14, v14, Landroid/graphics/PointF;->y:F

    sub-float v14, v14, p2

    mul-float/2addr v9, v14

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->end:Landroid/graphics/PointF;

    iget v14, v14, Landroid/graphics/PointF;->y:F

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->start:Landroid/graphics/PointF;

    iget v15, v15, Landroid/graphics/PointF;->y:F

    sub-float/2addr v14, v15

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->start:Landroid/graphics/PointF;

    iget v15, v15, Landroid/graphics/PointF;->x:F

    sub-float v15, v15, p1

    mul-float/2addr v14, v15

    sub-float/2addr v9, v14

    float-to-double v6, v9

    .line 114
    .local v6, "nB":D
    const-wide/16 v14, 0x0

    cmpl-double v9, v2, v14

    if-nez v9, :cond_77

    .line 115
    const/4 v8, 0x0

    .line 127
    :goto_76
    return-object v8

    .line 118
    :cond_77
    div-double v10, v4, v2

    .line 119
    .local v10, "ua":D
    div-double v12, v6, v2

    .line 121
    .local v12, "ub":D
    const-wide/16 v14, 0x0

    cmpl-double v9, v10, v14

    if-ltz v9, :cond_e3

    const-wide/high16 v14, 0x3ff0000000000000L

    cmpg-double v9, v10, v14

    if-gtz v9, :cond_e3

    const-wide/16 v14, 0x0

    cmpl-double v9, v12, v14

    if-ltz v9, :cond_e3

    const-wide/high16 v14, 0x3ff0000000000000L

    cmpg-double v9, v12, v14

    if-gtz v9, :cond_e3

    .line 122
    new-instance v8, Landroid/graphics/PointF;

    invoke-direct {v8}, Landroid/graphics/PointF;-><init>()V

    .line 123
    .local v8, "point":Landroid/graphics/PointF;
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->start:Landroid/graphics/PointF;

    iget v9, v9, Landroid/graphics/PointF;->x:F

    float-to-double v14, v9

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->end:Landroid/graphics/PointF;

    iget v9, v9, Landroid/graphics/PointF;->x:F

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->start:Landroid/graphics/PointF;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v16, v0

    sub-float v9, v9, v16

    float-to-double v0, v9

    move-wide/from16 v16, v0

    mul-double v16, v16, v10

    add-double v14, v14, v16

    double-to-float v9, v14

    iput v9, v8, Landroid/graphics/PointF;->x:F

    .line 124
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->start:Landroid/graphics/PointF;

    iget v9, v9, Landroid/graphics/PointF;->y:F

    float-to-double v14, v9

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->end:Landroid/graphics/PointF;

    iget v9, v9, Landroid/graphics/PointF;->y:F

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->start:Landroid/graphics/PointF;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v16, v0

    sub-float v9, v9, v16

    float-to-double v0, v9

    move-wide/from16 v16, v0

    mul-double v16, v16, v10

    add-double v14, v14, v16

    double-to-float v9, v14

    iput v9, v8, Landroid/graphics/PointF;->y:F

    goto :goto_76

    .line 127
    .end local v8    # "point":Landroid/graphics/PointF;
    :cond_e3
    const/4 v8, 0x0

    goto :goto_76
.end method

.method public intersect(Landroid/graphics/RectF;)[Landroid/graphics/PointF;
    .registers 13
    .param p1, "rect"    # Landroid/graphics/RectF;

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    const/4 v8, 0x2

    .line 132
    const/4 v0, 0x0

    .line 133
    .local v0, "index":I
    const/4 v2, 0x0

    .line 134
    .local v2, "pt":Landroid/graphics/PointF;
    new-array v3, v8, [Landroid/graphics/PointF;

    .line 137
    .local v3, "result":[Landroid/graphics/PointF;
    iget v4, p1, Landroid/graphics/RectF;->left:F

    iget v5, p1, Landroid/graphics/RectF;->top:F

    iget v6, p1, Landroid/graphics/RectF;->right:F

    iget v7, p1, Landroid/graphics/RectF;->top:F

    invoke-virtual {p0, v4, v5, v6, v7}, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->intersect(FFFF)Landroid/graphics/PointF;

    move-result-object v2

    if-eqz v2, :cond_1a

    .line 138
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "index":I
    .local v1, "index":I
    aput-object v2, v3, v0

    move v0, v1

    .line 141
    .end local v1    # "index":I
    .restart local v0    # "index":I
    :cond_1a
    iget v4, p1, Landroid/graphics/RectF;->right:F

    iget v5, p1, Landroid/graphics/RectF;->top:F

    iget v6, p1, Landroid/graphics/RectF;->right:F

    iget v7, p1, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {p0, v4, v5, v6, v7}, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->intersect(FFFF)Landroid/graphics/PointF;

    move-result-object v2

    if-eqz v2, :cond_66

    .line 142
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "index":I
    .restart local v1    # "index":I
    aput-object v2, v3, v0

    .line 145
    :goto_2c
    if-ge v1, v8, :cond_41

    iget v4, p1, Landroid/graphics/RectF;->left:F

    iget v5, p1, Landroid/graphics/RectF;->bottom:F

    iget v6, p1, Landroid/graphics/RectF;->right:F

    iget v7, p1, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {p0, v4, v5, v6, v7}, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->intersect(FFFF)Landroid/graphics/PointF;

    move-result-object v2

    if-eqz v2, :cond_41

    .line 146
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "index":I
    .restart local v0    # "index":I
    aput-object v2, v3, v1

    move v1, v0

    .line 149
    .end local v0    # "index":I
    .restart local v1    # "index":I
    :cond_41
    if-ge v1, v8, :cond_64

    iget v4, p1, Landroid/graphics/RectF;->left:F

    iget v5, p1, Landroid/graphics/RectF;->top:F

    iget v6, p1, Landroid/graphics/RectF;->left:F

    iget v7, p1, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {p0, v4, v5, v6, v7}, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->intersect(FFFF)Landroid/graphics/PointF;

    move-result-object v2

    if-eqz v2, :cond_64

    .line 150
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "index":I
    .restart local v0    # "index":I
    aput-object v2, v3, v1

    .line 154
    :goto_55
    if-ne v0, v8, :cond_58

    .line 159
    .end local v3    # "result":[Landroid/graphics/PointF;
    :goto_57
    return-object v3

    .line 156
    .restart local v3    # "result":[Landroid/graphics/PointF;
    :cond_58
    if-ne v0, v10, :cond_62

    .line 157
    new-array v4, v10, [Landroid/graphics/PointF;

    aget-object v5, v3, v9

    aput-object v5, v4, v9

    move-object v3, v4

    goto :goto_57

    .line 159
    :cond_62
    const/4 v3, 0x0

    goto :goto_57

    .end local v0    # "index":I
    .restart local v1    # "index":I
    :cond_64
    move v0, v1

    .end local v1    # "index":I
    .restart local v0    # "index":I
    goto :goto_55

    :cond_66
    move v1, v0

    .end local v0    # "index":I
    .restart local v1    # "index":I
    goto :goto_2c
.end method

.method public readFromParcel(Landroid/os/Parcel;)V
    .registers 4
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 187
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->start:Landroid/graphics/PointF;

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v1

    iput v1, v0, Landroid/graphics/PointF;->x:F

    .line 188
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->start:Landroid/graphics/PointF;

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v1

    iput v1, v0, Landroid/graphics/PointF;->y:F

    .line 189
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->end:Landroid/graphics/PointF;

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v1

    iput v1, v0, Landroid/graphics/PointF;->x:F

    .line 190
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->end:Landroid/graphics/PointF;

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v1

    iput v1, v0, Landroid/graphics/PointF;->y:F

    .line 191
    return-void
.end method

.method public reset()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 55
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->start:Landroid/graphics/PointF;

    invoke-virtual {v0, v1, v1}, Landroid/graphics/PointF;->set(FF)V

    .line 56
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->end:Landroid/graphics/PointF;

    invoke-virtual {v0, v1, v1}, Landroid/graphics/PointF;->set(FF)V

    .line 57
    return-void
.end method

.method public set(FFFF)V
    .registers 6
    .param p1, "x1"    # F
    .param p2, "y1"    # F
    .param p3, "x2"    # F
    .param p4, "y2"    # F

    .prologue
    .line 34
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->start:Landroid/graphics/PointF;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/PointF;->set(FF)V

    .line 35
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->end:Landroid/graphics/PointF;

    invoke-virtual {v0, p3, p4}, Landroid/graphics/PointF;->set(FF)V

    .line 36
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 169
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "LineF("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->start:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->x:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->start:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->x:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " - "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->end:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->x:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->end:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->y:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 179
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->getStartX()F

    move-result v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 180
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->getStartY()F

    move-result v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 181
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->getEndX()F

    move-result v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 182
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->getEndY()F

    move-result v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 183
    return-void
.end method
