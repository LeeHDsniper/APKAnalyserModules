.class public Lcom/google/gdata/util/common/base/PercentEscaper;
.super Lcom/google/gdata/util/common/base/UnicodeEscaper;
.source "PercentEscaper.java"


# static fields
.field private static final UPPER_HEX_DIGITS:[C

.field private static final URI_ESCAPED_SPACE:[C


# instance fields
.field private final plusForSpace:Z

.field private final safeOctets:[Z


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 86
    const/4 v0, 0x1

    new-array v0, v0, [C

    const/4 v1, 0x0

    const/16 v2, 0x2b

    aput-char v2, v0, v1

    sput-object v0, Lcom/google/gdata/util/common/base/PercentEscaper;->URI_ESCAPED_SPACE:[C

    .line 88
    const-string v0, "0123456789ABCDEF"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lcom/google/gdata/util/common/base/PercentEscaper;->UPPER_HEX_DIGITS:[C

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .registers 5
    .param p1, "safeChars"    # Ljava/lang/String;
    .param p2, "plusForSpace"    # Z

    .prologue
    .line 114
    invoke-direct {p0}, Lcom/google/gdata/util/common/base/UnicodeEscaper;-><init>()V

    .line 116
    const-string v0, ".*[0-9A-Za-z].*"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 117
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Alphanumeric characters are always \'safe\' and should not be explicitly specified"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 123
    :cond_13
    if-eqz p2, :cond_25

    const-string v0, " "

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_25

    .line 124
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "plusForSpace cannot be specified when space is a \'safe\' character"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 127
    :cond_25
    const-string v0, "%"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_35

    .line 128
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The \'%\' character cannot be specified as \'safe\'"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 131
    :cond_35
    iput-boolean p2, p0, Lcom/google/gdata/util/common/base/PercentEscaper;->plusForSpace:Z

    .line 132
    invoke-static {p1}, Lcom/google/gdata/util/common/base/PercentEscaper;->createSafeOctets(Ljava/lang/String;)[Z

    move-result-object v0

    iput-object v0, p0, Lcom/google/gdata/util/common/base/PercentEscaper;->safeOctets:[Z

    .line 133
    return-void
.end method

.method private static createSafeOctets(Ljava/lang/String;)[Z
    .registers 10
    .param p0, "safeChars"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x1

    .line 141
    const/16 v4, 0x7a

    .line 142
    .local v4, "maxChar":I
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v6

    .line 143
    .local v6, "safeCharArray":[C
    move-object v0, v6

    .local v0, "arr$":[C
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_a
    if-ge v2, v3, :cond_15

    aget-char v1, v0, v2

    .line 144
    .local v1, "c":C
    invoke-static {v1, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 143
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 146
    .end local v1    # "c":C
    :cond_15
    add-int/lit8 v7, v4, 0x1

    new-array v5, v7, [Z

    .line 147
    .local v5, "octets":[Z
    const/16 v1, 0x30

    .local v1, "c":I
    :goto_1b
    const/16 v7, 0x39

    if-gt v1, v7, :cond_24

    .line 148
    aput-boolean v8, v5, v1

    .line 147
    add-int/lit8 v1, v1, 0x1

    goto :goto_1b

    .line 150
    :cond_24
    const/16 v1, 0x41

    :goto_26
    const/16 v7, 0x5a

    if-gt v1, v7, :cond_2f

    .line 151
    aput-boolean v8, v5, v1

    .line 150
    add-int/lit8 v1, v1, 0x1

    goto :goto_26

    .line 153
    :cond_2f
    const/16 v1, 0x61

    :goto_31
    const/16 v7, 0x7a

    if-gt v1, v7, :cond_3a

    .line 154
    aput-boolean v8, v5, v1

    .line 153
    add-int/lit8 v1, v1, 0x1

    goto :goto_31

    .line 156
    :cond_3a
    move-object v0, v6

    array-length v3, v0

    const/4 v2, 0x0

    .end local v1    # "c":I
    :goto_3d
    if-ge v2, v3, :cond_46

    aget-char v1, v0, v2

    .line 157
    .local v1, "c":C
    aput-boolean v8, v5, v1

    .line 156
    add-int/lit8 v2, v2, 0x1

    goto :goto_3d

    .line 159
    .end local v1    # "c":C
    :cond_46
    return-object v5
.end method


# virtual methods
.method public escape(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 185
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 186
    .local v2, "slen":I
    const/4 v1, 0x0

    .local v1, "index":I
    :goto_5
    if-ge v1, v2, :cond_1a

    .line 187
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 188
    .local v0, "c":C
    iget-object v3, p0, Lcom/google/gdata/util/common/base/PercentEscaper;->safeOctets:[Z

    array-length v3, v3

    if-ge v0, v3, :cond_16

    iget-object v3, p0, Lcom/google/gdata/util/common/base/PercentEscaper;->safeOctets:[Z

    aget-boolean v3, v3, v0

    if-nez v3, :cond_1b

    .line 189
    :cond_16
    invoke-virtual {p0, p1, v1}, Lcom/google/gdata/util/common/base/PercentEscaper;->escapeSlow(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    .line 192
    .end local v0    # "c":C
    .end local p1    # "s":Ljava/lang/String;
    :cond_1a
    return-object p1

    .line 186
    .restart local v0    # "c":C
    .restart local p1    # "s":Ljava/lang/String;
    :cond_1b
    add-int/lit8 v1, v1, 0x1

    goto :goto_5
.end method

.method protected escape(I)[C
    .registers 9
    .param p1, "cp"    # I

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    const/16 v2, 0x25

    .line 202
    iget-object v1, p0, Lcom/google/gdata/util/common/base/PercentEscaper;->safeOctets:[Z

    array-length v1, v1

    if-ge p1, v1, :cond_13

    iget-object v1, p0, Lcom/google/gdata/util/common/base/PercentEscaper;->safeOctets:[Z

    aget-boolean v1, v1, p1

    if-eqz v1, :cond_13

    .line 203
    const/4 v0, 0x0

    .line 268
    :goto_12
    return-object v0

    .line 204
    :cond_13
    const/16 v1, 0x20

    if-ne p1, v1, :cond_1e

    iget-boolean v1, p0, Lcom/google/gdata/util/common/base/PercentEscaper;->plusForSpace:Z

    if-eqz v1, :cond_1e

    .line 205
    sget-object v0, Lcom/google/gdata/util/common/base/PercentEscaper;->URI_ESCAPED_SPACE:[C

    goto :goto_12

    .line 206
    :cond_1e
    const/16 v1, 0x7f

    if-gt p1, v1, :cond_37

    .line 209
    new-array v0, v6, [C

    .line 210
    .local v0, "dest":[C
    aput-char v2, v0, v3

    .line 211
    sget-object v1, Lcom/google/gdata/util/common/base/PercentEscaper;->UPPER_HEX_DIGITS:[C

    and-int/lit8 v2, p1, 0xf

    aget-char v1, v1, v2

    aput-char v1, v0, v5

    .line 212
    sget-object v1, Lcom/google/gdata/util/common/base/PercentEscaper;->UPPER_HEX_DIGITS:[C

    ushr-int/lit8 v2, p1, 0x4

    aget-char v1, v1, v2

    aput-char v1, v0, v4

    goto :goto_12

    .line 214
    .end local v0    # "dest":[C
    :cond_37
    const/16 v1, 0x7ff

    if-gt p1, v1, :cond_6d

    .line 217
    const/4 v1, 0x6

    new-array v0, v1, [C

    .line 218
    .restart local v0    # "dest":[C
    aput-char v2, v0, v3

    .line 219
    aput-char v2, v0, v6

    .line 220
    const/4 v1, 0x5

    sget-object v2, Lcom/google/gdata/util/common/base/PercentEscaper;->UPPER_HEX_DIGITS:[C

    and-int/lit8 v3, p1, 0xf

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 221
    ushr-int/lit8 p1, p1, 0x4

    .line 222
    const/4 v1, 0x4

    sget-object v2, Lcom/google/gdata/util/common/base/PercentEscaper;->UPPER_HEX_DIGITS:[C

    and-int/lit8 v3, p1, 0x3

    or-int/lit8 v3, v3, 0x8

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 223
    ushr-int/lit8 p1, p1, 0x2

    .line 224
    sget-object v1, Lcom/google/gdata/util/common/base/PercentEscaper;->UPPER_HEX_DIGITS:[C

    and-int/lit8 v2, p1, 0xf

    aget-char v1, v1, v2

    aput-char v1, v0, v5

    .line 225
    ushr-int/lit8 p1, p1, 0x4

    .line 226
    sget-object v1, Lcom/google/gdata/util/common/base/PercentEscaper;->UPPER_HEX_DIGITS:[C

    or-int/lit8 v2, p1, 0xc

    aget-char v1, v1, v2

    aput-char v1, v0, v4

    goto :goto_12

    .line 228
    .end local v0    # "dest":[C
    :cond_6d
    const v1, 0xffff

    if-gt p1, v1, :cond_ba

    .line 231
    const/16 v1, 0x9

    new-array v0, v1, [C

    .line 232
    .restart local v0    # "dest":[C
    aput-char v2, v0, v3

    .line 233
    const/16 v1, 0x45

    aput-char v1, v0, v4

    .line 234
    aput-char v2, v0, v6

    .line 235
    const/4 v1, 0x6

    aput-char v2, v0, v1

    .line 236
    const/16 v1, 0x8

    sget-object v2, Lcom/google/gdata/util/common/base/PercentEscaper;->UPPER_HEX_DIGITS:[C

    and-int/lit8 v3, p1, 0xf

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 237
    ushr-int/lit8 p1, p1, 0x4

    .line 238
    const/4 v1, 0x7

    sget-object v2, Lcom/google/gdata/util/common/base/PercentEscaper;->UPPER_HEX_DIGITS:[C

    and-int/lit8 v3, p1, 0x3

    or-int/lit8 v3, v3, 0x8

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 239
    ushr-int/lit8 p1, p1, 0x2

    .line 240
    const/4 v1, 0x5

    sget-object v2, Lcom/google/gdata/util/common/base/PercentEscaper;->UPPER_HEX_DIGITS:[C

    and-int/lit8 v3, p1, 0xf

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 241
    ushr-int/lit8 p1, p1, 0x4

    .line 242
    const/4 v1, 0x4

    sget-object v2, Lcom/google/gdata/util/common/base/PercentEscaper;->UPPER_HEX_DIGITS:[C

    and-int/lit8 v3, p1, 0x3

    or-int/lit8 v3, v3, 0x8

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 243
    ushr-int/lit8 p1, p1, 0x2

    .line 244
    sget-object v1, Lcom/google/gdata/util/common/base/PercentEscaper;->UPPER_HEX_DIGITS:[C

    aget-char v1, v1, p1

    aput-char v1, v0, v5

    goto/16 :goto_12

    .line 246
    .end local v0    # "dest":[C
    :cond_ba
    const v1, 0x10ffff

    if-gt p1, v1, :cond_127

    .line 247
    const/16 v1, 0xc

    new-array v0, v1, [C

    .line 250
    .restart local v0    # "dest":[C
    aput-char v2, v0, v3

    .line 251
    const/16 v1, 0x46

    aput-char v1, v0, v4

    .line 252
    aput-char v2, v0, v6

    .line 253
    const/4 v1, 0x6

    aput-char v2, v0, v1

    .line 254
    const/16 v1, 0x9

    aput-char v2, v0, v1

    .line 255
    const/16 v1, 0xb

    sget-object v2, Lcom/google/gdata/util/common/base/PercentEscaper;->UPPER_HEX_DIGITS:[C

    and-int/lit8 v3, p1, 0xf

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 256
    ushr-int/lit8 p1, p1, 0x4

    .line 257
    const/16 v1, 0xa

    sget-object v2, Lcom/google/gdata/util/common/base/PercentEscaper;->UPPER_HEX_DIGITS:[C

    and-int/lit8 v3, p1, 0x3

    or-int/lit8 v3, v3, 0x8

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 258
    ushr-int/lit8 p1, p1, 0x2

    .line 259
    const/16 v1, 0x8

    sget-object v2, Lcom/google/gdata/util/common/base/PercentEscaper;->UPPER_HEX_DIGITS:[C

    and-int/lit8 v3, p1, 0xf

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 260
    ushr-int/lit8 p1, p1, 0x4

    .line 261
    const/4 v1, 0x7

    sget-object v2, Lcom/google/gdata/util/common/base/PercentEscaper;->UPPER_HEX_DIGITS:[C

    and-int/lit8 v3, p1, 0x3

    or-int/lit8 v3, v3, 0x8

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 262
    ushr-int/lit8 p1, p1, 0x2

    .line 263
    const/4 v1, 0x5

    sget-object v2, Lcom/google/gdata/util/common/base/PercentEscaper;->UPPER_HEX_DIGITS:[C

    and-int/lit8 v3, p1, 0xf

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 264
    ushr-int/lit8 p1, p1, 0x4

    .line 265
    const/4 v1, 0x4

    sget-object v2, Lcom/google/gdata/util/common/base/PercentEscaper;->UPPER_HEX_DIGITS:[C

    and-int/lit8 v3, p1, 0x3

    or-int/lit8 v3, v3, 0x8

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 266
    ushr-int/lit8 p1, p1, 0x2

    .line 267
    sget-object v1, Lcom/google/gdata/util/common/base/PercentEscaper;->UPPER_HEX_DIGITS:[C

    and-int/lit8 v2, p1, 0x7

    aget-char v1, v1, v2

    aput-char v1, v0, v5

    goto/16 :goto_12

    .line 271
    .end local v0    # "dest":[C
    :cond_127
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid unicode character value "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method protected nextEscapeIndex(Ljava/lang/CharSequence;II)I
    .registers 6
    .param p1, "csq"    # Ljava/lang/CharSequence;
    .param p2, "index"    # I
    .param p3, "end"    # I

    .prologue
    .line 169
    :goto_0
    if-ge p2, p3, :cond_11

    .line 170
    invoke-interface {p1, p2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    .line 171
    .local v0, "c":C
    iget-object v1, p0, Lcom/google/gdata/util/common/base/PercentEscaper;->safeOctets:[Z

    array-length v1, v1

    if-ge v0, v1, :cond_11

    iget-object v1, p0, Lcom/google/gdata/util/common/base/PercentEscaper;->safeOctets:[Z

    aget-boolean v1, v1, v0

    if-nez v1, :cond_12

    .line 175
    .end local v0    # "c":C
    :cond_11
    return p2

    .line 169
    .restart local v0    # "c":C
    :cond_12
    add-int/lit8 p2, p2, 0x1

    goto :goto_0
.end method
