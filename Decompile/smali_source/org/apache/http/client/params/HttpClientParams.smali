.class public Lorg/apache/http/client/params/HttpClientParams;
.super Ljava/lang/Object;
.source "HttpClientParams.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    return-void
.end method

.method public static getConnectionManagerTimeout(Lorg/apache/http/params/HttpParams;)J
    .registers 5
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 108
    const-string v1, "HTTP parameters"

    invoke-static {p0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 109
    const-string v1, "http.conn-manager.timeout"

    invoke-interface {p0, v1}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    .line 110
    .local v0, "timeout":Ljava/lang/Long;
    if-eqz v0, :cond_14

    .line 111
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    .line 113
    :goto_13
    return-wide v2

    :cond_14
    invoke-static {p0}, Lorg/apache/http/params/HttpConnectionParams;->getConnectionTimeout(Lorg/apache/http/params/HttpParams;)I

    move-result v1

    int-to-long v2, v1

    goto :goto_13
.end method

.method public static getCookiePolicy(Lorg/apache/http/params/HttpParams;)Ljava/lang/String;
    .registers 3
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 74
    const-string v1, "HTTP parameters"

    invoke-static {p0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 75
    const-string v1, "http.protocol.cookie-policy"

    invoke-interface {p0, v1}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 77
    .local v0, "cookiePolicy":Ljava/lang/String;
    if-nez v0, :cond_11

    .line 78
    const-string v0, "best-match"

    .line 80
    .end local v0    # "cookiePolicy":Ljava/lang/String;
    :cond_11
    return-object v0
.end method

.method public static isAuthenticating(Lorg/apache/http/params/HttpParams;)Z
    .registers 3
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 62
    const-string v0, "HTTP parameters"

    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 63
    const-string v0, "http.protocol.handle-authentication"

    const/4 v1, 0x1

    invoke-interface {p0, v0, v1}, Lorg/apache/http/params/HttpParams;->getBooleanParameter(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isRedirecting(Lorg/apache/http/params/HttpParams;)Z
    .registers 3
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 50
    const-string v0, "HTTP parameters"

    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 51
    const-string v0, "http.protocol.handle-redirects"

    const/4 v1, 0x1

    invoke-interface {p0, v0, v1}, Lorg/apache/http/params/HttpParams;->getBooleanParameter(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static setAuthenticating(Lorg/apache/http/params/HttpParams;Z)V
    .registers 3
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;
    .param p1, "value"    # Z

    .prologue
    .line 68
    const-string v0, "HTTP parameters"

    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 69
    const-string v0, "http.protocol.handle-authentication"

    invoke-interface {p0, v0, p1}, Lorg/apache/http/params/HttpParams;->setBooleanParameter(Ljava/lang/String;Z)Lorg/apache/http/params/HttpParams;

    .line 71
    return-void
.end method

.method public static setConnectionManagerTimeout(Lorg/apache/http/params/HttpParams;J)V
    .registers 4
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;
    .param p1, "timeout"    # J

    .prologue
    .line 94
    const-string v0, "HTTP parameters"

    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 95
    const-string v0, "http.conn-manager.timeout"

    invoke-interface {p0, v0, p1, p2}, Lorg/apache/http/params/HttpParams;->setLongParameter(Ljava/lang/String;J)Lorg/apache/http/params/HttpParams;

    .line 96
    return-void
.end method

.method public static setCookiePolicy(Lorg/apache/http/params/HttpParams;Ljava/lang/String;)V
    .registers 3
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;
    .param p1, "cookiePolicy"    # Ljava/lang/String;

    .prologue
    .line 84
    const-string v0, "HTTP parameters"

    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 85
    const-string v0, "http.protocol.cookie-policy"

    invoke-interface {p0, v0, p1}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 86
    return-void
.end method

.method public static setRedirecting(Lorg/apache/http/params/HttpParams;Z)V
    .registers 3
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;
    .param p1, "value"    # Z

    .prologue
    .line 56
    const-string v0, "HTTP parameters"

    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 57
    const-string v0, "http.protocol.handle-redirects"

    invoke-interface {p0, v0, p1}, Lorg/apache/http/params/HttpParams;->setBooleanParameter(Ljava/lang/String;Z)Lorg/apache/http/params/HttpParams;

    .line 59
    return-void
.end method
