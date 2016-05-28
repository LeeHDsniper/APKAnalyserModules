.class final Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;
.super Ljava/lang/Object;
.source "Http20Draft14.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/spdy/Http20Draft14;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "FrameLogger"
.end annotation


# static fields
.field private static final BINARY:[Ljava/lang/String;

.field private static final FLAGS:[Ljava/lang/String;

.field private static final TYPES:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 16

    .prologue
    .line 705
    const/16 v11, 0xa

    new-array v11, v11, [Ljava/lang/String;

    const/4 v12, 0x0

    const-string v13, "DATA"

    aput-object v13, v11, v12

    const/4 v12, 0x1

    const-string v13, "HEADERS"

    aput-object v13, v11, v12

    const/4 v12, 0x2

    const-string v13, "PRIORITY"

    aput-object v13, v11, v12

    const/4 v12, 0x3

    const-string v13, "RST_STREAM"

    aput-object v13, v11, v12

    const/4 v12, 0x4

    const-string v13, "SETTINGS"

    aput-object v13, v11, v12

    const/4 v12, 0x5

    const-string v13, "PUSH_PROMISE"

    aput-object v13, v11, v12

    const/4 v12, 0x6

    const-string v13, "PING"

    aput-object v13, v11, v12

    const/4 v12, 0x7

    const-string v13, "GOAWAY"

    aput-object v13, v11, v12

    const/16 v12, 0x8

    const-string v13, "WINDOW_UPDATE"

    aput-object v13, v11, v12

    const/16 v12, 0x9

    const-string v13, "CONTINUATION"

    aput-object v13, v11, v12

    sput-object v11, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;->TYPES:[Ljava/lang/String;

    .line 722
    const/16 v11, 0x40

    new-array v11, v11, [Ljava/lang/String;

    sput-object v11, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;->FLAGS:[Ljava/lang/String;

    .line 723
    const/16 v11, 0x100

    new-array v11, v11, [Ljava/lang/String;

    sput-object v11, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;->BINARY:[Ljava/lang/String;

    .line 726
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_47
    sget-object v11, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;->BINARY:[Ljava/lang/String;

    array-length v11, v11

    if-ge v4, v11, :cond_6b

    .line 727
    sget-object v11, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;->BINARY:[Ljava/lang/String;

    const-string v12, "%8s"

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->toBinaryString(I)Ljava/lang/String;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-static {v12, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    const/16 v13, 0x20

    const/16 v14, 0x30

    invoke-virtual {v12, v13, v14}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v12

    aput-object v12, v11, v4

    .line 726
    add-int/lit8 v4, v4, 0x1

    goto :goto_47

    .line 730
    :cond_6b
    sget-object v11, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;->FLAGS:[Ljava/lang/String;

    const/4 v12, 0x0

    const-string v13, ""

    aput-object v13, v11, v12

    .line 731
    sget-object v11, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;->FLAGS:[Ljava/lang/String;

    const/4 v12, 0x1

    const-string v13, "END_STREAM"

    aput-object v13, v11, v12

    .line 733
    const/4 v11, 0x1

    new-array v10, v11, [I

    const/4 v11, 0x0

    const/4 v12, 0x1

    aput v12, v10, v11

    .line 735
    .local v10, "prefixFlags":[I
    sget-object v11, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;->FLAGS:[Ljava/lang/String;

    const/16 v12, 0x8

    const-string v13, "PADDED"

    aput-object v13, v11, v12

    .line 736
    move-object v0, v10

    .local v0, "arr$":[I
    array-length v7, v0

    .local v7, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_8b
    if-ge v5, v7, :cond_af

    aget v9, v0, v5

    .line 737
    .local v9, "prefixFlag":I
    sget-object v11, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;->FLAGS:[Ljava/lang/String;

    or-int/lit8 v12, v9, 0x8

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v14, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;->FLAGS:[Ljava/lang/String;

    aget-object v14, v14, v9

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "|PADDED"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    .line 736
    add-int/lit8 v5, v5, 0x1

    goto :goto_8b

    .line 740
    .end local v9    # "prefixFlag":I
    :cond_af
    sget-object v11, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;->FLAGS:[Ljava/lang/String;

    const/4 v12, 0x4

    const-string v13, "END_HEADERS"

    aput-object v13, v11, v12

    .line 741
    sget-object v11, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;->FLAGS:[Ljava/lang/String;

    const/16 v12, 0x20

    const-string v13, "PRIORITY"

    aput-object v13, v11, v12

    .line 742
    sget-object v11, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;->FLAGS:[Ljava/lang/String;

    const/16 v12, 0x24

    const-string v13, "END_HEADERS|PRIORITY"

    aput-object v13, v11, v12

    .line 743
    const/4 v11, 0x3

    new-array v3, v11, [I

    fill-array-data v3, :array_14c

    .line 746
    .local v3, "frameFlags":[I
    move-object v0, v3

    array-length v7, v0

    const/4 v5, 0x0

    move v6, v5

    .end local v0    # "arr$":[I
    .end local v5    # "i$":I
    .end local v7    # "len$":I
    .local v6, "i$":I
    :goto_d0
    if-ge v6, v7, :cond_134

    aget v2, v0, v6

    .line 747
    .local v2, "frameFlag":I
    move-object v1, v10

    .local v1, "arr$":[I
    array-length v8, v1

    .local v8, "len$":I
    const/4 v5, 0x0

    .end local v6    # "i$":I
    .restart local v5    # "i$":I
    :goto_d7
    if-ge v5, v8, :cond_130

    aget v9, v1, v5

    .line 748
    .restart local v9    # "prefixFlag":I
    sget-object v11, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;->FLAGS:[Ljava/lang/String;

    or-int v12, v9, v2

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v14, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;->FLAGS:[Ljava/lang/String;

    aget-object v14, v14, v9

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const/16 v14, 0x7c

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v13

    sget-object v14, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;->FLAGS:[Ljava/lang/String;

    aget-object v14, v14, v2

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    .line 749
    sget-object v11, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;->FLAGS:[Ljava/lang/String;

    or-int v12, v9, v2

    or-int/lit8 v12, v12, 0x8

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v14, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;->FLAGS:[Ljava/lang/String;

    aget-object v14, v14, v9

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const/16 v14, 0x7c

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v13

    sget-object v14, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;->FLAGS:[Ljava/lang/String;

    aget-object v14, v14, v2

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "|PADDED"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    .line 747
    add-int/lit8 v5, v5, 0x1

    goto :goto_d7

    .line 746
    .end local v9    # "prefixFlag":I
    :cond_130
    add-int/lit8 v5, v6, 0x1

    move v6, v5

    .end local v5    # "i$":I
    .restart local v6    # "i$":I
    goto :goto_d0

    .line 754
    .end local v1    # "arr$":[I
    .end local v2    # "frameFlag":I
    .end local v8    # "len$":I
    :cond_134
    const/4 v4, 0x0

    :goto_135
    sget-object v11, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;->FLAGS:[Ljava/lang/String;

    array-length v11, v11

    if-ge v4, v11, :cond_14b

    .line 755
    sget-object v11, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;->FLAGS:[Ljava/lang/String;

    aget-object v11, v11, v4

    if-nez v11, :cond_148

    sget-object v11, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;->FLAGS:[Ljava/lang/String;

    sget-object v12, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;->BINARY:[Ljava/lang/String;

    aget-object v12, v12, v4

    aput-object v12, v11, v4

    .line 754
    :cond_148
    add-int/lit8 v4, v4, 0x1

    goto :goto_135

    .line 757
    :cond_14b
    return-void

    .line 743
    :array_14c
    .array-data 4
        0x4
        0x20
        0x24
    .end array-data
.end method

.method static formatFlags(BB)Ljava/lang/String;
    .registers 5
    .param p0, "type"    # B
    .param p1, "flags"    # B

    .prologue
    .line 683
    if-nez p1, :cond_5

    const-string v1, ""

    .line 701
    :goto_4
    return-object v1

    .line 684
    :cond_5
    packed-switch p0, :pswitch_data_48

    .line 694
    :pswitch_8
    sget-object v1, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;->FLAGS:[Ljava/lang/String;

    array-length v1, v1

    if-ge p1, v1, :cond_31

    sget-object v1, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;->FLAGS:[Ljava/lang/String;

    aget-object v0, v1, p1

    .line 696
    .local v0, "result":Ljava/lang/String;
    :goto_11
    const/4 v1, 0x5

    if-ne p0, v1, :cond_36

    and-int/lit8 v1, p1, 0x4

    if-eqz v1, :cond_36

    .line 697
    const-string v1, "HEADERS"

    const-string v2, "PUSH_PROMISE"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    goto :goto_4

    .line 687
    .end local v0    # "result":Ljava/lang/String;
    :pswitch_21
    const/4 v1, 0x1

    if-ne p1, v1, :cond_27

    const-string v1, "ACK"

    goto :goto_4

    :cond_27
    sget-object v1, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;->BINARY:[Ljava/lang/String;

    aget-object v1, v1, p1

    goto :goto_4

    .line 692
    :pswitch_2c
    sget-object v1, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;->BINARY:[Ljava/lang/String;

    aget-object v1, v1, p1

    goto :goto_4

    .line 694
    :cond_31
    sget-object v1, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;->BINARY:[Ljava/lang/String;

    aget-object v0, v1, p1

    goto :goto_11

    .line 698
    .restart local v0    # "result":Ljava/lang/String;
    :cond_36
    if-nez p0, :cond_45

    and-int/lit8 v1, p1, 0x20

    if-eqz v1, :cond_45

    .line 699
    const-string v1, "PRIORITY"

    const-string v2, "COMPRESSED"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    goto :goto_4

    :cond_45
    move-object v1, v0

    .line 701
    goto :goto_4

    .line 684
    nop

    :pswitch_data_48
    .packed-switch 0x2
        :pswitch_2c
        :pswitch_2c
        :pswitch_21
        :pswitch_8
        :pswitch_21
        :pswitch_2c
        :pswitch_2c
    .end packed-switch
.end method

.method static formatHeader(ZIIBB)Ljava/lang/String;
    .registers 12
    .param p0, "inbound"    # Z
    .param p1, "streamId"    # I
    .param p2, "length"    # I
    .param p3, "type"    # B
    .param p4, "flags"    # B

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 671
    sget-object v2, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;->TYPES:[Ljava/lang/String;

    array-length v2, v2

    if-ge p3, v2, :cond_32

    sget-object v2, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;->TYPES:[Ljava/lang/String;

    aget-object v1, v2, p3

    .line 672
    .local v1, "formattedType":Ljava/lang/String;
    :goto_b
    invoke-static {p3, p4}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;->formatFlags(BB)Ljava/lang/String;

    move-result-object v0

    .line 673
    .local v0, "formattedFlags":Ljava/lang/String;
    const-string v3, "%s 0x%08x %5d %-13s %s"

    const/4 v2, 0x5

    new-array v4, v2, [Ljava/lang/Object;

    if-eqz p0, :cond_41

    const-string v2, "<<"

    :goto_18
    aput-object v2, v4, v5

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v4, v6

    const/4 v2, 0x2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v2

    const/4 v2, 0x3

    aput-object v1, v4, v2

    const/4 v2, 0x4

    aput-object v0, v4, v2

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 671
    .end local v0    # "formattedFlags":Ljava/lang/String;
    .end local v1    # "formattedType":Ljava/lang/String;
    :cond_32
    const-string v2, "0x%02x"

    new-array v3, v6, [Ljava/lang/Object;

    invoke-static {p3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_b

    .line 673
    .restart local v0    # "formattedFlags":Ljava/lang/String;
    .restart local v1    # "formattedType":Ljava/lang/String;
    :cond_41
    const-string v2, ">>"

    goto :goto_18
.end method
