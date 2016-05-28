.class public Lorg/apache/http/impl/auth/NTLMSchemeFactory;
.super Ljava/lang/Object;
.source "NTLMSchemeFactory.java"

# interfaces
.implements Lorg/apache/http/auth/AuthSchemeFactory;
.implements Lorg/apache/http/auth/AuthSchemeProvider;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/auth/AuthScheme;
    .registers 3
    .param p1, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 53
    new-instance v0, Lorg/apache/http/impl/auth/NTLMScheme;

    invoke-direct {v0}, Lorg/apache/http/impl/auth/NTLMScheme;-><init>()V

    return-object v0
.end method

.method public newInstance(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/auth/AuthScheme;
    .registers 3
    .param p1, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 49
    new-instance v0, Lorg/apache/http/impl/auth/NTLMScheme;

    invoke-direct {v0}, Lorg/apache/http/impl/auth/NTLMScheme;-><init>()V

    return-object v0
.end method
