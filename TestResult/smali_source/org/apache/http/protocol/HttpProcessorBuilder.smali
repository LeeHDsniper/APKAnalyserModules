.class public Lorg/apache/http/protocol/HttpProcessorBuilder;
.super Ljava/lang/Object;
.source "HttpProcessorBuilder.java"


# instance fields
.field private requestChainBuilder:Lorg/apache/http/protocol/ChainBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/http/protocol/ChainBuilder",
            "<",
            "Lorg/apache/http/HttpRequestInterceptor;",
            ">;"
        }
    .end annotation
.end field

.field private responseChainBuilder:Lorg/apache/http/protocol/ChainBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/http/protocol/ChainBuilder",
            "<",
            "Lorg/apache/http/HttpResponseInterceptor;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    return-void
.end method

.method public static create()Lorg/apache/http/protocol/HttpProcessorBuilder;
    .registers 1

    .prologue
    .line 44
    new-instance v0, Lorg/apache/http/protocol/HttpProcessorBuilder;

    invoke-direct {v0}, Lorg/apache/http/protocol/HttpProcessorBuilder;-><init>()V

    return-object v0
.end method

.method private getRequestChainBuilder()Lorg/apache/http/protocol/ChainBuilder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/apache/http/protocol/ChainBuilder",
            "<",
            "Lorg/apache/http/HttpRequestInterceptor;",
            ">;"
        }
    .end annotation

    .prologue
    .line 52
    iget-object v0, p0, Lorg/apache/http/protocol/HttpProcessorBuilder;->requestChainBuilder:Lorg/apache/http/protocol/ChainBuilder;

    if-nez v0, :cond_b

    .line 53
    new-instance v0, Lorg/apache/http/protocol/ChainBuilder;

    invoke-direct {v0}, Lorg/apache/http/protocol/ChainBuilder;-><init>()V

    iput-object v0, p0, Lorg/apache/http/protocol/HttpProcessorBuilder;->requestChainBuilder:Lorg/apache/http/protocol/ChainBuilder;

    .line 55
    :cond_b
    iget-object v0, p0, Lorg/apache/http/protocol/HttpProcessorBuilder;->requestChainBuilder:Lorg/apache/http/protocol/ChainBuilder;

    return-object v0
.end method

.method private getResponseChainBuilder()Lorg/apache/http/protocol/ChainBuilder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/apache/http/protocol/ChainBuilder",
            "<",
            "Lorg/apache/http/HttpResponseInterceptor;",
            ">;"
        }
    .end annotation

    .prologue
    .line 59
    iget-object v0, p0, Lorg/apache/http/protocol/HttpProcessorBuilder;->responseChainBuilder:Lorg/apache/http/protocol/ChainBuilder;

    if-nez v0, :cond_b

    .line 60
    new-instance v0, Lorg/apache/http/protocol/ChainBuilder;

    invoke-direct {v0}, Lorg/apache/http/protocol/ChainBuilder;-><init>()V

    iput-object v0, p0, Lorg/apache/http/protocol/HttpProcessorBuilder;->responseChainBuilder:Lorg/apache/http/protocol/ChainBuilder;

    .line 62
    :cond_b
    iget-object v0, p0, Lorg/apache/http/protocol/HttpProcessorBuilder;->responseChainBuilder:Lorg/apache/http/protocol/ChainBuilder;

    return-object v0
.end method


# virtual methods
.method public add(Lorg/apache/http/HttpRequestInterceptor;)Lorg/apache/http/protocol/HttpProcessorBuilder;
    .registers 3
    .param p1, "e"    # Lorg/apache/http/HttpRequestInterceptor;

    .prologue
    .line 82
    invoke-virtual {p0, p1}, Lorg/apache/http/protocol/HttpProcessorBuilder;->addLast(Lorg/apache/http/HttpRequestInterceptor;)Lorg/apache/http/protocol/HttpProcessorBuilder;

    move-result-object v0

    return-object v0
.end method

.method public add(Lorg/apache/http/HttpResponseInterceptor;)Lorg/apache/http/protocol/HttpProcessorBuilder;
    .registers 3
    .param p1, "e"    # Lorg/apache/http/HttpResponseInterceptor;

    .prologue
    .line 122
    invoke-virtual {p0, p1}, Lorg/apache/http/protocol/HttpProcessorBuilder;->addLast(Lorg/apache/http/HttpResponseInterceptor;)Lorg/apache/http/protocol/HttpProcessorBuilder;

    move-result-object v0

    return-object v0
