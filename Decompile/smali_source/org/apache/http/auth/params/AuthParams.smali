.class public final Lorg/apache/http/auth/params/AuthParams;
.super Ljava/lang/Object;
.source "AuthParams.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    return-void
.end method

.method public static getCredentialCharset(Lorg/apache/http/params/HttpParams;)Ljava/lang/String;
    .registers 3
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 61
    const-string v1, "HTTP parameters"

    invoke-static {p0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 62
    const-string v1, "http.auth.credential-charset"

    invoke-interface {p0, v1}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 64
    .local v0, "charset":Ljava/lang/String;
    if-nez v0, :cond_15

    .line 65
    sget-object v1, Lorg/apache/http/protocol/HTTP;->DEF_PROTOCOL_CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {v1}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v0

    .line 67
    :cond_15
    return-object v0
.end method

.method public static setCredentialCharset(Lorg/apache/http/params/HttpParams;Ljava/lang/String;)V
    .registers 3
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;
    .param p1, "charset"    # Ljava/lang/String;

    .prologue
    .line 78
    const-string v0, "HTTP parameters"

    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 79
    const-string v0, "http.auth.credential-charset"

    invoke-interface {p0, v0, p1}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 80
    return-void
.end method
