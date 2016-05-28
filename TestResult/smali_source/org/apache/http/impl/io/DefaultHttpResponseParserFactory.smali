.class public Lorg/apache/http/impl/io/DefaultHttpResponseParserFactory;
.super Ljava/lang/Object;
.source "DefaultHttpResponseParserFactory.java"

# interfaces
.implements Lorg/apache/http/io/HttpMessageParserFactory;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/apache/http/io/HttpMessageParserFactory",
        "<",
        "Lorg/apache/http/HttpResponse;",
        ">;"
    }
.end annotation

.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field public static final INSTANCE:Lorg/apache/http/impl/io/DefaultHttpResponseParserFactory;


# instance fields
.field private final lineParser:Lorg/apache/http/message/LineParser;

.field private final responseFactory:Lorg/apache/http/HttpResponseFactory;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 49
    new-instance v0, Lorg/apache/http/impl/io/DefaultHttpResponseParserFactory;

    invoke-direct {v0}, Lorg/apache/http/impl/io/DefaultHttpResponseParserFactory;-><init>()V

    sput-object v0, Lorg/apache/http/impl/io/DefaultHttpResponseParserFactory;->INSTANCE:Lorg/apache/http/impl/io/DefaultHttpResponseParserFactory;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 63
    invoke-direct {p0, v0, v0}, Lorg/apache/http/impl/io/DefaultHttpResponseParserFactory;-><init>(Lorg/apache/http/message/LineParser;Lorg/apache/http/HttpResponseFactory;)V

    .line 64
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/message/LineParser;Lorg/apache/http/HttpResponseFactory;)V
    .registers 3
    .param p1, "lineParser"    # Lorg/apache/http/message/LineParser;
    .param p2, "responseFactory"    # Lorg/apache/http/HttpResponseFactory;

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    if-eqz p1, :cond_c

    .end local p1    # "lineParser":Lorg/apache/http/message/LineParser;
    :goto_5
    iput-object p1, p0, Lorg/apache/http/impl/io/DefaultHttpResponseParserFactory;->lineParser:Lorg/apache/http/message/LineParser;

    .line 58
    if-eqz p2, :cond_f

    .end local p2    # "responseFactory":Lorg/apache/http/HttpResponseFactory;
    :goto_9
    iput-object p2, p0, Lorg/apache/http/impl/io/DefaultHttpResponseParserFactory;->responseFactory:Lorg/apache/http/HttpResponseFactory;

    .line 60
    return-void

    .line 57
    .restart local p1    # "lineParser":Lorg/apache/http/message/LineParser;
    .restart local p2    # "responseFactory":Lorg/apache/http/HttpResponseFactory;
    :cond_c
    sget-object p1, Lorg/apache/http/message/BasicLineParser;->INSTANCE:Lorg/apache/http/message/BasicLineParser;

    goto :goto_5

    .line 58
    .end local p1    # "lineParser":Lorg/apache/http/message/LineParser;
    :cond_f
    sget-object p2, Lorg/apache/http/impl/DefaultHttpResponseFactory;->INSTANCE:Lorg/apache/http/impl/DefaultHttpResponseFactory;

    goto :goto_9
.end method


# virtual methods
.method public create(Lorg/apache/http/io/SessionInputBuffer;Lorg/apache/http/config/MessageConstraints;)Lorg/apache/http/io/HttpMessageParser;
    .registers 6
    .param p1, "buffer"    # Lorg/apache/http/io/SessionInputBuffer;
    .param p2, "constraints"    # Lorg/apache/http/config/MessageConstraints;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/io/SessionInputBuffer;",
            "Lorg/apache/http/config/MessageConstraints;",
            ")",
            "Lorg/apache/http/io/HttpMessageParser",
            "<",
            "Lorg/apache/http/HttpResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 68
    new-instance v0, Lorg/apache/http/impl/io/DefaultHttpResponseParser;

    iget-object v1, p0, Lorg/apache/http/impl/io/DefaultHttpResponseParserFactory;->lineParser:Lorg/apache/http/message/LineParser;

    iget-object v2, p0, Lorg/apache/http/impl/io/DefaultHttpResponseParserFactory;->responseFactory:Lorg/apache/http/HttpResponseFactory;

    invoke-direct {v0, p1, v1, v2, p2}, Lorg/apache/http/impl/io/DefaultHttpResponseParser;-><init>(Lorg/apache/http/io/SessionInputBuffer;Lorg/apache/http/message/LineParser;Lorg/apache/http/HttpResponseFactory;Lorg/apache/http/config/MessageConstraints;)V

    return-object v0
.end method
