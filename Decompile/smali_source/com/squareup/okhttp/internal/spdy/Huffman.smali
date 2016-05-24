.class Lcom/squareup/okhttp/internal/spdy/Huffman;
.super Ljava/lang/Object;
.source "Huffman.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/squareup/okhttp/internal/spdy/Huffman$Node;
    }
.end annotation


# static fields
.field private static final CODES:[I

.field private static final CODE_LENGTHS:[B

.field private static final INSTANCE:Lcom/squareup/okhttp/internal/spdy/Huffman;


# instance fields
.field private final root:Lcom/squareup/okhttp/internal/spdy/Huffman$Node;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/16 v1, 0x100

    .line 35
    new-array v0, v1, [I

    fill-array-data v0, :array_18

    sput-object v0, Lcom/squareup/okhttp/internal/spdy/Huffman;->CODES:[I

    .line 63
    new-array v0, v1, [B

    fill-array-data v0, :array_21c

    sput-object v0, Lcom/squareup/okhttp/internal/spdy/Huffman;->CODE_LENGTHS:[B

    .line 77
    new-instance v0, Lcom/squareup/okhttp/internal/spdy/Huffman;

    invoke-direct {v0}, Lcom/squareup/okhttp/internal/spdy/Huffman;-><init>()V

    sput-object v0, Lcom/squareup/okhttp/internal/spdy/Huffman;->INSTANCE:Lcom/squareup/okhttp/internal/spdy/Huffman;

    return-void

    .line 35
    :array_18
    .array-data 4
        0x1ff8
        0x7fffd8
        0xfffffe2
        0xfffffe3
        0xfffffe4
        0xfffffe5
        0xfffffe6
        0xfffffe7
        0xfffffe8
        0xffffea
        0x3ffffffc
        0xfffffe9
        0xfffffea
        0x3ffffffd
        0xfffffeb
        0xfffffec
        0xfffffed
        0xfffffee
        0xfffffef
        0xffffff0
        0xffffff1
        0xffffff2
        0x3ffffffe
        0xffffff3
        0xffffff4
        0xffffff5
        0xffffff6
        0xffffff7
        0xffffff8
        0xffffff9
        0xffffffa
        0xffffffb
        0x14
        0x3f8
        0x3f9
        0xffa
        0x1ff9
        0x15
        0xf8
        0x7fa
        0x3fa
        0x3fb
        0xf9
        0x7fb
        0xfa
        0x16
        0x17
        0x18
        0x0
        0x1
        0x2
        0x19
        0x1a
        0x1b
        0x1c
        0x1d
        0x1e
        0x1f
        0x5c
        0xfb
        0x7ffc
        0x20
        0xffb
        0x3fc
        0x1ffa
        0x21
        0x5d
        0x5e
        0x5f
        0x60
        0x61
        0x62
        0x63
        0x64
        0x65
        0x66
        0x67
        0x68
        0x69
        0x6a
        0x6b
        0x6c
        0x6d
        0x6e
        0x6f
        0x70
        0x71
        0x72
        0xfc
        0x73
        0xfd
        0x1ffb
        0x7fff0
        0x1ffc
        0x3ffc
        0x22
        0x7ffd
        0x3
        0x23
        0x4
        0x24
        0x5
        0x25
        0x26
        0x27
        0x6
        0x74
        0x75
        0x28
        0x29
        0x2a
        0x7
        0x2b
        0x76
        0x2c
        0x8
        0x9
        0x2d
        0x77
        0x78
        0x79
        0x7a
        0x7b
        0x7ffe
        0x7fc
        0x3ffd
        0x1ffd
        0xffffffc
        0xfffe6
        0x3fffd2
        0xfffe7
        0xfffe8
        0x3fffd3
        0x3fffd4
        0x3fffd5
        0x7fffd9
        0x3fffd6
        0x7fffda
        0x7fffdb
        0x7fffdc
        0x7fffdd
        0x7fffde
        0xffffeb
        0x7fffdf
        0xffffec
        0xffffed
        0x3fffd7
        0x7fffe0
        0xffffee
        0x7fffe1
        0x7fffe2
        0x7fffe3
        0x7fffe4
        0x1fffdc
        0x3fffd8
        0x7fffe5
        0x3fffd9
        0x7fffe6
        0x7fffe7
        0xffffef
        0x3fffda
        0x1fffdd
        0xfffe9
        0x3fffdb
        0x3fffdc
        0x7fffe8
        0x7fffe9
        0x1fffde
        0x7fffea
        0x3fffdd
        0x3fffde
        0xfffff0
        0x1fffdf
        0x3fffdf
        0x7fffeb
        0x7fffec
        0x1fffe0
        0x1fffe1
        0x3fffe0
        0x1fffe2
        0x7fffed
        0x3fffe1
        0x7fffee
        0x7fffef
        0xfffea
        0x3fffe2
        0x3fffe3
        0x3fffe4
        0x7ffff0
        0x3fffe5
        0x3fffe6
        0x7ffff1
        0x3ffffe0
        0x3ffffe1
        0xfffeb
        0x7fff1
        0x3fffe7
        0x7ffff2
        0x3fffe8
        0x1ffffec
        0x3ffffe2
        0x3ffffe3
        0x3ffffe4
        0x7ffffde
        0x7ffffdf
        0x3ffffe5
        0xfffff1
        0x1ffffed
        0x7fff2
        0x1fffe3
        0x3ffffe6
        0x7ffffe0
        0x7ffffe1
        0x3ffffe7
        0x7ffffe2
        0xfffff2
        0x1fffe4
        0x1fffe5
        0x3ffffe8
        0x3ffffe9
        0xffffffd
        0x7ffffe3
        0x7ffffe4
        0x7ffffe5
        0xfffec
        0xfffff3
        0xfffed
        0x1fffe6
        0x3fffe9
        0x1fffe7
        0x1fffe8
        0x7ffff3
        0x3fffea
        0x3fffeb
        0x1ffffee
        0x1ffffef
        0xfffff4
        0xfffff5
        0x3ffffea
        0x7ffff4
        0x3ffffeb
        0x7ffffe6
        0x3ffffec
        0x3ffffed
        0x7ffffe7
        0x7ffffe8
        0x7ffffe9
        0x7ffffea
        0x7ffffeb
        0xffffffe
        0x7ffffec
        0x7ffffed
        0x7ffffee
        0x7ffffef
        0x7fffff0
        0x3ffffee
    .end array-data

    .line 63
    :array_21c
    .array-data 1
        0xdt
        0x17t
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x18t
        0x1et
        0x1ct
        0x1ct
        0x1et
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1et
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x1ct
        0x6t
        0xat
        0xat
        0xct
        0xdt
        0x6t
        0x8t
        0xbt
        0xat
        0xat
        0x8t
        0xbt
        0x8t
        0x6t
        0x6t
        0x6t
        0x5t
        0x5t
        0x5t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x7t
        0x8t
        0xft
        0x6t
        0xct
        0xat
        0xdt
        0x6t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0x8t
        0x7t
        0x8t
        0xdt
        0x13t
        0xdt
        0xet
        0x6t
        0xft
        0x5t
        0x6t
        0x5t
        0x6t
        0x5t
        0x6t
        0x6t
        0x6t
        0x5t
        0x7t
        0x7t
        0x6t
        0x6t
        0x6t
        0x5t
        0x6t
        0x7t
        0x6t
        0x5t
        0x5t
        0x6t
        0x7t
        0x7t
        0x7t
        0x7t
        0x7t
        0xft
        0xbt
        0xet
        0xdt
        0x1ct
        0x14t
        0x16t
        0x14t
        0x14t
        0x16t
        0x16t
        0x16t
        0x17t
        0x16t
        0x17t
        0x17t
        0x17t
        0x17t
        0x17t
        0x18t
        0x17t
        0x18t
        0x18t
        0x16t
        0x17t
        0x18t
        0x17t
        0x17t
        0x17t
        0x17t
        0x15t
        0x16t
        0x17t
        0x16t
        0x17t
        0x17t
        0x18t
        0x16t
        0x15t
        0x14t
        0x16t
        0x16t
        0x17t
        0x17t
        0x15t
        0x17t
        0x16t
        0x16t
        0x18t
        0x15t
        0x16t
        0x17t
        0x17t
        0x15t
        0x15t
        0x16t
        0x15t
        0x17t
        0x16t
        0x17t
        0x17t
        0x14t
        0x16t
        0x16t
        0x16t
        0x17t
        0x16t
        0x16t
        0x17t
        0x1at
        0x1at
        0x14t
        0x13t
        0x16t
        0x17t
        0x16t
        0x19t
        0x1at
        0x1at
        0x1at
        0x1bt
        0x1bt
        0x1at
        0x18t
        0x19t
        0x13t
        0x15t
        0x1at
        0x1bt
        0x1bt
        0x1at
        0x1bt
        0x18t
        0x15t
        0x15t
        0x1at
        0x1at
        0x1ct
        0x1bt
        0x1bt
        0x1bt
        0x14t
        0x18t
        0x14t
        0x15t
        0x16t
        0x15t
        0x15t
        0x17t
        0x16t
        0x16t
        0x19t
        0x19t
        0x18t
        0x18t
        0x1at
        0x17t
        0x1at
        0x1bt
        0x1at
        0x1at
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1ct
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1bt
        0x1at
    .end array-data
.end method

.method private constructor <init>()V
    .registers 2

    .prologue
    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    new-instance v0, Lcom/squareup/okhttp/internal/spdy/Huffman$Node;

    invoke-direct {v0}, Lcom/squareup/okhttp/internal/spdy/Huffman$Node;-><init>()V

    iput-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Huffman;->root:Lcom/squareup/okhttp/internal/spdy/Huffman$Node;

    .line 86
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/spdy/Huffman;->buildTree()V

    .line 87
    return-void
.end method

.method private addCode(IIB)V
    .registers 12
    .param p1, "sym"    # I
    .param p2, "code"    # I
    .param p3, "len"    # B

    .prologue
    .line 171
    new-instance v5, Lcom/squareup/okhttp/internal/spdy/Huffman$Node;

    invoke-direct {v5, p1, p3}, Lcom/squareup/okhttp/internal/spdy/Huffman$Node;-><init>(II)V

    .line 173
    .local v5, "terminal":Lcom/squareup/okhttp/internal/spdy/Huffman$Node;
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Huffman;->root:Lcom/squareup/okhttp/internal/spdy/Huffman$Node;

    .line 174
    .local v0, "current":Lcom/squareup/okhttp/internal/spdy/Huffman$Node;
    :goto_7
    const/16 v6, 0x8

    if-le p3, v6, :cond_3a

    .line 175
    add-int/lit8 v6, p3, -0x8

    int-to-byte p3, v6

    .line 176
    ushr-int v6, p2, p3

    and-int/lit16 v2, v6, 0xff

    .line 177
    .local v2, "i":I
    # getter for: Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->children:[Lcom/squareup/okhttp/internal/spdy/Huffman$Node;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->access$000(Lcom/squareup/okhttp/internal/spdy/Huffman$Node;)[Lcom/squareup/okhttp/internal/spdy/Huffman$Node;

    move-result-object v6

    if-nez v6, :cond_20

    .line 178
    new-instance v6, Ljava/lang/IllegalStateException;

    const-string v7, "invalid dictionary: prefix not unique"

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 180
    :cond_20
    # getter for: Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->children:[Lcom/squareup/okhttp/internal/spdy/Huffman$Node;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->access$000(Lcom/squareup/okhttp/internal/spdy/Huffman$Node;)[Lcom/squareup/okhttp/internal/spdy/Huffman$Node;

    move-result-object v6

    aget-object v6, v6, v2

    if-nez v6, :cond_33

    .line 181
    # getter for: Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->children:[Lcom/squareup/okhttp/internal/spdy/Huffman$Node;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->access$000(Lcom/squareup/okhttp/internal/spdy/Huffman$Node;)[Lcom/squareup/okhttp/internal/spdy/Huffman$Node;

    move-result-object v6

    new-instance v7, Lcom/squareup/okhttp/internal/spdy/Huffman$Node;

    invoke-direct {v7}, Lcom/squareup/okhttp/internal/spdy/Huffman$Node;-><init>()V

    aput-object v7, v6, v2

    .line 183
    :cond_33
    # getter for: Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->children:[Lcom/squareup/okhttp/internal/spdy/Huffman$Node;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->access$000(Lcom/squareup/okhttp/internal/spdy/Huffman$Node;)[Lcom/squareup/okhttp/internal/spdy/Huffman$Node;

    move-result-object v6

    aget-object v0, v6, v2

    .line 184
    goto :goto_7

    .line 186
    .end local v2    # "i":I
    :cond_3a
    rsub-int/lit8 v3, p3, 0x8

    .line 187
    .local v3, "shift":I
    shl-int v6, p2, v3

    and-int/lit16 v4, v6, 0xff

    .line 188
    .local v4, "start":I
    const/4 v6, 0x1

    shl-int v1, v6, v3

    .line 189
    .local v1, "end":I
    move v2, v4

    .restart local v2    # "i":I
    :goto_44
    add-int v6, v4, v1

    if-ge v2, v6, :cond_51

    .line 190
    # getter for: Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->children:[Lcom/squareup/okhttp/internal/spdy/Huffman$Node;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->access$000(Lcom/squareup/okhttp/internal/spdy/Huffman$Node;)[Lcom/squareup/okhttp/internal/spdy/Huffman$Node;

    move-result-object v6

    aput-object v5, v6, v2

    .line 189
    add-int/lit8 v2, v2, 0x1

    goto :goto_44

    .line 192
    :cond_51
    return-void
.end method

.method private buildTree()V
    .registers 4

    .prologue
    .line 165
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    sget-object v1, Lcom/squareup/okhttp/internal/spdy/Huffman;->CODE_LENGTHS:[B

    array-length v1, v1

    if-ge v0, v1, :cond_14

    .line 166
    sget-object v1, Lcom/squareup/okhttp/internal/spdy/Huffman;->CODES:[I

    aget v1, v1, v0

    sget-object v2, Lcom/squareup/okhttp/internal/spdy/Huffman;->CODE_LENGTHS:[B

    aget-byte v2, v2, v0

    invoke-direct {p0, v0, v1, v2}, Lcom/squareup/okhttp/internal/spdy/Huffman;->addCode(IIB)V

    .line 165
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 168
    :cond_14
    return-void
.end method

.method public static get()Lcom/squareup/okhttp/internal/spdy/Huffman;
    .registers 1

    .prologue
    .line 80
    sget-object v0, Lcom/squareup/okhttp/internal/spdy/Huffman;->INSTANCE:Lcom/squareup/okhttp/internal/spdy/Huffman;

    return-object v0
.end method


# virtual methods
.method decode([B)[B
    .registers 10
    .param p1, "buf"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 127
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 128
    .local v1, "baos":Ljava/io/ByteArrayOutputStream;
    iget-object v6, p0, Lcom/squareup/okhttp/internal/spdy/Huffman;->root:Lcom/squareup/okhttp/internal/spdy/Huffman$Node;

    .line 129
    .local v6, "node":Lcom/squareup/okhttp/internal/spdy/Huffman$Node;
    const/4 v3, 0x0

    .line 130
    .local v3, "current":I
    const/4 v5, 0x0

    .line 131
    .local v5, "nbits":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_a
    array-length v7, p1

    if-ge v4, v7, :cond_50

    .line 132
    aget-byte v7, p1, v4

    and-int/lit16 v0, v7, 0xff

    .line 133
    .local v0, "b":I
    shl-int/lit8 v7, v3, 0x8

    or-int v3, v7, v0

    .line 134
    add-int/lit8 v5, v5, 0x8

    .line 135
    :goto_17
    const/16 v7, 0x8

    if-lt v5, v7, :cond_3f

    .line 136
    add-int/lit8 v7, v5, -0x8

    ushr-int v7, v3, v7

    and-int/lit16 v2, v7, 0xff

    .line 137
    .local v2, "c":I
    # getter for: Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->children:[Lcom/squareup/okhttp/internal/spdy/Huffman$Node;
    invoke-static {v6}, Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->access$000(Lcom/squareup/okhttp/internal/spdy/Huffman$Node;)[Lcom/squareup/okhttp/internal/spdy/Huffman$Node;

    move-result-object v7

    aget-object v6, v7, v2

    .line 138
    # getter for: Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->children:[Lcom/squareup/okhttp/internal/spdy/Huffman$Node;
    invoke-static {v6}, Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->access$000(Lcom/squareup/okhttp/internal/spdy/Huffman$Node;)[Lcom/squareup/okhttp/internal/spdy/Huffman$Node;

    move-result-object v7

    if-nez v7, :cond_3c

    .line 140
    # getter for: Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->symbol:I
    invoke-static {v6}, Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->access$100(Lcom/squareup/okhttp/internal/spdy/Huffman$Node;)I

    move-result v7

    invoke-virtual {v1, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 141
    # getter for: Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->terminalBits:I
    invoke-static {v6}, Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->access$200(Lcom/squareup/okhttp/internal/spdy/Huffman$Node;)I

    move-result v7

    sub-int/2addr v5, v7

    .line 142
    iget-object v6, p0, Lcom/squareup/okhttp/internal/spdy/Huffman;->root:Lcom/squareup/okhttp/internal/spdy/Huffman$Node;

    goto :goto_17

    .line 145
    :cond_3c
    add-int/lit8 v5, v5, -0x8

    goto :goto_17

    .line 131
    .end local v2    # "c":I
    :cond_3f
    add-int/lit8 v4, v4, 0x1

    goto :goto_a

    .line 156
    .end local v0    # "b":I
    .restart local v2    # "c":I
    :cond_42
    # getter for: Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->symbol:I
    invoke-static {v6}, Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->access$100(Lcom/squareup/okhttp/internal/spdy/Huffman$Node;)I

    move-result v7

    invoke-virtual {v1, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 157
    # getter for: Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->terminalBits:I
    invoke-static {v6}, Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->access$200(Lcom/squareup/okhttp/internal/spdy/Huffman$Node;)I

    move-result v7

    sub-int/2addr v5, v7

    .line 158
    iget-object v6, p0, Lcom/squareup/okhttp/internal/spdy/Huffman;->root:Lcom/squareup/okhttp/internal/spdy/Huffman$Node;

    .line 150
    .end local v2    # "c":I
    :cond_50
    if-lez v5, :cond_6a

    .line 151
    rsub-int/lit8 v7, v5, 0x8

    shl-int v7, v3, v7

    and-int/lit16 v2, v7, 0xff

    .line 152
    .restart local v2    # "c":I
    # getter for: Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->children:[Lcom/squareup/okhttp/internal/spdy/Huffman$Node;
    invoke-static {v6}, Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->access$000(Lcom/squareup/okhttp/internal/spdy/Huffman$Node;)[Lcom/squareup/okhttp/internal/spdy/Huffman$Node;

    move-result-object v7

    aget-object v6, v7, v2

    .line 153
    # getter for: Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->children:[Lcom/squareup/okhttp/internal/spdy/Huffman$Node;
    invoke-static {v6}, Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->access$000(Lcom/squareup/okhttp/internal/spdy/Huffman$Node;)[Lcom/squareup/okhttp/internal/spdy/Huffman$Node;

    move-result-object v7

    if-nez v7, :cond_6a

    # getter for: Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->terminalBits:I
    invoke-static {v6}, Lcom/squareup/okhttp/internal/spdy/Huffman$Node;->access$200(Lcom/squareup/okhttp/internal/spdy/Huffman$Node;)I

    move-result v7

    if-le v7, v5, :cond_42

    .line 161
    .end local v2    # "c":I
    :cond_6a
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v7

    return-object v7
.end method
