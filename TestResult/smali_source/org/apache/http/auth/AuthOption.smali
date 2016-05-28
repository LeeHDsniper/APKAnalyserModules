.class public final Lorg/apache/http/auth/AuthOption;
.super Ljava/lang/Object;
.source "AuthOption.java"


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final authScheme:Lorg/apache/http/auth/AuthScheme;

.field private final creds:Lorg/apache/http/auth/Credentials;


# direct methods
.method public constructor <init>(Lorg/apache/http/auth/AuthScheme;Lorg/apache/http/auth/Credentials;)V
    .registers 4
    .param p1, "authScheme"    # Lorg/apache/http/auth/AuthScheme;
    .param p2, "creds"    # Lorg/apache/http/auth/Credentials;

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    const-string v0, "Auth scheme"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 44
    const-string v0, "User credentials"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 45
    iput-object p1, p0, Lorg/apache/http/auth/AuthOption;->authScheme:Lorg/apache/http/auth/AuthScheme;

    .line 46
    iput-object p2, p0, Lorg/apache/http/auth/AuthOption;->creds:Lorg/apache/http/auth/Credentials;

    .line 47
    return-void
.end method


# virtual methods
.method public getAuthScheme()Lorg/apache/http/auth/AuthScheme;
    .registers 2

    .prologue
    .line 50
    iget-object v0, p0, Lorg/apache/http/auth/AuthOption;->authScheme:Lorg/apache/http/auth/AuthScheme;

    return-object v0
.end method

.method public getCredentials()Lorg/apache/http/auth/Credentials;
    .registers 2

    .prologue
    .line 54
    iget-object v0, p0, Lorg/apache/http/auth/AuthOption;->creds:Lorg/apache/http/auth/Credentials;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 59
    iget-object v0, p0, Lorg/apache/http/auth/AuthOption;->authScheme:Lorg/apache/http/auth/AuthScheme;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
