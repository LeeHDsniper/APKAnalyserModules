.class public Lorg/apache/http/impl/client/BasicCredentialsProvider;
.super Ljava/lang/Object;
.source "BasicCredentialsProvider.java"

# interfaces
.implements Lorg/apache/http/client/CredentialsProvider;


# annotations
.annotation build Lorg/apache/http/annotation/ThreadSafe;
.end annotation


# instance fields
.field private final credMap:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Lorg/apache/http/auth/AuthScope;",
            "Lorg/apache/http/auth/Credentials;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/BasicCredentialsProvider;->credMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 54
    return-void
.end method

.method private static matchCredentials(Ljava/util/Map;Lorg/apache/http/auth/AuthScope;)Lorg/apache/http/auth/Credentials;
    .registers 9
    .param p1, "authscope"    # Lorg/apache/http/auth/AuthScope;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Lorg/apache/http/auth/AuthScope;",
            "Lorg/apache/http/auth/Credentials;",
            ">;",
            "Lorg/apache/http/auth/AuthScope;",
            ")",
            "Lorg/apache/http/auth/Credentials;"
        }
    .end annotation

    .prologue
    .line 75
    .local p0, "map":Ljava/util/Map;, "Ljava/util/Map<Lorg/apache/http/auth/AuthScope;Lorg/apache/http/auth/Credentials;>;"
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/http/auth/Credentials;

    .line 76
    .local v2, "creds":Lorg/apache/http/auth/Credentials;
    if-nez v2, :cond_2f

    .line 79
    const/4 v1, -0x1

    .line 80
    .local v1, "bestMatchFactor":I
    const/4 v0, 0x0

    .line 81
    .local v0, "bestMatch":Lorg/apache/http/auth/AuthScope;
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :cond_12
    :goto_12
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_27

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/http/auth/AuthScope;

    .line 82
    .local v3, "current":Lorg/apache/http/auth/AuthScope;
    invoke-virtual {p1, v3}, Lorg/apache/http/auth/AuthScope;->match(Lorg/apache/http/auth/AuthScope;)I

    move-result v4

    .line 83
    .local v4, "factor":I
    if-le v4, v1, :cond_12

    .line 84
    move v1, v4

    .line 85
    move-object v0, v3

    goto :goto_12

    .line 88
    .end local v3    # "current":Lorg/apache/http/auth/AuthScope;
    .end local v4    # "factor":I
    :cond_27
    if-eqz v0, :cond_2f

    .line 89
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "creds":Lorg/apache/http/auth/Credentials;
    check-cast v2, Lorg/apache/http/auth/Credentials;

    .line 92
    .end local v0    # "bestMatch":Lorg/apache/http/auth/AuthScope;
    .end local v1    # "bestMatchFactor":I
    .end local v5    # "i$":Ljava/util/Iterator;
    .restart local v2    # "creds":Lorg/apache/http/auth/Credentials;
    :cond_2f
    return-object v2
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 101
    iget-object v0, p0, Lorg/apache/http/impl/client/BasicCredentialsProvider;->credMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 102
    return-void
.end method

.method public getCredentials(Lorg/apache/http/auth/AuthScope;)Lorg/apache/http/auth/Credentials;
    .registers 3
    .param p1, "authscope"    # Lorg/apache/http/auth/AuthScope;

    .prologue
    .line 96
    const-string v0, "Authentication scope"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 97
    iget-object v0, p0, Lorg/apache/http/impl/client/BasicCredentialsProvider;->credMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {v0, p1}, Lorg/apache/http/impl/client/BasicCredentialsProvider;->matchCredentials(Ljava/util/Map;Lorg/apache/http/auth/AuthScope;)Lorg/apache/http/auth/Credentials;

    move-result-object v0

    return-object v0
.end method

.method public setCredentials(Lorg/apache/http/auth/AuthScope;Lorg/apache/http/auth/Credentials;)V
    .registers 4
    .param p1, "authscope"    # Lorg/apache/http/auth/AuthScope;
    .param p2, "credentials"    # Lorg/apache/http/auth/Credentials;

    .prologue
    .line 59
    const-string v0, "Authentication scope"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 60
    iget-object v0, p0, Lorg/apache/http/impl/client/BasicCredentialsProvider;->credMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 106
    iget-object v0, p0, Lorg/apache/http/impl/client/BasicCredentialsProvider;->credMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
