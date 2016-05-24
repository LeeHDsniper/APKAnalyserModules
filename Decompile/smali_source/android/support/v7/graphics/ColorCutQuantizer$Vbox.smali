.class Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;
.super Ljava/lang/Object;
.source "ColorCutQuantizer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/graphics/ColorCutQuantizer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Vbox"
.end annotation


# instance fields
.field private mLowerIndex:I

.field private mMaxBlue:I

.field private mMaxGreen:I

.field private mMaxRed:I

.field private mMinBlue:I

.field private mMinGreen:I

.field private mMinRed:I

.field private mPopulation:I

.field private mUpperIndex:I

.field final synthetic this$0:Landroid/support/v7/graphics/ColorCutQuantizer;


# direct methods
.method constructor <init>(Landroid/support/v7/graphics/ColorCutQuantizer;II)V
    .registers 4
    .param p2, "lowerIndex"    # I
    .param p3, "upperIndex"    # I

    .prologue
    .line 239
    iput-object p1, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->this$0:Landroid/support/v7/graphics/ColorCutQuantizer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 240
    iput p2, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mLowerIndex:I

    .line 241
    iput p3, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mUpperIndex:I

    .line 242
    invoke-virtual {p0}, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->fitBox()V

    .line 243
    return-void
.end method


# virtual methods
.method final canSplit()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 251
    invoke-virtual {p0}, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->getColorCount()I

    move-result v1

    if-le v1, v0, :cond_8

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method final findSplitPoint()I
    .registers 9

    .prologue
    .line 357
    invoke-virtual {p0}, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->getLongestColorDimension()I

    move-result v4

    .line 358
    .local v4, "longestDimension":I
    iget-object v6, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->this$0:Landroid/support/v7/graphics/ColorCutQuantizer;

    iget-object v0, v6, Landroid/support/v7/graphics/ColorCutQuantizer;->mColors:[I

    .line 359
    .local v0, "colors":[I
    iget-object v6, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->this$0:Landroid/support/v7/graphics/ColorCutQuantizer;

    iget-object v2, v6, Landroid/support/v7/graphics/ColorCutQuantizer;->mHistogram:[I

    .line 364
    .local v2, "hist":[I
    iget v6, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mLowerIndex:I

    iget v7, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mUpperIndex:I

    # invokes: Landroid/support/v7/graphics/ColorCutQuantizer;->modifySignificantOctet([IIII)V
    invoke-static {v0, v4, v6, v7}, Landroid/support/v7/graphics/ColorCutQuantizer;->access$300([IIII)V

    .line 367
    iget v6, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mLowerIndex:I

    iget v7, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mUpperIndex:I

    add-int/lit8 v7, v7, 0x1

    invoke-static {v0, v6, v7}, Ljava/util/Arrays;->sort([III)V

    .line 370
    iget v6, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mLowerIndex:I

    iget v7, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mUpperIndex:I

    # invokes: Landroid/support/v7/graphics/ColorCutQuantizer;->modifySignificantOctet([IIII)V
    invoke-static {v0, v4, v6, v7}, Landroid/support/v7/graphics/ColorCutQuantizer;->access$300([IIII)V

    .line 372
    iget v6, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mPopulation:I

    div-int/lit8 v5, v6, 0x2

    .line 373
    .local v5, "midPoint":I
    iget v3, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mLowerIndex:I

    .local v3, "i":I
    const/4 v1, 0x0

    .local v1, "count":I
    :goto_2a
    iget v6, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mUpperIndex:I

    if-gt v3, v6, :cond_39

    .line 374
    aget v6, v0, v3

    aget v6, v2, v6

    add-int/2addr v1, v6

    .line 375
    if-lt v1, v5, :cond_36

    .line 380
    .end local v3    # "i":I
    :goto_35
    return v3

    .line 373
    .restart local v3    # "i":I
    :cond_36
    add-int/lit8 v3, v3, 0x1

    goto :goto_2a

    .line 380
    :cond_39
    iget v3, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mLowerIndex:I

    goto :goto_35
.end method

.method final fitBox()V
    .registers 16

    .prologue
    .line 262
    iget-object v14, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->this$0:Landroid/support/v7/graphics/ColorCutQuantizer;

    iget-object v2, v14, Landroid/support/v7/graphics/ColorCutQuantizer;->mColors:[I

    .line 263
    .local v2, "colors":[I
    iget-object v14, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->this$0:Landroid/support/v7/graphics/ColorCutQuantizer;

    iget-object v5, v14, Landroid/support/v7/graphics/ColorCutQuantizer;->mHistogram:[I

    .line 267
    .local v5, "hist":[I
    const v10, 0x7fffffff

    .local v10, "minBlue":I
    move v11, v10

    .local v11, "minGreen":I
    move v12, v10

    .line 269
    .local v12, "minRed":I
    const/high16 v7, -0x80000000

    .local v7, "maxBlue":I
    move v8, v7

    .local v8, "maxGreen":I
    move v9, v7

    .line 270
    .local v9, "maxRed":I
    const/4 v3, 0x0

    .line 272
    .local v3, "count":I
    iget v6, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mLowerIndex:I

    .local v6, "i":I
    :goto_14
    iget v14, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mUpperIndex:I

    if-gt v6, v14, :cond_3e

    .line 273
    aget v1, v2, v6

    .line 274
    .local v1, "color":I
    aget v14, v5, v1

    add-int/2addr v3, v14

    .line 276
    # invokes: Landroid/support/v7/graphics/ColorCutQuantizer;->quantizedRed(I)I
    invoke-static {v1}, Landroid/support/v7/graphics/ColorCutQuantizer;->access$000(I)I

    move-result v13

    .line 277
    .local v13, "r":I
    # invokes: Landroid/support/v7/graphics/ColorCutQuantizer;->quantizedGreen(I)I
    invoke-static {v1}, Landroid/support/v7/graphics/ColorCutQuantizer;->access$100(I)I

    move-result v4

    .line 278
    .local v4, "g":I
    # invokes: Landroid/support/v7/graphics/ColorCutQuantizer;->quantizedBlue(I)I
    invoke-static {v1}, Landroid/support/v7/graphics/ColorCutQuantizer;->access$200(I)I

    move-result v0

    .line 279
    .local v0, "b":I
    if-le v13, v9, :cond_2c

    .line 280
    move v9, v13

    .line 282
    :cond_2c
    if-ge v13, v12, :cond_2f

    .line 283
    move v12, v13

    .line 285
    :cond_2f
    if-le v4, v8, :cond_32

    .line 286
    move v8, v4

    .line 288
    :cond_32
    if-ge v4, v11, :cond_35

    .line 289
    move v11, v4

    .line 291
    :cond_35
    if-le v0, v7, :cond_38

    .line 292
    move v7, v0

    .line 294
    :cond_38
    if-ge v0, v10, :cond_3b

    .line 295
    move v10, v0

    .line 272
    :cond_3b
    add-int/lit8 v6, v6, 0x1

    goto :goto_14

    .line 299
    .end local v0    # "b":I
    .end local v1    # "color":I
    .end local v4    # "g":I
    .end local v13    # "r":I
    :cond_3e
    iput v12, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMinRed:I

    .line 300
    iput v9, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMaxRed:I

    .line 301
    iput v11, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMinGreen:I

    .line 302
    iput v8, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMaxGreen:I

    .line 303
    iput v10, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMinBlue:I

    .line 304
    iput v7, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMaxBlue:I

    .line 305
    iput v3, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mPopulation:I

    .line 306
    return-void
.end method

.method final getAverageColor()Landroid/support/v7/graphics/Palette$Swatch;
    .registers 15

    .prologue
    .line 387
    iget-object v12, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->this$0:Landroid/support/v7/graphics/ColorCutQuantizer;

    iget-object v4, v12, Landroid/support/v7/graphics/ColorCutQuantizer;->mColors:[I

    .line 388
    .local v4, "colors":[I
    iget-object v12, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->this$0:Landroid/support/v7/graphics/ColorCutQuantizer;

    iget-object v7, v12, Landroid/support/v7/graphics/ColorCutQuantizer;->mHistogram:[I

    .line 389
    .local v7, "hist":[I
    const/4 v10, 0x0

    .line 390
    .local v10, "redSum":I
    const/4 v6, 0x0

    .line 391
    .local v6, "greenSum":I
    const/4 v1, 0x0

    .line 392
    .local v1, "blueSum":I
    const/4 v11, 0x0

    .line 394
    .local v11, "totalPopulation":I
    iget v8, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mLowerIndex:I

    .local v8, "i":I
    :goto_e
    iget v12, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mUpperIndex:I

    if-gt v8, v12, :cond_2c

    .line 395
    aget v2, v4, v8

    .line 396
    .local v2, "color":I
    aget v3, v7, v2

    .line 398
    .local v3, "colorPopulation":I
    add-int/2addr v11, v3

    .line 399
    # invokes: Landroid/support/v7/graphics/ColorCutQuantizer;->quantizedRed(I)I
    invoke-static {v2}, Landroid/support/v7/graphics/ColorCutQuantizer;->access$000(I)I

    move-result v12

    mul-int/2addr v12, v3

    add-int/2addr v10, v12

    .line 400
    # invokes: Landroid/support/v7/graphics/ColorCutQuantizer;->quantizedGreen(I)I
    invoke-static {v2}, Landroid/support/v7/graphics/ColorCutQuantizer;->access$100(I)I

    move-result v12

    mul-int/2addr v12, v3

    add-int/2addr v6, v12

    .line 401
    # invokes: Landroid/support/v7/graphics/ColorCutQuantizer;->quantizedBlue(I)I
    invoke-static {v2}, Landroid/support/v7/graphics/ColorCutQuantizer;->access$200(I)I

    move-result v12

    mul-int/2addr v12, v3

    add-int/2addr v1, v12

    .line 394
    add-int/lit8 v8, v8, 0x1

    goto :goto_e

    .line 404
    .end local v2    # "color":I
    .end local v3    # "colorPopulation":I
    :cond_2c
    int-to-float v12, v10

    int-to-float v13, v11

    div-float/2addr v12, v13

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v9

    .line 405
    .local v9, "redMean":I
    int-to-float v12, v6

    int-to-float v13, v11

    div-float/2addr v12, v13

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v5

    .line 406
    .local v5, "greenMean":I
    int-to-float v12, v1

    int-to-float v13, v11

    div-float/2addr v12, v13

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 408
    .local v0, "blueMean":I
    new-instance v12, Landroid/support/v7/graphics/Palette$Swatch;

    # invokes: Landroid/support/v7/graphics/ColorCutQuantizer;->approximateToRgb888(III)I
    invoke-static {v9, v5, v0}, Landroid/support/v7/graphics/ColorCutQuantizer;->access$400(III)I

    move-result v13

    invoke-direct {v12, v13, v11}, Landroid/support/v7/graphics/Palette$Swatch;-><init>(II)V

    return-object v12
.end method

.method final getColorCount()I
    .registers 3

    .prologue
    .line 255
    iget v0, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mUpperIndex:I

    add-int/lit8 v0, v0, 0x1

    iget v1, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mLowerIndex:I

    sub-int/2addr v0, v1

    return v0
.end method

.method final getLongestColorDimension()I
    .registers 6

    .prologue
    .line 334
    iget v3, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMaxRed:I

    iget v4, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMinRed:I

    sub-int v2, v3, v4

    .line 335
    .local v2, "redLength":I
    iget v3, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMaxGreen:I

    iget v4, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMinGreen:I

    sub-int v1, v3, v4

    .line 336
    .local v1, "greenLength":I
    iget v3, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMaxBlue:I

    iget v4, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMinBlue:I

    sub-int v0, v3, v4

    .line 338
    .local v0, "blueLength":I
    if-lt v2, v1, :cond_18

    if-lt v2, v0, :cond_18

    .line 339
    const/4 v3, -0x3

    .line 343
    :goto_17
    return v3

    .line 340
    :cond_18
    if-lt v1, v2, :cond_1e

    if-lt v1, v0, :cond_1e

    .line 341
    const/4 v3, -0x2

    goto :goto_17

    .line 343
    :cond_1e
    const/4 v3, -0x1

    goto :goto_17
.end method

.method final getVolume()I
    .registers 4

    .prologue
    .line 246
    iget v0, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMaxRed:I

    iget v1, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMinRed:I

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    iget v1, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMaxGreen:I

    iget v2, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMinGreen:I

    sub-int/2addr v1, v2

    add-int/lit8 v1, v1, 0x1

    mul-int/2addr v0, v1

    iget v1, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMaxBlue:I

    iget v2, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mMinBlue:I

    sub-int/2addr v1, v2

    add-int/lit8 v1, v1, 0x1

    mul-int/2addr v0, v1

    return v0
.end method

.method final splitBox()Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;
    .registers 6

    .prologue
    .line 314
    invoke-virtual {p0}, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->canSplit()Z

    move-result v2

    if-nez v2, :cond_e

    .line 315
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Can not split a box with only 1 color"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 319
    :cond_e
    invoke-virtual {p0}, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->findSplitPoint()I

    move-result v1

    .line 321
    .local v1, "splitPoint":I
    new-instance v0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;

    iget-object v2, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->this$0:Landroid/support/v7/graphics/ColorCutQuantizer;

    add-int/lit8 v3, v1, 0x1

    iget v4, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mUpperIndex:I

    invoke-direct {v0, v2, v3, v4}, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;-><init>(Landroid/support/v7/graphics/ColorCutQuantizer;II)V

    .line 324
    .local v0, "newBox":Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;
    iput v1, p0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->mUpperIndex:I

    .line 325
    invoke-virtual {p0}, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->fitBox()V

    .line 327
    return-object v0
.end method
