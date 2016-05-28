.class public Lcom/nostra13/universalimageloader/cache/memory/impl/LruMemoryCache;
.super Ljava/lang/Object;
.source "LruMemoryCache.java"

# interfaces
.implements Lcom/nostra13/universalimageloader/cache/memory/MemoryCache;


# instance fields
.field private final map:Ljava/util/LinkedHashMap;
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

.field private size:I


# direct methods
.method public constructor <init>(I)V
    .registers 6
    .param p1, "maxSize"    # I

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    if-gtz p1, :cond_d

    .line 33
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "maxSize <= 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 35
    :cond_d
    iput p1, p0, Lcom/nostra13/universalimageloader/cache/memory/impl/LruMemoryCache;->maxSize:I

    .line 36
    new-instance v0, Ljava/util/LinkedHashMap;

    const/4 v1, 0x0

    const/high16 v2, 0x3f400000

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    iput-object v0, p0, Lcom/nostra13/universalimageloader/cache/memory/impl/LruMemoryCache;->map:Ljava/util/LinkedHashMap;

    .line 37
    return-void
.end method

.method private sizeOf(Ljava/lang/String;Landroid/graphics/Bitmap;)I
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Landroid/graphics/Bitmap;

    .prologue
    .line 136
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getRowBytes()I

    move-result v0

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    mul-int/2addr v0, v1

    return v0
.end method

.method private trimToSize(I)V
    .registers 8
    .param p1, "maxSize"    # I

    .prologue
    .line 82
    :goto_0
    monitor-enter p0

    .line 83
    :try_start_1
    iget v3, p0, Lcom/nostra13/universalimageloader/cache/memory/impl/LruMemoryCache;->size:I

    if-ltz v3, :cond_11

    iget-object v3, p0, Lcom/nostra13/universalimageloader/cache/memory/impl/LruMemoryCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_35

    iget v3, p0, Lcom/nostra13/universalimageloader/cache/memory/impl/LruMemoryCache;->size:I

    if-eqz v3, :cond_35

    .line 84
    :cond_11
    new-instance v3, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

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

    .line 99
    :catchall_32
    move-exception v3

    monitor-exit p0
    :try_end_34
    .catchall {:try_start_1 .. :try_end_34} :catchall_32

    throw v3

    .line 87
    :cond_35
    :try_start_35
    iget v3, p0, Lcom/nostra13/universalimageloader/cache/memory/impl/LruMemoryCache;->size:I

    if-le v3, p1, :cond_41

    iget-object v3, p0, Lcom/nostra13/universalimageloader/cache/memory/impl/LruMemoryCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_43

    .line 88
    :cond_41
    monitor-exit p0

    .line 101
    :goto_42
    return-void

    .line 91
    :cond_43
    iget-object v3, p0, Lcom/nostra13/universalimageloader/cache/memory/impl/LruMemoryCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 92
    .local v1, "toEvict":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Landroid/graphics/Bitmap;>;"
    if-nez v1, :cond_57

    .line 93
    monitor-exit p0

    goto :goto_42

    .line 95
    :cond_57
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 96
    .local v0, "key":Ljava/lang/String;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/Bitmap;

    .line 97
    .local v2, "value":Landroid/graphics/Bitmap;
    iget-object v3, p0, Lcom/nostra13/universalimageloader/cache/memory/impl/LruMemoryCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, v0}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    iget v3, p0, Lcom/nostra13/universalimageloader/cache/memory/impl/LruMemoryCache;->size:I

    invoke-direct {p0, v0, v2}, Lcom/nostra13/universalimageloader/cache/memory/impl/LruMemoryCache;->sizeOf(Ljava/lang/String;Landroid/graphics/Bitmap;)I

    move-result v4

    sub-int/2addr v3, v4

    iput v3, p0, Lcom/nostra13/universalimageloader/cache/memory/impl/LruMemoryCache;->size:I

    .line 99
    monitor-exit p0
    :try_end_72
    .catchall {:try_start_35 .. :try_end_72} :catchall_32

    goto :goto_0
.end method


