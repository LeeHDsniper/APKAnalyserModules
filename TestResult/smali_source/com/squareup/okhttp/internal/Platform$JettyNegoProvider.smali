.class Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;
.super Ljava/lang/Object;
.source "Platform.java"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/Platform;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "JettyNegoProvider"
.end annotation


# instance fields
.field private final protocols:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private selected:Ljava/lang/String;

.field private unsupported:Z


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 356
    .local p1, "protocols":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 357
    iput-object p1, p0, Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;->protocols:Ljava/util/List;

    .line 358
    return-void
.end method

.method static synthetic access$100(Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;)Z
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;

    .prologue
    .line 348
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;->unsupported:Z

    return v0
.end method

.method static synthetic access$200(Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;

    .prologue
    .line 348
    iget-object v0, p0, Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;->selected:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13
    .param p1, "proxy"    # Ljava/lang/Object;
    .param p2, "method"    # Ljava/lang/reflect/Method;
    .param p3, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 361
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v1

    .line 362
    .local v1, "methodName":Ljava/lang/String;
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v3

    .line 363
    .local v3, "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p3, :cond_f

    .line 364
    sget-object p3, Lcom/squareup/okhttp/internal/Util;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    .line 366
    :cond_f
    const-string v5, "supports"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_20

    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne v5, v3, :cond_20

    .line 367
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    .line 388
    :goto_1f
    return-object v5

    .line 368
    :cond_20
    const-string v5, "unsupported"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_30

    sget-object v5, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-ne v5, v3, :cond_30

    .line 369
    iput-boolean v8, p0, Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;->unsupported:Z

    move-object v5, v6

    .line 370
    goto :goto_1f

    .line 371
    :cond_30
    const-string v5, "protocols"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3e

    array-length v5, p3

    if-nez v5, :cond_3e

    .line 372
    iget-object v5, p0, Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;->protocols:Ljava/util/List;

    goto :goto_1f

    .line 373
    :cond_3e
    const-string v5, "selectProtocol"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4e

    const-string v5, "select"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_89

    :cond_4e
    const-class v5, Ljava/lang/String;

    if-ne v5, v3, :cond_89

    array-length v5, p3

    if-ne v5, v8, :cond_89

    aget-object v5, p3, v7

    instance-of v5, v5, Ljava/util/List;

    if-eqz v5, :cond_89

    .line 375
    aget-object v2, p3, v7

    check-cast v2, Ljava/util/List;

    .line 377
    .local v2, "peerProtocols":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    .local v4, "size":I
    :goto_64
    if-ge v0, v4, :cond_7e

    .line 378
    iget-object v5, p0, Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;->protocols:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7b

    .line 379
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    iput-object v5, p0, Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;->selected:Ljava/lang/String;

    goto :goto_1f

    .line 377
    :cond_7b
    add-int/lit8 v0, v0, 0x1

    goto :goto_64

    .line 382
    :cond_7e
    iget-object v5, p0, Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;->protocols:Ljava/util/List;

    invoke-interface {v5, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    iput-object v5, p0, Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;->selected:Ljava/lang/String;

    goto :goto_1f

    .line 383
    .end local v0    # "i":I
    .end local v2    # "peerProtocols":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v4    # "size":I
    :cond_89
    const-string v5, "protocolSelected"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_99

    const-string v5, "selected"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_a5

    :cond_99
    array-length v5, p3

    if-ne v5, v8, :cond_a5

    .line 385
    aget-object v5, p3, v7

    check-cast v5, Ljava/lang/String;

    iput-object v5, p0, Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;->selected:Ljava/lang/String;

    move-object v5, v6

    .line 386
    goto/16 :goto_1f

    .line 388
    :cond_a5
    invoke-virtual {p2, p0, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    goto/16 :goto_1f
.end method
