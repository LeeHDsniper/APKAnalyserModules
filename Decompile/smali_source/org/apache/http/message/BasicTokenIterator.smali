.class public Lorg/apache/http/message/BasicTokenIterator;
.super Ljava/lang/Object;
.source "BasicTokenIterator.java"

# interfaces
.implements Lorg/apache/http/TokenIterator;


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# static fields
.field public static final HTTP_SEPARATORS:Ljava/lang/String; = " ,;=()<>@:\\\"/[]?{}\t"


# instance fields
.field protected currentHeader:Ljava/lang/String;

.field protected currentToken:Ljava/lang/String;

.field protected final headerIt:Lorg/apache/http/HeaderIterator;

.field protected searchPos:I


# direct methods
.method public constructor <init>(Lorg/apache/http/HeaderIterator;)V
    .registers 3
    .param p1, "headerIterator"    # Lorg/apache/http/HeaderIterator;

    .prologue
    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    const-string v0, "Header iterator"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/HeaderIterator;

    iput-object v0, p0, Lorg/apache/http/message/BasicTokenIterator;->headerIt:Lorg/apache/http/HeaderIterator;

    .line 86
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lorg/apache/http/message/BasicTokenIterator;->findNext(I)I

    move-result v0

    iput v0, p0, Lorg/apache/http/message/BasicTokenIterator;->searchPos:I

    .line 87
    return-void
.end method


