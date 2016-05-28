.class public Lit/sephiroth/android/library/picasso/RequestCreator;
.super Ljava/lang/Object;
.source "RequestCreator.java"


# static fields
.field private static final nextId:Ljava/util/concurrent/atomic/AtomicInteger;


# instance fields
.field private final data:Lit/sephiroth/android/library/picasso/Request$Builder;

.field private deferred:Z

.field private delayMillis:J

.field private errorDrawable:Landroid/graphics/drawable/Drawable;

.field private errorResId:I

.field private fadeTime:J

.field private memoryPolicy:I

.field private networkPolicy:I

.field private final picasso:Lit/sephiroth/android/library/picasso/Picasso;

.field private placeholderDrawable:Landroid/graphics/drawable/Drawable;

.field private placeholderResId:I

.field private setPlaceholder:Z

.field private tag:Ljava/lang/Object;

.field private targetIsHidden:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 49
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    sput-object v0, Lit/sephiroth/android/library/picasso/RequestCreator;->nextId:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method

.method constructor <init>()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    const-wide/16 v0, 0xc8

    iput-wide v0, p0, Lit/sephiroth/android/library/picasso/RequestCreator;->fadeTime:J

    .line 56
    const/4 v0, 0x1

    iput-boolean v0, p0, Lit/sephiroth/android/library/picasso/RequestCreator;->setPlaceholder:Z

    .line 85
    iput-object v2, p0, Lit/sephiroth/android/library/picasso/RequestCreator;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    .line 86
    new-instance v0, Lit/sephiroth/android/library/picasso/Request$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, v2, v1, v2}, Lit/sephiroth/android/library/picasso/Request$Builder;-><init>(Landroid/net/Uri;ILandroid/graphics/Bitmap$Config;)V

    iput-object v0, p0, Lit/sephiroth/android/library/picasso/RequestCreator;->data:Lit/sephiroth/android/library/picasso/Request$Builder;

    .line 87
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/RequestCreator;->data:Lit/sephiroth/android/library/picasso/Request$Builder;

    invoke-virtual {v0, v2}, Lit/sephiroth/android/library/picasso/Request$Builder;->setCache(Lit/sephiroth/android/library/picasso/Cache;)Lit/sephiroth/android/library/picasso/Request$Builder;

    .line 88
    return-void
.end method

