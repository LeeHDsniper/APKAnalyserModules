.class public Lorg/apache/http/impl/cookie/IgnoreSpecFactory;
.super Ljava/lang/Object;
.source "IgnoreSpecFactory.java"

# interfaces
.implements Lorg/apache/http/cookie/CookieSpecFactory;
.implements Lorg/apache/http/cookie/CookieSpecProvider;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    return-void
.end method


# virtual methods
.method public create(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/cookie/CookieSpec;
    .registers 3
    .param p1, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 55
    new-instance v0, Lorg/apache/http/impl/cookie/IgnoreSpec;

    invoke-direct {v0}, Lorg/apache/http/impl/cookie/IgnoreSpec;-><init>()V

    return-object v0
.end method

.method public newInstance(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/cookie/CookieSpec;
    .registers 3
    .param p1, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 51
    new-instance v0, Lorg/apache/http/impl/cookie/IgnoreSpec;

    invoke-direct {v0}, Lorg/apache/http/impl/cookie/IgnoreSpec;-><init>()V

    return-object v0
.end method
