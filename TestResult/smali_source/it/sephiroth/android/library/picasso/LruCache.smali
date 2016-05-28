.class public Lit/sephiroth/android/library/picasso/LruCache;
.super Ljava/lang/Object;
.source "LruCache.java"

# interfaces
.implements Lit/sephiroth/android/library/picasso/Cache;


# instance fields
.field private evictionCount:I

.field private hitCount:I

.field final map:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private final maxSize:I

.field private missCount:I

.field private putCount:I

.field private size:I


# direct methods
.method public constructor <init>(I)V
    .registers 6
    .param p1, "maxSize"    # I

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    if-gtz p1, :cond_d

    .line 43
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Max size must be positive."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 45
    :cond_d
    iput p1, p0, Lit/sephiroth/android/library/picasso/LruCache;->maxSize:I

    .line 46
    new-instance v0, Ljava/util/LinkedHashMap;

    const/4 v1, 0x0

    const/high16 v2, 0x3f400000

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    iput-object v0, p0, Lit/sephiroth/android/library/picasso/LruCache;->map:Ljava/util/LinkedHashMap;

    .line 47
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 37
    invoke-static {p1}, Lit/sephiroth/android/library/picasso/Utils;->calculateMemoryCacheSize(Landroid/content/Context;)I

    move-result v0

    invoke-direct {p0, v0}, Lit/sephiroth/android/library/picasso/LruCache;-><init>(I)V

    .line 38
    return-void
.end method

.method private trimToSize(I)V
    .registers 8
    .param p1, "maxSize"    # I

    .prologue
    .line 89
    :goto_0
    monitor-enter p0

    .line 90
    :try_start_1
    iget v3, p0, Lit/sephiroth/android/library/picasso/LruCache;->size:I

    if-ltz v3, :cond_11

    iget-object v3, p0, Lit/sephiroth/android/library/picasso/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_35

    iget v3, p0, Lit/sephiroth/android/library/picasso/LruCache;->size:I

    if-eqz v3, :cond_35

    .line 91
    :cond_11
    new-instance v3, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 92
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".sizeOf() is reporting inconsistent results!"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 105
    :catchall_32
    move-exception v3

    monitor-exit p0
    :try_end_34
    .catchall {:try_start_1 .. :try_end_34} :catchall_32

    throw v3

    .line 95
    :cond_35
    :try_start_35
    iget v3, p0, Lit/sephiroth/android/library/picasso/LruCache;->size:I

    if-le v3, p1, :cond_41

    iget-object v3, p0, Lit/sephiroth/android/library/picasso/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_43

    .line 96
    :cond_41
    monitor-exit p0

    .line 107
    return-void

    .line 99
    :cond_43
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 100
    .local v1, "toEvict":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Landroid/graphics/Bitmap;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 101
    .local v0, "key":Ljava/lang/String;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/Bitmap;

    .line 102
    .local v2, "value":Landroid/graphics/Bitmap;
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, v0}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    iget v3, p0, Lit/sephiroth/android/library/picasso/LruCache;->size:I

    invoke-static {v2}, Lit/sephiroth/android/library/picasso/Utils;->getBitmapBytes(Landroid/graphics/Bitmap;)I

    move-result v4

    sub-int/2addr v3, v4

    iput v3, p0, Lit/sephiroth/android/library/picasso/LruCache;->size:I

    .line 104
    iget v3, p0, Lit/sephiroth/android/library/picasso/LruCache;->evictionCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lit/sephiroth/android/library/picasso/LruCache;->evictionCount:I

    .line 105
    monitor-exit p0
    :try_end_74
    .catchall {:try_start_35 .. :try_end_74} :catchall_32

    goto :goto_0
.end method


