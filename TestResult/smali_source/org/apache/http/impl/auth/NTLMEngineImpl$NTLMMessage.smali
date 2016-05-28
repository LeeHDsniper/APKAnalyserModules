.class Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;
.super Ljava/lang/Object;
.source "NTLMEngineImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/http/impl/auth/NTLMEngineImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "NTLMMessage"
.end annotation


# instance fields
.field private currentOutputPosition:I

.field private messageContents:[B


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 828
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 822
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    .line 825
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->currentOutputPosition:I

    .line 829
    return-void
.end method

.method constructor <init>(Ljava/lang/String;I)V
    .registers 8
    .param p1, "messageBody"    # Ljava/lang/String;
    .param p2, "expectedType"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 832
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 822
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    .line 825
    const/4 v2, 0x0

    iput v2, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->currentOutputPosition:I

    .line 833
    const-string v2, "ASCII"

    invoke-static {p1, v2}, Lorg/apache/http/util/EncodingUtils;->getBytes(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v2

    invoke-static {v2}, Lorg/apache/commons/codec/binary/Base64;->decodeBase64([B)[B

    move-result-object v2

    iput-object v2, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    .line 836
    iget-object v2, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    array-length v2, v2

    # getter for: Lorg/apache/http/impl/auth/NTLMEngineImpl;->SIGNATURE:[B
    invoke-static {}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->access$1000()[B

    move-result-object v3

    array-length v3, v3

    if-ge v2, v3, :cond_27

    .line 837
    new-instance v2, Lorg/apache/http/impl/auth/NTLMEngineException;

    const-string v3, "NTLM message decoding error - packet too short"

    invoke-direct {v2, v3}, Lorg/apache/http/impl/auth/NTLMEngineException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 838
    :cond_27
    const/4 v0, 0x0

    .line 839
    .local v0, "i":I
    :goto_28
    # getter for: Lorg/apache/http/impl/auth/NTLMEngineImpl;->SIGNATURE:[B
    invoke-static {}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->access$1000()[B

    move-result-object v2

    array-length v2, v2

    if-ge v0, v2, :cond_46

    .line 840
    iget-object v2, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    aget-byte v2, v2, v0

    # getter for: Lorg/apache/http/impl/auth/NTLMEngineImpl;->SIGNATURE:[B
    invoke-static {}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->access$1000()[B

    move-result-object v3

    aget-byte v3, v3, v0

    if-eq v2, v3, :cond_43

    .line 841
    new-instance v2, Lorg/apache/http/impl/auth/NTLMEngineException;

    const-string v3, "NTLM message expected - instead got unrecognized bytes"

    invoke-direct {v2, v3}, Lorg/apache/http/impl/auth/NTLMEngineException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 843
    :cond_43
    add-int/lit8 v0, v0, 0x1

    goto :goto_28

    .line 847
    :cond_46
    # getter for: Lorg/apache/http/impl/auth/NTLMEngineImpl;->SIGNATURE:[B
    invoke-static {}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->access$1000()[B

    move-result-object v2

    array-length v2, v2

    invoke-virtual {p0, v2}, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->readULong(I)I

    move-result v1

    .line 848
    .local v1, "type":I
    if-eq v1, p2, :cond_7c

    .line 849
    new-instance v2, Lorg/apache/http/impl/auth/NTLMEngineException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "NTLM type "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " message expected - instead got type "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/http/impl/auth/NTLMEngineException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 852
    :cond_7c
    iget-object v2, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    array-length v2, v2

    iput v2, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->currentOutputPosition:I

    .line 853
    return-void
.end method


# virtual methods
.method protected addByte(B)V
    .registers 4
    .param p1, "b"    # B

    .prologue
    .line 919
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    iget v1, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->currentOutputPosition:I

    aput-byte p1, v0, v1

    .line 920
    iget v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->currentOutputPosition:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->currentOutputPosition:I

    .line 921
    return-void
.end method

.method protected addBytes([B)V
    .registers 8
    .param p1, "bytes"    # [B

    .prologue
    .line 930
    if-nez p1, :cond_3

    .line 937
    :cond_2
    return-void

    .line 933
    :cond_3
    move-object v0, p1

    .local v0, "arr$":[B
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_6
    if-ge v2, v3, :cond_2

    aget-byte v1, v0, v2

    .line 934
    .local v1, "b":B
    iget-object v4, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    iget v5, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->currentOutputPosition:I

    aput-byte v1, v4, v5

    .line 935
    iget v4, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->currentOutputPosition:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->currentOutputPosition:I

    .line 933
    add-int/lit8 v2, v2, 0x1

    goto :goto_6
.end method

.method protected addULong(I)V
    .registers 3
    .param p1, "value"    # I

    .prologue
    .line 947
    and-int/lit16 v0, p1, 0xff

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->addByte(B)V

    .line 948
    shr-int/lit8 v0, p1, 0x8

    and-int/lit16 v0, v0, 0xff

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->addByte(B)V

    .line 949
    shr-int/lit8 v0, p1, 0x10

    and-int/lit16 v0, v0, 0xff

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->addByte(B)V

    .line 950
    shr-int/lit8 v0, p1, 0x18

    and-int/lit16 v0, v0, 0xff

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->addByte(B)V

    .line 951
    return-void
.end method

.method protected addUShort(I)V
    .registers 3
    .param p1, "value"    # I

    .prologue
    .line 941
    and-int/lit16 v0, p1, 0xff

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->addByte(B)V

    .line 942
    shr-int/lit8 v0, p1, 0x8

    and-int/lit16 v0, v0, 0xff

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->addByte(B)V

    .line 943
    return-void
.end method

.method protected getMessageLength()I
    .registers 2

    .prologue
    .line 865
    iget v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->currentOutputPosition:I

    return v0
.end method

.method protected getPreambleLength()I
    .registers 2

    .prologue
    .line 860
    # getter for: Lorg/apache/http/impl/auth/NTLMEngineImpl;->SIGNATURE:[B
    invoke-static {}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->access$1000()[B

    move-result-object v0

    array-length v0, v0

    add-int/lit8 v0, v0, 0x4

    return v0
.end method

.method getResponse()Ljava/lang/String;
    .registers 6

    .prologue
    const/4 v4, 0x0

    .line 961
    iget-object v2, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    array-length v2, v2

    iget v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->currentOutputPosition:I

    if-le v2, v3, :cond_1d

    .line 962
    iget v2, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->currentOutputPosition:I

    new-array v1, v2, [B

    .line 963
    .local v1, "tmp":[B
    iget-object v2, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    iget v3, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->currentOutputPosition:I

    invoke-static {v2, v4, v1, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 964
    move-object v0, v1

    .line 968
    .end local v1    # "tmp":[B
    .local v0, "resp":[B
    :goto_14
    invoke-static {v0}, Lorg/apache/commons/codec/binary/Base64;->encodeBase64([B)[B

    move-result-object v2

    invoke-static {v2}, Lorg/apache/http/util/EncodingUtils;->getAsciiString([B)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 966
    .end local v0    # "resp":[B
    :cond_1d
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    .restart local v0    # "resp":[B
    goto :goto_14
.end method

.method protected prepareResponse(II)V
    .registers 4
    .param p1, "maxlength"    # I
    .param p2, "messageType"    # I

    .prologue
    .line 906
    new-array v0, p1, [B

    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    .line 907
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->currentOutputPosition:I

    .line 908
    # getter for: Lorg/apache/http/impl/auth/NTLMEngineImpl;->SIGNATURE:[B
    invoke-static {}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->access$1000()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->addBytes([B)V

    .line 909
    invoke-virtual {p0, p2}, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->addULong(I)V

    .line 910
    return-void
.end method

.method protected readByte(I)B
    .registers 4
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 870
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    array-length v0, v0

    add-int/lit8 v1, p1, 0x1

    if-ge v0, v1, :cond_f

    .line 871
    new-instance v0, Lorg/apache/http/impl/auth/NTLMEngineException;

    const-string v1, "NTLM: Message too short"

    invoke-direct {v0, v1}, Lorg/apache/http/impl/auth/NTLMEngineException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 872
    :cond_f
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    aget-byte v0, v0, p1

    return v0
.end method

.method protected readBytes([BI)V
    .registers 6
    .param p1, "buffer"    # [B
    .param p2, "position"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 877
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    array-length v0, v0

    array-length v1, p1

    add-int/2addr v1, p2

    if-ge v0, v1, :cond_f

    .line 878
    new-instance v0, Lorg/apache/http/impl/auth/NTLMEngineException;

    const-string v1, "NTLM: Message too short"

    invoke-direct {v0, v1}, Lorg/apache/http/impl/auth/NTLMEngineException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 879
    :cond_f
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    const/4 v1, 0x0

    array-length v2, p1

    invoke-static {v0, p2, p1, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 880
    return-void
.end method

.method protected readSecurityBuffer(I)[B
    .registers 3
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 894
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    # invokes: Lorg/apache/http/impl/auth/NTLMEngineImpl;->readSecurityBuffer([BI)[B
    invoke-static {v0, p1}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->access$1300([BI)[B

    move-result-object v0

    return-object v0
.end method

.method protected readULong(I)I
    .registers 3
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 889
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    # invokes: Lorg/apache/http/impl/auth/NTLMEngineImpl;->readULong([BI)I
    invoke-static {v0, p1}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->access$1200([BI)I

    move-result v0

    return v0
.end method

.method protected readUShort(I)I
    .registers 3
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    .line 884
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;->messageContents:[B

    # invokes: Lorg/apache/http/impl/auth/NTLMEngineImpl;->readUShort([BI)I
    invoke-static {v0, p1}, Lorg/apache/http/impl/auth/NTLMEngineImpl;->access$1100([BI)I

    move-result v0

    return v0
.end method
