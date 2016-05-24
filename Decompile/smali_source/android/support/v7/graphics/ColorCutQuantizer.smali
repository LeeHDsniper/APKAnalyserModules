.class final Landroid/support/v7/graphics/ColorCutQuantizer;
.super Ljava/lang/Object;
.source "ColorCutQuantizer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;
    }
.end annotation


# static fields
.field private static final VBOX_COMPARATOR_VOLUME:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final mColors:[I

.field final mHistogram:[I

.field final mQuantizedColors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/graphics/Palette$Swatch;",
            ">;"
        }
    .end annotation
.end field

.field private final mTempHsl:[F

.field final mTimingLogger:Landroid/util/TimingLogger;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 482
    new-instance v0, Landroid/support/v7/graphics/ColorCutQuantizer$1;

    invoke-direct {v0}, Landroid/support/v7/graphics/ColorCutQuantizer$1;-><init>()V

    sput-object v0, Landroid/support/v7/graphics/ColorCutQuantizer;->VBOX_COMPARATOR_VOLUME:Ljava/util/Comparator;

    return-void
.end method

.method private constructor <init>([II)V
    .registers 20
    .param p1, "pixels"    # [I
    .param p2, "maxColors"    # I

    .prologue
    .line 89
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 65
    const/4 v13, 0x3

    new-array v13, v13, [F

    move-object/from16 v0, p0

    iput-object v13, v0, Landroid/support/v7/graphics/ColorCutQuantizer;->mTempHsl:[F

    .line 90
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-object v13, v0, Landroid/support/v7/graphics/ColorCutQuantizer;->mTimingLogger:Landroid/util/TimingLogger;

    .line 92
    const v13, 0x8000

    new-array v8, v13, [I

    move-object/from16 v0, p0

    iput-object v8, v0, Landroid/support/v7/graphics/ColorCutQuantizer;->mHistogram:[I

    .line 93
    .local v8, "hist":[I
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_19
    move-object/from16 v0, p1

    array-length v13, v0

    if-ge v9, v13, :cond_2f

    .line 94
    aget v13, p1, v9

    invoke-static {v13}, Landroid/support/v7/graphics/ColorCutQuantizer;->quantizeFromRgb888(I)I

    move-result v12

    .line 96
    .local v12, "quantizedColor":I
    aput v12, p1, v9

    .line 98
    aget v13, v8, v12

    add-int/lit8 v13, v13, 0x1

    aput v13, v8, v12

    .line 93
    add-int/lit8 v9, v9, 0x1

    goto :goto_19

    .line 106
    .end local v12    # "quantizedColor":I
    :cond_2f
    const/4 v5, 0x0

    .line 107
    .local v5, "distinctColorCount":I
    const/4 v3, 0x0

    .local v3, "color":I
    :goto_31
    array-length v13, v8

    if-ge v3, v13, :cond_4c

    .line 108
    aget v13, v8, v3

    if-lez v13, :cond_43

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Landroid/support/v7/graphics/ColorCutQuantizer;->shouldIgnoreColor(I)Z

    move-result v13

    if-eqz v13, :cond_43

    .line 110
    const/4 v13, 0x0

    aput v13, v8, v3

    .line 112
    :cond_43
    aget v13, v8, v3

    if-lez v13, :cond_49

    .line 114
    add-int/lit8 v5, v5, 0x1

    .line 107
    :cond_49
    add-int/lit8 v3, v3, 0x1

    goto :goto_31

    .line 123
    :cond_4c
    new-array v4, v5, [I

    move-object/from16 v0, p0

    iput-object v4, v0, Landroid/support/v7/graphics/ColorCutQuantizer;->mColors:[I

    .line 124
    .local v4, "colors":[I
    const/4 v6, 0x0

    .line 125
    .local v6, "distinctColorIndex":I
    const/4 v3, 0x0

    :goto_54
    array-length v13, v8

    if-ge v3, v13, :cond_63

    .line 126
    aget v13, v8, v3

    if-lez v13, :cond_60

    .line 127
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "distinctColorIndex":I
    .local v7, "distinctColorIndex":I
    aput v3, v4, v6

    move v6, v7

    .line 125
    .end local v7    # "distinctColorIndex":I
    .restart local v6    # "distinctColorIndex":I
    :cond_60
    add-int/lit8 v3, v3, 0x1

    goto :goto_54

    .line 135
    :cond_63
    move/from16 v0, p2

    if-gt v5, v0, :cond_8c

    .line 137
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, p0

    iput-object v13, v0, Landroid/support/v7/graphics/ColorCutQuantizer;->mQuantizedColors:Ljava/util/List;

    .line 138
    move-object v2, v4

    .local v2, "arr$":[I
    array-length v11, v2

    .local v11, "len$":I
    const/4 v10, 0x0

    .local v10, "i$":I
    :goto_73
    if-ge v10, v11, :cond_98

    aget v3, v2, v10

    .line 139
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/support/v7/graphics/ColorCutQuantizer;->mQuantizedColors:Ljava/util/List;

    new-instance v14, Landroid/support/v7/graphics/Palette$Swatch;

    invoke-static {v3}, Landroid/support/v7/graphics/ColorCutQuantizer;->approximateToRgb888(I)I

    move-result v15

    aget v16, v8, v3

    invoke-direct/range {v14 .. v16}, Landroid/support/v7/graphics/Palette$Swatch;-><init>(II)V

    invoke-interface {v13, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 138
    add-int/lit8 v10, v10, 0x1

    goto :goto_73

    .line 148
    .end local v2    # "arr$":[I
    .end local v10    # "i$":I
    .end local v11    # "len$":I
    :cond_8c
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v1}, Landroid/support/v7/graphics/ColorCutQuantizer;->quantizePixels(I)Ljava/util/List;

    move-result-object v13

    move-object/from16 v0, p0

    iput-object v13, v0, Landroid/support/v7/graphics/ColorCutQuantizer;->mQuantizedColors:Ljava/util/List;

    .line 155
    :cond_98
    return-void
.end method

.method static synthetic access$000(I)I
    .registers 2
    .param p0, "x0"    # I

    .prologue
    .line 45
    invoke-static {p0}, Landroid/support/v7/graphics/ColorCutQuantizer;->quantizedRed(I)I

    move-result v0

    return v0
.end method

.method static synthetic access$100(I)I
    .registers 2
    .param p0, "x0"    # I

    .prologue
    .line 45
    invoke-static {p0}, Landroid/support/v7/graphics/ColorCutQuantizer;->quantizedGreen(I)I

    move-result v0

    return v0
.end method

.method static synthetic access$200(I)I
    .registers 2
    .param p0, "x0"    # I

    .prologue
    .line 45
    invoke-static {p0}, Landroid/support/v7/graphics/ColorCutQuantizer;->quantizedBlue(I)I

    move-result v0

    return v0
.end method

.method static synthetic access$300([IIII)V
    .registers 4
    .param p0, "x0"    # [I
    .param p1, "x1"    # I
    .param p2, "x2"    # I
    .param p3, "x3"    # I

    .prologue
    .line 45
    invoke-static {p0, p1, p2, p3}, Landroid/support/v7/graphics/ColorCutQuantizer;->modifySignificantOctet([IIII)V

    return-void
.end method

.method static synthetic access$400(III)I
    .registers 4
    .param p0, "x0"    # I
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .prologue
    .line 45
    invoke-static {p0, p1, p2}, Landroid/support/v7/graphics/ColorCutQuantizer;->approximateToRgb888(III)I

    move-result v0

    return v0
.end method

.method private static approximateToRgb888(I)I
    .registers 4
    .param p0, "color"    # I

    .prologue
    .line 509
    invoke-static {p0}, Landroid/support/v7/graphics/ColorCutQuantizer;->quantizedRed(I)I

    move-result v0

    invoke-static {p0}, Landroid/support/v7/graphics/ColorCutQuantizer;->quantizedGreen(I)I

    move-result v1

    invoke-static {p0}, Landroid/support/v7/graphics/ColorCutQuantizer;->quantizedBlue(I)I

    move-result v2

    invoke-static {v0, v1, v2}, Landroid/support/v7/graphics/ColorCutQuantizer;->approximateToRgb888(III)I

    move-result v0

    return v0
.end method

.method private static approximateToRgb888(III)I
    .registers 7
    .param p0, "r"    # I
    .param p1, "g"    # I
    .param p2, "b"    # I

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x5

    .line 503
    invoke-static {p0, v2, v3}, Landroid/support/v7/graphics/ColorCutQuantizer;->modifyWordWidth(III)I

    move-result v0

    invoke-static {p1, v2, v3}, Landroid/support/v7/graphics/ColorCutQuantizer;->modifyWordWidth(III)I

    move-result v1

    invoke-static {p2, v2, v3}, Landroid/support/v7/graphics/ColorCutQuantizer;->modifyWordWidth(III)I

    move-result v2

    invoke-static {v0, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    return v0
.end method

.method static fromBitmap(Landroid/graphics/Bitmap;I)Landroid/support/v7/graphics/ColorCutQuantizer;
    .registers 10
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "maxColors"    # I

    .prologue
    const/4 v2, 0x0

    .line 74
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    .line 75
    .local v3, "width":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    .line 77
    .local v7, "height":I
    mul-int v0, v3, v7

    new-array v1, v0, [I

    .local v1, "pixels":[I
    move-object v0, p0

    move v4, v2

    move v5, v2

    move v6, v3

    .line 78
    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    .line 80
    new-instance v0, Landroid/support/v7/graphics/ColorCutQuantizer;

    invoke-direct {v0, v1, p1}, Landroid/support/v7/graphics/ColorCutQuantizer;-><init>([II)V

    return-object v0
.end method

.method private generateAverageColors(Ljava/util/Collection;)Ljava/util/List;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/graphics/Palette$Swatch;",
            ">;"
        }
    .end annotation

    .prologue
    .line 213
    .local p1, "vboxes":Ljava/util/Collection;, "Ljava/util/Collection<Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v4

    invoke-direct {v0, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 214
    .local v0, "colors":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/support/v7/graphics/Palette$Swatch;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_d
    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_27

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;

    .line 215
    .local v3, "vbox":Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;
    invoke-virtual {v3}, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->getAverageColor()Landroid/support/v7/graphics/Palette$Swatch;

    move-result-object v2

    .line 216
    .local v2, "swatch":Landroid/support/v7/graphics/Palette$Swatch;
    invoke-static {v2}, Landroid/support/v7/graphics/ColorCutQuantizer;->shouldIgnoreColor(Landroid/support/v7/graphics/Palette$Swatch;)Z

    move-result v4

    if-nez v4, :cond_d

    .line 219
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_d

    .line 222
    .end local v2    # "swatch":Landroid/support/v7/graphics/Palette$Swatch;
    .end local v3    # "vbox":Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;
    :cond_27
    return-object v0
.end method

.method private static isBlack([F)Z
    .registers 3
    .param p0, "hslColor"    # [F

    .prologue
    .line 462
    const/4 v0, 0x2

    aget v0, p0, v0

    const v1, 0x3d4ccccd

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private static isNearRedILine([F)Z
    .registers 5
    .param p0, "hslColor"    # [F

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 476
    aget v2, p0, v1

    const/high16 v3, 0x41200000

    cmpl-float v2, v2, v3

    if-ltz v2, :cond_1c

    aget v2, p0, v1

    const/high16 v3, 0x42140000

    cmpg-float v2, v2, v3

    if-gtz v2, :cond_1c

    aget v2, p0, v0

    const v3, 0x3f51eb85

    cmpg-float v2, v2, v3

    if-gtz v2, :cond_1c

    :goto_1b
    return v0

    :cond_1c
    move v0, v1

    goto :goto_1b
.end method

.method private static isWhite([F)Z
    .registers 3
    .param p0, "hslColor"    # [F

    .prologue
    .line 469
    const/4 v0, 0x2

    aget v0, p0, v0

    const v1, 0x3f733333

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private static modifySignificantOctet([IIII)V
    .registers 8
    .param p0, "a"    # [I
    .param p1, "dimension"    # I
    .param p2, "lower"    # I
    .param p3, "upper"    # I

    .prologue
    .line 420
    packed-switch p1, :pswitch_data_3c

    .line 443
    :cond_3
    :pswitch_3
    return-void

    .line 426
    :pswitch_4
    move v1, p2

    .local v1, "i":I
    :goto_5
    if-gt v1, p3, :cond_3

    .line 427
    aget v0, p0, v1

    .line 428
    .local v0, "color":I
    invoke-static {v0}, Landroid/support/v7/graphics/ColorCutQuantizer;->quantizedGreen(I)I

    move-result v2

    shl-int/lit8 v2, v2, 0xa

    invoke-static {v0}, Landroid/support/v7/graphics/ColorCutQuantizer;->quantizedRed(I)I

    move-result v3

    shl-int/lit8 v3, v3, 0x5

    or-int/2addr v2, v3

    invoke-static {v0}, Landroid/support/v7/graphics/ColorCutQuantizer;->quantizedBlue(I)I

    move-result v3

    or-int/2addr v2, v3

    aput v2, p0, v1

    .line 426
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 435
    .end local v0    # "color":I
    .end local v1    # "i":I
    :pswitch_20
    move v1, p2

    .restart local v1    # "i":I
    :goto_21
    if-gt v1, p3, :cond_3

    .line 436
    aget v0, p0, v1

    .line 437
    .restart local v0    # "color":I
    invoke-static {v0}, Landroid/support/v7/graphics/ColorCutQuantizer;->quantizedBlue(I)I

    move-result v2

    shl-int/lit8 v2, v2, 0xa

    invoke-static {v0}, Landroid/support/v7/graphics/ColorCutQuantizer;->quantizedGreen(I)I

    move-result v3

    shl-int/lit8 v3, v3, 0x5

    or-int/2addr v2, v3

    invoke-static {v0}, Landroid/support/v7/graphics/ColorCutQuantizer;->quantizedRed(I)I

    move-result v3

    or-int/2addr v2, v3

    aput v2, p0, v1

    .line 435
    add-int/lit8 v1, v1, 0x1

    goto :goto_21

    .line 420
    :pswitch_data_3c
    .packed-switch -0x3
        :pswitch_3
        :pswitch_4
        :pswitch_20
    .end packed-switch
.end method

.method private static modifyWordWidth(III)I
    .registers 7
    .param p0, "value"    # I
    .param p1, "currentWidth"    # I
    .param p2, "targetWidth"    # I

    .prologue
    const/4 v3, 0x1

    .line 535
    if-le p2, p1, :cond_14

    .line 538
    shl-int v1, v3, p2

    add-int/lit8 v1, v1, -0x1

    mul-int/2addr v1, p0

    shl-int v2, v3, p1

    add-int/lit8 v2, v2, -0x1

    div-int v0, v1, v2

    .line 543
    .local v0, "newValue":I
    :goto_e
    shl-int v1, v3, p2

    add-int/lit8 v1, v1, -0x1

    and-int/2addr v1, v0

    return v1

    .line 541
    .end local v0    # "newValue":I
    :cond_14
    sub-int v1, p1, p2

    shr-int v0, p0, v1

    .restart local v0    # "newValue":I
    goto :goto_e
.end method

.method private static quantizeFromRgb888(I)I
    .registers 7
    .param p0, "color"    # I

    .prologue
    const/16 v5, 0x8

    const/4 v4, 0x5

    .line 493
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v3

    invoke-static {v3, v5, v4}, Landroid/support/v7/graphics/ColorCutQuantizer;->modifyWordWidth(III)I

    move-result v2

    .line 494
    .local v2, "r":I
    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v3

    invoke-static {v3, v5, v4}, Landroid/support/v7/graphics/ColorCutQuantizer;->modifyWordWidth(III)I

    move-result v1

    .line 495
    .local v1, "g":I
    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result v3

    invoke-static {v3, v5, v4}, Landroid/support/v7/graphics/ColorCutQuantizer;->modifyWordWidth(III)I

    move-result v0

    .line 496
    .local v0, "b":I
    shl-int/lit8 v3, v2, 0xa

    shl-int/lit8 v4, v1, 0x5

    or-int/2addr v3, v4

    or-int/2addr v3, v0

    return v3
.end method

.method private quantizePixels(I)Ljava/util/List;
    .registers 6
    .param p1, "maxColors"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/graphics/Palette$Swatch;",
            ">;"
        }
    .end annotation

    .prologue
    .line 167
    new-instance v0, Ljava/util/PriorityQueue;

    sget-object v1, Landroid/support/v7/graphics/ColorCutQuantizer;->VBOX_COMPARATOR_VOLUME:Ljava/util/Comparator;

    invoke-direct {v0, p1, v1}, Ljava/util/PriorityQueue;-><init>(ILjava/util/Comparator;)V

    .line 170
    .local v0, "pq":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;>;"
    new-instance v1, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;

    const/4 v2, 0x0

    iget-object v3, p0, Landroid/support/v7/graphics/ColorCutQuantizer;->mColors:[I

    array-length v3, v3

    add-int/lit8 v3, v3, -0x1

    invoke-direct {v1, p0, v2, v3}, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;-><init>(Landroid/support/v7/graphics/ColorCutQuantizer;II)V

    invoke-virtual {v0, v1}, Ljava/util/PriorityQueue;->offer(Ljava/lang/Object;)Z

    .line 174
    invoke-direct {p0, v0, p1}, Landroid/support/v7/graphics/ColorCutQuantizer;->splitBoxes(Ljava/util/PriorityQueue;I)V

    .line 177
    invoke-direct {p0, v0}, Landroid/support/v7/graphics/ColorCutQuantizer;->generateAverageColors(Ljava/util/Collection;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method private static quantizedBlue(I)I
    .registers 2
    .param p0, "color"    # I

    .prologue
    .line 530
    and-int/lit8 v0, p0, 0x1f

    return v0
.end method

.method private static quantizedGreen(I)I
    .registers 2
    .param p0, "color"    # I

    .prologue
    .line 523
    shr-int/lit8 v0, p0, 0x5

    and-int/lit8 v0, v0, 0x1f

    return v0
.end method

.method private static quantizedRed(I)I
    .registers 2
    .param p0, "color"    # I

    .prologue
    .line 516
    shr-int/lit8 v0, p0, 0xa

    and-int/lit8 v0, v0, 0x1f

    return v0
.end method

.method private shouldIgnoreColor(I)Z
    .registers 4
    .param p1, "color565"    # I

    .prologue
    .line 446
    invoke-static {p1}, Landroid/support/v7/graphics/ColorCutQuantizer;->approximateToRgb888(I)I

    move-result v0

    iget-object v1, p0, Landroid/support/v7/graphics/ColorCutQuantizer;->mTempHsl:[F

    invoke-static {v0, v1}, Landroid/support/v4/graphics/ColorUtils;->colorToHSL(I[F)V

    .line 447
    iget-object v0, p0, Landroid/support/v7/graphics/ColorCutQuantizer;->mTempHsl:[F

    invoke-static {v0}, Landroid/support/v7/graphics/ColorCutQuantizer;->shouldIgnoreColor([F)Z

    move-result v0

    return v0
.end method

.method private static shouldIgnoreColor(Landroid/support/v7/graphics/Palette$Swatch;)Z
    .registers 2
    .param p0, "color"    # Landroid/support/v7/graphics/Palette$Swatch;

    .prologue
    .line 451
    invoke-virtual {p0}, Landroid/support/v7/graphics/Palette$Swatch;->getHsl()[F

    move-result-object v0

    invoke-static {v0}, Landroid/support/v7/graphics/ColorCutQuantizer;->shouldIgnoreColor([F)Z

    move-result v0

    return v0
.end method

.method private static shouldIgnoreColor([F)Z
    .registers 2
    .param p0, "hslColor"    # [F

    .prologue
    .line 455
    invoke-static {p0}, Landroid/support/v7/graphics/ColorCutQuantizer;->isWhite([F)Z

    move-result v0

    if-nez v0, :cond_12

    invoke-static {p0}, Landroid/support/v7/graphics/ColorCutQuantizer;->isBlack([F)Z

    move-result v0

    if-nez v0, :cond_12

    invoke-static {p0}, Landroid/support/v7/graphics/ColorCutQuantizer;->isNearRedILine([F)Z

    move-result v0

    if-eqz v0, :cond_14

    :cond_12
    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method private splitBoxes(Ljava/util/PriorityQueue;I)V
    .registers 5
    .param p2, "maxSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/PriorityQueue",
            "<",
            "Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 190
    .local p1, "queue":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;>;"
    :goto_0
    invoke-virtual {p1}, Ljava/util/PriorityQueue;->size()I

    move-result v1

    if-ge v1, p2, :cond_1f

    .line 191
    invoke-virtual {p1}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;

    .line 193
    .local v0, "vbox":Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;
    if-eqz v0, :cond_1f

    invoke-virtual {v0}, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->canSplit()Z

    move-result v1

    if-eqz v1, :cond_1f

    .line 195
    invoke-virtual {v0}, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->splitBox()Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/util/PriorityQueue;->offer(Ljava/lang/Object;)Z

    .line 201
    invoke-virtual {p1, v0}, Ljava/util/PriorityQueue;->offer(Ljava/lang/Object;)Z

    goto :goto_0

    .line 210
    .end local v0    # "vbox":Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;
    :cond_1f
    return-void
.end method


# virtual methods
.method getQuantizedColors()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/graphics/Palette$Swatch;",
            ">;"
        }
    .end annotation

    .prologue
    .line 161
    iget-object v0, p0, Landroid/support/v7/graphics/ColorCutQuantizer;->mQuantizedColors:Ljava/util/List;

    return-object v0
.end method
