.class public Lorg/apache/http/message/BufferedHeader;
.super Ljava/lang/Object;
.source "BufferedHeader.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Ljava/lang/Cloneable;
.implements Lorg/apache/http/FormattedHeader;


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x266b2a09650b7be8L


# instance fields
.field private final buffer:Lorg/apache/http/util/CharArrayBuffer;

.field private final name:Ljava/lang/String;

.field private final valuePos:I


# direct methods
.method public constructor <init>(Lorg/apache/http/util/CharArrayBuffer;)V
    .registers 7
    .param p1, "buffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/ParseException;
        }
    .end annotation

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    const-string v2, "Char array buffer"

    invoke-static {p1, v2}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 80
    const/16 v2, 0x3a

    invoke-virtual {p1, v2}, Lorg/apache/http/util/CharArrayBuffer;->indexOf(I)I

    move-result v0

    .line 81
    .local v0, "colon":I
    const/4 v2, -0x1

    if-ne v0, v2, :cond_2e

    .line 82
    new-instance v2, Lorg/apache/http/ParseException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid header: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lorg/apache/http/util/CharArrayBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/http/ParseException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 85
    :cond_2e
    const/4 v2, 0x0

    invoke-virtual {p1, v2, v0}, Lorg/apache/http/util/CharArrayBuffer;->substringTrimmed(II)Ljava/lang/String;

    move-result-object v1

    .line 86
    .local v1, "s":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_56

    .line 87
    new-instance v2, Lorg/apache/http/ParseException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid header: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lorg/apache/http/util/CharArrayBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/http/ParseException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 90
    :cond_56
    iput-object p1, p0, Lorg/apache/http/message/BufferedHeader;->buffer:Lorg/apache/http/util/CharArrayBuffer;

    .line 91
    iput-object v1, p0, Lorg/apache/http/message/BufferedHeader;->name:Ljava/lang/String;

    .line 92
    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lorg/apache/http/message/BufferedHeader;->valuePos:I

    .line 93
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 127
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getBuffer()Lorg/apache/http/util/CharArrayBuffer;
    .registers 2

    .prologue
    .line 115
    iget-object v0, p0, Lorg/apache/http/message/BufferedHeader;->buffer:Lorg/apache/http/util/CharArrayBuffer;

    return-object v0
.end method

.method public getElements()[Lorg/apache/http/HeaderElement;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/ParseException;
        }
    .end annotation

    .prologue
    .line 105
    new-instance v0, Lorg/apache/http/message/ParserCursor;

    const/4 v1, 0x0

    iget-object v2, p0, Lorg/apache/http/message/BufferedHeader;->buffer:Lorg/apache/http/util/CharArrayBuffer;

    invoke-virtual {v2}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v2

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/ParserCursor;-><init>(II)V

    .line 106
    .local v0, "cursor":Lorg/apache/http/message/ParserCursor;
    iget v1, p0, Lorg/apache/http/message/BufferedHeader;->valuePos:I

    invoke-virtual {v0, v1}, Lorg/apache/http/message/ParserCursor;->updatePos(I)V

    .line 107
    sget-object v1, Lorg/apache/http/message/BasicHeaderValueParser;->INSTANCE:Lorg/apache/http/message/BasicHeaderValueParser;

    iget-object v2, p0, Lorg/apache/http/message/BufferedHeader;->buffer:Lorg/apache/http/util/CharArrayBuffer;

    invoke-virtual {v1, v2, v0}, Lorg/apache/http/message/BasicHeaderValueParser;->parseElements(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/message/ParserCursor;)[Lorg/apache/http/HeaderElement;

    move-result-object v1

    return-object v1
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 97
    iget-object v0, p0, Lorg/apache/http/message/BufferedHeader;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .registers 4

    .prologue
    .line 101
    iget-object v0, p0, Lorg/apache/http/message/BufferedHeader;->buffer:Lorg/apache/http/util/CharArrayBuffer;

    iget v1, p0, Lorg/apache/http/message/BufferedHeader;->valuePos:I

    iget-object v2, p0, Lorg/apache/http/message/BufferedHeader;->buffer:Lorg/apache/http/util/CharArrayBuffer;

    invoke-virtual {v2}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/util/CharArrayBuffer;->substringTrimmed(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getValuePos()I
    .registers 2

    .prologue
    .line 111
    iget v0, p0, Lorg/apache/http/message/BufferedHeader;->valuePos:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 120
    iget-object v0, p0, Lorg/apache/http/message/BufferedHeader;->buffer:Lorg/apache/http/util/CharArrayBuffer;

    invoke-virtual {v0}, Lorg/apache/http/util/CharArrayBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
