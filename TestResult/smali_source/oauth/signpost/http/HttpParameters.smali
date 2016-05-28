.class public Loauth/signpost/http/HttpParameters;
.super Ljava/lang/Object;
.source "HttpParameters.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Ljava/util/Map;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/io/Serializable;",
        "Ljava/util/Map",
        "<",
        "Ljava/lang/String;",
        "Ljava/util/SortedSet",
        "<",
        "Ljava/lang/String;",
        ">;>;"
    }
.end annotation


# instance fields
.field private wrappedMap:Ljava/util/TreeMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/SortedSet",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Loauth/signpost/http/HttpParameters;->wrappedMap:Ljava/util/TreeMap;

    return-void
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 274
    iget-object v0, p0, Loauth/signpost/http/HttpParameters;->wrappedMap:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->clear()V

    .line 275
    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 249
    iget-object v0, p0, Loauth/signpost/http/HttpParameters;->wrappedMap:Ljava/util/TreeMap;

    invoke-virtual {v0, p1}, Ljava/util/TreeMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 253
    iget-object v2, p0, Loauth/signpost/http/HttpParameters;->wrappedMap:Ljava/util/TreeMap;

    invoke-virtual {v2}, Ljava/util/TreeMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/SortedSet;

    .line 254
    .local v1, "values":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v1, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 255
    const/4 v2, 0x1

    .line 258
    .end local v1    # "values":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :goto_1d
    return v2

    :cond_1e
    const/4 v2, 0x0

    goto :goto_1d
.end method

.method public entrySet()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/SortedSet",
            "<",
            "Ljava/lang/String;",
            ">;>;>;"
        }
    .end annotation

    .prologue
    .line 290
    iget-object v0, p0, Loauth/signpost/http/HttpParameters;->wrappedMap:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 40
    invoke-virtual {p0, p1}, Loauth/signpost/http/HttpParameters;->get(Ljava/lang/Object;)Ljava/util/SortedSet;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/Object;)Ljava/util/SortedSet;
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/SortedSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 156
    iget-object v0, p0, Loauth/signpost/http/HttpParameters;->wrappedMap:Ljava/util/TreeMap;

    invoke-virtual {v0, p1}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/SortedSet;

    return-object v0
.end method

