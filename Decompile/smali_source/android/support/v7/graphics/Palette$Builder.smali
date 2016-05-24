.class public final Landroid/support/v7/graphics/Palette$Builder;
.super Ljava/lang/Object;
.source "Palette.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/graphics/Palette;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private mBitmap:Landroid/graphics/Bitmap;

.field private mGenerator:Landroid/support/v7/graphics/Palette$Generator;

.field private mMaxColors:I

.field private mResizeMaxDimension:I

.field private mSwatches:Ljava/util/List;
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
.method public constructor <init>(Landroid/graphics/Bitmap;)V
    .registers 4
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 436
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 428
    const/16 v0, 0x10

    iput v0, p0, Landroid/support/v7/graphics/Palette$Builder;->mMaxColors:I

    .line 429
    const/16 v0, 0xc0

    iput v0, p0, Landroid/support/v7/graphics/Palette$Builder;->mResizeMaxDimension:I

    .line 437
    if-eqz p1, :cond_13

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 438
    :cond_13
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Bitmap is not valid"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 440
    :cond_1b
    iput-object p1, p0, Landroid/support/v7/graphics/Palette$Builder;->mBitmap:Landroid/graphics/Bitmap;

    .line 441
    return-void
.end method


# virtual methods
.method public generate(Landroid/support/v7/graphics/Palette$PaletteAsyncListener;)Landroid/os/AsyncTask;
    .registers 6
    .param p1, "listener"    # Landroid/support/v7/graphics/Palette$PaletteAsyncListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v7/graphics/Palette$PaletteAsyncListener;",
            ")",
            "Landroid/os/AsyncTask",
            "<",
            "Landroid/graphics/Bitmap;",
            "Ljava/lang/Void;",
            "Landroid/support/v7/graphics/Palette;",
            ">;"
        }
    .end annotation

    .prologue
    .line 563
    if-nez p1, :cond_a

    .line 564
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "listener can not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 567
    :cond_a
    new-instance v0, Landroid/support/v7/graphics/Palette$Builder$1;

    invoke-direct {v0, p0, p1}, Landroid/support/v7/graphics/Palette$Builder$1;-><init>(Landroid/support/v7/graphics/Palette$Builder;Landroid/support/v7/graphics/Palette$PaletteAsyncListener;)V

    const/4 v1, 0x1

    new-array v1, v1, [Landroid/graphics/Bitmap;

    const/4 v2, 0x0

    iget-object v3, p0, Landroid/support/v7/graphics/Palette$Builder;->mBitmap:Landroid/graphics/Bitmap;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Landroid/support/v4/os/AsyncTaskCompat;->executeParallel(Landroid/os/AsyncTask;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    move-result-object v0

    return-object v0
.end method

.method public generate()Landroid/support/v7/graphics/Palette;
    .registers 8

    .prologue
    .line 495
    const/4 v0, 0x0

    .line 501
    .local v0, "logger":Landroid/util/TimingLogger;
    iget-object v5, p0, Landroid/support/v7/graphics/Palette$Builder;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v5, :cond_62

    .line 504
    iget v5, p0, Landroid/support/v7/graphics/Palette$Builder;->mResizeMaxDimension:I

    if-gtz v5, :cond_11

    .line 505
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Minimum dimension size for resizing should should be >= 1"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 510
    :cond_11
    iget-object v5, p0, Landroid/support/v7/graphics/Palette$Builder;->mBitmap:Landroid/graphics/Bitmap;

    iget v6, p0, Landroid/support/v7/graphics/Palette$Builder;->mResizeMaxDimension:I

    # invokes: Landroid/support/v7/graphics/Palette;->scaleBitmapDown(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    invoke-static {v5, v6}, Landroid/support/v7/graphics/Palette;->access$000(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 512
    .local v3, "scaledBitmap":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_20

    .line 513
    const-string v5, "Processed Bitmap"

    invoke-virtual {v0, v5}, Landroid/util/TimingLogger;->addSplit(Ljava/lang/String;)V

    .line 517
    :cond_20
    iget v5, p0, Landroid/support/v7/graphics/Palette$Builder;->mMaxColors:I

    invoke-static {v3, v5}, Landroid/support/v7/graphics/ColorCutQuantizer;->fromBitmap(Landroid/graphics/Bitmap;I)Landroid/support/v7/graphics/ColorCutQuantizer;

    move-result-object v2

    .line 521
    .local v2, "quantizer":Landroid/support/v7/graphics/ColorCutQuantizer;
    iget-object v5, p0, Landroid/support/v7/graphics/Palette$Builder;->mBitmap:Landroid/graphics/Bitmap;

    if-eq v3, v5, :cond_2d

    .line 522
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->recycle()V

    .line 524
    :cond_2d
    invoke-virtual {v2}, Landroid/support/v7/graphics/ColorCutQuantizer;->getQuantizedColors()Ljava/util/List;

    move-result-object v4

    .line 526
    .local v4, "swatches":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/graphics/Palette$Swatch;>;"
    if-eqz v0, :cond_38

    .line 527
    const-string v5, "Color quantization completed"

    invoke-virtual {v0, v5}, Landroid/util/TimingLogger;->addSplit(Ljava/lang/String;)V

    .line 535
    .end local v2    # "quantizer":Landroid/support/v7/graphics/ColorCutQuantizer;
    .end local v3    # "scaledBitmap":Landroid/graphics/Bitmap;
    :cond_38
    :goto_38
    iget-object v5, p0, Landroid/support/v7/graphics/Palette$Builder;->mGenerator:Landroid/support/v7/graphics/Palette$Generator;

    if-nez v5, :cond_43

    .line 536
    new-instance v5, Landroid/support/v7/graphics/DefaultGenerator;

    invoke-direct {v5}, Landroid/support/v7/graphics/DefaultGenerator;-><init>()V

    iput-object v5, p0, Landroid/support/v7/graphics/Palette$Builder;->mGenerator:Landroid/support/v7/graphics/Palette$Generator;

    .line 540
    :cond_43
    iget-object v5, p0, Landroid/support/v7/graphics/Palette$Builder;->mGenerator:Landroid/support/v7/graphics/Palette$Generator;

    invoke-virtual {v5, v4}, Landroid/support/v7/graphics/Palette$Generator;->generate(Ljava/util/List;)V

    .line 542
    if-eqz v0, :cond_4f

    .line 543
    const-string v5, "Generator.generate() completed"

    invoke-virtual {v0, v5}, Landroid/util/TimingLogger;->addSplit(Ljava/lang/String;)V

    .line 547
    :cond_4f
    new-instance v1, Landroid/support/v7/graphics/Palette;

    iget-object v5, p0, Landroid/support/v7/graphics/Palette$Builder;->mGenerator:Landroid/support/v7/graphics/Palette$Generator;

    const/4 v6, 0x0

    invoke-direct {v1, v4, v5, v6}, Landroid/support/v7/graphics/Palette;-><init>(Ljava/util/List;Landroid/support/v7/graphics/Palette$Generator;Landroid/support/v7/graphics/Palette$1;)V

    .line 549
    .local v1, "p":Landroid/support/v7/graphics/Palette;
    if-eqz v0, :cond_61

    .line 550
    const-string v5, "Created Palette"

    invoke-virtual {v0, v5}, Landroid/util/TimingLogger;->addSplit(Ljava/lang/String;)V

    .line 551
    invoke-virtual {v0}, Landroid/util/TimingLogger;->dumpToLog()V

    .line 554
    :cond_61
    return-object v1

    .line 531
    .end local v1    # "p":Landroid/support/v7/graphics/Palette;
    .end local v4    # "swatches":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/graphics/Palette$Swatch;>;"
    :cond_62
    iget-object v4, p0, Landroid/support/v7/graphics/Palette$Builder;->mSwatches:Ljava/util/List;

    .restart local v4    # "swatches":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/graphics/Palette$Swatch;>;"
    goto :goto_38
.end method

.method public resizeBitmapSize(I)Landroid/support/v7/graphics/Palette$Builder;
    .registers 2
    .param p1, "maxDimension"    # I

    .prologue
    .line 487
    iput p1, p0, Landroid/support/v7/graphics/Palette$Builder;->mResizeMaxDimension:I

    .line 488
    return-object p0
.end method
