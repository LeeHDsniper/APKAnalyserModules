.class public Lorg/apache/http/impl/DefaultHttpResponseFactory;
.super Ljava/lang/Object;
.source "DefaultHttpResponseFactory.java"

# interfaces
.implements Lorg/apache/http/HttpResponseFactory;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field public static final INSTANCE:Lorg/apache/http/impl/DefaultHttpResponseFactory;


# instance fields
.field protected final reasonCatalog:Lorg/apache/http/ReasonPhraseCatalog;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 51
    new-instance v0, Lorg/apache/http/impl/DefaultHttpResponseFactory;

    invoke-direct {v0}, Lorg/apache/http/impl/DefaultHttpResponseFactory;-><init>()V

    sput-object v0, Lorg/apache/http/impl/DefaultHttpResponseFactory;->INSTANCE:Lorg/apache/http/impl/DefaultHttpResponseFactory;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 71
    sget-object v0, Lorg/apache/http/impl/EnglishReasonPhraseCatalog;->INSTANCE:Lorg/apache/http/impl/EnglishReasonPhraseCatalog;

    invoke-direct {p0, v0}, Lorg/apache/http/impl/DefaultHttpResponseFactory;-><init>(Lorg/apache/http/ReasonPhraseCatalog;)V

    .line 72
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/ReasonPhraseCatalog;)V
    .registers 3
    .param p1, "catalog"    # Lorg/apache/http/ReasonPhraseCatalog;

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    const-string v0, "Reason phrase catalog"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/ReasonPhraseCatalog;

    iput-object v0, p0, Lorg/apache/http/impl/DefaultHttpResponseFactory;->reasonCatalog:Lorg/apache/http/ReasonPhraseCatalog;

    .line 64
    return-void
.end method


# virtual methods
.method protected determineLocale(Lorg/apache/http/protocol/HttpContext;)Ljava/util/Locale;
    .registers 3
    .param p1, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 106
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    return-object v0
.end method

.method public newHttpResponse(Lorg/apache/http/ProtocolVersion;ILorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;
    .registers 8
    .param p1, "ver"    # Lorg/apache/http/ProtocolVersion;
    .param p2, "status"    # I
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 80
    const-string v3, "HTTP version"

    invoke-static {p1, v3}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 81
    invoke-virtual {p0, p3}, Lorg/apache/http/impl/DefaultHttpResponseFactory;->determineLocale(Lorg/apache/http/protocol/HttpContext;)Ljava/util/Locale;

    move-result-object v0

    .line 82
    .local v0, "loc":Ljava/util/Locale;
    iget-object v3, p0, Lorg/apache/http/impl/DefaultHttpResponseFactory;->reasonCatalog:Lorg/apache/http/ReasonPhraseCatalog;

    invoke-interface {v3, p2, v0}, Lorg/apache/http/ReasonPhraseCatalog;->getReason(ILjava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 83
    .local v1, "reason":Ljava/lang/String;
    new-instance v2, Lorg/apache/http/message/BasicStatusLine;

    invoke-direct {v2, p1, p2, v1}, Lorg/apache/http/message/BasicStatusLine;-><init>(Lorg/apache/http/ProtocolVersion;ILjava/lang/String;)V

    .line 84
    .local v2, "statusline":Lorg/apache/http/StatusLine;
    new-instance v3, Lorg/apache/http/message/BasicHttpResponse;

    invoke-direct {v3, v2}, Lorg/apache/http/message/BasicHttpResponse;-><init>(Lorg/apache/http/StatusLine;)V

    return-object v3
.end method

.method public newHttpResponse(Lorg/apache/http/StatusLine;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;
    .registers 4
    .param p1, "statusline"    # Lorg/apache/http/StatusLine;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 92
    const-string v0, "Status line"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 93
    new-instance v0, Lorg/apache/http/message/BasicHttpResponse;

    invoke-direct {v0, p1}, Lorg/apache/http/message/BasicHttpResponse;-><init>(Lorg/apache/http/StatusLine;)V

    return-object v0
.end method
