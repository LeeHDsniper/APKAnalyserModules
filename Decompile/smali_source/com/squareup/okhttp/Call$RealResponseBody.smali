.class Lcom/squareup/okhttp/Call$RealResponseBody;
.super Lcom/squareup/okhttp/ResponseBody;
.source "Call.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/Call;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RealResponseBody"
.end annotation


# instance fields
.field private final response:Lcom/squareup/okhttp/Response;

.field private final source:Lokio/BufferedSource;


# direct methods
.method constructor <init>(Lcom/squareup/okhttp/Response;Lokio/BufferedSource;)V
    .registers 3
    .param p1, "response"    # Lcom/squareup/okhttp/Response;
    .param p2, "source"    # Lokio/BufferedSource;

    .prologue
    .line 280
    invoke-direct {p0}, Lcom/squareup/okhttp/ResponseBody;-><init>()V

    .line 281
    iput-object p1, p0, Lcom/squareup/okhttp/Call$RealResponseBody;->response:Lcom/squareup/okhttp/Response;

    .line 282
    iput-object p2, p0, Lcom/squareup/okhttp/Call$RealResponseBody;->source:Lokio/BufferedSource;

    .line 283
    return-void
.end method


# virtual methods
.method public contentLength()J
    .registers 3

    .prologue
    .line 291
    iget-object v0, p0, Lcom/squareup/okhttp/Call$RealResponseBody;->response:Lcom/squareup/okhttp/Response;

    invoke-static {v0}, Lcom/squareup/okhttp/internal/http/OkHeaders;->contentLength(Lcom/squareup/okhttp/Response;)J

    move-result-wide v0

    return-wide v0
.end method

.method public source()Lokio/BufferedSource;
    .registers 2

    .prologue
    .line 295
    iget-object v0, p0, Lcom/squareup/okhttp/Call$RealResponseBody;->source:Lokio/BufferedSource;

    return-object v0
.end method
