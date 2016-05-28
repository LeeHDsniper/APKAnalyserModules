.class public Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
.super Ljava/lang/Object;
.source "DisplayImageOptions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private cacheInMemory:Z

.field private cacheOnDisk:Z

.field private considerExifParams:Z

.field private decodingOptions:Landroid/graphics/BitmapFactory$Options;

.field private delayBeforeLoading:I

.field private displayer:Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;

.field private extraForDownloader:Ljava/lang/Object;

.field private handler:Landroid/os/Handler;

.field private imageForEmptyUri:Landroid/graphics/drawable/Drawable;

.field private imageOnFail:Landroid/graphics/drawable/Drawable;

.field private imageOnLoading:Landroid/graphics/drawable/Drawable;

.field private imageResForEmptyUri:I

.field private imageResOnFail:I

.field private imageResOnLoading:I

.field private imageScaleType:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

.field private isSyncLoading:Z

.field private postProcessor:Lcom/nostra13/universalimageloader/core/process/BitmapProcessor;

.field private preProcessor:Lcom/nostra13/universalimageloader/core/process/BitmapProcessor;

.field private resetViewBeforeLoading:Z


# direct methods
.method public constructor <init>()V
    .registers 5

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 223
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 203
    iput v1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageResOnLoading:I

    .line 204
    iput v1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageResForEmptyUri:I

    .line 205
    iput v1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageResOnFail:I

    .line 206
    iput-object v2, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageOnLoading:Landroid/graphics/drawable/Drawable;

    .line 207
    iput-object v2, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageForEmptyUri:Landroid/graphics/drawable/Drawable;

    .line 208
    iput-object v2, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageOnFail:Landroid/graphics/drawable/Drawable;

    .line 209
    iput-boolean v1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->resetViewBeforeLoading:Z

    .line 210
    iput-boolean v1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory:Z

    .line 211
    iput-boolean v1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheOnDisk:Z

    .line 212
    sget-object v0, Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;->IN_SAMPLE_POWER_OF_2:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageScaleType:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    .line 213
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->decodingOptions:Landroid/graphics/BitmapFactory$Options;

    .line 214
    iput v1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->delayBeforeLoading:I

    .line 215
    iput-boolean v1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerExifParams:Z

    .line 216
    iput-object v2, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->extraForDownloader:Ljava/lang/Object;

    .line 217
    iput-object v2, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->preProcessor:Lcom/nostra13/universalimageloader/core/process/BitmapProcessor;

    .line 218
    iput-object v2, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->postProcessor:Lcom/nostra13/universalimageloader/core/process/BitmapProcessor;

    .line 219
    invoke-static {}, Lcom/nostra13/universalimageloader/core/DefaultConfigurationFactory;->createBitmapDisplayer()Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->displayer:Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;

    .line 220
    iput-object v2, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->handler:Landroid/os/Handler;

    .line 221
    iput-boolean v1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isSyncLoading:Z

    .line 224
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->decodingOptions:Landroid/graphics/BitmapFactory$Options;

    iput-boolean v3, v0, Landroid/graphics/BitmapFactory$Options;->inPurgeable:Z

    .line 225
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->decodingOptions:Landroid/graphics/BitmapFactory$Options;

    iput-boolean v3, v0, Landroid/graphics/BitmapFactory$Options;->inInputShareable:Z

    .line 226
    return-void
.end method

.method static synthetic access$000(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)I
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    .prologue
    .line 202
    iget v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageResOnLoading:I

    return v0
.end method

.method static synthetic access$100(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)I
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    .prologue
    .line 202
    iget v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageResForEmptyUri:I

    return v0
.end method

.method static synthetic access$1000(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Landroid/graphics/BitmapFactory$Options;
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    .prologue
    .line 202
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->decodingOptions:Landroid/graphics/BitmapFactory$Options;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)I
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    .prologue
    .line 202
    iget v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->delayBeforeLoading:I

    return v0
.end method

