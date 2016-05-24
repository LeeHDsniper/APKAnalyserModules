.class public Lorg/apache/http/auth/UsernamePasswordCredentials;
.super Ljava/lang/Object;
.source "UsernamePasswordCredentials.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Lorg/apache/http/auth/Credentials;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x36087f34635c8cbL


# instance fields
.field private final password:Ljava/lang/String;

.field private final principal:Lorg/apache/http/auth/BasicUserPrincipal;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 5
    .param p1, "usernamePassword"    # Ljava/lang/String;

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    const-string v1, "Username:password string"

    invoke-static {p1, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 59
    const/16 v1, 0x3a

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 60
    .local v0, "atColon":I
    if-ltz v0, :cond_25

    .line 61
    new-instance v1, Lorg/apache/http/auth/BasicUserPrincipal;

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/http/auth/BasicUserPrincipal;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lorg/apache/http/auth/UsernamePasswordCredentials;->principal:Lorg/apache/http/auth/BasicUserPrincipal;

    .line 62
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/http/auth/UsernamePasswordCredentials;->password:Ljava/lang/String;

    .line 67
    :goto_24
    return-void

    .line 64
    :cond_25
    new-instance v1, Lorg/apache/http/auth/BasicUserPrincipal;

    invoke-direct {v1, p1}, Lorg/apache/http/auth/BasicUserPrincipal;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lorg/apache/http/auth/UsernamePasswordCredentials;->principal:Lorg/apache/http/auth/BasicUserPrincipal;

    .line 65
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/http/auth/UsernamePasswordCredentials;->password:Ljava/lang/String;

    goto :goto_24
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "userName"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;

    .prologue
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    const-string v0, "Username"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 79
    new-instance v0, Lorg/apache/http/auth/BasicUserPrincipal;

    invoke-direct {v0, p1}, Lorg/apache/http/auth/BasicUserPrincipal;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/http/auth/UsernamePasswordCredentials;->principal:Lorg/apache/http/auth/BasicUserPrincipal;

    .line 80
    iput-object p2, p0, Lorg/apache/http/auth/UsernamePasswordCredentials;->password:Ljava/lang/String;

    .line 81
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    .line 102
    if-ne p0, p1, :cond_4

    .line 111
    :cond_3
    :goto_3
    return v1

    .line 105
    :cond_4
    instance-of v2, p1, Lorg/apache/http/auth/UsernamePasswordCredentials;

    if-eqz v2, :cond_15

    move-object v0, p1

    .line 106
    check-cast v0, Lorg/apache/http/auth/UsernamePasswordCredentials;

    .line 107
    .local v0, "that":Lorg/apache/http/auth/UsernamePasswordCredentials;
    iget-object v2, p0, Lorg/apache/http/auth/UsernamePasswordCredentials;->principal:Lorg/apache/http/auth/BasicUserPrincipal;

    iget-object v3, v0, Lorg/apache/http/auth/UsernamePasswordCredentials;->principal:Lorg/apache/http/auth/BasicUserPrincipal;

    invoke-static {v2, v3}, Lorg/apache/http/util/LangUtils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 111
    .end local v0    # "that":Lorg/apache/http/auth/UsernamePasswordCredentials;
    :cond_15
    const/4 v1, 0x0

    goto :goto_3
.end method

.method public getPassword()Ljava/lang/String;
    .registers 2

    .prologue
    .line 92
    iget-object v0, p0, Lorg/apache/http/auth/UsernamePasswordCredentials;->password:Ljava/lang/String;

    return-object v0
.end method

.method public getUserName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 88
    iget-object v0, p0, Lorg/apache/http/auth/UsernamePasswordCredentials;->principal:Lorg/apache/http/auth/BasicUserPrincipal;

    invoke-virtual {v0}, Lorg/apache/http/auth/BasicUserPrincipal;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUserPrincipal()Ljava/security/Principal;
    .registers 2

    .prologue
    .line 84
    iget-object v0, p0, Lorg/apache/http/auth/UsernamePasswordCredentials;->principal:Lorg/apache/http/auth/BasicUserPrincipal;

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 97
    iget-object v0, p0, Lorg/apache/http/auth/UsernamePasswordCredentials;->principal:Lorg/apache/http/auth/BasicUserPrincipal;

    invoke-virtual {v0}, Lorg/apache/http/auth/BasicUserPrincipal;->hashCode()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 116
    iget-object v0, p0, Lorg/apache/http/auth/UsernamePasswordCredentials;->principal:Lorg/apache/http/auth/BasicUserPrincipal;

    invoke-virtual {v0}, Lorg/apache/http/auth/BasicUserPrincipal;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
