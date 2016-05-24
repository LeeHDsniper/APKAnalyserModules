.class public Lorg/apache/http/impl/cookie/NetscapeDraftHeaderParser;
.super Ljava/lang/Object;
.source "NetscapeDraftHeaderParser.java"


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field public static final DEFAULT:Lorg/apache/http/impl/cookie/NetscapeDraftHeaderParser;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 51
    new-instance v0, Lorg/apache/http/impl/cookie/NetscapeDraftHeaderParser;

    invoke-direct {v0}, Lorg/apache/http/impl/cookie/NetscapeDraftHeaderParser;-><init>()V

    sput-object v0, Lorg/apache/http/impl/cookie/NetscapeDraftHeaderParser;->DEFAULT:Lorg/apache/http/impl/cookie/NetscapeDraftHeaderParser;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    return-void
.end method

.method private parseNameValuePair(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/message/ParserCursor;)Lorg/apache/http/NameValuePair;
    .registers 14
    .param p1, "buffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p2, "cursor"    # Lorg/apache/http/message/ParserCursor;

    .prologue
    const/16 v10, 0x3b

    .line 75
    const/4 v7, 0x0

    .line 77
    .local v7, "terminated":Z
    invoke-virtual {p2}, Lorg/apache/http/message/ParserCursor;->getPos()I

    move-result v6

    .line 78
    .local v6, "pos":I
    invoke-virtual {p2}, Lorg/apache/http/message/ParserCursor;->getPos()I

    move-result v3

    .line 79
    .local v3, "indexFrom":I
    invoke-virtual {p2}, Lorg/apache/http/message/ParserCursor;->getUpperBound()I

    move-result v4

    .line 82
    .local v4, "indexTo":I
    const/4 v5, 0x0

    .line 83
    .local v5, "name":Ljava/lang/String;
    :goto_10
    if-ge v6, v4, :cond_1a

    .line 84
    invoke-virtual {p1, v6}, Lorg/apache/http/util/CharArrayBuffer;->charAt(I)C

    move-result v0

    .line 85
    .local v0, "ch":C
    const/16 v9, 0x3d

    if-ne v0, v9, :cond_2d

    .line 95
    .end local v0    # "ch":C
    :cond_1a
    :goto_1a
    if-ne v6, v4, :cond_34

    .line 96
    const/4 v7, 0x1

    .line 97
    invoke-virtual {p1, v3, v4}, Lorg/apache/http/util/CharArrayBuffer;->substringTrimmed(II)Ljava/lang/String;

    move-result-object v5

    .line 103
    :goto_21
    if-eqz v7, :cond_3b

    .line 104
    invoke-virtual {p2, v6}, Lorg/apache/http/message/ParserCursor;->updatePos(I)V

    .line 105
    new-instance v9, Lorg/apache/http/message/BasicNameValuePair;

    const/4 v10, 0x0

    invoke-direct {v9, v5, v10}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    :goto_2c
    return-object v9

    .line 88
    .restart local v0    # "ch":C
    :cond_2d
    if-ne v0, v10, :cond_31

    .line 89
    const/4 v7, 0x1

    .line 90
    goto :goto_1a

    .line 92
    :cond_31
    add-int/lit8 v6, v6, 0x1

    .line 93
    goto :goto_10

    .line 99
    .end local v0    # "ch":C
    :cond_34
    invoke-virtual {p1, v3, v6}, Lorg/apache/http/util/CharArrayBuffer;->substringTrimmed(II)Ljava/lang/String;

    move-result-object v5

    .line 100
    add-int/lit8 v6, v6, 0x1

    goto :goto_21

    .line 109
    :cond_3b
    const/4 v8, 0x0

    .line 110
    .local v8, "value":Ljava/lang/String;
    move v1, v6

    .line 112
    .local v1, "i1":I
    :goto_3d
    if-ge v6, v4, :cond_46

    .line 113
    invoke-virtual {p1, v6}, Lorg/apache/http/util/CharArrayBuffer;->charAt(I)C

    move-result v0

    .line 114
    .restart local v0    # "ch":C
    if-ne v0, v10, :cond_56

    .line 115
    const/4 v7, 0x1

    .line 121
    .end local v0    # "ch":C
    :cond_46
    move v2, v6

    .line 123
    .local v2, "i2":I
    :goto_47
    if-ge v1, v2, :cond_59

    invoke-virtual {p1, v1}, Lorg/apache/http/util/CharArrayBuffer;->charAt(I)C

    move-result v9

    invoke-static {v9}, Lorg/apache/http/protocol/HTTP;->isWhitespace(C)Z

    move-result v9

    if-eqz v9, :cond_59

    .line 124
    add-int/lit8 v1, v1, 0x1

    goto :goto_47

    .line 118
    .end local v2    # "i2":I
    .restart local v0    # "ch":C
    :cond_56
    add-int/lit8 v6, v6, 0x1

    .line 119
    goto :goto_3d

    .line 127
    .end local v0    # "ch":C
    .restart local v2    # "i2":I
    :cond_59
    :goto_59
    if-le v2, v1, :cond_6a

    add-int/lit8 v9, v2, -0x1

    invoke-virtual {p1, v9}, Lorg/apache/http/util/CharArrayBuffer;->charAt(I)C

    move-result v9

    invoke-static {v9}, Lorg/apache/http/protocol/HTTP;->isWhitespace(C)Z

    move-result v9

    if-eqz v9, :cond_6a

    .line 128
    add-int/lit8 v2, v2, -0x1

    goto :goto_59

    .line 130
    :cond_6a
    invoke-virtual {p1, v1, v2}, Lorg/apache/http/util/CharArrayBuffer;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 131
    if-eqz v7, :cond_72

    .line 132
    add-int/lit8 v6, v6, 0x1

    .line 134
    :cond_72
    invoke-virtual {p2, v6}, Lorg/apache/http/message/ParserCursor;->updatePos(I)V

    .line 135
    new-instance v9, Lorg/apache/http/message/BasicNameValuePair;

    invoke-direct {v9, v5, v8}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2c
