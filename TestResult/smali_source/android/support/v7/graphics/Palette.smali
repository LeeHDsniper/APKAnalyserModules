.class public final Landroid/support/v7/graphics/Palette;
.super Ljava/lang/Object;
.source "Palette.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/graphics/Palette$1;,
        Landroid/support/v7/graphics/Palette$Generator;,
        Landroid/support/v7/graphics/Palette$Builder;,
        Landroid/support/v7/graphics/Palette$Swatch;,
        Landroid/support/v7/graphics/Palette$PaletteAsyncListener;
    }
.end annotation


# instance fields
.field private final mGenerator:Landroid/support/v7/graphics/Palette$Generator;

.field private final mSwatches:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/graphics/Palette$Swatch;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ljava/util/List;Landroid/support/v7/graphics/Palette$Generator;)V
    .registers 3
    .param p2, "generator"    # Landroid/support/v7/graphics/Palette$Generator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/graphics/Palette$Swatch;",
            ">;",
            "Landroid/support/v7/graphics/Palette$Generator;",
            ")V"
        }
    .end annotation

    .prologue
    .line 140
    .local p1, "swatches":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/graphics/Palette$Swatch;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 141
    iput-object p1, p0, Landroid/support/v7/graphics/Palette;->mSwatches:Ljava/util/List;

    .line 142
    iput-object p2, p0, Landroid/support/v7/graphics/Palette;->mGenerator:Landroid/support/v7/graphics/Palette$Generator;

    .line 143
    return-void
.end method

.method synthetic constructor <init>(Ljava/util/List;Landroid/support/v7/graphics/Palette$Generator;Landroid/support/v7/graphics/Palette$1;)V
    .registers 4
    .param p1, "x0"    # Ljava/util/List;
    .param p2, "x1"    # Landroid/support/v7/graphics/Palette$Generator;
    .param p3, "x2"    # Landroid/support/v7/graphics/Palette$1;

    .prologue
    .line 64
    invoke-direct {p0, p1, p2}, Landroid/support/v7/graphics/Palette;-><init>(Ljava/util/List;Landroid/support/v7/graphics/Palette$Generator;)V

    return-void
.end method

.method static synthetic access$000(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    .registers 3
    .param p0, "x0"    # Landroid/graphics/Bitmap;
    .param p1, "x1"    # I

    .prologue
    .line 64
    invoke-static {p0, p1}, Landroid/support/v7/graphics/Palette;->scaleBitmapDown(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public static from(Landroid/graphics/Bitmap;)Landroid/support/v7/graphics/Palette$Builder;
    .registers 2
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 91
    new-instance v0, Landroid/support/v7/graphics/Palette$Builder;

    invoke-direct {v0, p0}, Landroid/support/v7/graphics/Palette$Builder;-><init>(Landroid/graphics/Bitmap;)V

    return-object v0
.end method

.method private static scaleBitmapDown(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    .registers 7
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "targetMaxDimension"    # I

    .prologue
    .line 259
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 261
    .local v0, "maxDimension":I
    if-gt v0, p1, :cond_f

    .line 267
    .end local p0    # "bitmap":Landroid/graphics/Bitmap;
    :goto_e
    return-object p0

    .line 266
    .restart local p0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_f
    int-to-float v2, p1

    int-to-float v3, v0

    div-float v1, v2, v3

    .line 267
    .local v1, "scaleRatio":F
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, v1

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v3, v1

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    const/4 v4, 0x0

    invoke-static {p0, v2, v3, v4}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p0

    goto :goto_e
.end method


# virtual methods
.method public getSwatches()Ljava/util/List;
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
    .line 149
    iget-object v0, p0, Landroid/support/v7/graphics/Palette;->mSwatches:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getVibrantColor(I)I
    .registers 3
    .param p1, "defaultColor"    # I

    .prologue
    .line 200
    invoke-virtual {p0}, Landroid/support/v7/graphics/Palette;->getVibrantSwatch()Landroid/support/v7/graphics/Palette$Swatch;

    move-result-object v0

    .line 201
    .local v0, "swatch":Landroid/support/v7/graphics/Palette$Swatch;
    if-eqz v0, :cond_a

    invoke-virtual {v0}, Landroid/support/v7/graphics/Palette$Swatch;->getRgb()I

    move-result p1

    .end local p1    # "defaultColor":I
    :cond_a
    return p1
.end method

.method public getVibrantSwatch()Landroid/support/v7/graphics/Palette$Swatch;
    .registers 2

    .prologue
    .line 156
    iget-object v0, p0, Landroid/support/v7/graphics/Palette;->mGenerator:Landroid/support/v7/graphics/Palette$Generator;

    invoke-virtual {v0}, Landroid/support/v7/graphics/Palette$Generator;->getVibrantSwatch()Landroid/support/v7/graphics/Palette$Swatch;

    move-result-object v0

    return-object v0
.end method