# virtual methods
.method public final declared-synchronized clear()V
    .registers 2

    .prologue
    .line 123
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lit/sephiroth/android/library/picasso/LruCache;->evictAll()V
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_6

    .line 124
    monitor-exit p0

    return-void

    .line 123
    :catchall_6
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final evictAll()V
    .registers 2

    .prologue
    .line 111
    const/4 v0, -0x1

    invoke-direct {p0, v0}, Lit/sephiroth/android/library/picasso/LruCache;->trimToSize(I)V

    .line 112
    return-void
.end method

.method public get(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 50
    if-nez p1, :cond_a

    .line 51
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "key == null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 55
    :cond_a
    monitor-enter p0

    .line 56
    :try_start_b
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 57
    .local v0, "mapValue":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_1d

    .line 58
    iget v1, p0, Lit/sephiroth/android/library/picasso/LruCache;->hitCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lit/sephiroth/android/library/picasso/LruCache;->hitCount:I

    .line 59
    monitor-exit p0

    .line 64
    .end local v0    # "mapValue":Landroid/graphics/Bitmap;
    :goto_1c
    return-object v0

    .line 61
    .restart local v0    # "mapValue":Landroid/graphics/Bitmap;
    :cond_1d
    iget v1, p0, Lit/sephiroth/android/library/picasso/LruCache;->missCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lit/sephiroth/android/library/picasso/LruCache;->missCount:I

    .line 62
    monitor-exit p0

    .line 64
    const/4 v0, 0x0

    goto :goto_1c

    .line 62
    .end local v0    # "mapValue":Landroid/graphics/Bitmap;
    :catchall_26
    move-exception v1

    monitor-exit p0
    :try_end_28
    .catchall {:try_start_b .. :try_end_28} :catchall_26

    throw v1
.end method

.method public final declared-synchronized maxSize()I
    .registers 2

    .prologue
    .line 119
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lit/sephiroth/android/library/picasso/LruCache;->maxSize:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public set(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .registers 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 68
    if-eqz p1, :cond_4

    if-nez p2, :cond_c

    .line 69
    :cond_4
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "key == null || bitmap == null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 73
    :cond_c
    monitor-enter p0

    .line 74
    :try_start_d
    iget v1, p0, Lit/sephiroth/android/library/picasso/LruCache;->putCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lit/sephiroth/android/library/picasso/LruCache;->putCount:I

    .line 75
    iget v1, p0, Lit/sephiroth/android/library/picasso/LruCache;->size:I

    invoke-static {p2}, Lit/sephiroth/android/library/picasso/Utils;->getBitmapBytes(Landroid/graphics/Bitmap;)I

    move-result v2

    add-int/2addr v1, v2

    iput v1, p0, Lit/sephiroth/android/library/picasso/LruCache;->size:I

    .line 76
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p1, p2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 77
    .local v0, "previous":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_2f

    .line 78
    iget v1, p0, Lit/sephiroth/android/library/picasso/LruCache;->size:I

    invoke-static {v0}, Lit/sephiroth/android/library/picasso/Utils;->getBitmapBytes(Landroid/graphics/Bitmap;)I

    move-result v2

    sub-int/2addr v1, v2

    iput v1, p0, Lit/sephiroth/android/library/picasso/LruCache;->size:I

    .line 80
    :cond_2f
    monitor-exit p0
    :try_end_30
    .catchall {:try_start_d .. :try_end_30} :catchall_36

    .line 82
    iget v1, p0, Lit/sephiroth/android/library/picasso/LruCache;->maxSize:I

    invoke-direct {p0, v1}, Lit/sephiroth/android/library/picasso/LruCache;->trimToSize(I)V

    .line 83
    return-void

    .line 80
    .end local v0    # "previous":Landroid/graphics/Bitmap;
    :catchall_36
    move-exception v1

    :try_start_37
    monitor-exit p0
    :try_end_38
    .catchall {:try_start_37 .. :try_end_38} :catchall_36

    throw v1
.end method

.method public final declared-synchronized size()I
    .registers 2

    .prologue
    .line 115
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lit/sephiroth/android/library/picasso/LruCache;->size:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method
