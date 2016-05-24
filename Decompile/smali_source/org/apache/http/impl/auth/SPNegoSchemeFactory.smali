.class public Lorg/apache/http/impl/auth/SPNegoSchemeFactory;
.super Ljava/lang/Object;
.source "SPNegoSchemeFactory.java"

# interfaces
.implements Lorg/apache/http/auth/AuthSchemeFactory;
.implements Lorg/apache/http/auth/AuthSchemeProvider;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final stripPort:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 54
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/http/impl/auth/SPNegoSchemeFactory;-><init>(Z)V

    .line 55
    return-void
.end method

.method public constructor <init>(Z)V
    .registers 2
    .param p1, "stripPort"    # Z

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-boolean p1, p0, Lorg/apache/http/impl/auth/SPNegoSchemeFactory;->stripPort:Z

    .line 51
    return-void
.end method


# virtual methods
.method public create(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/auth/AuthScheme;
    .registers 4
    .param p1, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 66
    new-instance v0, Lorg/apache/http/impl/auth/SPNegoScheme;

    iget-boolean v1, p0, Lorg/apache/http/impl/auth/SPNegoSchemeFactory;->stripPort:Z

    invoke-direct {v0, v1}, Lorg/apache/http/impl/auth/SPNegoScheme;-><init>(Z)V

    return-object v0
.end method

.method public isStripPort()Z
    .registers 2

    .prologue
    .line 58
    iget-boolean v0, p0, Lorg/apache/http/impl/auth/SPNegoSchemeFactory;->stripPort:Z

    return v0
.end method

.method public newInstance(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/auth/AuthScheme;
    .registers 4
    .param p1, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 62
    new-instance v0, Lorg/apache/http/impl/auth/SPNegoScheme;

    iget-boolean v1, p0, Lorg/apache/http/impl/auth/SPNegoSchemeFactory;->stripPort:Z

    invoke-direct {v0, v1}, Lorg/apache/http/impl/auth/SPNegoScheme;-><init>(Z)V

    return-object v0
.end method
