.class public Lorg/apache/http/impl/client/DefaultConnectionKeepAliveStrategy;
.super Ljava/lang/Object;
.source "DefaultConnectionKeepAliveStrategy.java"

# interfaces
.implements Lorg/apache/http/conn/ConnectionKeepAliveStrategy;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field public static final INSTANCE:Lorg/apache/http/impl/client/DefaultConnectionKeepAliveStrategy;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 51
    new-instance v0, Lorg/apache/http/impl/client/DefaultConnectionKeepAliveStrategy;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultConnectionKeepAliveStrategy;-><init>()V

    sput-object v0, Lorg/apache/http/impl/client/DefaultConnectionKeepAliveStrategy;->INSTANCE:Lorg/apache/http/impl/client/DefaultConnectionKeepAliveStrategy;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getKeepAliveDuration(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)J
    .registers 11
    .param p1, "response"    # Lorg/apache/http/HttpResponse;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 54
    const-string v4, "HTTP response"

    invoke-static {p1, v4}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 55
    new-instance v1, Lorg/apache/http/message/BasicHeaderElementIterator;

    const-string v4, "Keep-Alive"

    invoke-interface {p1, v4}, Lorg/apache/http/HttpResponse;->headerIterator(Ljava/lang/String;)Lorg/apache/http/HeaderIterator;

    move-result-object v4

    invoke-direct {v1, v4}, Lorg/apache/http/message/BasicHeaderElementIterator;-><init>(Lorg/apache/http/HeaderIterator;)V

    .line 57
    .local v1, "it":Lorg/apache/http/HeaderElementIterator;
    :cond_10
    :goto_10
    invoke-interface {v1}, Lorg/apache/http/HeaderElementIterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_34

    .line 58
    invoke-interface {v1}, Lorg/apache/http/HeaderElementIterator;->nextElement()Lorg/apache/http/HeaderElement;

    move-result-object v0

    .line 59
    .local v0, "he":Lorg/apache/http/HeaderElement;
    invoke-interface {v0}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v2

    .line 60
    .local v2, "param":Ljava/lang/String;
    invoke-interface {v0}, Lorg/apache/http/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v3

    .line 61
    .local v3, "value":Ljava/lang/String;
    if-eqz v3, :cond_10

    const-string v4, "timeout"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_10

    .line 63
    :try_start_2c
    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_2f
    .catch Ljava/lang/NumberFormatException; {:try_start_2c .. :try_end_2f} :catch_37

    move-result-wide v4

    const-wide/16 v6, 0x3e8

    mul-long/2addr v4, v6

    .line 68
    .end local v0    # "he":Lorg/apache/http/HeaderElement;
    .end local v2    # "param":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/String;
    :goto_33
    return-wide v4

    :cond_34
    const-wide/16 v4, -0x1

    goto :goto_33

    .line 64
    .restart local v0    # "he":Lorg/apache/http/HeaderElement;
    .restart local v2    # "param":Ljava/lang/String;
    .restart local v3    # "value":Ljava/lang/String;
    :catch_37
    move-exception v4

    goto :goto_10
.end method
