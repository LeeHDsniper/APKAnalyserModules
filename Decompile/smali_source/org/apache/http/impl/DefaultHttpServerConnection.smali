.class public Lorg/apache/http/impl/DefaultHttpServerConnection;
.super Lorg/apache/http/impl/SocketHttpServerConnection;
.source "DefaultHttpServerConnection.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 50
    invoke-direct {p0}, Lorg/apache/http/impl/SocketHttpServerConnection;-><init>()V

    .line 51
    return-void
.end method


# virtual methods
.method public bind(Ljava/net/Socket;Lorg/apache/http/params/HttpParams;)V
    .registers 8
    .param p1, "socket"    # Ljava/net/Socket;
    .param p2, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 55
    const-string v1, "Socket"

    invoke-static {p1, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 56
    const-string v1, "HTTP parameters"

    invoke-static {p2, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 57
    invoke-virtual {p0}, Lorg/apache/http/impl/DefaultHttpServerConnection;->assertNotOpen()V

    .line 58
    const-string v1, "http.tcp.nodelay"

    invoke-interface {p2, v1, v2}, Lorg/apache/http/params/HttpParams;->getBooleanParameter(Ljava/lang/String;Z)Z

    move-result v1

    invoke-virtual {p1, v1}, Ljava/net/Socket;->setTcpNoDelay(Z)V

    .line 59
    const-string v1, "http.socket.timeout"

    invoke-interface {p2, v1, v3}, Lorg/apache/http/params/HttpParams;->getIntParameter(Ljava/lang/String;I)I

    move-result v1

    invoke-virtual {p1, v1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 60
    const-string v1, "http.socket.keepalive"

    invoke-interface {p2, v1, v3}, Lorg/apache/http/params/HttpParams;->getBooleanParameter(Ljava/lang/String;Z)Z

    move-result v1

    invoke-virtual {p1, v1}, Ljava/net/Socket;->setKeepAlive(Z)V

    .line 61
    const-string v1, "http.socket.linger"

    const/4 v4, -0x1

    invoke-interface {p2, v1, v4}, Lorg/apache/http/params/HttpParams;->getIntParameter(Ljava/lang/String;I)I

    move-result v0

    .line 62
    .local v0, "linger":I
    if-ltz v0, :cond_39

    .line 63
    if-lez v0, :cond_44

    move v1, v2

    :goto_36
    invoke-virtual {p1, v1, v0}, Ljava/net/Socket;->setSoLinger(ZI)V

    .line 65
    :cond_39
    if-ltz v0, :cond_40

    .line 66
    if-lez v0, :cond_46

    :goto_3d
    invoke-virtual {p1, v2, v0}, Ljava/net/Socket;->setSoLinger(ZI)V

    .line 68
    :cond_40
    invoke-super {p0, p1, p2}, Lorg/apache/http/impl/SocketHttpServerConnection;->bind(Ljava/net/Socket;Lorg/apache/http/params/HttpParams;)V

    .line 69
    return-void

    :cond_44
    move v1, v3

    .line 63
    goto :goto_36

    :cond_46
    move v2, v3

    .line 66
    goto :goto_3d
.end method
