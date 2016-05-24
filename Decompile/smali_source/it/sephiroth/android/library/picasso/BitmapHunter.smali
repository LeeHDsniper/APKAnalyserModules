.class Lit/sephiroth/android/library/picasso/BitmapHunter;
.super Ljava/lang/Object;
.source "BitmapHunter.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static final DECODE_LOCK:Ljava/lang/Object;

.field private static final ERRORING_HANDLER:Lit/sephiroth/android/library/picasso/RequestHandler;

.field private static final NAME_BUILDER:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/lang/StringBuilder;",
            ">;"
        }
    .end annotation
.end field

.field private static final SEQUENCE_GENERATOR:Ljava/util/concurrent/atomic/AtomicInteger;


# instance fields
.field action:Lit/sephiroth/android/library/picasso/Action;

.field actions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lit/sephiroth/android/library/picasso/Action;",
            ">;"
        }
    .end annotation
.end field

.field final cache:Lit/sephiroth/android/library/picasso/Cache;

.field final data:Lit/sephiroth/android/library/picasso/Request;

.field final diskCache:Lit/sephiroth/android/library/picasso/Cache;

.field final dispatcher:Lit/sephiroth/android/library/picasso/Dispatcher;

.field exception:Ljava/lang/Exception;

.field exifRotation:I

.field future:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future",
            "<*>;"
        }
    .end annotation
.end field

.field final key:Ljava/lang/String;

.field loadedFrom:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

.field final memoryPolicy:I

.field networkPolicy:I

.field final picasso:Lit/sephiroth/android/library/picasso/Picasso;

.field priority:Lit/sephiroth/android/library/picasso/Picasso$Priority;

.field final requestHandler:Lit/sephiroth/android/library/picasso/RequestHandler;

.field result:Landroid/graphics/Bitmap;

.field retryCount:I

.field final sequence:I

.field final stats:Lit/sephiroth/android/library/picasso/Stats;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 38
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lit/sephiroth/android/library/picasso/BitmapHunter;->DECODE_LOCK:Ljava/lang/Object;

    .line 40
    new-instance v0, Lit/sephiroth/android/library/picasso/BitmapHunter$1;

    invoke-direct {v0}, Lit/sephiroth/android/library/picasso/BitmapHunter$1;-><init>()V

    sput-object v0, Lit/sephiroth/android/library/picasso/BitmapHunter;->NAME_BUILDER:Ljava/lang/ThreadLocal;

    .line 46
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    sput-object v0, Lit/sephiroth/android/library/picasso/BitmapHunter;->SEQUENCE_GENERATOR:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 48
    new-instance v0, Lit/sephiroth/android/library/picasso/BitmapHunter$2;

    invoke-direct {v0}, Lit/sephiroth/android/library/picasso/BitmapHunter$2;-><init>()V

    sput-object v0, Lit/sephiroth/android/library/picasso/BitmapHunter;->ERRORING_HANDLER:Lit/sephiroth/android/library/picasso/RequestHandler;

    return-void
.end method

.method constructor <init>(Lit/sephiroth/android/library/picasso/Picasso;Lit/sephiroth/android/library/picasso/Dispatcher;Lit/sephiroth/android/library/picasso/Cache;Lit/sephiroth/android/library/picasso/Cache;Lit/sephiroth/android/library/picasso/Stats;Lit/sephiroth/android/library/picasso/Action;Lit/sephiroth/android/library/picasso/RequestHandler;)V
    .registers 9
    .param p1, "picasso"    # Lit/sephiroth/android/library/picasso/Picasso;
    .param p2, "dispatcher"    # Lit/sephiroth/android/library/picasso/Dispatcher;
    .param p3, "cache"    # Lit/sephiroth/android/library/picasso/Cache;
    .param p4, "diskCache"    # Lit/sephiroth/android/library/picasso/Cache;
    .param p5, "stats"    # Lit/sephiroth/android/library/picasso/Stats;
    .param p6, "action"    # Lit/sephiroth/android/library/picasso/Action;
    .param p7, "requestHandler"    # Lit/sephiroth/android/library/picasso/RequestHandler;

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    sget-object v0, Lit/sephiroth/android/library/picasso/BitmapHunter;->SEQUENCE_GENERATOR:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v0

    iput v0, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->sequence:I

    .line 83
    iput-object p1, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    .line 84
    iput-object p2, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->dispatcher:Lit/sephiroth/android/library/picasso/Dispatcher;

    .line 85
    iput-object p3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->cache:Lit/sephiroth/android/library/picasso/Cache;

    .line 86
    iput-object p4, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->diskCache:Lit/sephiroth/android/library/picasso/Cache;

    .line 87
    iput-object p5, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->stats:Lit/sephiroth/android/library/picasso/Stats;

    .line 88
    iput-object p6, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->action:Lit/sephiroth/android/library/picasso/Action;

    .line 89
    invoke-virtual {p6}, Lit/sephiroth/android/library/picasso/Action;->getKey()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->key:Ljava/lang/String;

    .line 90
    invoke-virtual {p6}, Lit/sephiroth/android/library/picasso/Action;->getRequest()Lit/sephiroth/android/library/picasso/Request;

    move-result-object v0

    iput-object v0, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->data:Lit/sephiroth/android/library/picasso/Request;

    .line 91
    invoke-virtual {p6}, Lit/sephiroth/android/library/picasso/Action;->getPriority()Lit/sephiroth/android/library/picasso/Picasso$Priority;

    move-result-object v0

    iput-object v0, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->priority:Lit/sephiroth/android/library/picasso/Picasso$Priority;

    .line 92
    invoke-virtual {p6}, Lit/sephiroth/android/library/picasso/Action;->getMemoryPolicy()I

    move-result v0

    iput v0, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->memoryPolicy:I

    .line 93
    invoke-virtual {p6}, Lit/sephiroth/android/library/picasso/Action;->getNetworkPolicy()I

    move-result v0

    iput v0, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->networkPolicy:I

    .line 94
    iput-object p7, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->requestHandler:Lit/sephiroth/android/library/picasso/RequestHandler;

    .line 95
    invoke-virtual {p7}, Lit/sephiroth/android/library/picasso/RequestHandler;->getRetryCount()I

    move-result v0

    iput v0, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->retryCount:I

    .line 96
    return-void
.end method

