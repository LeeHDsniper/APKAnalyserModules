.class public Lorg/apache/http/impl/auth/KerberosScheme;
.super Lorg/apache/http/impl/auth/GGSSchemeBase;
.source "KerberosScheme.java"


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# static fields
.field private static final KERBEROS_OID:Ljava/lang/String; = "1.2.840.113554.1.2.2"


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 54
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/http/impl/auth/GGSSchemeBase;-><init>(Z)V

    .line 55
    return-void
.end method

.method public constructor <init>(Z)V
    .registers 2
    .param p1, "stripPort"    # Z

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lorg/apache/http/impl/auth/GGSSchemeBase;-><init>(Z)V

    .line 51
    return-void
.end method


# virtual methods
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
    .line 78
    invoke-super {p0, p1, p2, p3}, Lorg/apache/http/impl/auth/GGSSchemeBase;->authenticate(Lorg/apache/http/auth/Credentials;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/Header;

    move-result-object v0

    return-object v0
.end method

.method protected generateToken([BLjava/lang/String;)[B
    .registers 5
    .param p1, "input"    # [B
    .param p2, "authServer"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/ietf/jgss/GSSException;
        }
    .end annotation

    .prologue
    .line 83
    new-instance v0, Lorg/ietf/jgss/Oid;

    const-string v1, "1.2.840.113554.1.2.2"

    invoke-direct {v0, v1}, Lorg/ietf/jgss/Oid;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/http/impl/auth/KerberosScheme;->generateGSSToken([BLorg/ietf/jgss/Oid;Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method public getParameter(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 93
    const-string v0, "Parameter name"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 94
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRealm()Ljava/lang/String;
    .registers 2

    .prologue
    .line 104
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSchemeName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 58
    const-string v0, "Kerberos"

    return-object v0
.end method

.method public isConnectionBased()Z
    .registers 2

    .prologue
    .line 113
    const/4 v0, 0x1

    return v0
.end method
