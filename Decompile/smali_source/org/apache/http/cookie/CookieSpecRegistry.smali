.class public final Lorg/apache/http/cookie/CookieSpecRegistry;
.super Ljava/lang/Object;
.source "CookieSpecRegistry.java"

# interfaces
.implements Lorg/apache/http/config/Lookup;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/apache/http/config/Lookup",
        "<",
        "Lorg/apache/http/cookie/CookieSpecProvider;",
        ">;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/ThreadSafe;
.end annotation


# instance fields
.field private final registeredSpecs:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/String;",
            "Lorg/apache/http/cookie/CookieSpecFactory;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/http/cookie/CookieSpecRegistry;->registeredSpecs:Ljava/util/concurrent/ConcurrentHashMap;

    .line 62
    return-void
.end method


# virtual methods
.method public getCookieSpec(Ljava/lang/String;)Lorg/apache/http/cookie/CookieSpec;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 125
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/http/cookie/CookieSpecRegistry;->getCookieSpec(Ljava/lang/String;Lorg/apache/http/params/HttpParams;)Lorg/apache/http/cookie/CookieSpec;

    move-result-object v0

    return-object v0
.end method

.method public getCookieSpec(Ljava/lang/String;Lorg/apache/http/params/HttpParams;)Lorg/apache/http/cookie/CookieSpec;
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 105
    const-string v1, "Name"

    invoke-static {p1, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 106
    iget-object v1, p0, Lorg/apache/http/cookie/CookieSpecRegistry;->registeredSpecs:Ljava/util/concurrent/ConcurrentHashMap;

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/cookie/CookieSpecFactory;

    .line 107
    .local v0, "factory":Lorg/apache/http/cookie/CookieSpecFactory;
    if-eqz v0, :cond_1a

    .line 108
    invoke-interface {v0, p2}, Lorg/apache/http/cookie/CookieSpecFactory;->newInstance(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/cookie/CookieSpec;

    move-result-object v1

    return-object v1

    .line 110
    :cond_1a
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unsupported cookie spec: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getSpecNames()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 138
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/apache/http/cookie/CookieSpecRegistry;->registeredSpecs:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentHashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public bridge synthetic lookup(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 53
    invoke-virtual {p0, p1}, Lorg/apache/http/cookie/CookieSpecRegistry;->lookup(Ljava/lang/String;)Lorg/apache/http/cookie/CookieSpecProvider;

    move-result-object v0

    return-object v0
.end method

.method public lookup(Ljava/lang/String;)Lorg/apache/http/cookie/CookieSpecProvider;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 156
    new-instance v0, Lorg/apache/http/cookie/CookieSpecRegistry$1;

    invoke-direct {v0, p0, p1}, Lorg/apache/http/cookie/CookieSpecRegistry$1;-><init>(Lorg/apache/http/cookie/CookieSpecRegistry;Ljava/lang/String;)V

    return-object v0
.end method

.method public register(Ljava/lang/String;Lorg/apache/http/cookie/CookieSpecFactory;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "factory"    # Lorg/apache/http/cookie/CookieSpecFactory;

    .prologue
    .line 76
    const-string v0, "Name"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 77
    const-string v0, "Cookie spec factory"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 78
    iget-object v0, p0, Lorg/apache/http/cookie/CookieSpecRegistry;->registeredSpecs:Ljava/util/concurrent/ConcurrentHashMap;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    return-void
.end method

.method public setItems(Ljava/util/Map;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/apache/http/cookie/CookieSpecFactory;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 148
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/apache/http/cookie/CookieSpecFactory;>;"
    if-nez p1, :cond_3

    .line 153
    :goto_2
    return-void

    .line 151
    :cond_3
    iget-object v0, p0, Lorg/apache/http/cookie/CookieSpecRegistry;->registeredSpecs:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 152
    iget-object v0, p0, Lorg/apache/http/cookie/CookieSpecRegistry;->registeredSpecs:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->putAll(Ljava/util/Map;)V

    goto :goto_2
.end method

.method public unregister(Ljava/lang/String;)V
    .registers 4
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 87
    const-string v0, "Id"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 88
    iget-object v0, p0, Lorg/apache/http/cookie/CookieSpecRegistry;->registeredSpecs:Ljava/util/concurrent/ConcurrentHashMap;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    return-void
.end method
