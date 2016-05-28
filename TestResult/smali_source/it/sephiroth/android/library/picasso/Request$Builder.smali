.class public final Lit/sephiroth/android/library/picasso/Request$Builder;
.super Ljava/lang/Object;
.source "Request.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/picasso/Request;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private cache:Lit/sephiroth/android/library/picasso/Cache;

.field private centerCrop:Z

.field private centerInside:Z

.field private config:Landroid/graphics/Bitmap$Config;

.field private diskCache:Lit/sephiroth/android/library/picasso/Cache;

.field private hasRotationPivot:Z

.field private onlyScaleDown:Z

.field private priority:Lit/sephiroth/android/library/picasso/Picasso$Priority;

.field private resizeByMaxSide:Z

.field private resourceId:I

.field private rotationDegrees:F

.field private rotationPivotX:F

.field private rotationPivotY:F

.field private stableKey:Ljava/lang/String;

.field private targetHeight:I

.field private targetWidth:I

.field private transformations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lit/sephiroth/android/library/picasso/Transformation;",
            ">;"
        }
    .end annotation
.end field

.field private uri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Landroid/net/Uri;ILandroid/graphics/Bitmap$Config;)V
    .registers 4
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "resourceId"    # I
    .param p3, "bitmapConfig"    # Landroid/graphics/Bitmap$Config;

    .prologue
    .line 229
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 230
    iput-object p1, p0, Lit/sephiroth/android/library/picasso/Request$Builder;->uri:Landroid/net/Uri;

    .line 231
    iput p2, p0, Lit/sephiroth/android/library/picasso/Request$Builder;->resourceId:I

    .line 232
    iput-object p3, p0, Lit/sephiroth/android/library/picasso/Request$Builder;->config:Landroid/graphics/Bitmap$Config;

    .line 233
    return-void
.end method


