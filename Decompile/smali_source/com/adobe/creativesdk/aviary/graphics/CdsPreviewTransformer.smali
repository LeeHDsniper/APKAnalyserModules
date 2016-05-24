.class public Lcom/adobe/creativesdk/aviary/graphics/CdsPreviewTransformer;
.super Ljava/lang/Object;
.source "CdsPreviewTransformer.java"

# interfaces
.implements Lit/sephiroth/android/library/picasso/Transformation;
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lit/sephiroth/android/library/picasso/Transformation;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# static fields
.field static logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# instance fields
.field final mDisplayName:Ljava/lang/String;

.field mInputDensity:I

.field mMaxH:I

.field mMaxW:I

.field final mPath:Ljava/lang/String;

.field mTargetDensity:I

.field final mType:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 18
    const-class v0, Lcom/adobe/creativesdk/aviary/graphics/CdsPreviewTransformer;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;->ConsoleLoggerType:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/graphics/CdsPreviewTransformer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "displayName"    # Ljava/lang/String;
    .param p3, "type"    # Ljava/lang/String;

    .prologue
    const/4 v0, -0x1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CdsPreviewTransformer;->mMaxW:I

    .line 25
    iput v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CdsPreviewTransformer;->mMaxH:I

    .line 29
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/graphics/CdsPreviewTransformer;->mDisplayName:Ljava/lang/String;

    .line 30
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/graphics/CdsPreviewTransformer;->mType:Ljava/lang/String;

    .line 31
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/graphics/CdsPreviewTransformer;->mPath:Ljava/lang/String;

    .line 32
    return-void
.end method

.method private decode()Landroid/graphics/Bitmap;
    .registers 10

    .prologue
    const/4 v8, 0x2

    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 81
    const/4 v0, 0x0

    .line 82
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 83
    .local v1, "options":Landroid/graphics/BitmapFactory$Options;
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v2, v1, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 84
    iput-boolean v6, v1, Landroid/graphics/BitmapFactory$Options;->inInputShareable:Z

    .line 85
    iput-boolean v6, v1, Landroid/graphics/BitmapFactory$Options;->inPurgeable:Z

    .line 86
    iget v2, p0, Lcom/adobe/creativesdk/aviary/graphics/CdsPreviewTransformer;->mTargetDensity:I

    iput v2, v1, Landroid/graphics/BitmapFactory$Options;->inTargetDensity:I

    .line 87
    iget v2, p0, Lcom/adobe/creativesdk/aviary/graphics/CdsPreviewTransformer;->mInputDensity:I

    iput v2, v1, Landroid/graphics/BitmapFactory$Options;->inDensity:I

    .line 88
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/graphics/CdsPreviewTransformer;->mPath:Ljava/lang/String;

    invoke-static {v2, v1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 90
    sget-object v2, Lcom/adobe/creativesdk/aviary/graphics/CdsPreviewTransformer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "input.density: %d, target.density: %d"

    new-array v4, v8, [Ljava/lang/Object;

    iget v5, p0, Lcom/adobe/creativesdk/aviary/graphics/CdsPreviewTransformer;->mInputDensity:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v7

    iget v5, p0, Lcom/adobe/creativesdk/aviary/graphics/CdsPreviewTransformer;->mTargetDensity:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 91
    sget-object v2, Lcom/adobe/creativesdk/aviary/graphics/CdsPreviewTransformer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "options.size: %dx%d"

    new-array v4, v8, [Ljava/lang/Object;

    iget v5, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v7

    iget v5, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 93
    return-object v0
.end method


# virtual methods
.method public call()Landroid/graphics/Bitmap;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 76
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/graphics/CdsPreviewTransformer;->decode()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 77
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/graphics/CdsPreviewTransformer;->transform(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v1

    return-object v1
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 17
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/graphics/CdsPreviewTransformer;->call()Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public key()Ljava/lang/String;
    .registers 2

    .prologue
    .line 71
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CdsPreviewTransformer;->mPath:Ljava/lang/String;

    return-object v0
.end method

.method public transform(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 12
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 46
    if-eqz p1, :cond_38

    iget v3, p0, Lcom/adobe/creativesdk/aviary/graphics/CdsPreviewTransformer;->mMaxW:I

    if-lez v3, :cond_38

    iget v3, p0, Lcom/adobe/creativesdk/aviary/graphics/CdsPreviewTransformer;->mMaxH:I

    if-lez v3, :cond_38

    .line 47
    sget-object v3, Lcom/adobe/creativesdk/aviary/graphics/CdsPreviewTransformer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "need to resize to: %dx%d"

    new-array v5, v9, [Ljava/lang/Object;

    iget v6, p0, Lcom/adobe/creativesdk/aviary/graphics/CdsPreviewTransformer;->mMaxW:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    iget v6, p0, Lcom/adobe/creativesdk/aviary/graphics/CdsPreviewTransformer;->mMaxH:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 48
    iget v3, p0, Lcom/adobe/creativesdk/aviary/graphics/CdsPreviewTransformer;->mMaxW:I

    iget v4, p0, Lcom/adobe/creativesdk/aviary/graphics/CdsPreviewTransformer;->mMaxH:I

    invoke-static {p1, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/utils/BitmapUtils;->resizeBitmap(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 49
    .local v2, "resized":Landroid/graphics/Bitmap;
    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_38

    .line 50
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 51
    move-object p1, v2

    .line 55
    .end local v2    # "resized":Landroid/graphics/Bitmap;
    :cond_38
    const-string v3, "effect"

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/graphics/CdsPreviewTransformer;->mType:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5c

    .line 56
    if-eqz p1, :cond_5c

    .line 57
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    int-to-float v3, v3

    const v4, 0x3f5d70a4

    mul-float/2addr v3, v4

    float-to-int v0, v3

    .line 58
    .local v0, "finalHeight":I
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-static {p1, v7, v7, v3, v0}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 59
    .local v1, "newBitmap":Landroid/graphics/Bitmap;
    if-eq v1, p1, :cond_5c

    .line 60
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 61
    move-object p1, v1

    .line 65
    .end local v0    # "finalHeight":I
    .end local v1    # "newBitmap":Landroid/graphics/Bitmap;
    :cond_5c
    sget-object v3, Lcom/adobe/creativesdk/aviary/graphics/CdsPreviewTransformer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "final bitmap.size: %dx%d"

    new-array v5, v9, [Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 66
    return-object p1
.end method
