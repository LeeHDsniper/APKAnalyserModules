.class public final Lcom/squareup/okhttp/internal/spdy/Header;
.super Ljava/lang/Object;
.source "Header.java"


# static fields
.field public static final RESPONSE_STATUS:Lokio/ByteString;

.field public static final TARGET_AUTHORITY:Lokio/ByteString;

.field public static final TARGET_HOST:Lokio/ByteString;

.field public static final TARGET_METHOD:Lokio/ByteString;

.field public static final TARGET_PATH:Lokio/ByteString;

.field public static final TARGET_SCHEME:Lokio/ByteString;

.field public static final VERSION:Lokio/ByteString;


# instance fields
.field final hpackSize:I

.field public final name:Lokio/ByteString;

.field public final value:Lokio/ByteString;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 8
    const-string v0, ":status"

    invoke-static {v0}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/internal/spdy/Header;->RESPONSE_STATUS:Lokio/ByteString;

    .line 9
    const-string v0, ":method"

    invoke-static {v0}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/internal/spdy/Header;->TARGET_METHOD:Lokio/ByteString;

    .line 10
    const-string v0, ":path"

    invoke-static {v0}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/internal/spdy/Header;->TARGET_PATH:Lokio/ByteString;

    .line 11
    const-string v0, ":scheme"

    invoke-static {v0}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/internal/spdy/Header;->TARGET_SCHEME:Lokio/ByteString;

    .line 12
    const-string v0, ":authority"

    invoke-static {v0}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/internal/spdy/Header;->TARGET_AUTHORITY:Lokio/ByteString;

    .line 13
    const-string v0, ":host"

    invoke-static {v0}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/internal/spdy/Header;->TARGET_HOST:Lokio/ByteString;

    .line 14
    const-string v0, ":version"

    invoke-static {v0}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    sput-object v0, Lcom/squareup/okhttp/internal/spdy/Header;->VERSION:Lokio/ByteString;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 24
    invoke-static {p1}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    invoke-static {p2}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/squareup/okhttp/internal/spdy/Header;-><init>(Lokio/ByteString;Lokio/ByteString;)V

    .line 25
    return-void
.end method

.method public constructor <init>(Lokio/ByteString;Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Lokio/ByteString;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 28
    invoke-static {p2}, Lokio/ByteString;->encodeUtf8(Ljava/lang/String;)Lokio/ByteString;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/squareup/okhttp/internal/spdy/Header;-><init>(Lokio/ByteString;Lokio/ByteString;)V

    .line 29
    return-void
.end method

.method public constructor <init>(Lokio/ByteString;Lokio/ByteString;)V
    .registers 5
    .param p1, "name"    # Lokio/ByteString;
    .param p2, "value"    # Lokio/ByteString;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/squareup/okhttp/internal/spdy/Header;->name:Lokio/ByteString;

    .line 33
    iput-object p2, p0, Lcom/squareup/okhttp/internal/spdy/Header;->value:Lokio/ByteString;

    .line 34
    invoke-virtual {p1}, Lokio/ByteString;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0x20

    invoke-virtual {p2}, Lokio/ByteString;->size()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/squareup/okhttp/internal/spdy/Header;->hpackSize:I

    .line 35
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 38
    instance-of v2, p1, Lcom/squareup/okhttp/internal/spdy/Header;

    if-eqz v2, :cond_1d

    move-object v0, p1

    .line 39
    check-cast v0, Lcom/squareup/okhttp/internal/spdy/Header;

    .line 40
    .local v0, "that":Lcom/squareup/okhttp/internal/spdy/Header;
    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/Header;->name:Lokio/ByteString;

    iget-object v3, v0, Lcom/squareup/okhttp/internal/spdy/Header;->name:Lokio/ByteString;

    invoke-virtual {v2, v3}, Lokio/ByteString;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d

    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/Header;->value:Lokio/ByteString;

    iget-object v3, v0, Lcom/squareup/okhttp/internal/spdy/Header;->value:Lokio/ByteString;

    invoke-virtual {v2, v3}, Lokio/ByteString;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d

    const/4 v1, 0x1

    .line 43
    .end local v0    # "that":Lcom/squareup/okhttp/internal/spdy/Header;
    :cond_1d
    return v1
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 47
    const/16 v0, 0x11

    .line 48
    .local v0, "result":I
    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/Header;->name:Lokio/ByteString;

    invoke-virtual {v1}, Lokio/ByteString;->hashCode()I

    move-result v1

    add-int/lit16 v0, v1, 0x20f

    .line 49
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/Header;->value:Lokio/ByteString;

    invoke-virtual {v2}, Lokio/ByteString;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 50
    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 54
    const-string v0, "%s: %s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/squareup/okhttp/internal/spdy/Header;->name:Lokio/ByteString;

    invoke-virtual {v3}, Lokio/ByteString;->utf8()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/squareup/okhttp/internal/spdy/Header;->value:Lokio/ByteString;

    invoke-virtual {v3}, Lokio/ByteString;->utf8()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