# virtual methods
.method protected createToken(Ljava/lang/String;II)Ljava/lang/String;
    .registers 5
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "start"    # I
    .param p3, "end"    # I

    .prologue
    .line 210
    invoke-virtual {p1, p2, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected findNext(I)I
    .registers 6
    .param p1, "pos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/ParseException;
        }
    .end annotation

    .prologue
    const/4 v0, -0x1

    .line 164
    move v1, p1

    .line 165
    .local v1, "from":I
    if-gez v1, :cond_24

    .line 167
    iget-object v3, p0, Lorg/apache/http/message/BasicTokenIterator;->headerIt:Lorg/apache/http/HeaderIterator;

    invoke-interface {v3}, Lorg/apache/http/HeaderIterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_d

    .line 185
    :goto_c
    return v0

    .line 170
    :cond_d
    iget-object v3, p0, Lorg/apache/http/message/BasicTokenIterator;->headerIt:Lorg/apache/http/HeaderIterator;

    invoke-interface {v3}, Lorg/apache/http/HeaderIterator;->nextHeader()Lorg/apache/http/Header;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/http/message/BasicTokenIterator;->currentHeader:Ljava/lang/String;

    .line 171
    const/4 v1, 0x0

    .line 177
    :goto_1a
    invoke-virtual {p0, v1}, Lorg/apache/http/message/BasicTokenIterator;->findTokenStart(I)I

    move-result v2

    .line 178
    .local v2, "start":I
    if-gez v2, :cond_29

    .line 179
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/apache/http/message/BasicTokenIterator;->currentToken:Ljava/lang/String;

    goto :goto_c

    .line 174
    .end local v2    # "start":I
    :cond_24
    invoke-virtual {p0, v1}, Lorg/apache/http/message/BasicTokenIterator;->findTokenSeparator(I)I

    move-result v1

    goto :goto_1a

    .line 183
    .restart local v2    # "start":I
    :cond_29
    invoke-virtual {p0, v2}, Lorg/apache/http/message/BasicTokenIterator;->findTokenEnd(I)I

    move-result v0

    .line 184
    .local v0, "end":I
    iget-object v3, p0, Lorg/apache/http/message/BasicTokenIterator;->currentHeader:Ljava/lang/String;

    invoke-virtual {p0, v3, v2, v0}, Lorg/apache/http/message/BasicTokenIterator;->createToken(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/http/message/BasicTokenIterator;->currentToken:Ljava/lang/String;

    goto :goto_c
.end method

.method protected findTokenEnd(I)I
    .registers 5
    .param p1, "from"    # I

    .prologue
    .line 313
    const-string v2, "Search position"

    invoke-static {p1, v2}, Lorg/apache/http/util/Args;->notNegative(ILjava/lang/String;)I

    .line 314
    iget-object v2, p0, Lorg/apache/http/message/BasicTokenIterator;->currentHeader:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v1

    .line 315
    .local v1, "to":I
    add-int/lit8 v0, p1, 0x1

    .line 316
    .local v0, "end":I
    :goto_d
    if-ge v0, v1, :cond_1e

    iget-object v2, p0, Lorg/apache/http/message/BasicTokenIterator;->currentHeader:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {p0, v2}, Lorg/apache/http/message/BasicTokenIterator;->isTokenChar(C)Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 317
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    .line 320
    :cond_1e
    return v0
.end method

.method protected findTokenSeparator(I)I
    .registers 9
    .param p1, "pos"    # I

    .prologue
    .line 277
    const-string v4, "Search position"

    invoke-static {p1, v4}, Lorg/apache/http/util/Args;->notNegative(ILjava/lang/String;)I

    move-result v2

    .line 278
    .local v2, "from":I
    const/4 v1, 0x0

    .line 279
    .local v1, "found":Z
    iget-object v4, p0, Lorg/apache/http/message/BasicTokenIterator;->currentHeader:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v3

    .line 280
    .local v3, "to":I
    :goto_d
    if-nez v1, :cond_78

    if-ge v2, v3, :cond_78

    .line 281
    iget-object v4, p0, Lorg/apache/http/message/BasicTokenIterator;->currentHeader:Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 282
    .local v0, "ch":C
    invoke-virtual {p0, v0}, Lorg/apache/http/message/BasicTokenIterator;->isTokenSeparator(C)Z

    move-result v4

    if-eqz v4, :cond_1f

    .line 283
    const/4 v1, 0x1

    goto :goto_d

    .line 284
    :cond_1f
    invoke-virtual {p0, v0}, Lorg/apache/http/message/BasicTokenIterator;->isWhitespace(C)Z

    move-result v4

    if-eqz v4, :cond_28

    .line 285
    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    .line 286
    :cond_28
    invoke-virtual {p0, v0}, Lorg/apache/http/message/BasicTokenIterator;->isTokenChar(C)Z

    move-result v4

    if-eqz v4, :cond_53

    .line 287
    new-instance v4, Lorg/apache/http/ParseException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Tokens without separator (pos "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "): "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/http/message/BasicTokenIterator;->currentHeader:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/http/ParseException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 291
    :cond_53
    new-instance v4, Lorg/apache/http/ParseException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Invalid character after token (pos "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "): "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/http/message/BasicTokenIterator;->currentHeader:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/http/ParseException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 297
    .end local v0    # "ch":C
    :cond_78
    return v2
.end method

.method protected findTokenStart(I)I
    .registers 9
    .param p1, "pos"    # I

    .prologue
    .line 225
    const-string v4, "Search position"

    invoke-static {p1, v4}, Lorg/apache/http/util/Args;->notNegative(ILjava/lang/String;)I

    move-result v2

    .line 226
    .local v2, "from":I
    const/4 v1, 0x0

    .line 227
    .local v1, "found":Z
    :cond_7
    :goto_7
    if-nez v1, :cond_7b

    iget-object v4, p0, Lorg/apache/http/message/BasicTokenIterator;->currentHeader:Ljava/lang/String;

    if-eqz v4, :cond_7b

    .line 229
    iget-object v4, p0, Lorg/apache/http/message/BasicTokenIterator;->currentHeader:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v3

    .line 230
    .local v3, "to":I
    :goto_13
    if-nez v1, :cond_5f

    if-ge v2, v3, :cond_5f

    .line 232
    iget-object v4, p0, Lorg/apache/http/message/BasicTokenIterator;->currentHeader:Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 233
    .local v0, "ch":C
    invoke-virtual {p0, v0}, Lorg/apache/http/message/BasicTokenIterator;->isTokenSeparator(C)Z

    move-result v4

    if-nez v4, :cond_29

    invoke-virtual {p0, v0}, Lorg/apache/http/message/BasicTokenIterator;->isWhitespace(C)Z

    move-result v4

    if-eqz v4, :cond_2c

    .line 235
    :cond_29
    add-int/lit8 v2, v2, 0x1

    goto :goto_13

    .line 236
    :cond_2c
    iget-object v4, p0, Lorg/apache/http/message/BasicTokenIterator;->currentHeader:Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {p0, v4}, Lorg/apache/http/message/BasicTokenIterator;->isTokenChar(C)Z

    move-result v4

    if-eqz v4, :cond_3a

    .line 238
    const/4 v1, 0x1

    goto :goto_13

    .line 240
    :cond_3a
    new-instance v4, Lorg/apache/http/ParseException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Invalid character before token (pos "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "): "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/http/message/BasicTokenIterator;->currentHeader:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/http/ParseException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 245
    .end local v0    # "ch":C
    :cond_5f
    if-nez v1, :cond_7

    .line 246
    iget-object v4, p0, Lorg/apache/http/message/BasicTokenIterator;->headerIt:Lorg/apache/http/HeaderIterator;

    invoke-interface {v4}, Lorg/apache/http/HeaderIterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_77

    .line 247
    iget-object v4, p0, Lorg/apache/http/message/BasicTokenIterator;->headerIt:Lorg/apache/http/HeaderIterator;

    invoke-interface {v4}, Lorg/apache/http/HeaderIterator;->nextHeader()Lorg/apache/http/Header;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/http/message/BasicTokenIterator;->currentHeader:Ljava/lang/String;

    .line 248
    const/4 v2, 0x0

    goto :goto_7

    .line 250
    :cond_77
    const/4 v4, 0x0

    iput-object v4, p0, Lorg/apache/http/message/BasicTokenIterator;->currentHeader:Ljava/lang/String;

    goto :goto_7

    .line 255
    .end local v3    # "to":I
    :cond_7b
    if-eqz v1, :cond_7e

    .end local v2    # "from":I
    :goto_7d
    return v2

    .restart local v2    # "from":I
    :cond_7e
    const/4 v2, -0x1

    goto :goto_7d
.end method

.method public hasNext()Z
    .registers 2

    .prologue
    .line 92
    iget-object v0, p0, Lorg/apache/http/message/BasicTokenIterator;->currentToken:Ljava/lang/String;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method protected isHttpSeparator(C)Z
    .registers 3
    .param p1, "ch"    # C

    .prologue
    .line 409
    const-string v0, " ,;=()<>@:\\\"/[]?{}\t"

    invoke-virtual {v0, p1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ltz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method protected isTokenChar(C)Z
    .registers 5
    .param p1, "ch"    # C

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 374
    invoke-static {p1}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 394
    :cond_8
    :goto_8
    return v0

    .line 379
    :cond_9
    invoke-static {p1}, Ljava/lang/Character;->isISOControl(C)Z

    move-result v2

    if-eqz v2, :cond_11

    move v0, v1

    .line 380
    goto :goto_8

    .line 384
    :cond_11
    invoke-virtual {p0, p1}, Lorg/apache/http/message/BasicTokenIterator;->isHttpSeparator(C)Z

    move-result v2

    if-eqz v2, :cond_8

    move v0, v1

    .line 385
    goto :goto_8
.end method

.method protected isTokenSeparator(C)Z
    .registers 3
    .param p1, "ch"    # C

    .prologue
    .line 336
    const/16 v0, 0x2c

    if-ne p1, v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method protected isWhitespace(C)Z
    .registers 3
    .param p1, "ch"    # C

    .prologue
    .line 355
    const/16 v0, 0x9

    if-eq p1, v0, :cond_a

    invoke-static {p1}, Ljava/lang/Character;->isSpaceChar(C)Z

    move-result v0

    if-eqz v0, :cond_c

    :cond_a
    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public final next()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/NoSuchElementException;,
            Lorg/apache/http/ParseException;
        }
    .end annotation

    .prologue
    .line 130
    invoke-virtual {p0}, Lorg/apache/http/message/BasicTokenIterator;->nextToken()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public nextToken()Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/NoSuchElementException;,
            Lorg/apache/http/ParseException;
        }
    .end annotation

    .prologue
    .line 107
    iget-object v1, p0, Lorg/apache/http/message/BasicTokenIterator;->currentToken:Ljava/lang/String;

    if-nez v1, :cond_c

    .line 108
    new-instance v1, Ljava/util/NoSuchElementException;

    const-string v2, "Iteration already finished."

    invoke-direct {v1, v2}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 111
    :cond_c
    iget-object v0, p0, Lorg/apache/http/message/BasicTokenIterator;->currentToken:Ljava/lang/String;

    .line 113
    .local v0, "result":Ljava/lang/String;
    iget v1, p0, Lorg/apache/http/message/BasicTokenIterator;->searchPos:I

    invoke-virtual {p0, v1}, Lorg/apache/http/message/BasicTokenIterator;->findNext(I)I

    move-result v1

    iput v1, p0, Lorg/apache/http/message/BasicTokenIterator;->searchPos:I

    .line 115
    return-object v0
.end method

.method public final remove()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation

    .prologue
    .line 142
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Removing tokens is not supported."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