.method constructor <init>(Lit/sephiroth/android/library/picasso/Picasso;Landroid/net/Uri;I)V
    .registers 8
    .param p1, "picasso"    # Lit/sephiroth/android/library/picasso/Picasso;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "resourceId"    # I

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    const-wide/16 v2, 0xc8

    iput-wide v2, p0, Lit/sephiroth/android/library/picasso/RequestCreator;->fadeTime:J

    .line 56
    const/4 v1, 0x1

    iput-boolean v1, p0, Lit/sephiroth/android/library/picasso/RequestCreator;->setPlaceholder:Z

    .line 68
    iget-boolean v1, p1, Lit/sephiroth/android/library/picasso/Picasso;->shutdown:Z

    if-eqz v1, :cond_16

    .line 69
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Picasso instance already shut down. Cannot submit new requests."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 73
    :cond_16
    if-eqz p2, :cond_2b

    .line 74
    invoke-virtual {p2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    .line 75
    .local v0, "scheme":Ljava/lang/String;
    if-nez v0, :cond_2b

    .line 76
    new-instance v1, Ljava/io/File;

    invoke-virtual {p2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p2

    .line 79
    .end local v0    # "scheme":Ljava/lang/String;
    :cond_2b
    iput-object p1, p0, Lit/sephiroth/android/library/picasso/RequestCreator;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    .line 80
    new-instance v1, Lit/sephiroth/android/library/picasso/Request$Builder;

    iget-object v2, p1, Lit/sephiroth/android/library/picasso/Picasso;->defaultBitmapConfig:Landroid/graphics/Bitmap$Config;

    invoke-direct {v1, p2, p3, v2}, Lit/sephiroth/android/library/picasso/Request$Builder;-><init>(Landroid/net/Uri;ILandroid/graphics/Bitmap$Config;)V

    iput-object v1, p0, Lit/sephiroth/android/library/picasso/RequestCreator;->data:Lit/sephiroth/android/library/picasso/Request$Builder;

    .line 81
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/RequestCreator;->data:Lit/sephiroth/android/library/picasso/Request$Builder;

    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/Picasso;->getCache()Lit/sephiroth/android/library/picasso/Cache;

    move-result-object v2

    invoke-virtual {v1, v2}, Lit/sephiroth/android/library/picasso/Request$Builder;->setCache(Lit/sephiroth/android/library/picasso/Cache;)Lit/sephiroth/android/library/picasso/Request$Builder;

    .line 82
    return-void
.end method

.method private createRequest(J)Lit/sephiroth/android/library/picasso/Request;
    .registers 12
    .param p1, "started"    # J

    .prologue
    .line 772
    sget-object v4, Lit/sephiroth/android/library/picasso/RequestCreator;->nextId:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v0

    .line 774
    .local v0, "id":I
    iget-object v4, p0, Lit/sephiroth/android/library/picasso/RequestCreator;->data:Lit/sephiroth/android/library/picasso/Request$Builder;

    invoke-virtual {v4}, Lit/sephiroth/android/library/picasso/Request$Builder;->build()Lit/sephiroth/android/library/picasso/Request;

    move-result-object v2

    .line 775
    .local v2, "request":Lit/sephiroth/android/library/picasso/Request;
    iput v0, v2, Lit/sephiroth/android/library/picasso/Request;->id:I

    .line 776
    iput-wide p1, v2, Lit/sephiroth/android/library/picasso/Request;->started:J

    .line 778
    iget-object v4, p0, Lit/sephiroth/android/library/picasso/RequestCreator;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    iget-boolean v1, v4, Lit/sephiroth/android/library/picasso/Picasso;->loggingEnabled:Z

    .line 779
    .local v1, "loggingEnabled":Z
    if-eqz v1, :cond_25

    .line 780
    const-string v4, "Main"

    const-string v5, "created"

    invoke-virtual {v2}, Lit/sephiroth/android/library/picasso/Request;->plainId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2}, Lit/sephiroth/android/library/picasso/Request;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v4, v5, v6, v7}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 783
    :cond_25
    iget-object v4, p0, Lit/sephiroth/android/library/picasso/RequestCreator;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    invoke-virtual {v4, v2}, Lit/sephiroth/android/library/picasso/Picasso;->transformRequest(Lit/sephiroth/android/library/picasso/Request;)Lit/sephiroth/android/library/picasso/Request;

    move-result-object v3

    .line 784
    .local v3, "transformed":Lit/sephiroth/android/library/picasso/Request;
    if-eq v3, v2, :cond_51

    .line 786
    iput v0, v3, Lit/sephiroth/android/library/picasso/Request;->id:I

    .line 787
    iput-wide p1, v3, Lit/sephiroth/android/library/picasso/Request;->started:J

    .line 789
    if-eqz v1, :cond_51

    .line 790
    const-string v4, "Main"

    const-string v5, "changed"

    invoke-virtual {v3}, Lit/sephiroth/android/library/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "into "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v4, v5, v6, v7}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 794
    :cond_51
    return-object v3
.end method

.method private getPlaceholderDrawable()Landroid/graphics/drawable/Drawable;
    .registers 3

    .prologue
    .line 763
    iget v0, p0, Lit/sephiroth/android/library/picasso/RequestCreator;->placeholderResId:I

    if-eqz v0, :cond_13

    .line 764
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/RequestCreator;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    iget-object v0, v0, Lit/sephiroth/android/library/picasso/Picasso;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget v1, p0, Lit/sephiroth/android/library/picasso/RequestCreator;->placeholderResId:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 766
    :goto_12
    return-object v0

    :cond_13
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/RequestCreator;->placeholderDrawable:Landroid/graphics/drawable/Drawable;

    goto :goto_12
.end method


