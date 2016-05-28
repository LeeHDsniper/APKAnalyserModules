.class final Lcom/squareup/okhttp/internal/spdy/Huffman$Node;
.super Ljava/lang/Object;
.source "Huffman.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/spdy/Huffman;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Node"
.end annotation


# instance fields
.field private final children:[Lcom/squareup/okhttp/internal/spdy/Huffman$Node;

.field private final symbol:I

.field private final terminalBits:I


# direct methods
.method constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 206
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 207
    const/16 v0, 0x100

    new-array v0, v0, [Lcom/squareup/okhttp/internal/spdy/Huffman$Node;

    iput-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->children:[Lcom/squareup/okhttp/internal/spdy/Huffman$Node;

    .line 208
    iput v1, p0, Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->symbol:I

    .line 209
    iput v1, p0, Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->terminalBits:I

    .line 210
    return-void
.end method

.method constructor <init>(II)V
    .registers 5
    .param p1, "symbol"    # I
    .param p2, "bits"    # I

    .prologue
    .line 218
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 219
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->children:[Lcom/squareup/okhttp/internal/spdy/Huffman$Node;

    .line 220
    iput p1, p0, Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->symbol:I

    .line 221
    and-int/lit8 v0, p2, 0x7

    .line 222
    .local v0, "b":I
    if-nez v0, :cond_e

    const/16 v0, 0x8

    .end local v0    # "b":I
    :cond_e
    iput v0, p0, Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->terminalBits:I

    .line 223
    return-void
.end method

.method static synthetic access$000(Lcom/squareup/okhttp/internal/spdy/Huffman$Node;)[Lcom/squareup/okhttp/internal/spdy/Huffman$Node;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/spdy/Huffman$Node;

    .prologue
    .line 194
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->children:[Lcom/squareup/okhttp/internal/spdy/Huffman$Node;

    return-object v0
.end method

.method static synthetic access$100(Lcom/squareup/okhttp/internal/spdy/Huffman$Node;)I
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/spdy/Huffman$Node;

    .prologue
    .line 194
    iget v0, p0, Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->symbol:I

    return v0
.end method

.method static synthetic access$200(Lcom/squareup/okhttp/internal/spdy/Huffman$Node;)I
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/spdy/Huffman$Node;

    .prologue
    .line 194
    iget v0, p0, Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->terminalBits:I

    return v0
.end method
