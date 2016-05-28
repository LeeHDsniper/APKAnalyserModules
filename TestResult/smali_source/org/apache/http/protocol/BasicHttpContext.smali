.class public Lorg/apache/http/protocol/BasicHttpContext;
.super Ljava/lang/Object;
.source "BasicHttpContext.java"

# interfaces
.implements Lorg/apache/http/protocol/HttpContext;


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private map:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final parentContext:Lorg/apache/http/protocol/HttpContext;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 51
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/http/protocol/BasicHttpContext;-><init>(Lorg/apache/http/protocol/HttpContext;)V

    .line 52
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/protocol/HttpContext;)V
    .registers 3
    .param p1, "parentContext"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/protocol/BasicHttpContext;->map:Ljava/util/Map;

    .line 56
    iput-object p1, p0, Lorg/apache/http/protocol/BasicHttpContext;->parentContext:Lorg/apache/http/protocol/HttpContext;

    .line 57
    return-void
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 92
    iget-object v0, p0, Lorg/apache/http/protocol/BasicHttpContext;->map:Ljava/util/Map;

    if-eqz v0, :cond_9

    .line 93
    iget-object v0, p0, Lorg/apache/http/protocol/BasicHttpContext;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 95
    :cond_9
    return-void
.end method

.method public getAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 60
    const-string v1, "Id"

    invoke-static {p1, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 61
    const/4 v0, 0x0

    .line 62
    .local v0, "obj":Ljava/lang/Object;
    iget-object v1, p0, Lorg/apache/http/protocol/BasicHttpContext;->map:Ljava/util/Map;

    if-eqz v1, :cond_10

    .line 63
    iget-object v1, p0, Lorg/apache/http/protocol/BasicHttpContext;->map:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 65
    .end local v0    # "obj":Ljava/lang/Object;
    :cond_10
    if-nez v0, :cond_1c

    iget-object v1, p0, Lorg/apache/http/protocol/BasicHttpContext;->parentContext:Lorg/apache/http/protocol/HttpContext;

    if-eqz v1, :cond_1c

    .line 66
    iget-object v1, p0, Lorg/apache/http/protocol/BasicHttpContext;->parentContext:Lorg/apache/http/protocol/HttpContext;

    invoke-interface {v1, p1}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 68
    :cond_1c
    return-object v0
.end method

.method public removeAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 80
    const-string v0, "Id"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 81
    iget-object v0, p0, Lorg/apache/http/protocol/BasicHttpContext;->map:Ljava/util/Map;

    if-eqz v0, :cond_10

    .line 82
    iget-object v0, p0, Lorg/apache/http/protocol/BasicHttpContext;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 84
    :goto_f
    return-object v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "obj"    # Ljava/lang/Object;

    .prologue
    .line 72
    const-string v0, "Id"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 73
    iget-object v0, p0, Lorg/apache/http/protocol/BasicHttpContext;->map:Ljava/util/Map;

    if-nez v0, :cond_10

    .line 74
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/http/protocol/BasicHttpContext;->map:Ljava/util/Map;

    .line 76
    :cond_10
    iget-object v0, p0, Lorg/apache/http/protocol/BasicHttpContext;->map:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 99
    iget-object v0, p0, Lorg/apache/http/protocol/BasicHttpContext;->map:Ljava/util/Map;

    if-eqz v0, :cond_b

    .line 100
    iget-object v0, p0, Lorg/apache/http/protocol/BasicHttpContext;->map:Ljava/util/Map;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 102
    :goto_a
    return-object v0

    :cond_b
    const-string v0, "{}"

    goto :goto_a
.end method
