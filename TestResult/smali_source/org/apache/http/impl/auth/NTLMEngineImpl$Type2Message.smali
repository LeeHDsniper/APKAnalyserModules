.class Lorg/apache/http/impl/auth/NTLMEngineImpl$Type2Message;
.super Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;
.source "NTLMEngineImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/http/impl/auth/NTLMEngineImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Type2Message"
.end annotation


# instance fields
.field protected challenge:[B

.field protected flags:I

.field protected target:Ljava/lang/String;

.field protected targetInfo:[B


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 8
    .param p1, "message"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/impl/auth/NTLMEngineException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/16 v4, 0x14

    .line 1076
    const/4 v2, 0x2

    invoke-direct {p0, p1, v2}, Lorg/apache/http/impl/auth/NTLMEngineImpl$NTLMMessage;-><init>(Ljava/lang/String;I)V

    .line 1093
    const/16 v2, 0x8

    new-array v2, v2, [B

    iput-object v2, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type2Message;->challenge:[B

    .line 1094
    iget-object v2, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type2Message;->challenge:[B

    const/16 v3, 0x18

    invoke-virtual {p0, v2, v3}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type2Message;->readBytes([BI)V

    .line 1096
    invoke-virtual {p0, v4}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type2Message;->readULong(I)I

    move-result v2

    iput v2, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type2Message;->flags:I

    .line 1098
    iget v2, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type2Message;->flags:I

    and-int/lit8 v2, v2, 0x1

    if-nez v2, :cond_3f

    .line 1099
    new-instance v2, Lorg/apache/http/impl/auth/NTLMEngineException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "NTLM type 2 message has flags that make no sense: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type2Message;->flags:I

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/http/impl/auth/NTLMEngineException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1104
    :cond_3f
    iput-object v5, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type2Message;->target:Ljava/lang/String;

    .line 1108
    invoke-virtual {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type2Message;->getMessageLength()I

    move-result v2

    if-lt v2, v4, :cond_59

    .line 1109
    const/16 v2, 0xc

    invoke-virtual {p0, v2}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type2Message;->readSecurityBuffer(I)[B

    move-result-object v0

    .line 1110
    .local v0, "bytes":[B
    array-length v2, v0

    if-eqz v2, :cond_59

    .line 1112
    :try_start_50
    new-instance v2, Ljava/lang/String;

    const-string v3, "UnicodeLittleUnmarked"

    invoke-direct {v2, v0, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    iput-object v2, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type2Message;->target:Ljava/lang/String;
    :try_end_59
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_50 .. :try_end_59} :catch_6f

    .line 1120
    .end local v0    # "bytes":[B
    :cond_59
    iput-object v5, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type2Message;->targetInfo:[B

    .line 1122
    invoke-virtual {p0}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type2Message;->getMessageLength()I

    move-result v2

    const/16 v3, 0x30

    if-lt v2, v3, :cond_6e

    .line 1123
    const/16 v2, 0x28

    invoke-virtual {p0, v2}, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type2Message;->readSecurityBuffer(I)[B

    move-result-object v0

    .line 1124
    .restart local v0    # "bytes":[B
    array-length v2, v0

    if-eqz v2, :cond_6e

    .line 1125
    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type2Message;->targetInfo:[B

    .line 1128
    .end local v0    # "bytes":[B
    :cond_6e
    return-void

    .line 1113
    .restart local v0    # "bytes":[B
    :catch_6f
    move-exception v1

    .line 1114
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v2, Lorg/apache/http/impl/auth/NTLMEngineException;

    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Lorg/apache/http/impl/auth/NTLMEngineException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method


# virtual methods
.method getChallenge()[B
    .registers 2

    .prologue
    .line 1132
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type2Message;->challenge:[B

    return-object v0
.end method

.method getFlags()I
    .registers 2

    .prologue
    .line 1147
    iget v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type2Message;->flags:I

    return v0
.end method

.method getTarget()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1137
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type2Message;->target:Ljava/lang/String;

    return-object v0
.end method

.method getTargetInfo()[B
    .registers 2

    .prologue
    .line 1142
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMEngineImpl$Type2Message;->targetInfo:[B

    return-object v0
.end method
