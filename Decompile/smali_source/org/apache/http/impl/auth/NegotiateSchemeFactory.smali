.class public Lorg/apache/http/impl/auth/NegotiateSchemeFactory;
.super Ljava/lang/Object;
.source "NegotiateSchemeFactory.java"

# interfaces
.implements Lorg/apache/http/auth/AuthSchemeFactory;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final spengoGenerator:Lorg/apache/http/impl/auth/SpnegoTokenGenerator;

.field private final stripPort:Z


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 58
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/apache/http/impl/auth/NegotiateSchemeFactory;-><init>(Lorg/apache/http/impl/auth/SpnegoTokenGenerator;Z)V

    .line 59
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/impl/auth/SpnegoTokenGenerator;)V
    .registers 3
    .param p1, "spengoGenerator"    # Lorg/apache/http/impl/auth/SpnegoTokenGenerator;

    .prologue
    .line 54
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/http/impl/auth/NegotiateSchemeFactory;-><init>(Lorg/apache/http/impl/auth/SpnegoTokenGenerator;Z)V

    .line 55
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/impl/auth/SpnegoTokenGenerator;Z)V
    .registers 3
    .param p1, "spengoGenerator"    # Lorg/apache/http/impl/auth/SpnegoTokenGenerator;
    .param p2, "stripPort"    # Z

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Lorg/apache/http/impl/auth/NegotiateSchemeFactory;->spengoGenerator:Lorg/apache/http/impl/auth/SpnegoTokenGenerator;

    .line 50
    iput-boolean p2, p0, Lorg/apache/http/impl/auth/NegotiateSchemeFactory;->stripPort:Z

    .line 51
    return-void
.end method


# virtual methods
.method public getSpengoGenerator()Lorg/apache/http/impl/auth/SpnegoTokenGenerator;
    .registers 2

    .prologue
    .line 70
    iget-object v0, p0, Lorg/apache/http/impl/auth/NegotiateSchemeFactory;->spengoGenerator:Lorg/apache/http/impl/auth/SpnegoTokenGenerator;

    return-object v0
.end method

.method public isStripPort()Z
    .registers 2

    .prologue
    .line 66
    iget-boolean v0, p0, Lorg/apache/http/impl/auth/NegotiateSchemeFactory;->stripPort:Z

    return v0
.end method

.method public newInstance(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/auth/AuthScheme;
    .registers 5
    .param p1, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 62
    new-instance v0, Lorg/apache/http/impl/auth/NegotiateScheme;

    iget-object v1, p0, Lorg/apache/http/impl/auth/NegotiateSchemeFactory;->spengoGenerator:Lorg/apache/http/impl/auth/SpnegoTokenGenerator;

    iget-boolean v2, p0, Lorg/apache/http/impl/auth/NegotiateSchemeFactory;->stripPort:Z

    invoke-direct {v0, v1, v2}, Lorg/apache/http/impl/auth/NegotiateScheme;-><init>(Lorg/apache/http/impl/auth/SpnegoTokenGenerator;Z)V

    return-object v0
.end method