.method static synthetic access$1200(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Z
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    .prologue
    .line 202
    iget-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerExifParams:Z

    return v0
.end method

.method static synthetic access$1300(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Ljava/lang/Object;
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    .prologue
    .line 202
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->extraForDownloader:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Lcom/nostra13/universalimageloader/core/process/BitmapProcessor;
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    .prologue
    .line 202
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->preProcessor:Lcom/nostra13/universalimageloader/core/process/BitmapProcessor;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Lcom/nostra13/universalimageloader/core/process/BitmapProcessor;
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    .prologue
    .line 202
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->postProcessor:Lcom/nostra13/universalimageloader/core/process/BitmapProcessor;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    .prologue
    .line 202
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->displayer:Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Landroid/os/Handler;
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    .prologue
    .line 202
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Z
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    .prologue
    .line 202
    iget-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isSyncLoading:Z

    return v0
.end method

.method static synthetic access$200(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)I
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    .prologue
    .line 202
    iget v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageResOnFail:I

    return v0
.end method

.method static synthetic access$300(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Landroid/graphics/drawable/Drawable;
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    .prologue
    .line 202
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageOnLoading:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method static synthetic access$400(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Landroid/graphics/drawable/Drawable;
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    .prologue
    .line 202
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageForEmptyUri:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method static synthetic access$500(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Landroid/graphics/drawable/Drawable;
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    .prologue
    .line 202
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageOnFail:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method static synthetic access$600(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Z
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    .prologue
    .line 202
    iget-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->resetViewBeforeLoading:Z

    return v0
.end method

.method static synthetic access$700(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Z
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    .prologue
    .line 202
    iget-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory:Z

    return v0
.end method

.method static synthetic access$800(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Z
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    .prologue
    .line 202
    iget-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheOnDisk:Z

    return v0
.end method

.method static synthetic access$900(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;
    .registers 2
    .param p0, "x0"    # Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    .prologue
    .line 202
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageScaleType:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    return-object v0
.end method


# virtual methods
.method public bitmapConfig(Landroid/graphics/Bitmap$Config;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .registers 4
    .param p1, "bitmapConfig"    # Landroid/graphics/Bitmap$Config;

    .prologue
    .line 382
    if-nez p1, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "bitmapConfig can\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 383
    :cond_a
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->decodingOptions:Landroid/graphics/BitmapFactory$Options;

    iput-object p1, v0, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 384
    return-object p0
.end method

.method public build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .registers 3

    .prologue
    .line 489
    new-instance v0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;-><init>(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;Lcom/nostra13/universalimageloader/core/DisplayImageOptions$1;)V

    return-object v0
.end method

.method public cacheInMemory(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .registers 2
    .param p1, "cacheInMemory"    # Z

    .prologue
    .line 341
    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory:Z

    .line 342
    return-object p0
.end method

.method public cacheOnDisk(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .registers 2
    .param p1, "cacheOnDisk"    # Z

    .prologue
    .line 367
    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheOnDisk:Z

    .line 368
    return-object p0
.end method

.method public cloneFrom(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .registers 3
    .param p1, "options"    # Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    .prologue
    .line 465
    # getter for: Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->imageResOnLoading:I
    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$1900(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)I

    move-result v0

    iput v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageResOnLoading:I

    .line 466
    # getter for: Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->imageResForEmptyUri:I
    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$2000(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)I

    move-result v0

    iput v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageResForEmptyUri:I

    .line 467
    # getter for: Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->imageResOnFail:I
    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$2100(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)I

    move-result v0

    iput v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageResOnFail:I

    .line 468
    # getter for: Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->imageOnLoading:Landroid/graphics/drawable/Drawable;
    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$2200(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageOnLoading:Landroid/graphics/drawable/Drawable;

    .line 469
    # getter for: Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->imageForEmptyUri:Landroid/graphics/drawable/Drawable;
    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$2300(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageForEmptyUri:Landroid/graphics/drawable/Drawable;

    .line 470
    # getter for: Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->imageOnFail:Landroid/graphics/drawable/Drawable;
    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$2400(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageOnFail:Landroid/graphics/drawable/Drawable;

    .line 471
    # getter for: Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->resetViewBeforeLoading:Z
    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$2500(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->resetViewBeforeLoading:Z

    .line 472
    # getter for: Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->cacheInMemory:Z
    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$2600(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory:Z

    .line 473
    # getter for: Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->cacheOnDisk:Z
    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$2700(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheOnDisk:Z

    .line 474
    # getter for: Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->imageScaleType:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;
    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$2800(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageScaleType:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    .line 475
    # getter for: Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->decodingOptions:Landroid/graphics/BitmapFactory$Options;
    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$2900(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Landroid/graphics/BitmapFactory$Options;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->decodingOptions:Landroid/graphics/BitmapFactory$Options;

    .line 476
    # getter for: Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->delayBeforeLoading:I
    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$3000(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)I

    move-result v0

    iput v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->delayBeforeLoading:I

    .line 477
    # getter for: Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->considerExifParams:Z
    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$3100(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerExifParams:Z

    .line 478
    # getter for: Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->extraForDownloader:Ljava/lang/Object;
    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$3200(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->extraForDownloader:Ljava/lang/Object;

    .line 479
    # getter for: Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->preProcessor:Lcom/nostra13/universalimageloader/core/process/BitmapProcessor;
    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$3300(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/process/BitmapProcessor;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->preProcessor:Lcom/nostra13/universalimageloader/core/process/BitmapProcessor;

    .line 480
    # getter for: Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->postProcessor:Lcom/nostra13/universalimageloader/core/process/BitmapProcessor;
    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$3400(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/process/BitmapProcessor;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->postProcessor:Lcom/nostra13/universalimageloader/core/process/BitmapProcessor;

    .line 481
    # getter for: Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->displayer:Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;
    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$3500(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->displayer:Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;

    .line 482
    # getter for: Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->handler:Landroid/os/Handler;
    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$3600(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Landroid/os/Handler;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->handler:Landroid/os/Handler;

    .line 483
    # getter for: Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->isSyncLoading:Z
    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$3700(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isSyncLoading:Z

    .line 484
    return-object p0
.end method

.method public displayer(Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .registers 4
    .param p1, "displayer"    # Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;

    .prologue
    .line 444
    if-nez p1, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "displayer can\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 445
    :cond_a
    iput-object p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->displayer:Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;

    .line 446
    return-object p0
.end method

.method public imageScaleType(Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .registers 2
    .param p1, "imageScaleType"    # Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    .prologue
    .line 376
    iput-object p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageScaleType:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    .line 377
    return-object p0
.end method

.method public resetViewBeforeLoading(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .registers 2
    .param p1, "resetViewBeforeLoading"    # Z

    .prologue
    .line 324
    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->resetViewBeforeLoading:Z

    .line 325
    return-object p0
.end method

.method public showImageOnFail(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .registers 2
    .param p1, "imageRes"    # I

    .prologue
    .line 293
    iput p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageResOnFail:I

    .line 294
    return-object p0
.end method

.method syncLoading(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .registers 2
    .param p1, "isSyncLoading"    # Z

    .prologue
    .line 450
    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isSyncLoading:Z

    .line 451
    return-object p0
.end method