.method public getAsHeaderElement(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 241
    invoke-virtual {p0, p1}, Loauth/signpost/http/HttpParameters;->getFirst(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 242
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_8

    .line 243
    const/4 v1, 0x0

    .line 245
    :goto_7
    return-object v1

    :cond_8
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_7
.end method

.method public getAsQueryString(Ljava/lang/Object;Z)Ljava/lang/String;
    .registers 8
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "percentEncode"    # Z

    .prologue
    .line 223
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 224
    .local v1, "sb":Ljava/lang/StringBuilder;
    if-eqz p2, :cond_d

    .line 225
    check-cast p1, Ljava/lang/String;

    .end local p1    # "key":Ljava/lang/Object;
    invoke-static {p1}, Loauth/signpost/OAuth;->percentEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 226
    :cond_d
    iget-object v3, p0, Loauth/signpost/http/HttpParameters;->wrappedMap:Ljava/util/TreeMap;

    invoke-virtual {v3, p1}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Set;

    .line 227
    .local v2, "values":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    if-nez v2, :cond_2b

    .line 228
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 237
    :goto_2a
    return-object v3

    .line 230
    :cond_2b
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 231
    .local v0, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_2f
    :goto_2f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_61

    .line 232
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2f

    .line 234
    const-string v3, "&"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2f

    .line 237
    :cond_61
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_2a
.end method

.method public getFirst(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 168
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Loauth/signpost/http/HttpParameters;->getFirst(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFirst(Ljava/lang/Object;Z)Ljava/lang/String;
    .registers 6
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "percentDecode"    # Z

    .prologue
    .line 187
    iget-object v2, p0, Loauth/signpost/http/HttpParameters;->wrappedMap:Ljava/util/TreeMap;

    invoke-virtual {v2, p1}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/SortedSet;

    .line 188
    .local v1, "values":Ljava/util/SortedSet;, "Ljava/util/SortedSet<Ljava/lang/String;>;"
    if-eqz v1, :cond_10

    invoke-interface {v1}, Ljava/util/SortedSet;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_12

    .line 189
    :cond_10
    const/4 v0, 0x0

    .line 192
    :cond_11
    :goto_11
    return-object v0

    .line 191
    :cond_12
    invoke-interface {v1}, Ljava/util/SortedSet;->first()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 192
    .local v0, "value":Ljava/lang/String;
    if-eqz p2, :cond_11

    invoke-static {v0}, Loauth/signpost/OAuth;->percentDecode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_11
.end method

.method public getOAuthParameters()Loauth/signpost/http/HttpParameters;
    .registers 6

    .prologue
    .line 294
    new-instance v2, Loauth/signpost/http/HttpParameters;

    invoke-direct {v2}, Loauth/signpost/http/HttpParameters;-><init>()V

    .line 296
    .local v2, "oauthParams":Loauth/signpost/http/HttpParameters;
    invoke-virtual {p0}, Loauth/signpost/http/HttpParameters;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_d
    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_39

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 297
    .local v3, "param":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/SortedSet<Ljava/lang/String;>;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 298
    .local v1, "key":Ljava/lang/String;
    const-string v4, "oauth_"

    invoke-virtual {v1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2f

    const-string v4, "x_oauth_"

    invoke-virtual {v1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_d

    .line 299
    :cond_2f
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/SortedSet;

    invoke-virtual {v2, v1, v4}, Loauth/signpost/http/HttpParameters;->put(Ljava/lang/String;Ljava/util/SortedSet;)Ljava/util/SortedSet;

    goto :goto_d

    .line 303
    .end local v1    # "key":Ljava/lang/String;
    .end local v3    # "param":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/SortedSet<Ljava/lang/String;>;>;"
    :cond_39
    return-object v2
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 270
    iget-object v0, p0, Loauth/signpost/http/HttpParameters;->wrappedMap:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public keySet()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 282
    iget-object v0, p0, Loauth/signpost/http/HttpParameters;->wrappedMap:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 40
    check-cast p1, Ljava/lang/String;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Ljava/util/SortedSet;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Loauth/signpost/http/HttpParameters;->put(Ljava/lang/String;Ljava/util/SortedSet;)Ljava/util/SortedSet;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 72
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Loauth/signpost/http/HttpParameters;->put(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .registers 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "percentEncode"    # Z

    .prologue
    .line 90
    if-eqz p3, :cond_6

    invoke-static {p1}, Loauth/signpost/OAuth;->percentEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 91
    :cond_6
    iget-object v1, p0, Loauth/signpost/http/HttpParameters;->wrappedMap:Ljava/util/TreeMap;

    invoke-virtual {v1, p1}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/SortedSet;

    .line 92
    .local v0, "values":Ljava/util/SortedSet;, "Ljava/util/SortedSet<Ljava/lang/String;>;"
    if-nez v0, :cond_1a

    .line 93
    new-instance v0, Ljava/util/TreeSet;

    .end local v0    # "values":Ljava/util/SortedSet;, "Ljava/util/SortedSet<Ljava/lang/String;>;"
    invoke-direct {v0}, Ljava/util/TreeSet;-><init>()V

    .line 94
    .restart local v0    # "values":Ljava/util/SortedSet;, "Ljava/util/SortedSet<Ljava/lang/String;>;"
    iget-object v1, p0, Loauth/signpost/http/HttpParameters;->wrappedMap:Ljava/util/TreeMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    :cond_1a
    if-eqz p2, :cond_25

    .line 97
    if-eqz p3, :cond_22

    invoke-static {p2}, Loauth/signpost/OAuth;->percentEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 98
    :cond_22
    invoke-interface {v0, p2}, Ljava/util/SortedSet;->add(Ljava/lang/Object;)Z

    .line 101
    :cond_25
    return-object p2
.end method

.method public put(Ljava/lang/String;Ljava/util/SortedSet;)Ljava/util/SortedSet;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/SortedSet",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/SortedSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 46
    .local p2, "value":Ljava/util/SortedSet;, "Ljava/util/SortedSet<Ljava/lang/String;>;"
    iget-object v0, p0, Loauth/signpost/http/HttpParameters;->wrappedMap:Ljava/util/TreeMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/SortedSet;

    return-object v0
.end method

.method public put(Ljava/lang/String;Ljava/util/SortedSet;Z)Ljava/util/SortedSet;
    .registers 7
    .param p1, "key"    # Ljava/lang/String;
    .param p3, "percentEncode"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/SortedSet",
            "<",
            "Ljava/lang/String;",
            ">;Z)",
            "Ljava/util/SortedSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 50
    .local p2, "values":Ljava/util/SortedSet;, "Ljava/util/SortedSet<Ljava/lang/String;>;"
    if-eqz p3, :cond_1f

    .line 51
    invoke-virtual {p0, p1}, Loauth/signpost/http/HttpParameters;->remove(Ljava/lang/Object;)Ljava/util/SortedSet;

    .line 52
    invoke-interface {p2}, Ljava/util/SortedSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 53
    .local v1, "v":Ljava/lang/String;
    const/4 v2, 0x1

    invoke-virtual {p0, p1, v1, v2}, Loauth/signpost/http/HttpParameters;->put(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    goto :goto_9

    .line 55
    .end local v1    # "v":Ljava/lang/String;
    :cond_1a
    invoke-virtual {p0, p1}, Loauth/signpost/http/HttpParameters;->get(Ljava/lang/Object;)Ljava/util/SortedSet;

    move-result-object v2

    .line 57
    .end local v0    # "i$":Ljava/util/Iterator;
    :goto_1e
    return-object v2

    :cond_1f
    iget-object v2, p0, Loauth/signpost/http/HttpParameters;->wrappedMap:Ljava/util/TreeMap;

    invoke-virtual {v2, p1, p2}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/SortedSet;

    goto :goto_1e
.end method

.method public putAll(Ljava/util/Map;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<+",
            "Ljava/lang/String;",
            "+",
            "Ljava/util/SortedSet",
            "<",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 119
    .local p1, "m":Ljava/util/Map;, "Ljava/util/Map<+Ljava/lang/String;+Ljava/util/SortedSet<Ljava/lang/String;>;>;"
    iget-object v0, p0, Loauth/signpost/http/HttpParameters;->wrappedMap:Ljava/util/TreeMap;

    invoke-virtual {v0, p1}, Ljava/util/TreeMap;->putAll(Ljava/util/Map;)V

    .line 120
    return-void
.end method

.method public putAll(Ljava/util/Map;Z)V
    .registers 7
    .param p2, "percentEncode"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<+",
            "Ljava/lang/String;",
            "+",
            "Ljava/util/SortedSet",
            "<",
            "Ljava/lang/String;",
            ">;>;Z)V"
        }
    .end annotation

    .prologue
    .line 123
    .local p1, "m":Ljava/util/Map;, "Ljava/util/Map<+Ljava/lang/String;+Ljava/util/SortedSet<Ljava/lang/String;>;>;"
    if-eqz p2, :cond_21

    .line 124
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_26

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 125
    .local v1, "key":Ljava/lang/String;
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/SortedSet;

    const/4 v3, 0x1

    invoke-virtual {p0, v1, v2, v3}, Loauth/signpost/http/HttpParameters;->put(Ljava/lang/String;Ljava/util/SortedSet;Z)Ljava/util/SortedSet;

    goto :goto_a

    .line 128
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "key":Ljava/lang/String;
    :cond_21
    iget-object v2, p0, Loauth/signpost/http/HttpParameters;->wrappedMap:Ljava/util/TreeMap;

    invoke-virtual {v2, p1}, Ljava/util/TreeMap;->putAll(Ljava/util/Map;)V

    .line 130
    :cond_26
    return-void
.end method

.method public putAll([Ljava/lang/String;Z)V
    .registers 6
    .param p1, "keyValuePairs"    # [Ljava/lang/String;
    .param p2, "percentEncode"    # Z

    .prologue
    .line 133
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_12

    .line 134
    aget-object v1, p1, v0

    add-int/lit8 v2, v0, 0x1

    aget-object v2, p1, v2

    invoke-virtual {p0, v1, v2, p2}, Loauth/signpost/http/HttpParameters;->put(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    .line 133
    add-int/lit8 v0, v0, 0x2

    goto :goto_1

    .line 136
    :cond_12
    return-void
.end method

.method public bridge synthetic remove(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 40
    invoke-virtual {p0, p1}, Loauth/signpost/http/HttpParameters;->remove(Ljava/lang/Object;)Ljava/util/SortedSet;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Ljava/util/SortedSet;
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/SortedSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 278
    iget-object v0, p0, Loauth/signpost/http/HttpParameters;->wrappedMap:Ljava/util/TreeMap;

    invoke-virtual {v0, p1}, Ljava/util/TreeMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/SortedSet;

    return-object v0
.end method

.method public size()I
    .registers 5

    .prologue
    .line 262
    const/4 v0, 0x0

    .line 263
    .local v0, "count":I
    iget-object v3, p0, Loauth/signpost/http/HttpParameters;->wrappedMap:Ljava/util/TreeMap;

    invoke-virtual {v3}, Ljava/util/TreeMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_25

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 264
    .local v2, "key":Ljava/lang/String;
    iget-object v3, p0, Loauth/signpost/http/HttpParameters;->wrappedMap:Ljava/util/TreeMap;

    invoke-virtual {v3, v2}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/SortedSet;

    invoke-interface {v3}, Ljava/util/SortedSet;->size()I

    move-result v3

    add-int/2addr v0, v3

    goto :goto_b

    .line 266
    .end local v2    # "key":Ljava/lang/String;
    :cond_25
    return v0
.end method

.method public values()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Ljava/util/SortedSet",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 286
    iget-object v0, p0, Loauth/signpost/http/HttpParameters;->wrappedMap:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method
