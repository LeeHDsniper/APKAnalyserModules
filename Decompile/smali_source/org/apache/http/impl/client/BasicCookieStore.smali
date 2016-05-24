.class public Lorg/apache/http/impl/client/BasicCookieStore;
.super Ljava/lang/Object;
.source "BasicCookieStore.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Lorg/apache/http/client/CookieStore;


# annotations
.annotation build Lorg/apache/http/annotation/ThreadSafe;
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x69357431db388559L


# instance fields
.field private final cookies:Ljava/util/TreeSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeSet",
            "<",
            "Lorg/apache/http/cookie/Cookie;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    new-instance v0, Ljava/util/TreeSet;

    new-instance v1, Lorg/apache/http/cookie/CookieIdentityComparator;

    invoke-direct {v1}, Lorg/apache/http/cookie/CookieIdentityComparator;-><init>()V

    invoke-direct {v0, v1}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    iput-object v0, p0, Lorg/apache/http/impl/client/BasicCookieStore;->cookies:Ljava/util/TreeSet;

    .line 59
    return-void
.end method


# virtual methods
.method public declared-synchronized addCookie(Lorg/apache/http/cookie/Cookie;)V
    .registers 3
    .param p1, "cookie"    # Lorg/apache/http/cookie/Cookie;

    .prologue
    .line 72
    monitor-enter p0

    if-eqz p1, :cond_18

    .line 74
    :try_start_3
    iget-object v0, p0, Lorg/apache/http/impl/client/BasicCookieStore;->cookies:Ljava/util/TreeSet;

    invoke-virtual {v0, p1}, Ljava/util/TreeSet;->remove(Ljava/lang/Object;)Z

    .line 75
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-interface {p1, v0}, Lorg/apache/http/cookie/Cookie;->isExpired(Ljava/util/Date;)Z

    move-result v0

    if-nez v0, :cond_18

    .line 76
    iget-object v0, p0, Lorg/apache/http/impl/client/BasicCookieStore;->cookies:Ljava/util/TreeSet;

    invoke-virtual {v0, p1}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z
    :try_end_18
    .catchall {:try_start_3 .. :try_end_18} :catchall_1a

    .line 79
    :cond_18
    monitor-exit p0

    return-void

    .line 72
    :catchall_1a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addCookies([Lorg/apache/http/cookie/Cookie;)V
    .registers 7
    .param p1, "cookies"    # [Lorg/apache/http/cookie/Cookie;

    .prologue
    .line 92
    monitor-enter p0

    if-eqz p1, :cond_10

    .line 93
    move-object v0, p1

    .local v0, "arr$":[Lorg/apache/http/cookie/Cookie;
    :try_start_4
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_6
    if-ge v2, v3, :cond_10

    aget-object v1, v0, v2

    .line 94
    .local v1, "cooky":Lorg/apache/http/cookie/Cookie;
    invoke-virtual {p0, v1}, Lorg/apache/http/impl/client/BasicCookieStore;->addCookie(Lorg/apache/http/cookie/Cookie;)V
    :try_end_d
    .catchall {:try_start_4 .. :try_end_d} :catchall_12

    .line 93
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 97
    .end local v0    # "arr$":[Lorg/apache/http/cookie/Cookie;
    .end local v1    # "cooky":Lorg/apache/http/cookie/Cookie;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    :cond_10
    monitor-exit p0

    return-void

    .line 92
    .restart local v0    # "arr$":[Lorg/apache/http/cookie/Cookie;
    :catchall_12
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public declared-synchronized clear()V
    .registers 2

    .prologue
    .line 136
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/http/impl/client/BasicCookieStore;->cookies:Ljava/util/TreeSet;

    invoke-virtual {v0}, Ljava/util/TreeSet;->clear()V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 137
    monitor-exit p0

    return-void

    .line 136
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized clearExpired(Ljava/util/Date;)Z
    .registers 5
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 119
    monitor-enter p0

    if-nez p1, :cond_6

    .line 120
    const/4 v1, 0x0

    .line 129
    :cond_4
    monitor-exit p0

    return v1

    .line 122
    :cond_6
    const/4 v1, 0x0

    .line 123
    .local v1, "removed":Z
    :try_start_7
    iget-object v2, p0, Lorg/apache/http/impl/client/BasicCookieStore;->cookies:Ljava/util/TreeSet;

    invoke-virtual {v2}, Ljava/util/TreeSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/apache/http/cookie/Cookie;>;"
    :cond_d
    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 124
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/http/cookie/Cookie;

    invoke-interface {v2, p1}, Lorg/apache/http/cookie/Cookie;->isExpired(Ljava/util/Date;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 125
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V
    :try_end_22
    .catchall {:try_start_7 .. :try_end_22} :catchall_24

    .line 126
    const/4 v1, 0x1

    goto :goto_d

    .line 119
    .end local v0    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/apache/http/cookie/Cookie;>;"
    :catchall_24
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized getCookies()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/cookie/Cookie;",
            ">;"
        }
    .end annotation

    .prologue
    .line 107
    monitor-enter p0

    :try_start_1
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/apache/http/impl/client/BasicCookieStore;->cookies:Ljava/util/TreeSet;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_a

    monitor-exit p0

    return-object v0

    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 141
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/http/impl/client/BasicCookieStore;->cookies:Ljava/util/TreeSet;

    invoke-virtual {v0}, Ljava/util/TreeSet;->toString()Ljava/lang/String;
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method