# virtual methods
.method public centerCrop()Lit/sephiroth/android/library/picasso/RequestCreator;
    .registers 2

    .prologue
    .line 266
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/RequestCreator;->data:Lit/sephiroth/android/library/picasso/Request$Builder;

    invoke-virtual {v0}, Lit/sephiroth/android/library/picasso/Request$Builder;->centerCrop()Lit/sephiroth/android/library/picasso/Request$Builder;

    .line 267
    return-object p0
.end method

.method public config(Landroid/graphics/Bitmap$Config;)Lit/sephiroth/android/library/picasso/RequestCreator;
    .registers 3
    .param p1, "config"    # Landroid/graphics/Bitmap$Config;

    .prologue
    .line 307
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/RequestCreator;->data:Lit/sephiroth/android/library/picasso/Request$Builder;

    invoke-virtual {v0, p1}, Lit/sephiroth/android/library/picasso/Request$Builder;->config(Landroid/graphics/Bitmap$Config;)Lit/sephiroth/android/library/picasso/Request$Builder;

    .line 308
    return-object p0
.end method

.method public fade(J)Lit/sephiroth/android/library/picasso/RequestCreator;
    .registers 4
    .param p1, "ms"    # J

    .prologue
    .line 440
    iput-wide p1, p0, Lit/sephiroth/android/library/picasso/RequestCreator;->fadeTime:J

    .line 441
    return-object p0
.end method

.method public fit()Lit/sephiroth/android/library/picasso/RequestCreator;
    .registers 2

    .prologue
    .line 206
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lit/sephiroth/android/library/picasso/RequestCreator;->fit(Z)Lit/sephiroth/android/library/picasso/RequestCreator;

    move-result-object v0

    return-object v0
.end method

.method public fit(Z)Lit/sephiroth/android/library/picasso/RequestCreator;
    .registers 3
    .param p1, "targetIsHidden"    # Z

    .prologue
    .line 221
    const/4 v0, 0x1

    iput-boolean v0, p0, Lit/sephiroth/android/library/picasso/RequestCreator;->deferred:Z

    .line 222
    iput-boolean p1, p0, Lit/sephiroth/android/library/picasso/RequestCreator;->targetIsHidden:Z

    .line 223
    return-object p0
.end method

.method public into(Landroid/widget/ImageView;)V
    .registers 3
    .param p1, "target"    # Landroid/widget/ImageView;

    .prologue
    .line 680
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lit/sephiroth/android/library/picasso/RequestCreator;->into(Landroid/widget/ImageView;Lit/sephiroth/android/library/picasso/Callback;)V

    .line 681
    return-void
.end method

