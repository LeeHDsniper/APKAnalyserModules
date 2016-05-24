.class public final Lcom/nostra13/universalimageloader/utils/MemoryCacheUtils;
.super Ljava/lang/Object;
.source "MemoryCacheUtils.java"


# direct methods
.method public static createFuzzyKeyComparator()Ljava/util/Comparator;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 51
    new-instance v0, Lcom/nostra13/universalimageloader/utils/MemoryCacheUtils$1;

    invoke-direct {v0}, Lcom/nostra13/universalimageloader/utils/MemoryCacheUtils$1;-><init>()V

    return-object v0
.end method

.method public static findCachedBitmapsForImageUri(Ljava/lang/String;Lcom/nostra13/universalimageloader/cache/memory/MemoryCache;)Ljava/util/List;
    .registers 6
    .param p0, "imageUri"    # Ljava/lang/String;
    .param p1, "memoryCache"    # Lcom/nostra13/universalimageloader/cache/memory/MemoryCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/nostra13/universalimageloader/cache/memory/MemoryCache;",
            ")",
            "Ljava/util/List",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .prologue
    .line 68
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 69
    .local v2, "values":Ljava/util/List;, "Ljava/util/List<Landroid/graphics/Bitmap;>;"
    invoke-interface {p1}, Lcom/nostra13/universalimageloader/cache/memory/MemoryCache;->keys()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_d
    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_27

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 70
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {v1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_d

    .line 71
    invoke-interface {p1, v1}, Lcom/nostra13/universalimageloader/cache/memory/MemoryCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_d

    .line 74
    .end local v1    # "key":Ljava/lang/String;
    :cond_27
    return-object v2
.end method

.method public static generateKey(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/assist/ImageSize;)Ljava/lang/String;
    .registers 4
    .param p0, "imageUri"    # Ljava/lang/String;
    .param p1, "targetSize"    # Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    .prologue
    .line 47
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;->getWidth()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;->getHeight()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
