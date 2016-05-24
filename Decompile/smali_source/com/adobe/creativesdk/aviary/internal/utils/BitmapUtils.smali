.class public final Lcom/adobe/creativesdk/aviary/internal/utils/BitmapUtils;
.super Ljava/lang/Object;
.source "BitmapUtils.java"


# static fields
.field static mWhiteMultiplyFilter:Landroid/graphics/PorterDuffColorFilter;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 719
    new-instance v0, Landroid/graphics/PorterDuffColorFilter;

    const/4 v1, -0x1

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v0, v1, v2}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/BitmapUtils;->mWhiteMultiplyFilter:Landroid/graphics/PorterDuffColorFilter;

    return-void
.end method

.method public static circleMask(Landroid/graphics/Bitmap;F)Landroid/graphics/Bitmap;
    .registers 9
    .param p0, "src"    # Landroid/graphics/Bitmap;
    .param p1, "radius"    # F

    .prologue
    .line 753
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    sget-object v6, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v4, v5, v6}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 754
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 755
    .local v1, "canvas":Landroid/graphics/Canvas;
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/utils/BitmapUtils;->createShader(Landroid/graphics/Bitmap;)Landroid/graphics/Shader;

    move-result-object v3

    .line 756
    .local v3, "shader":Landroid/graphics/Shader;
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    .line 757
    .local v2, "paint":Landroid/graphics/Paint;
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 758
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 759
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    int-to-float v5, v5

    invoke-virtual {v1, v4, v5, p1, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 760
    return-object v0
.end method

.method public static compareBySize(Landroid/graphics/drawable/Drawable;Landroid/graphics/Bitmap;)Z
    .registers 5
    .param p0, "bmp1"    # Landroid/graphics/drawable/Drawable;
    .param p1, "bmp2"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v0, 0x1

    .line 699
    if-eqz p0, :cond_5

    if-nez p1, :cond_6

    .line 702
    :cond_5
    :goto_5
    return v0

    :cond_6
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    if-ne v1, v2, :cond_5

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    if-ne v1, v2, :cond_5

    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static compareBySize(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)Z
    .registers 5
    .param p0, "bmp1"    # Landroid/graphics/drawable/Drawable;
    .param p1, "bmp2"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const/4 v0, 0x1

    .line 713
    if-eqz p0, :cond_5

    if-nez p1, :cond_6

    .line 716
    :cond_5
    :goto_5
    return v0

    :cond_6
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    if-ne v1, v2, :cond_5

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    if-ne v1, v2, :cond_5

    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static copy(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    .registers 6
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "config"    # Landroid/graphics/Bitmap$Config;

    .prologue
    .line 56
    .line 57
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    if-nez p1, :cond_c

    sget-object p1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .end local p1    # "config":Landroid/graphics/Bitmap$Config;
    :cond_c
    invoke-static {v2, v3, p1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 58
    .local v1, "result":Landroid/graphics/Bitmap;
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 59
    .local v0, "c":Landroid/graphics/Canvas;
    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    const/4 v3, 0x0

    invoke-virtual {v0, p0, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    .line 60
    return-object v1
.end method

.method public static copy(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .registers 9
    .param p0, "src"    # Landroid/graphics/Bitmap;
    .param p1, "dst"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x0

    .line 80
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    if-ne v3, v4, :cond_24

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    if-ne v3, v4, :cond_24

    .line 81
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 82
    .local v0, "c":Landroid/graphics/Canvas;
    new-instance v3, Landroid/graphics/Matrix;

    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    invoke-virtual {v0, p0, v3, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    .line 89
    :goto_23
    return-void

    .line 84
    .end local v0    # "c":Landroid/graphics/Canvas;
    :cond_24
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 85
    .restart local v0    # "c":Landroid/graphics/Canvas;
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    .line 86
    .local v2, "paint":Landroid/graphics/Paint;
    new-instance v1, Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    invoke-direct {v1, v5, v5, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 87
    .local v1, "dstRect":Landroid/graphics/Rect;
    invoke-virtual {v0, p0, v6, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    goto :goto_23
.end method

.method public static createShader(Landroid/graphics/Bitmap;)Landroid/graphics/Shader;
    .registers 4
    .param p0, "b"    # Landroid/graphics/Bitmap;

    .prologue
    .line 791
    new-instance v0, Landroid/graphics/BitmapShader;

    sget-object v1, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    sget-object v2, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v0, p0, v1, v2}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    return-object v0
.end method

.method public static extractDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;
    .registers 6
    .param p0, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 812
    instance-of v2, p0, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v2, :cond_b

    .line 813
    check-cast p0, Landroid/graphics/drawable/BitmapDrawable;

    .end local p0    # "drawable":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 818
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    .local v1, "canvas":Landroid/graphics/Canvas;
    .restart local p0    # "drawable":Landroid/graphics/drawable/Drawable;
    :goto_a
    return-object v0

    .line 815
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v1    # "canvas":Landroid/graphics/Canvas;
    :cond_b
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v3

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 816
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 817
    .restart local v1    # "canvas":Landroid/graphics/Canvas;
    invoke-virtual {p0, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto :goto_a
.end method

.method public static resizeBitmap(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    .registers 4
    .param p0, "input"    # Landroid/graphics/Bitmap;
    .param p1, "destWidth"    # I
    .param p2, "destHeight"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/OutOfMemoryError;
        }
    .end annotation

    .prologue
    .line 380
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/adobe/creativesdk/aviary/internal/utils/BitmapUtils;->resizeBitmap(Landroid/graphics/Bitmap;III)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public static resizeBitmap(Landroid/graphics/Bitmap;III)Landroid/graphics/Bitmap;
    .registers 26
    .param p0, "input"    # Landroid/graphics/Bitmap;
    .param p1, "destWidth"    # I
    .param p2, "destHeight"    # I
    .param p3, "rotation"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/OutOfMemoryError;
        }
    .end annotation

    .prologue
    .line 394
    if-lez p2, :cond_4

    if-gtz p1, :cond_a

    :cond_4
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-direct {v2}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v2

    .line 396
    :cond_a
    move/from16 v10, p1

    .line 397
    .local v10, "dstWidth":I
    move/from16 v9, p2

    .line 398
    .local v9, "dstHeight":I
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    .line 399
    .local v5, "srcWidth":I
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    .line 401
    .local v6, "srcHeight":I
    const/16 v2, 0x5a

    move/from16 v0, p3

    if-eq v0, v2, :cond_22

    const/16 v2, 0x10e

    move/from16 v0, p3

    if-ne v0, v2, :cond_26

    .line 402
    :cond_22
    move/from16 v10, p2

    .line 403
    move/from16 v9, p1

    .line 406
    :cond_26
    const/4 v11, 0x0

    .line 408
    .local v11, "needsResize":Z
    if-gt v5, v10, :cond_2b

    if-le v6, v9, :cond_5f

    .line 409
    :cond_2b
    const/4 v11, 0x1

    .line 411
    int-to-double v2, v5

    int-to-double v0, v10

    move-wide/from16 v20, v0

    div-double v16, v2, v20

    .line 412
    .local v16, "ratio1":D
    int-to-double v2, v6

    int-to-double v0, v9

    move-wide/from16 v20, v0

    div-double v18, v2, v20

    .line 414
    .local v18, "ratio2":D
    cmpl-double v2, v16, v18

    if-lez v2, :cond_55

    .line 415
    int-to-double v2, v10

    int-to-double v0, v5

    move-wide/from16 v20, v0

    div-double v14, v2, v20

    .line 416
    .local v14, "p":D
    int-to-double v2, v6

    mul-double/2addr v2, v14

    double-to-int v9, v2

    .line 427
    .end local v14    # "p":D
    .end local v16    # "ratio1":D
    .end local v18    # "ratio2":D
    :goto_45
    if-nez v11, :cond_49

    if-eqz p3, :cond_54

    .line 430
    :cond_49
    if-nez p3, :cond_62

    .line 431
    const/4 v2, 0x1

    move-object/from16 v0, p0

    invoke-static {v0, v10, v9, v2}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v12

    .local v12, "output":Landroid/graphics/Bitmap;
    :goto_52
    move-object/from16 p0, v12

    .line 440
    .end local v12    # "output":Landroid/graphics/Bitmap;
    .end local p0    # "input":Landroid/graphics/Bitmap;
    :cond_54
    return-object p0

    .line 418
    .restart local v16    # "ratio1":D
    .restart local v18    # "ratio2":D
    .restart local p0    # "input":Landroid/graphics/Bitmap;
    :cond_55
    int-to-double v2, v9

    int-to-double v0, v6

    move-wide/from16 v20, v0

    div-double v14, v2, v20

    .line 419
    .restart local v14    # "p":D
    int-to-double v2, v5

    mul-double/2addr v2, v14

    double-to-int v10, v2

    goto :goto_45

    .line 423
    .end local v14    # "p":D
    .end local v16    # "ratio1":D
    .end local v18    # "ratio2":D
    :cond_5f
    move v10, v5

    .line 424
    move v9, v6

    goto :goto_45

    .line 433
    :cond_62
    new-instance v7, Landroid/graphics/Matrix;

    invoke-direct {v7}, Landroid/graphics/Matrix;-><init>()V

    .line 434
    .local v7, "matrix":Landroid/graphics/Matrix;
    int-to-float v2, v10

    int-to-float v3, v5

    div-float/2addr v2, v3

    int-to-float v3, v9

    int-to-float v4, v6

    div-float/2addr v3, v4

    invoke-virtual {v7, v2, v3}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 435
    move/from16 v0, p3

    int-to-float v2, v0

    invoke-virtual {v7, v2}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 436
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v8, 0x1

    move-object/from16 v2, p0

    invoke-static/range {v2 .. v8}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v12

    .restart local v12    # "output":Landroid/graphics/Bitmap;
    goto :goto_52
.end method