.method public into(Landroid/widget/ImageView;Lit/sephiroth/android/library/picasso/Callback;)V
    .registers 28
    .param p1, "target"    # Landroid/widget/ImageView;
    .param p2, "callback"    # Lit/sephiroth/android/library/picasso/Callback;

    .prologue
    .line 693
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v22

    .line 694
    .local v22, "started":J
    invoke-static {}, Lit/sephiroth/android/library/picasso/Utils;->checkMain()V

    .line 696
    if-nez p1, :cond_11

    .line 697
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Target must not be null."

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 700
    :cond_11
    move-object/from16 v0, p0

    iget-object v4, v0, Lit/sephiroth/android/library/picasso/RequestCreator;->data:Lit/sephiroth/android/library/picasso/Request$Builder;

    invoke-virtual {v4}, Lit/sephiroth/android/library/picasso/Request$Builder;->hasImage()Z

    move-result v4

    if-nez v4, :cond_34

    .line 701
    move-object/from16 v0, p0

    iget-object v4, v0, Lit/sephiroth/android/library/picasso/RequestCreator;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Lit/sephiroth/android/library/picasso/Picasso;->cancelRequest(Landroid/widget/ImageView;)V

    .line 702
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lit/sephiroth/android/library/picasso/RequestCreator;->setPlaceholder:Z

    if-eqz v4, :cond_33

    .line 703
    invoke-direct/range {p0 .. p0}, Lit/sephiroth/android/library/picasso/RequestCreator;->getPlaceholderDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lit/sephiroth/android/library/picasso/PicassoDrawable;->setPlaceholder(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V

    .line 760
    :cond_33
    :goto_33
    return-void

    .line 708
    :cond_34
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lit/sephiroth/android/library/picasso/RequestCreator;->deferred:Z

    if-eqz v4, :cond_a2

    .line 709
    move-object/from16 v0, p0

    iget-object v4, v0, Lit/sephiroth/android/library/picasso/RequestCreator;->data:Lit/sephiroth/android/library/picasso/Request$Builder;

    invoke-virtual {v4}, Lit/sephiroth/android/library/picasso/Request$Builder;->hasSize()Z

    move-result v4

    if-eqz v4, :cond_4c

    .line 710
    new-instance v4, Ljava/lang/IllegalStateException;

    const-string v5, "Fit cannot be used with resize."

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 713
    :cond_4c
    invoke-virtual/range {p1 .. p1}, Landroid/widget/ImageView;->getVisibility()I

    move-result v4

    const/16 v5, 0x8

    if-eq v4, v5, :cond_5a

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lit/sephiroth/android/library/picasso/RequestCreator;->targetIsHidden:Z

    if-eqz v4, :cond_8e

    .line 716
    :cond_5a
    invoke-virtual/range {p1 .. p1}, Landroid/widget/ImageView;->getMeasuredWidth()I

    move-result v24

    .line 717
    .local v24, "width":I
    invoke-virtual/range {p1 .. p1}, Landroid/widget/ImageView;->getMeasuredHeight()I

    move-result v20

    .line 723
    .local v20, "height":I
    :goto_62
    if-lez v24, :cond_66

    if-gtz v20, :cond_97

    .line 724
    :cond_66
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lit/sephiroth/android/library/picasso/RequestCreator;->setPlaceholder:Z

    if-eqz v4, :cond_75

    .line 725
    move-object/from16 v0, p0

    iget-object v4, v0, Lit/sephiroth/android/library/picasso/RequestCreator;->placeholderDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lit/sephiroth/android/library/picasso/PicassoDrawable;->setPlaceholder(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V

    .line 727
    :cond_75
    move-object/from16 v0, p0

    iget-object v4, v0, Lit/sephiroth/android/library/picasso/RequestCreator;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    new-instance v5, Lit/sephiroth/android/library/picasso/DeferredRequestCreator;

    move-object/from16 v0, p0

    iget-boolean v8, v0, Lit/sephiroth/android/library/picasso/RequestCreator;->targetIsHidden:Z

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v5, v0, v1, v2, v8}, Lit/sephiroth/android/library/picasso/DeferredRequestCreator;-><init>(Lit/sephiroth/android/library/picasso/RequestCreator;Landroid/widget/ImageView;Lit/sephiroth/android/library/picasso/Callback;Z)V

    move-object/from16 v0, p1

    invoke-virtual {v4, v0, v5}, Lit/sephiroth/android/library/picasso/Picasso;->defer(Landroid/widget/ImageView;Lit/sephiroth/android/library/picasso/DeferredRequestCreator;)V

    goto :goto_33

    .line 719
    .end local v20    # "height":I
    .end local v24    # "width":I
    :cond_8e
    invoke-virtual/range {p1 .. p1}, Landroid/widget/ImageView;->getWidth()I

    move-result v24

    .line 720
    .restart local v24    # "width":I
    invoke-virtual/range {p1 .. p1}, Landroid/widget/ImageView;->getHeight()I

    move-result v20

    .restart local v20    # "height":I
    goto :goto_62

    .line 730
    :cond_97
    move-object/from16 v0, p0

    iget-object v4, v0, Lit/sephiroth/android/library/picasso/RequestCreator;->data:Lit/sephiroth/android/library/picasso/Request$Builder;

    move/from16 v0, v24

    move/from16 v1, v20

    invoke-virtual {v4, v0, v1}, Lit/sephiroth/android/library/picasso/Request$Builder;->resize(II)Lit/sephiroth/android/library/picasso/Request$Builder;

    .line 733
    .end local v20    # "height":I
    .end local v24    # "width":I
    :cond_a2
    move-object/from16 v0, p0

    move-wide/from16 v1, v22

    invoke-direct {v0, v1, v2}, Lit/sephiroth/android/library/picasso/RequestCreator;->createRequest(J)Lit/sephiroth/android/library/picasso/Request;

    move-result-object v21

    .line 734
    .local v21, "request":Lit/sephiroth/android/library/picasso/Request;
    invoke-static/range {v21 .. v21}, Lit/sephiroth/android/library/picasso/Utils;->createKey(Lit/sephiroth/android/library/picasso/Request;)Ljava/lang/String;

    move-result-object v15

    .line 736
    .local v15, "requestKey":Ljava/lang/String;
    move-object/from16 v0, p0

    iget v4, v0, Lit/sephiroth/android/library/picasso/RequestCreator;->memoryPolicy:I

    invoke-static {v4}, Lit/sephiroth/android/library/picasso/MemoryPolicy;->shouldReadFromMemoryCache(I)Z

    move-result v4

    if-eqz v4, :cond_119

    .line 737
    move-object/from16 v0, p0

    iget-object v4, v0, Lit/sephiroth/android/library/picasso/RequestCreator;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    move-object/from16 v0, p0

    iget-object v5, v0, Lit/sephiroth/android/library/picasso/RequestCreator;->data:Lit/sephiroth/android/library/picasso/Request$Builder;

    invoke-virtual {v5}, Lit/sephiroth/android/library/picasso/Request$Builder;->getCache()Lit/sephiroth/android/library/picasso/Cache;

    move-result-object v5

    invoke-virtual {v4, v5, v15}, Lit/sephiroth/android/library/picasso/Picasso;->quickMemoryCacheCheck(Lit/sephiroth/android/library/picasso/Cache;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v6

    .line 738
    .local v6, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v6, :cond_119

    .line 739
    move-object/from16 v0, p0

    iget-object v4, v0, Lit/sephiroth/android/library/picasso/RequestCreator;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Lit/sephiroth/android/library/picasso/Picasso;->cancelRequest(Landroid/widget/ImageView;)V

    .line 740
    move-object/from16 v0, p0

    iget-object v4, v0, Lit/sephiroth/android/library/picasso/RequestCreator;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    iget-object v5, v4, Lit/sephiroth/android/library/picasso/Picasso;->context:Landroid/content/Context;

    sget-object v7, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;->MEMORY:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    move-object/from16 v0, p0

    iget-wide v8, v0, Lit/sephiroth/android/library/picasso/RequestCreator;->fadeTime:J

    move-object/from16 v0, p0

    iget-object v4, v0, Lit/sephiroth/android/library/picasso/RequestCreator;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    iget-boolean v10, v4, Lit/sephiroth/android/library/picasso/Picasso;->indicatorsEnabled:Z

    move-object/from16 v4, p1

    invoke-static/range {v4 .. v10}, Lit/sephiroth/android/library/picasso/PicassoDrawable;->setBitmap(Landroid/widget/ImageView;Landroid/content/Context;Landroid/graphics/Bitmap;Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;JZ)V

    .line 741
    move-object/from16 v0, p0

    iget-object v4, v0, Lit/sephiroth/android/library/picasso/RequestCreator;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    iget-boolean v4, v4, Lit/sephiroth/android/library/picasso/Picasso;->loggingEnabled:Z

    if-eqz v4, :cond_112

    .line 742
    const-string v4, "Main"

    const-string v5, "completed"

    invoke-virtual/range {v21 .. v21}, Lit/sephiroth/android/library/picasso/Request;->plainId()Ljava/lang/String;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "from "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v10, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;->MEMORY:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v4, v5, v8, v9}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 744
    :cond_112
    if-eqz p2, :cond_33

    .line 745
    invoke-interface/range {p2 .. p2}, Lit/sephiroth/android/library/picasso/Callback;->onSuccess()V

    goto/16 :goto_33

    .line 751
    .end local v6    # "bitmap":Landroid/graphics/Bitmap;
    :cond_119
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lit/sephiroth/android/library/picasso/RequestCreator;->setPlaceholder:Z

    if-eqz v4, :cond_128

    .line 752
    invoke-direct/range {p0 .. p0}, Lit/sephiroth/android/library/picasso/RequestCreator;->getPlaceholderDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lit/sephiroth/android/library/picasso/PicassoDrawable;->setPlaceholder(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V

    .line 755
    :cond_128
    new-instance v7, Lit/sephiroth/android/library/picasso/ImageViewAction;

    move-object/from16 v0, p0

    iget-object v8, v0, Lit/sephiroth/android/library/picasso/RequestCreator;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    move-object/from16 v0, p0

    iget v11, v0, Lit/sephiroth/android/library/picasso/RequestCreator;->memoryPolicy:I

    move-object/from16 v0, p0

    iget v12, v0, Lit/sephiroth/android/library/picasso/RequestCreator;->networkPolicy:I

    move-object/from16 v0, p0

    iget v13, v0, Lit/sephiroth/android/library/picasso/RequestCreator;->errorResId:I

    move-object/from16 v0, p0

    iget-object v14, v0, Lit/sephiroth/android/library/picasso/RequestCreator;->errorDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v0, p0

    iget-object v0, v0, Lit/sephiroth/android/library/picasso/RequestCreator;->tag:Ljava/lang/Object;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lit/sephiroth/android/library/picasso/RequestCreator;->fadeTime:J

    move-wide/from16 v18, v0

    move-object/from16 v9, p1

    move-object/from16 v10, v21

    move-object/from16 v17, p2

    invoke-direct/range {v7 .. v19}, Lit/sephiroth/android/library/picasso/ImageViewAction;-><init>(Lit/sephiroth/android/library/picasso/Picasso;Landroid/widget/ImageView;Lit/sephiroth/android/library/picasso/Request;IIILandroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/Object;Lit/sephiroth/android/library/picasso/Callback;J)V

    .line 759
    .local v7, "action":Lit/sephiroth/android/library/picasso/Action;
    move-object/from16 v0, p0

    iget-object v4, v0, Lit/sephiroth/android/library/picasso/RequestCreator;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    move-object/from16 v0, p0

    iget-wide v8, v0, Lit/sephiroth/android/library/picasso/RequestCreator;->delayMillis:J

    invoke-virtual {v4, v7, v8, v9}, Lit/sephiroth/android/library/picasso/Picasso;->enqueueAndSubmit(Lit/sephiroth/android/library/picasso/Action;J)V

    goto/16 :goto_33
.end method

.method public varargs memoryPolicy(Lit/sephiroth/android/library/picasso/MemoryPolicy;[Lit/sephiroth/android/library/picasso/MemoryPolicy;)Lit/sephiroth/android/library/picasso/RequestCreator;
    .registers 8
    .param p1, "policy"    # Lit/sephiroth/android/library/picasso/MemoryPolicy;
    .param p2, "additional"    # [Lit/sephiroth/android/library/picasso/MemoryPolicy;

    .prologue
    .line 386
    if-nez p1, :cond_a

    .line 387
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Memory policy cannot be null."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 389
    :cond_a
    iget v1, p0, Lit/sephiroth/android/library/picasso/RequestCreator;->memoryPolicy:I

    iget v2, p1, Lit/sephiroth/android/library/picasso/MemoryPolicy;->index:I

    or-int/2addr v1, v2

    iput v1, p0, Lit/sephiroth/android/library/picasso/RequestCreator;->memoryPolicy:I

    .line 390
    if-nez p2, :cond_1b

    .line 391
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Memory policy cannot be null."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 393
    :cond_1b
    array-length v1, p2

    if-lez v1, :cond_38

    .line 394
    array-length v2, p2

    const/4 v1, 0x0

    :goto_20
    if-ge v1, v2, :cond_38

    aget-object v0, p2, v1

    .line 395
    .local v0, "memoryPolicy":Lit/sephiroth/android/library/picasso/MemoryPolicy;
    if-nez v0, :cond_2e

    .line 396
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Memory policy cannot be null."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 398
    :cond_2e
    iget v3, p0, Lit/sephiroth/android/library/picasso/RequestCreator;->memoryPolicy:I

    iget v4, v0, Lit/sephiroth/android/library/picasso/MemoryPolicy;->index:I

    or-int/2addr v3, v4

    iput v3, p0, Lit/sephiroth/android/library/picasso/RequestCreator;->memoryPolicy:I

    .line 394
    add-int/lit8 v1, v1, 0x1

    goto :goto_20

    .line 401
    .end local v0    # "memoryPolicy":Lit/sephiroth/android/library/picasso/MemoryPolicy;
    :cond_38
    return-object p0
.end method

.method public noFade()Lit/sephiroth/android/library/picasso/RequestCreator;
    .registers 3

    .prologue
    .line 429
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lit/sephiroth/android/library/picasso/RequestCreator;->fadeTime:J

    .line 430
    return-object p0
.end method

.method public onlyScaleDown()Lit/sephiroth/android/library/picasso/RequestCreator;
    .registers 2

    .prologue
    .line 284
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/RequestCreator;->data:Lit/sephiroth/android/library/picasso/Request$Builder;

    invoke-virtual {v0}, Lit/sephiroth/android/library/picasso/Request$Builder;->onlyScaleDown()Lit/sephiroth/android/library/picasso/Request$Builder;

    .line 285
    return-object p0
.end method

.method public resize(II)Lit/sephiroth/android/library/picasso/RequestCreator;
    .registers 4
    .param p1, "targetWidth"    # I
    .param p2, "targetHeight"    # I

    .prologue
    .line 242
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/RequestCreator;->data:Lit/sephiroth/android/library/picasso/Request$Builder;

    invoke-virtual {v0, p1, p2}, Lit/sephiroth/android/library/picasso/Request$Builder;->resize(II)Lit/sephiroth/android/library/picasso/Request$Builder;

    .line 243
    return-object p0
.end method

.method public skipMemoryCache()Lit/sephiroth/android/library/picasso/RequestCreator;
    .registers 5
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 378
    sget-object v0, Lit/sephiroth/android/library/picasso/MemoryPolicy;->NO_CACHE:Lit/sephiroth/android/library/picasso/MemoryPolicy;

    const/4 v1, 0x1

    new-array v1, v1, [Lit/sephiroth/android/library/picasso/MemoryPolicy;

    const/4 v2, 0x0

    sget-object v3, Lit/sephiroth/android/library/picasso/MemoryPolicy;->NO_STORE:Lit/sephiroth/android/library/picasso/MemoryPolicy;

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lit/sephiroth/android/library/picasso/RequestCreator;->memoryPolicy(Lit/sephiroth/android/library/picasso/MemoryPolicy;[Lit/sephiroth/android/library/picasso/MemoryPolicy;)Lit/sephiroth/android/library/picasso/RequestCreator;

    move-result-object v0

    return-object v0
.end method

.method public transform(Lit/sephiroth/android/library/picasso/Transformation;)Lit/sephiroth/android/library/picasso/RequestCreator;
    .registers 3
    .param p1, "transformation"    # Lit/sephiroth/android/library/picasso/Transformation;

    .prologue
    .line 360
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/RequestCreator;->data:Lit/sephiroth/android/library/picasso/Request$Builder;

    invoke-virtual {v0, p1}, Lit/sephiroth/android/library/picasso/Request$Builder;->transform(Lit/sephiroth/android/library/picasso/Transformation;)Lit/sephiroth/android/library/picasso/Request$Builder;

    .line 361
    return-object p0
.end method

.method unfit()Lit/sephiroth/android/library/picasso/RequestCreator;
    .registers 2

    .prologue
    .line 228
    const/4 v0, 0x0

    iput-boolean v0, p0, Lit/sephiroth/android/library/picasso/RequestCreator;->deferred:Z

    .line 229
    return-object p0
.end method

.method public withCache(Lit/sephiroth/android/library/picasso/Cache;)Lit/sephiroth/android/library/picasso/RequestCreator;
    .registers 3
    .param p1, "cache"    # Lit/sephiroth/android/library/picasso/Cache;

    .prologue
    .line 326
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/RequestCreator;->data:Lit/sephiroth/android/library/picasso/Request$Builder;

    invoke-virtual {v0, p1}, Lit/sephiroth/android/library/picasso/Request$Builder;->setCache(Lit/sephiroth/android/library/picasso/Cache;)Lit/sephiroth/android/library/picasso/Request$Builder;

    .line 327
    return-object p0
.end method
