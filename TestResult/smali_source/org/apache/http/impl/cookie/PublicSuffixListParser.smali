.class public Lorg/apache/http/impl/cookie/PublicSuffixListParser;
.super Ljava/lang/Object;
.source "PublicSuffixListParser.java"


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field private static final MAX_LINE_LEN:I = 0x100


# instance fields
.field private final filter:Lorg/apache/http/impl/cookie/PublicSuffixFilter;


# direct methods
.method constructor <init>(Lorg/apache/http/impl/cookie/PublicSuffixFilter;)V
    .registers 2
    .param p1, "filter"    # Lorg/apache/http/impl/cookie/PublicSuffixFilter;

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Lorg/apache/http/impl/cookie/PublicSuffixListParser;->filter:Lorg/apache/http/impl/cookie/PublicSuffixFilter;

    .line 50
    return-void
.end method

.method private readLine(Ljava/io/Reader;Ljava/lang/StringBuilder;)Z
    .registers 10
    .param p1, "r"    # Ljava/io/Reader;
    .param p2, "sb"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v6, -0x1

    .line 105
    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 107
    const/4 v2, 0x0

    .line 108
    .local v2, "hitWhitespace":Z
    :cond_6
    invoke-virtual {p1}, Ljava/io/Reader;->read()I

    move-result v0

    .local v0, "b":I
    if-eq v0, v6, :cond_11

    .line 109
    int-to-char v1, v0

    .line 110
    .local v1, "c":C
    const/16 v4, 0xa

    if-ne v1, v4, :cond_15

    .line 125
    .end local v1    # "c":C
    :cond_11
    if-eq v0, v6, :cond_14

    const/4 v3, 0x1

    :cond_14
    return v3

    .line 114
    .restart local v1    # "c":C
    :cond_15
    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v4

    if-eqz v4, :cond_1c

    .line 115
    const/4 v2, 0x1

    .line 117
    :cond_1c
    if-nez v2, :cond_21

    .line 118
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 120
    :cond_21
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    const/16 v5, 0x100

    if-le v4, v5, :cond_6

    .line 122
    new-instance v3, Ljava/io/IOException;

    const-string v4, "Line too long"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
.end method


# virtual methods
.method public parse(Ljava/io/Reader;)V
    .registers 11
    .param p1, "list"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    .line 61
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 62
    .local v5, "rules":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 63
    .local v0, "exceptions":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    new-instance v4, Ljava/io/BufferedReader;

    invoke-direct {v4, p1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 64
    .local v4, "r":Ljava/io/BufferedReader;
    new-instance v6, Ljava/lang/StringBuilder;

    const/16 v7, 0x100

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 65
    .local v6, "sb":Ljava/lang/StringBuilder;
    const/4 v3, 0x1

    .line 66
    .local v3, "more":Z
    :cond_18
    :goto_18
    if-eqz v3, :cond_52

    .line 67
    invoke-direct {p0, v4, v6}, Lorg/apache/http/impl/cookie/PublicSuffixListParser;->readLine(Ljava/io/Reader;Ljava/lang/StringBuilder;)Z

    move-result v3

    .line 68
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 69
    .local v2, "line":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v7

    if-eqz v7, :cond_18

    .line 72
    const-string v7, "//"

    invoke-virtual {v2, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_18

    .line 76
    const-string v7, "."

    invoke-virtual {v2, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3c

    .line 78
    invoke-virtual {v2, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 81
    :cond_3c
    const-string v7, "!"

    invoke-virtual {v2, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    .line 82
    .local v1, "isException":Z
    if-eqz v1, :cond_48

    .line 83
    invoke-virtual {v2, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 86
    :cond_48
    if-eqz v1, :cond_4e

    .line 87
    invoke-interface {v0, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_18

    .line 89
    :cond_4e
    invoke-interface {v5, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_18

    .line 93
    .end local v1    # "isException":Z
    .end local v2    # "line":Ljava/lang/String;
    :cond_52
    iget-object v7, p0, Lorg/apache/http/impl/cookie/PublicSuffixListParser;->filter:Lorg/apache/http/impl/cookie/PublicSuffixFilter;

    invoke-virtual {v7, v5}, Lorg/apache/http/impl/cookie/PublicSuffixFilter;->setPublicSuffixes(Ljava/util/Collection;)V

    .line 94
    iget-object v7, p0, Lorg/apache/http/impl/cookie/PublicSuffixListParser;->filter:Lorg/apache/http/impl/cookie/PublicSuffixFilter;

    invoke-virtual {v7, v0}, Lorg/apache/http/impl/cookie/PublicSuffixFilter;->setExceptions(Ljava/util/Collection;)V

    .line 95
    return-void
.end method
