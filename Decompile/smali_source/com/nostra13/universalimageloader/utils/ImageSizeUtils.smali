.class public final Lcom/nostra13/universalimageloader/utils/ImageSizeUtils;
.super Ljava/lang/Object;
.source "ImageSizeUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nostra13/universalimageloader/utils/ImageSizeUtils$1;
    }
.end annotation


# static fields
.field private static maxBitmapSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x0

    .line 39
    const/4 v2, 0x1

    new-array v1, v2, [I

    .line 40
    .local v1, "maxTextureSize":[I
    const/16 v2, 0xd33

    invoke-static {v2, v1, v3}, Landroid/opengl/GLES10;->glGetIntegerv(I[II)V

    .line 41
    aget v2, v1, v3

    const/16 v3, 0x800

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 42
    .local v0, "maxBitmapDimension":I
    new-instance v2, Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    invoke-direct {v2, v0, v0}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;-><init>(II)V

    sput-object v2, Lcom/nostra13/universalimageloader/utils/ImageSizeUtils;->maxBitmapSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    .line 43
    return-void
.end method

.method public static computeImageSampleSize(Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;Z)I
    .registers 13
    .param p0, "srcSize"    # Lcom/nostra13/universalimageloader/core/assist/ImageSize;
    .param p1, "targetSize"    # Lcom/nostra13/universalimageloader/core/assist/ImageSize;
    .param p2, "viewScaleType"    # Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;
    .param p3, "powerOf2Scale"    # Z

    .prologue
    .line 92
    invoke-virtual {p0}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;->getWidth()I

    move-result v3

    .line 93
    .local v3, "srcWidth":I
    invoke-virtual {p0}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;->getHeight()I

    move-result v2

    .line 94
    .local v2, "srcHeight":I
    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;->getWidth()I

    move-result v5

    .line 95
    .local v5, "targetWidth":I
    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;->getHeight()I

    move-result v4

    .line 97
    .local v4, "targetHeight":I
    const/4 v1, 0x1

    .line 99
    .local v1, "scale":I
    div-int v6, v3, v5

    .line 100
    .local v6, "widthScale":I
    div-int v0, v2, v4

    .line 102
    .local v0, "heightScale":I
    sget-object v7, Lcom/nostra13/universalimageloader/utils/ImageSizeUtils$1;->$SwitchMap$com$nostra13$universalimageloader$core$assist$ViewScaleType:[I

    invoke-virtual {p2}, Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;->ordinal()I

    move-result v8

    aget v7, v7, v8

    packed-switch v7, :pswitch_data_52

    .line 127
    :cond_20
    :goto_20
    const/4 v7, 0x1

    if-ge v1, v7, :cond_24

    .line 128
    const/4 v1, 0x1

    .line 131
    :cond_24
    return v1

    .line 104
    :pswitch_25
    if-eqz p3, :cond_36

    .line 105
    :goto_27
    div-int/lit8 v7, v3, 0x2

    if-ge v7, v5, :cond_2f

    div-int/lit8 v7, v2, 0x2

    if-lt v7, v4, :cond_20

    .line 106
    :cond_2f
    div-int/lit8 v3, v3, 0x2

    .line 107
    div-int/lit8 v2, v2, 0x2

    .line 108
    mul-int/lit8 v1, v1, 0x2

    goto :goto_27

    .line 111
    :cond_36
    invoke-static {v6, v0}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 113
    goto :goto_20

    .line 115
    :pswitch_3b
    if-eqz p3, :cond_4c

    .line 116
    :goto_3d
    div-int/lit8 v7, v3, 0x2

    if-lt v7, v5, :cond_20

    div-int/lit8 v7, v2, 0x2

    if-lt v7, v4, :cond_20

    .line 117
    div-int/lit8 v3, v3, 0x2

    .line 118
    div-int/lit8 v2, v2, 0x2

    .line 119
    mul-int/lit8 v1, v1, 0x2

    goto :goto_3d

    .line 122
    :cond_4c
    invoke-static {v6, v0}, Ljava/lang/Math;->min(II)I

    move-result v1

    goto :goto_20

    .line 102
    nop

    :pswitch_data_52
    .packed-switch 0x1
        :pswitch_25
        :pswitch_3b
    .end packed-switch
.end method

.method public static computeImageScale(Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;Z)F
    .registers 15
    .param p0, "srcSize"    # Lcom/nostra13/universalimageloader/core/assist/ImageSize;
    .param p1, "targetSize"    # Lcom/nostra13/universalimageloader/core/assist/ImageSize;
    .param p2, "viewScaleType"    # Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;
    .param p3, "stretch"    # Z

    .prologue
    .line 179
    invoke-virtual {p0}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;->getWidth()I

    move-result v5

    .line 180
    .local v5, "srcWidth":I
    invoke-virtual {p0}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;->getHeight()I

    move-result v4

    .line 181
    .local v4, "srcHeight":I
    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;->getWidth()I

    move-result v7

    .line 182
    .local v7, "targetWidth":I
    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;->getHeight()I

    move-result v6

    .line 184
    .local v6, "targetHeight":I
    int-to-float v9, v5

    int-to-float v10, v7

    div-float v8, v9, v10

    .line 185
    .local v8, "widthScale":F
    int-to-float v9, v4

    int-to-float v10, v6

    div-float v2, v9, v10

    .line 189
    .local v2, "heightScale":F
    sget-object v9, Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;->FIT_INSIDE:Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;

    if-ne p2, v9, :cond_20

    cmpl-float v9, v8, v2

    if-gez v9, :cond_28

    :cond_20
    sget-object v9, Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;->CROP:Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;

    if-ne p2, v9, :cond_3f

    cmpg-float v9, v8, v2

    if-gez v9, :cond_3f

    .line 190
    :cond_28
    move v1, v7

    .line 191
    .local v1, "destWidth":I
    int-to-float v9, v4

    div-float/2addr v9, v8

    float-to-int v0, v9

    .line 197
    .local v0, "destHeight":I
    :goto_2c
    const/high16 v3, 0x3f800000

    .line 198
    .local v3, "scale":F
    if-nez p3, :cond_34

    if-ge v1, v5, :cond_34

    if-lt v0, v4, :cond_3a

    :cond_34
    if-eqz p3, :cond_3e

    if-eq v1, v5, :cond_3e

    if-eq v0, v4, :cond_3e

    .line 199
    :cond_3a
    int-to-float v9, v1

    int-to-float v10, v5

    div-float v3, v9, v10

    .line 202
    :cond_3e
    return v3

    .line 193
    .end local v0    # "destHeight":I
    .end local v1    # "destWidth":I
    .end local v3    # "scale":F
    :cond_3f
    int-to-float v9, v5

    div-float/2addr v9, v2

    float-to-int v1, v9

    .line 194
    .restart local v1    # "destWidth":I
    move v0, v6

    .restart local v0    # "destHeight":I
    goto :goto_2c
.end method

.method public static computeMinImageSampleSize(Lcom/nostra13/universalimageloader/core/assist/ImageSize;)I
    .registers 9
    .param p0, "srcSize"    # Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    .prologue
    .line 144
    invoke-virtual {p0}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;->getWidth()I

    move-result v2

    .line 145
    .local v2, "srcWidth":I
    invoke-virtual {p0}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;->getHeight()I

    move-result v1

    .line 146
    .local v1, "srcHeight":I
    sget-object v6, Lcom/nostra13/universalimageloader/utils/ImageSizeUtils;->maxBitmapSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    invoke-virtual {v6}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;->getWidth()I

    move-result v4

    .line 147
    .local v4, "targetWidth":I
    sget-object v6, Lcom/nostra13/universalimageloader/utils/ImageSizeUtils;->maxBitmapSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    invoke-virtual {v6}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;->getHeight()I

    move-result v3

    .line 149
    .local v3, "targetHeight":I
    int-to-float v6, v2

    int-to-float v7, v4

    div-float/2addr v6, v7

    float-to-double v6, v6

    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v6

    double-to-int v5, v6

    .line 150
    .local v5, "widthScale":I
    int-to-float v6, v1

    int-to-float v7, v3

    div-float/2addr v6, v7

    float-to-double v6, v6

    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v6

    double-to-int v0, v6

    .line 152
    .local v0, "heightScale":I
    invoke-static {v5, v0}, Ljava/lang/Math;->max(II)I

    move-result v6

    return v6
.end method

.method public static defineTargetSizeForView(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/assist/ImageSize;)Lcom/nostra13/universalimageloader/core/assist/ImageSize;
    .registers 5
    .param p0, "imageAware"    # Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;
    .param p1, "maxImageSize"    # Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    .prologue
    .line 54
    invoke-interface {p0}, Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;->getWidth()I

    move-result v1

    .line 55
    .local v1, "width":I
    if-gtz v1, :cond_a

    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;->getWidth()I

    move-result v1

    .line 57
    :cond_a
    invoke-interface {p0}, Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;->getHeight()I

    move-result v0

    .line 58
    .local v0, "height":I
    if-gtz v0, :cond_14

    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;->getHeight()I

    move-result v0

    .line 60
    :cond_14
    new-instance v2, Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    invoke-direct {v2, v1, v0}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;-><init>(II)V

    return-object v2
.end method