# virtual methods
.method public final get(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 45
    if-nez p1, :cond_a

    .line 46
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "key == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 49
    :cond_a
    monitor-enter p0

    .line 50
    :try_start_b
    iget-object v0, p0, Lcom/nostra13/universalimageloader/cache/memory/impl/LruMemoryCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    monitor-exit p0

    return-object v0

    .line 51
    :catchall_15
    move-exception v0

    monitor-exit p0
    :try_end_17
    .catchall {:try_start_b .. :try_end_17} :catchall_15

    throw v0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 22
    check-cast p1, Ljava/lang/String;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/nostra13/universalimageloader/cache/memory/impl/LruMemoryCache;->get(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public keys()Ljava/util/Collection;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 120
    monitor-enter p0

    .line 121
    :try_start_1
    new-instance v0, Ljava/util/HashSet;

    iget-object v1, p0, Lcom/nostra13/universalimageloader/cache/memory/impl/LruMemoryCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    monitor-exit p0

    return-object v0

    .line 122
    :catchall_e
    move-exception v0

    monitor-exit p0
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_e

    throw v0
.end method

.method public bridge synthetic put(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 22
    check-cast p1, Ljava/lang/String;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Landroid/graphics/Bitmap;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/nostra13/universalimageloader/cache/memory/impl/LruMemoryCache;->put(Ljava/lang/String;Landroid/graphics/Bitmap;)Z

    move-result v0

    return v0
.end method

.method public final put(Ljava/lang/String;Landroid/graphics/Bitmap;)Z
    .registers 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Landroid/graphics/Bitmap;

    .prologue
    .line 57
    if-eqz p1, :cond_4

    if-nez p2, :cond_c

    .line 58
    :cond_4
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "key == null || value == null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 61
    :cond_c
    monitor-enter p0

    .line 62
    :try_start_d
    iget v1, p0, Lcom/nostra13/universalimageloader/cache/memory/impl/LruMemoryCache;->size:I

    invoke-direct {p0, p1, p2}, Lcom/nostra13/universalimageloader/cache/memory/impl/LruMemoryCache;->sizeOf(Ljava/lang/String;Landroid/graphics/Bitmap;)I

    move-result v2

    add-int/2addr v1, v2

    iput v1, p0, Lcom/nostra13/universalimageloader/cache/memory/impl/LruMemoryCache;->size:I

    .line 63
    iget-object v1, p0, Lcom/nostra13/universalimageloader/cache/memory/impl/LruMemoryCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p1, p2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 64
    .local v0, "previous":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_29

    .line 65
    iget v1, p0, Lcom/nostra13/universalimageloader/cache/memory/impl/LruMemoryCache;->size:I

    invoke-direct {p0, p1, v0}, Lcom/nostra13/universalimageloader/cache/memory/impl/LruMemoryCache;->sizeOf(Ljava/lang/String;Landroid/graphics/Bitmap;)I

    move-result v2

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/nostra13/universalimageloader/cache/memory/impl/LruMemoryCache;->size:I

    .line 67
    :cond_29
    monitor-exit p0
    :try_end_2a
    .catchall {:try_start_d .. :try_end_2a} :catchall_31

    .line 69
    iget v1, p0, Lcom/nostra13/universalimageloader/cache/memory/impl/LruMemoryCache;->maxSize:I

    invoke-direct {p0, v1}, Lcom/nostra13/universalimageloader/cache/memory/impl/LruMemoryCache;->trimToSize(I)V

    .line 70
    const/4 v1, 0x1

    return v1

    .line 67
    .end local v0    # "previous":Landroid/graphics/Bitmap;
    :catchall_31
    move-exception v1

    :try_start_32
    monitor-exit p0
    :try_end_33
    .catchall {:try_start_32 .. :try_end_33} :catchall_31

    throw v1
.end method

.method public bridge synthetic remove(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 22
    check-cast p1, Ljava/lang/String;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/nostra13/universalimageloader/cache/memory/impl/LruMemoryCache;->remove(Ljava/lang/String;)V

    return-void
.end method

.method public final remove(Ljava/lang/String;)V
    .registers 5
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 106
    if-nez p1, :cond_a

    .line 107
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "key == null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 110
    :cond_a
    monitor-enter p0

    .line 111
    :try_start_b
    iget-object v1, p0, Lcom/nostra13/universalimageloader/cache/memory/impl/LruMemoryCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p1}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 112
    .local v0, "previous":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_1e

    .line 113
    iget v1, p0, Lcom/nostra13/universalimageloader/cache/memory/impl/LruMemoryCache;->size:I

    invoke-direct {p0, p1, v0}, Lcom/nostra13/universalimageloader/cache/memory/impl/LruMemoryCache;->sizeOf(Ljava/lang/String;Landroid/graphics/Bitmap;)I

    move-result v2

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/nostra13/universalimageloader/cache/memory/impl/LruMemoryCache;->size:I

    .line 115
    :cond_1e
    monitor-exit p0

    .line 116
    return-void

    .line 115
    .end local v0    # "previous":Landroid/graphics/Bitmap;
    :catchall_20
    move-exception v1

    monitor-exit p0
    :try_end_22
    .catchall {:try_start_b .. :try_end_22} :catchall_20

    throw v1
.end method

.method public final declared-synchronized toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 141
    monitor-enter p0

    :try_start_1
    const-string v0, "LruCache[maxSize=%d]"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget v3, p0, Lcom/nostra13/universalimageloader/cache/memory/impl/LruMemoryCache;->maxSize:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_12
    .catchall {:try_start_1 .. :try_end_12} :catchall_15

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_15
    move-exception v0

    monitor-exit p0

    throw v0
.end method