.method static applyCustomTransformations(Ljava/util/List;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 13
    .param p1, "result"    # Landroid/graphics/Bitmap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lit/sephiroth/android/library/picasso/Transformation;",
            ">;",
            "Landroid/graphics/Bitmap;",
            ")",
            "Landroid/graphics/Bitmap;"
        }
    .end annotation

    .prologue
    .local p0, "transformations":Ljava/util/List;, "Ljava/util/List<Lit/sephiroth/android/library/picasso/Transformation;>;"
    const/4 v7, 0x0

    .line 444
    const/4 v3, 0x0

    .local v3, "i":I
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    .local v1, "count":I
    :goto_6
    if-ge v3, v1, :cond_61

    .line 445
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lit/sephiroth/android/library/picasso/Transformation;

    .line 448
    .local v6, "transformation":Lit/sephiroth/android/library/picasso/Transformation;
    :try_start_e
    invoke-interface {v6, p1}, Lit/sephiroth/android/library/picasso/Transformation;->transform(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    :try_end_11
    .catch Ljava/lang/RuntimeException; {:try_start_e .. :try_end_11} :catch_55

    move-result-object v4

    .line 459
    .local v4, "newResult":Landroid/graphics/Bitmap;
    if-nez v4, :cond_6e

    .line 460
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Transformation "

    .line 461
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 462
    invoke-interface {v6}, Lit/sephiroth/android/library/picasso/Transformation;->key()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " returned null after "

    .line 463
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 464
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " previous transformation(s).\n\nTransformation list:\n"

    .line 465
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 466
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_3b
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_62

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lit/sephiroth/android/library/picasso/Transformation;

    .line 467
    .local v5, "t":Lit/sephiroth/android/library/picasso/Transformation;
    invoke-interface {v5}, Lit/sephiroth/android/library/picasso/Transformation;->key()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const/16 v10, 0xa

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_3b

    .line 449
    .end local v0    # "builder":Ljava/lang/StringBuilder;
    .end local v4    # "newResult":Landroid/graphics/Bitmap;
    .end local v5    # "t":Lit/sephiroth/android/library/picasso/Transformation;
    :catch_55
    move-exception v2

    .line 450
    .local v2, "e":Ljava/lang/RuntimeException;
    sget-object v8, Lit/sephiroth/android/library/picasso/Picasso;->HANDLER:Landroid/os/Handler;

    new-instance v9, Lit/sephiroth/android/library/picasso/BitmapHunter$3;

    invoke-direct {v9, v6, v2}, Lit/sephiroth/android/library/picasso/BitmapHunter$3;-><init>(Lit/sephiroth/android/library/picasso/Transformation;Ljava/lang/RuntimeException;)V

    invoke-virtual {v8, v9}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    move-object p1, v7

    .line 502
    .end local v2    # "e":Ljava/lang/RuntimeException;
    .end local v6    # "transformation":Lit/sephiroth/android/library/picasso/Transformation;
    .end local p1    # "result":Landroid/graphics/Bitmap;
    :cond_61
    :goto_61
    return-object p1

    .line 469
    .restart local v0    # "builder":Ljava/lang/StringBuilder;
    .restart local v4    # "newResult":Landroid/graphics/Bitmap;
    .restart local v6    # "transformation":Lit/sephiroth/android/library/picasso/Transformation;
    .restart local p1    # "result":Landroid/graphics/Bitmap;
    :cond_62
    sget-object v8, Lit/sephiroth/android/library/picasso/Picasso;->HANDLER:Landroid/os/Handler;

    new-instance v9, Lit/sephiroth/android/library/picasso/BitmapHunter$4;

    invoke-direct {v9, v0}, Lit/sephiroth/android/library/picasso/BitmapHunter$4;-><init>(Ljava/lang/StringBuilder;)V

    invoke-virtual {v8, v9}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    move-object p1, v7

    .line 474
    goto :goto_61

    .line 477
    .end local v0    # "builder":Ljava/lang/StringBuilder;
    :cond_6e
    if-ne v4, p1, :cond_82

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v8

    if-eqz v8, :cond_82

    .line 478
    sget-object v8, Lit/sephiroth/android/library/picasso/Picasso;->HANDLER:Landroid/os/Handler;

    new-instance v9, Lit/sephiroth/android/library/picasso/BitmapHunter$5;

    invoke-direct {v9, v6}, Lit/sephiroth/android/library/picasso/BitmapHunter$5;-><init>(Lit/sephiroth/android/library/picasso/Transformation;)V

    invoke-virtual {v8, v9}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    move-object p1, v7

    .line 485
    goto :goto_61

    .line 500
    :cond_82
    move-object p1, v4

    .line 444
    add-int/lit8 v3, v3, 0x1

    goto :goto_6
.end method

.method private computeNewPriority()Lit/sephiroth/android/library/picasso/Picasso$Priority;
    .registers 11

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 325
    sget-object v5, Lit/sephiroth/android/library/picasso/Picasso$Priority;->LOW:Lit/sephiroth/android/library/picasso/Picasso$Priority;

    .line 327
    .local v5, "newPriority":Lit/sephiroth/android/library/picasso/Picasso$Priority;
    iget-object v9, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->actions:Ljava/util/List;

    if-eqz v9, :cond_1c

    iget-object v9, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->actions:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_1c

    move v2, v7

    .line 328
    .local v2, "hasMultiple":Z
    :goto_11
    iget-object v9, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->action:Lit/sephiroth/android/library/picasso/Action;

    if-nez v9, :cond_17

    if-eqz v2, :cond_1e

    :cond_17
    move v1, v7

    .line 331
    .local v1, "hasAny":Z
    :goto_18
    if-nez v1, :cond_20

    move-object v6, v5

    .line 349
    .end local v5    # "newPriority":Lit/sephiroth/android/library/picasso/Picasso$Priority;
    .local v6, "newPriority":Lit/sephiroth/android/library/picasso/Picasso$Priority;
    :goto_1b
    return-object v6

    .end local v1    # "hasAny":Z
    .end local v2    # "hasMultiple":Z
    .end local v6    # "newPriority":Lit/sephiroth/android/library/picasso/Picasso$Priority;
    .restart local v5    # "newPriority":Lit/sephiroth/android/library/picasso/Picasso$Priority;
    :cond_1c
    move v2, v8

    .line 327
    goto :goto_11

    .restart local v2    # "hasMultiple":Z
    :cond_1e
    move v1, v8

    .line 328
    goto :goto_18

    .line 335
    .restart local v1    # "hasAny":Z
    :cond_20
    iget-object v7, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->action:Lit/sephiroth/android/library/picasso/Action;

    if-eqz v7, :cond_2a

    .line 336
    iget-object v7, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->action:Lit/sephiroth/android/library/picasso/Action;

    invoke-virtual {v7}, Lit/sephiroth/android/library/picasso/Action;->getPriority()Lit/sephiroth/android/library/picasso/Picasso$Priority;

    move-result-object v5

    .line 339
    :cond_2a
    if-eqz v2, :cond_4f

    .line 341
    const/4 v3, 0x0

    .local v3, "i":I
    iget-object v7, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->actions:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v4

    .local v4, "n":I
    :goto_33
    if-ge v3, v4, :cond_4f

    .line 342
    iget-object v7, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->actions:Ljava/util/List;

    invoke-interface {v7, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lit/sephiroth/android/library/picasso/Action;

    invoke-virtual {v7}, Lit/sephiroth/android/library/picasso/Action;->getPriority()Lit/sephiroth/android/library/picasso/Picasso$Priority;

    move-result-object v0

    .line 343
    .local v0, "actionPriority":Lit/sephiroth/android/library/picasso/Picasso$Priority;
    invoke-virtual {v0}, Lit/sephiroth/android/library/picasso/Picasso$Priority;->ordinal()I

    move-result v7

    invoke-virtual {v5}, Lit/sephiroth/android/library/picasso/Picasso$Priority;->ordinal()I

    move-result v8

    if-le v7, v8, :cond_4c

    .line 344
    move-object v5, v0

    .line 341
    :cond_4c
    add-int/lit8 v3, v3, 0x1

    goto :goto_33

    .end local v0    # "actionPriority":Lit/sephiroth/android/library/picasso/Picasso$Priority;
    .end local v3    # "i":I
    .end local v4    # "n":I
    :cond_4f
    move-object v6, v5

    .line 349
    .end local v5    # "newPriority":Lit/sephiroth/android/library/picasso/Picasso$Priority;
    .restart local v6    # "newPriority":Lit/sephiroth/android/library/picasso/Picasso$Priority;
    goto :goto_1b
.end method

.method static decodeStream(Ljava/io/InputStream;Lit/sephiroth/android/library/picasso/Request;)Landroid/graphics/Bitmap;
    .registers 14
    .param p0, "stream"    # Ljava/io/InputStream;
    .param p1, "request"    # Lit/sephiroth/android/library/picasso/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x0

    .line 104
    new-instance v6, Lit/sephiroth/android/library/picasso/MarkableInputStream;

    invoke-direct {v6, p0}, Lit/sephiroth/android/library/picasso/MarkableInputStream;-><init>(Ljava/io/InputStream;)V

    .line 105
    .local v6, "markStream":Lit/sephiroth/android/library/picasso/MarkableInputStream;
    move-object p0, v6

    .line 107
    invoke-virtual {v6, v10}, Lit/sephiroth/android/library/picasso/MarkableInputStream;->allowMarksToExpire(Z)V

    .line 108
    const/16 v8, 0x400

    invoke-virtual {v6, v8}, Lit/sephiroth/android/library/picasso/MarkableInputStream;->savePosition(I)J

    move-result-wide v4

    .line 110
    .local v4, "mark":J
    invoke-static {p1}, Lit/sephiroth/android/library/picasso/RequestHandler;->createBitmapOptions(Lit/sephiroth/android/library/picasso/Request;)Landroid/graphics/BitmapFactory$Options;

    move-result-object v7

    .line 111
    .local v7, "options":Landroid/graphics/BitmapFactory$Options;
    invoke-static {v7}, Lit/sephiroth/android/library/picasso/RequestHandler;->requiresInSampleSize(Landroid/graphics/BitmapFactory$Options;)Z

    move-result v2

    .line 113
    .local v2, "calculateSize":Z
    invoke-static {p0}, Lit/sephiroth/android/library/picasso/Utils;->isWebPFile(Ljava/io/InputStream;)Z

    move-result v3

    .line 114
    .local v3, "isWebPFile":Z
    invoke-virtual {v6, v4, v5}, Lit/sephiroth/android/library/picasso/MarkableInputStream;->reset(J)V

    .line 117
    if-eqz v3, :cond_39

    .line 118
    invoke-static {p0}, Lit/sephiroth/android/library/picasso/Utils;->toByteArray(Ljava/io/InputStream;)[B

    move-result-object v1

    .line 119
    .local v1, "bytes":[B
    if-eqz v2, :cond_33

    .line 120
    array-length v8, v1

    invoke-static {v1, v10, v8, v7}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 121
    iget v8, p1, Lit/sephiroth/android/library/picasso/Request;->targetWidth:I

    iget v9, p1, Lit/sephiroth/android/library/picasso/Request;->targetHeight:I

    invoke-static {v8, v9, v7, p1}, Lit/sephiroth/android/library/picasso/RequestHandler;->calculateInSampleSize(IILandroid/graphics/BitmapFactory$Options;Lit/sephiroth/android/library/picasso/Request;)V

    .line 124
    :cond_33
    array-length v8, v1

    invoke-static {v1, v10, v8, v7}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 138
    .end local v1    # "bytes":[B
    :cond_38
    return-object v0

    .line 126
    :cond_39
    if-eqz v2, :cond_48

    .line 127
    invoke-static {p0, v11, v7}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 128
    iget v8, p1, Lit/sephiroth/android/library/picasso/Request;->targetWidth:I

    iget v9, p1, Lit/sephiroth/android/library/picasso/Request;->targetHeight:I

    invoke-static {v8, v9, v7, p1}, Lit/sephiroth/android/library/picasso/RequestHandler;->calculateInSampleSize(IILandroid/graphics/BitmapFactory$Options;Lit/sephiroth/android/library/picasso/Request;)V

    .line 130
    invoke-virtual {v6, v4, v5}, Lit/sephiroth/android/library/picasso/MarkableInputStream;->reset(J)V

    .line 132
    :cond_48
    const/4 v8, 0x1

    invoke-virtual {v6, v8}, Lit/sephiroth/android/library/picasso/MarkableInputStream;->allowMarksToExpire(Z)V

    .line 133
    invoke-static {p0, v11, v7}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 134
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-nez v0, :cond_38

    .line 136
    new-instance v8, Ljava/io/IOException;

    const-string v9, "Failed to decode stream."

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8
.end method

.method static forRequest(Lit/sephiroth/android/library/picasso/Picasso;Lit/sephiroth/android/library/picasso/Dispatcher;Lit/sephiroth/android/library/picasso/Cache;Lit/sephiroth/android/library/picasso/Cache;Lit/sephiroth/android/library/picasso/Stats;Lit/sephiroth/android/library/picasso/Action;)Lit/sephiroth/android/library/picasso/BitmapHunter;
    .registers 28
    .param p0, "picasso"    # Lit/sephiroth/android/library/picasso/Picasso;
    .param p1, "dispatcher"    # Lit/sephiroth/android/library/picasso/Dispatcher;
    .param p2, "cache"    # Lit/sephiroth/android/library/picasso/Cache;
    .param p3, "diskCache"    # Lit/sephiroth/android/library/picasso/Cache;
    .param p4, "stats"    # Lit/sephiroth/android/library/picasso/Stats;
    .param p5, "action"    # Lit/sephiroth/android/library/picasso/Action;

    .prologue
    .line 428
    invoke-virtual/range {p5 .. p5}, Lit/sephiroth/android/library/picasso/Action;->getRequest()Lit/sephiroth/android/library/picasso/Request;

    move-result-object v20

    .line 429
    .local v20, "request":Lit/sephiroth/android/library/picasso/Request;
    invoke-virtual/range {p0 .. p0}, Lit/sephiroth/android/library/picasso/Picasso;->getRequestHandlers()Ljava/util/List;

    move-result-object v21

    .line 433
    .local v21, "requestHandlers":Ljava/util/List;, "Ljava/util/List<Lit/sephiroth/android/library/picasso/RequestHandler;>;"
    const/16 v19, 0x0

    .local v19, "i":I
    invoke-interface/range {v21 .. v21}, Ljava/util/List;->size()I

    move-result v18

    .local v18, "count":I
    :goto_e
    move/from16 v0, v19

    move/from16 v1, v18

    if-ge v0, v1, :cond_3b

    .line 434
    move-object/from16 v0, v21

    move/from16 v1, v19

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lit/sephiroth/android/library/picasso/RequestHandler;

    .line 435
    .local v9, "requestHandler":Lit/sephiroth/android/library/picasso/RequestHandler;
    move-object/from16 v0, v20

    invoke-virtual {v9, v0}, Lit/sephiroth/android/library/picasso/RequestHandler;->canHandleRequest(Lit/sephiroth/android/library/picasso/Request;)Z

    move-result v2

    if-eqz v2, :cond_38

    .line 436
    new-instance v2, Lit/sephiroth/android/library/picasso/BitmapHunter;

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    move-object/from16 v8, p5

    invoke-direct/range {v2 .. v9}, Lit/sephiroth/android/library/picasso/BitmapHunter;-><init>(Lit/sephiroth/android/library/picasso/Picasso;Lit/sephiroth/android/library/picasso/Dispatcher;Lit/sephiroth/android/library/picasso/Cache;Lit/sephiroth/android/library/picasso/Cache;Lit/sephiroth/android/library/picasso/Stats;Lit/sephiroth/android/library/picasso/Action;Lit/sephiroth/android/library/picasso/RequestHandler;)V

    .line 440
    .end local v9    # "requestHandler":Lit/sephiroth/android/library/picasso/RequestHandler;
    :goto_37
    return-object v2

    .line 433
    .restart local v9    # "requestHandler":Lit/sephiroth/android/library/picasso/RequestHandler;
    :cond_38
    add-int/lit8 v19, v19, 0x1

    goto :goto_e

    .line 440
    .end local v9    # "requestHandler":Lit/sephiroth/android/library/picasso/RequestHandler;
    :cond_3b
    new-instance v10, Lit/sephiroth/android/library/picasso/BitmapHunter;

    sget-object v17, Lit/sephiroth/android/library/picasso/BitmapHunter;->ERRORING_HANDLER:Lit/sephiroth/android/library/picasso/RequestHandler;

    move-object/from16 v11, p0

    move-object/from16 v12, p1

    move-object/from16 v13, p2

    move-object/from16 v14, p3

    move-object/from16 v15, p4

    move-object/from16 v16, p5

    invoke-direct/range {v10 .. v17}, Lit/sephiroth/android/library/picasso/BitmapHunter;-><init>(Lit/sephiroth/android/library/picasso/Picasso;Lit/sephiroth/android/library/picasso/Dispatcher;Lit/sephiroth/android/library/picasso/Cache;Lit/sephiroth/android/library/picasso/Cache;Lit/sephiroth/android/library/picasso/Stats;Lit/sephiroth/android/library/picasso/Action;Lit/sephiroth/android/library/picasso/RequestHandler;)V

    move-object v2, v10

    goto :goto_37
.end method

.method private static shouldResize(ZIIII)Z
    .registers 6
    .param p0, "onlyScaleDown"    # Z
    .param p1, "inWidth"    # I
    .param p2, "inHeight"    # I
    .param p3, "targetWidth"    # I
    .param p4, "targetHeight"    # I

    .prologue
    .line 600
    if-eqz p0, :cond_6

    if-gt p1, p3, :cond_6

    if-le p2, p4, :cond_8

    :cond_6
    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method static transformResult(Lit/sephiroth/android/library/picasso/Request;Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    .registers 31
    .param p0, "data"    # Lit/sephiroth/android/library/picasso/Request;
    .param p1, "result"    # Landroid/graphics/Bitmap;
    .param p2, "exifRotation"    # I

    .prologue
    .line 506
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v11

    .line 507
    .local v11, "inWidth":I
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v10

    .line 508
    .local v10, "inHeight":I
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lit/sephiroth/android/library/picasso/Request;->onlyScaleDown:Z

    .line 510
    .local v14, "onlyScaleDown":Z
    const/4 v3, 0x0

    .line 511
    .local v3, "drawX":I
    const/4 v4, 0x0

    .line 512
    .local v4, "drawY":I
    move v5, v11

    .line 513
    .local v5, "drawWidth":I
    move v6, v10

    .line 515
    .local v6, "drawHeight":I
    new-instance v7, Landroid/graphics/Matrix;

    invoke-direct {v7}, Landroid/graphics/Matrix;-><init>()V

    .line 517
    .local v7, "matrix":Landroid/graphics/Matrix;
    invoke-virtual/range {p0 .. p0}, Lit/sephiroth/android/library/picasso/Request;->needsMatrixTransform()Z

    move-result v2

    if-eqz v2, :cond_87

    .line 518
    move-object/from16 v0, p0

    iget v0, v0, Lit/sephiroth/android/library/picasso/Request;->targetWidth:I

    move/from16 v22, v0

    .line 519
    .local v22, "targetWidth":I
    move-object/from16 v0, p0

    iget v0, v0, Lit/sephiroth/android/library/picasso/Request;->targetHeight:I

    move/from16 v20, v0

    .line 521
    .local v20, "targetHeight":I
    move-object/from16 v0, p0

    iget v0, v0, Lit/sephiroth/android/library/picasso/Request;->rotationDegrees:F

    move/from16 v21, v0

    .line 522
    .local v21, "targetRotation":F
    const/4 v2, 0x0

    cmpl-float v2, v21, v2

    if-eqz v2, :cond_45

    .line 523
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lit/sephiroth/android/library/picasso/Request;->hasRotationPivot:Z

    if-eqz v2, :cond_a0

    .line 524
    move-object/from16 v0, p0

    iget v2, v0, Lit/sephiroth/android/library/picasso/Request;->rotationPivotX:F

    move-object/from16 v0, p0

    iget v8, v0, Lit/sephiroth/android/library/picasso/Request;->rotationPivotY:F

    move/from16 v0, v21

    invoke-virtual {v7, v0, v2, v8}, Landroid/graphics/Matrix;->setRotate(FFF)V

    .line 530
    :cond_45
    :goto_45
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lit/sephiroth/android/library/picasso/Request;->centerCrop:Z

    if-eqz v2, :cond_c2

    .line 531
    move/from16 v0, v22

    int-to-float v2, v0

    int-to-float v8, v11

    div-float v23, v2, v8

    .line 532
    .local v23, "widthRatio":F
    move/from16 v0, v20

    int-to-float v2, v0

    int-to-float v8, v10

    div-float v9, v2, v8

    .line 534
    .local v9, "heightRatio":F
    cmpl-float v2, v23, v9

    if-lez v2, :cond_a6

    .line 535
    int-to-float v2, v10

    div-float v8, v9, v23

    mul-float/2addr v2, v8

    float-to-double v0, v2

    move-wide/from16 v24, v0

    invoke-static/range {v24 .. v25}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v24

    move-wide/from16 v0, v24

    double-to-int v13, v0

    .line 536
    .local v13, "newSize":I
    sub-int v2, v10, v13

    div-int/lit8 v4, v2, 0x2

    .line 537
    move v6, v13

    .line 538
    move/from16 v16, v23

    .line 539
    .local v16, "scaleX":F
    move/from16 v0, v20

    int-to-float v2, v0

    int-to-float v8, v6

    div-float v17, v2, v8

    .line 547
    .local v17, "scaleY":F
    :goto_76
    move/from16 v0, v22

    move/from16 v1, v20

    invoke-static {v14, v11, v10, v0, v1}, Lit/sephiroth/android/library/picasso/BitmapHunter;->shouldResize(ZIIII)Z

    move-result v2

    if-eqz v2, :cond_87

    .line 548
    move/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v7, v0, v1}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 584
    .end local v9    # "heightRatio":F
    .end local v13    # "newSize":I
    .end local v16    # "scaleX":F
    .end local v17    # "scaleY":F
    .end local v20    # "targetHeight":I
    .end local v21    # "targetRotation":F
    .end local v22    # "targetWidth":I
    .end local v23    # "widthRatio":F
    :cond_87
    :goto_87
    if-eqz p2, :cond_8f

    .line 585
    move/from16 v0, p2

    int-to-float v2, v0

    invoke-virtual {v7, v2}, Landroid/graphics/Matrix;->preRotate(F)Z

    .line 588
    :cond_8f
    const/4 v8, 0x1

    move-object/from16 v2, p1

    .line 589
    invoke-static/range {v2 .. v8}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v12

    .line 590
    .local v12, "newResult":Landroid/graphics/Bitmap;
    move-object/from16 v0, p1

    if-eq v12, v0, :cond_9f

    .line 591
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 592
    move-object/from16 p1, v12

    .line 595
    :cond_9f
    return-object p1

    .line 526
    .end local v12    # "newResult":Landroid/graphics/Bitmap;
    .restart local v20    # "targetHeight":I
    .restart local v21    # "targetRotation":F
    .restart local v22    # "targetWidth":I
    :cond_a0
    move/from16 v0, v21

    invoke-virtual {v7, v0}, Landroid/graphics/Matrix;->setRotate(F)V

    goto :goto_45

    .line 541
    .restart local v9    # "heightRatio":F
    .restart local v23    # "widthRatio":F
    :cond_a6
    int-to-float v2, v11

    div-float v8, v23, v9

    mul-float/2addr v2, v8

    float-to-double v0, v2

    move-wide/from16 v24, v0

    invoke-static/range {v24 .. v25}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v24

    move-wide/from16 v0, v24

    double-to-int v13, v0

    .line 542
    .restart local v13    # "newSize":I
    sub-int v2, v11, v13

    div-int/lit8 v3, v2, 0x2

    .line 543
    move v5, v13

    .line 544
    move/from16 v0, v22

    int-to-float v2, v0

    int-to-float v8, v5

    div-float v16, v2, v8

    .line 545
    .restart local v16    # "scaleX":F
    move/from16 v17, v9

    .restart local v17    # "scaleY":F
    goto :goto_76

    .line 550
    .end local v9    # "heightRatio":F
    .end local v13    # "newSize":I
    .end local v16    # "scaleX":F
    .end local v17    # "scaleY":F
    .end local v23    # "widthRatio":F
    :cond_c2
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lit/sephiroth/android/library/picasso/Request;->centerInside:Z

    if-eqz v2, :cond_ea

    .line 551
    move/from16 v0, v22

    int-to-float v2, v0

    int-to-float v8, v11

    div-float v23, v2, v8

    .line 552
    .restart local v23    # "widthRatio":F
    move/from16 v0, v20

    int-to-float v2, v0

    int-to-float v8, v10

    div-float v9, v2, v8

    .line 553
    .restart local v9    # "heightRatio":F
    cmpg-float v2, v23, v9

    if-gez v2, :cond_e8

    move/from16 v15, v23

    .line 554
    .local v15, "scale":F
    :goto_da
    move/from16 v0, v22

    move/from16 v1, v20

    invoke-static {v14, v11, v10, v0, v1}, Lit/sephiroth/android/library/picasso/BitmapHunter;->shouldResize(ZIIII)Z

    move-result v2

    if-eqz v2, :cond_87

    .line 555
    invoke-virtual {v7, v15, v15}, Landroid/graphics/Matrix;->preScale(FF)Z

    goto :goto_87

    .end local v15    # "scale":F
    :cond_e8
    move v15, v9

    .line 553
    goto :goto_da

    .line 557
    .end local v9    # "heightRatio":F
    .end local v23    # "widthRatio":F
    :cond_ea
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lit/sephiroth/android/library/picasso/Request;->resizeByMaxSide:Z

    if-eqz v2, :cond_11f

    move/from16 v0, v22

    if-ne v0, v11, :cond_f8

    move/from16 v0, v20

    if-eq v0, v10, :cond_11f

    .line 560
    :cond_f8
    if-le v11, v10, :cond_118

    .line 561
    move/from16 v0, v22

    int-to-float v2, v0

    int-to-float v8, v11

    div-float v18, v2, v8

    .line 566
    .local v18, "sx":F
    :goto_100
    if-eqz v14, :cond_10f

    if-eqz v14, :cond_87

    move/from16 v0, v18

    float-to-double v0, v0

    move-wide/from16 v24, v0

    const-wide/high16 v26, 0x3ff0000000000000L

    cmpg-double v2, v24, v26

    if-gez v2, :cond_87

    .line 567
    :cond_10f
    move/from16 v0, v18

    move/from16 v1, v18

    invoke-virtual {v7, v0, v1}, Landroid/graphics/Matrix;->preScale(FF)Z

    goto/16 :goto_87

    .line 563
    .end local v18    # "sx":F
    :cond_118
    move/from16 v0, v20

    int-to-float v2, v0

    int-to-float v8, v10

    div-float v18, v2, v8

    .restart local v18    # "sx":F
    goto :goto_100

    .line 569
    .end local v18    # "sx":F
    :cond_11f
    if-nez v22, :cond_123

    if-eqz v20, :cond_87

    :cond_123
    move/from16 v0, v22

    if-ne v0, v11, :cond_12b

    move/from16 v0, v20

    if-eq v0, v10, :cond_87

    .line 574
    :cond_12b
    if-eqz v22, :cond_14e

    move/from16 v0, v22

    int-to-float v2, v0

    int-to-float v8, v11

    div-float v18, v2, v8

    .line 576
    .restart local v18    # "sx":F
    :goto_133
    if-eqz v20, :cond_155

    move/from16 v0, v20

    int-to-float v2, v0

    int-to-float v8, v10

    div-float v19, v2, v8

    .line 578
    .local v19, "sy":F
    :goto_13b
    move/from16 v0, v22

    move/from16 v1, v20

    invoke-static {v14, v11, v10, v0, v1}, Lit/sephiroth/android/library/picasso/BitmapHunter;->shouldResize(ZIIII)Z

    move-result v2

    if-eqz v2, :cond_87

    .line 579
    move/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v7, v0, v1}, Landroid/graphics/Matrix;->preScale(FF)Z

    goto/16 :goto_87

    .line 574
    .end local v18    # "sx":F
    .end local v19    # "sy":F
    :cond_14e
    move/from16 v0, v20

    int-to-float v2, v0

    int-to-float v8, v10

    div-float v18, v2, v8

    goto :goto_133

    .line 576
    .restart local v18    # "sx":F
    :cond_155
    move/from16 v0, v22

    int-to-float v2, v0

    int-to-float v8, v11

    div-float v19, v2, v8

    goto :goto_13b
.end method

.method static updateThreadName(Lit/sephiroth/android/library/picasso/Request;)V
    .registers 5
    .param p0, "data"    # Lit/sephiroth/android/library/picasso/Request;

    .prologue
    .line 417
    invoke-virtual {p0}, Lit/sephiroth/android/library/picasso/Request;->getName()Ljava/lang/String;

    move-result-object v1

    .line 419
    .local v1, "name":Ljava/lang/String;
    sget-object v2, Lit/sephiroth/android/library/picasso/BitmapHunter;->NAME_BUILDER:Ljava/lang/ThreadLocal;

    invoke-virtual {v2}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/StringBuilder;

    .line 420
    .local v0, "builder":Ljava/lang/StringBuilder;
    const-string v2, "Picasso-"

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v2, v3

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->ensureCapacity(I)V

    .line 421
    const-string v2, "Picasso-"

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    invoke-virtual {v0, v2, v3, v1}, Ljava/lang/StringBuilder;->replace(IILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 423
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 424
    return-void
.end method


# virtual methods
.method attach(Lit/sephiroth/android/library/picasso/Action;)V
    .registers 9
    .param p1, "action"    # Lit/sephiroth/android/library/picasso/Action;

    .prologue
    .line 273
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    iget-boolean v1, v3, Lit/sephiroth/android/library/picasso/Picasso;->loggingEnabled:Z

    .line 274
    .local v1, "loggingEnabled":Z
    iget-object v2, p1, Lit/sephiroth/android/library/picasso/Action;->request:Lit/sephiroth/android/library/picasso/Request;

    .line 276
    .local v2, "request":Lit/sephiroth/android/library/picasso/Request;
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->action:Lit/sephiroth/android/library/picasso/Action;

    if-nez v3, :cond_3a

    .line 277
    iput-object p1, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->action:Lit/sephiroth/android/library/picasso/Action;

    .line 278
    if-eqz v1, :cond_27

    .line 279
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->actions:Ljava/util/List;

    if-eqz v3, :cond_1a

    iget-object v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->actions:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_28

    .line 280
    :cond_1a
    const-string v3, "Hunter"

    const-string v4, "joined"

    invoke-virtual {v2}, Lit/sephiroth/android/library/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v5

    const-string v6, "to empty hunter"

    invoke-static {v3, v4, v5, v6}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 302
    :cond_27
    :goto_27
    return-void

    .line 282
    :cond_28
    const-string v3, "Hunter"

    const-string v4, "joined"

    invoke-virtual {v2}, Lit/sephiroth/android/library/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v5

    const-string v6, "to "

    invoke-static {p0, v6}, Lit/sephiroth/android/library/picasso/Utils;->getLogIdsForHunter(Lit/sephiroth/android/library/picasso/BitmapHunter;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v4, v5, v6}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_27

    .line 288
    :cond_3a
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->actions:Ljava/util/List;

    if-nez v3, :cond_46

    .line 289
    new-instance v3, Ljava/util/ArrayList;

    const/4 v4, 0x3

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->actions:Ljava/util/List;

    .line 292
    :cond_46
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->actions:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 294
    if-eqz v1, :cond_5e

    .line 295
    const-string v3, "Hunter"

    const-string v4, "joined"

    invoke-virtual {v2}, Lit/sephiroth/android/library/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v5

    const-string v6, "to "

    invoke-static {p0, v6}, Lit/sephiroth/android/library/picasso/Utils;->getLogIdsForHunter(Lit/sephiroth/android/library/picasso/BitmapHunter;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v4, v5, v6}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 298
    :cond_5e
    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/Action;->getPriority()Lit/sephiroth/android/library/picasso/Picasso$Priority;

    move-result-object v0

    .line 299
    .local v0, "actionPriority":Lit/sephiroth/android/library/picasso/Picasso$Priority;
    invoke-virtual {v0}, Lit/sephiroth/android/library/picasso/Picasso$Priority;->ordinal()I

    move-result v3

    iget-object v4, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->priority:Lit/sephiroth/android/library/picasso/Picasso$Priority;

    invoke-virtual {v4}, Lit/sephiroth/android/library/picasso/Picasso$Priority;->ordinal()I

    move-result v4

    if-le v3, v4, :cond_27

    .line 300
    iput-object v0, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->priority:Lit/sephiroth/android/library/picasso/Picasso$Priority;

    goto :goto_27
.end method

.method cancel()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 353
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->action:Lit/sephiroth/android/library/picasso/Action;

    if-nez v1, :cond_1e

    iget-object v1, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->actions:Ljava/util/List;

    if-eqz v1, :cond_11

    iget-object v1, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->actions:Ljava/util/List;

    .line 354
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1e

    :cond_11
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->future:Ljava/util/concurrent/Future;

    if-eqz v1, :cond_1e

    iget-object v1, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->future:Ljava/util/concurrent/Future;

    .line 356
    invoke-interface {v1, v0}, Ljava/util/concurrent/Future;->cancel(Z)Z

    move-result v1

    if-eqz v1, :cond_1e

    const/4 v0, 0x1

    :cond_1e
    return v0
.end method

.method detach(Lit/sephiroth/android/library/picasso/Action;)V
    .registers 7
    .param p1, "action"    # Lit/sephiroth/android/library/picasso/Action;

    .prologue
    .line 305
    const/4 v0, 0x0

    .line 306
    .local v0, "detached":Z
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->action:Lit/sephiroth/android/library/picasso/Action;

    if-ne v1, p1, :cond_33

    .line 307
    const/4 v1, 0x0

    iput-object v1, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->action:Lit/sephiroth/android/library/picasso/Action;

    .line 308
    const/4 v0, 0x1

    .line 315
    :cond_9
    :goto_9
    if-eqz v0, :cond_19

    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/Action;->getPriority()Lit/sephiroth/android/library/picasso/Picasso$Priority;

    move-result-object v1

    iget-object v2, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->priority:Lit/sephiroth/android/library/picasso/Picasso$Priority;

    if-ne v1, v2, :cond_19

    .line 316
    invoke-direct {p0}, Lit/sephiroth/android/library/picasso/BitmapHunter;->computeNewPriority()Lit/sephiroth/android/library/picasso/Picasso$Priority;

    move-result-object v1

    iput-object v1, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->priority:Lit/sephiroth/android/library/picasso/Picasso$Priority;

    .line 319
    :cond_19
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    iget-boolean v1, v1, Lit/sephiroth/android/library/picasso/Picasso;->loggingEnabled:Z

    if-eqz v1, :cond_32

    .line 320
    const-string v1, "Hunter"

    const-string v2, "removed"

    iget-object v3, p1, Lit/sephiroth/android/library/picasso/Action;->request:Lit/sephiroth/android/library/picasso/Request;

    invoke-virtual {v3}, Lit/sephiroth/android/library/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v3

    const-string v4, "from "

    invoke-static {p0, v4}, Lit/sephiroth/android/library/picasso/Utils;->getLogIdsForHunter(Lit/sephiroth/android/library/picasso/BitmapHunter;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v2, v3, v4}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 322
    :cond_32
    return-void

    .line 309
    :cond_33
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->actions:Ljava/util/List;

    if-eqz v1, :cond_9

    .line 310
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->actions:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_9
.end method

.method getAction()Lit/sephiroth/android/library/picasso/Action;
    .registers 2

    .prologue
    .line 393
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->action:Lit/sephiroth/android/library/picasso/Action;

    return-object v0
.end method

.method getActions()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lit/sephiroth/android/library/picasso/Action;",
            ">;"
        }
    .end annotation

    .prologue
    .line 401
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->actions:Ljava/util/List;

    return-object v0
.end method

.method getData()Lit/sephiroth/android/library/picasso/Request;
    .registers 2

    .prologue
    .line 389
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->data:Lit/sephiroth/android/library/picasso/Request;

    return-object v0
.end method

.method getException()Ljava/lang/Exception;
    .registers 2

    .prologue
    .line 405
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->exception:Ljava/lang/Exception;

    return-object v0
.end method

.method getKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 381
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->key:Ljava/lang/String;

    return-object v0
.end method

.method getLoadedFrom()Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;
    .registers 2

    .prologue
    .line 409
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->loadedFrom:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    return-object v0
.end method

.method getMemoryPolicy()I
    .registers 2

    .prologue
    .line 385
    iget v0, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->memoryPolicy:I

    return v0
.end method

.method getPicasso()Lit/sephiroth/android/library/picasso/Picasso;
    .registers 2

    .prologue
    .line 397
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    return-object v0
.end method

.method getPriority()Lit/sephiroth/android/library/picasso/Picasso$Priority;
    .registers 2

    .prologue
    .line 413
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->priority:Lit/sephiroth/android/library/picasso/Picasso$Priority;

    return-object v0
.end method

.method getResult()Landroid/graphics/Bitmap;
    .registers 2

    .prologue
    .line 377
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->result:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method hunt()Landroid/graphics/Bitmap;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 183
    const/4 v0, 0x0

    .line 185
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-virtual {p0}, Lit/sephiroth/android/library/picasso/BitmapHunter;->isCancelled()Z

    move-result v3

    if-eqz v3, :cond_a

    move-object v3, v4

    .line 269
    :goto_9
    return-object v3

    .line 189
    :cond_a
    iget v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->memoryPolicy:I

    invoke-static {v3}, Lit/sephiroth/android/library/picasso/MemoryPolicy;->shouldReadFromMemoryCache(I)Z

    move-result v3

    if-eqz v3, :cond_64

    .line 190
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    iget-boolean v3, v3, Lit/sephiroth/android/library/picasso/Picasso;->loggingEnabled:Z

    if-eqz v3, :cond_3a

    .line 191
    const-string v3, "Hunter"

    const-string v5, "executing"

    iget-object v6, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->data:Lit/sephiroth/android/library/picasso/Request;

    invoke-virtual {v6}, Lit/sephiroth/android/library/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "cache: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->cache:Lit/sephiroth/android/library/picasso/Cache;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v3, v5, v6, v7}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    :cond_3a
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->cache:Lit/sephiroth/android/library/picasso/Cache;

    iget-object v5, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->key:Ljava/lang/String;

    invoke-interface {v3, v5}, Lit/sephiroth/android/library/picasso/Cache;->get(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 194
    if-eqz v0, :cond_64

    .line 195
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->stats:Lit/sephiroth/android/library/picasso/Stats;

    invoke-virtual {v3}, Lit/sephiroth/android/library/picasso/Stats;->dispatchCacheHit()V

    .line 196
    sget-object v3, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;->MEMORY:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    iput-object v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->loadedFrom:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    .line 197
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    iget-boolean v3, v3, Lit/sephiroth/android/library/picasso/Picasso;->loggingEnabled:Z

    if-eqz v3, :cond_62

    .line 198
    const-string v3, "Hunter"

    const-string v4, "decoded"

    iget-object v5, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->data:Lit/sephiroth/android/library/picasso/Request;

    invoke-virtual {v5}, Lit/sephiroth/android/library/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v5

    const-string v6, "from cache"

    invoke-static {v3, v4, v5, v6}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_62
    move-object v3, v0

    .line 200
    goto :goto_9

    .line 204
    :cond_64
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->diskCache:Lit/sephiroth/android/library/picasso/Cache;

    if-eqz v3, :cond_a6

    .line 205
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    iget-boolean v3, v3, Lit/sephiroth/android/library/picasso/Picasso;->loggingEnabled:Z

    if-eqz v3, :cond_90

    .line 206
    const-string v3, "Hunter"

    const-string v5, "executing"

    iget-object v6, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->data:Lit/sephiroth/android/library/picasso/Request;

    invoke-virtual {v6}, Lit/sephiroth/android/library/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "diskCache: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->diskCache:Lit/sephiroth/android/library/picasso/Cache;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v3, v5, v6, v7}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    :cond_90
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->diskCache:Lit/sephiroth/android/library/picasso/Cache;

    iget-object v5, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->key:Ljava/lang/String;

    invoke-interface {v3, v5}, Lit/sephiroth/android/library/picasso/Cache;->get(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 209
    if-eqz v0, :cond_a6

    .line 210
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->stats:Lit/sephiroth/android/library/picasso/Stats;

    invoke-virtual {v3}, Lit/sephiroth/android/library/picasso/Stats;->dispatchCacheHit()V

    .line 211
    sget-object v3, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;->DISK_CACHE:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    iput-object v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->loadedFrom:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    move-object v3, v0

    .line 212
    goto/16 :goto_9

    .line 216
    :cond_a6
    invoke-virtual {p0}, Lit/sephiroth/android/library/picasso/BitmapHunter;->isCancelled()Z

    move-result v3

    if-eqz v3, :cond_af

    move-object v3, v4

    .line 217
    goto/16 :goto_9

    .line 220
    :cond_af
    iget-object v5, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->data:Lit/sephiroth/android/library/picasso/Request;

    iget v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->retryCount:I

    if-nez v3, :cond_ef

    sget-object v3, Lit/sephiroth/android/library/picasso/NetworkPolicy;->OFFLINE:Lit/sephiroth/android/library/picasso/NetworkPolicy;

    iget v3, v3, Lit/sephiroth/android/library/picasso/NetworkPolicy;->index:I

    :goto_b9
    iput v3, v5, Lit/sephiroth/android/library/picasso/Request;->networkPolicy:I

    .line 221
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->requestHandler:Lit/sephiroth/android/library/picasso/RequestHandler;

    iget-object v5, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->data:Lit/sephiroth/android/library/picasso/Request;

    iget v6, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->networkPolicy:I

    invoke-virtual {v3, v5, v6}, Lit/sephiroth/android/library/picasso/RequestHandler;->load(Lit/sephiroth/android/library/picasso/Request;I)Lit/sephiroth/android/library/picasso/RequestHandler$Result;

    move-result-object v2

    .line 222
    .local v2, "result":Lit/sephiroth/android/library/picasso/RequestHandler$Result;
    if-eqz v2, :cond_e6

    .line 223
    invoke-virtual {v2}, Lit/sephiroth/android/library/picasso/RequestHandler$Result;->getLoadedFrom()Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    move-result-object v3

    iput-object v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->loadedFrom:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    .line 224
    invoke-virtual {v2}, Lit/sephiroth/android/library/picasso/RequestHandler$Result;->getExifOrientation()I

    move-result v3

    iput v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->exifRotation:I

    .line 226
    invoke-virtual {v2}, Lit/sephiroth/android/library/picasso/RequestHandler$Result;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 229
    if-nez v0, :cond_e6

    .line 230
    invoke-virtual {v2}, Lit/sephiroth/android/library/picasso/RequestHandler$Result;->getStream()Ljava/io/InputStream;

    move-result-object v1

    .line 232
    .local v1, "is":Ljava/io/InputStream;
    :try_start_dd
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->data:Lit/sephiroth/android/library/picasso/Request;

    invoke-static {v1, v3}, Lit/sephiroth/android/library/picasso/BitmapHunter;->decodeStream(Ljava/io/InputStream;Lit/sephiroth/android/library/picasso/Request;)Landroid/graphics/Bitmap;
    :try_end_e2
    .catchall {:try_start_dd .. :try_end_e2} :catchall_f2

    move-result-object v0

    .line 234
    invoke-static {v1}, Lit/sephiroth/android/library/picasso/Utils;->closeQuietly(Ljava/io/InputStream;)V

    .line 239
    .end local v1    # "is":Ljava/io/InputStream;
    :cond_e6
    invoke-virtual {p0}, Lit/sephiroth/android/library/picasso/BitmapHunter;->isCancelled()Z

    move-result v3

    if-eqz v3, :cond_f7

    move-object v3, v4

    .line 240
    goto/16 :goto_9

    .line 220
    .end local v2    # "result":Lit/sephiroth/android/library/picasso/RequestHandler$Result;
    :cond_ef
    iget v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->networkPolicy:I

    goto :goto_b9

    .line 234
    .restart local v1    # "is":Ljava/io/InputStream;
    .restart local v2    # "result":Lit/sephiroth/android/library/picasso/RequestHandler$Result;
    :catchall_f2
    move-exception v3

    invoke-static {v1}, Lit/sephiroth/android/library/picasso/Utils;->closeQuietly(Ljava/io/InputStream;)V

    throw v3

    .line 243
    .end local v1    # "is":Ljava/io/InputStream;
    :cond_f7
    if-eqz v0, :cond_174

    .line 244
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    iget-boolean v3, v3, Lit/sephiroth/android/library/picasso/Picasso;->loggingEnabled:Z

    if-eqz v3, :cond_10c

    .line 245
    const-string v3, "Hunter"

    const-string v4, "decoded"

    iget-object v5, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->data:Lit/sephiroth/android/library/picasso/Request;

    invoke-virtual {v5}, Lit/sephiroth/android/library/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 247
    :cond_10c
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->stats:Lit/sephiroth/android/library/picasso/Stats;

    invoke-virtual {v3, v0}, Lit/sephiroth/android/library/picasso/Stats;->dispatchBitmapDecoded(Landroid/graphics/Bitmap;)V

    .line 248
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->data:Lit/sephiroth/android/library/picasso/Request;

    invoke-virtual {v3}, Lit/sephiroth/android/library/picasso/Request;->needsTransformation()Z

    move-result v3

    if-nez v3, :cond_11d

    iget v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->exifRotation:I

    if-eqz v3, :cond_174

    .line 249
    :cond_11d
    sget-object v4, Lit/sephiroth/android/library/picasso/BitmapHunter;->DECODE_LOCK:Ljava/lang/Object;

    monitor-enter v4

    .line 250
    :try_start_120
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->data:Lit/sephiroth/android/library/picasso/Request;

    invoke-virtual {v3}, Lit/sephiroth/android/library/picasso/Request;->needsMatrixTransform()Z

    move-result v3

    if-nez v3, :cond_12c

    iget v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->exifRotation:I

    if-eqz v3, :cond_147

    .line 251
    :cond_12c
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->data:Lit/sephiroth/android/library/picasso/Request;

    iget v5, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->exifRotation:I

    invoke-static {v3, v0, v5}, Lit/sephiroth/android/library/picasso/BitmapHunter;->transformResult(Lit/sephiroth/android/library/picasso/Request;Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 252
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    iget-boolean v3, v3, Lit/sephiroth/android/library/picasso/Picasso;->loggingEnabled:Z

    if-eqz v3, :cond_147

    .line 253
    const-string v3, "Hunter"

    const-string v5, "transformed"

    iget-object v6, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->data:Lit/sephiroth/android/library/picasso/Request;

    invoke-virtual {v6}, Lit/sephiroth/android/library/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v5, v6}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 256
    :cond_147
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->data:Lit/sephiroth/android/library/picasso/Request;

    invoke-virtual {v3}, Lit/sephiroth/android/library/picasso/Request;->hasCustomTransformations()Z

    move-result v3

    if-eqz v3, :cond_16c

    .line 257
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->data:Lit/sephiroth/android/library/picasso/Request;

    iget-object v3, v3, Lit/sephiroth/android/library/picasso/Request;->transformations:Ljava/util/List;

    invoke-static {v3, v0}, Lit/sephiroth/android/library/picasso/BitmapHunter;->applyCustomTransformations(Ljava/util/List;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 258
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    iget-boolean v3, v3, Lit/sephiroth/android/library/picasso/Picasso;->loggingEnabled:Z

    if-eqz v3, :cond_16c

    .line 259
    const-string v3, "Hunter"

    const-string v5, "transformed"

    iget-object v6, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->data:Lit/sephiroth/android/library/picasso/Request;

    invoke-virtual {v6}, Lit/sephiroth/android/library/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v6

    const-string v7, "from custom transformations"

    invoke-static {v3, v5, v6, v7}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 262
    :cond_16c
    monitor-exit v4
    :try_end_16d
    .catchall {:try_start_120 .. :try_end_16d} :catchall_177

    .line 263
    if-eqz v0, :cond_174

    .line 264
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->stats:Lit/sephiroth/android/library/picasso/Stats;

    invoke-virtual {v3, v0}, Lit/sephiroth/android/library/picasso/Stats;->dispatchBitmapTransformed(Landroid/graphics/Bitmap;)V

    :cond_174
    move-object v3, v0

    .line 269
    goto/16 :goto_9

    .line 262
    :catchall_177
    move-exception v3

    :try_start_178
    monitor-exit v4
    :try_end_179
    .catchall {:try_start_178 .. :try_end_179} :catchall_177

    throw v3
.end method

.method isCancelled()Z
    .registers 2

    .prologue
    .line 360
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->future:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->future:Ljava/util/concurrent/Future;

    invoke-interface {v0}, Ljava/util/concurrent/Future;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public run()V
    .registers 6

    .prologue
    .line 144
    :try_start_0
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->data:Lit/sephiroth/android/library/picasso/Request;

    invoke-static {v2}, Lit/sephiroth/android/library/picasso/BitmapHunter;->updateThreadName(Lit/sephiroth/android/library/picasso/Request;)V

    .line 146
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    iget-boolean v2, v2, Lit/sephiroth/android/library/picasso/Picasso;->loggingEnabled:Z

    if-eqz v2, :cond_16

    .line 147
    const-string v2, "Hunter"

    const-string v3, "executing"

    invoke-static {p0}, Lit/sephiroth/android/library/picasso/Utils;->getLogIdsForHunter(Lit/sephiroth/android/library/picasso/BitmapHunter;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    :cond_16
    invoke-virtual {p0}, Lit/sephiroth/android/library/picasso/BitmapHunter;->hunt()Landroid/graphics/Bitmap;

    move-result-object v2

    iput-object v2, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->result:Landroid/graphics/Bitmap;

    .line 152
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->result:Landroid/graphics/Bitmap;

    if-nez v2, :cond_2f

    .line 153
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->dispatcher:Lit/sephiroth/android/library/picasso/Dispatcher;

    invoke-virtual {v2, p0}, Lit/sephiroth/android/library/picasso/Dispatcher;->dispatchFailed(Lit/sephiroth/android/library/picasso/BitmapHunter;)V
    :try_end_25
    .catch Lit/sephiroth/android/library/picasso/Downloader$ResponseException; {:try_start_0 .. :try_end_25} :catch_35
    .catch Lit/sephiroth/android/library/picasso/NetworkRequestHandler$ContentLengthException; {:try_start_0 .. :try_end_25} :catch_51
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_25} :catch_63
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_25} :catch_75
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_25} :catch_a3
    .catchall {:try_start_0 .. :try_end_25} :catchall_b9

    .line 178
    :goto_25
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    const-string v3, "Picasso-Idle"

    invoke-virtual {v2, v3}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 180
    :goto_2e
    return-void

    .line 155
    :cond_2f
    :try_start_2f
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->dispatcher:Lit/sephiroth/android/library/picasso/Dispatcher;

    invoke-virtual {v2, p0}, Lit/sephiroth/android/library/picasso/Dispatcher;->dispatchComplete(Lit/sephiroth/android/library/picasso/BitmapHunter;)V
    :try_end_34
    .catch Lit/sephiroth/android/library/picasso/Downloader$ResponseException; {:try_start_2f .. :try_end_34} :catch_35
    .catch Lit/sephiroth/android/library/picasso/NetworkRequestHandler$ContentLengthException; {:try_start_2f .. :try_end_34} :catch_51
    .catch Ljava/io/IOException; {:try_start_2f .. :try_end_34} :catch_63
    .catch Ljava/lang/OutOfMemoryError; {:try_start_2f .. :try_end_34} :catch_75
    .catch Ljava/lang/Exception; {:try_start_2f .. :try_end_34} :catch_a3
    .catchall {:try_start_2f .. :try_end_34} :catchall_b9

    goto :goto_25

    .line 157
    :catch_35
    move-exception v0

    .line 158
    .local v0, "e":Lit/sephiroth/android/library/picasso/Downloader$ResponseException;
    :try_start_36
    iget-boolean v2, v0, Lit/sephiroth/android/library/picasso/Downloader$ResponseException;->localCacheOnly:Z

    if-eqz v2, :cond_40

    iget v2, v0, Lit/sephiroth/android/library/picasso/Downloader$ResponseException;->responseCode:I

    const/16 v3, 0x1f8

    if-eq v2, v3, :cond_42

    .line 159
    :cond_40
    iput-object v0, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->exception:Ljava/lang/Exception;

    .line 161
    :cond_42
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->dispatcher:Lit/sephiroth/android/library/picasso/Dispatcher;

    invoke-virtual {v2, p0}, Lit/sephiroth/android/library/picasso/Dispatcher;->dispatchFailed(Lit/sephiroth/android/library/picasso/BitmapHunter;)V
    :try_end_47
    .catchall {:try_start_36 .. :try_end_47} :catchall_b9

    .line 178
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    const-string v3, "Picasso-Idle"

    invoke-virtual {v2, v3}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    goto :goto_2e

    .line 162
    .end local v0    # "e":Lit/sephiroth/android/library/picasso/Downloader$ResponseException;
    :catch_51
    move-exception v0

    .line 163
    .local v0, "e":Lit/sephiroth/android/library/picasso/NetworkRequestHandler$ContentLengthException;
    :try_start_52
    iput-object v0, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->exception:Ljava/lang/Exception;

    .line 164
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->dispatcher:Lit/sephiroth/android/library/picasso/Dispatcher;

    invoke-virtual {v2, p0}, Lit/sephiroth/android/library/picasso/Dispatcher;->dispatchRetry(Lit/sephiroth/android/library/picasso/BitmapHunter;)V
    :try_end_59
    .catchall {:try_start_52 .. :try_end_59} :catchall_b9

    .line 178
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    const-string v3, "Picasso-Idle"

    invoke-virtual {v2, v3}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    goto :goto_2e

    .line 165
    .end local v0    # "e":Lit/sephiroth/android/library/picasso/NetworkRequestHandler$ContentLengthException;
    :catch_63
    move-exception v0

    .line 166
    .local v0, "e":Ljava/io/IOException;
    :try_start_64
    iput-object v0, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->exception:Ljava/lang/Exception;

    .line 167
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->dispatcher:Lit/sephiroth/android/library/picasso/Dispatcher;

    invoke-virtual {v2, p0}, Lit/sephiroth/android/library/picasso/Dispatcher;->dispatchRetry(Lit/sephiroth/android/library/picasso/BitmapHunter;)V
    :try_end_6b
    .catchall {:try_start_64 .. :try_end_6b} :catchall_b9

    .line 178
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    const-string v3, "Picasso-Idle"

    invoke-virtual {v2, v3}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    goto :goto_2e

    .line 168
    .end local v0    # "e":Ljava/io/IOException;
    :catch_75
    move-exception v0

    .line 169
    .local v0, "e":Ljava/lang/OutOfMemoryError;
    :try_start_76
    new-instance v1, Ljava/io/StringWriter;

    invoke-direct {v1}, Ljava/io/StringWriter;-><init>()V

    .line 170
    .local v1, "writer":Ljava/io/StringWriter;
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->stats:Lit/sephiroth/android/library/picasso/Stats;

    invoke-virtual {v2}, Lit/sephiroth/android/library/picasso/Stats;->createSnapshot()Lit/sephiroth/android/library/picasso/StatsSnapshot;

    move-result-object v2

    new-instance v3, Ljava/io/PrintWriter;

    invoke-direct {v3, v1}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    invoke-virtual {v2, v3}, Lit/sephiroth/android/library/picasso/StatsSnapshot;->dump(Ljava/io/PrintWriter;)V

    .line 171
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-virtual {v1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    iput-object v2, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->exception:Ljava/lang/Exception;

    .line 172
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->dispatcher:Lit/sephiroth/android/library/picasso/Dispatcher;

    invoke-virtual {v2, p0}, Lit/sephiroth/android/library/picasso/Dispatcher;->dispatchFailed(Lit/sephiroth/android/library/picasso/BitmapHunter;)V
    :try_end_99
    .catchall {:try_start_76 .. :try_end_99} :catchall_b9

    .line 178
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    const-string v3, "Picasso-Idle"

    invoke-virtual {v2, v3}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    goto :goto_2e

    .line 173
    .end local v0    # "e":Ljava/lang/OutOfMemoryError;
    .end local v1    # "writer":Ljava/io/StringWriter;
    :catch_a3
    move-exception v0

    .line 174
    .local v0, "e":Ljava/lang/Exception;
    :try_start_a4
    iput-object v0, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->exception:Ljava/lang/Exception;

    .line 175
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->dispatcher:Lit/sephiroth/android/library/picasso/Dispatcher;

    invoke-virtual {v2, p0}, Lit/sephiroth/android/library/picasso/Dispatcher;->dispatchFailed(Lit/sephiroth/android/library/picasso/BitmapHunter;)V

    .line 176
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_ae
    .catchall {:try_start_a4 .. :try_end_ae} :catchall_b9

    .line 178
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    const-string v3, "Picasso-Idle"

    invoke-virtual {v2, v3}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    goto/16 :goto_2e

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_b9
    move-exception v2

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    const-string v4, "Picasso-Idle"

    invoke-virtual {v3, v4}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    throw v2
.end method

.method shouldRetry(ZLandroid/net/NetworkInfo;)Z
    .registers 6
    .param p1, "airplaneMode"    # Z
    .param p2, "info"    # Landroid/net/NetworkInfo;

    .prologue
    const/4 v1, 0x0

    .line 364
    iget v2, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->retryCount:I

    if-lez v2, :cond_9

    const/4 v0, 0x1

    .line 365
    .local v0, "hasRetries":Z
    :goto_6
    if-nez v0, :cond_b

    .line 369
    :goto_8
    return v1

    .end local v0    # "hasRetries":Z
    :cond_9
    move v0, v1

    .line 364
    goto :goto_6

    .line 368
    .restart local v0    # "hasRetries":Z
    :cond_b
    iget v1, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->retryCount:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->retryCount:I

    .line 369
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->requestHandler:Lit/sephiroth/android/library/picasso/RequestHandler;

    invoke-virtual {v1, p1, p2}, Lit/sephiroth/android/library/picasso/RequestHandler;->shouldRetry(ZLandroid/net/NetworkInfo;)Z

    move-result v1

    goto :goto_8
.end method

.method supportsReplay()Z
    .registers 2

    .prologue
    .line 373
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/BitmapHunter;->requestHandler:Lit/sephiroth/android/library/picasso/RequestHandler;

    invoke-virtual {v0}, Lit/sephiroth/android/library/picasso/RequestHandler;->supportsReplay()Z

    move-result v0

    return v0
.end method
