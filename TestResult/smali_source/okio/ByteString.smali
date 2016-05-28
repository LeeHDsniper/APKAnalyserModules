.class public final Lokio/ByteString;
.super Ljava/lang/Object;
.source "ByteString.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final EMPTY:Lokio/ByteString;

.field private static final HEX_DIGITS:[C

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field final data:[B

.field private transient hashCode:I

.field private transient utf8:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 44
    const/16 v0, 0x10

    new-array v0, v0, [C

    fill-array-data v0, :array_14

    sput-object v0, Lokio/ByteString;->HEX_DIGITS:[C

    .line 49
    const/4 v0, 0x0

    new-array v0, v0, [B

    invoke-static {v0}, Lokio/ByteString;->of([B)Lokio/ByteString;

    move-result-object v0

    sput-object v0, Lokio/ByteString;->EMPTY:Lokio/ByteString;

    return-void

    .line 44
    nop

    :array_14
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
    .end array-data
.end method

.method constructor <init>([B)V
    .registers 2
    .param p1, "data"    # [B

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-object p1, p0, Lokio/ByteString;->data:[B

    .line 57
    return-void
.end method

.method public static decodeBase64(Ljava/lang/String;)Lokio/ByteString;
    .registers 4
    .param p0, "base64"    # Ljava/lang/String;

    .prologue
    .line 109
    if-nez p0, :cond_a

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "base64 == null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 110
    :cond_a
    invoke-static {p0}, Lokio/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v0

    .line 111
    .local v0, "decoded":[B
    if-eqz v0, :cond_16

    new-instance v1, Lokio/ByteString;

    invoke-direct {v1, v0}, Lokio/ByteString;-><init>([B)V

    :goto_15
    return-object v1

    :cond_16
    const/4 v1, 0x0

    goto :goto_15
.end method

.method public static encodeUtf8(Ljava/lang/String;)Lokio/ByteString;
    .registers 4
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 82
    if-nez p0, :cond_a

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "s == null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 83
    :cond_a
    new-instance v0, Lokio/ByteString;

    sget-object v1, Lokio/Util;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    invoke-direct {v0, v1}, Lokio/ByteString;-><init>([B)V

    .line 84
    .local v0, "byteString":Lokio/ByteString;
    iput-object p0, v0, Lokio/ByteString;->utf8:Ljava/lang/String;

    .line 85
    return-object v0
.end method

.method public static varargs of([B)Lokio/ByteString;
    .registers 3
    .param p0, "data"    # [B

    .prologue
    .line 63
    if-nez p0, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "data == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 64
    :cond_a
    new-instance v1, Lokio/ByteString;

    invoke-virtual {p0}, [B->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    invoke-direct {v1, v0}, Lokio/ByteString;-><init>([B)V

    return-object v1
.end method

.method public static read(Ljava/io/InputStream;I)Lokio/ByteString;
    .registers 8
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "byteCount"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 153
    if-nez p0, :cond_a

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "in == null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 154
    :cond_a
    if-gez p1, :cond_25

    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "byteCount < 0: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 156
    :cond_25
    new-array v2, p1, [B

    .line 157
    .local v2, "result":[B
    const/4 v0, 0x0

    .local v0, "offset":I
    :goto_28
    if-ge v0, p1, :cond_3b

    .line 158
    sub-int v3, p1, v0

    invoke-virtual {p0, v2, v0, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .line 159
    .local v1, "read":I
    const/4 v3, -0x1

    if-ne v1, v3, :cond_39

    new-instance v3, Ljava/io/EOFException;

    invoke-direct {v3}, Ljava/io/EOFException;-><init>()V

    throw v3

    .line 157
    :cond_39
    add-int/2addr v0, v1

    goto :goto_28

    .line 161
    .end local v1    # "read":I
    :cond_3b
    new-instance v3, Lokio/ByteString;

    invoke-direct {v3, v2}, Lokio/ByteString;-><init>([B)V

    return-object v3
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 8
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 266
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v1

    .line 267
    .local v1, "dataLength":I
    invoke-static {p1, v1}, Lokio/ByteString;->read(Ljava/io/InputStream;I)Lokio/ByteString;

    move-result-object v0

    .line 269
    .local v0, "byteString":Lokio/ByteString;
    :try_start_8
    const-class v4, Lokio/ByteString;

    const-string v5, "data"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    .line 270
    .local v3, "field":Ljava/lang/reflect/Field;
    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 271
    iget-object v4, v0, Lokio/ByteString;->data:[B

    invoke-virtual {v3, p0, v4}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_19
    .catch Ljava/lang/NoSuchFieldException; {:try_start_8 .. :try_end_19} :catch_1a
    .catch Ljava/lang/IllegalAccessException; {:try_start_8 .. :try_end_19} :catch_21

    .line 277
    return-void

    .line 272
    .end local v3    # "field":Ljava/lang/reflect/Field;
    :catch_1a
    move-exception v2

    .line 273
    .local v2, "e":Ljava/lang/NoSuchFieldException;
    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 274
    .end local v2    # "e":Ljava/lang/NoSuchFieldException;
    :catch_21
    move-exception v2

    .line 275
    .local v2, "e":Ljava/lang/IllegalAccessException;
    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .registers 3
    .param p1, "out"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 280
    iget-object v0, p0, Lokio/ByteString;->data:[B

    array-length v0, v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 281
    iget-object v0, p0, Lokio/ByteString;->data:[B

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->write([B)V

    .line 282
    return-void
.end method


# virtual methods
.method public base64()Ljava/lang/String;
    .registers 2

    .prologue
    .line 101
    iget-object v0, p0, Lokio/ByteString;->data:[B

    invoke-static {v0}, Lokio/Base64;->encode([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 240
    if-eq p1, p0, :cond_12

    instance-of v0, p1, Lokio/ByteString;

    if-eqz v0, :cond_14

    check-cast p1, Lokio/ByteString;

    .end local p1    # "o":Ljava/lang/Object;
    iget-object v0, p1, Lokio/ByteString;->data:[B

    iget-object v1, p0, Lokio/ByteString;->data:[B

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-eqz v0, :cond_14

    :cond_12
    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method public getByte(I)B
    .registers 3
    .param p1, "pos"    # I

    .prologue
    .line 216
    iget-object v0, p0, Lokio/ByteString;->data:[B

    aget-byte v0, v0, p1

    return v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 244
    iget v0, p0, Lokio/ByteString;->hashCode:I

    .line 245
    .local v0, "result":I
    if-eqz v0, :cond_5

    .end local v0    # "result":I
    :goto_4
    return v0

    .restart local v0    # "result":I
    :cond_5
    iget-object v1, p0, Lokio/ByteString;->data:[B

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([B)I

    move-result v0

    .end local v0    # "result":I
    iput v0, p0, Lokio/ByteString;->hashCode:I

    goto :goto_4
.end method

.method public hex()Ljava/lang/String;
    .registers 10

    .prologue
    .line 116
    iget-object v4, p0, Lokio/ByteString;->data:[B

    array-length v4, v4

    mul-int/lit8 v4, v4, 0x2

    new-array v3, v4, [C

    .line 117
    .local v3, "result":[C
    const/4 v1, 0x0

    .line 118
    .local v1, "c":I
    iget-object v5, p0, Lokio/ByteString;->data:[B

    array-length v6, v5

    const/4 v4, 0x0

    move v2, v1

    .end local v1    # "c":I
    .local v2, "c":I
    :goto_d
    if-ge v4, v6, :cond_2a

    aget-byte v0, v5, v4

    .line 119
    .local v0, "b":B
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "c":I
    .restart local v1    # "c":I
    sget-object v7, Lokio/ByteString;->HEX_DIGITS:[C

    shr-int/lit8 v8, v0, 0x4

    and-int/lit8 v8, v8, 0xf

    aget-char v7, v7, v8

    aput-char v7, v3, v2

    .line 120
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "c":I
    .restart local v2    # "c":I
    sget-object v7, Lokio/ByteString;->HEX_DIGITS:[C

    and-int/lit8 v8, v0, 0xf

    aget-char v7, v7, v8

    aput-char v7, v3, v1

    .line 118
    add-int/lit8 v4, v4, 0x1

    goto :goto_d

    .line 122
    .end local v0    # "b":B
    :cond_2a
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v3}, Ljava/lang/String;-><init>([C)V

    return-object v4
.end method

.method public size()I
    .registers 2

    .prologue
    .line 223
    iget-object v0, p0, Lokio/ByteString;->data:[B

    array-length v0, v0

    return v0
.end method

.method public toAsciiLowercase()Lokio/ByteString;
    .registers 8

    .prologue
    const/16 v6, 0x5a

    const/16 v5, 0x41

    .line 171
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    iget-object v4, p0, Lokio/ByteString;->data:[B

    array-length v4, v4

    if-ge v1, v4, :cond_3c

    .line 172
    iget-object v4, p0, Lokio/ByteString;->data:[B

    aget-byte v0, v4, v1

    .line 173
    .local v0, "c":B
    if-lt v0, v5, :cond_12

    if-le v0, v6, :cond_15

    .line 171
    :cond_12
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 177
    :cond_15
    iget-object v4, p0, Lokio/ByteString;->data:[B

    invoke-virtual {v4}, [B->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    .line 178
    .local v3, "lowercase":[B
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .local v2, "i":I
    add-int/lit8 v4, v0, 0x20

    int-to-byte v4, v4

    aput-byte v4, v3, v1

    move v1, v2

    .line 179
    .end local v2    # "i":I
    .restart local v1    # "i":I
    :goto_25
    array-length v4, v3

    if-ge v1, v4, :cond_37

    .line 180
    aget-byte v0, v3, v1

    .line 181
    if-lt v0, v5, :cond_2e

    if-le v0, v6, :cond_31

    .line 179
    :cond_2e
    :goto_2e
    add-int/lit8 v1, v1, 0x1

    goto :goto_25

    .line 182
    :cond_31
    add-int/lit8 v4, v0, 0x20

    int-to-byte v4, v4

    aput-byte v4, v3, v1

    goto :goto_2e

    .line 184
    :cond_37
    new-instance p0, Lokio/ByteString;

    .end local p0    # "this":Lokio/ByteString;
    invoke-direct {p0, v3}, Lokio/ByteString;-><init>([B)V

    .line 186
    .end local v0    # "c":B
    .end local v3    # "lowercase":[B
    :cond_3c
    return-object p0
.end method

.method public toByteArray()[B
    .registers 2

    .prologue
    .line 230
    iget-object v0, p0, Lokio/ByteString;->data:[B

    invoke-virtual {v0}, [B->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 7

    .prologue
    const/4 v3, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 249
    iget-object v1, p0, Lokio/ByteString;->data:[B

    array-length v1, v1

    if-nez v1, :cond_b

    .line 250
    const-string v1, "ByteString[size=0]"

    .line 258
    :goto_a
    return-object v1

    .line 253
    :cond_b
    iget-object v1, p0, Lokio/ByteString;->data:[B

    array-length v1, v1

    const/16 v2, 0x10

    if-gt v1, v2, :cond_2a

    .line 254
    const-string v1, "ByteString[size=%s data=%s]"

    new-array v2, v3, [Ljava/lang/Object;

    iget-object v3, p0, Lokio/ByteString;->data:[B

    array-length v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-virtual {p0}, Lokio/ByteString;->hex()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_a

    .line 258
    :cond_2a
    :try_start_2a
    const-string v1, "ByteString[size=%s md5=%s]"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lokio/ByteString;->data:[B

    array-length v4, v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "MD5"

    .line 259
    invoke-static {v4}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v4

    iget-object v5, p0, Lokio/ByteString;->data:[B

    invoke-virtual {v4, v5}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v4

    invoke-static {v4}, Lokio/ByteString;->of([B)Lokio/ByteString;

    move-result-object v4

    invoke-virtual {v4}, Lokio/ByteString;->hex()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    .line 258
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_53
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_2a .. :try_end_53} :catch_55

    move-result-object v1

    goto :goto_a

    .line 260
    :catch_55
    move-exception v0

    .line 261
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
.end method

.method public utf8()Ljava/lang/String;
    .registers 4

    .prologue
    .line 90
    iget-object v0, p0, Lokio/ByteString;->utf8:Ljava/lang/String;

    .line 92
    .local v0, "result":Ljava/lang/String;
    if-eqz v0, :cond_5

    .end local v0    # "result":Ljava/lang/String;
    :goto_4
    return-object v0

    .restart local v0    # "result":Ljava/lang/String;
    :cond_5
    new-instance v0, Ljava/lang/String;

    .end local v0    # "result":Ljava/lang/String;
    iget-object v1, p0, Lokio/ByteString;->data:[B

    sget-object v2, Lokio/Util;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    iput-object v0, p0, Lokio/ByteString;->utf8:Ljava/lang/String;

    goto :goto_4
.end method
