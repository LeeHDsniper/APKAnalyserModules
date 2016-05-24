.class public Lcom/behance/sdk/project/modules/CoverImage;
.super Ljava/lang/Object;
.source "CoverImage.java"


# static fields
.field private static final logger:Lcom/behance/sdk/logger/ILogger;


# instance fields
.field private coverImage:Landroid/graphics/Bitmap;

.field private originalImage:Lcom/behance/sdk/project/modules/ImageModule;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 35
    const-class v0, Lcom/behance/sdk/project/modules/CoverImage;

    invoke-static {v0}, Lcom/behance/sdk/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/behance/sdk/logger/ILogger;

    move-result-object v0

    sput-object v0, Lcom/behance/sdk/project/modules/CoverImage;->logger:Lcom/behance/sdk/logger/ILogger;

    return-void
.end method

.method public constructor <init>(Lcom/behance/sdk/project/modules/ImageModule;Landroid/graphics/Bitmap;)V
    .registers 3
    .param p1, "originalImage"    # Lcom/behance/sdk/project/modules/ImageModule;
    .param p2, "covertedFile"    # Landroid/graphics/Bitmap;

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object p1, p0, Lcom/behance/sdk/project/modules/CoverImage;->originalImage:Lcom/behance/sdk/project/modules/ImageModule;

    .line 48
    iput-object p2, p0, Lcom/behance/sdk/project/modules/CoverImage;->coverImage:Landroid/graphics/Bitmap;

    .line 49
    return-void
.end method


# virtual methods
.method public getBitMap()Landroid/graphics/Bitmap;
    .registers 2

    .prologue
    .line 59
    iget-object v0, p0, Lcom/behance/sdk/project/modules/CoverImage;->coverImage:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getByteArray()[B
    .registers 10

    .prologue
    const/4 v8, 0x0

    .line 72
    iget-object v5, p0, Lcom/behance/sdk/project/modules/CoverImage;->coverImage:Landroid/graphics/Bitmap;

    if-eqz v5, :cond_3b

    .line 73
    iget-object v5, p0, Lcom/behance/sdk/project/modules/CoverImage;->coverImage:Landroid/graphics/Bitmap;

    const/16 v6, 0x194

    const/16 v7, 0x13c

    invoke-static {v5, v6, v7, v8}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 75
    .local v3, "covertedFile":Landroid/graphics/Bitmap;
    const/4 v0, 0x0

    .line 77
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    :try_start_10
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_15
    .catchall {:try_start_10 .. :try_end_15} :catchall_2d

    .line 78
    .end local v0    # "baos":Ljava/io/ByteArrayOutputStream;
    .local v1, "baos":Ljava/io/ByteArrayOutputStream;
    :try_start_15
    sget-object v5, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v6, 0x64

    invoke-virtual {v3, v5, v6, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 79
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_1f
    .catchall {:try_start_15 .. :try_end_1f} :catchall_3e

    move-result-object v2

    .line 82
    .local v2, "byteArray":[B
    if-eqz v1, :cond_25

    .line 84
    :try_start_22
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_25
    .catch Ljava/io/IOException; {:try_start_22 .. :try_end_25} :catch_26

    .line 91
    .end local v1    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v2    # "byteArray":[B
    .end local v3    # "covertedFile":Landroid/graphics/Bitmap;
    :cond_25
    :goto_25
    return-object v2

    .line 85
    .restart local v1    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "byteArray":[B
    .restart local v3    # "covertedFile":Landroid/graphics/Bitmap;
    :catch_26
    move-exception v4

    .line 86
    .local v4, "e":Ljava/io/IOException;
    sget-object v5, Lcom/behance/sdk/project/modules/CoverImage;->logger:Lcom/behance/sdk/logger/ILogger;

    invoke-interface {v5, v4}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;)V

    goto :goto_25

    .line 82
    .end local v1    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v2    # "byteArray":[B
    .end local v4    # "e":Ljava/io/IOException;
    .restart local v0    # "baos":Ljava/io/ByteArrayOutputStream;
    :catchall_2d
    move-exception v5

    :goto_2e
    if-eqz v0, :cond_33

    .line 84
    :try_start_30
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_33
    .catch Ljava/io/IOException; {:try_start_30 .. :try_end_33} :catch_34

    .line 87
    :cond_33
    :goto_33
    throw v5

    .line 85
    :catch_34
    move-exception v4

    .line 86
    .restart local v4    # "e":Ljava/io/IOException;
    sget-object v6, Lcom/behance/sdk/project/modules/CoverImage;->logger:Lcom/behance/sdk/logger/ILogger;

    invoke-interface {v6, v4}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;)V

    goto :goto_33

    .line 91
    .end local v0    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v3    # "covertedFile":Landroid/graphics/Bitmap;
    .end local v4    # "e":Ljava/io/IOException;
    :cond_3b
    new-array v2, v8, [B

    goto :goto_25

    .line 82
    .restart local v1    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "covertedFile":Landroid/graphics/Bitmap;
    :catchall_3e
    move-exception v5

    move-object v0, v1

    .end local v1    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v0    # "baos":Ljava/io/ByteArrayOutputStream;
    goto :goto_2e
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 52
    iget-object v0, p0, Lcom/behance/sdk/project/modules/CoverImage;->originalImage:Lcom/behance/sdk/project/modules/ImageModule;

    if-eqz v0, :cond_b

    .line 53
    iget-object v0, p0, Lcom/behance/sdk/project/modules/CoverImage;->originalImage:Lcom/behance/sdk/project/modules/ImageModule;

    invoke-virtual {v0}, Lcom/behance/sdk/project/modules/ImageModule;->getName()Ljava/lang/String;

    move-result-object v0

    .line 55
    :goto_a
    return-object v0

    :cond_b
    const-string v0, ""

    goto :goto_a
.end method

.method public getOriginalImage()Lcom/behance/sdk/project/modules/ImageModule;
    .registers 2

    .prologue
    .line 68
    iget-object v0, p0, Lcom/behance/sdk/project/modules/CoverImage;->originalImage:Lcom/behance/sdk/project/modules/ImageModule;

    return-object v0
.end method

.method public remove()V
    .registers 2

    .prologue
    .line 63
    iget-object v0, p0, Lcom/behance/sdk/project/modules/CoverImage;->coverImage:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_9

    .line 64
    iget-object v0, p0, Lcom/behance/sdk/project/modules/CoverImage;->coverImage:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 65
    :cond_9
    return-void
.end method
