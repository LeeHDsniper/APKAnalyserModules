.class public Lorg/apache/http/impl/auth/NegotiateScheme;
.super Lorg/apache/http/impl/auth/GGSSchemeBase;
.source "NegotiateScheme.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final KERBEROS_OID:Ljava/lang/String; = "1.2.840.113554.1.2.2"

.field private static final SPNEGO_OID:Ljava/lang/String; = "1.3.6.1.5.5.2"


# instance fields
.field private final log:Lorg/apache/commons/logging/Log;

.field private final spengoGenerator:Lorg/apache/http/impl/auth/SpnegoTokenGenerator;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 74
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/apache/http/impl/auth/NegotiateScheme;-><init>(Lorg/apache/http/impl/auth/SpnegoTokenGenerator;Z)V

    .line 75
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/impl/auth/SpnegoTokenGenerator;)V
    .registers 3
    .param p1, "spengoGenerator"    # Lorg/apache/http/impl/auth/SpnegoTokenGenerator;

    .prologue
    .line 70
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/http/impl/auth/NegotiateScheme;-><init>(Lorg/apache/http/impl/auth/SpnegoTokenGenerator;Z)V

    .line 71
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/impl/auth/SpnegoTokenGenerator;Z)V
    .registers 4
    .param p1, "spengoGenerator"    # Lorg/apache/http/impl/auth/SpnegoTokenGenerator;
    .param p2, "stripPort"    # Z

    .prologue
    .line 65
    invoke-direct {p0, p2}, Lorg/apache/http/impl/auth/GGSSchemeBase;-><init>(Z)V

    .line 53
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/auth/NegotiateScheme;->log:Lorg/apache/commons/logging/Log;

    .line 66
    iput-object p1, p0, Lorg/apache/http/impl/auth/NegotiateScheme;->spengoGenerator:Lorg/apache/http/impl/auth/SpnegoTokenGenerator;

    .line 67
    return-void
.end method


# virtual methods
.method public authenticate(Lorg/apache/http/auth/Credentials;Lorg/apache/http/HttpRequest;)Lorg/apache/http/Header;
    .registers 4
    .param p1, "credentials"    # Lorg/apache/http/auth/Credentials;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/auth/AuthenticationException;
        }
    .end annotation

    .prologue
    .line 90
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/http/impl/auth/NegotiateScheme;->authenticate(Lorg/apache/http/auth/Credentials;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/Header;

    move-result-object v0

    return-object v0
.end method

.method public authenticate(Lorg/apache/http/auth/Credentials;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/Header;
    .registers 5
    .param p1, "credentials"    # Lorg/apache/http/auth/Credentials;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/auth/AuthenticationException;
        }
    .end annotation

    .prologue
    .line 111
    invoke-super {p0, p1, p2, p3}, Lorg/apache/http/impl/auth/GGSSchemeBase;->authenticate(Lorg/apache/http/auth/Credentials;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/Header;

    move-result-object v0

    return-object v0
.end method

.method protected generateToken([BLjava/lang/String;)[B
    .registers 9
    .param p1, "input"    # [B
    .param p2, "authServer"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/ietf/jgss/GSSException;
        }
    .end annotation

    .prologue
    .line 131
    new-instance v1, Lorg/ietf/jgss/Oid;

    const-string v4, "1.3.6.1.5.5.2"

    invoke-direct {v1, v4}, Lorg/ietf/jgss/Oid;-><init>(Ljava/lang/String;)V

    .line 133
    .local v1, "negotiationOid":Lorg/ietf/jgss/Oid;
    move-object v2, p1

    .line 134
    .local v2, "token":[B
    const/4 v3, 0x0

    .line 136
    .local v3, "tryKerberos":Z
    :try_start_9
    invoke-virtual {p0, v2, v1, p2}, Lorg/apache/http/impl/auth/NegotiateScheme;->generateGSSToken([BLorg/ietf/jgss/Oid;Ljava/lang/String;)[B
    :try_end_c
    .catch Lorg/ietf/jgss/GSSException; {:try_start_9 .. :try_end_c} :catch_2e

    move-result-object v2

    .line 148
    :goto_d
    if-eqz v3, :cond_2d

    .line 150
    iget-object v4, p0, Lorg/apache/http/impl/auth/NegotiateScheme;->log:Lorg/apache/commons/logging/Log;

    const-string v5, "Using Kerberos MECH 1.2.840.113554.1.2.2"

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 151
    new-instance v1, Lorg/ietf/jgss/Oid;

    .end local v1    # "negotiationOid":Lorg/ietf/jgss/Oid;
    const-string v4, "1.2.840.113554.1.2.2"

    invoke-direct {v1, v4}, Lorg/ietf/jgss/Oid;-><init>(Ljava/lang/String;)V

    .line 152
    .restart local v1    # "negotiationOid":Lorg/ietf/jgss/Oid;
    invoke-virtual {p0, v2, v1, p2}, Lorg/apache/http/impl/auth/NegotiateScheme;->generateGSSToken([BLorg/ietf/jgss/Oid;Ljava/lang/String;)[B

    move-result-object v2

    .line 158
    if-eqz v2, :cond_2d

    iget-object v4, p0, Lorg/apache/http/impl/auth/NegotiateScheme;->spengoGenerator:Lorg/apache/http/impl/auth/SpnegoTokenGenerator;

    if-eqz v4, :cond_2d

    .line 160
    :try_start_27
    iget-object v4, p0, Lorg/apache/http/impl/auth/NegotiateScheme;->spengoGenerator:Lorg/apache/http/impl/auth/SpnegoTokenGenerator;

    invoke-interface {v4, v2}, Lorg/apache/http/impl/auth/SpnegoTokenGenerator;->generateSpnegoDERObject([B)[B
    :try_end_2c
    .catch Ljava/io/IOException; {:try_start_27 .. :try_end_2c} :catch_40

    move-result-object v2

    .line 166
    :cond_2d
    :goto_2d
    return-object v2

    .line 137
    :catch_2e
    move-exception v0

    .line 140
    .local v0, "ex":Lorg/ietf/jgss/GSSException;
    invoke-virtual {v0}, Lorg/ietf/jgss/GSSException;->getMajor()I

    move-result v4

    const/4 v5, 0x2

    if-ne v4, v5, :cond_3f

    .line 141
    iget-object v4, p0, Lorg/apache/http/impl/auth/NegotiateScheme;->log:Lorg/apache/commons/logging/Log;

    const-string v5, "GSSException BAD_MECH, retry with Kerberos MECH"

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 142
    const/4 v3, 0x1

    goto :goto_d

    .line 144
    :cond_3f
    throw v0

    .line 161
    .end local v0    # "ex":Lorg/ietf/jgss/GSSException;
    :catch_40
    move-exception v0

    .line 162
    .local v0, "ex":Ljava/io/IOException;
    iget-object v4, p0, Lorg/apache/http/impl/auth/NegotiateScheme;->log:Lorg/apache/commons/logging/Log;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, v0}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_2d
.end method

.method public getParameter(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 180
    const-string v0, "Parameter name"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 181
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRealm()Ljava/lang/String;
    .registers 2

    .prologue
    .line 191
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSchemeName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 83
    const-string v0, "Negotiate"

    return-object v0
.end method

.method public isConnectionBased()Z
    .registers 2

    .prologue
    .line 201
    const/4 v0, 0x1

    return v0
.end method