.end method


# virtual methods
.method public parseHeader(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/message/ParserCursor;)Lorg/apache/http/HeaderElement;
    .registers 10
    .param p1, "buffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p2, "cursor"    # Lorg/apache/http/message/ParserCursor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/ParseException;
        }
    .end annotation

    .prologue
    .line 60
    const-string v3, "Char array buffer"

    invoke-static {p1, v3}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 61
    const-string v3, "Parser cursor"

    invoke-static {p2, v3}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 62
    invoke-direct {p0, p1, p2}, Lorg/apache/http/impl/cookie/NetscapeDraftHeaderParser;->parseNameValuePair(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/message/ParserCursor;)Lorg/apache/http/NameValuePair;

    move-result-object v0

    .line 63
    .local v0, "nvp":Lorg/apache/http/NameValuePair;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 64
    .local v2, "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    :goto_13
    invoke-virtual {p2}, Lorg/apache/http/message/ParserCursor;->atEnd()Z

    move-result v3

    if-nez v3, :cond_21

    .line 65
    invoke-direct {p0, p1, p2}, Lorg/apache/http/impl/cookie/NetscapeDraftHeaderParser;->parseNameValuePair(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/message/ParserCursor;)Lorg/apache/http/NameValuePair;

    move-result-object v1

    .line 66
    .local v1, "param":Lorg/apache/http/NameValuePair;
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_13

    .line 68
    .end local v1    # "param":Lorg/apache/http/NameValuePair;
    :cond_21
    new-instance v4, Lorg/apache/http/message/BasicHeaderElement;

    invoke-interface {v0}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0}, Lorg/apache/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Lorg/apache/http/NameValuePair;

    invoke-interface {v2, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lorg/apache/http/NameValuePair;

    invoke-direct {v4, v5, v6, v3}, Lorg/apache/http/message/BasicHeaderElement;-><init>(Ljava/lang/String;Ljava/lang/String;[Lorg/apache/http/NameValuePair;)V

    return-object v4
.end method
