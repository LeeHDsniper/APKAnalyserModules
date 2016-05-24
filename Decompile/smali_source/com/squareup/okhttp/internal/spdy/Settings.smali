.class public final Lcom/squareup/okhttp/internal/spdy/Settings;
.super Ljava/lang/Object;
.source "Settings.java"


# instance fields
.field private persistValue:I

.field private persisted:I

.field private set:I

.field private final values:[I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    const/16 v0, 0xa

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->values:[I

    return-void
.end method


# virtual methods
.method clear()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 85
    iput v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->persisted:I

    iput v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->persistValue:I

    iput v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->set:I

    .line 86
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->values:[I

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    .line 87
    return-void
.end method

.method flags(I)I
    .registers 4
    .param p1, "id"    # I

    .prologue
    .line 124
    const/4 v0, 0x0

    .line 125
    .local v0, "result":I
    invoke-virtual {p0, p1}, Lcom/squareup/okhttp/internal/spdy/Settings;->isPersisted(I)Z

    move-result v1

    if-eqz v1, :cond_9

    or-int/lit8 v0, v0, 0x2

    .line 126
    :cond_9
    invoke-virtual {p0, p1}, Lcom/squareup/okhttp/internal/spdy/Settings;->persistValue(I)Z

    move-result v1

    if-eqz v1, :cond_11

    or-int/lit8 v0, v0, 0x1

    .line 127
    :cond_11
    return v0
.end method

.method get(I)I
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 119
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->values:[I

    aget v0, v0, p1

    return v0
.end method

.method getHeaderTableSize()I
    .registers 4

    .prologue
    .line 143
    const/4 v0, 0x2

    .line 144
    .local v0, "bit":I
    iget v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->set:I

    and-int/2addr v1, v0

    if-eqz v1, :cond_c

    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->values:[I

    const/4 v2, 0x1

    aget v1, v1, v2

    :goto_b
    return v1

    :cond_c
    const/4 v1, -0x1

    goto :goto_b
.end method

.method getInitialWindowSize(I)I
    .registers 5
    .param p1, "defaultValue"    # I

    .prologue
    .line 197
    const/16 v0, 0x80

    .line 198
    .local v0, "bit":I
    iget v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->set:I

    and-int/2addr v1, v0

    if-eqz v1, :cond_c

    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->values:[I

    const/4 v2, 0x7

    aget p1, v1, v2

    .end local p1    # "defaultValue":I
    :cond_c
    return p1
.end method

.method getMaxFrameSize(I)I
    .registers 5
    .param p1, "defaultValue"    # I

    .prologue
    .line 180
    const/16 v0, 0x20

    .line 181
    .local v0, "bit":I
    iget v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->set:I

    and-int/2addr v1, v0

    if-eqz v1, :cond_c

    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->values:[I

    const/4 v2, 0x5

    aget p1, v1, v2

    .end local p1    # "defaultValue":I
    :cond_c
    return p1
.end method

.method isPersisted(I)Z
    .registers 5
    .param p1, "id"    # I

    .prologue
    const/4 v1, 0x1

    .line 225
    shl-int v0, v1, p1

    .line 226
    .local v0, "bit":I
    iget v2, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->persisted:I

    and-int/2addr v2, v0

    if-eqz v2, :cond_9

    :goto_8
    return v1

    :cond_9
    const/4 v1, 0x0

    goto :goto_8
.end method

.method isSet(I)Z
    .registers 5
    .param p1, "id"    # I

    .prologue
    const/4 v1, 0x1

    .line 113
    shl-int v0, v1, p1

    .line 114
    .local v0, "bit":I
    iget v2, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->set:I

    and-int/2addr v2, v0

    if-eqz v2, :cond_9

    :goto_8
    return v1

    :cond_9
    const/4 v1, 0x0

    goto :goto_8
.end method

.method merge(Lcom/squareup/okhttp/internal/spdy/Settings;)V
    .registers 5
    .param p1, "other"    # Lcom/squareup/okhttp/internal/spdy/Settings;

    .prologue
    .line 234
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    const/16 v1, 0xa

    if-ge v0, v1, :cond_1a

    .line 235
    invoke-virtual {p1, v0}, Lcom/squareup/okhttp/internal/spdy/Settings;->isSet(I)Z

    move-result v1

    if-nez v1, :cond_e

    .line 234
    :goto_b
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 236
    :cond_e
    invoke-virtual {p1, v0}, Lcom/squareup/okhttp/internal/spdy/Settings;->flags(I)I

    move-result v1

    invoke-virtual {p1, v0}, Lcom/squareup/okhttp/internal/spdy/Settings;->get(I)I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/squareup/okhttp/internal/spdy/Settings;->set(III)Lcom/squareup/okhttp/internal/spdy/Settings;

    goto :goto_b

    .line 238
    :cond_1a
    return-void
.end method

.method persistValue(I)Z
    .registers 5
    .param p1, "id"    # I

    .prologue
    const/4 v1, 0x1

    .line 219
    shl-int v0, v1, p1

    .line 220
    .local v0, "bit":I
    iget v2, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->persistValue:I

    and-int/2addr v2, v0

    if-eqz v2, :cond_9

    :goto_8
    return v1

    :cond_9
    const/4 v1, 0x0

    goto :goto_8
.end method

.method set(III)Lcom/squareup/okhttp/internal/spdy/Settings;
    .registers 7
    .param p1, "id"    # I
    .param p2, "idFlags"    # I
    .param p3, "value"    # I

    .prologue
    .line 90
    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->values:[I

    array-length v1, v1

    if-lt p1, v1, :cond_6

    .line 108
    :goto_5
    return-object p0

    .line 94
    :cond_6
    const/4 v1, 0x1

    shl-int v0, v1, p1

    .line 95
    .local v0, "bit":I
    iget v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->set:I

    or-int/2addr v1, v0

    iput v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->set:I

    .line 96
    and-int/lit8 v1, p2, 0x1

    if-eqz v1, :cond_25

    .line 97
    iget v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->persistValue:I

    or-int/2addr v1, v0

    iput v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->persistValue:I

    .line 101
    :goto_17
    and-int/lit8 v1, p2, 0x2

    if-eqz v1, :cond_2d

    .line 102
    iget v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->persisted:I

    or-int/2addr v1, v0

    iput v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->persisted:I

    .line 107
    :goto_20
    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->values:[I

    aput p3, v1, p1

    goto :goto_5

    .line 99
    :cond_25
    iget v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->persistValue:I

    xor-int/lit8 v2, v0, -0x1

    and-int/2addr v1, v2

    iput v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->persistValue:I

    goto :goto_17

    .line 104
    :cond_2d
    iget v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->persisted:I

    xor-int/lit8 v2, v0, -0x1

    and-int/2addr v1, v2

    iput v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->persisted:I

    goto :goto_20
.end method

.method size()I
    .registers 2

    .prologue
    .line 132
    iget v0, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->set:I

    invoke-static {v0}, Ljava/lang/Integer;->bitCount(I)I

    move-result v0

    return v0
.end method