.end method

.method public varargs addAll([Lorg/apache/http/HttpRequestInterceptor;)Lorg/apache/http/protocol/HttpProcessorBuilder;
    .registers 3
    .param p1, "e"    # [Lorg/apache/http/HttpRequestInterceptor;

    .prologue
    .line 102
    invoke-virtual {p0, p1}, Lorg/apache/http/protocol/HttpProcessorBuilder;->addAllLast([Lorg/apache/http/HttpRequestInterceptor;)Lorg/apache/http/protocol/HttpProcessorBuilder;

    move-result-object v0

    return-object v0
.end method

.method public varargs addAll([Lorg/apache/http/HttpResponseInterceptor;)Lorg/apache/http/protocol/HttpProcessorBuilder;
    .registers 3
    .param p1, "e"    # [Lorg/apache/http/HttpResponseInterceptor;

    .prologue
    .line 142
    invoke-virtual {p0, p1}, Lorg/apache/http/protocol/HttpProcessorBuilder;->addAllLast([Lorg/apache/http/HttpResponseInterceptor;)Lorg/apache/http/protocol/HttpProcessorBuilder;

    move-result-object v0

    return-object v0
.end method

.method public varargs addAllFirst([Lorg/apache/http/HttpRequestInterceptor;)Lorg/apache/http/protocol/HttpProcessorBuilder;
    .registers 3
    .param p1, "e"    # [Lorg/apache/http/HttpRequestInterceptor;

    .prologue
    .line 86
    if-nez p1, :cond_3

    .line 90
    :goto_2
    return-object p0

    .line 89
    :cond_3
    invoke-direct {p0}, Lorg/apache/http/protocol/HttpProcessorBuilder;->getRequestChainBuilder()Lorg/apache/http/protocol/ChainBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/http/protocol/ChainBuilder;->addAllFirst([Ljava/lang/Object;)Lorg/apache/http/protocol/ChainBuilder;

    goto :goto_2
.end method

.method public varargs addAllFirst([Lorg/apache/http/HttpResponseInterceptor;)Lorg/apache/http/protocol/HttpProcessorBuilder;
    .registers 3
    .param p1, "e"    # [Lorg/apache/http/HttpResponseInterceptor;

    .prologue
    .line 126
    if-nez p1, :cond_3

    .line 130
    :goto_2
    return-object p0

    .line 129
    :cond_3
    invoke-direct {p0}, Lorg/apache/http/protocol/HttpProcessorBuilder;->getResponseChainBuilder()Lorg/apache/http/protocol/ChainBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/http/protocol/ChainBuilder;->addAllFirst([Ljava/lang/Object;)Lorg/apache/http/protocol/ChainBuilder;

    goto :goto_2
.end method

.method public varargs addAllLast([Lorg/apache/http/HttpRequestInterceptor;)Lorg/apache/http/protocol/HttpProcessorBuilder;
    .registers 3
    .param p1, "e"    # [Lorg/apache/http/HttpRequestInterceptor;

    .prologue
    .line 94
    if-nez p1, :cond_3

    .line 98
    :goto_2
    return-object p0

    .line 97
    :cond_3
    invoke-direct {p0}, Lorg/apache/http/protocol/HttpProcessorBuilder;->getRequestChainBuilder()Lorg/apache/http/protocol/ChainBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/http/protocol/ChainBuilder;->addAllLast([Ljava/lang/Object;)Lorg/apache/http/protocol/ChainBuilder;

    goto :goto_2
.end method

.method public varargs addAllLast([Lorg/apache/http/HttpResponseInterceptor;)Lorg/apache/http/protocol/HttpProcessorBuilder;
    .registers 3
    .param p1, "e"    # [Lorg/apache/http/HttpResponseInterceptor;

    .prologue
    .line 134
    if-nez p1, :cond_3

    .line 138
    :goto_2
    return-object p0

    .line 137
    :cond_3
    invoke-direct {p0}, Lorg/apache/http/protocol/HttpProcessorBuilder;->getResponseChainBuilder()Lorg/apache/http/protocol/ChainBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/http/protocol/ChainBuilder;->addAllLast([Ljava/lang/Object;)Lorg/apache/http/protocol/ChainBuilder;

    goto :goto_2
.end method

.method public addFirst(Lorg/apache/http/HttpRequestInterceptor;)Lorg/apache/http/protocol/HttpProcessorBuilder;
    .registers 3
    .param p1, "e"    # Lorg/apache/http/HttpRequestInterceptor;

    .prologue
    .line 66
    if-nez p1, :cond_3

    .line 70
    :goto_2
    return-object p0

    .line 69
    :cond_3
    invoke-direct {p0}, Lorg/apache/http/protocol/HttpProcessorBuilder;->getRequestChainBuilder()Lorg/apache/http/protocol/ChainBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/http/protocol/ChainBuilder;->addFirst(Ljava/lang/Object;)Lorg/apache/http/protocol/ChainBuilder;

    goto :goto_2
.end method

.method public addFirst(Lorg/apache/http/HttpResponseInterceptor;)Lorg/apache/http/protocol/HttpProcessorBuilder;
    .registers 3
    .param p1, "e"    # Lorg/apache/http/HttpResponseInterceptor;

    .prologue
    .line 106
    if-nez p1, :cond_3

    .line 110
    :goto_2
    return-object p0

    .line 109
    :cond_3
    invoke-direct {p0}, Lorg/apache/http/protocol/HttpProcessorBuilder;->getResponseChainBuilder()Lorg/apache/http/protocol/ChainBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/http/protocol/ChainBuilder;->addFirst(Ljava/lang/Object;)Lorg/apache/http/protocol/ChainBuilder;

    goto :goto_2
.end method

.method public addLast(Lorg/apache/http/HttpRequestInterceptor;)Lorg/apache/http/protocol/HttpProcessorBuilder;
    .registers 3
    .param p1, "e"    # Lorg/apache/http/HttpRequestInterceptor;

    .prologue
    .line 74
    if-nez p1, :cond_3

    .line 78
    :goto_2
    return-object p0

    .line 77
    :cond_3
    invoke-direct {p0}, Lorg/apache/http/protocol/HttpProcessorBuilder;->getRequestChainBuilder()Lorg/apache/http/protocol/ChainBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/http/protocol/ChainBuilder;->addLast(Ljava/lang/Object;)Lorg/apache/http/protocol/ChainBuilder;

    goto :goto_2
.end method

.method public addLast(Lorg/apache/http/HttpResponseInterceptor;)Lorg/apache/http/protocol/HttpProcessorBuilder;
    .registers 3
    .param p1, "e"    # Lorg/apache/http/HttpResponseInterceptor;

    .prologue
    .line 114
    if-nez p1, :cond_3

    .line 118
    :goto_2
    return-object p0

    .line 117
    :cond_3
    invoke-direct {p0}, Lorg/apache/http/protocol/HttpProcessorBuilder;->getResponseChainBuilder()Lorg/apache/http/protocol/ChainBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/http/protocol/ChainBuilder;->addLast(Ljava/lang/Object;)Lorg/apache/http/protocol/ChainBuilder;

    goto :goto_2
.end method

.method public build()Lorg/apache/http/protocol/HttpProcessor;
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 146
    new-instance v2, Lorg/apache/http/protocol/ImmutableHttpProcessor;

    iget-object v0, p0, Lorg/apache/http/protocol/HttpProcessorBuilder;->requestChainBuilder:Lorg/apache/http/protocol/ChainBuilder;

    if-eqz v0, :cond_1b

    iget-object v0, p0, Lorg/apache/http/protocol/HttpProcessorBuilder;->requestChainBuilder:Lorg/apache/http/protocol/ChainBuilder;

    invoke-virtual {v0}, Lorg/apache/http/protocol/ChainBuilder;->build()Ljava/util/LinkedList;

    move-result-object v0

    :goto_d
    iget-object v3, p0, Lorg/apache/http/protocol/HttpProcessorBuilder;->responseChainBuilder:Lorg/apache/http/protocol/ChainBuilder;

    if-eqz v3, :cond_17

    iget-object v1, p0, Lorg/apache/http/protocol/HttpProcessorBuilder;->responseChainBuilder:Lorg/apache/http/protocol/ChainBuilder;

    invoke-virtual {v1}, Lorg/apache/http/protocol/ChainBuilder;->build()Ljava/util/LinkedList;

    move-result-object v1

    :cond_17
    invoke-direct {v2, v0, v1}, Lorg/apache/http/protocol/ImmutableHttpProcessor;-><init>(Ljava/util/List;Ljava/util/List;)V

    return-object v2

    :cond_1b
    move-object v0, v1

    goto :goto_d
.end method