# virtual methods
.method public build()Lit/sephiroth/android/library/picasso/Request;
    .registers 22

    .prologue
    .line 496
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lit/sephiroth/android/library/picasso/Request$Builder;->centerInside:Z

    if-eqz v1, :cond_14

    move-object/from16 v0, p0

    iget-boolean v1, v0, Lit/sephiroth/android/library/picasso/Request$Builder;->resizeByMaxSide:Z

    if-eqz v1, :cond_14

    .line 497
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Center Inside and resize by max side can not be used together."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 499
    :cond_14
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lit/sephiroth/android/library/picasso/Request$Builder;->centerCrop:Z

    if-eqz v1, :cond_28

    move-object/from16 v0, p0

    iget-boolean v1, v0, Lit/sephiroth/android/library/picasso/Request$Builder;->resizeByMaxSide:Z

    if-eqz v1, :cond_28

    .line 500
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Center crop and resize by max side can not be used together."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 502
    :cond_28
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lit/sephiroth/android/library/picasso/Request$Builder;->centerInside:Z

    if-eqz v1, :cond_3c

    move-object/from16 v0, p0

    iget-boolean v1, v0, Lit/sephiroth/android/library/picasso/Request$Builder;->centerCrop:Z

    if-eqz v1, :cond_3c

    .line 503
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Center crop and center inside can not be used together."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 505
    :cond_3c
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lit/sephiroth/android/library/picasso/Request$Builder;->centerCrop:Z

    if-eqz v1, :cond_56

    move-object/from16 v0, p0

    iget v1, v0, Lit/sephiroth/android/library/picasso/Request$Builder;->targetWidth:I

    if-nez v1, :cond_56

    move-object/from16 v0, p0

    iget v1, v0, Lit/sephiroth/android/library/picasso/Request$Builder;->targetHeight:I

    if-nez v1, :cond_56

    .line 506
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Center crop requires calling resize with positive width and height."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 509
    :cond_56
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lit/sephiroth/android/library/picasso/Request$Builder;->centerInside:Z

    if-eqz v1, :cond_70

    move-object/from16 v0, p0

    iget v1, v0, Lit/sephiroth/android/library/picasso/Request$Builder;->targetWidth:I

    if-nez v1, :cond_70

    move-object/from16 v0, p0

    iget v1, v0, Lit/sephiroth/android/library/picasso/Request$Builder;->targetHeight:I

    if-nez v1, :cond_70

    .line 510
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Center inside requires calling resize with positive width and height."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 513
    :cond_70
    move-object/from16 v0, p0

    iget-object v1, v0, Lit/sephiroth/android/library/picasso/Request$Builder;->priority:Lit/sephiroth/android/library/picasso/Picasso$Priority;

    if-nez v1, :cond_7c

    .line 514
    sget-object v1, Lit/sephiroth/android/library/picasso/Picasso$Priority;->NORMAL:Lit/sephiroth/android/library/picasso/Picasso$Priority;

    move-object/from16 v0, p0

    iput-object v1, v0, Lit/sephiroth/android/library/picasso/Request$Builder;->priority:Lit/sephiroth/android/library/picasso/Picasso$Priority;

    .line 516
    :cond_7c
    new-instance v1, Lit/sephiroth/android/library/picasso/Request;

    move-object/from16 v0, p0

    iget-object v2, v0, Lit/sephiroth/android/library/picasso/Request$Builder;->uri:Landroid/net/Uri;

    move-object/from16 v0, p0

    iget v3, v0, Lit/sephiroth/android/library/picasso/Request$Builder;->resourceId:I

    move-object/from16 v0, p0

    iget-object v4, v0, Lit/sephiroth/android/library/picasso/Request$Builder;->stableKey:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v5, v0, Lit/sephiroth/android/library/picasso/Request$Builder;->transformations:Ljava/util/List;

    move-object/from16 v0, p0

    iget v6, v0, Lit/sephiroth/android/library/picasso/Request$Builder;->targetWidth:I

    move-object/from16 v0, p0

    iget v7, v0, Lit/sephiroth/android/library/picasso/Request$Builder;->targetHeight:I

    move-object/from16 v0, p0

    iget-boolean v8, v0, Lit/sephiroth/android/library/picasso/Request$Builder;->centerCrop:Z

    move-object/from16 v0, p0

    iget-boolean v9, v0, Lit/sephiroth/android/library/picasso/Request$Builder;->centerInside:Z

    move-object/from16 v0, p0

    iget-boolean v10, v0, Lit/sephiroth/android/library/picasso/Request$Builder;->onlyScaleDown:Z

    move-object/from16 v0, p0

    iget-boolean v11, v0, Lit/sephiroth/android/library/picasso/Request$Builder;->resizeByMaxSide:Z

    move-object/from16 v0, p0

    iget v12, v0, Lit/sephiroth/android/library/picasso/Request$Builder;->rotationDegrees:F

    move-object/from16 v0, p0

    iget v13, v0, Lit/sephiroth/android/library/picasso/Request$Builder;->rotationPivotX:F

    move-object/from16 v0, p0

    iget v14, v0, Lit/sephiroth/android/library/picasso/Request$Builder;->rotationPivotY:F

    move-object/from16 v0, p0

    iget-boolean v15, v0, Lit/sephiroth/android/library/picasso/Request$Builder;->hasRotationPivot:Z

    move-object/from16 v0, p0

    iget-object v0, v0, Lit/sephiroth/android/library/picasso/Request$Builder;->config:Landroid/graphics/Bitmap$Config;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lit/sephiroth/android/library/picasso/Request$Builder;->priority:Lit/sephiroth/android/library/picasso/Picasso$Priority;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lit/sephiroth/android/library/picasso/Request$Builder;->cache:Lit/sephiroth/android/library/picasso/Cache;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lit/sephiroth/android/library/picasso/Request$Builder;->diskCache:Lit/sephiroth/android/library/picasso/Cache;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-direct/range {v1 .. v20}, Lit/sephiroth/android/library/picasso/Request;-><init>(Landroid/net/Uri;ILjava/lang/String;Ljava/util/List;IIZZZZFFFZLandroid/graphics/Bitmap$Config;Lit/sephiroth/android/library/picasso/Picasso$Priority;Lit/sephiroth/android/library/picasso/Cache;Lit/sephiroth/android/library/picasso/Cache;Lit/sephiroth/android/library/picasso/Request$1;)V

    return-object v1
.end method

.method public centerCrop()Lit/sephiroth/android/library/picasso/Request$Builder;
    .registers 3

    .prologue
    .line 351
    iget-boolean v0, p0, Lit/sephiroth/android/library/picasso/Request$Builder;->centerInside:Z

    if-nez v0, :cond_8

    iget-boolean v0, p0, Lit/sephiroth/android/library/picasso/Request$Builder;->resizeByMaxSide:Z

    if-eqz v0, :cond_10

    .line 352
    :cond_8
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Center crop can not be used after calling centerInside"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 354
    :cond_10
    const/4 v0, 0x1

    iput-boolean v0, p0, Lit/sephiroth/android/library/picasso/Request$Builder;->centerCrop:Z

    .line 355
    return-object p0
