.class public Lorg/apache/http/impl/auth/DigestSchemeFactory;
.super Ljava/lang/Object;
.source "DigestSchemeFactory.java"

# interfaces
.implements Lorg/apache/http/auth/AuthSchemeFactory;
.implements Lorg/apache/http/auth/AuthSchemeProvider;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final charset:Ljava/nio/charset/Charset;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 60
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/http/impl/auth/DigestSchemeFactory;-><init>(Ljava/nio/charset/Charset;)V

    .line 61
    return-void
.end method

.method public constructor <init>(Ljava/nio/charset/Charset;)V
    .registers 2
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-object p1, p0, Lorg/apache/http/impl/auth/DigestSchemeFactory;->charset:Ljava/nio/charset/Charset;

    .line 57
    return-void
.end method


# virtual methods
.method public create(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/auth/AuthScheme;
    .registers 4
    .param p1, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 68
    new-instance v0, Lorg/apache/http/impl/auth/DigestScheme;

    iget-object v1, p0, Lorg/apache/http/impl/auth/DigestSchemeFactory;->charset:Ljava/nio/charset/Charset;

    invoke-direct {v0, v1}, Lorg/apache/http/impl/auth/DigestScheme;-><init>(Ljava/nio/charset/Charset;)V

    return-object v0
.end method

.method public newInstance(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/auth/AuthScheme;
    .registers 3
    .param p1, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 64
    new-instance v0, Lorg/apache/http/impl/auth/DigestScheme;

    invoke-direct {v0}, Lorg/apache/http/impl/auth/DigestScheme;-><init>()V

    return-object v0
.end method
