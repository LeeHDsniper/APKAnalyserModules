.class Lcom/squareup/okhttp/OkUrlFactory$1;
.super Ljava/net/URLStreamHandler;
.source "OkUrlFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/squareup/okhttp/OkUrlFactory;->createURLStreamHandler(Ljava/lang/String;)Ljava/net/URLStreamHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/squareup/okhttp/OkUrlFactory;

.field final synthetic val$protocol:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/squareup/okhttp/OkUrlFactory;Ljava/lang/String;)V
    .registers 3

    .prologue
    .line 87
    iput-object p1, p0, Lcom/squareup/okhttp/OkUrlFactory$1;->this$0:Lcom/squareup/okhttp/OkUrlFactory;

    iput-object p2, p0, Lcom/squareup/okhttp/OkUrlFactory$1;->val$protocol:Ljava/lang/String;

    invoke-direct {p0}, Ljava/net/URLStreamHandler;-><init>()V

    return-void
.end method


# virtual methods
.method protected getDefaultPort()I
    .registers 3

    .prologue
    .line 97
    iget-object v0, p0, Lcom/squareup/okhttp/OkUrlFactory$1;->val$protocol:Ljava/lang/String;

    const-string v1, "http"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    const/16 v0, 0x50

    .line 98
    :goto_c
    return v0

    :cond_d
    iget-object v0, p0, Lcom/squareup/okhttp/OkUrlFactory$1;->val$protocol:Ljava/lang/String;

    const-string v1, "https"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    const/16 v0, 0x1bb

    goto :goto_c

    .line 99
    :cond_1a
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method protected openConnection(Ljava/net/URL;)Ljava/net/URLConnection;
    .registers 3
    .param p1, "url"    # Ljava/net/URL;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/squareup/okhttp/OkUrlFactory$1;->this$0:Lcom/squareup/okhttp/OkUrlFactory;

    invoke-virtual {v0, p1}, Lcom/squareup/okhttp/OkUrlFactory;->open(Ljava/net/URL;)Ljava/net/HttpURLConnection;

    move-result-object v0

    return-object v0
.end method

.method protected openConnection(Ljava/net/URL;Ljava/net/Proxy;)Ljava/net/URLConnection;
    .registers 4
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "proxy"    # Ljava/net/Proxy;

    .prologue
    .line 93
    iget-object v0, p0, Lcom/squareup/okhttp/OkUrlFactory$1;->this$0:Lcom/squareup/okhttp/OkUrlFactory;

    invoke-virtual {v0, p1, p2}, Lcom/squareup/okhttp/OkUrlFactory;->open(Ljava/net/URL;Ljava/net/Proxy;)Ljava/net/HttpURLConnection;

    move-result-object v0

    return-object v0
.end method