.end method

.method public config(Landroid/graphics/Bitmap$Config;)Lit/sephiroth/android/library/picasso/Request$Builder;
    .registers 2
    .param p1, "config"    # Landroid/graphics/Bitmap$Config;

    .prologue
    .line 426
    iput-object p1, p0, Lit/sephiroth/android/library/picasso/Request$Builder;->config:Landroid/graphics/Bitmap$Config;

    .line 427
    return-object p0
.end method

.method public getCache()Lit/sephiroth/android/library/picasso/Cache;
    .registers 2

    .prologue
    .line 436
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Request$Builder;->cache:Lit/sephiroth/android/library/picasso/Cache;

    return-object v0
.end method

.method hasImage()Z
    .registers 2

    .prologue
    .line 258
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Request$Builder;->uri:Landroid/net/Uri;

    if-nez v0, :cond_8

    iget v0, p0, Lit/sephiroth/android/library/picasso/Request$Builder;->resourceId:I

    if-eqz v0, :cond_a

    :cond_8
    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method hasSize()Z
    .registers 2

    .prologue
    .line 262
    iget v0, p0, Lit/sephiroth/android/library/picasso/Request$Builder;->targetWidth:I

    if-nez v0, :cond_8

    iget v0, p0, Lit/sephiroth/android/library/picasso/Request$Builder;->targetHeight:I

    if-eqz v0, :cond_a

    :cond_8
    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public onlyScaleDown()Lit/sephiroth/android/library/picasso/Request$Builder;
    .registers 3

    .prologue
    .line 387
    iget v0, p0, Lit/sephiroth/android/library/picasso/Request$Builder;->targetHeight:I

    if-nez v0, :cond_10

    iget v0, p0, Lit/sephiroth/android/library/picasso/Request$Builder;->targetWidth:I

    if-nez v0, :cond_10

    .line 388
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "onlyScaleDown can not be applied without resize"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 390
    :cond_10
    const/4 v0, 0x1

    iput-boolean v0, p0, Lit/sephiroth/android/library/picasso/Request$Builder;->onlyScaleDown:Z

    .line 391
    return-object p0
.end method

.method public resize(II)Lit/sephiroth/android/library/picasso/Request$Builder;
    .registers 5
    .param p1, "targetWidth"    # I
    .param p2, "targetHeight"    # I

    .prologue
    .line 311
    if-gez p1, :cond_a

    .line 312
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Width must be positive number or 0."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 314
    :cond_a
    if-gez p2, :cond_14

    .line 315
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Height must be positive number or 0."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 317
    :cond_14
    if-nez p2, :cond_20

    if-nez p1, :cond_20

    .line 318
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "At least one dimension has to be positive number."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 320
    :cond_20
    iput p1, p0, Lit/sephiroth/android/library/picasso/Request$Builder;->targetWidth:I

    .line 321
    iput p2, p0, Lit/sephiroth/android/library/picasso/Request$Builder;->targetHeight:I

    .line 322
    return-object p0
.end method

.method public setCache(Lit/sephiroth/android/library/picasso/Cache;)Lit/sephiroth/android/library/picasso/Request$Builder;
    .registers 2
    .param p1, "cache"    # Lit/sephiroth/android/library/picasso/Cache;

    .prologue
    .line 431
    iput-object p1, p0, Lit/sephiroth/android/library/picasso/Request$Builder;->cache:Lit/sephiroth/android/library/picasso/Cache;

    .line 432
    return-object p0
.end method

.method public transform(Lit/sephiroth/android/library/picasso/Transformation;)Lit/sephiroth/android/library/picasso/Request$Builder;
    .registers 4
    .param p1, "transformation"    # Lit/sephiroth/android/library/picasso/Transformation;

    .prologue
    .line 466
    if-nez p1, :cond_a

    .line 467
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Transformation must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 469
    :cond_a
    invoke-interface {p1}, Lit/sephiroth/android/library/picasso/Transformation;->key()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_18

    .line 470
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Transformation key must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 472
    :cond_18
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Request$Builder;->transformations:Ljava/util/List;

    if-nez v0, :cond_24

    .line 473
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lit/sephiroth/android/library/picasso/Request$Builder;->transformations:Ljava/util/List;

    .line 475
    :cond_24
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Request$Builder;->transformations:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 476
    return-object p0
.end method
